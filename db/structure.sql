SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: announcements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.announcements (
    id integer NOT NULL,
    text text,
    show_until date,
    active boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.announcements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attachable_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attachable_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    attachment_id integer NOT NULL,
    filename character varying DEFAULT ''::character varying NOT NULL
);


--
-- Name: attachable_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attachable_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachable_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attachable_journals_id_seq OWNED BY public.attachable_journals.id;


--
-- Name: attachment_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attachment_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    container_id integer,
    container_type character varying(30),
    filename character varying DEFAULT ''::character varying NOT NULL,
    disk_filename character varying DEFAULT ''::character varying NOT NULL,
    filesize integer DEFAULT 0 NOT NULL,
    content_type character varying DEFAULT ''::character varying,
    digest character varying(40) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    description text
);


--
-- Name: attachment_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attachment_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachment_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attachment_journals_id_seq OWNED BY public.attachment_journals.id;


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attachments (
    id integer NOT NULL,
    container_id integer,
    container_type character varying(30),
    filename character varying DEFAULT ''::character varying NOT NULL,
    disk_filename character varying DEFAULT ''::character varying NOT NULL,
    filesize integer DEFAULT 0 NOT NULL,
    content_type character varying DEFAULT ''::character varying,
    digest character varying(40) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    description character varying,
    file character varying,
    fulltext text,
    fulltext_tsv tsvector,
    file_tsv tsvector,
    updated_at timestamp without time zone
);


--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: attribute_help_texts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attribute_help_texts (
    id integer NOT NULL,
    help_text text NOT NULL,
    type character varying NOT NULL,
    attribute_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attribute_help_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attribute_help_texts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attribute_help_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attribute_help_texts_id_seq OWNED BY public.attribute_help_texts.id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_sources (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    host character varying(60),
    port integer,
    account character varying,
    account_password character varying DEFAULT ''::character varying,
    base_dn character varying,
    attr_login character varying(30),
    attr_firstname character varying(30),
    attr_lastname character varying(30),
    attr_mail character varying(30),
    onthefly_register boolean DEFAULT false NOT NULL,
    attr_admin character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tls_mode integer DEFAULT 0 NOT NULL
);


--
-- Name: auth_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_sources_id_seq OWNED BY public.auth_sources.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(256) DEFAULT ''::character varying NOT NULL,
    assigned_to_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: changes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.changes (
    id integer NOT NULL,
    changeset_id integer NOT NULL,
    action character varying(1) DEFAULT ''::character varying NOT NULL,
    path text NOT NULL,
    from_path text,
    from_revision character varying,
    revision character varying,
    branch character varying
);


--
-- Name: changes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.changes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.changes_id_seq OWNED BY public.changes.id;


--
-- Name: changeset_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.changeset_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying NOT NULL,
    committer character varying,
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying,
    user_id integer
);


--
-- Name: changeset_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.changeset_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: changeset_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.changeset_journals_id_seq OWNED BY public.changeset_journals.id;


--
-- Name: changesets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.changesets (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying NOT NULL,
    committer character varying,
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying,
    user_id integer
);


--
-- Name: changesets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.changesets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: changesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.changesets_id_seq OWNED BY public.changesets.id;


--
-- Name: changesets_work_packages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.changesets_work_packages (
    changeset_id integer NOT NULL,
    work_package_id integer NOT NULL
);


--
-- Name: colors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.colors (
    id integer NOT NULL,
    name character varying NOT NULL,
    hexcode character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.colors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.colors_id_seq OWNED BY public.colors.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    commented_type character varying(30) DEFAULT ''::character varying NOT NULL,
    commented_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    comments text,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: cost_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_entries (
    id integer NOT NULL,
    user_id integer NOT NULL,
    project_id integer NOT NULL,
    work_package_id integer NOT NULL,
    cost_type_id integer NOT NULL,
    units double precision NOT NULL,
    spent_on date NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    comments character varying NOT NULL,
    blocked boolean DEFAULT false NOT NULL,
    overridden_costs numeric(15,4),
    costs numeric(15,4),
    rate_id integer,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL
);


--
-- Name: cost_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_entries_id_seq OWNED BY public.cost_entries.id;


--
-- Name: cost_object_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_object_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    project_id integer NOT NULL,
    author_id integer NOT NULL,
    subject character varying NOT NULL,
    description text,
    fixed_date date NOT NULL,
    created_on timestamp without time zone
);


--
-- Name: cost_object_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_object_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_object_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_object_journals_id_seq OWNED BY public.cost_object_journals.id;


--
-- Name: cost_objects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_objects (
    id integer NOT NULL,
    project_id integer NOT NULL,
    author_id integer NOT NULL,
    subject character varying NOT NULL,
    description text NOT NULL,
    type character varying NOT NULL,
    fixed_date date NOT NULL,
    created_on timestamp without time zone,
    updated_on timestamp without time zone
);


--
-- Name: cost_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_objects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_objects_id_seq OWNED BY public.cost_objects.id;


--
-- Name: cost_queries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_queries (
    id integer NOT NULL,
    user_id integer NOT NULL,
    project_id integer,
    name character varying NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    serialized character varying(2000) NOT NULL
);


--
-- Name: cost_queries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_queries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_queries_id_seq OWNED BY public.cost_queries.id;


--
-- Name: cost_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    unit character varying NOT NULL,
    unit_plural character varying NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: cost_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cost_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cost_types_id_seq OWNED BY public.cost_types.id;


--
-- Name: custom_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_actions (
    id integer NOT NULL,
    name character varying,
    actions text,
    description text,
    "position" integer
);


--
-- Name: custom_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_actions_id_seq OWNED BY public.custom_actions.id;


--
-- Name: custom_actions_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_actions_projects (
    id integer NOT NULL,
    project_id bigint,
    custom_action_id bigint
);


--
-- Name: custom_actions_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_actions_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_actions_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_actions_projects_id_seq OWNED BY public.custom_actions_projects.id;


--
-- Name: custom_actions_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_actions_roles (
    id integer NOT NULL,
    role_id bigint,
    custom_action_id bigint
);


--
-- Name: custom_actions_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_actions_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_actions_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_actions_roles_id_seq OWNED BY public.custom_actions_roles.id;


--
-- Name: custom_actions_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_actions_statuses (
    id integer NOT NULL,
    status_id bigint,
    custom_action_id bigint
);


--
-- Name: custom_actions_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_actions_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_actions_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_actions_statuses_id_seq OWNED BY public.custom_actions_statuses.id;


--
-- Name: custom_actions_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_actions_types (
    id integer NOT NULL,
    type_id bigint,
    custom_action_id bigint
);


--
-- Name: custom_actions_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_actions_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_actions_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_actions_types_id_seq OWNED BY public.custom_actions_types.id;


--
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_fields (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    field_format character varying(30) DEFAULT ''::character varying NOT NULL,
    regexp character varying DEFAULT ''::character varying,
    min_length integer DEFAULT 0 NOT NULL,
    max_length integer DEFAULT 0 NOT NULL,
    is_required boolean DEFAULT false NOT NULL,
    is_for_all boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer DEFAULT 1,
    searchable boolean DEFAULT false,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multi_value boolean DEFAULT false,
    default_value text,
    name character varying(255) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- Name: custom_fields_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_fields_projects (
    custom_field_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL
);


--
-- Name: custom_fields_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_fields_types (
    custom_field_id integer DEFAULT 0 NOT NULL,
    type_id integer DEFAULT 0 NOT NULL
);


--
-- Name: custom_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_options (
    id integer NOT NULL,
    custom_field_id integer,
    "position" integer,
    default_value boolean,
    value text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: custom_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_options_id_seq OWNED BY public.custom_options.id;


--
-- Name: custom_styles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_styles (
    id integer NOT NULL,
    logo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    favicon character varying,
    touch_icon character varying
);


--
-- Name: custom_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_styles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_styles_id_seq OWNED BY public.custom_styles.id;


--
-- Name: custom_values; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custom_values (
    id integer NOT NULL,
    customized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    customized_id integer DEFAULT 0 NOT NULL,
    custom_field_id integer DEFAULT 0 NOT NULL,
    value text
);


--
-- Name: custom_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.custom_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: custom_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.custom_values_id_seq OWNED BY public.custom_values.id;


--
-- Name: customizable_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customizable_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    custom_field_id integer NOT NULL,
    value text
);


--
-- Name: customizable_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customizable_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customizable_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customizable_journals_id_seq OWNED BY public.customizable_journals.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0,
    attempts integer DEFAULT 0,
    handler text,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    queue character varying
);


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.delayed_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.delayed_jobs_id_seq OWNED BY public.delayed_jobs.id;


--
-- Name: design_colors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.design_colors (
    id integer NOT NULL,
    variable character varying,
    hexcode character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: design_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.design_colors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: design_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.design_colors_id_seq OWNED BY public.design_colors.id;


--
-- Name: document_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.document_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);


--
-- Name: document_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.document_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: document_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.document_journals_id_seq OWNED BY public.document_journals.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: done_statuses_for_project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.done_statuses_for_project (
    project_id integer,
    status_id integer
);


