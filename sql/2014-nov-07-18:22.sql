--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO daiech;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO daiech;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO daiech;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO daiech;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO daiech;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO daiech;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO daiech;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO daiech;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO daiech;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO daiech;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO daiech;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO daiech;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cms_aliaspluginmodel; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_aliaspluginmodel (
    cmsplugin_ptr_id integer NOT NULL,
    plugin_id integer,
    alias_placeholder_id integer
);


ALTER TABLE public.cms_aliaspluginmodel OWNER TO daiech;

--
-- Name: cms_cmsplugin; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_cmsplugin (
    id integer NOT NULL,
    placeholder_id integer,
    parent_id integer,
    "position" smallint,
    language character varying(15) NOT NULL,
    plugin_type character varying(50) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    CONSTRAINT cms_cmsplugin_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_cmsplugin_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_cmsplugin_position_check CHECK (("position" >= 0)),
    CONSTRAINT cms_cmsplugin_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_cmsplugin_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_cmsplugin OWNER TO daiech;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_cmsplugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsplugin_id_seq OWNER TO daiech;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_cmsplugin_id_seq OWNED BY cms_cmsplugin.id;


--
-- Name: cms_globalpagepermission; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_globalpagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    can_recover_page boolean NOT NULL
);


ALTER TABLE public.cms_globalpagepermission OWNER TO daiech;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_globalpagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_id_seq OWNER TO daiech;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_globalpagepermission_id_seq OWNED BY cms_globalpagepermission.id;


