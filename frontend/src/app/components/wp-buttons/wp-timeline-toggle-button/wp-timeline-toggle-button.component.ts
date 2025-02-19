// -- copyright
// OpenProject is a project management system.
// Copyright (C) 2012-2015 the OpenProject Foundation (OPF)
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License version 3.
//
// OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
// Copyright (C) 2006-2013 Jean-Philippe Lang
// Copyright (C) 2010-2013 the ChiliProject Team
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
//
// See doc/COPYRIGHT.rdoc for more details.
// ++

import {WorkPackageTableTimelineService} from '../../wp-fast-table/state/wp-table-timeline.service';
import {AbstractWorkPackageButtonComponent, ButtonControllerText} from '../wp-buttons.module';
import {ChangeDetectionStrategy, ChangeDetectorRef, Component, OnDestroy, OnInit} from '@angular/core';
import {I18nService} from 'core-app/modules/common/i18n/i18n.service';
import {TimelineZoomLevel} from 'core-app/modules/hal/resources/query-resource';
import {componentDestroyed, untilComponentDestroyed} from "ng2-rx-componentdestroyed";

export interface TimelineButtonText extends ButtonControllerText {
  zoomOut:string;
  zoomIn:string;
  zoomAuto:string;
}

@Component({
  templateUrl: './wp-timeline-toggle-button.html',
  selector: 'wp-timeline-toggle-button',
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class WorkPackageTimelineButtonComponent extends AbstractWorkPackageButtonComponent implements OnInit, OnDestroy {
  public buttonId:string = 'work-packages-timeline-toggle-button';
  public iconClass:string = 'icon-view-timeline';

  private activateLabel:string;
  private deactivateLabel:string;

  public text:TimelineButtonText;

  public minZoomLevel:TimelineZoomLevel = 'days';
  public maxZoomLevel:TimelineZoomLevel = 'years';

  public isAutoZoom = false;

  public isMaxLevel:boolean = false;
  public isMinLevel:boolean = false;

  constructor(readonly I18n:I18nService,
              readonly cdRef:ChangeDetectorRef,
              public wpTableTimeline:WorkPackageTableTimelineService) {
    super(I18n);

    this.activateLabel = I18n.t('js.timelines.button_activate');
    this.deactivateLabel = I18n.t('js.timelines.button_deactivate');

    this.text.zoomIn = I18n.t('js.timelines.zoom.in');
    this.text.zoomOut = I18n.t('js.timelines.zoom.out');
    this.text.zoomAuto = I18n.t('js.timelines.zoom.auto');
  }

  ngOnInit():void {
    this.wpTableTimeline
      .live$()
      .pipe(
        untilComponentDestroyed(this)
      )
      .subscribe(() => {
        this.isAutoZoom = this.wpTableTimeline.isAutoZoom();
        this.isActive = this.wpTableTimeline.isVisible;
        this.cdRef.detectChanges();
      });

    this.wpTableTimeline
      .appliedZoomLevel$
      .values$()
      .pipe(
        untilComponentDestroyed(this)
      )
      .subscribe((current) => {
        this.isMaxLevel = current === this.maxZoomLevel;
        this.isMinLevel = current === this.minZoomLevel;
        this.cdRef.detectChanges();
      });
  }

  ngOnDestroy():void {
    // Nothing to do
  }

  public get label():string {
    if (this.isActive) {
      return this.deactivateLabel;
    } else {
      return this.activateLabel;
    }
  }

  public isToggle():boolean {
    return true;
  }

  public updateZoomWithDelta(delta:number) {
    this.wpTableTimeline.updateZoomWithDelta(delta);
  }

  public performAction(event:Event) {
    this.toggleTimeline();
  }

  public toggleTimeline() {
    this.wpTableTimeline.toggle();
  }

  public enableAutoZoom() {
    this.wpTableTimeline.enableAutozoom();
  }

  public getAutoZoomToggleClass():string {
    return this.isAutoZoom ? '-disabled' : '';
  }
}