--
-- Name: enabled_modules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enabled_modules (
    id integer NOT NULL,
    project_id integer,
    name character varying NOT NULL
);


--
-- Name: enabled_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.enabled_modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: enabled_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.enabled_modules_id_seq OWNED BY public.enabled_modules.id;


--
-- Name: enterprise_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enterprise_tokens (
    id integer NOT NULL,
    encoded_token text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: enterprise_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.enterprise_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: enterprise_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.enterprise_tokens_id_seq OWNED BY public.enterprise_tokens.id;


--
-- Name: enumerations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enumerations (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer DEFAULT 1,
    is_default boolean DEFAULT false NOT NULL,
    type character varying,
    active boolean DEFAULT true NOT NULL,
    project_id integer,
    parent_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    color_id integer
);


--
-- Name: enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.enumerations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.enumerations_id_seq OWNED BY public.enumerations.id;


--
-- Name: export_card_configurations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.export_card_configurations (
    id integer NOT NULL,
    name character varying,
    per_page integer,
    page_size character varying,
    orientation character varying,
    rows text,
    active boolean DEFAULT true,
    description text
);


--
-- Name: export_card_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.export_card_configurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: export_card_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.export_card_configurations_id_seq OWNED BY public.export_card_configurations.id;


--
-- Name: forums; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.forums (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying,
    "position" integer DEFAULT 1,
    topics_count integer DEFAULT 0 NOT NULL,
    messages_count integer DEFAULT 0 NOT NULL,
    last_message_id integer
);


--
-- Name: forums_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.forums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.forums_id_seq OWNED BY public.forums.id;


--
-- Name: grid_widgets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grid_widgets (
    id bigint NOT NULL,
    start_row integer NOT NULL,
    end_row integer NOT NULL,
    start_column integer NOT NULL,
    end_column integer NOT NULL,
    identifier character varying,
    options text,
    grid_id bigint
);


--
-- Name: grid_widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grid_widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grid_widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grid_widgets_id_seq OWNED BY public.grid_widgets.id;


--
-- Name: grids; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grids (
    id bigint NOT NULL,
    row_count integer NOT NULL,
    column_count integer NOT NULL,
    type character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id bigint,
    name text,
    options text
);


--
-- Name: grids_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grids_id_seq OWNED BY public.grids.id;


--
-- Name: group_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.journals (
    id integer NOT NULL,
    journable_type character varying,
    journable_id integer,
    user_id integer DEFAULT 0 NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    version integer DEFAULT 0 NOT NULL,
    activity_type character varying
);


--
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.journals_id_seq OWNED BY public.journals.id;


--
-- Name: labor_budget_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.labor_budget_items (
    id integer NOT NULL,
    cost_object_id integer NOT NULL,
    hours double precision NOT NULL,
    user_id integer,
    comments character varying DEFAULT ''::character varying NOT NULL,
    budget numeric(15,4)
);


--
-- Name: labor_budget_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.labor_budget_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: labor_budget_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.labor_budget_items_id_seq OWNED BY public.labor_budget_items.id;


--
-- Name: ldap_groups_memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ldap_groups_memberships (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ldap_groups_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ldap_groups_memberships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ldap_groups_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ldap_groups_memberships_id_seq OWNED BY public.ldap_groups_memberships.id;


--
-- Name: ldap_groups_synchronized_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ldap_groups_synchronized_groups (
    id integer NOT NULL,
    entry character varying,
    group_id integer,
    auth_source_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ldap_groups_synchronized_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ldap_groups_synchronized_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ldap_groups_synchronized_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ldap_groups_synchronized_groups_id_seq OWNED BY public.ldap_groups_synchronized_groups.id;


--
-- Name: material_budget_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.material_budget_items (
    id integer NOT NULL,
    cost_object_id integer NOT NULL,
    units double precision NOT NULL,
    cost_type_id integer,
    comments character varying DEFAULT ''::character varying NOT NULL,
    budget numeric(15,4)
);


--
-- Name: material_budget_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.material_budget_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: material_budget_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.material_budget_items_id_seq OWNED BY public.material_budget_items.id;


--
-- Name: meeting_content_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meeting_content_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    meeting_id integer,
    author_id integer,
    text text,
    locked boolean
);


--
-- Name: meeting_content_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meeting_content_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meeting_content_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meeting_content_journals_id_seq OWNED BY public.meeting_content_journals.id;


--
-- Name: meeting_contents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meeting_contents (
    id integer NOT NULL,
    type character varying,
    meeting_id integer,
    author_id integer,
    text text,
    lock_version integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    locked boolean DEFAULT false
);


--
-- Name: meeting_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meeting_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meeting_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meeting_contents_id_seq OWNED BY public.meeting_contents.id;


--
-- Name: meeting_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meeting_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    title character varying,
    author_id integer,
    project_id integer,
    location character varying,
    start_time timestamp without time zone,
    duration double precision
);


--
-- Name: meeting_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meeting_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meeting_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meeting_journals_id_seq OWNED BY public.meeting_journals.id;


--
-- Name: meeting_participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meeting_participants (
    id integer NOT NULL,
    user_id integer,
    meeting_id integer,
    email character varying,
    name character varying,
    invited boolean,
    attended boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: meeting_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meeting_participants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meeting_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meeting_participants_id_seq OWNED BY public.meeting_participants.id;


--
-- Name: meetings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meetings (
    id integer NOT NULL,
    title character varying,
    author_id integer,
    project_id integer,
    location character varying,
    start_time timestamp without time zone,
    duration double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: meetings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.meetings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meetings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.meetings_id_seq OWNED BY public.meetings.id;


--
-- Name: member_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.member_roles (
    id integer NOT NULL,
    member_id integer NOT NULL,
    role_id integer NOT NULL,
    inherited_from integer
);


--
-- Name: member_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.member_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: member_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.member_roles_id_seq OWNED BY public.member_roles.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.members (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    mail_notification boolean DEFAULT false NOT NULL
);


--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    name character varying,
    title character varying,
    parent_id integer,
    options text,
    navigatable_id integer,
    type character varying
);


--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: message_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.message_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    forum_id integer NOT NULL,
    parent_id integer,
    subject character varying DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0
);


--
-- Name: message_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.message_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: message_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.message_journals_id_seq OWNED BY public.message_journals.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    forum_id integer NOT NULL,
    parent_id integer,
    subject character varying DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0,
    sticked_on timestamp without time zone
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: my_projects_overviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.my_projects_overviews (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    "left" text NOT NULL,
    "right" text NOT NULL,
    top text NOT NULL,
    hidden text NOT NULL,
    created_on timestamp without time zone NOT NULL
);


--
-- Name: my_projects_overviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.my_projects_overviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: my_projects_overviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.my_projects_overviews_id_seq OWNED BY public.my_projects_overviews.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.news (
    id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    comments_count integer DEFAULT 0 NOT NULL
);


--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: news_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.news_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    comments_count integer DEFAULT 0 NOT NULL
);