--
-- Name: cms_globalpagepermission_sites; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_globalpagepermission_sites (
    id integer NOT NULL,
    globalpagepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.cms_globalpagepermission_sites OWNER TO daiech;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_globalpagepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_sites_id_seq OWNER TO daiech;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_globalpagepermission_sites_id_seq OWNED BY cms_globalpagepermission_sites.id;


--
-- Name: cms_page; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_page (
    id integer NOT NULL,
    created_by character varying(70) NOT NULL,
    changed_by character varying(70) NOT NULL,
    parent_id integer,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    publication_date timestamp with time zone,
    publication_end_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    soft_root boolean NOT NULL,
    reverse_id character varying(40),
    navigation_extenders character varying(80),
    template character varying(100) NOT NULL,
    site_id integer NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    login_required boolean NOT NULL,
    limit_visibility_in_menu smallint,
    publisher_is_draft boolean NOT NULL,
    publisher_public_id integer,
    revision_id integer NOT NULL,
    application_urls character varying(200),
    application_namespace character varying(200),
    is_home boolean NOT NULL,
    languages character varying(255),
    xframe_options integer NOT NULL,
    CONSTRAINT ck_revision_id_pstv_217412272bc9414b CHECK ((revision_id >= 0)),
    CONSTRAINT cms_page_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_page_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_page_revision_id_check CHECK ((revision_id >= 0)),
    CONSTRAINT cms_page_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_page_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_page OWNER TO daiech;

--
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_id_seq OWNER TO daiech;

--
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_page_id_seq OWNED BY cms_page.id;


--
-- Name: cms_page_placeholders; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_page_placeholders (
    id integer NOT NULL,
    page_id integer NOT NULL,
    placeholder_id integer NOT NULL
);


ALTER TABLE public.cms_page_placeholders OWNER TO daiech;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_page_placeholders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_placeholders_id_seq OWNER TO daiech;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_page_placeholders_id_seq OWNED BY cms_page_placeholders.id;


--
-- Name: cms_pagepermission; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_pagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_view boolean NOT NULL,
    grant_on integer NOT NULL,
    page_id integer
);


ALTER TABLE public.cms_pagepermission OWNER TO daiech;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_pagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagepermission_id_seq OWNER TO daiech;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_pagepermission_id_seq OWNED BY cms_pagepermission.id;


--
-- Name: cms_pageuser; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_pageuser (
    user_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageuser OWNER TO daiech;

--
-- Name: cms_pageusergroup; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_pageusergroup (
    group_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageusergroup OWNER TO daiech;

--
-- Name: cms_placeholder; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_placeholder (
    id integer NOT NULL,
    slot character varying(255) NOT NULL,
    default_width smallint,
    CONSTRAINT cms_placeholder_default_width_check CHECK ((default_width >= 0))
);


ALTER TABLE public.cms_placeholder OWNER TO daiech;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_placeholder_id_seq OWNER TO daiech;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_placeholder_id_seq OWNED BY cms_placeholder.id;


--
-- Name: cms_placeholderreference; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_placeholderreference (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(255) NOT NULL,
    placeholder_ref_id integer
);


ALTER TABLE public.cms_placeholderreference OWNER TO daiech;

--
-- Name: cms_staticplaceholder; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_staticplaceholder (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    draft_id integer,
    public_id integer,
    dirty boolean NOT NULL,
    creation_method character varying(20) NOT NULL,
    site_id integer
);


ALTER TABLE public.cms_staticplaceholder OWNER TO daiech;

--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_staticplaceholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_staticplaceholder_id_seq OWNER TO daiech;

--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_staticplaceholder_id_seq OWNED BY cms_staticplaceholder.id;


--
-- Name: cms_title; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_title (
    id integer NOT NULL,
    language character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    menu_title character varying(255),
    slug character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    has_url_overwrite boolean NOT NULL,
    redirect character varying(255),
    meta_description text,
    page_title character varying(255),
    page_id integer NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    published boolean NOT NULL,
    publisher_is_draft boolean NOT NULL,
    publisher_public_id integer,
    publisher_state smallint NOT NULL
);


ALTER TABLE public.cms_title OWNER TO daiech;

--
-- Name: cms_title_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_title_id_seq OWNER TO daiech;

--
-- Name: cms_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_title_id_seq OWNED BY cms_title.id;


--
-- Name: cms_usersettings; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cms_usersettings (
    id integer NOT NULL,
    user_id integer NOT NULL,
    language character varying(10) NOT NULL,
    clipboard_id integer
);


ALTER TABLE public.cms_usersettings OWNER TO daiech;

--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cms_usersettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_usersettings_id_seq OWNER TO daiech;

--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cms_usersettings_id_seq OWNED BY cms_usersettings.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO daiech;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO daiech;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO daiech;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO daiech;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO daiech;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO daiech;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO daiech;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: djangocms-css-background_cssbackground; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE "djangocms-css-background_cssbackground" (
    cmsplugin_ptr_id integer NOT NULL,
    bg_type character varying(5) NOT NULL,
    image_id integer,
    r integer NOT NULL,
    g integer NOT NULL,
    b integer NOT NULL,
    a integer NOT NULL
);


ALTER TABLE public."djangocms-css-background_cssbackground" OWNER TO daiech;

--
-- Name: djangocms_column_column; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_column_column (
    cmsplugin_ptr_id integer NOT NULL,
    width character varying(50) NOT NULL
);


ALTER TABLE public.djangocms_column_column OWNER TO daiech;

--
-- Name: djangocms_column_multicolumns; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_column_multicolumns (
    cmsplugin_ptr_id integer NOT NULL
);


ALTER TABLE public.djangocms_column_multicolumns OWNER TO daiech;

--
-- Name: djangocms_file_file; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_file_file (
    cmsplugin_ptr_id integer NOT NULL,
    file character varying(100) NOT NULL,
    title character varying(255),
    target character varying(100) NOT NULL
);


ALTER TABLE public.djangocms_file_file OWNER TO daiech;

--
-- Name: djangocms_flash_flash; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_flash_flash (
    cmsplugin_ptr_id integer NOT NULL,
    file character varying(100) NOT NULL,
    width character varying(6) NOT NULL,
    height character varying(6) NOT NULL
);


ALTER TABLE public.djangocms_flash_flash OWNER TO daiech;

--
-- Name: djangocms_googlemap_googlemap; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_googlemap_googlemap (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(100),
    address character varying(150) NOT NULL,
    zipcode character varying(30) NOT NULL,
    city character varying(100) NOT NULL,
    content character varying(255) NOT NULL,
    zoom smallint NOT NULL,
    lat numeric(10,6),
    lng numeric(10,6),
    route_planer_title character varying(150),
    route_planer boolean NOT NULL,
    width character varying(6) NOT NULL,
    height character varying(6) NOT NULL,
    info_window boolean NOT NULL,
    scrollwheel boolean NOT NULL,
    double_click_zoom boolean NOT NULL,
    draggable boolean NOT NULL,
    keyboard_shortcuts boolean NOT NULL,
    pan_control boolean NOT NULL,
    zoom_control boolean NOT NULL,
    street_view_control boolean NOT NULL,
    CONSTRAINT djangocms_googlemap_googlemap_zoom_check CHECK ((zoom >= 0))
);


ALTER TABLE public.djangocms_googlemap_googlemap OWNER TO daiech;

--
-- Name: djangocms_inherit_inheritpageplaceholder; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_inherit_inheritpageplaceholder (
    cmsplugin_ptr_id integer NOT NULL,
    from_page_id integer,
    from_language character varying(5)
);


ALTER TABLE public.djangocms_inherit_inheritpageplaceholder OWNER TO daiech;

--
-- Name: djangocms_link_link; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_link_link (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(256) NOT NULL,
    url character varying(200),
    page_link_id integer,
    mailto character varying(75),
    target character varying(100) NOT NULL,
    phone character varying(40),
    anchor character varying(128) NOT NULL
);


ALTER TABLE public.djangocms_link_link OWNER TO daiech;

--
-- Name: djangocms_picture_picture; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_picture_picture (
    cmsplugin_ptr_id integer NOT NULL,
    image character varying(100) NOT NULL,
    url character varying(255),
    page_link_id integer,
    alt character varying(255),
    longdesc character varying(255),
    "float" character varying(10)
);


ALTER TABLE public.djangocms_picture_picture OWNER TO daiech;

--
-- Name: djangocms_style_style; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_style_style (
    cmsplugin_ptr_id integer NOT NULL,
    class_name character varying(50),
    padding_left smallint,
    padding_right smallint,
    padding_top smallint,
    padding_bottom smallint,
    margin_left smallint,
    margin_right smallint,
    margin_top smallint,
    margin_bottom smallint,
    tag_type character varying(50) NOT NULL,
    additional_classes character varying(200) NOT NULL
);


ALTER TABLE public.djangocms_style_style OWNER TO daiech;

--
-- Name: djangocms_teaser_teaser; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_teaser_teaser (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(100),
    page_link_id integer,
    url character varying(255),
    description text
);


ALTER TABLE public.djangocms_teaser_teaser OWNER TO daiech;

--
-- Name: djangocms_text_ckeditor_text; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_text_ckeditor_text (
    cmsplugin_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.djangocms_text_ckeditor_text OWNER TO daiech;

--
-- Name: djangocms_video_video; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE djangocms_video_video (
    cmsplugin_ptr_id integer NOT NULL,
    movie character varying(100),
    movie_url character varying(255),
    image character varying(100),
    width smallint NOT NULL,
    height smallint NOT NULL,
    auto_play boolean NOT NULL,
    auto_hide boolean NOT NULL,
    fullscreen boolean NOT NULL,
    loop boolean NOT NULL,
    bgcolor character varying(6) NOT NULL,
    textcolor character varying(6) NOT NULL,
    seekbarcolor character varying(6) NOT NULL,
    seekbarbgcolor character varying(6) NOT NULL,
    loadingbarcolor character varying(6) NOT NULL,
    buttonoutcolor character varying(6) NOT NULL,
    buttonovercolor character varying(6) NOT NULL,
    buttonhighlightcolor character varying(6) NOT NULL,
    CONSTRAINT djangocms_video_video_height_check CHECK ((height >= 0)),
    CONSTRAINT djangocms_video_video_width_check CHECK ((width >= 0))
);


ALTER TABLE public.djangocms_video_video OWNER TO daiech;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    storage_hash character varying(40) NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO daiech;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO daiech;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL,
    storage_hash character varying(40) NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO daiech;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO daiech;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO daiech;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO daiech;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: filer_clipboard; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE filer_clipboard (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.filer_clipboard OWNER TO daiech;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE filer_clipboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_clipboard_id_seq OWNER TO daiech;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE filer_clipboard_id_seq OWNED BY filer_clipboard.id;


--
-- Name: filer_clipboarditem; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE filer_clipboarditem (
    id integer NOT NULL,
    file_id integer NOT NULL,
    clipboard_id integer NOT NULL
);


ALTER TABLE public.filer_clipboarditem OWNER TO daiech;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE filer_clipboarditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_clipboarditem_id_seq OWNER TO daiech;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE filer_clipboarditem_id_seq OWNED BY filer_clipboarditem.id;


--
-- Name: filer_file; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE filer_file (
    id integer NOT NULL,
    folder_id integer,
    file character varying(255),
    _file_size integer,
    has_all_mandatory_data boolean NOT NULL,
    original_filename character varying(255),
    name character varying(255) NOT NULL,
    owner_id integer,
    uploaded_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    description text,
    is_public boolean NOT NULL,
    sha1 character varying(40) NOT NULL,
    polymorphic_ctype_id integer
);


ALTER TABLE public.filer_file OWNER TO daiech;

--
-- Name: filer_file_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE filer_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_file_id_seq OWNER TO daiech;

--
-- Name: filer_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE filer_file_id_seq OWNED BY filer_file.id;


--
-- Name: filer_folder; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE filer_folder (
    id integer NOT NULL,
    parent_id integer,
    name character varying(255) NOT NULL,
    owner_id integer,
    uploaded_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    CONSTRAINT filer_folder_level_check CHECK ((level >= 0)),
    CONSTRAINT filer_folder_lft_check CHECK ((lft >= 0)),
    CONSTRAINT filer_folder_rght_check CHECK ((rght >= 0)),
    CONSTRAINT filer_folder_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.filer_folder OWNER TO daiech;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE filer_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_folder_id_seq OWNER TO daiech;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE filer_folder_id_seq OWNED BY filer_folder.id;


--
-- Name: filer_folderpermission; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE filer_folderpermission (
    id integer NOT NULL,
    folder_id integer,
    type smallint NOT NULL,
    user_id integer,
    group_id integer,
    everybody boolean NOT NULL,
    can_edit smallint,
    can_read smallint,
    can_add_children smallint
);


ALTER TABLE public.filer_folderpermission OWNER TO daiech;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE filer_folderpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_folderpermission_id_seq OWNER TO daiech;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE filer_folderpermission_id_seq OWNED BY filer_folderpermission.id;


--
-- Name: filer_image; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE filer_image (
    file_ptr_id integer NOT NULL,
    _height integer,
    _width integer,
    date_taken timestamp with time zone,
    default_alt_text character varying(255),
    default_caption character varying(255),
    author character varying(255),
    must_always_publish_author_credit boolean NOT NULL,
    must_always_publish_copyright boolean NOT NULL,
    subject_location character varying(64)
);


ALTER TABLE public.filer_image OWNER TO daiech;

--
-- Name: menus_cachekey; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE menus_cachekey (
    id integer NOT NULL,
    language character varying(255) NOT NULL,
    site integer NOT NULL,
    key character varying(255) NOT NULL,
    CONSTRAINT menus_cachekey_site_check CHECK ((site >= 0))
);


ALTER TABLE public.menus_cachekey OWNER TO daiech;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE menus_cachekey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_cachekey_id_seq OWNER TO daiech;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE menus_cachekey_id_seq OWNED BY menus_cachekey.id;


--
-- Name: reversion_revision; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE reversion_revision (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_id integer,
    comment text NOT NULL,
    manager_slug character varying(200) NOT NULL
);


ALTER TABLE public.reversion_revision OWNER TO daiech;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE reversion_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_revision_id_seq OWNER TO daiech;

--
-- Name: reversion_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE reversion_revision_id_seq OWNED BY reversion_revision.id;


--
-- Name: reversion_version; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE reversion_version (
    id integer NOT NULL,
    revision_id integer NOT NULL,
    object_id text NOT NULL,
    content_type_id integer NOT NULL,
    format character varying(255) NOT NULL,
    serialized_data text NOT NULL,
    object_repr text NOT NULL,
    object_id_int integer
);


ALTER TABLE public.reversion_version OWNER TO daiech;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE reversion_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reversion_version_id_seq OWNER TO daiech;

--
-- Name: reversion_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE reversion_version_id_seq OWNED BY reversion_version.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO daiech;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO daiech;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_cmsplugin ALTER COLUMN id SET DEFAULT nextval('cms_cmsplugin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_globalpagepermission ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_globalpagepermission_sites ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_page ALTER COLUMN id SET DEFAULT nextval('cms_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_page_placeholders ALTER COLUMN id SET DEFAULT nextval('cms_page_placeholders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_pagepermission ALTER COLUMN id SET DEFAULT nextval('cms_pagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_placeholder ALTER COLUMN id SET DEFAULT nextval('cms_placeholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_staticplaceholder ALTER COLUMN id SET DEFAULT nextval('cms_staticplaceholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_title ALTER COLUMN id SET DEFAULT nextval('cms_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_usersettings ALTER COLUMN id SET DEFAULT nextval('cms_usersettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_clipboard ALTER COLUMN id SET DEFAULT nextval('filer_clipboard_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_clipboarditem ALTER COLUMN id SET DEFAULT nextval('filer_clipboarditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_file ALTER COLUMN id SET DEFAULT nextval('filer_file_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_folder ALTER COLUMN id SET DEFAULT nextval('filer_folder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_folderpermission ALTER COLUMN id SET DEFAULT nextval('filer_folderpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY menus_cachekey ALTER COLUMN id SET DEFAULT nextval('menus_cachekey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY reversion_revision ALTER COLUMN id SET DEFAULT nextval('reversion_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY reversion_version ALTER COLUMN id SET DEFAULT nextval('reversion_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add migration history	8	add_migrationhistory
23	Can change migration history	8	change_migrationhistory
24	Can delete migration history	8	delete_migrationhistory
25	Can add user setting	9	add_usersettings
26	Can change user setting	9	change_usersettings
27	Can delete user setting	9	delete_usersettings
28	Can add placeholder	10	add_placeholder
29	Can change placeholder	10	change_placeholder
30	Can delete placeholder	10	delete_placeholder
31	Can add cms plugin	11	add_cmsplugin
32	Can change cms plugin	11	change_cmsplugin
33	Can delete cms plugin	11	delete_cmsplugin
34	Can add page	12	add_page
35	Can change page	12	change_page
36	Can delete page	12	delete_page
37	Can view page	12	view_page
38	Can publish page	12	publish_page
39	Can edit static placeholders	12	edit_static_placeholder
40	Can add Page global permission	13	add_globalpagepermission
41	Can change Page global permission	13	change_globalpagepermission
42	Can delete Page global permission	13	delete_globalpagepermission
43	Can add Page permission	14	add_pagepermission
44	Can change Page permission	14	change_pagepermission
45	Can delete Page permission	14	delete_pagepermission
46	Can add User (page)	15	add_pageuser
47	Can change User (page)	15	change_pageuser
48	Can delete User (page)	15	delete_pageuser
49	Can add User group (page)	16	add_pageusergroup
50	Can change User group (page)	16	change_pageusergroup
51	Can delete User group (page)	16	delete_pageusergroup
52	Can add title	17	add_title
53	Can change title	17	change_title
54	Can delete title	17	delete_title
55	Can add placeholder reference	18	add_placeholderreference
56	Can change placeholder reference	18	change_placeholderreference
57	Can delete placeholder reference	18	delete_placeholderreference
58	Can add static placeholder	19	add_staticplaceholder
59	Can change static placeholder	19	change_staticplaceholder
60	Can delete static placeholder	19	delete_staticplaceholder
61	Can add alias plugin model	20	add_aliaspluginmodel
62	Can change alias plugin model	20	change_aliaspluginmodel
63	Can delete alias plugin model	20	delete_aliaspluginmodel
64	Can add text	21	add_text
65	Can change text	21	change_text
66	Can delete text	21	delete_text
67	Can add cache key	22	add_cachekey
68	Can change cache key	22	change_cachekey
69	Can delete cache key	22	delete_cachekey
70	Can add style	23	add_style
71	Can change style	23	change_style
72	Can delete style	23	delete_style
73	Can add multi columns	24	add_multicolumns
74	Can change multi columns	24	change_multicolumns
75	Can delete multi columns	24	delete_multicolumns
76	Can add column	25	add_column
77	Can change column	25	change_column
78	Can delete column	25	delete_column
79	Can add file	26	add_file
80	Can change file	26	change_file
81	Can delete file	26	delete_file
82	Can add flash	27	add_flash
83	Can change flash	27	change_flash
84	Can delete flash	27	delete_flash
85	Can add google map	28	add_googlemap
86	Can change google map	28	change_googlemap
87	Can delete google map	28	delete_googlemap
88	Can add inherit page placeholder	29	add_inheritpageplaceholder
89	Can change inherit page placeholder	29	change_inheritpageplaceholder
90	Can delete inherit page placeholder	29	delete_inheritpageplaceholder
91	Can add link	30	add_link
92	Can change link	30	change_link
93	Can delete link	30	delete_link
94	Can add picture	31	add_picture
95	Can change picture	31	change_picture
96	Can delete picture	31	delete_picture
97	Can add teaser	32	add_teaser
98	Can change teaser	32	change_teaser
99	Can delete teaser	32	delete_teaser
100	Can add video	33	add_video
101	Can change video	33	change_video
102	Can delete video	33	delete_video
103	Can add revision	34	add_revision
104	Can change revision	34	change_revision
105	Can delete revision	34	delete_revision
106	Can add version	35	add_version
107	Can change version	35	change_version
108	Can delete version	35	delete_version
109	Can add css background	36	add_cssbackground
110	Can change css background	36	change_cssbackground
111	Can delete css background	36	delete_cssbackground
112	Can add Folder	37	add_folder
113	Can change Folder	37	change_folder
114	Can delete Folder	37	delete_folder
115	Can use directory listing	37	can_use_directory_listing
116	Can add folder permission	38	add_folderpermission
117	Can change folder permission	38	change_folderpermission
118	Can delete folder permission	38	delete_folderpermission
119	Can add file	39	add_file
120	Can change file	39	change_file
121	Can delete file	39	delete_file
122	Can add clipboard	40	add_clipboard
123	Can change clipboard	40	change_clipboard
124	Can delete clipboard	40	delete_clipboard
125	Can add clipboard item	41	add_clipboarditem
126	Can change clipboard item	41	change_clipboarditem
127	Can delete clipboard item	41	delete_clipboarditem
128	Can add image	42	add_image
129	Can change image	42	change_image
130	Can delete image	42	delete_image
131	Can add source	43	add_source
132	Can change source	43	change_source
133	Can delete source	43	delete_source
134	Can add thumbnail	44	add_thumbnail
135	Can change thumbnail	44	change_thumbnail
136	Can delete thumbnail	44	delete_thumbnail
137	Can add thumbnail dimensions	45	add_thumbnaildimensions
138	Can change thumbnail dimensions	45	change_thumbnaildimensions
139	Can delete thumbnail dimensions	45	delete_thumbnaildimensions
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('auth_permission_id_seq', 139, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$aB9o9RyoNQnZ$5tdKcbsoLTAzznqRVgf+PHw/nuT6yJgMugcYU9WC4NQ=	2014-11-07 18:12:42.290674-05	t	admin				t	t	2014-11-06 15:20:01.743865-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cms_aliaspluginmodel; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_aliaspluginmodel (cmsplugin_ptr_id, plugin_id, alias_placeholder_id) FROM stdin;
\.


--
-- Data for Name: cms_cmsplugin; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_cmsplugin (id, placeholder_id, parent_id, "position", language, plugin_type, creation_date, changed_date, level, lft, rght, tree_id) FROM stdin;
1	4	\N	0	es	CssBackgroundPlugIn	2014-11-06 16:14:34.907012-05	2014-11-06 16:15:57.996912-05	0	1	2	1
17	5	\N	1	es	StylePlugin	2014-11-07 18:13:15.507002-05	2014-11-07 18:16:36.792984-05	0	1	2	3
18	5	\N	0	es	TextPlugin	2014-11-07 18:13:50.764039-05	2014-11-07 18:16:36.809257-05	0	1	2	4
19	10	\N	0	es	CssBackgroundPlugIn	2014-11-06 16:14:34.907012-05	2014-11-07 18:23:04.108626-05	0	1	2	5
20	11	\N	1	es	StylePlugin	2014-11-07 18:13:15.507002-05	2014-11-07 18:23:04.125201-05	0	1	2	6
21	11	\N	0	es	TextPlugin	2014-11-07 18:13:50.764039-05	2014-11-07 18:23:04.154225-05	0	1	2	7
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 21, true);


--
-- Data for Name: cms_globalpagepermission; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_globalpagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, can_recover_page) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_globalpagepermission_id_seq', 1, false);


--
-- Data for Name: cms_globalpagepermission_sites; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_globalpagepermission_sites (id, globalpagepermission_id, site_id) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_globalpagepermission_sites_id_seq', 1, false);


--
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_page (id, created_by, changed_by, parent_id, creation_date, changed_date, publication_date, publication_end_date, in_navigation, soft_root, reverse_id, navigation_extenders, template, site_id, level, lft, rght, tree_id, login_required, limit_visibility_in_menu, publisher_is_draft, publisher_public_id, revision_id, application_urls, application_namespace, is_home, languages, xframe_options) FROM stdin;
2	admin	admin	\N	2014-11-06 15:22:57.819562-05	2014-11-07 18:23:04.188617-05	2014-11-06 15:22:57.810225-05	\N	t	f	\N	\N	INHERIT	1	0	1	2	2	f	\N	f	1	0	\N	\N	t	es	0
1	admin	admin	\N	2014-11-06 15:22:57.712077-05	2014-11-07 18:23:04.301759-05	2014-11-06 15:22:57.810225-05	\N	t	f	\N	\N	INHERIT	1	0	1	2	1	f	\N	t	2	0	\N	\N	t	es	0
\.


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_page_id_seq', 2, true);


--
-- Data for Name: cms_page_placeholders; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_page_placeholders (id, page_id, placeholder_id) FROM stdin;
1	1	2
2	2	3
3	1	4
4	1	5
5	1	6
6	1	7
7	2	10
8	2	11
9	2	12
10	2	13
\.


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_page_placeholders_id_seq', 10, true);


--
-- Data for Name: cms_pagepermission; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_pagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_view, grant_on, page_id) FROM stdin;
\.


--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_pagepermission_id_seq', 1, false);


--
-- Data for Name: cms_pageuser; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_pageuser (user_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_pageusergroup; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_pageusergroup (group_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_placeholder; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_placeholder (id, slot, default_width) FROM stdin;
1	clipboard	\N
2	content	\N
3	content	\N
4	home	\N
5	benefits	\N
6	sectors	\N
7	contact	\N
8	footer	\N
9	footer	\N
10	home	\N
11	benefits	\N
12	sectors	\N
13	contact	\N
\.


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_placeholder_id_seq', 13, true);


--
-- Data for Name: cms_placeholderreference; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_placeholderreference (cmsplugin_ptr_id, name, placeholder_ref_id) FROM stdin;
\.


--
-- Data for Name: cms_staticplaceholder; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_staticplaceholder (id, name, code, draft_id, public_id, dirty, creation_method, site_id) FROM stdin;
1	footer	footer	8	9	f	template	\N
\.


--
-- Name: cms_staticplaceholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_staticplaceholder_id_seq', 1, true);


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_title (id, language, title, menu_title, slug, path, has_url_overwrite, redirect, meta_description, page_title, page_id, creation_date, published, publisher_is_draft, publisher_public_id, publisher_state) FROM stdin;
2	es	Inicio	Inicio	inicio		f	\N	Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft	Inicio	2	2014-11-06 15:22:57.76243-05	t	f	1	1
1	es	Inicio	Inicio	inicio		f	\N	Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft	Inicio	1	2014-11-06 15:22:57.76243-05	t	t	2	0
\.


--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_title_id_seq', 2, true);


--
-- Data for Name: cms_usersettings; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cms_usersettings (id, user_id, language, clipboard_id) FROM stdin;
1	1	es	1
\.


--
-- Name: cms_usersettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_usersettings_id_seq', 1, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-11-06 15:22:58.010781-05	1	12	1	Inicio	1	
2	2014-11-06 17:17:48.364247-05	1	12	6	6	3	
3	2014-11-06 17:23:54.145924-05	1	12	1	Inicio	2	
4	2014-11-06 17:26:40.073926-05	1	12	2	2	3	
5	2014-11-07 18:02:42.999794-05	1	12	1	Inicio	2	
6	2014-11-07 18:23:04.238312-05	1	12	1	Inicio	2	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 6, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	log entry	admin	logentry
7	site	sites	site
8	migration history	south	migrationhistory
9	user setting	cms	usersettings
10	placeholder	cms	placeholder
11	cms plugin	cms	cmsplugin
12	page	cms	page
13	Page global permission	cms	globalpagepermission
14	Page permission	cms	pagepermission
15	User (page)	cms	pageuser
16	User group (page)	cms	pageusergroup
17	title	cms	title
18	placeholder reference	cms	placeholderreference
19	static placeholder	cms	staticplaceholder
20	alias plugin model	cms	aliaspluginmodel
21	text	djangocms_text_ckeditor	text
22	cache key	menus	cachekey
23	style	djangocms_style	style
24	multi columns	djangocms_column	multicolumns
25	column	djangocms_column	column
26	file	djangocms_file	file
27	flash	djangocms_flash	flash
28	google map	djangocms_googlemap	googlemap
29	inherit page placeholder	djangocms_inherit	inheritpageplaceholder
30	link	djangocms_link	link
31	picture	djangocms_picture	picture
32	teaser	djangocms_teaser	teaser
33	video	djangocms_video	video
34	revision	reversion	revision
35	version	reversion	version
36	css background	djangocms-css-background	cssbackground
37	Folder	filer	folder
38	folder permission	filer	folderpermission
39	file	filer	file
40	clipboard	filer	clipboard
41	clipboard item	filer	clipboarditem
42	image	filer	image
43	source	easy_thumbnails	source
44	thumbnail	easy_thumbnails	thumbnail
45	thumbnail dimensions	easy_thumbnails	thumbnaildimensions
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('django_content_type_id_seq', 45, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
tmjgn3qw9jkqu49nc0l9zea9orstvpl7	YTU4YWEyNjQ1YTIyMDMzMTI3YzNiMmM4N2EyOGQ1YzIxNjZhMjljZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiY21zX2VkaXQiOmZhbHNlfQ==	2014-11-21 18:23:04.53718-05
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: djangocms-css-background_cssbackground; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY "djangocms-css-background_cssbackground" (cmsplugin_ptr_id, bg_type, image_id, r, g, b, a) FROM stdin;
1	image	2	0	0	0	0
19	image	2	0	0	0	0
\.


--
-- Data for Name: djangocms_column_column; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_column_column (cmsplugin_ptr_id, width) FROM stdin;
\.


--
-- Data for Name: djangocms_column_multicolumns; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_column_multicolumns (cmsplugin_ptr_id) FROM stdin;
\.


--
-- Data for Name: djangocms_file_file; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_file_file (cmsplugin_ptr_id, file, title, target) FROM stdin;
\.


--
-- Data for Name: djangocms_flash_flash; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_flash_flash (cmsplugin_ptr_id, file, width, height) FROM stdin;
\.


--
-- Data for Name: djangocms_googlemap_googlemap; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_googlemap_googlemap (cmsplugin_ptr_id, title, address, zipcode, city, content, zoom, lat, lng, route_planer_title, route_planer, width, height, info_window, scrollwheel, double_click_zoom, draggable, keyboard_shortcuts, pan_control, zoom_control, street_view_control) FROM stdin;
\.


--
-- Data for Name: djangocms_inherit_inheritpageplaceholder; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_inherit_inheritpageplaceholder (cmsplugin_ptr_id, from_page_id, from_language) FROM stdin;
\.


--
-- Data for Name: djangocms_link_link; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_link_link (cmsplugin_ptr_id, name, url, page_link_id, mailto, target, phone, anchor) FROM stdin;
\.


--
-- Data for Name: djangocms_picture_picture; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_picture_picture (cmsplugin_ptr_id, image, url, page_link_id, alt, longdesc, "float") FROM stdin;
\.


--
-- Data for Name: djangocms_style_style; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_style_style (cmsplugin_ptr_id, class_name, padding_left, padding_right, padding_top, padding_bottom, margin_left, margin_right, margin_top, margin_bottom, tag_type, additional_classes) FROM stdin;
17	info	\N	\N	\N	\N	\N	\N	\N	\N	div	row-fluid, box
20	info	\N	\N	\N	\N	\N	\N	\N	\N	div	row-fluid, box
\.


--
-- Data for Name: djangocms_teaser_teaser; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_teaser_teaser (cmsplugin_ptr_id, title, image, page_link_id, url, description) FROM stdin;
\.


--
-- Data for Name: djangocms_text_ckeditor_text; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_text_ckeditor_text (cmsplugin_ptr_id, body) FROM stdin;
18	<h2 style="text-align: center;">BENEFICIOS</h2>\n
21	<h2 style="text-align: center;">BENEFICIOS</h2>\n
\.


--
-- Data for Name: djangocms_video_video; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY djangocms_video_video (cmsplugin_ptr_id, movie, movie_url, image, width, height, auto_play, auto_hide, fullscreen, loop, bgcolor, textcolor, seekbarcolor, seekbarbgcolor, loadingbarcolor, buttonoutcolor, buttonovercolor, buttonhighlightcolor) FROM stdin;
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY easy_thumbnails_source (id, name, modified, storage_hash) FROM stdin;
1	filer_public/c2/82/c282b5df-22ee-46fa-b92c-4eb5a9633d1e/logo-centro.png	2014-11-06 16:15:47.707096-05	f9bde26a1556cd667f742bd34ec7c55e
2	filer_public/5a/6b/5a6b7854-7713-4c9e-9a0c-ee7ac206288d/pather-1.png	2014-11-06 16:15:47.708133-05	f9bde26a1556cd667f742bd34ec7c55e
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 2, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY easy_thumbnails_thumbnail (id, name, modified, source_id, storage_hash) FROM stdin;
1	filer_public_thumbnails/filer_public/5a/6b/5a6b7854-7713-4c9e-9a0c-ee7ac206288d/pather-1.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-06 16:15:47.721492-05	2	f9bde26a1556cd667f742bd34ec7c55e
2	filer_public_thumbnails/filer_public/c2/82/c282b5df-22ee-46fa-b92c-4eb5a9633d1e/logo-centro.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-06 16:15:47.729755-05	1	f9bde26a1556cd667f742bd34ec7c55e
3	filer_public_thumbnails/filer_public/5a/6b/5a6b7854-7713-4c9e-9a0c-ee7ac206288d/pather-1.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-06 16:15:47.74297-05	2	f9bde26a1556cd667f742bd34ec7c55e
4	filer_public_thumbnails/filer_public/5a/6b/5a6b7854-7713-4c9e-9a0c-ee7ac206288d/pather-1.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-06 16:15:47.775703-05	2	f9bde26a1556cd667f742bd34ec7c55e
5	filer_public_thumbnails/filer_public/5a/6b/5a6b7854-7713-4c9e-9a0c-ee7ac206288d/pather-1.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-06 16:15:47.781733-05	2	f9bde26a1556cd667f742bd34ec7c55e
6	filer_public_thumbnails/filer_public/c2/82/c282b5df-22ee-46fa-b92c-4eb5a9633d1e/logo-centro.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-06 16:15:47.785737-05	1	f9bde26a1556cd667f742bd34ec7c55e
7	filer_public_thumbnails/filer_public/c2/82/c282b5df-22ee-46fa-b92c-4eb5a9633d1e/logo-centro.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-06 16:15:47.8308-05	1	f9bde26a1556cd667f742bd34ec7c55e
8	filer_public_thumbnails/filer_public/c2/82/c282b5df-22ee-46fa-b92c-4eb5a9633d1e/logo-centro.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-06 16:15:47.867034-05	1	f9bde26a1556cd667f742bd34ec7c55e
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 8, true);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: filer_clipboard; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY filer_clipboard (id, user_id) FROM stdin;
1	1
\.


--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('filer_clipboard_id_seq', 1, true);


--
-- Data for Name: filer_clipboarditem; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY filer_clipboarditem (id, file_id, clipboard_id) FROM stdin;
\.


--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('filer_clipboarditem_id_seq', 2, true);


--
-- Data for Name: filer_file; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY filer_file (id, folder_id, file, _file_size, has_all_mandatory_data, original_filename, name, owner_id, uploaded_at, modified_at, description, is_public, sha1, polymorphic_ctype_id) FROM stdin;
1	1	filer_public/c2/82/c282b5df-22ee-46fa-b92c-4eb5a9633d1e/logo-centro.png	57845	f	logo-centro.png		1	2014-11-06 16:15:47.541888-05	2014-11-06 16:15:50.375229-05	\N	t	fd12df0d12104574c9272ae5c2af1f9403d460f0	42
2	1	filer_public/5a/6b/5a6b7854-7713-4c9e-9a0c-ee7ac206288d/pather-1.png	1438	f	pather-1.png		1	2014-11-06 16:15:47.542704-05	2014-11-06 16:15:50.388955-05	\N	t	ff5fd435e6a80e04e3ea914b8b342f8a9445fe8f	42
\.


--
-- Name: filer_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('filer_file_id_seq', 2, true);


--
-- Data for Name: filer_folder; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY filer_folder (id, parent_id, name, owner_id, uploaded_at, created_at, modified_at, lft, rght, tree_id, level) FROM stdin;
1	\N	Home	1	2014-11-06 16:15:11.598689-05	2014-11-06 16:15:11.59873-05	2014-11-06 16:15:11.598752-05	1	2	1	0
\.


--
-- Name: filer_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('filer_folder_id_seq', 1, true);


--
-- Data for Name: filer_folderpermission; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY filer_folderpermission (id, folder_id, type, user_id, group_id, everybody, can_edit, can_read, can_add_children) FROM stdin;
\.


--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('filer_folderpermission_id_seq', 1, false);


--
-- Data for Name: filer_image; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY filer_image (file_ptr_id, _height, _width, date_taken, default_alt_text, default_caption, author, must_always_publish_author_credit, must_always_publish_copyright, subject_location) FROM stdin;
1	319	710	2014-11-06 16:15:47.498531-05	\N	\N	\N	f	f	\N
2	89	87	2014-11-06 16:15:47.533215-05	\N	\N	\N	f	f	\N
\.


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
25	es	1	menu_cache_menu_nodes_es_1_1_user
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 25, true);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY reversion_revision (id, date_created, user_id, comment, manager_slug) FROM stdin;
11	2014-11-06 17:15:46.886427-05	1	Estilo plugin editado en la posición 2 en home	default
12	2014-11-06 17:16:02.993741-05	1	Enlace plugin añadido a home	default
13	2014-11-06 17:16:20.767275-05	1	Enlace plugin editado en la posición 0 en home	default
14	2014-11-06 17:17:48.557011-05	1	Enlace plugin en la posición 0 en home fue eliminado.	default
15	2014-11-06 17:17:58.258134-05	1	Texto plugin añadido a home	default
16	2014-11-06 17:18:30.029854-05	1	Enlace plugin añadido a home	default
17	2014-11-06 17:18:42.365643-05	1	Enlace plugin editado en la posición 0 en home	default
18	2014-11-06 17:18:44.792436-05	1	Texto plugin editado en la posición 0 en home	default
19	2014-11-06 17:23:54.192762-05	1	Publish	default
20	2014-11-06 17:26:40.597745-05	1	Estilo plugin en la posición 1 en home fue eliminado.	default
21	2014-11-07 18:02:43.254754-05	1	Publish	default
22	2014-11-07 18:13:15.568637-05	1	Estilo plugin añadido a benefits	default
23	2014-11-07 18:13:27.280214-05	1	Estilo plugin editado en la posición 0 en benefits	default
24	2014-11-07 18:13:50.832246-05	1	Texto plugin añadido a benefits	default
25	2014-11-07 18:14:06.765983-05	1	Texto plugin editado en la posición 1 en benefits	default
26	2014-11-07 18:16:36.854967-05	1	Los conectores o plugins fueron removidos	default
27	2014-11-07 18:23:04.272074-05	1	Publish	default
\.


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 27, true);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY reversion_version (id, revision_id, object_id, content_type_id, format, serialized_data, object_repr, object_id_int) FROM stdin;
112	11	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
113	11	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:15:43.344Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
114	11	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
115	11	3	23	json	[{"pk": 3, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	3
116	11	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
117	11	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
118	11	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
119	11	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
120	11	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
121	11	2	23	json	[{"pk": 2, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	2
122	11	2	11	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-06T22:13:04.097Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T22:12:53.051Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	2	2
123	11	3	11	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-06T22:15:11.606Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:13:10.349Z", "lft": 2, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "StylePlugin"}}]	3	3
124	11	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
125	11	4	23	json	[{"pk": 4, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	4
126	11	5	23	json	[{"pk": 5, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	5
127	11	4	11	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-06T22:15:38.094Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:24.274Z", "lft": 4, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	4	4
128	11	5	11	json	[{"pk": 5, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-06T22:15:46.808Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:43.190Z", "lft": 6, "tree_id": 2, "position": 2, "placeholder": 4, "plugin_type": "StylePlugin"}}]	5	5
129	12	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
130	12	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:15:46.938Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
131	12	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
132	12	3	23	json	[{"pk": 3, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	3
133	12	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
134	12	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
135	12	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
136	12	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
137	12	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
138	12	2	23	json	[{"pk": 2, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	2
139	12	2	11	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-06T22:13:04.097Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T22:12:53.051Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	2	2
140	12	3	11	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-06T22:15:11.606Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:13:10.349Z", "lft": 2, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "StylePlugin"}}]	3	3
141	12	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
142	12	4	23	json	[{"pk": 4, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	4
143	12	6	11	json	[{"pk": 6, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-06T22:16:02.923Z", "parent": 3, "language": "es", "level": 2, "creation_date": "2014-11-06T22:16:02.816Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "LinkPlugin"}}]	6	6
144	12	5	23	json	[{"pk": 5, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	5
145	12	4	11	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-06T22:15:38.094Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:24.274Z", "lft": 6, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	4	4
146	12	5	11	json	[{"pk": 5, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-11-06T22:15:46.808Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:43.190Z", "lft": 8, "tree_id": 2, "position": 2, "placeholder": 4, "plugin_type": "StylePlugin"}}]	5	5
169	14	3	23	json	[{"pk": 3, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	3
147	13	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
148	13	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:16:03.046Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
149	13	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
150	13	3	23	json	[{"pk": 3, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	3
151	13	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
152	13	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
153	13	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
154	13	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
155	13	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
156	13	2	23	json	[{"pk": 2, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	2
157	13	2	11	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-06T22:13:04.097Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T22:12:53.051Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	2	2
158	13	6	30	json	[{"pk": 6, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Inicio", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Inicio	6
159	13	3	11	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-06T22:15:11.606Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:13:10.349Z", "lft": 2, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "StylePlugin"}}]	3	3
160	13	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
161	13	4	23	json	[{"pk": 4, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	4
162	13	6	11	json	[{"pk": 6, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-06T22:16:20.678Z", "parent": 3, "language": "es", "level": 2, "creation_date": "2014-11-06T22:16:02.816Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "LinkPlugin"}}]	6	6
163	13	5	23	json	[{"pk": 5, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	5
164	13	4	11	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-06T22:15:38.094Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:24.274Z", "lft": 6, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	4	4
165	13	5	11	json	[{"pk": 5, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-11-06T22:15:46.808Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:43.190Z", "lft": 8, "tree_id": 2, "position": 2, "placeholder": 4, "plugin_type": "StylePlugin"}}]	5	5
166	14	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
167	14	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:17:48.478Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
168	14	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
170	14	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
171	14	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
172	14	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
173	14	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
174	14	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
175	14	2	23	json	[{"pk": 2, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	2
176	14	2	11	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-06T22:13:04.097Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T22:12:53.051Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	2	2
177	14	3	11	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-06T22:15:11.606Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:13:10.349Z", "lft": 2, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "StylePlugin"}}]	3	3
178	14	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
179	14	4	23	json	[{"pk": 4, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	4
180	14	5	23	json	[{"pk": 5, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	5
181	14	4	11	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-06T22:15:38.094Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:24.274Z", "lft": 4, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	4	4
182	14	5	11	json	[{"pk": 5, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-06T22:15:46.808Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:43.190Z", "lft": 6, "tree_id": 2, "position": 2, "placeholder": 4, "plugin_type": "StylePlugin"}}]	5	5
183	15	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
184	15	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:17:48.590Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
185	15	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
186	15	3	23	json	[{"pk": 3, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	3
187	15	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
188	15	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
189	15	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
190	15	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
191	15	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
192	15	2	23	json	[{"pk": 2, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	2
193	15	2	11	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-06T22:13:04.097Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T22:12:53.051Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	2	2
194	15	3	11	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-06T22:15:11.606Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:13:10.349Z", "lft": 2, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "StylePlugin"}}]	3	3
195	15	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
196	15	7	11	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-06T22:17:58.194Z", "parent": 3, "language": "es", "level": 2, "creation_date": "2014-11-06T22:17:58.168Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "TextPlugin"}}]	7	7
197	15	4	23	json	[{"pk": 4, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	4
198	15	5	23	json	[{"pk": 5, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	5
199	15	4	11	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-06T22:15:38.094Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:24.274Z", "lft": 6, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	4	4
200	15	5	11	json	[{"pk": 5, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-11-06T22:15:46.808Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:43.190Z", "lft": 8, "tree_id": 2, "position": 2, "placeholder": 4, "plugin_type": "StylePlugin"}}]	5	5
201	16	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
202	16	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:17:58.318Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
203	16	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
204	16	3	23	json	[{"pk": 3, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	3
205	16	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
206	16	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
207	16	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
208	16	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
209	16	8	11	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-06T22:18:29.957Z", "parent": 7, "language": "es", "level": 3, "creation_date": "2014-11-06T22:18:29.934Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "LinkPlugin"}}]	8	8
210	16	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
211	16	2	23	json	[{"pk": 2, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	2
212	16	2	11	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-06T22:13:04.097Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T22:12:53.051Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	2	2
213	16	3	11	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-06T22:15:11.606Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:13:10.349Z", "lft": 2, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "StylePlugin"}}]	3	3
214	16	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
215	16	7	11	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-06T22:17:58.194Z", "parent": 3, "language": "es", "level": 2, "creation_date": "2014-11-06T22:17:58.168Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "TextPlugin"}}]	7	7
216	16	4	23	json	[{"pk": 4, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	4
217	16	5	23	json	[{"pk": 5, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	5
218	16	4	11	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-11-06T22:15:38.094Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:24.274Z", "lft": 8, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	4	4
219	16	5	11	json	[{"pk": 5, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-06T22:15:46.808Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:43.190Z", "lft": 10, "tree_id": 2, "position": 2, "placeholder": 4, "plugin_type": "StylePlugin"}}]	5	5
293	21	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
220	17	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
221	17	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:18:30.080Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
222	17	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
223	17	3	23	json	[{"pk": 3, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	3
224	17	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
225	17	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
226	17	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
227	17	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
228	17	8	30	json	[{"pk": 8, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Inicio", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Inicio	8
229	17	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
230	17	2	23	json	[{"pk": 2, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	2
231	17	2	11	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-06T22:13:04.097Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T22:12:53.051Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	2	2
232	17	8	11	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-06T22:18:42.273Z", "parent": 7, "language": "es", "level": 3, "creation_date": "2014-11-06T22:18:29.934Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "LinkPlugin"}}]	8	8
233	17	3	11	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-06T22:15:11.606Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:13:10.349Z", "lft": 2, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "StylePlugin"}}]	3	3
234	17	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
235	17	7	11	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-06T22:17:58.194Z", "parent": 3, "language": "es", "level": 2, "creation_date": "2014-11-06T22:17:58.168Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "TextPlugin"}}]	7	7
236	17	4	23	json	[{"pk": 4, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	4
237	17	5	23	json	[{"pk": 5, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	5
238	17	4	11	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-11-06T22:15:38.094Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:24.274Z", "lft": 8, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	4	4
239	17	5	11	json	[{"pk": 5, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-06T22:15:46.808Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:43.190Z", "lft": 10, "tree_id": 2, "position": 2, "placeholder": 4, "plugin_type": "StylePlugin"}}]	5	5
240	18	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
241	18	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:18:42.403Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
242	18	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
243	18	3	23	json	[{"pk": 3, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	3
244	18	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
245	18	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
246	18	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
247	18	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
248	18	8	30	json	[{"pk": 8, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Inicio", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Inicio	8
249	18	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
250	18	2	23	json	[{"pk": 2, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	2
251	18	2	11	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-06T22:13:04.097Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T22:12:53.051Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	2	2
252	18	8	11	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-06T22:18:42.273Z", "parent": 7, "language": "es", "level": 3, "creation_date": "2014-11-06T22:18:29.934Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "LinkPlugin"}}]	8	8
253	18	3	11	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-06T22:15:11.606Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:13:10.349Z", "lft": 2, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "StylePlugin"}}]	3	3
254	18	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
255	18	4	23	json	[{"pk": 4, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	4
256	18	7	21	json	[{"pk": 7, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><u><img id=\\"plugin_obj_8\\" alt=\\"Enlace\\" title=\\"Enlace - Inicio\\" src=\\"/static/cms/img/icons/plugins/link.png\\"></u></p>\\n"}}]		7
257	18	4	11	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-11-06T22:15:38.094Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:24.274Z", "lft": 8, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	4	4
258	18	5	23	json	[{"pk": 5, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	5
259	18	7	11	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-06T22:18:44.706Z", "parent": 3, "language": "es", "level": 2, "creation_date": "2014-11-06T22:17:58.168Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "TextPlugin"}}]	7	7
260	18	5	11	json	[{"pk": 5, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-06T22:15:46.808Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:43.190Z", "lft": 10, "tree_id": 2, "position": 2, "placeholder": 4, "plugin_type": "StylePlugin"}}]	5	5
261	19	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
262	19	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:23:54.112Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
263	19	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
264	19	3	23	json	[{"pk": 3, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	3
265	19	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
266	19	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
267	19	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
268	19	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
269	19	8	30	json	[{"pk": 8, "model": "djangocms_link.link", "fields": {"mailto": "", "name": "Inicio", "url": "", "page_link": 1, "phone": "", "anchor": "", "target": ""}}]	Inicio	8
270	19	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
271	19	2	23	json	[{"pk": 2, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	2
272	19	2	11	json	[{"pk": 2, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-06T22:13:04.097Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T22:12:53.051Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	2	2
273	19	8	11	json	[{"pk": 8, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-06T22:18:42.273Z", "parent": 7, "language": "es", "level": 3, "creation_date": "2014-11-06T22:18:29.934Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "LinkPlugin"}}]	8	8
274	19	3	11	json	[{"pk": 3, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-06T22:15:11.606Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:13:10.349Z", "lft": 2, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "StylePlugin"}}]	3	3
275	19	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
276	19	4	23	json	[{"pk": 4, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	4
277	19	7	21	json	[{"pk": 7, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p><u><img id=\\"plugin_obj_8\\" alt=\\"Enlace\\" title=\\"Enlace - Inicio\\" src=\\"/static/cms/img/icons/plugins/link.png\\"></u></p>\\n"}}]		7
278	19	4	11	json	[{"pk": 4, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-11-06T22:15:38.094Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:24.274Z", "lft": 8, "tree_id": 2, "position": 1, "placeholder": 4, "plugin_type": "StylePlugin"}}]	4	4
279	19	5	23	json	[{"pk": 5, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-4, col-sm-6, col-xs-12", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	5
280	19	7	11	json	[{"pk": 7, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-06T22:18:44.706Z", "parent": 3, "language": "es", "level": 2, "creation_date": "2014-11-06T22:17:58.168Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 4, "plugin_type": "TextPlugin"}}]	7	7
281	19	5	11	json	[{"pk": 5, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-06T22:15:46.808Z", "parent": 2, "language": "es", "level": 1, "creation_date": "2014-11-06T22:15:43.190Z", "lft": 10, "tree_id": 2, "position": 2, "placeholder": 4, "plugin_type": "StylePlugin"}}]	5	5
282	20	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-06T22:26:40.522Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
283	20	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
284	20	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
285	20	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
286	20	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
287	20	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
288	20	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
289	20	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
290	20	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
291	21	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-07T23:02:42.958Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
292	21	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
294	21	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
295	21	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
296	21	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
297	21	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
298	21	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
299	21	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
300	22	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-07T23:02:43.355Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
301	22	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
302	22	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
303	22	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
304	22	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
305	22	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
306	22	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
307	22	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:13:15.520Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
308	22	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
309	22	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
310	23	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
311	23	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-07T23:13:15.628Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
312	23	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
313	23	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
314	23	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
315	23	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
316	23	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
317	23	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:13:26.976Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
318	23	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
319	23	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
320	23	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
321	24	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
322	24	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-07T23:13:27.337Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
323	24	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
324	24	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
325	24	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
326	24	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
327	24	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
328	24	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:13:26.976Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
329	24	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
330	24	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:13:50.776Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 1, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
331	24	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
332	24	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
333	25	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
334	25	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-07T23:13:50.883Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
335	25	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
336	25	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
337	25	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
338	25	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
339	25	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
340	25	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:13:26.976Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
341	25	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n"}}]	BENEFICIOS	18
342	25	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
343	25	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:14:06.683Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 1, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
344	25	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
345	25	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
346	26	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
347	26	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-07T23:14:06.810Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
348	26	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
349	26	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
350	26	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
351	26	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
352	26	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
353	26	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:16:36.792Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
354	26	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n"}}]	BENEFICIOS	18
355	26	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
356	26	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:16:36.809Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
357	26	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
358	26	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
359	27	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
360	27	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-07T23:23:04.205Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
361	27	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
362	27	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
363	27	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
364	27	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
365	27	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
366	27	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:16:36.792Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
367	27	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n"}}]	BENEFICIOS	18
368	27	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
369	27	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-07T23:16:36.809Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
370	27	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
371	27	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
\.


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('reversion_version_id_seq', 371, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	cms	0001_initial	2014-11-06 15:20:36.564539-05
2	djangocms_text_ckeditor	0001_initial	2014-11-06 15:20:36.659197-05
3	djangocms_text_ckeditor	0002_rename_plugin	2014-11-06 15:20:36.681928-05
4	cms	0002_auto_start	2014-11-06 15:20:36.983955-05
5	cms	0003_remove_placeholder	2014-11-06 15:20:37.026424-05
6	cms	0004_textobjects	2014-11-06 15:20:37.069294-05
7	cms	0005_mptt_added_to_plugins	2014-11-06 15:20:37.108869-05
8	cms	0006_apphook	2014-11-06 15:20:37.139575-05
9	cms	0007_apphook_longer	2014-11-06 15:20:37.169075-05
10	cms	0008_redirects	2014-11-06 15:20:37.208807-05
11	cms	0009_added_meta_fields	2014-11-06 15:20:37.235605-05
12	cms	0010_5char_language	2014-11-06 15:20:37.27271-05
13	cms	0011_title_overwrites	2014-11-06 15:20:37.307898-05
14	cms	0012_publisher	2014-11-06 15:20:37.336561-05
15	cms	0013_site_copy	2014-11-06 15:20:37.374476-05
16	cms	0014_sites_removed	2014-11-06 15:20:37.404556-05
17	cms	0015_modified_by_added	2014-11-06 15:20:37.442397-05
18	cms	0016_author_copy	2014-11-06 15:20:37.479932-05
19	cms	0017_author_removed	2014-11-06 15:20:37.516875-05
20	cms	0018_site_permissions	2014-11-06 15:20:37.55101-05
21	cms	0019_public_table_renames	2014-11-06 15:20:37.578652-05
22	cms	0020_advanced_permissions	2014-11-06 15:20:37.612909-05
23	cms	0021_publisher2	2014-11-06 15:20:37.649384-05
24	cms	0022_login_required_added	2014-11-06 15:20:37.680211-05
25	cms	0023_plugin_table_naming_function_changed	2014-11-06 15:20:37.716224-05
26	cms	0024_added_placeholder_model	2014-11-06 15:20:37.749801-05
27	cms	0025_placeholder_migration	2014-11-06 15:20:37.778491-05
28	cms	0026_finish_placeholder_migration	2014-11-06 15:20:37.817341-05
29	cms	0027_added_width_to_placeholder	2014-11-06 15:20:37.848632-05
30	cms	0028_limit_visibility_in_menu_step1of3	2014-11-06 15:20:37.881149-05
31	cms	0029_limit_visibility_in_menu_step2of3_data	2014-11-06 15:20:37.918552-05
32	cms	0030_limit_visibility_in_menu_step3of3	2014-11-06 15:20:38.007265-05
33	cms	0031_improved_language_code_support	2014-11-06 15:20:38.036393-05
34	cms	0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis	2014-11-06 15:20:38.072504-05
35	cms	0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st	2014-11-06 15:20:38.1037-05
36	cms	0034_auto__chg_field_title_language__chg_field_cmsplugin_language__add_fiel	2014-11-06 15:20:38.142183-05
37	cms	0035_auto__add_field_globalpagepermission_can_view__add_field_pagepermissio	2014-11-06 15:20:38.173391-05
38	cms	0036_auto__add_field_cmsplugin_changed_date	2014-11-06 15:20:38.207106-05
39	cms	0037_auto__del_pagemoderator__del_field_globalpagepermission_can_moderate__	2014-11-06 15:20:38.241648-05
40	cms	0038_publish_page_permission	2014-11-06 15:20:38.278542-05
41	cms	0039_auto__del_field_page_moderator_state	2014-11-06 15:20:38.311032-05
42	cms	0040_auto__del_field_title_meta_keywords__chg_field_title_meta_description	2014-11-06 15:20:38.397186-05
43	cms	0041_auto__add_usersettings	2014-11-06 15:20:38.494105-05
44	cms	0042_auto__del_field_title_meta_keywords__chg_field_title_meta_description_	2014-11-06 15:20:39.132365-05
45	cms	0043_auto__add_field_usersettings_clipboard	2014-11-06 15:20:39.223207-05
46	cms	0044_killsettings	2014-11-06 15:20:39.268131-05
47	cms	0045_auto__add_field_page_application_urls	2014-11-06 15:20:39.39118-05
48	cms	0046_move_apphooks	2014-11-06 15:20:39.442136-05
49	cms	0047_auto__del_field_title_application_urls	2014-11-06 15:20:39.473976-05
50	cms	0048_auto__add_field_page_application_namespace__add_unique_page_publisher_	2014-11-06 15:20:39.541939-05
51	cms	0049_auto__add_field_page_is_home	2014-11-06 15:20:40.231982-05
52	cms	0050_save_home	2014-11-06 15:20:40.277163-05
53	cms	0051_auto__add_placeholderreference	2014-11-06 15:20:40.37329-05
54	cms	0051_fix_content_type	2014-11-06 15:20:40.411175-05
55	cms	0052_auto__add_placeholderreference__add_staticplaceholder__add_field_page_	2014-11-06 15:20:40.628331-05
56	cms	0053_auto__add_field_title_published__add_field_title_publisher_is_draft__a	2014-11-06 15:20:41.741759-05
57	cms	0054_new_publisher_data	2014-11-06 15:20:41.794543-05
58	cms	0055_auto__del_field_page_publisher_state__del_field_page_published	2014-11-06 15:20:41.8306-05
59	cms	0056_auto__del_field_page_published_languages	2014-11-06 15:20:41.874744-05
60	cms	0057_fix_values	2014-11-06 15:20:41.99511-05
61	cms	0058_placeholderref_table_rename	2014-11-06 15:20:42.030994-05
62	cms	0059_auto__del_pagemoderatorstate	2014-11-06 15:20:42.089896-05
63	cms	0060_auto__add_field_page_xframe_options	2014-11-06 15:20:42.776495-05
64	cms	0061_revers_id_unique	2014-11-06 15:20:42.866992-05
65	cms	0062_auto__add_field_staticplaceholder_site__del_unique_staticplaceholder_c	2014-11-06 15:20:43.13091-05
66	cms	0063_auto__chg_field_staticplaceholder_site	2014-11-06 15:20:43.267488-05
67	cms	0064_staticplaceholder_site_change	2014-11-06 15:20:43.313039-05
68	cms	0065_auto__add_unique_usersettings_user	2014-11-06 15:20:43.373696-05
69	cms	0066_auto__add_aliaspluginmodel	2014-11-06 15:20:43.474987-05
70	cms	0067_auto__add_field_aliaspluginmodel_alias_placeholder__chg_field_aliasplu	2014-11-06 15:20:43.626598-05
71	cms	0068_auto__chg_field_placeholder_slot	2014-11-06 15:20:43.804081-05
72	cms	0069_static_placeholder_permissions	2014-11-06 15:20:43.850432-05
73	menus	0001_initial	2014-11-06 15:20:44.016327-05
74	djangocms_style	0001_initial	2014-11-06 15:20:44.387652-05
75	djangocms_style	0002_auto__add_field_style_padding_left__add_field_style_padding_right__add	2014-11-06 15:20:44.457128-05
76	djangocms_style	0003_auto__add_field_style_tag_type__add_field_style_additional_classes	2014-11-06 15:20:44.561504-05
77	djangocms_style	0004_plugin_rename	2014-11-06 15:20:44.58353-05
78	djangocms_column	0001_initial	2014-11-06 15:20:44.750378-05
79	djangocms_column	0002_plugin_rename	2014-11-06 15:20:44.776538-05
80	djangocms_file	0001_initial	2014-11-06 15:20:44.907803-05
81	djangocms_file	0002_auto__add_field_file_target	2014-11-06 15:20:44.981917-05
82	djangocms_flash	0001_initial	2014-11-06 15:20:45.242369-05
83	djangocms_googlemap	0001_initial	2014-11-06 15:20:45.370666-05
84	djangocms_inherit	0001_initial	2014-11-06 15:20:45.511103-05
85	djangocms_link	0001_initial	2014-11-06 15:20:45.679009-05
86	djangocms_link	0002_auto__add_field_link_phone	2014-11-06 15:20:45.707584-05
87	djangocms_link	0003_auto__add_field_link_anchor__chg_field_link_page_link	2014-11-06 15:20:45.898386-05
88	djangocms_picture	0001_initial	2014-11-06 15:20:46.19137-05
89	djangocms_teaser	0001_initial	2014-11-06 15:20:46.361388-05
90	djangocms_video	0001_initial	2014-11-06 15:20:46.515501-05
91	reversion	0001_initial	2014-11-06 15:20:46.933097-05
92	reversion	0002_auto__add_field_version_type	2014-11-06 15:20:47.095081-05
93	reversion	0003_auto__add_field_version_object_id_int	2014-11-06 15:20:47.153827-05
94	reversion	0004_populate_object_id_int	2014-11-06 15:20:47.184902-05
95	reversion	0005_auto__add_field_revision_manager_slug	2014-11-06 15:20:47.365195-05
96	reversion	0006_remove_delete_revisions	2014-11-06 15:20:47.393577-05
97	reversion	0007_auto__del_field_version_type	2014-11-06 15:20:47.418643-05
98	reversion	0008_auto__add_index_revision_date_created	2014-11-06 15:20:47.465998-05
99	filer	0001_initial	2014-11-06 16:02:22.923-05
100	filer	0002_rename_file_field	2014-11-06 16:02:22.963995-05
101	filer	0003_add_description_field	2014-11-06 16:02:22.989152-05
102	filer	0004_auto__del_field_file__file__add_field_file_file__add_field_file_is_pub	2014-11-06 16:02:23.135673-05
103	filer	0005_auto__add_field_file_sha1__chg_field_file_file	2014-11-06 16:02:23.327678-05
104	filer	0006_polymorphic__add_field_file_polymorphic_ctype	2014-11-06 16:02:23.394928-05
105	filer	0007_polymorphic__content_type_data	2014-11-06 16:02:23.423032-05
106	filer	0008_polymorphic__del_field_file__file_type_plugin_name	2014-11-06 16:02:23.457219-05
107	filer	0009_auto__add_field_folderpermission_can_edit_new__add_field_folderpermiss	2014-11-06 16:02:23.485982-05
108	filer	0010_folderpermissions	2014-11-06 16:02:23.514052-05
109	filer	0011_auto__del_field_folderpermission_can_add_children__del_field_folderper	2014-11-06 16:02:23.545065-05
110	filer	0012_renaming_folderpermissions	2014-11-06 16:02:23.585951-05
111	filer	0013_remove_null_file_name	2014-11-06 16:02:23.613066-05
112	filer	0014_auto__add_field_image_related_url__chg_field_file_name	2014-11-06 16:02:23.649258-05
113	easy_thumbnails	0001_initial	2014-11-06 16:02:24.134021-05
114	easy_thumbnails	0002_filename_indexes	2014-11-06 16:02:24.235326-05
115	easy_thumbnails	0003_auto__add_storagenew	2014-11-06 16:02:24.387713-05
116	easy_thumbnails	0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new	2014-11-06 16:02:24.4636-05
117	easy_thumbnails	0005_storage_fks_null	2014-11-06 16:02:24.651384-05
118	easy_thumbnails	0006_copy_storage	2014-11-06 16:02:24.668539-05
119	easy_thumbnails	0007_storagenew_fks_not_null	2014-11-06 16:02:24.794476-05
120	easy_thumbnails	0008_auto__del_field_source_storage__del_field_thumbnail_storage	2014-11-06 16:02:24.811472-05
121	easy_thumbnails	0009_auto__del_storage	2014-11-06 16:02:24.826697-05
122	easy_thumbnails	0010_rename_storage	2014-11-06 16:02:24.844594-05
123	easy_thumbnails	0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash	2014-11-06 16:02:25.11284-05
124	easy_thumbnails	0012_build_storage_hashes	2014-11-06 16:02:25.126656-05
125	easy_thumbnails	0013_auto__del_storage__del_field_source_storage__del_field_thumbnail_stora	2014-11-06 16:02:25.200155-05
126	easy_thumbnails	0014_auto__add_unique_source_name_storage_hash__add_unique_thumbnail_name_s	2014-11-06 16:02:25.328529-05
127	easy_thumbnails	0015_auto__del_unique_thumbnail_name_storage_hash__add_unique_thumbnail_sou	2014-11-06 16:02:25.469228-05
128	easy_thumbnails	0016_auto__add_thumbnaildimensions	2014-11-06 16:02:25.547204-05
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 128, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_aliaspluginmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT cms_aliaspluginmodel_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cms_cmsplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpageper_globalpagepermission_id_1ffcd9d4c6c0cbfa_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpageper_globalpagepermission_id_1ffcd9d4c6c0cbfa_uniq UNIQUE (globalpagepermission_id, site_id);


--
-- Name: cms_globalpagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (id);


--
-- Name: cms_page_placeholders_page_id_598353cf6a0df834_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_598353cf6a0df834_uniq UNIQUE (page_id, placeholder_id);


--
-- Name: cms_page_placeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_pkey PRIMARY KEY (id);


--
-- Name: cms_page_publisher_is_draft_382d2913a1d40b79_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_is_draft_382d2913a1d40b79_uniq UNIQUE (publisher_is_draft, application_namespace);


--
-- Name: cms_page_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_page_reverse_id_a864144bd3516c9_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_reverse_id_a864144bd3516c9_uniq UNIQUE (reverse_id, site_id, publisher_is_draft);


--
-- Name: cms_pagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_pageuser_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: cms_pageusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: cms_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_placeholder
    ADD CONSTRAINT cms_placeholder_pkey PRIMARY KEY (id);


--
-- Name: cms_staticplaceholder_code_6c6b490a9fe0e459_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_code_6c6b490a9fe0e459_uniq UNIQUE (code, site_id);


--
-- Name: cms_staticplaceholder_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT cms_staticplaceholder_pkey PRIMARY KEY (id);


--
-- Name: cms_title_language_7a69dc7eaf856287_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_language_7a69dc7eaf856287_uniq UNIQUE (language, page_id);


--
-- Name: cms_title_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_pkey PRIMARY KEY (id);


--
-- Name: cms_title_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_usersettings_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT cms_usersettings_pkey PRIMARY KEY (id);


--
-- Name: cms_usersettings_user_id_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT cms_usersettings_user_id_uniq UNIQUE (user_id);


--
-- Name: cmsplugin_column_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_column_column
    ADD CONSTRAINT cmsplugin_column_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_multicolumns_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_column_multicolumns
    ADD CONSTRAINT cmsplugin_multicolumns_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_placeholderreference_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cms_placeholderreference
    ADD CONSTRAINT cmsplugin_placeholderreference_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_style_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_style_style
    ADD CONSTRAINT cmsplugin_style_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_text_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_text_ckeditor_text
    ADD CONSTRAINT cmsplugin_text_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: djangocms-css-background_cssbackground_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY "djangocms-css-background_cssbackground"
    ADD CONSTRAINT "djangocms-css-background_cssbackground_pkey" PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_file_file_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_file_file
    ADD CONSTRAINT djangocms_file_file_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_flash_flash_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_flash_flash
    ADD CONSTRAINT djangocms_flash_flash_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_googlemap_googlemap_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_googlemap_googlemap
    ADD CONSTRAINT djangocms_googlemap_googlemap_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_inherit_inheritpageplaceholder_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_inherit_inheritpageplaceholder
    ADD CONSTRAINT djangocms_inherit_inheritpageplaceholder_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_link_link_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_link_link
    ADD CONSTRAINT djangocms_link_link_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_picture_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_picture_picture
    ADD CONSTRAINT djangocms_picture_picture_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_teaser_teaser_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_teaser_teaser
    ADD CONSTRAINT djangocms_teaser_teaser_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: djangocms_video_video_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY djangocms_video_video
    ADD CONSTRAINT djangocms_video_video_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: easy_thumbnails_source_name_7549c98cc6dd6969_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_name_7549c98cc6dd6969_uniq UNIQUE (name, storage_hash);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_source_id_1f50d53db8191480_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_source_id_1f50d53db8191480_uniq UNIQUE (source_id, name, storage_hash);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: filer_clipboard_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_pkey PRIMARY KEY (id);


--
-- Name: filer_clipboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_pkey PRIMARY KEY (id);


--
-- Name: filer_file_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_pkey PRIMARY KEY (id);


--
-- Name: filer_folder_parent_id_30ad83e34d901e49_uniq; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_parent_id_30ad83e34d901e49_uniq UNIQUE (parent_id, name);


--
-- Name: filer_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_pkey PRIMARY KEY (id);


--
-- Name: filer_folderpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_pkey PRIMARY KEY (id);


--
-- Name: filer_image_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_pkey PRIMARY KEY (file_ptr_id);


--
-- Name: menus_cachekey_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY menus_cachekey
    ADD CONSTRAINT menus_cachekey_pkey PRIMARY KEY (id);


--
-- Name: reversion_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT reversion_revision_pkey PRIMARY KEY (id);


--
-- Name: reversion_version_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT reversion_version_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cms_aliaspluginmodel_alias_placeholder_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_aliaspluginmodel_alias_placeholder_id ON cms_aliaspluginmodel USING btree (alias_placeholder_id);


--
-- Name: cms_aliaspluginmodel_plugin_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_aliaspluginmodel_plugin_id ON cms_aliaspluginmodel USING btree (plugin_id);


--
-- Name: cms_cmsplugin_language; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language ON cms_cmsplugin USING btree (language);


--
-- Name: cms_cmsplugin_language_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language_like ON cms_cmsplugin USING btree (language varchar_pattern_ops);


--
-- Name: cms_cmsplugin_level; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_level ON cms_cmsplugin USING btree (level);


--
-- Name: cms_cmsplugin_lft; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_lft ON cms_cmsplugin USING btree (lft);


--
-- Name: cms_cmsplugin_parent_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_parent_id ON cms_cmsplugin USING btree (parent_id);


--
-- Name: cms_cmsplugin_placeholder_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_placeholder_id ON cms_cmsplugin USING btree (placeholder_id);


--
-- Name: cms_cmsplugin_plugin_type; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type ON cms_cmsplugin USING btree (plugin_type);


--
-- Name: cms_cmsplugin_plugin_type_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type_like ON cms_cmsplugin USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cms_cmsplugin_rght; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_rght ON cms_cmsplugin USING btree (rght);


--
-- Name: cms_cmsplugin_tree_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_cmsplugin_tree_id ON cms_cmsplugin USING btree (tree_id);


--
-- Name: cms_globalpagepermission_group_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_group_id ON cms_globalpagepermission USING btree (group_id);


--
-- Name: cms_globalpagepermission_sites_globalpagepermission_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_globalpagepermission_id ON cms_globalpagepermission_sites USING btree (globalpagepermission_id);


--
-- Name: cms_globalpagepermission_sites_site_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_site_id ON cms_globalpagepermission_sites USING btree (site_id);


--
-- Name: cms_globalpagepermission_user_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_user_id ON cms_globalpagepermission USING btree (user_id);


--
-- Name: cms_page_application_urls; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_application_urls ON cms_page USING btree (application_urls);


--
-- Name: cms_page_application_urls_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_application_urls_like ON cms_page USING btree (application_urls varchar_pattern_ops);


--
-- Name: cms_page_in_navigation; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_in_navigation ON cms_page USING btree (in_navigation);


--
-- Name: cms_page_is_home; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_is_home ON cms_page USING btree (is_home);


--
-- Name: cms_page_level; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_level ON cms_page USING btree (level);


--
-- Name: cms_page_lft; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_lft ON cms_page USING btree (lft);


--
-- Name: cms_page_limit_visibility_in_menu; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_limit_visibility_in_menu ON cms_page USING btree (limit_visibility_in_menu);


--
-- Name: cms_page_navigation_extenders; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders ON cms_page USING btree (navigation_extenders);


--
-- Name: cms_page_navigation_extenders_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders_like ON cms_page USING btree (navigation_extenders varchar_pattern_ops);


--
-- Name: cms_page_parent_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_parent_id ON cms_page USING btree (parent_id);


--
-- Name: cms_page_placeholders_page_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_placeholders_page_id ON cms_page_placeholders USING btree (page_id);


--
-- Name: cms_page_placeholders_placeholder_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_placeholders_placeholder_id ON cms_page_placeholders USING btree (placeholder_id);


--
-- Name: cms_page_publication_date; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_publication_date ON cms_page USING btree (publication_date);


--
-- Name: cms_page_publication_end_date; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_publication_end_date ON cms_page USING btree (publication_end_date);


--
-- Name: cms_page_publisher_is_draft; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_publisher_is_draft ON cms_page USING btree (publisher_is_draft);


--
-- Name: cms_page_reverse_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_reverse_id ON cms_page USING btree (reverse_id);


--
-- Name: cms_page_reverse_id_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_reverse_id_like ON cms_page USING btree (reverse_id varchar_pattern_ops);


--
-- Name: cms_page_rght; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_rght ON cms_page USING btree (rght);


--
-- Name: cms_page_site_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_site_id ON cms_page USING btree (site_id);


--
-- Name: cms_page_soft_root; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_soft_root ON cms_page USING btree (soft_root);


--
-- Name: cms_page_tree_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_page_tree_id ON cms_page USING btree (tree_id);


--
-- Name: cms_pagepermission_group_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_pagepermission_group_id ON cms_pagepermission USING btree (group_id);


--
-- Name: cms_pagepermission_page_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_pagepermission_page_id ON cms_pagepermission USING btree (page_id);


--
-- Name: cms_pagepermission_user_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_pagepermission_user_id ON cms_pagepermission USING btree (user_id);


--
-- Name: cms_pageuser_created_by_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_pageuser_created_by_id ON cms_pageuser USING btree (created_by_id);


--
-- Name: cms_pageusergroup_created_by_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_pageusergroup_created_by_id ON cms_pageusergroup USING btree (created_by_id);


--
-- Name: cms_placeholder_slot; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_placeholder_slot ON cms_placeholder USING btree (slot);


--
-- Name: cms_placeholder_slot_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_placeholder_slot_like ON cms_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: cms_staticplaceholder_code_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_code_like ON cms_staticplaceholder USING btree (code varchar_pattern_ops);


--
-- Name: cms_staticplaceholder_draft_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_draft_id ON cms_staticplaceholder USING btree (draft_id);


--
-- Name: cms_staticplaceholder_public_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_public_id ON cms_staticplaceholder USING btree (public_id);


--
-- Name: cms_staticplaceholder_site_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_staticplaceholder_site_id ON cms_staticplaceholder USING btree (site_id);


--
-- Name: cms_title_has_url_overwrite; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_has_url_overwrite ON cms_title USING btree (has_url_overwrite);


--
-- Name: cms_title_language; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_language ON cms_title USING btree (language);


--
-- Name: cms_title_language_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_language_like ON cms_title USING btree (language varchar_pattern_ops);


--
-- Name: cms_title_page_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_page_id ON cms_title USING btree (page_id);


--
-- Name: cms_title_path; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_path ON cms_title USING btree (path);


--
-- Name: cms_title_path_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_path_like ON cms_title USING btree (path varchar_pattern_ops);


--
-- Name: cms_title_publisher_is_draft; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_publisher_is_draft ON cms_title USING btree (publisher_is_draft);


--
-- Name: cms_title_publisher_state; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_publisher_state ON cms_title USING btree (publisher_state);


--
-- Name: cms_title_slug; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_slug ON cms_title USING btree (slug);


--
-- Name: cms_title_slug_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_title_slug_like ON cms_title USING btree (slug varchar_pattern_ops);


--
-- Name: cms_usersettings_clipboard_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_usersettings_clipboard_id ON cms_usersettings USING btree (clipboard_id);


--
-- Name: cms_usersettings_user_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cms_usersettings_user_id ON cms_usersettings USING btree (user_id);


--
-- Name: cmsplugin_placeholderreference_placeholder_ref_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_placeholderreference_placeholder_ref_id ON cms_placeholderreference USING btree (placeholder_ref_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: djangocms-css-background_cssbackground_image_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX "djangocms-css-background_cssbackground_image_id" ON "djangocms-css-background_cssbackground" USING btree (image_id);


--
-- Name: djangocms_inherit_inheritpageplaceholder_from_page_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX djangocms_inherit_inheritpageplaceholder_from_page_id ON djangocms_inherit_inheritpageplaceholder USING btree (from_page_id);


--
-- Name: djangocms_link_link_page_link_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX djangocms_link_link_page_link_id ON djangocms_link_link USING btree (page_link_id);


--
-- Name: djangocms_picture_picture_page_link_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX djangocms_picture_picture_page_link_id ON djangocms_picture_picture USING btree (page_link_id);


--
-- Name: djangocms_teaser_teaser_page_link_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX djangocms_teaser_teaser_page_link_id ON djangocms_teaser_teaser USING btree (page_link_id);


--
-- Name: easy_thumbnails_source_name; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_storage_hash; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_source_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_source_id ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: filer_clipboard_user_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_clipboard_user_id ON filer_clipboard USING btree (user_id);


--
-- Name: filer_clipboarditem_clipboard_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_clipboarditem_clipboard_id ON filer_clipboarditem USING btree (clipboard_id);


--
-- Name: filer_clipboarditem_file_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_clipboarditem_file_id ON filer_clipboarditem USING btree (file_id);


--
-- Name: filer_file_folder_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_file_folder_id ON filer_file USING btree (folder_id);


--
-- Name: filer_file_owner_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_file_owner_id ON filer_file USING btree (owner_id);


--
-- Name: filer_file_polymorphic_ctype_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_file_polymorphic_ctype_id ON filer_file USING btree (polymorphic_ctype_id);


--
-- Name: filer_folder_level; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_folder_level ON filer_folder USING btree (level);


--
-- Name: filer_folder_lft; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_folder_lft ON filer_folder USING btree (lft);


--
-- Name: filer_folder_owner_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_folder_owner_id ON filer_folder USING btree (owner_id);


--
-- Name: filer_folder_parent_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_folder_parent_id ON filer_folder USING btree (parent_id);


--
-- Name: filer_folder_rght; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_folder_rght ON filer_folder USING btree (rght);


--
-- Name: filer_folder_tree_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_folder_tree_id ON filer_folder USING btree (tree_id);


--
-- Name: filer_folderpermission_folder_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_folderpermission_folder_id ON filer_folderpermission USING btree (folder_id);


--
-- Name: filer_folderpermission_group_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_folderpermission_group_id ON filer_folderpermission USING btree (group_id);


--
-- Name: filer_folderpermission_user_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX filer_folderpermission_user_id ON filer_folderpermission USING btree (user_id);


--
-- Name: reversion_revision_date_created; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX reversion_revision_date_created ON reversion_revision USING btree (date_created);


--
-- Name: reversion_revision_manager_slug; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug ON reversion_revision USING btree (manager_slug);


--
-- Name: reversion_revision_manager_slug_like; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX reversion_revision_manager_slug_like ON reversion_revision USING btree (manager_slug varchar_pattern_ops);


--
-- Name: reversion_revision_user_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX reversion_revision_user_id ON reversion_revision USING btree (user_id);


--
-- Name: reversion_version_content_type_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX reversion_version_content_type_id ON reversion_version USING btree (content_type_id);


--
-- Name: reversion_version_object_id_int; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX reversion_version_object_id_int ON reversion_version USING btree (object_id_int);


--
-- Name: reversion_version_revision_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX reversion_version_revision_id ON reversion_version USING btree (revision_id);


--
-- Name: alias_placeholder_id_refs_id_2f6ab753; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT alias_placeholder_id_refs_id_2f6ab753 FOREIGN KEY (alias_placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: clipboard_id_refs_id_29248006; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT clipboard_id_refs_id_29248006 FOREIGN KEY (clipboard_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: clipboard_id_refs_id_fd11d4a0; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT clipboard_id_refs_id_fd11d4a0 FOREIGN KEY (clipboard_id) REFERENCES filer_clipboard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_15180c6b; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_link_link
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_15180c6b FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_34ad5108; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_text_ckeditor_text
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_34ad5108 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_40e80a0c; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_file_file
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_40e80a0c FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_5b2bc64d; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_googlemap_googlemap
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_5b2bc64d FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_63c34d94; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_flash_flash
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_63c34d94 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_8cc1766a; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_placeholderreference
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_8cc1766a FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_9808644e; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_9808644e FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_9b23c89d; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_inherit_inheritpageplaceholder
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_9b23c89d FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_a072acd4; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_column_column
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_a072acd4 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_b3acff40; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_video_video
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_b3acff40 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_b9fcfc3a; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_teaser_teaser
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_b9fcfc3a FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_ccfe771b; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_column_multicolumns
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_ccfe771b FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_d67faf34; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_style_style
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_d67faf34 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_fdb6e63b; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_picture_picture
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_fdb6e63b FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_f5dce86c; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT content_type_id_refs_id_f5dce86c FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: created_by_id_refs_id_9da6953b; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT created_by_id_refs_id_9da6953b FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: created_by_id_refs_id_f9e2dd36; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT created_by_id_refs_id_f9e2dd36 FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: draft_id_refs_id_81bff591; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT draft_id_refs_id_81bff591 FOREIGN KEY (draft_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_id_refs_id_a869c276; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT file_id_refs_id_a869c276 FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_ptr_id_refs_id_7375d00c; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT file_ptr_id_refs_id_7375d00c FOREIGN KEY (file_ptr_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: folder_id_refs_id_41348f39; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT folder_id_refs_id_41348f39 FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: folder_id_refs_id_b2c18baf; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT folder_id_refs_id_b2c18baf FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: from_page_id_refs_id_b7b64b05; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_inherit_inheritpageplaceholder
    ADD CONSTRAINT from_page_id_refs_id_b7b64b05 FOREIGN KEY (from_page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globalpagepermission_id_refs_id_09b826f9; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT globalpagepermission_id_refs_id_09b826f9 FOREIGN KEY (globalpagepermission_id) REFERENCES cms_globalpagepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_5f980916; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT group_id_refs_id_5f980916 FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_65c5081c; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT group_id_refs_id_65c5081c FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f86eccc7; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT group_id_refs_id_f86eccc7 FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_ptr_id_refs_id_b270d7fc; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT group_ptr_id_refs_id_b270d7fc FOREIGN KEY (group_ptr_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: owner_id_refs_id_a6490af8; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT owner_id_refs_id_a6490af8 FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: owner_id_refs_id_a9e7dcbc; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT owner_id_refs_id_a9e7dcbc FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_0d5e81b6; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT page_id_refs_id_0d5e81b6 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_88abf373; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT page_id_refs_id_88abf373 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_9d95001c; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT page_id_refs_id_9d95001c FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_261dd694; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_link_link
    ADD CONSTRAINT page_link_id_refs_id_261dd694 FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_832e1c20; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_teaser_teaser
    ADD CONSTRAINT page_link_id_refs_id_832e1c20 FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_8f4be414; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY djangocms_picture_picture
    ADD CONSTRAINT page_link_id_refs_id_8f4be414 FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_42b2c54f; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT parent_id_refs_id_42b2c54f FOREIGN KEY (parent_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_8d462df0; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT parent_id_refs_id_8d462df0 FOREIGN KEY (parent_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_ca1f299f; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT parent_id_refs_id_ca1f299f FOREIGN KEY (parent_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: placeholder_id_refs_id_0c0bdf3b; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT placeholder_id_refs_id_0c0bdf3b FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: placeholder_id_refs_id_6e7caeb8; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT placeholder_id_refs_id_6e7caeb8 FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: placeholder_ref_id_refs_id_01a30ec3; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_placeholderreference
    ADD CONSTRAINT placeholder_ref_id_refs_id_01a30ec3 FOREIGN KEY (placeholder_ref_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: plugin_id_refs_id_9808644e; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_aliaspluginmodel
    ADD CONSTRAINT plugin_id_refs_id_9808644e FOREIGN KEY (plugin_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polymorphic_ctype_id_refs_id_a03609f3; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT polymorphic_ctype_id_refs_id_a03609f3 FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public_id_refs_id_81bff591; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT public_id_refs_id_81bff591 FOREIGN KEY (public_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publisher_public_id_refs_id_579fc503; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT publisher_public_id_refs_id_579fc503 FOREIGN KEY (publisher_public_id) REFERENCES cms_title(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publisher_public_id_refs_id_ca1f299f; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT publisher_public_id_refs_id_ca1f299f FOREIGN KEY (publisher_public_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: revision_id_refs_id_a685e913; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY reversion_version
    ADD CONSTRAINT revision_id_refs_id_a685e913 FOREIGN KEY (revision_id) REFERENCES reversion_revision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_3757c4f9; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT site_id_refs_id_3757c4f9 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_5f61f09c; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT site_id_refs_id_5f61f09c FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_ed874bfd; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_staticplaceholder
    ADD CONSTRAINT site_id_refs_id_ed874bfd FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: source_id_refs_id_0df57a91; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT source_id_refs_id_0df57a91 FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: thumbnail_id_refs_id_ef901436; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT thumbnail_id_refs_id_ef901436 FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_1f964794; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT user_id_refs_id_1f964794 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_2bc29acf; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT user_id_refs_id_2bc29acf FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_5b2d2788; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT user_id_refs_id_5b2d2788 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_5f222118; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_usersettings
    ADD CONSTRAINT user_id_refs_id_5f222118 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_d4f35b51; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY reversion_revision
    ADD CONSTRAINT user_id_refs_id_d4f35b51 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_e927b528; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT user_id_refs_id_e927b528 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_ptr_id_refs_id_9da6953b; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT user_ptr_id_refs_id_9da6953b FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

