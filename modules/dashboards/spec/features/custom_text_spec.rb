#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

require_relative '../support/pages/dashboard'

describe 'Project description widget on dashboard', type: :feature, js: true do
  let!(:project) do
    FactoryBot.create :project
  end

  let(:permissions) do
    %i[view_dashboards
       manage_dashboards]
  end

  let(:role) do
    FactoryBot.create(:role, permissions: permissions)
  end

  let(:user) do
    FactoryBot.create(:user, member_in_project: project, member_with_permissions: permissions)
  end
  let(:dashboard_page) do
    Pages::Dashboard.new(project)
  end

  before do
    login_as user

    dashboard_page.visit!
  end

  it 'can add the widget and see the description in it' do
    dashboard_page.add_column(3, before_or_after: :before)

    sleep(0.1)

    dashboard_page.add_widget(2, 3, "Custom text")

    sleep(0.1)

    # As the user lacks the manage_public_queries and save_queries permission, no other widget is present
    custom_text_widget = Components::Grids::GridArea.new('.grid--area.-widgeted:nth-of-type(1)')

    custom_text_widget.expect_to_span(2, 3, 5, 5)
    custom_text_widget.resize_to(6, 5)

    custom_text_widget.expect_to_span(2, 3, 7, 6)

    within custom_text_widget.area do
      find('.inplace-editing--trigger-container').click

      field = WorkPackageEditorField.new(page, 'description', selector: '.wp-inline-edit--active-field')

      field.set_value('My own little text')
      field.save!

      expect(page)
        .to have_selector('.wp-edit-field--display-field', text: 'My own little text')

      find('.inplace-editing--trigger-container').click

      field.set_value('My new text')
      field.cancel_by_click

      expect(page)
        .to have_selector('.wp-edit-field--display-field', text: 'My own little text')
    end
  end
end