--
-- Name: news_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.news_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.news_journals_id_seq OWNED BY public.news_journals.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_grants (
    id bigint NOT NULL,
    resource_owner_id bigint NOT NULL,
    application_id bigint NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying,
    code_challenge character varying,
    code_challenge_method character varying
);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_tokens (
    id bigint NOT NULL,
    resource_owner_id bigint,
    application_id bigint,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying,
    previous_refresh_token character varying DEFAULT ''::character varying NOT NULL
);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_applications (
    id bigint NOT NULL,
    name character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    owner_type character varying,
    owner_id integer,
    client_credentials_user_id integer,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    confidential boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: ordered_work_packages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ordered_work_packages (
    id bigint NOT NULL,
    "position" integer NOT NULL,
    query_id integer,
    work_package_id integer
);


--
-- Name: ordered_work_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ordered_work_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ordered_work_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ordered_work_packages_id_seq OWNED BY public.ordered_work_packages.id;


--
-- Name: plaintext_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plaintext_tokens (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    action character varying(30) DEFAULT ''::character varying NOT NULL,
    value character varying(40) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL
);


--
-- Name: plaintext_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plaintext_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plaintext_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plaintext_tokens_id_seq OWNED BY public.plaintext_tokens.id;


--
-- Name: principal_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.principal_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    principal_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: principal_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.principal_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: principal_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.principal_roles_id_seq OWNED BY public.principal_roles.id;


--
-- Name: project_associations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_associations (
    id integer NOT NULL,
    project_a_id integer,
    project_b_id integer,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: project_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.project_associations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.project_associations_id_seq OWNED BY public.project_associations.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    is_public boolean DEFAULT true NOT NULL,
    parent_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    identifier character varying,
    status integer DEFAULT 1 NOT NULL,
    lft integer,
    rgt integer
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects_types (
    project_id integer DEFAULT 0 NOT NULL,
    type_id integer DEFAULT 0 NOT NULL
);


--
-- Name: queries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.queries (
    id integer NOT NULL,
    project_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying,
    display_sums boolean DEFAULT false NOT NULL,
    timeline_visible boolean DEFAULT false,
    show_hierarchies boolean DEFAULT false,
    timeline_zoom_level integer DEFAULT 5,
    timeline_labels text,
    highlighting_mode text,
    highlighted_attributes text,
    hidden boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    display_representation text
);


--
-- Name: queries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.queries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.queries_id_seq OWNED BY public.queries.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rates (
    id integer NOT NULL,
    valid_from date NOT NULL,
    rate numeric(15,4) NOT NULL,
    type character varying NOT NULL,
    project_id integer,
    user_id integer,
    cost_type_id integer
);


--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rates_id_seq OWNED BY public.rates.id;


--
-- Name: relations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.relations (
    id integer NOT NULL,
    from_id integer NOT NULL,
    to_id integer NOT NULL,
    delay integer,
    description text,
    hierarchy integer DEFAULT 0 NOT NULL,
    relates integer DEFAULT 0 NOT NULL,
    duplicates integer DEFAULT 0 NOT NULL,
    blocks integer DEFAULT 0 NOT NULL,
    follows integer DEFAULT 0 NOT NULL,
    includes integer DEFAULT 0 NOT NULL,
    requires integer DEFAULT 0 NOT NULL,
    count integer DEFAULT 0 NOT NULL
);


--
-- Name: relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.relations_id_seq OWNED BY public.relations.id;


--
-- Name: repositories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.repositories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    login character varying(60) DEFAULT ''::character varying,
    password character varying DEFAULT ''::character varying,
    root_url character varying DEFAULT ''::character varying,
    type character varying,
    path_encoding character varying(64),
    log_encoding character varying(64),
    scm_type character varying NOT NULL,
    required_storage_bytes bigint DEFAULT 0 NOT NULL,
    storage_updated_at timestamp without time zone
);


--
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.repositories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.repositories_id_seq OWNED BY public.repositories.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_permissions (
    id integer NOT NULL,
    permission character varying,
    role_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: role_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_permissions_id_seq OWNED BY public.role_permissions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer DEFAULT 1,
    assignable boolean DEFAULT true,
    builtin integer DEFAULT 0 NOT NULL,
    type character varying(30) DEFAULT 'Role'::character varying
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    session_id character varying NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    value text,
    updated_on timestamp without time zone
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.statuses (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    "position" integer DEFAULT 1,
    default_done_ratio integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    color_id integer,
    is_readonly boolean DEFAULT false
);


--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- Name: time_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.time_entries (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    work_package_id integer,
    hours double precision NOT NULL,
    comments character varying,
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    overridden_costs numeric(15,4),
    costs numeric(15,4),
    rate_id integer
);


--
-- Name: time_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.time_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: time_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.time_entries_id_seq OWNED BY public.time_entries.id;


--
-- Name: time_entry_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.time_entry_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    work_package_id integer,
    hours double precision NOT NULL,
    comments character varying,
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    overridden_costs numeric(15,2),
    costs numeric(15,2),
    rate_id integer
);


--
-- Name: time_entry_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.time_entry_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: time_entry_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.time_entry_journals_id_seq OWNED BY public.time_entry_journals.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id bigint,
    type character varying,
    value character varying(128) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL,
    expires_on timestamp without time zone
);


--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: two_factor_authentication_devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.two_factor_authentication_devices (
    id integer NOT NULL,
    type character varying,
    "default" boolean DEFAULT false NOT NULL,
    active boolean DEFAULT false NOT NULL,
    channel character varying NOT NULL,
    phone_number character varying,
    identifier character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    last_used_at integer,
    otp_secret text,
    user_id integer
);


--
-- Name: two_factor_authentication_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.two_factor_authentication_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: two_factor_authentication_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.two_factor_authentication_devices_id_seq OWNED BY public.two_factor_authentication_devices.id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    "position" integer DEFAULT 1,
    is_in_roadmap boolean DEFAULT true NOT NULL,
    is_milestone boolean DEFAULT false NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    color_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_standard boolean DEFAULT false NOT NULL,
    attribute_groups text,
    description text
);


--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: user_passwords; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_passwords (
    id integer NOT NULL,
    user_id integer NOT NULL,
    hashed_password character varying(128) NOT NULL,
    salt character varying(64),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying NOT NULL
);


--
-- Name: user_passwords_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_passwords_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_passwords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_passwords_id_seq OWNED BY public.user_passwords.id;


--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_preferences (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    others text,
    hide_mail boolean DEFAULT true,
    time_zone character varying
);


--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_preferences_id_seq OWNED BY public.user_preferences.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(256) DEFAULT ''::character varying NOT NULL,
    firstname character varying(30) DEFAULT ''::character varying NOT NULL,
    lastname character varying(30) DEFAULT ''::character varying NOT NULL,
    mail character varying(60) DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    last_login_on timestamp without time zone,
    language character varying(5) DEFAULT ''::character varying,
    auth_source_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type character varying,
    identity_url character varying,
    mail_notification character varying DEFAULT ''::character varying NOT NULL,
    first_login boolean DEFAULT true NOT NULL,
    force_password_change boolean DEFAULT false,
    failed_login_count integer DEFAULT 0,
    last_failed_login_on timestamp without time zone,
    consented_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: version_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.version_settings (
    id integer NOT NULL,
    project_id integer,
    version_id integer,
    display integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: version_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.version_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: version_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.version_settings_id_seq OWNED BY public.version_settings.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying,
    effective_date date,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    wiki_page_title character varying,
    status character varying DEFAULT 'open'::character varying,
    sharing character varying DEFAULT 'none'::character varying NOT NULL,
    start_date date
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: watchers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.watchers (
    id integer NOT NULL,
    watchable_type character varying DEFAULT ''::character varying NOT NULL,
    watchable_id integer DEFAULT 0 NOT NULL,
    user_id integer
);


--
-- Name: watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.watchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.watchers_id_seq OWNED BY public.watchers.id;


--
-- Name: webhooks_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.webhooks_events (
    id integer NOT NULL,
    name character varying,
    webhooks_webhook_id integer
);


--
-- Name: webhooks_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.webhooks_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: webhooks_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.webhooks_events_id_seq OWNED BY public.webhooks_events.id;


--
-- Name: webhooks_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.webhooks_logs (
    id integer NOT NULL,
    webhooks_webhook_id integer,
    event_name character varying,
    url character varying,
    request_headers text,
    request_body text,
    response_code integer,
    response_headers text,
    response_body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: webhooks_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.webhooks_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: webhooks_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.webhooks_logs_id_seq OWNED BY public.webhooks_logs.id;


--
-- Name: webhooks_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.webhooks_projects (
    id integer NOT NULL,
    project_id integer,
    webhooks_webhook_id integer
);


--
-- Name: webhooks_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.webhooks_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: webhooks_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.webhooks_projects_id_seq OWNED BY public.webhooks_projects.id;


--
-- Name: webhooks_webhooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.webhooks_webhooks (
    id integer NOT NULL,
    name character varying,
    url text,
    description text NOT NULL,
    secret character varying,
    enabled boolean NOT NULL,
    all_projects boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: webhooks_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.webhooks_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: webhooks_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.webhooks_webhooks_id_seq OWNED BY public.webhooks_webhooks.id;


--
-- Name: wiki_content_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wiki_content_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text
);


--
-- Name: wiki_content_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wiki_content_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wiki_content_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wiki_content_journals_id_seq OWNED BY public.wiki_content_journals.id;


--
-- Name: wiki_contents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wiki_contents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text,
    updated_on timestamp without time zone NOT NULL,
    lock_version integer NOT NULL
);


--
-- Name: wiki_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wiki_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wiki_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wiki_contents_id_seq OWNED BY public.wiki_contents.id;


--
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wiki_pages (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying NOT NULL,
    created_on timestamp without time zone NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    parent_id integer,
    slug character varying NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wiki_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wiki_pages_id_seq OWNED BY public.wiki_pages.id;


--
-- Name: wiki_redirects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wiki_redirects (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying,
    redirects_to character varying,
    created_on timestamp without time zone NOT NULL
);


--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wiki_redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wiki_redirects_id_seq OWNED BY public.wiki_redirects.id;


--
-- Name: wikis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wikis (
    id integer NOT NULL,
    project_id integer NOT NULL,
    start_page character varying NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: wikis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wikis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wikis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wikis_id_seq OWNED BY public.wikis.id;


--
-- Name: work_package_journals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_package_journals (
    id integer NOT NULL,
    journal_id integer NOT NULL,
    type_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer DEFAULT 0 NOT NULL,
    assigned_to_id integer,
    priority_id integer DEFAULT 0 NOT NULL,
    fixed_version_id integer,
    author_id integer DEFAULT 0 NOT NULL,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    start_date date,
    parent_id integer,
    responsible_id integer,
    cost_object_id integer,
    story_points integer,
    remaining_hours double precision
);


--
-- Name: work_package_journals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.work_package_journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_package_journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.work_package_journals_id_seq OWNED BY public.work_package_journals.id;


--
-- Name: work_packages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.work_packages (
    id integer NOT NULL,
    type_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer DEFAULT 0 NOT NULL,
    assigned_to_id integer,
    priority_id integer DEFAULT 0,
    fixed_version_id integer,
    author_id integer DEFAULT 0 NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    start_date date,
    responsible_id integer,
    cost_object_id integer,
    "position" integer,
    story_points integer,
    remaining_hours double precision
);


--
-- Name: work_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.work_packages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.work_packages_id_seq OWNED BY public.work_packages.id;


--
-- Name: workflows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workflows (
    id integer NOT NULL,
    type_id integer DEFAULT 0 NOT NULL,
    old_status_id integer DEFAULT 0 NOT NULL,
    new_status_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    assignee boolean DEFAULT false NOT NULL,
    author boolean DEFAULT false NOT NULL
);


--
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.workflows_id_seq OWNED BY public.workflows.id;


--
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- Name: attachable_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachable_journals ALTER COLUMN id SET DEFAULT nextval('public.attachable_journals_id_seq'::regclass);


--
-- Name: attachment_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachment_journals ALTER COLUMN id SET DEFAULT nextval('public.attachment_journals_id_seq'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: attribute_help_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_help_texts ALTER COLUMN id SET DEFAULT nextval('public.attribute_help_texts_id_seq'::regclass);


--
-- Name: auth_sources id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN id SET DEFAULT nextval('public.auth_sources_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: changes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changes ALTER COLUMN id SET DEFAULT nextval('public.changes_id_seq'::regclass);


--
-- Name: changeset_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changeset_journals ALTER COLUMN id SET DEFAULT nextval('public.changeset_journals_id_seq'::regclass);


--
-- Name: changesets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changesets ALTER COLUMN id SET DEFAULT nextval('public.changesets_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.colors ALTER COLUMN id SET DEFAULT nextval('public.colors_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: cost_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_entries ALTER COLUMN id SET DEFAULT nextval('public.cost_entries_id_seq'::regclass);


--
-- Name: cost_object_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_object_journals ALTER COLUMN id SET DEFAULT nextval('public.cost_object_journals_id_seq'::regclass);


--
-- Name: cost_objects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_objects ALTER COLUMN id SET DEFAULT nextval('public.cost_objects_id_seq'::regclass);


--
-- Name: cost_queries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_queries ALTER COLUMN id SET DEFAULT nextval('public.cost_queries_id_seq'::regclass);


--
-- Name: cost_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_types ALTER COLUMN id SET DEFAULT nextval('public.cost_types_id_seq'::regclass);


--
-- Name: custom_actions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions ALTER COLUMN id SET DEFAULT nextval('public.custom_actions_id_seq'::regclass);


--
-- Name: custom_actions_projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions_projects ALTER COLUMN id SET DEFAULT nextval('public.custom_actions_projects_id_seq'::regclass);


--
-- Name: custom_actions_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions_roles ALTER COLUMN id SET DEFAULT nextval('public.custom_actions_roles_id_seq'::regclass);


--
-- Name: custom_actions_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions_statuses ALTER COLUMN id SET DEFAULT nextval('public.custom_actions_statuses_id_seq'::regclass);


--
-- Name: custom_actions_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions_types ALTER COLUMN id SET DEFAULT nextval('public.custom_actions_types_id_seq'::regclass);


--
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- Name: custom_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_options ALTER COLUMN id SET DEFAULT nextval('public.custom_options_id_seq'::regclass);


--
-- Name: custom_styles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_styles ALTER COLUMN id SET DEFAULT nextval('public.custom_styles_id_seq'::regclass);


--
-- Name: custom_values id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_values ALTER COLUMN id SET DEFAULT nextval('public.custom_values_id_seq'::regclass);


--
-- Name: customizable_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customizable_journals ALTER COLUMN id SET DEFAULT nextval('public.customizable_journals_id_seq'::regclass);


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delayed_jobs ALTER COLUMN id SET DEFAULT nextval('public.delayed_jobs_id_seq'::regclass);


--
-- Name: design_colors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.design_colors ALTER COLUMN id SET DEFAULT nextval('public.design_colors_id_seq'::regclass);


--
-- Name: document_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.document_journals ALTER COLUMN id SET DEFAULT nextval('public.document_journals_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: enabled_modules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enabled_modules ALTER COLUMN id SET DEFAULT nextval('public.enabled_modules_id_seq'::regclass);


--
-- Name: enterprise_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enterprise_tokens ALTER COLUMN id SET DEFAULT nextval('public.enterprise_tokens_id_seq'::regclass);


--
-- Name: enumerations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enumerations ALTER COLUMN id SET DEFAULT nextval('public.enumerations_id_seq'::regclass);


--
-- Name: export_card_configurations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.export_card_configurations ALTER COLUMN id SET DEFAULT nextval('public.export_card_configurations_id_seq'::regclass);


--
-- Name: forums id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forums ALTER COLUMN id SET DEFAULT nextval('public.forums_id_seq'::regclass);


--
-- Name: grid_widgets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grid_widgets ALTER COLUMN id SET DEFAULT nextval('public.grid_widgets_id_seq'::regclass);


--
-- Name: grids id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grids ALTER COLUMN id SET DEFAULT nextval('public.grids_id_seq'::regclass);


--
-- Name: journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journals ALTER COLUMN id SET DEFAULT nextval('public.journals_id_seq'::regclass);


--
-- Name: labor_budget_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.labor_budget_items ALTER COLUMN id SET DEFAULT nextval('public.labor_budget_items_id_seq'::regclass);


--
-- Name: ldap_groups_memberships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ldap_groups_memberships ALTER COLUMN id SET DEFAULT nextval('public.ldap_groups_memberships_id_seq'::regclass);


--
-- Name: ldap_groups_synchronized_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ldap_groups_synchronized_groups ALTER COLUMN id SET DEFAULT nextval('public.ldap_groups_synchronized_groups_id_seq'::regclass);


--
-- Name: material_budget_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_budget_items ALTER COLUMN id SET DEFAULT nextval('public.material_budget_items_id_seq'::regclass);


--
-- Name: meeting_content_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meeting_content_journals ALTER COLUMN id SET DEFAULT nextval('public.meeting_content_journals_id_seq'::regclass);


--
-- Name: meeting_contents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meeting_contents ALTER COLUMN id SET DEFAULT nextval('public.meeting_contents_id_seq'::regclass);


--
-- Name: meeting_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meeting_journals ALTER COLUMN id SET DEFAULT nextval('public.meeting_journals_id_seq'::regclass);


--
-- Name: meeting_participants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meeting_participants ALTER COLUMN id SET DEFAULT nextval('public.meeting_participants_id_seq'::regclass);


--
-- Name: meetings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meetings ALTER COLUMN id SET DEFAULT nextval('public.meetings_id_seq'::regclass);


--
-- Name: member_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_roles ALTER COLUMN id SET DEFAULT nextval('public.member_roles_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: message_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_journals ALTER COLUMN id SET DEFAULT nextval('public.message_journals_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: my_projects_overviews id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.my_projects_overviews ALTER COLUMN id SET DEFAULT nextval('public.my_projects_overviews_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: news_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_journals ALTER COLUMN id SET DEFAULT nextval('public.news_journals_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: ordered_work_packages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ordered_work_packages ALTER COLUMN id SET DEFAULT nextval('public.ordered_work_packages_id_seq'::regclass);


--
-- Name: plaintext_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plaintext_tokens ALTER COLUMN id SET DEFAULT nextval('public.plaintext_tokens_id_seq'::regclass);


--
-- Name: principal_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.principal_roles ALTER COLUMN id SET DEFAULT nextval('public.principal_roles_id_seq'::regclass);


--
-- Name: project_associations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_associations ALTER COLUMN id SET DEFAULT nextval('public.project_associations_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: queries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queries ALTER COLUMN id SET DEFAULT nextval('public.queries_id_seq'::regclass);


--
-- Name: rates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rates ALTER COLUMN id SET DEFAULT nextval('public.rates_id_seq'::regclass);


--
-- Name: relations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations ALTER COLUMN id SET DEFAULT nextval('public.relations_id_seq'::regclass);


--
-- Name: repositories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repositories ALTER COLUMN id SET DEFAULT nextval('public.repositories_id_seq'::regclass);


--
-- Name: role_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- Name: time_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_entries ALTER COLUMN id SET DEFAULT nextval('public.time_entries_id_seq'::regclass);


--
-- Name: time_entry_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_entry_journals ALTER COLUMN id SET DEFAULT nextval('public.time_entry_journals_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: two_factor_authentication_devices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.two_factor_authentication_devices ALTER COLUMN id SET DEFAULT nextval('public.two_factor_authentication_devices_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Name: user_passwords id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_passwords ALTER COLUMN id SET DEFAULT nextval('public.user_passwords_id_seq'::regclass);


--
-- Name: user_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_preferences ALTER COLUMN id SET DEFAULT nextval('public.user_preferences_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: version_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.version_settings ALTER COLUMN id SET DEFAULT nextval('public.version_settings_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: watchers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchers ALTER COLUMN id SET DEFAULT nextval('public.watchers_id_seq'::regclass);


--
-- Name: webhooks_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_events ALTER COLUMN id SET DEFAULT nextval('public.webhooks_events_id_seq'::regclass);


--
-- Name: webhooks_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_logs ALTER COLUMN id SET DEFAULT nextval('public.webhooks_logs_id_seq'::regclass);


--
-- Name: webhooks_projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_projects ALTER COLUMN id SET DEFAULT nextval('public.webhooks_projects_id_seq'::regclass);


--
-- Name: webhooks_webhooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_webhooks ALTER COLUMN id SET DEFAULT nextval('public.webhooks_webhooks_id_seq'::regclass);


--
-- Name: wiki_content_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wiki_content_journals ALTER COLUMN id SET DEFAULT nextval('public.wiki_content_journals_id_seq'::regclass);


--
-- Name: wiki_contents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wiki_contents ALTER COLUMN id SET DEFAULT nextval('public.wiki_contents_id_seq'::regclass);


--
-- Name: wiki_pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wiki_pages ALTER COLUMN id SET DEFAULT nextval('public.wiki_pages_id_seq'::regclass);


--
-- Name: wiki_redirects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wiki_redirects ALTER COLUMN id SET DEFAULT nextval('public.wiki_redirects_id_seq'::regclass);


--
-- Name: wikis id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wikis ALTER COLUMN id SET DEFAULT nextval('public.wikis_id_seq'::regclass);


--
-- Name: work_package_journals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_package_journals ALTER COLUMN id SET DEFAULT nextval('public.work_package_journals_id_seq'::regclass);


--
-- Name: work_packages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_packages ALTER COLUMN id SET DEFAULT nextval('public.work_packages_id_seq'::regclass);


--
-- Name: workflows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflows ALTER COLUMN id SET DEFAULT nextval('public.workflows_id_seq'::regclass);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachable_journals attachable_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachable_journals
    ADD CONSTRAINT attachable_journals_pkey PRIMARY KEY (id);


--
-- Name: attachment_journals attachment_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachment_journals
    ADD CONSTRAINT attachment_journals_pkey PRIMARY KEY (id);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: attribute_help_texts attribute_help_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute_help_texts
    ADD CONSTRAINT attribute_help_texts_pkey PRIMARY KEY (id);


--
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: changes changes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (id);


--
-- Name: changeset_journals changeset_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changeset_journals
    ADD CONSTRAINT changeset_journals_pkey PRIMARY KEY (id);


--
-- Name: changesets changesets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: cost_entries cost_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_entries
    ADD CONSTRAINT cost_entries_pkey PRIMARY KEY (id);


--
-- Name: cost_object_journals cost_object_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_object_journals
    ADD CONSTRAINT cost_object_journals_pkey PRIMARY KEY (id);


--
-- Name: cost_objects cost_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_objects
    ADD CONSTRAINT cost_objects_pkey PRIMARY KEY (id);


--
-- Name: cost_queries cost_queries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_queries
    ADD CONSTRAINT cost_queries_pkey PRIMARY KEY (id);


--
-- Name: cost_types cost_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_types
    ADD CONSTRAINT cost_types_pkey PRIMARY KEY (id);


--
-- Name: custom_actions custom_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions
    ADD CONSTRAINT custom_actions_pkey PRIMARY KEY (id);


--
-- Name: custom_actions_projects custom_actions_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions_projects
    ADD CONSTRAINT custom_actions_projects_pkey PRIMARY KEY (id);


--
-- Name: custom_actions_roles custom_actions_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions_roles
    ADD CONSTRAINT custom_actions_roles_pkey PRIMARY KEY (id);


--
-- Name: custom_actions_statuses custom_actions_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions_statuses
    ADD CONSTRAINT custom_actions_statuses_pkey PRIMARY KEY (id);


--
-- Name: custom_actions_types custom_actions_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_actions_types
    ADD CONSTRAINT custom_actions_types_pkey PRIMARY KEY (id);


--
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- Name: custom_options custom_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_options
    ADD CONSTRAINT custom_options_pkey PRIMARY KEY (id);


--
-- Name: custom_styles custom_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_styles
    ADD CONSTRAINT custom_styles_pkey PRIMARY KEY (id);


--
-- Name: custom_values custom_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custom_values
    ADD CONSTRAINT custom_values_pkey PRIMARY KEY (id);


--
-- Name: customizable_journals customizable_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customizable_journals
    ADD CONSTRAINT customizable_journals_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: design_colors design_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.design_colors
    ADD CONSTRAINT design_colors_pkey PRIMARY KEY (id);


--
-- Name: document_journals document_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.document_journals
    ADD CONSTRAINT document_journals_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: enabled_modules enabled_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enabled_modules
    ADD CONSTRAINT enabled_modules_pkey PRIMARY KEY (id);


--
-- Name: enterprise_tokens enterprise_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enterprise_tokens
    ADD CONSTRAINT enterprise_tokens_pkey PRIMARY KEY (id);


--
-- Name: enumerations enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enumerations
    ADD CONSTRAINT enumerations_pkey PRIMARY KEY (id);


--
-- Name: export_card_configurations export_card_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.export_card_configurations
    ADD CONSTRAINT export_card_configurations_pkey PRIMARY KEY (id);


--
-- Name: forums forums_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.forums
    ADD CONSTRAINT forums_pkey PRIMARY KEY (id);


--
-- Name: grid_widgets grid_widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grid_widgets
    ADD CONSTRAINT grid_widgets_pkey PRIMARY KEY (id);


--
-- Name: grids grids_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grids
    ADD CONSTRAINT grids_pkey PRIMARY KEY (id);


--
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- Name: labor_budget_items labor_budget_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.labor_budget_items
    ADD CONSTRAINT labor_budget_items_pkey PRIMARY KEY (id);


--
-- Name: ldap_groups_memberships ldap_groups_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ldap_groups_memberships
    ADD CONSTRAINT ldap_groups_memberships_pkey PRIMARY KEY (id);


--
-- Name: ldap_groups_synchronized_groups ldap_groups_synchronized_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ldap_groups_synchronized_groups
    ADD CONSTRAINT ldap_groups_synchronized_groups_pkey PRIMARY KEY (id);


--
-- Name: material_budget_items material_budget_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_budget_items
    ADD CONSTRAINT material_budget_items_pkey PRIMARY KEY (id);


--
-- Name: meeting_content_journals meeting_content_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meeting_content_journals
    ADD CONSTRAINT meeting_content_journals_pkey PRIMARY KEY (id);


--
-- Name: meeting_contents meeting_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meeting_contents
    ADD CONSTRAINT meeting_contents_pkey PRIMARY KEY (id);


--
-- Name: meeting_journals meeting_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meeting_journals
    ADD CONSTRAINT meeting_journals_pkey PRIMARY KEY (id);


--
-- Name: meeting_participants meeting_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meeting_participants
    ADD CONSTRAINT meeting_participants_pkey PRIMARY KEY (id);


--
-- Name: meetings meetings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_pkey PRIMARY KEY (id);


--
-- Name: member_roles member_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_roles
    ADD CONSTRAINT member_roles_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: message_journals message_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_journals
    ADD CONSTRAINT message_journals_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: my_projects_overviews my_projects_overviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.my_projects_overviews
    ADD CONSTRAINT my_projects_overviews_pkey PRIMARY KEY (id);


--
-- Name: news_journals news_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_journals
    ADD CONSTRAINT news_journals_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: ordered_work_packages ordered_work_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ordered_work_packages
    ADD CONSTRAINT ordered_work_packages_pkey PRIMARY KEY (id);


--
-- Name: plaintext_tokens plaintext_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plaintext_tokens
    ADD CONSTRAINT plaintext_tokens_pkey PRIMARY KEY (id);


--
-- Name: principal_roles principal_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.principal_roles
    ADD CONSTRAINT principal_roles_pkey PRIMARY KEY (id);


--
-- Name: project_associations project_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_associations
    ADD CONSTRAINT project_associations_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);


--
-- Name: rates rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: relations relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);


--
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- Name: time_entries time_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_entries
    ADD CONSTRAINT time_entries_pkey PRIMARY KEY (id);


--
-- Name: time_entry_journals time_entry_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_entry_journals
    ADD CONSTRAINT time_entry_journals_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: two_factor_authentication_devices two_factor_authentication_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.two_factor_authentication_devices
    ADD CONSTRAINT two_factor_authentication_devices_pkey PRIMARY KEY (id);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: user_passwords user_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_passwords
    ADD CONSTRAINT user_passwords_pkey PRIMARY KEY (id);


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: version_settings version_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.version_settings
    ADD CONSTRAINT version_settings_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: watchers watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);


--
-- Name: webhooks_events webhooks_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_events
    ADD CONSTRAINT webhooks_events_pkey PRIMARY KEY (id);


--
-- Name: webhooks_logs webhooks_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_logs
    ADD CONSTRAINT webhooks_logs_pkey PRIMARY KEY (id);


--
-- Name: webhooks_projects webhooks_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_projects
    ADD CONSTRAINT webhooks_projects_pkey PRIMARY KEY (id);


--
-- Name: webhooks_webhooks webhooks_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_webhooks
    ADD CONSTRAINT webhooks_webhooks_pkey PRIMARY KEY (id);


--
-- Name: wiki_content_journals wiki_content_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wiki_content_journals
    ADD CONSTRAINT wiki_content_journals_pkey PRIMARY KEY (id);


--
-- Name: wiki_contents wiki_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wiki_contents
    ADD CONSTRAINT wiki_contents_pkey PRIMARY KEY (id);


--
-- Name: wiki_pages wiki_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);


--
-- Name: wiki_redirects wiki_redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wiki_redirects
    ADD CONSTRAINT wiki_redirects_pkey PRIMARY KEY (id);


--
-- Name: wikis wikis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wikis
    ADD CONSTRAINT wikis_pkey PRIMARY KEY (id);


--
-- Name: work_package_journals work_package_journals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_package_journals
    ADD CONSTRAINT work_package_journals_pkey PRIMARY KEY (id);


--
-- Name: work_packages work_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.work_packages
    ADD CONSTRAINT work_packages_pkey PRIMARY KEY (id);


--
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- Name: changesets_changeset_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX changesets_changeset_id ON public.changes USING btree (changeset_id);


--
-- Name: changesets_repos_rev; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX changesets_repos_rev ON public.changesets USING btree (repository_id, revision);


--
-- Name: changesets_repos_scmid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX changesets_repos_scmid ON public.changesets USING btree (repository_id, scmid);


--
-- Name: changesets_work_packages_ids; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX changesets_work_packages_ids ON public.changesets_work_packages USING btree (changeset_id, work_package_id);


--
-- Name: custom_fields_types_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX custom_fields_types_unique ON public.custom_fields_types USING btree (custom_field_id, type_id);


--
-- Name: custom_values_customized; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX custom_values_customized ON public.custom_values USING btree (customized_type, customized_id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX delayed_jobs_priority ON public.delayed_jobs USING btree (priority, run_at);


--
-- Name: documents_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX documents_project_id ON public.documents USING btree (project_id);


--
-- Name: enabled_modules_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX enabled_modules_project_id ON public.enabled_modules USING btree (project_id);


--
-- Name: forums_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX forums_project_id ON public.forums USING btree (project_id);


--
-- Name: group_user_ids; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX group_user_ids ON public.group_users USING btree (group_id, user_id);


--
-- Name: index_announcements_on_show_until_and_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcements_on_show_until_and_active ON public.announcements USING btree (show_until, active);


--
-- Name: index_attachable_journals_on_attachment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachable_journals_on_attachment_id ON public.attachable_journals USING btree (attachment_id);


--
-- Name: index_attachable_journals_on_journal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachable_journals_on_journal_id ON public.attachable_journals USING btree (journal_id);


--
-- Name: index_attachment_journals_on_journal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachment_journals_on_journal_id ON public.attachment_journals USING btree (journal_id);


--
-- Name: index_attachments_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachments_on_author_id ON public.attachments USING btree (author_id);


--
-- Name: index_attachments_on_container_id_and_container_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachments_on_container_id_and_container_type ON public.attachments USING btree (container_id, container_type);


--
-- Name: index_attachments_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachments_on_created_at ON public.attachments USING btree (created_at);


--
-- Name: index_attachments_on_file_tsv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachments_on_file_tsv ON public.attachments USING gin (file_tsv);


--
-- Name: index_attachments_on_fulltext_tsv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attachments_on_fulltext_tsv ON public.attachments USING gin (fulltext_tsv);


--
-- Name: index_auth_sources_on_id_and_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auth_sources_on_id_and_type ON public.auth_sources USING btree (id, type);


--
-- Name: index_categories_on_assigned_to_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_on_assigned_to_id ON public.categories USING btree (assigned_to_id);


--
-- Name: index_changeset_journals_on_journal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_changeset_journals_on_journal_id ON public.changeset_journals USING btree (journal_id);


--
-- Name: index_changesets_on_committed_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_changesets_on_committed_on ON public.changesets USING btree (committed_on);


--
-- Name: index_changesets_on_repository_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_changesets_on_repository_id ON public.changesets USING btree (repository_id);


--
-- Name: index_changesets_on_repository_id_and_committed_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_changesets_on_repository_id_and_committed_on ON public.changesets USING btree (repository_id, committed_on);


--
-- Name: index_changesets_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_changesets_on_user_id ON public.changesets USING btree (user_id);


--
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_author_id ON public.comments USING btree (author_id);


--
-- Name: index_comments_on_commented_id_and_commented_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_commented_id_and_commented_type ON public.comments USING btree (commented_id, commented_type);


--
-- Name: index_cost_objects_on_project_id_and_updated_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_objects_on_project_id_and_updated_on ON public.cost_objects USING btree (project_id, updated_on);


--
-- Name: index_custom_actions_projects_on_custom_action_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_actions_projects_on_custom_action_id ON public.custom_actions_projects USING btree (custom_action_id);


--
-- Name: index_custom_actions_projects_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_actions_projects_on_project_id ON public.custom_actions_projects USING btree (project_id);


--
-- Name: index_custom_actions_roles_on_custom_action_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_actions_roles_on_custom_action_id ON public.custom_actions_roles USING btree (custom_action_id);


--
-- Name: index_custom_actions_roles_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_actions_roles_on_role_id ON public.custom_actions_roles USING btree (role_id);


--
-- Name: index_custom_actions_statuses_on_custom_action_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_actions_statuses_on_custom_action_id ON public.custom_actions_statuses USING btree (custom_action_id);


--
-- Name: index_custom_actions_statuses_on_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_actions_statuses_on_status_id ON public.custom_actions_statuses USING btree (status_id);


--
-- Name: index_custom_actions_types_on_custom_action_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_actions_types_on_custom_action_id ON public.custom_actions_types USING btree (custom_action_id);


--
-- Name: index_custom_actions_types_on_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_actions_types_on_type_id ON public.custom_actions_types USING btree (type_id);


--
-- Name: index_custom_fields_on_id_and_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_fields_on_id_and_type ON public.custom_fields USING btree (id, type);


--
-- Name: index_custom_fields_projects_on_custom_field_id_and_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_fields_projects_on_custom_field_id_and_project_id ON public.custom_fields_projects USING btree (custom_field_id, project_id);


--
-- Name: index_custom_values_on_custom_field_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_custom_values_on_custom_field_id ON public.custom_values USING btree (custom_field_id);


--
-- Name: index_customizable_journals_on_custom_field_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customizable_journals_on_custom_field_id ON public.customizable_journals USING btree (custom_field_id);


--
-- Name: index_customizable_journals_on_journal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customizable_journals_on_journal_id ON public.customizable_journals USING btree (journal_id);


--
-- Name: index_design_colors_on_variable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_design_colors_on_variable ON public.design_colors USING btree (variable);


--
-- Name: index_documents_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_documents_on_category_id ON public.documents USING btree (category_id);


--
-- Name: index_documents_on_created_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_documents_on_created_on ON public.documents USING btree (created_on);


--
-- Name: index_enabled_modules_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_enabled_modules_on_name ON public.enabled_modules USING btree (name);


--
-- Name: index_enumerations_on_color_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_enumerations_on_color_id ON public.enumerations USING btree (color_id);


--
-- Name: index_enumerations_on_id_and_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_enumerations_on_id_and_type ON public.enumerations USING btree (id, type);


--
-- Name: index_enumerations_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_enumerations_on_project_id ON public.enumerations USING btree (project_id);


--
-- Name: index_forums_on_last_message_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_forums_on_last_message_id ON public.forums USING btree (last_message_id);


--
-- Name: index_grid_widgets_on_grid_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_grid_widgets_on_grid_id ON public.grid_widgets USING btree (grid_id);


--
-- Name: index_grids_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_grids_on_project_id ON public.grids USING btree (project_id);


--
-- Name: index_grids_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_grids_on_user_id ON public.grids USING btree (user_id);


--
-- Name: index_journals_on_activity_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_journals_on_activity_type ON public.journals USING btree (activity_type);


--
-- Name: index_journals_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_journals_on_created_at ON public.journals USING btree (created_at);


--
-- Name: index_journals_on_journable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_journals_on_journable_id ON public.journals USING btree (journable_id);


--
-- Name: index_journals_on_journable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_journals_on_journable_type ON public.journals USING btree (journable_type);


--
-- Name: index_journals_on_journable_type_and_journable_id_and_version; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_journals_on_journable_type_and_journable_id_and_version ON public.journals USING btree (journable_type, journable_id, version);


--
-- Name: index_journals_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_journals_on_user_id ON public.journals USING btree (user_id);


--
-- Name: index_ldap_groups_memberships_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ldap_groups_memberships_on_group_id ON public.ldap_groups_memberships USING btree (group_id);


--
-- Name: index_ldap_groups_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ldap_groups_memberships_on_user_id ON public.ldap_groups_memberships USING btree (user_id);


--
-- Name: index_ldap_groups_synchronized_groups_on_auth_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ldap_groups_synchronized_groups_on_auth_source_id ON public.ldap_groups_synchronized_groups USING btree (auth_source_id);


--
-- Name: index_ldap_groups_synchronized_groups_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ldap_groups_synchronized_groups_on_group_id ON public.ldap_groups_synchronized_groups USING btree (group_id);


--
-- Name: index_meetings_on_project_id_and_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_meetings_on_project_id_and_updated_at ON public.meetings USING btree (project_id, updated_at);


--
-- Name: index_member_roles_on_inherited_from; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_member_roles_on_inherited_from ON public.member_roles USING btree (inherited_from);


--
-- Name: index_member_roles_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_member_roles_on_member_id ON public.member_roles USING btree (member_id);


--
-- Name: index_member_roles_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_member_roles_on_role_id ON public.member_roles USING btree (role_id);


--
-- Name: index_members_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_members_on_project_id ON public.members USING btree (project_id);


--
-- Name: index_members_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_members_on_user_id ON public.members USING btree (user_id);


--
-- Name: index_members_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_members_on_user_id_and_project_id ON public.members USING btree (user_id, project_id);


--
-- Name: index_menu_items_on_navigatable_id_and_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_menu_items_on_navigatable_id_and_title ON public.menu_items USING btree (navigatable_id, title);


--
-- Name: index_menu_items_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_menu_items_on_parent_id ON public.menu_items USING btree (parent_id);


--
-- Name: index_message_journals_on_journal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_message_journals_on_journal_id ON public.message_journals USING btree (journal_id);


--
-- Name: index_messages_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_author_id ON public.messages USING btree (author_id);


--
-- Name: index_messages_on_created_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_created_on ON public.messages USING btree (created_on);


--
-- Name: index_messages_on_forum_id_and_updated_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_forum_id_and_updated_on ON public.messages USING btree (forum_id, updated_on);


--
-- Name: index_messages_on_last_reply_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_last_reply_id ON public.messages USING btree (last_reply_id);


--
-- Name: index_news_journals_on_journal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_news_journals_on_journal_id ON public.news_journals USING btree (journal_id);


--
-- Name: index_news_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_news_on_author_id ON public.news USING btree (author_id);


--
-- Name: index_news_on_created_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_news_on_created_on ON public.news USING btree (created_on);


--
-- Name: index_news_on_project_id_and_created_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_news_on_project_id_and_created_on ON public.news USING btree (project_id, created_on);


--
-- Name: index_oauth_access_grants_on_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_grants_on_application_id ON public.oauth_access_grants USING btree (application_id);


--
-- Name: index_oauth_access_grants_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_grants_on_resource_owner_id ON public.oauth_access_grants USING btree (resource_owner_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_application_id ON public.oauth_access_tokens USING btree (application_id);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_owner_id_and_owner_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_applications_on_owner_id_and_owner_type ON public.oauth_applications USING btree (owner_id, owner_type);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_ordered_work_packages_on_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ordered_work_packages_on_position ON public.ordered_work_packages USING btree ("position");


--
-- Name: index_ordered_work_packages_on_query_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ordered_work_packages_on_query_id ON public.ordered_work_packages USING btree (query_id);


--
-- Name: index_ordered_work_packages_on_work_package_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ordered_work_packages_on_work_package_id ON public.ordered_work_packages USING btree (work_package_id);


--
-- Name: index_plaintext_tokens_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_plaintext_tokens_on_user_id ON public.plaintext_tokens USING btree (user_id);


--
-- Name: index_principal_roles_on_principal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_principal_roles_on_principal_id ON public.principal_roles USING btree (principal_id);


--
-- Name: index_principal_roles_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_principal_roles_on_role_id ON public.principal_roles USING btree (role_id);


--
-- Name: index_project_associations_on_project_a_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_associations_on_project_a_id ON public.project_associations USING btree (project_a_id);


--
-- Name: index_project_associations_on_project_b_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_associations_on_project_b_id ON public.project_associations USING btree (project_b_id);


--
-- Name: index_projects_on_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_identifier ON public.projects USING btree (identifier);


--
-- Name: index_projects_on_lft; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_lft ON public.projects USING btree (lft);


--
-- Name: index_projects_on_rgt; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_rgt ON public.projects USING btree (rgt);


--
-- Name: index_queries_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_queries_on_project_id ON public.queries USING btree (project_id);


--
-- Name: index_queries_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_queries_on_updated_at ON public.queries USING btree (updated_at);


--
-- Name: index_queries_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_queries_on_user_id ON public.queries USING btree (user_id);


--
-- Name: index_relations_direct_non_hierarchy; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_direct_non_hierarchy ON public.relations USING btree (from_id) WHERE ((((((((hierarchy + relates) + duplicates) + follows) + blocks) + includes) + requires) = 1) AND (hierarchy = 0));


--
-- Name: index_relations_hierarchy_follows_scheduling; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_hierarchy_follows_scheduling ON public.relations USING btree (to_id, hierarchy, follows, from_id) WHERE ((relates = 0) AND (duplicates = 0) AND (blocks = 0) AND (includes = 0) AND (requires = 0) AND (((((((hierarchy + relates) + duplicates) + follows) + blocks) + includes) + requires) > 0));


--
-- Name: index_relations_on_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_count ON public.relations USING btree (count) WHERE (count = 0);


--
-- Name: index_relations_on_from_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_from_id ON public.relations USING btree (from_id);


--
-- Name: index_relations_on_to_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_to_id ON public.relations USING btree (to_id);


--
-- Name: index_relations_on_type_columns; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_relations_on_type_columns ON public.relations USING btree (from_id, to_id, hierarchy, relates, duplicates, blocks, follows, includes, requires);


--
-- Name: index_relations_only_hierarchy; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_only_hierarchy ON public.relations USING btree (from_id, to_id, hierarchy) WHERE ((relates = 0) AND (duplicates = 0) AND (follows = 0) AND (blocks = 0) AND (includes = 0) AND (requires = 0));


--
-- Name: index_relations_to_from_only_follows; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_to_from_only_follows ON public.relations USING btree (to_id, follows, from_id) WHERE ((hierarchy = 0) AND (relates = 0) AND (duplicates = 0) AND (blocks = 0) AND (includes = 0) AND (requires = 0));


--
-- Name: index_repositories_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_repositories_on_project_id ON public.repositories USING btree (project_id);


--
-- Name: index_role_permissions_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_role_permissions_on_role_id ON public.role_permissions USING btree (role_id);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_on_session_id ON public.sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sessions_on_updated_at ON public.sessions USING btree (updated_at);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_settings_on_name ON public.settings USING btree (name);


--
-- Name: index_statuses_on_color_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_statuses_on_color_id ON public.statuses USING btree (color_id);


--
-- Name: index_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_statuses_on_is_closed ON public.statuses USING btree (is_closed);


--
-- Name: index_statuses_on_is_default; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_statuses_on_is_default ON public.statuses USING btree (is_default);


--
-- Name: index_statuses_on_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_statuses_on_position ON public.statuses USING btree ("position");


--
-- Name: index_time_entries_on_activity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_time_entries_on_activity_id ON public.time_entries USING btree (activity_id);


--
-- Name: index_time_entries_on_created_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_time_entries_on_created_on ON public.time_entries USING btree (created_on);


--
-- Name: index_time_entries_on_project_id_and_updated_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_time_entries_on_project_id_and_updated_on ON public.time_entries USING btree (project_id, updated_on);


--
-- Name: index_time_entries_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_time_entries_on_user_id ON public.time_entries USING btree (user_id);


--
-- Name: index_time_entry_journals_on_journal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_time_entry_journals_on_journal_id ON public.time_entry_journals USING btree (journal_id);


--
-- Name: index_tokens_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tokens_on_user_id ON public.tokens USING btree (user_id);


--
-- Name: index_two_factor_authentication_devices_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_two_factor_authentication_devices_on_user_id ON public.two_factor_authentication_devices USING btree (user_id);


--
-- Name: index_types_on_color_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_types_on_color_id ON public.types USING btree (color_id);


--
-- Name: index_user_passwords_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_passwords_on_user_id ON public.user_passwords USING btree (user_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_preferences_on_user_id ON public.user_preferences USING btree (user_id);


--
-- Name: index_users_on_auth_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_auth_source_id ON public.users USING btree (auth_source_id);


--
-- Name: index_users_on_id_and_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_id_and_type ON public.users USING btree (id, type);


--
-- Name: index_users_on_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_type ON public.users USING btree (type);


--
-- Name: index_users_on_type_and_login; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_type_and_login ON public.users USING btree (type, login);


--
-- Name: index_users_on_type_and_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_type_and_status ON public.users USING btree (type, status);


--
-- Name: index_version_settings_on_project_id_and_version_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_version_settings_on_project_id_and_version_id ON public.version_settings USING btree (project_id, version_id);


--
-- Name: index_versions_on_sharing; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_sharing ON public.versions USING btree (sharing);


--
-- Name: index_watchers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchers_on_user_id ON public.watchers USING btree (user_id);


--
-- Name: index_watchers_on_watchable_id_and_watchable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchers_on_watchable_id_and_watchable_type ON public.watchers USING btree (watchable_id, watchable_type);


--
-- Name: index_webhooks_events_on_webhooks_webhook_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_webhooks_events_on_webhooks_webhook_id ON public.webhooks_events USING btree (webhooks_webhook_id);


--
-- Name: index_webhooks_logs_on_webhooks_webhook_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_webhooks_logs_on_webhooks_webhook_id ON public.webhooks_logs USING btree (webhooks_webhook_id);


--
-- Name: index_webhooks_projects_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_webhooks_projects_on_project_id ON public.webhooks_projects USING btree (project_id);


--
-- Name: index_webhooks_projects_on_webhooks_webhook_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_webhooks_projects_on_webhooks_webhook_id ON public.webhooks_projects USING btree (webhooks_webhook_id);


--
-- Name: index_wiki_content_journals_on_journal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wiki_content_journals_on_journal_id ON public.wiki_content_journals USING btree (journal_id);


--
-- Name: index_wiki_contents_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wiki_contents_on_author_id ON public.wiki_contents USING btree (author_id);


--
-- Name: index_wiki_contents_on_page_id_and_updated_on; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wiki_contents_on_page_id_and_updated_on ON public.wiki_contents USING btree (page_id, updated_on);


--
-- Name: index_wiki_pages_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wiki_pages_on_parent_id ON public.wiki_pages USING btree (parent_id);


--
-- Name: index_wiki_pages_on_wiki_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wiki_pages_on_wiki_id ON public.wiki_pages USING btree (wiki_id);


--
-- Name: index_wiki_redirects_on_wiki_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wiki_redirects_on_wiki_id ON public.wiki_redirects USING btree (wiki_id);


--
-- Name: index_work_package_journals_on_journal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_package_journals_on_journal_id ON public.work_package_journals USING btree (journal_id);


--
-- Name: index_work_packages_on_assigned_to_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_assigned_to_id ON public.work_packages USING btree (assigned_to_id);


--
-- Name: index_work_packages_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_author_id ON public.work_packages USING btree (author_id);


--
-- Name: index_work_packages_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_category_id ON public.work_packages USING btree (category_id);


--
-- Name: index_work_packages_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_created_at ON public.work_packages USING btree (created_at);


--
-- Name: index_work_packages_on_fixed_version_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_fixed_version_id ON public.work_packages USING btree (fixed_version_id);


--
-- Name: index_work_packages_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_project_id ON public.work_packages USING btree (project_id);


--
-- Name: index_work_packages_on_project_id_and_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_project_id_and_updated_at ON public.work_packages USING btree (project_id, updated_at);


--
-- Name: index_work_packages_on_responsible_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_responsible_id ON public.work_packages USING btree (responsible_id);


--
-- Name: index_work_packages_on_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_status_id ON public.work_packages USING btree (status_id);


--
-- Name: index_work_packages_on_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_type_id ON public.work_packages USING btree (type_id);


--
-- Name: index_work_packages_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_work_packages_on_updated_at ON public.work_packages USING btree (updated_at);


--
-- Name: index_workflows_on_new_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workflows_on_new_status_id ON public.workflows USING btree (new_status_id);


--
-- Name: index_workflows_on_old_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workflows_on_old_status_id ON public.workflows USING btree (old_status_id);


--
-- Name: index_workflows_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_workflows_on_role_id ON public.workflows USING btree (role_id);


--
-- Name: issue_categories_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX issue_categories_project_id ON public.categories USING btree (project_id);


--
-- Name: messages_board_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX messages_board_id ON public.messages USING btree (forum_id);


--
-- Name: messages_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX messages_parent_id ON public.messages USING btree (parent_id);


--
-- Name: news_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX news_project_id ON public.news USING btree (project_id);


--
-- Name: projects_types_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX projects_types_project_id ON public.projects_types USING btree (project_id);


--
-- Name: projects_types_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX projects_types_unique ON public.projects_types USING btree (project_id, type_id);


--
-- Name: time_entries_issue_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX time_entries_issue_id ON public.time_entries USING btree (work_package_id);


--
-- Name: time_entries_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX time_entries_project_id ON public.time_entries USING btree (project_id);


--
-- Name: versions_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX versions_project_id ON public.versions USING btree (project_id);


--
-- Name: watchers_user_id_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX watchers_user_id_type ON public.watchers USING btree (user_id, watchable_type);


--
-- Name: wiki_contents_page_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wiki_contents_page_id ON public.wiki_contents USING btree (page_id);


--
-- Name: wiki_pages_wiki_id_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX wiki_pages_wiki_id_slug ON public.wiki_pages USING btree (wiki_id, slug);


--
-- Name: wiki_pages_wiki_id_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wiki_pages_wiki_id_title ON public.wiki_pages USING btree (wiki_id, title);


--
-- Name: wiki_redirects_wiki_id_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wiki_redirects_wiki_id_title ON public.wiki_redirects USING btree (wiki_id, title);


--
-- Name: wikis_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wikis_project_id ON public.wikis USING btree (project_id);


--
-- Name: wkfs_role_type_old_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX wkfs_role_type_old_status ON public.workflows USING btree (role_id, type_id, old_status_id);


--
-- Name: work_package_journal_on_burndown_attributes; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX work_package_journal_on_burndown_attributes ON public.work_package_journals USING btree (fixed_version_id, status_id, project_id, type_id);


--
-- Name: two_factor_authentication_devices fk_rails_0b09e132e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.two_factor_authentication_devices
    ADD CONSTRAINT fk_rails_0b09e132e7 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: oauth_applications fk_rails_3d1f3b58d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT fk_rails_3d1f3b58d2 FOREIGN KEY (client_credentials_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: webhooks_logs fk_rails_551257cdac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_logs
    ADD CONSTRAINT fk_rails_551257cdac FOREIGN KEY (webhooks_webhook_id) REFERENCES public.webhooks_webhooks(id) ON DELETE CASCADE;


--
-- Name: oauth_access_tokens fk_rails_732cb83ab7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_732cb83ab7 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: webhooks_events fk_rails_a166925c91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_events
    ADD CONSTRAINT fk_rails_a166925c91 FOREIGN KEY (webhooks_webhook_id) REFERENCES public.webhooks_webhooks(id);


--
-- Name: oauth_access_grants fk_rails_b4b53e07b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_b4b53e07b8 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: oauth_applications fk_rails_cc886e315a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT fk_rails_cc886e315a FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: webhooks_projects fk_rails_d7ea5de5b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_projects
    ADD CONSTRAINT fk_rails_d7ea5de5b8 FOREIGN KEY (webhooks_webhook_id) REFERENCES public.webhooks_webhooks(id);


--
-- Name: webhooks_projects fk_rails_e978b5e3d7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_projects
    ADD CONSTRAINT fk_rails_e978b5e3d7 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: ordered_work_packages fk_rails_e99c4d5dfe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ordered_work_packages
    ADD CONSTRAINT fk_rails_e99c4d5dfe FOREIGN KEY (query_id) REFERENCES public.queries(id) ON DELETE CASCADE;


--
-- Name: ordered_work_packages fk_rails_fe038e4e03; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ordered_work_packages
    ADD CONSTRAINT fk_rails_fe038e4e03 FOREIGN KEY (work_package_id) REFERENCES public.work_packages(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('10000000000000'),
('20100528100562'),
('20120214103300'),
('20130214130336'),
('20140113132617'),
('20140129103924'),
('20140207134248'),
('20160331190036'),
('20170703075208'),
('20170705134348'),
('20170818063404'),
('20170829095701'),
('20171023190036'),
('20171106074835'),
('20171129145631'),
('20171218205557'),
('20171219145752'),
('20180105130053'),
('20180108132929'),
('20180116065518'),
('20180117065255'),
('20180122135443'),
('20180123092002'),
('20180125082205'),
('20180213155320'),
('20180221151038'),
('20180305130811'),
('20180323130704'),
('20180323130808'),
('20180323133404'),
('20180323135408'),
('20180323140208'),
('20180323151208'),
('20180419061910'),
('20180504144320'),
('20180510184732'),
('20180518130559'),
('20180524084654'),
('20180524113516'),
('20180706150714'),
('20180717102331'),
('20180801072018'),
('20180830120550'),
('20180903110212'),
('20180924141838'),
('20181101132712'),
('20181112125034'),
('20181118193730'),
('20181121174153'),
('20190124081710'),
('20190129083842'),
('20190205090102'),
('20190207155607'),
('20190220080647'),
('20190227163226'),
('20190301122554'),
('20190312083304'),
('20190411122815'),
('20190502102512'),
('20190507132517'),
('20190509071101'),
('20190527095959'),
('20190603060951'),
('20190618115620'),
('20190619143049'),
('20190716071941');


