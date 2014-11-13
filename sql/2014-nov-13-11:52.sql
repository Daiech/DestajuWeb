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
-- Name: cmsplugin_contact_contact; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cmsplugin_contact_contact (
    cmsplugin_ptr_id integer NOT NULL,
    site_email character varying(75) NOT NULL,
    thanks text NOT NULL,
    submit character varying(30) NOT NULL,
    spam_protection_method smallint NOT NULL,
    akismet_api_key character varying(255) NOT NULL,
    recaptcha_public_key character varying(255) NOT NULL,
    recaptcha_private_key character varying(255) NOT NULL,
    recaptcha_theme character varying(20) NOT NULL,
    form_name character varying(60) NOT NULL,
    form_layout character varying(255) NOT NULL,
    redirect_url character varying(200) NOT NULL
);


ALTER TABLE public.cmsplugin_contact_contact OWNER TO daiech;

--
-- Name: cmsplugin_filer_file_filerfile; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cmsplugin_filer_file_filerfile (
    cmsplugin_ptr_id integer NOT NULL,
    file_id integer NOT NULL,
    title character varying(255),
    target_blank boolean NOT NULL,
    style character varying(255) NOT NULL
);


ALTER TABLE public.cmsplugin_filer_file_filerfile OWNER TO daiech;

--
-- Name: cmsplugin_filer_folder_filerfolder; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cmsplugin_filer_folder_filerfolder (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255),
    folder_id integer NOT NULL,
    style character varying(50) NOT NULL
);


ALTER TABLE public.cmsplugin_filer_folder_filerfolder OWNER TO daiech;

--
-- Name: cmsplugin_filer_image_filerimage; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cmsplugin_filer_image_filerimage (
    cmsplugin_ptr_id integer NOT NULL,
    image_id integer,
    alt_text character varying(255),
    caption_text character varying(255),
    use_autoscale boolean NOT NULL,
    width integer,
    height integer,
    alignment character varying(10),
    free_link character varying(255),
    page_link_id integer,
    description text,
    image_url character varying(200),
    thumbnail_option_id integer,
    crop boolean NOT NULL,
    upscale boolean NOT NULL,
    original_link boolean NOT NULL,
    file_link_id integer,
    use_original_image boolean NOT NULL,
    target_blank boolean NOT NULL,
    style character varying(50) NOT NULL,
    CONSTRAINT cmsplugin_filerimage_height_check CHECK ((height >= 0)),
    CONSTRAINT cmsplugin_filerimage_width_check CHECK ((width >= 0))
);


ALTER TABLE public.cmsplugin_filer_image_filerimage OWNER TO daiech;

--
-- Name: cmsplugin_filer_image_thumbnailoption; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cmsplugin_filer_image_thumbnailoption (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    crop boolean NOT NULL,
    upscale boolean NOT NULL
);


ALTER TABLE public.cmsplugin_filer_image_thumbnailoption OWNER TO daiech;

--
-- Name: cmsplugin_filer_image_thumbnailoption_id_seq; Type: SEQUENCE; Schema: public; Owner: daiech
--

CREATE SEQUENCE cmsplugin_filer_image_thumbnailoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_filer_image_thumbnailoption_id_seq OWNER TO daiech;

--
-- Name: cmsplugin_filer_image_thumbnailoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daiech
--

ALTER SEQUENCE cmsplugin_filer_image_thumbnailoption_id_seq OWNED BY cmsplugin_filer_image_thumbnailoption.id;


--
-- Name: cmsplugin_filer_link_filerlinkplugin; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cmsplugin_filer_link_filerlinkplugin (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255),
    page_link_id integer,
    mailto character varying(75),
    link_style character varying(255) NOT NULL,
    new_window boolean NOT NULL,
    file_id integer
);


ALTER TABLE public.cmsplugin_filer_link_filerlinkplugin OWNER TO daiech;

--
-- Name: cmsplugin_filer_teaser_filerteaser; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cmsplugin_filer_teaser_filerteaser (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    image_id integer,
    use_autoscale boolean NOT NULL,
    width integer,
    height integer,
    free_link character varying(255),
    page_link_id integer,
    description text,
    style character varying(255) NOT NULL,
    target_blank boolean NOT NULL,
    image_url character varying(200),
    CONSTRAINT cmsplugin_filerteaser_height_check CHECK ((height >= 0)),
    CONSTRAINT cmsplugin_filerteaser_width_check CHECK ((width >= 0))
);


ALTER TABLE public.cmsplugin_filer_teaser_filerteaser OWNER TO daiech;

--
-- Name: cmsplugin_filer_video_filervideo; Type: TABLE; Schema: public; Owner: daiech; Tablespace: 
--

CREATE TABLE cmsplugin_filer_video_filervideo (
    cmsplugin_ptr_id integer NOT NULL,
    movie_id integer,
    movie_url character varying(255),
    image_id integer,
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
    CONSTRAINT cmsplugin_filervideo_height_check CHECK ((height >= 0)),
    CONSTRAINT cmsplugin_filervideo_width_check CHECK ((width >= 0))
);


ALTER TABLE public.cmsplugin_filer_video_filervideo OWNER TO daiech;

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

ALTER TABLE ONLY cmsplugin_filer_image_thumbnailoption ALTER COLUMN id SET DEFAULT nextval('cmsplugin_filer_image_thumbnailoption_id_seq'::regclass);


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
140	Can add filer file	46	add_filerfile
141	Can change filer file	46	change_filerfile
142	Can delete filer file	46	delete_filerfile
143	Can add filer folder	47	add_filerfolder
144	Can change filer folder	47	change_filerfolder
145	Can delete filer folder	47	delete_filerfolder
146	Can add filer link plugin	48	add_filerlinkplugin
147	Can change filer link plugin	48	change_filerlinkplugin
148	Can delete filer link plugin	48	delete_filerlinkplugin
149	Can add filer image	49	add_filerimage
150	Can change filer image	49	change_filerimage
151	Can delete filer image	49	delete_filerimage
152	Can add thumbnail option	50	add_thumbnailoption
153	Can change thumbnail option	50	change_thumbnailoption
154	Can delete thumbnail option	50	delete_thumbnailoption
155	Can add filer teaser	51	add_filerteaser
156	Can change filer teaser	51	change_filerteaser
157	Can delete filer teaser	51	delete_filerteaser
158	Can add filer video	52	add_filervideo
159	Can change filer video	52	change_filervideo
160	Can delete filer video	52	delete_filervideo
161	Can add contact	53	add_contact
162	Can change contact	53	change_contact
163	Can delete contact	53	delete_contact
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('auth_permission_id_seq', 163, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$aB9o9RyoNQnZ$5tdKcbsoLTAzznqRVgf+PHw/nuT6yJgMugcYU9WC4NQ=	2014-11-13 10:49:29.698817-05	t	admin				t	t	2014-11-06 15:20:01.743865-05
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
97	8	93	0	es	TextPlugin	2014-11-11 10:54:08.529226-05	2014-11-12 19:15:38.773865-05	2	9	14	4
1	4	\N	0	es	CssBackgroundPlugIn	2014-11-06 16:14:34.907012-05	2014-11-11 11:55:38.71656-05	0	1	2	1
502	11	501	0	es	FilerImagePlugin	2014-11-11 10:26:03.686133-05	2014-11-13 11:50:23.73446-05	3	10	11	46
207	6	\N	1	es	CssBackgroundPlugIn	2014-11-12 11:01:14.717907-05	2014-11-12 16:03:03.209729-05	0	1	2	6
210	7	\N	0	es	TextPlugin	2014-11-07 18:13:50.764039-05	2014-11-12 11:09:23.524058-05	0	1	2	8
216	7	215	0	es	TextPlugin	2014-11-12 11:19:45.2513-05	2014-11-12 15:31:24.579579-05	2	3	4	9
240	7	213	0	es	TextPlugin	2014-11-12 15:16:16.36001-05	2014-11-12 15:30:26.628288-05	2	9	10	9
213	7	212	1	es	StylePlugin	2014-11-12 11:18:51.977641-05	2014-11-12 11:33:28.60045-05	1	6	11	9
40	5	39	0	es	FilerImagePlugin	2014-11-11 10:26:03.686133-05	2014-11-11 10:32:28.182304-05	3	4	5	2
39	5	38	0	es	TextPlugin	2014-11-11 10:25:59.15842-05	2014-11-11 10:42:20.120156-05	2	3	6	2
38	5	17	3	es	StylePlugin	2014-11-11 10:14:55.426879-05	2014-11-11 10:33:57.770142-05	1	2	7	2
37	5	36	0	es	FilerImagePlugin	2014-11-11 10:26:03.686133-05	2014-11-11 10:29:01.607657-05	3	10	11	2
36	5	35	0	es	TextPlugin	2014-11-11 10:25:59.15842-05	2014-11-11 10:41:40.268836-05	2	9	12	2
35	5	17	0	es	StylePlugin	2014-11-11 10:14:55.426879-05	2014-11-11 10:33:27.56299-05	1	8	13	2
242	6	\N	2	es	TextPlugin	2014-11-12 16:02:46.170672-05	2014-11-13 11:48:53.066373-05	0	1	6	17
31	5	30	0	es	FilerImagePlugin	2014-11-11 10:26:03.686133-05	2014-11-11 10:31:34.489273-05	3	16	17	2
30	5	24	0	es	TextPlugin	2014-11-11 10:25:59.15842-05	2014-11-11 10:42:09.186216-05	2	15	18	2
24	5	17	2	es	StylePlugin	2014-11-11 10:14:55.426879-05	2014-11-11 10:33:48.726889-05	1	14	19	2
43	5	42	0	es	FilerImagePlugin	2014-11-11 10:26:03.686133-05	2014-11-11 10:31:05.160225-05	3	22	23	2
42	5	41	0	es	TextPlugin	2014-11-11 10:25:59.15842-05	2014-11-11 10:41:53.632108-05	2	21	24	2
495	10	\N	0	es	CssBackgroundPlugIn	2014-11-06 16:14:34.907012-05	2014-11-13 11:50:23.521235-05	0	1	2	45
41	5	17	1	es	StylePlugin	2014-11-11 10:14:55.426879-05	2014-11-11 10:33:38.650076-05	1	20	25	2
17	5	\N	1	es	StylePlugin	2014-11-07 18:13:15.507002-05	2014-11-11 11:53:00.27532-05	0	1	26	2
18	5	\N	0	es	TextPlugin	2014-11-07 18:13:50.764039-05	2014-11-11 10:28:41.444759-05	0	1	2	3
103	8	102	0	es	FilerImagePlugin	2014-11-11 11:29:19.490898-05	2014-11-12 10:58:52.148026-05	3	4	5	4
102	8	94	0	es	TextPlugin	2014-11-11 11:28:23.726583-05	2014-11-12 10:58:53.970851-05	2	3	6	4
94	8	90	1	es	StylePlugin	2014-11-11 10:50:12.187454-05	2014-11-11 11:33:18.964646-05	1	2	7	4
104	8	97	0	es	FilerImagePlugin	2014-11-11 11:34:51.310174-05	2014-11-11 11:35:22.149638-05	3	10	11	4
105	8	97	1	es	FilerImagePlugin	2014-11-11 11:35:12.283894-05	2014-11-11 11:35:22.157552-05	3	12	13	4
93	8	90	2	es	StylePlugin	2014-11-11 10:50:12.187454-05	2014-11-11 11:33:30.05468-05	1	8	15	4
249	8	99	1	es	FilerLinkPlugin	2014-11-12 18:51:57.242455-05	2014-11-12 18:52:02.429659-05	3	20	21	4
99	8	91	0	es	TextPlugin	2014-11-11 11:23:24.547943-05	2014-11-12 18:52:04.870731-05	2	17	22	4
91	8	90	0	es	StylePlugin	2014-11-11 10:50:12.187454-05	2014-11-11 11:33:04.265096-05	1	16	23	4
90	8	\N	1	es	StylePlugin	2014-11-11 10:49:45.28612-05	2014-11-11 10:53:17.959032-05	0	1	24	4
247	8	99	0	es	FilerLinkPlugin	2014-11-12 18:49:25.72687-05	2014-11-12 18:49:50.381065-05	3	18	19	4
211	7	213	1	es	ContactPlugin	2014-11-12 11:13:44.469257-05	2014-11-12 15:16:43.445214-05	2	7	8	9
209	6	\N	0	es	TextPlugin	2014-11-07 18:13:50.764039-05	2014-11-12 16:03:03.193219-05	0	1	2	7
215	7	212	0	es	StylePlugin	2014-11-12 11:18:51.977641-05	2014-11-12 14:59:56.478638-05	1	2	5	9
212	7	\N	2	es	StylePlugin	2014-11-12 11:18:25.902949-05	2014-11-12 11:18:40.597812-05	0	1	12	9
497	11	496	3	es	StylePlugin	2014-11-11 10:14:55.426879-05	2014-11-13 11:50:23.577699-05	1	2	7	46
499	11	498	0	es	FilerImagePlugin	2014-11-11 10:26:03.686133-05	2014-11-13 11:50:23.64359-05	3	4	5	46
457	9	456	1	es	StylePlugin	2014-11-11 10:50:12.187454-05	2014-11-12 19:32:01.613354-05	1	2	7	44
459	9	458	0	es	FilerImagePlugin	2014-11-11 11:29:19.490898-05	2014-11-12 19:32:01.649311-05	3	4	5	44
462	9	461	0	es	FilerImagePlugin	2014-11-11 11:34:51.310174-05	2014-11-12 19:32:01.705525-05	3	10	11	44
460	9	456	2	es	StylePlugin	2014-11-11 10:50:12.187454-05	2014-11-12 19:32:01.66724-05	1	8	15	44
463	9	461	1	es	FilerImagePlugin	2014-11-11 11:35:12.283894-05	2014-11-12 19:32:01.72628-05	3	12	13	44
466	9	465	0	es	FilerLinkPlugin	2014-11-12 18:49:25.72687-05	2014-11-12 19:32:01.777877-05	3	18	19	44
456	9	\N	1	es	StylePlugin	2014-11-11 10:49:45.28612-05	2014-11-12 19:32:01.599898-05	0	1	24	44
464	9	456	0	es	StylePlugin	2014-11-11 10:50:12.187454-05	2014-11-12 19:32:01.741674-05	1	16	23	44
467	9	465	1	es	FilerLinkPlugin	2014-11-12 18:51:57.242455-05	2014-11-12 19:32:01.791168-05	3	20	21	44
458	9	457	0	es	TextPlugin	2014-11-11 11:28:23.726583-05	2014-11-12 19:32:01.818335-05	2	3	6	44
461	9	460	0	es	TextPlugin	2014-11-11 10:54:08.529226-05	2014-11-12 19:32:01.849936-05	2	9	14	44
465	9	464	0	es	TextPlugin	2014-11-11 11:23:24.547943-05	2014-11-12 19:32:01.881583-05	2	17	22	44
468	6	242	0	es	FilerImagePlugin	2014-11-13 10:51:41.940677-05	2014-11-13 10:56:18.812567-05	1	4	5	17
500	11	496	0	es	StylePlugin	2014-11-11 10:14:55.426879-05	2014-11-13 11:50:23.67569-05	1	8	13	46
503	11	496	2	es	StylePlugin	2014-11-11 10:14:55.426879-05	2014-11-13 11:50:23.75986-05	1	14	19	46
505	11	504	0	es	FilerImagePlugin	2014-11-11 10:26:03.686133-05	2014-11-13 11:50:23.823619-05	3	16	17	46
496	11	\N	1	es	StylePlugin	2014-11-07 18:13:15.507002-05	2014-11-13 11:50:23.550653-05	0	1	26	46
506	11	496	1	es	StylePlugin	2014-11-11 10:14:55.426879-05	2014-11-13 11:50:23.855469-05	1	20	25	46
508	11	507	0	es	FilerImagePlugin	2014-11-11 10:26:03.686133-05	2014-11-13 11:50:23.924948-05	3	22	23	46
498	11	497	0	es	TextPlugin	2014-11-11 10:25:59.15842-05	2014-11-13 11:50:23.997337-05	2	3	6	46
501	11	500	0	es	TextPlugin	2014-11-11 10:25:59.15842-05	2014-11-13 11:50:24.036037-05	2	9	12	46
504	11	503	0	es	TextPlugin	2014-11-11 10:25:59.15842-05	2014-11-13 11:50:24.075072-05	2	15	18	46
507	11	506	0	es	TextPlugin	2014-11-11 10:25:59.15842-05	2014-11-13 11:50:24.116454-05	2	21	24	46
509	11	\N	0	es	TextPlugin	2014-11-07 18:13:50.764039-05	2014-11-13 11:50:24.14212-05	0	1	2	47
510	12	\N	1	es	CssBackgroundPlugIn	2014-11-12 11:01:14.717907-05	2014-11-13 11:50:24.166887-05	0	1	2	48
513	12	512	0	es	FilerImagePlugin	2014-11-13 10:51:41.940677-05	2014-11-13 11:50:24.23812-05	1	2	3	50
511	12	\N	0	es	TextPlugin	2014-11-07 18:13:50.764039-05	2014-11-13 11:50:24.267837-05	0	1	2	49
512	12	\N	2	es	TextPlugin	2014-11-12 16:02:46.170672-05	2014-11-13 11:50:24.298614-05	0	1	4	50
516	13	515	0	es	StylePlugin	2014-11-12 11:18:51.977641-05	2014-11-13 11:50:24.37148-05	1	2	5	52
519	13	518	1	es	ContactPlugin	2014-11-12 11:13:44.469257-05	2014-11-13 11:50:24.45271-05	2	7	8	52
515	13	\N	2	es	StylePlugin	2014-11-12 11:18:25.902949-05	2014-11-13 11:50:24.348526-05	0	1	12	52
518	13	515	1	es	StylePlugin	2014-11-12 11:18:51.977641-05	2014-11-13 11:50:24.429922-05	1	6	11	52
514	13	\N	0	es	TextPlugin	2014-11-07 18:13:50.764039-05	2014-11-13 11:50:24.502178-05	0	1	2	51
517	13	516	0	es	TextPlugin	2014-11-12 11:19:45.2513-05	2014-11-13 11:50:24.530465-05	2	3	4	52
520	13	518	0	es	TextPlugin	2014-11-12 15:16:16.36001-05	2014-11-13 11:50:24.555369-05	2	9	10	52
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 520, true);


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
2	admin	admin	\N	2014-11-06 15:22:57.819562-05	2014-11-13 11:50:24.600837-05	2014-11-06 15:22:57.810225-05	\N	t	f	\N	\N	INHERIT	1	0	1	2	2	f	\N	f	1	0	\N	\N	t	es	0
1	admin	admin	\N	2014-11-06 15:22:57.712077-05	2014-11-13 11:50:24.908406-05	2014-11-06 15:22:57.810225-05	\N	t	f	\N	\N	INHERIT	1	0	1	2	1	f	\N	t	2	0	\N	\N	t	es	0
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
1	es	Inicio	Inicio	inicio		f	\N	Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft	Inicio	1	2014-11-06 15:22:57.76243-05	t	t	2	0
2	es	Inicio	Inicio	inicio		f	\N	Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft	Inicio	2	2014-11-06 15:22:57.76243-05	t	f	1	1
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
-- Data for Name: cmsplugin_contact_contact; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cmsplugin_contact_contact (cmsplugin_ptr_id, site_email, thanks, submit, spam_protection_method, akismet_api_key, recaptcha_public_key, recaptcha_private_key, recaptcha_theme, form_name, form_layout, redirect_url) FROM stdin;
211	contacto@daiech.com	<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\r\n	Enviar	0				clean	Destaju General	cmsplugin_contact.forms.ContactForm	
519	contacto@daiech.com	<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\r\n	Enviar	0				clean	Destaju General	cmsplugin_contact.forms.ContactForm	
\.


--
-- Data for Name: cmsplugin_filer_file_filerfile; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cmsplugin_filer_file_filerfile (cmsplugin_ptr_id, file_id, title, target_blank, style) FROM stdin;
\.


--
-- Data for Name: cmsplugin_filer_folder_filerfolder; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cmsplugin_filer_folder_filerfolder (cmsplugin_ptr_id, title, folder_id, style) FROM stdin;
\.


--
-- Data for Name: cmsplugin_filer_image_filerimage; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cmsplugin_filer_image_filerimage (cmsplugin_ptr_id, image_id, alt_text, caption_text, use_autoscale, width, height, alignment, free_link, page_link_id, description, image_url, thumbnail_option_id, crop, upscale, original_link, file_link_id, use_original_image, target_blank, style) FROM stdin;
37	5	Control		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
43	4	Inventario		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
31	3	Portable		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
40	6	Nómina		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
104	8	Español		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
105	7	English		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
459	13	Daiech		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
462	8	Español		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
463	7	English		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
103	13	Daiech		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
468	17			f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
499	6	Nómina		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
502	5	Control		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
505	3	Portable		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
508	4	Inventario		f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
513	17			f	\N	\N	\N		\N			\N	t	t	f	\N	f	f	
\.


--
-- Data for Name: cmsplugin_filer_image_thumbnailoption; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cmsplugin_filer_image_thumbnailoption (id, name, width, height, crop, upscale) FROM stdin;
\.


--
-- Name: cmsplugin_filer_image_thumbnailoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('cmsplugin_filer_image_thumbnailoption_id_seq', 1, false);


--
-- Data for Name: cmsplugin_filer_link_filerlinkplugin; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cmsplugin_filer_link_filerlinkplugin (cmsplugin_ptr_id, name, url, page_link_id, mailto, link_style, new_window, file_id) FROM stdin;
247	Conozca la empresa	https://daiech.com	\N		 	f	\N
249	Conozca más de Destaju	http://destaju.com/conozca-destaju	\N		 	f	\N
466	Conozca la empresa	https://daiech.com	\N		 	f	\N
467	Conozca más de Destaju	http://destaju.com/conozca-destaju	\N		 	f	\N
\.


--
-- Data for Name: cmsplugin_filer_teaser_filerteaser; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cmsplugin_filer_teaser_filerteaser (cmsplugin_ptr_id, title, image_id, use_autoscale, width, height, free_link, page_link_id, description, style, target_blank, image_url) FROM stdin;
\.


--
-- Data for Name: cmsplugin_filer_video_filervideo; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY cmsplugin_filer_video_filervideo (cmsplugin_ptr_id, movie_id, movie_url, image_id, width, height, auto_play, auto_hide, fullscreen, loop, bgcolor, textcolor, seekbarcolor, seekbarbgcolor, loadingbarcolor, buttonoutcolor, buttonovercolor, buttonhighlightcolor) FROM stdin;
\.


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
7	2014-11-11 10:12:12.221176-05	1	7	1	destaju.com	2	Modificado/a domain y name.
8	2014-11-11 10:15:27.121676-05	1	12	1	clipboard	3	
9	2014-11-11 10:19:53.419224-05	1	12	27	27	3	
10	2014-11-11 10:25:50.037729-05	1	12	28	28	3	
11	2014-11-11 10:28:00.703132-05	1	12	25	25	3	
12	2014-11-11 10:28:07.351755-05	1	12	26	26	3	
13	2014-11-11 10:28:15.883555-05	1	12	22	22	3	
14	2014-11-11 10:28:18.112146-05	1	12	1	clipboard	3	
15	2014-11-11 10:28:54.659017-05	1	12	1	clipboard	3	
16	2014-11-11 10:34:32.093549-05	1	12	1	Inicio	2	
17	2014-11-11 10:40:12.090805-05	1	12	1	Inicio	2	
18	2014-11-11 10:42:28.003431-05	1	12	1	Inicio	2	
19	2014-11-11 10:49:38.081577-05	1	19	89	89	3	
20	2014-11-11 10:50:56.962983-05	1	12	1	clipboard	3	
21	2014-11-11 10:51:03.839565-05	1	12	1	clipboard	3	
22	2014-11-11 10:51:24.181972-05	1	12	1	clipboard	3	
23	2014-11-11 10:53:54.27959-05	1	19	95	95	3	
24	2014-11-11 11:28:17.13461-05	1	19	100	100	3	
25	2014-11-11 11:47:02.772825-05	1	12	1	Inicio	2	
26	2014-11-11 12:09:56.266598-05	1	12	1	Inicio	2	
27	2014-11-11 17:43:25.189611-05	1	7	2	www.destaju.com/es	1	
28	2014-11-11 17:43:39.65748-05	1	7	3	www.destaju.com/en	1	
29	2014-11-11 17:48:38.164522-05	1	12	1	Inicio	2	
30	2014-11-11 17:50:30.272458-05	1	7	3	destaju.com/en	2	Modificado/a domain.
31	2014-11-11 17:50:35.180912-05	1	7	2	destaju.com/es	2	Modificado/a domain.
32	2014-11-12 10:59:11.842193-05	1	12	1	Inicio	2	
33	2014-11-12 11:02:54.104215-05	1	12	1	clipboard	3	
34	2014-11-12 11:19:19.720766-05	1	12	1	clipboard	3	
35	2014-11-12 11:19:23.423289-05	1	12	1	clipboard	3	
36	2014-11-12 11:23:16.074528-05	1	12	1	Inicio	2	
37	2014-11-12 16:03:07.954098-05	1	12	241	241	3	
38	2014-11-12 19:09:06.20522-05	1	12	1	clipboard	3	
39	2014-11-12 19:11:42.583275-05	1	12	1	Inicio	2	
40	2014-11-12 19:14:35.619508-05	1	12	1	Inicio	2	
41	2014-11-12 19:19:49.015539-05	1	39	14	categorias1.png	3	
42	2014-11-12 19:29:02.003294-05	1	42	15	sinagro.png	2	Modificado/a subject_location.
43	2014-11-12 19:32:01.888731-05	1	12	1	Inicio	2	
44	2014-11-13 11:35:46.145289-05	1	12	1	Inicio	2	
45	2014-11-13 11:50:24.689262-05	1	12	1	Inicio	2	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 45, true);


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
46	filer file	cmsplugin_filer_file	filerfile
47	filer folder	cmsplugin_filer_folder	filerfolder
48	filer link plugin	cmsplugin_filer_link	filerlinkplugin
49	filer image	cmsplugin_filer_image	filerimage
50	thumbnail option	cmsplugin_filer_image	thumbnailoption
51	filer teaser	cmsplugin_filer_teaser	filerteaser
52	filer video	cmsplugin_filer_video	filervideo
53	contact	cmsplugin_contact	contact
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('django_content_type_id_seq', 53, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
n1rjvnf4ljieg5yh4q4lmkf5lfsde1fk	YTY3MmJkOTUyZGVmMjlmOWY1Y2I4ZDkyMDMzMWFkY2I1NTdhOTQ0Zjp7ImNtc19hZG1pbl9zaXRlIjoxLCJmaWxlcl9sYXN0X2ZvbGRlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImNtc19lZGl0IjpmYWxzZX0=	2014-11-26 19:32:02.498367-05
tmjgn3qw9jkqu49nc0l9zea9orstvpl7	YTU4YWEyNjQ1YTIyMDMzMTI3YzNiMmM4N2EyOGQ1YzIxNjZhMjljZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiY21zX2VkaXQiOmZhbHNlfQ==	2014-11-21 18:23:04.53718-05
zlv7qi48900qbtpq545gop8zsvm3egn8	ZDIyYWU5YjBiMWYwMTA4ODRiZGI1ODkwZjQ1MTQ2MWEzMzNmMGU3ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MSwiZmlsZXJfbGFzdF9mb2xkZXJfaWQiOiI0IiwiY21zX2VkaXQiOmZhbHNlfQ==	2014-11-27 11:50:25.624702-05
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY django_site (id, domain, name) FROM stdin;
1	destaju.com	Destaju
3	destaju.com/en	Destaju Ingles
2	destaju.com/es	Destaju Español
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('django_site_id_seq', 3, true);


--
-- Data for Name: djangocms-css-background_cssbackground; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY "djangocms-css-background_cssbackground" (cmsplugin_ptr_id, bg_type, image_id, r, g, b, a) FROM stdin;
1	image	11	0	0	0	0
207	rgb	\N	210	224	217	0
495	image	11	0	0	0	0
510	rgb	\N	210	224	217	0
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
212	info	\N	\N	\N	\N	\N	\N	\N	\N	div	row-fluid, box
35	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-3, col-sm-6
41	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-3, col-sm-6
24	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-3, col-sm-6
38	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-3, col-sm-6
213	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-6, col-sm-6
215	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-6, col-sm-6, contact-info
90	info	\N	\N	\N	\N	\N	\N	\N	\N	div	row-fluid, box
91	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-4, col-sm-4, col-xs-12
94	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-4, col-sm-4, col-xs-12
93	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-4, col-sm-4, col-xs-12
17	info	\N	\N	\N	\N	\N	\N	\N	\N	div	row-fluid, box
456	info	\N	\N	\N	\N	\N	\N	\N	\N	div	row-fluid, box
457	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-4, col-sm-4, col-xs-12
460	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-4, col-sm-4, col-xs-12
464	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-4, col-sm-4, col-xs-12
496	info	\N	\N	\N	\N	\N	\N	\N	\N	div	row-fluid, box
497	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-3, col-sm-6
500	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-3, col-sm-6
503	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-3, col-sm-6
506	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-3, col-sm-6
515	info	\N	\N	\N	\N	\N	\N	\N	\N	div	row-fluid, box
516	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-6, col-sm-6, contact-info
518	info	\N	\N	\N	\N	\N	\N	\N	\N	div	col-md-6, col-sm-6
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
97	<div class="text-right">\n<p style="text-align: right;">Ver la página en:</p>\n\n<p style="text-align: right;"><a href="/es">Español <img id="plugin_obj_104" alt="Imagen" title="Imagen - es.png" src="/media/filer_public_thumbnails/filer_public/c6/f1/c6f151dc-4f65-414a-a58f-979b1616bac0/es.png__16x11_q85_crop_subsampling-2_upscale.jpg"></a></p>\n\n<p style="text-align: right;"><a href="/en">Ingles <img id="plugin_obj_105" alt="Imagen" title="Imagen - en.png" src="/media/filer_public_thumbnails/filer_public/05/a1/05a17a7e-452f-43a5-b33e-1ba5770d6aef/en.png__16x11_q85_crop_subsampling-2_upscale.jpg"></a></p>\n\n</div>
30	<p style="text-align: center;"><img id="plugin_obj_31" alt="Imagen" title="Imagen - ico-3.png" src="/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png"></p>\n\n<h4 style="text-align: center;">Acceso a su información<br>\ndesde cualquier dispositivo</h4>\n
39	<p style="text-align: center;"><img id="plugin_obj_40" alt="Imagen - ico-1.png" title="Imagen - ico-1.png" src="/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png"></p>\n\n<h4 style="text-align: center;">Exporte su información<br>\npara alimentar su contabilidad</h4>\n
18	<h2 style="text-align: center;">BENEFICIOS</h2>\n\n<p> </p>\n
240	<h4>Déjenos un mensaje!</h4>\n\n<hr>
99	<p><span style="line-height: 20.7999992370605px;"><img id="plugin_obj_249" alt="Enlace" title="Enlace - Conozca más de Destaju" src="/static/cms/images/plugins/link.png"></span></p>\n\n<p><img id="plugin_obj_247" alt="Enlace" title="Enlace - Conozca la empresa" src="/static/cms/images/plugins/link.png"></p>\n
36	<p style="text-align: center;"><img id="plugin_obj_37" alt="Imagen - ico-1.png" title="Imagen - ico-1.png" src="/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png"></p>\n\n<h4 style="text-align: center;">Mayor control de las<br>\nactividades de sus empleados</h4>\n
42	<p style="text-align: center;"><img id="plugin_obj_43" alt="Imagen" title="Imagen - ico-2.png" src="/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png"></p>\n\n<h4 style="text-align: center;">Mayor control de<br>\nsus equipos e insumos</h4>\n
102	<p style="text-align: center;">Daiech 2014. Todos los derechos reservados.</p>\n\n<p style="text-align: center;">Un producto <img id="plugin_obj_103" alt="Imagen" title="Imagen - logo.png" src="/media/filer_public_thumbnails/filer_public/aa/35/aa350e0f-81f9-4607-99aa-f306678018fe/logo.png__113x23_q85_crop_subsampling-2_upscale.png"></p>\n
216	<h4>¿Tiene alguna duda?</h4>\n\n<hr>\n<p>Cra 31 #15-87</p>\n\n<p>Barrio San Luis</p>\n\n<p>Pereira, Colombia, Sur América</p>\n\n<p>contacto@daiech.com</p>\n\n<p> </p>\n
458	<p style="text-align: center;">Daiech 2014. Todos los derechos reservados.</p>\n\n<p style="text-align: center;">Un producto <img id="plugin_obj_459" alt="Imagen - logo.png" title="Imagen - logo.png" src="/media/filer_public_thumbnails/filer_public/aa/35/aa350e0f-81f9-4607-99aa-f306678018fe/logo.png__113x23_q85_crop_subsampling-2_upscale.png"></p>\n
461	<div class="text-right">\n<p style="text-align: right;">Ver la página en:</p>\n\n<p style="text-align: right;"><a href="/es">Español <img id="plugin_obj_462" alt="Imagen - es.png" title="Imagen - es.png" src="/media/filer_public_thumbnails/filer_public/c6/f1/c6f151dc-4f65-414a-a58f-979b1616bac0/es.png__16x11_q85_crop_subsampling-2_upscale.jpg"></a></p>\n\n<p style="text-align: right;"><a href="/en">Ingles <img id="plugin_obj_463" alt="Imagen - en.png" title="Imagen - en.png" src="/media/filer_public_thumbnails/filer_public/05/a1/05a17a7e-452f-43a5-b33e-1ba5770d6aef/en.png__16x11_q85_crop_subsampling-2_upscale.jpg"></a></p>\n\n</div>
465	<p><span style="line-height: 20.7999992370605px;"><img id="plugin_obj_467" alt="Enlace - Conozca más de Destaju" title="Enlace - Conozca más de Destaju" src="/static/cms/images/plugins/link.png"></span></p>\n\n<p><img id="plugin_obj_466" alt="Enlace - Conozca la empresa" title="Enlace - Conozca la empresa" src="/static/cms/images/plugins/link.png"></p>\n
209	<h2 style="text-align: center;">SECTORES</h2>\n\n<p> </p>\n
210	<h2 style="text-align: center;">CONTACTO</h2>\n\n<p> </p>\n
242	<p style="text-align: center;"><a href="http://destaju.com/agro"><img class=" img-responsive " alt="Imagen" title="Destaju Agro" id="plugin_obj_468" src="/media/filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__800x399_q85_crop_subsampling-2_upscale.png"></a></p>\n
498	<p style="text-align: center;"><img id="plugin_obj_499" alt="Imagen - ico-4.png" title="Imagen - ico-4.png" src="/media/filer_public_thumbnails/filer_public/05/d0/05d007af-5b7e-41b8-951c-7d604c44302a/ico-4.png__184x183_q85_crop_subsampling-2_upscale.png"></p>\n\n<h4 style="text-align: center;">Exporte su información<br>\npara alimentar su contabilidad</h4>\n
501	<p style="text-align: center;"><img id="plugin_obj_502" alt="Imagen - ico-1.png" title="Imagen - ico-1.png" src="/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png"></p>\n\n<h4 style="text-align: center;">Mayor control de las<br>\nactividades de sus empleados</h4>\n
504	<p style="text-align: center;"><img id="plugin_obj_505" alt="Imagen - ico-3.png" title="Imagen - ico-3.png" src="/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png"></p>\n\n<h4 style="text-align: center;">Acceso a su información<br>\ndesde cualquier dispositivo</h4>\n
507	<p style="text-align: center;"><img id="plugin_obj_508" alt="Imagen - ico-2.png" title="Imagen - ico-2.png" src="/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png"></p>\n\n<h4 style="text-align: center;">Mayor control de<br>\nsus equipos e insumos</h4>\n
509	<h2 style="text-align: center;">BENEFICIOS</h2>\n\n<p> </p>\n
511	<h2 style="text-align: center;">SECTORES</h2>\n\n<p> </p>\n
512	<p style="text-align: center;"><a href="http://destaju.com/agro"><img id="plugin_obj_513" alt="Imagen - conagro.png" title="Imagen - conagro.png" src="/media/filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__800x399_q85_crop_subsampling-2_upscale.png"></a></p>\n
514	<h2 style="text-align: center;">CONTACTO</h2>\n\n<p> </p>\n
517	<h4>¿Tiene alguna duda?</h4>\n\n<hr>\n<p>Cra 31 #15-87</p>\n\n<p>Barrio San Luis</p>\n\n<p>Pereira, Colombia, Sur América</p>\n\n<p>contacto@daiech.com</p>\n\n<p> </p>\n
520	<h4>Déjenos un mensaje!</h4>\n\n<hr>
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
4	filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png	2014-11-11 10:27:05.700485-05	f9bde26a1556cd667f742bd34ec7c55e
5	filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png	2014-11-11 10:29:42.804802-05	f9bde26a1556cd667f742bd34ec7c55e
3	filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png	2014-11-11 10:31:34.608088-05	f9bde26a1556cd667f742bd34ec7c55e
6	filer_public/05/d0/05d007af-5b7e-41b8-951c-7d604c44302a/ico-4.png	2014-11-11 10:32:28.264429-05	f9bde26a1556cd667f742bd34ec7c55e
8	filer_public/c6/f1/c6f151dc-4f65-414a-a58f-979b1616bac0/es.png	2014-11-11 10:55:38.563178-05	f9bde26a1556cd667f742bd34ec7c55e
9	filer_public/18/8f/188ff9ef-7450-4287-9c55-156e8dc92e3f/redes-badera.png	2014-11-11 11:24:53.227132-05	f9bde26a1556cd667f742bd34ec7c55e
10	filer_public/59/8e/598e440e-4424-4995-b7e9-1a9571bbcaf8/logo-daiech.png	2014-11-11 11:27:29.275324-05	f9bde26a1556cd667f742bd34ec7c55e
7	filer_public/05/a1/05a17a7e-452f-43a5-b33e-1ba5770d6aef/en.png	2014-11-11 11:35:20.142226-05	f9bde26a1556cd667f742bd34ec7c55e
11	filer_public/59/5a/595a0a93-3921-4f57-822e-bebaabea59f6/path.png	2014-11-11 11:55:31.042647-05	f9bde26a1556cd667f742bd34ec7c55e
12	filer_public/85/a4/85a4f0ed-384f-47b0-8362-f0d8ffab4f8e/logo-centro-peq.png	2014-11-11 11:55:31.047866-05	f9bde26a1556cd667f742bd34ec7c55e
13	filer_public/aa/35/aa350e0f-81f9-4607-99aa-f306678018fe/logo.png	2014-11-12 10:58:52.212037-05	f9bde26a1556cd667f742bd34ec7c55e
16	filer_public/9f/a0/9fa02585-50f8-4a20-b055-3334fe32e48c/categorias1.png	2014-11-12 19:20:06.860195-05	f9bde26a1556cd667f742bd34ec7c55e
15	filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png	2014-11-12 19:29:06.789719-05	f9bde26a1556cd667f742bd34ec7c55e
17	filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png	2014-11-13 10:56:19.121173-05	f9bde26a1556cd667f742bd34ec7c55e
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 17, true);


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
9	filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.33447-05	3	f9bde26a1556cd667f742bd34ec7c55e
10	filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.317734-05	4	f9bde26a1556cd667f742bd34ec7c55e
11	filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.33551-05	5	f9bde26a1556cd667f742bd34ec7c55e
12	filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.384025-05	4	f9bde26a1556cd667f742bd34ec7c55e
13	filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.397875-05	5	f9bde26a1556cd667f742bd34ec7c55e
14	filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.403168-05	3	f9bde26a1556cd667f742bd34ec7c55e
15	filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.415215-05	4	f9bde26a1556cd667f742bd34ec7c55e
16	filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.42241-05	5	f9bde26a1556cd667f742bd34ec7c55e
17	filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.426146-05	3	f9bde26a1556cd667f742bd34ec7c55e
18	filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.436129-05	4	f9bde26a1556cd667f742bd34ec7c55e
19	filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.442428-05	5	f9bde26a1556cd667f742bd34ec7c55e
20	filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.453071-05	3	f9bde26a1556cd667f742bd34ec7c55e
21	filer_public_thumbnails/filer_public/05/d0/05d007af-5b7e-41b8-951c-7d604c44302a/ico-4.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.609603-05	6	f9bde26a1556cd667f742bd34ec7c55e
22	filer_public_thumbnails/filer_public/05/d0/05d007af-5b7e-41b8-951c-7d604c44302a/ico-4.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.625276-05	6	f9bde26a1556cd667f742bd34ec7c55e
23	filer_public_thumbnails/filer_public/05/d0/05d007af-5b7e-41b8-951c-7d604c44302a/ico-4.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.646607-05	6	f9bde26a1556cd667f742bd34ec7c55e
24	filer_public_thumbnails/filer_public/05/d0/05d007af-5b7e-41b8-951c-7d604c44302a/ico-4.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-11 10:26:30.666908-05	6	f9bde26a1556cd667f742bd34ec7c55e
25	filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png	2014-11-11 10:27:05.708507-05	4	f9bde26a1556cd667f742bd34ec7c55e
26	filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png	2014-11-11 10:29:42.808463-05	5	f9bde26a1556cd667f742bd34ec7c55e
27	filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png	2014-11-11 10:31:34.613853-05	3	f9bde26a1556cd667f742bd34ec7c55e
28	filer_public_thumbnails/filer_public/05/d0/05d007af-5b7e-41b8-951c-7d604c44302a/ico-4.png__184x183_q85_crop_subsampling-2_upscale.png	2014-11-11 10:32:28.275688-05	6	f9bde26a1556cd667f742bd34ec7c55e
29	filer_public_thumbnails/filer_public/05/a1/05a17a7e-452f-43a5-b33e-1ba5770d6aef/en.png__32x32_q85_crop_subsampling-2_upscale.jpg	2014-11-11 10:55:28.302267-05	7	f9bde26a1556cd667f742bd34ec7c55e
30	filer_public_thumbnails/filer_public/05/a1/05a17a7e-452f-43a5-b33e-1ba5770d6aef/en.png__64x64_q85_crop_subsampling-2_upscale.jpg	2014-11-11 10:55:28.339164-05	7	f9bde26a1556cd667f742bd34ec7c55e
31	filer_public_thumbnails/filer_public/05/a1/05a17a7e-452f-43a5-b33e-1ba5770d6aef/en.png__48x48_q85_crop_subsampling-2_upscale.jpg	2014-11-11 10:55:28.372111-05	7	f9bde26a1556cd667f742bd34ec7c55e
32	filer_public_thumbnails/filer_public/05/a1/05a17a7e-452f-43a5-b33e-1ba5770d6aef/en.png__16x16_q85_crop_subsampling-2_upscale.jpg	2014-11-11 10:55:28.379707-05	7	f9bde26a1556cd667f742bd34ec7c55e
33	filer_public_thumbnails/filer_public/c6/f1/c6f151dc-4f65-414a-a58f-979b1616bac0/es.png__32x32_q85_crop_subsampling-2_upscale.jpg	2014-11-11 10:55:28.402547-05	8	f9bde26a1556cd667f742bd34ec7c55e
34	filer_public_thumbnails/filer_public/c6/f1/c6f151dc-4f65-414a-a58f-979b1616bac0/es.png__64x64_q85_crop_subsampling-2_upscale.jpg	2014-11-11 10:55:28.416426-05	8	f9bde26a1556cd667f742bd34ec7c55e
35	filer_public_thumbnails/filer_public/c6/f1/c6f151dc-4f65-414a-a58f-979b1616bac0/es.png__48x48_q85_crop_subsampling-2_upscale.jpg	2014-11-11 10:55:28.433087-05	8	f9bde26a1556cd667f742bd34ec7c55e
36	filer_public_thumbnails/filer_public/c6/f1/c6f151dc-4f65-414a-a58f-979b1616bac0/es.png__16x16_q85_crop_subsampling-2_upscale.jpg	2014-11-11 10:55:28.449436-05	8	f9bde26a1556cd667f742bd34ec7c55e
37	filer_public_thumbnails/filer_public/c6/f1/c6f151dc-4f65-414a-a58f-979b1616bac0/es.png__16x11_q85_crop_subsampling-2_upscale.jpg	2014-11-11 10:55:38.568127-05	8	f9bde26a1556cd667f742bd34ec7c55e
38	filer_public_thumbnails/filer_public/18/8f/188ff9ef-7450-4287-9c55-156e8dc92e3f/redes-badera.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-11 11:24:53.24003-05	9	f9bde26a1556cd667f742bd34ec7c55e
39	filer_public_thumbnails/filer_public/18/8f/188ff9ef-7450-4287-9c55-156e8dc92e3f/redes-badera.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-11 11:24:53.278894-05	9	f9bde26a1556cd667f742bd34ec7c55e
40	filer_public_thumbnails/filer_public/18/8f/188ff9ef-7450-4287-9c55-156e8dc92e3f/redes-badera.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-11 11:24:53.295585-05	9	f9bde26a1556cd667f742bd34ec7c55e
41	filer_public_thumbnails/filer_public/18/8f/188ff9ef-7450-4287-9c55-156e8dc92e3f/redes-badera.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-11 11:24:53.318227-05	9	f9bde26a1556cd667f742bd34ec7c55e
42	filer_public_thumbnails/filer_public/59/8e/598e440e-4424-4995-b7e9-1a9571bbcaf8/logo-daiech.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-11 11:25:01.389008-05	10	f9bde26a1556cd667f742bd34ec7c55e
43	filer_public_thumbnails/filer_public/59/8e/598e440e-4424-4995-b7e9-1a9571bbcaf8/logo-daiech.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-11 11:25:01.405832-05	10	f9bde26a1556cd667f742bd34ec7c55e
44	filer_public_thumbnails/filer_public/59/8e/598e440e-4424-4995-b7e9-1a9571bbcaf8/logo-daiech.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-11 11:25:01.42068-05	10	f9bde26a1556cd667f742bd34ec7c55e
45	filer_public_thumbnails/filer_public/59/8e/598e440e-4424-4995-b7e9-1a9571bbcaf8/logo-daiech.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-11 11:25:01.435003-05	10	f9bde26a1556cd667f742bd34ec7c55e
46	filer_public_thumbnails/filer_public/59/8e/598e440e-4424-4995-b7e9-1a9571bbcaf8/logo-daiech.png__210x10000_q85_subsampling-2.png	2014-11-11 11:25:05.870424-05	10	f9bde26a1556cd667f742bd34ec7c55e
47	filer_public_thumbnails/filer_public/59/8e/598e440e-4424-4995-b7e9-1a9571bbcaf8/logo-daiech.png__114x22_q85_crop_subsampling-2_upscale.png	2014-11-11 11:27:29.296892-05	10	f9bde26a1556cd667f742bd34ec7c55e
48	filer_public_thumbnails/filer_public/05/a1/05a17a7e-452f-43a5-b33e-1ba5770d6aef/en.png__16x11_q85_crop_subsampling-2_upscale.jpg	2014-11-11 11:35:20.161047-05	7	f9bde26a1556cd667f742bd34ec7c55e
49	filer_public_thumbnails/filer_public/59/5a/595a0a93-3921-4f57-822e-bebaabea59f6/path.png__32x32_q85_crop_subsampling-2_upscale.jpg	2014-11-11 11:55:31.052415-05	11	f9bde26a1556cd667f742bd34ec7c55e
50	filer_public_thumbnails/filer_public/85/a4/85a4f0ed-384f-47b0-8362-f0d8ffab4f8e/logo-centro-peq.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-11 11:55:31.060795-05	12	f9bde26a1556cd667f742bd34ec7c55e
51	filer_public_thumbnails/filer_public/59/5a/595a0a93-3921-4f57-822e-bebaabea59f6/path.png__64x64_q85_crop_subsampling-2_upscale.jpg	2014-11-11 11:55:31.073797-05	11	f9bde26a1556cd667f742bd34ec7c55e
52	filer_public_thumbnails/filer_public/85/a4/85a4f0ed-384f-47b0-8362-f0d8ffab4f8e/logo-centro-peq.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-11 11:55:31.092848-05	12	f9bde26a1556cd667f742bd34ec7c55e
53	filer_public_thumbnails/filer_public/59/5a/595a0a93-3921-4f57-822e-bebaabea59f6/path.png__48x48_q85_crop_subsampling-2_upscale.jpg	2014-11-11 11:55:31.098561-05	11	f9bde26a1556cd667f742bd34ec7c55e
54	filer_public_thumbnails/filer_public/85/a4/85a4f0ed-384f-47b0-8362-f0d8ffab4f8e/logo-centro-peq.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-11 11:55:31.132344-05	12	f9bde26a1556cd667f742bd34ec7c55e
55	filer_public_thumbnails/filer_public/59/5a/595a0a93-3921-4f57-822e-bebaabea59f6/path.png__16x16_q85_crop_subsampling-2_upscale.jpg	2014-11-11 11:55:31.147766-05	11	f9bde26a1556cd667f742bd34ec7c55e
56	filer_public_thumbnails/filer_public/85/a4/85a4f0ed-384f-47b0-8362-f0d8ffab4f8e/logo-centro-peq.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-11 11:55:31.200948-05	12	f9bde26a1556cd667f742bd34ec7c55e
57	filer_public_thumbnails/filer_public/aa/35/aa350e0f-81f9-4607-99aa-f306678018fe/logo.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-12 10:58:39.118319-05	13	f9bde26a1556cd667f742bd34ec7c55e
58	filer_public_thumbnails/filer_public/aa/35/aa350e0f-81f9-4607-99aa-f306678018fe/logo.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-12 10:58:39.181679-05	13	f9bde26a1556cd667f742bd34ec7c55e
59	filer_public_thumbnails/filer_public/aa/35/aa350e0f-81f9-4607-99aa-f306678018fe/logo.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-12 10:58:39.198052-05	13	f9bde26a1556cd667f742bd34ec7c55e
60	filer_public_thumbnails/filer_public/aa/35/aa350e0f-81f9-4607-99aa-f306678018fe/logo.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-12 10:58:39.213971-05	13	f9bde26a1556cd667f742bd34ec7c55e
61	filer_public_thumbnails/filer_public/aa/35/aa350e0f-81f9-4607-99aa-f306678018fe/logo.png__113x23_q85_crop_subsampling-2_upscale.png	2014-11-12 10:58:52.216897-05	13	f9bde26a1556cd667f742bd34ec7c55e
67	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-12 18:22:09.635315-05	15	f9bde26a1556cd667f742bd34ec7c55e
68	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-12 18:22:09.741187-05	15	f9bde26a1556cd667f742bd34ec7c55e
69	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-12 18:22:09.841454-05	15	f9bde26a1556cd667f742bd34ec7c55e
70	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-12 18:22:09.956553-05	15	f9bde26a1556cd667f742bd34ec7c55e
71	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__1429x718_q85_crop_subsampling-2_upscale.png	2014-11-12 18:22:19.376919-05	15	f9bde26a1556cd667f742bd34ec7c55e
72	filer_public_thumbnails/filer_public/9f/a0/9fa02585-50f8-4a20-b055-3334fe32e48c/categorias1.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-12 19:19:59.52921-05	16	f9bde26a1556cd667f742bd34ec7c55e
73	filer_public_thumbnails/filer_public/9f/a0/9fa02585-50f8-4a20-b055-3334fe32e48c/categorias1.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-12 19:19:59.600866-05	16	f9bde26a1556cd667f742bd34ec7c55e
74	filer_public_thumbnails/filer_public/9f/a0/9fa02585-50f8-4a20-b055-3334fe32e48c/categorias1.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-12 19:19:59.651847-05	16	f9bde26a1556cd667f742bd34ec7c55e
75	filer_public_thumbnails/filer_public/9f/a0/9fa02585-50f8-4a20-b055-3334fe32e48c/categorias1.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-12 19:19:59.713601-05	16	f9bde26a1556cd667f742bd34ec7c55e
76	filer_public_thumbnails/filer_public/9f/a0/9fa02585-50f8-4a20-b055-3334fe32e48c/categorias1.png__900x521_q85_crop_subsampling-2_upscale.png	2014-11-12 19:20:06.870577-05	16	f9bde26a1556cd667f742bd34ec7c55e
77	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__210x10000_q85_subsampling-2.png	2014-11-12 19:28:55.522029-05	15	f9bde26a1556cd667f742bd34ec7c55e
78	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__32x32_q85_crop_subject_location-748,319_subsampling-2_upscale.png	2014-11-12 19:29:02.338539-05	15	f9bde26a1556cd667f742bd34ec7c55e
79	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__64x64_q85_crop_subject_location-748,319_subsampling-2_upscale.png	2014-11-12 19:29:02.452341-05	15	f9bde26a1556cd667f742bd34ec7c55e
80	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__48x48_q85_crop_subject_location-748,319_subsampling-2_upscale.png	2014-11-12 19:29:02.570399-05	15	f9bde26a1556cd667f742bd34ec7c55e
81	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__16x16_q85_crop_subject_location-748,319_subsampling-2_upscale.png	2014-11-12 19:29:02.678834-05	15	f9bde26a1556cd667f742bd34ec7c55e
82	filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__1429x718_q85_crop_subject_location-748,319_subsampling-2_upscale.png	2014-11-12 19:29:06.797385-05	15	f9bde26a1556cd667f742bd34ec7c55e
83	filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__32x32_q85_crop_subsampling-2_upscale.png	2014-11-13 10:56:00.789525-05	17	f9bde26a1556cd667f742bd34ec7c55e
84	filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__64x64_q85_crop_subsampling-2_upscale.png	2014-11-13 10:56:01.241488-05	17	f9bde26a1556cd667f742bd34ec7c55e
85	filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__48x48_q85_crop_subsampling-2_upscale.png	2014-11-13 10:56:01.438398-05	17	f9bde26a1556cd667f742bd34ec7c55e
86	filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__16x16_q85_crop_subsampling-2_upscale.png	2014-11-13 10:56:01.597404-05	17	f9bde26a1556cd667f742bd34ec7c55e
87	filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__800x399_q85_crop_subsampling-2_upscale.png	2014-11-13 10:56:19.137654-05	17	f9bde26a1556cd667f742bd34ec7c55e
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 87, true);


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

SELECT pg_catalog.setval('filer_clipboarditem_id_seq', 17, true);


--
-- Data for Name: filer_file; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY filer_file (id, folder_id, file, _file_size, has_all_mandatory_data, original_filename, name, owner_id, uploaded_at, modified_at, description, is_public, sha1, polymorphic_ctype_id) FROM stdin;
1	1	filer_public/c2/82/c282b5df-22ee-46fa-b92c-4eb5a9633d1e/logo-centro.png	57845	f	logo-centro.png		1	2014-11-06 16:15:47.541888-05	2014-11-06 16:15:50.375229-05	\N	t	fd12df0d12104574c9272ae5c2af1f9403d460f0	42
2	1	filer_public/5a/6b/5a6b7854-7713-4c9e-9a0c-ee7ac206288d/pather-1.png	1438	f	pather-1.png		1	2014-11-06 16:15:47.542704-05	2014-11-06 16:15:50.388955-05	\N	t	ff5fd435e6a80e04e3ea914b8b342f8a9445fe8f	42
3	2	filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png	2267	f	ico-3.png		1	2014-11-11 10:26:30.031605-05	2014-11-11 10:26:35.068216-05	\N	t	2a817fac8f98cbf65cb138b20f0179345a18967e	42
4	2	filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png	2398	f	ico-2.png		1	2014-11-11 10:26:30.032138-05	2014-11-11 10:26:35.084763-05	\N	t	fc0febded3e3da8f61fc8fd6e9b9727f4f2d9d3b	42
5	2	filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png	4710	f	ico-1.png		1	2014-11-11 10:26:30.032562-05	2014-11-11 10:26:35.093286-05	\N	t	695d94b93bd188965181f94fd6b686cf35be623f	42
6	2	filer_public/05/d0/05d007af-5b7e-41b8-951c-7d604c44302a/ico-4.png	3565	f	ico-4.png		1	2014-11-11 10:26:30.539718-05	2014-11-11 10:26:35.102112-05	\N	t	859855bb46cc25ea165abec326ae9ae565194f80	42
7	3	filer_public/05/a1/05a17a7e-452f-43a5-b33e-1ba5770d6aef/en.png	609	f	en.png		1	2014-11-11 10:55:28.104343-05	2014-11-11 10:55:29.973526-05	\N	t	dd9e149e2b5ad59dd8b4b262f5fdeb5cc10ecf43	42
8	3	filer_public/c6/f1/c6f151dc-4f65-414a-a58f-979b1616bac0/es.png	483	f	es.png		1	2014-11-11 10:55:28.111095-05	2014-11-11 10:55:29.986983-05	\N	t	7087cd9acff3c7edc747c98245a3a64a6688f686	42
9	\N	filer_public/18/8f/188ff9ef-7450-4287-9c55-156e8dc92e3f/redes-badera.png	1344	f	Redes-badera.png		1	2014-11-11 11:24:53.183632-05	2014-11-11 11:24:53.183683-05	\N	t	8da3e0021d1ee9973b3512fc2552e8c797b971e1	42
10	1	filer_public/59/8e/598e440e-4424-4995-b7e9-1a9571bbcaf8/logo-daiech.png	1172	f	LOGO-DAIECH.png		1	2014-11-11 11:25:01.315772-05	2014-11-11 11:25:03.085207-05	\N	t	e403afe9025dc7df7a01956ade832905c8997cb7	42
11	1	filer_public/59/5a/595a0a93-3921-4f57-822e-bebaabea59f6/path.png	1436	f	path.png		1	2014-11-11 11:55:30.984664-05	2014-11-11 11:55:32.60987-05	\N	t	c750ff0884e6abe20e3be9bdd43f8a2015d2b43f	42
12	1	filer_public/85/a4/85a4f0ed-384f-47b0-8362-f0d8ffab4f8e/logo-centro-peq.png	23386	f	logo-centro-peq.png		1	2014-11-11 11:55:30.996249-05	2014-11-11 11:55:32.662535-05	\N	t	51d63a2342dd4a26ab305096e01b3cf88443d81f	42
13	1	filer_public/aa/35/aa350e0f-81f9-4607-99aa-f306678018fe/logo.png	1142	f	logo.png		1	2014-11-12 10:58:38.971935-05	2014-11-12 10:58:40.597802-05	\N	t	7cf1641d3c29d821da87618a54acfbeac8027ab8	42
16	4	filer_public/9f/a0/9fa02585-50f8-4a20-b055-3334fe32e48c/categorias1.png	69957	f	categorias1.png		1	2014-11-12 19:19:59.348881-05	2014-11-12 19:20:00.835797-05	\N	t	4b47555fdaae1786f43606cbf2606337177eab10	42
15	4	filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png	37844	f	sinagro.png		1	2014-11-12 18:22:09.460077-05	2014-11-12 19:29:02.001312-05		t	756170a895541aab7ce354a793131d96f3485c49	42
17	4	filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png	19017	f	conagro.png		1	2014-11-13 10:56:00.402228-05	2014-11-13 10:56:10.574072-05	\N	t	bb1aa2e9f5d92bc7075f0f8b9012780c09db2295	42
\.


--
-- Name: filer_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('filer_file_id_seq', 17, true);


--
-- Data for Name: filer_folder; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY filer_folder (id, parent_id, name, owner_id, uploaded_at, created_at, modified_at, lft, rght, tree_id, level) FROM stdin;
1	\N	Home	1	2014-11-06 16:15:11.598689-05	2014-11-06 16:15:11.59873-05	2014-11-06 16:15:11.598752-05	1	2	1	0
2	\N	Benefits	1	2014-11-11 10:26:15.082424-05	2014-11-11 10:26:15.082471-05	2014-11-11 10:26:15.082495-05	1	2	2	0
3	\N	Flags	1	2014-11-11 10:54:44.753982-05	2014-11-11 10:54:44.754042-05	2014-11-11 10:54:44.754068-05	1	2	3	0
4	\N	Sectors	1	2014-11-12 16:00:46.644413-05	2014-11-12 16:00:46.644443-05	2014-11-12 16:00:46.644455-05	1	2	4	0
\.


--
-- Name: filer_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('filer_folder_id_seq', 4, true);


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
3	183	184	2014-11-11 10:26:29.870924-05	\N	\N	\N	f	f	\N
4	183	184	2014-11-11 10:26:29.87043-05	\N	\N	\N	f	f	\N
5	183	184	2014-11-11 10:26:29.726493-05	\N	\N	\N	f	f	\N
6	183	184	2014-11-11 10:26:30.534315-05	\N	\N	\N	f	f	\N
7	11	16	2014-11-11 10:55:28.010816-05	\N	\N	\N	f	f	\N
8	11	16	2014-11-11 10:55:28.059602-05	\N	\N	\N	f	f	\N
9	87	139	2014-11-11 11:24:53.170618-05	\N	\N	\N	f	f	\N
10	22	114	2014-11-11 11:25:01.312185-05	\N	\N	\N	f	f	\N
11	88	86	2014-11-11 11:55:30.899437-05	\N	\N	\N	f	f	\N
12	153	340	2014-11-11 11:55:30.88542-05	\N	\N	\N	f	f	\N
13	23	113	2014-11-12 10:58:38.821546-05	\N	\N	\N	f	f	\N
16	521	900	2014-11-12 19:19:59.260804-05	\N	\N	\N	f	f	\N
15	718	1429	2014-11-12 18:22:09.454757-05			\N	f	f	748,319
17	399	800	2014-11-13 10:55:59.876094-05	\N	\N	\N	f	f	\N
\.


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
146	es	1	menu_cache_menu_nodes_es_1_1_user
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 146, true);


--
-- Data for Name: reversion_revision; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY reversion_revision (id, date_created, user_id, comment, manager_slug) FROM stdin;
136	2014-11-12 19:32:01.988546-05	1	Publish	default
95	2014-11-12 11:23:16.166797-05	1	Publish	default
126	2014-11-12 18:20:05.121974-05	1	Texto plugin editado en la posición 2 en sectors	default
127	2014-11-12 18:22:19.420708-05	1	Imagen plugin editado en la posición 0 en sectors	default
128	2014-11-12 18:22:24.170961-05	1	Texto plugin editado en la posición 2 en sectors	default
129	2014-11-12 19:11:42.687551-05	1	Publish	default
130	2014-11-12 19:14:35.727525-05	1	Publish	default
131	2014-11-12 19:20:06.906589-05	1	Imagen plugin editado en la posición 0 en sectors	default
132	2014-11-12 19:20:11.785301-05	1	Texto plugin editado en la posición 2 en sectors	default
133	2014-11-12 19:29:06.836994-05	1	Imagen plugin editado en la posición 0 en sectors	default
70	2014-11-11 11:47:02.973258-05	1	Publish	default
73	2014-11-11 12:09:56.345564-05	1	Publish	default
74	2014-11-11 17:48:38.268866-05	1	Publish	default
75	2014-11-12 10:59:12.006313-05	1	Publish	default
134	2014-11-12 19:29:09.675864-05	1	Texto plugin editado en la posición 2 en sectors	default
135	2014-11-12 19:30:05.107824-05	1	Texto plugin editado en la posición 2 en sectors	default
137	2014-11-13 10:51:42.464803-05	1	Imagen plugin añadido a sectors	default
138	2014-11-13 10:56:19.279391-05	1	Imagen plugin editado en la posición 0 en sectors	default
139	2014-11-13 10:58:03.593203-05	1	Texto plugin editado en la posición 2 en sectors	default
140	2014-11-13 11:35:46.365042-05	1	Publish	default
141	2014-11-13 11:46:41.005388-05	1	Texto plugin editado en la posición 2 en sectors	default
142	2014-11-13 11:48:18.756369-05	1	Texto plugin editado en la posición 2 en sectors	default
143	2014-11-13 11:48:53.317851-05	1	Texto plugin editado en la posición 2 en sectors	default
144	2014-11-13 11:50:24.857001-05	1	Publish	default
\.


--
-- Name: reversion_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('reversion_revision_id_seq', 144, true);


--
-- Data for Name: reversion_version; Type: TABLE DATA; Schema: public; Owner: daiech
--

COPY reversion_version (id, revision_id, object_id, content_type_id, format, serialized_data, object_repr, object_id_int) FROM stdin;
4631	130	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
4632	130	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4633	130	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4634	130	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4635	130	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4636	130	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4637	130	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T00:14:35.234Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4638	130	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
4639	130	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4640	130	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4641	130	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4642	130	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4643	130	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4644	130	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4645	130	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4646	130	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
1684	73	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-11T17:09:56.231Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
1685	73	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
1686	73	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
1687	73	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
1688	73	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
1689	73	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
1690	73	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
1691	73	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
1692	73	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
1693	73	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
1694	73	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
1695	73	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
1696	73	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
1697	73	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
1698	73	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
1699	73	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
1700	73	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 3, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
1701	73	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
1702	73	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
1703	73	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
1704	73	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
1705	73	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
1706	73	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
1707	73	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
1708	73	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
1709	73	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
1710	73	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
1711	73	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 3, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
1712	73	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
1713	73	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
1714	73	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
1715	73	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
1716	73	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
1717	73	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
1718	73	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
1719	73	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
1720	73	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
1721	74	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-11T22:48:37.725Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
1722	74	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
1723	74	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
1724	74	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
1725	74	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
1726	74	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
1727	74	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
1728	74	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
1729	74	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
1730	74	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
1731	74	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
1732	74	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4647	130	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
4648	130	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4649	130	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4650	130	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4651	130	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4652	130	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
4653	130	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4654	130	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
4655	130	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4656	130	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4657	130	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4658	130	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
4659	130	243	11	json	[{"pk": 243, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-12T23:22:19.177Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-12T21:03:23.664Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	243	243
4660	130	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
4661	130	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4662	130	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4663	130	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4664	130	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4665	130	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4666	130	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4667	130	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4668	130	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4669	130	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4670	130	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4671	130	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
4672	130	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
4673	130	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4674	130	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4675	130	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4676	130	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4677	130	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5452	144	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T16:50:24.632Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4678	130	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4679	130	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_243\\" alt=\\"Imagen\\" title=\\"Imagen - sinagro.png\\" src=\\"/media/filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__1429x718_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
4680	130	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4681	130	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4682	130	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
4683	130	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5453	144	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
5454	144	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
5455	144	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
5456	144	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
5457	144	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
5458	144	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
5459	144	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
5460	144	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
5461	144	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4684	130	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T23:22:24.030Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4685	130	243	49	json	[{"pk": 243, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 15, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	sinagro.png	243
4686	130	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4687	130	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4688	130	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4689	130	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4950	135	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4951	135	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4952	135	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4953	135	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
4954	135	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
4955	135	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4956	135	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4957	135	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4958	135	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4959	135	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4960	135	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4961	135	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4962	135	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4963	135	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5462	144	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4964	135	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
1733	74	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
1734	74	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
1735	74	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
1736	74	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
1737	74	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 3, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
1738	74	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
1739	74	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
1740	74	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
1741	74	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
1742	74	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
1743	74	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
1744	74	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
1745	74	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
1746	74	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
1747	74	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
1748	74	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 3, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
1749	74	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
1750	74	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
1751	74	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
1752	74	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
1753	74	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
1754	74	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
1755	74	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
1756	74	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
1757	74	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5463	144	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
5464	144	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
5465	144	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
5466	144	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
5467	144	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
5468	144	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5469	144	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
5470	144	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
5471	144	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
5472	144	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
5473	144	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
5474	144	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
5475	144	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5476	144	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
5477	144	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
5478	144	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
5479	144	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
5480	144	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5481	144	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
5482	144	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
5483	144	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
5484	144	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
5485	144	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4690	131	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
1758	75	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-12T15:59:11.274Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
1759	75	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
1760	75	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
1761	75	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
1762	75	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
1763	75	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
1764	75	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
1765	75	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
1766	75	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4691	131	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4692	131	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4693	131	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4694	131	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4695	131	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4696	131	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T00:14:35.756Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4697	131	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
1767	75	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
1768	75	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
1769	75	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
1770	75	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
1771	75	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
1772	75	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
1773	75	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
1774	75	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 3, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
1775	75	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
1776	75	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
1777	75	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
1778	75	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
1779	75	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
1780	75	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
1781	75	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
1782	75	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
1783	75	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
1784	75	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
1785	75	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 3, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
1786	75	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
1787	75	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
1788	75	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
1789	75	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
1790	75	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
1791	75	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
1792	75	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
1793	75	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
1794	75	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5486	144	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
5487	144	468	11	json	[{"pk": 468, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-13T15:56:18.812Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-13T15:51:41.940Z", "lft": 4, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	468	468
5488	144	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
5489	144	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5490	144	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
5491	144	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5492	144	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4698	131	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4699	131	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4700	131	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4701	131	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4702	131	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4703	131	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4704	131	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4705	131	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4706	131	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
4707	131	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4708	131	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4709	131	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4710	131	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4711	131	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
4712	131	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4713	131	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
4714	131	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4715	131	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4716	131	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4717	131	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
4718	131	243	11	json	[{"pk": 243, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-13T00:20:06.671Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-12T21:03:23.664Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	243	243
4719	131	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
4720	131	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4721	131	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4722	131	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4723	131	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4724	131	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4725	131	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4726	131	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4727	131	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4728	131	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4729	131	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4730	131	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
4731	131	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
4965	135	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5493	144	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
5494	144	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
5495	144	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
5496	144	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
5497	144	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5498	144	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
5499	144	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img class=\\" img-responsive \\" alt=\\"Imagen\\" title=\\"Destaju Agro\\" id=\\"plugin_obj_468\\" src=\\"/media/filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__800x399_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
5500	144	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
5501	144	468	49	json	[{"pk": 468, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 17, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	conagro.png	468
5502	144	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
5503	144	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5504	144	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5505	144	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-13T16:48:53.066Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
5506	144	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
5507	144	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
5508	144	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
5509	144	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5510	144	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4732	131	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4733	131	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4734	131	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4735	131	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4736	131	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
4737	131	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4738	131	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_243\\" alt=\\"Imagen\\" title=\\"Imagen - sinagro.png\\" src=\\"/media/filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__1429x718_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
4739	131	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4740	131	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4741	131	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
4742	131	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
4743	131	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T23:22:24.030Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4744	131	243	49	json	[{"pk": 243, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 16, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	categorias1.png	243
4745	131	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4746	131	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4747	131	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4748	131	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4966	135	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4967	135	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4968	135	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4969	135	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4970	135	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
4971	135	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4972	135	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": ""}}]		242
4973	135	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4974	135	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4749	132	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
4750	132	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4751	132	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4752	132	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4753	132	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4754	132	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4755	132	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T00:20:06.964Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4756	132	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
4757	132	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4758	132	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4759	132	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4760	132	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4761	132	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4762	132	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4763	132	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4764	132	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4765	132	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
4766	132	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4767	132	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4768	132	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4769	132	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4770	132	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
4771	132	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4772	132	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
4773	132	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4774	132	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4775	132	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4776	132	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
4777	132	243	11	json	[{"pk": 243, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-13T00:20:06.671Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-12T21:03:23.664Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	243	243
4778	132	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
4779	132	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4780	132	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4781	132	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4782	132	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4783	132	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4784	132	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4785	132	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4786	132	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4787	132	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4788	132	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4789	132	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
4790	132	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
4791	132	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4792	132	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4793	132	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4794	132	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4795	132	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
4796	132	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4797	132	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_243\\" alt=\\"Imagen\\" title=\\"Imagen - categorias1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/9f/a0/9fa02585-50f8-4a20-b055-3334fe32e48c/categorias1.png__900x521_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
4798	132	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4799	132	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4800	132	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
4801	132	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
4802	132	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-13T00:20:11.649Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4803	132	243	49	json	[{"pk": 243, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 16, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	categorias1.png	243
4804	132	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4805	132	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4806	132	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4807	132	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4975	135	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
4976	135	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
4977	135	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-13T00:30:04.969Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4978	135	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4979	135	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4980	135	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4981	135	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4982	135	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
5006	136	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5007	136	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
5008	136	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
5009	136	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
5010	136	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
5011	136	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5012	136	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
5013	136	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
5014	136	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4808	133	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
4809	133	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4810	133	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4811	133	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4812	133	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4813	133	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4814	133	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T00:20:11.838Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4815	133	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
4816	133	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4817	133	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4818	133	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4819	133	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4820	133	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4821	133	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4822	133	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4823	133	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4824	133	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
4825	133	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4826	133	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4827	133	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4828	133	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4829	133	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
2695	95	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
2673	95	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-12T16:23:16.041Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
2674	95	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
2675	95	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
2676	95	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
2677	95	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
2678	95	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
2679	95	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
2680	95	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
2681	95	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
2682	95	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
2683	95	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
2684	95	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
2685	95	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
2686	95	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
2687	95	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
2688	95	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
2689	95	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
2690	95	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
2691	95	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
2692	95	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
2693	95	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 3, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
2694	95	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
2717	95	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
2696	95	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
2697	95	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
2698	95	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
2699	95	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
2700	95	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
2701	95	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
2702	95	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
2703	95	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 215, "g": 215, "image": null, "bg_type": "rgb", "r": 215}}]	rgb: 215-215-215	207
2704	95	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:03:15.889Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 27, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
2705	95	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 28, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
2706	95	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T16:19:39.528Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
2707	95	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
2708	95	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
2709	95	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 3, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
2710	95	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T16:21:15.547Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
2711	95	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n"}}]	Cra 31 #15-87...	216
2712	95	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
2713	95	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:03:04.478Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 25, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
2714	95	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T16:21:39.422Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
2715	95	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
2716	95	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
2718	95	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
2719	95	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
2720	95	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
2721	95	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
2722	95	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
2723	95	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 30, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
2724	95	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
2725	95	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 9, "changed_date": "2014-11-12T16:21:15.530Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 30, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
1573	70	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-11T16:47:02.438Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
1574	70	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
1575	70	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
1576	70	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
1577	70	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
1578	70	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
1579	70	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
1580	70	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 2, "bg_type": "image", "r": 0}}]	pather-1.png	1
1581	70	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
1582	70	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
1583	70	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
1584	70	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
1585	70	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
1586	70	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
1587	70	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-06T21:15:57.996Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
1588	70	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
1589	70	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 3, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
1590	70	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
1591	70	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
1592	70	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
1593	70	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
1594	70	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
1595	70	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
1596	70	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
1597	70	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
1598	70	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
1599	70	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
1600	70	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 3, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
1601	70	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
1602	70	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
1603	70	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
1604	70	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T15:39:22.674Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
1605	70	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
1606	70	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
1607	70	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
1608	70	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
1609	70	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4830	133	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4835	133	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
4836	133	243	11	json	[{"pk": 243, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-13T00:29:06.577Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-12T21:03:23.664Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	243	243
5015	136	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4831	133	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
4832	133	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4833	133	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4834	133	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4837	133	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
4838	133	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4839	133	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4840	133	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4841	133	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4395	126	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
4396	126	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4397	126	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4398	126	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4399	126	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4400	126	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4401	126	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-12T23:19:01.150Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4402	126	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
4403	126	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4404	126	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4405	126	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4406	126	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4407	126	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4408	126	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4409	126	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4410	126	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4411	126	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
4472	127	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4412	126	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4413	126	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4414	126	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4415	126	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 3, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4416	126	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
4417	126	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4418	126	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
4419	126	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4420	126	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4421	126	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4422	126	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 3, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
4423	126	243	11	json	[{"pk": 243, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-12T21:03:28.935Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-12T21:03:23.664Z", "lft": 2, "tree_id": 40, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	243	243
4424	126	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
4425	126	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4426	126	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4427	126	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4428	126	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4429	126	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 27, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4430	126	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 28, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4431	126	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 30, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4432	126	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4433	126	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4868	134	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4434	126	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4435	126	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
4436	126	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
4437	126	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4438	126	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 25, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4439	126	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4440	126	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4441	126	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
4442	126	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4443	126	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_243\\" alt=\\"Imagen\\" title=\\"Imagen - categorias1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/eb/2e/eb2e273f-9688-49e0-9fe5-169a537dd13d/categorias1.png__900x521_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
4444	126	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4445	126	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4446	126	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
4447	126	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
4448	126	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-12T23:20:04.968Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 40, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4449	126	243	49	json	[{"pk": 243, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 14, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	categorias1.png	243
4450	126	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4451	126	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 30, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4452	126	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4453	126	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 30, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4842	133	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4843	133	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4844	133	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4845	133	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4846	133	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4454	127	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
4455	127	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4456	127	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4457	127	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4458	127	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4459	127	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4460	127	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-12T23:20:05.172Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4461	127	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
4462	127	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4463	127	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4464	127	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4465	127	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4466	127	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4467	127	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4468	127	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4469	127	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4470	127	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
4471	127	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4473	127	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4474	127	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 3, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4475	127	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
4476	127	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4477	127	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
4478	127	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4479	127	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4480	127	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4481	127	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 3, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
4482	127	243	11	json	[{"pk": 243, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-12T23:22:19.177Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-12T21:03:23.664Z", "lft": 2, "tree_id": 40, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	243	243
4483	127	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
4484	127	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4485	127	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4486	127	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4487	127	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4488	127	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 27, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4489	127	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 28, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4490	127	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 30, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4491	127	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4492	127	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4493	127	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4494	127	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
4495	127	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
4496	127	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4497	127	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 25, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4498	127	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4847	133	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4848	133	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
4849	133	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
4850	133	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4851	133	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4852	133	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4853	133	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4854	133	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
4855	133	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4499	127	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4500	127	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
4501	127	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4502	127	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_243\\" alt=\\"Imagen\\" title=\\"Imagen - categorias1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/eb/2e/eb2e273f-9688-49e0-9fe5-169a537dd13d/categorias1.png__900x521_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
4503	127	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4504	127	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4505	127	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
4506	127	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
4507	127	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-12T23:20:04.968Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 40, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4856	133	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_243\\" alt=\\"Imagen\\" title=\\"Imagen - categorias1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/9f/a0/9fa02585-50f8-4a20-b055-3334fe32e48c/categorias1.png__900x521_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
4857	133	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4858	133	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4859	133	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
4860	133	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
4861	133	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-13T00:20:11.649Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4862	133	243	49	json	[{"pk": 243, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 15, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	sinagro.png	243
4863	133	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4864	133	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4865	133	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4866	133	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4983	136	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T00:32:01.471Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4984	136	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4985	136	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4986	136	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4987	136	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4988	136	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4989	136	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4990	136	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4991	136	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4992	136	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4993	136	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4994	136	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4867	134	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
4869	134	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4870	134	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4871	134	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4872	134	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4873	134	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T00:29:06.894Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4874	134	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
4875	134	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4876	134	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4877	134	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4878	134	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4879	134	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4880	134	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4995	136	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4881	134	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4882	134	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4883	134	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
4884	134	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4885	134	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4886	134	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4887	134	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4888	134	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
4889	134	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4890	134	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
4891	134	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4892	134	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4893	134	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4894	134	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
4895	134	243	11	json	[{"pk": 243, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-13T00:29:06.577Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-12T21:03:23.664Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	243	243
4896	134	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
4897	134	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4898	134	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4899	134	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4900	134	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4901	134	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4902	134	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4903	134	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4904	134	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4905	134	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4906	134	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4907	134	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
4908	134	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
4909	134	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4910	134	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4911	134	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4912	134	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4913	134	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
4914	134	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4915	134	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_243\\" alt=\\"Imagen\\" title=\\"Imagen - sinagro.png\\" src=\\"/media/filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__1429x718_q85_crop_subject_location-748%2C319_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
4916	134	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4917	134	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4918	134	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
4919	134	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
4920	134	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-13T00:29:09.513Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4921	134	243	49	json	[{"pk": 243, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 15, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	sinagro.png	243
4922	134	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4923	134	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4924	134	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4925	134	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4996	136	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4997	136	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4998	136	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4999	136	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5000	136	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
5001	136	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
5002	136	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
5003	136	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
5004	136	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
5016	136	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4508	127	243	49	json	[{"pk": 243, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 15, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	sinagro.png	243
4509	127	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4510	127	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 30, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4511	127	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4512	127	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 30, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4926	135	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T00:29:09.722Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4513	128	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
4514	128	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4515	128	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4516	128	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4517	128	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4518	128	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4527	128	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4519	128	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-12T23:22:19.486Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4520	128	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
4521	128	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4522	128	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4927	135	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4523	128	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4524	128	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4525	128	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4526	128	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4528	128	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4529	128	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 4, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
4530	128	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4531	128	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4532	128	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4533	128	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 3, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4534	128	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
4535	128	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4536	128	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
4537	128	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4538	128	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4539	128	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4540	128	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 3, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
4541	128	243	11	json	[{"pk": 243, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-12T23:22:19.177Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-12T21:03:23.664Z", "lft": 2, "tree_id": 40, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	243	243
4542	128	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
4543	128	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4544	128	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4545	128	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4546	128	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4547	128	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 27, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4548	128	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 28, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4549	128	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 30, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4550	128	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4551	128	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4552	128	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4553	128	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
4554	128	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
4555	128	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4556	128	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 25, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4557	128	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4558	128	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4559	128	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
4560	128	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4561	128	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_243\\" alt=\\"Imagen\\" title=\\"Imagen - sinagro.png\\" src=\\"/media/filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__1429x718_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
4562	128	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4563	128	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4564	128	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 30, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5005	136	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4565	128	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
4566	128	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-12T23:22:24.030Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 40, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4567	128	243	49	json	[{"pk": 243, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 15, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	sinagro.png	243
4568	128	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 3, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4569	128	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 30, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4570	128	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4571	128	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 30, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4928	135	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4929	135	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4930	135	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4931	135	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4932	135	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4933	135	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4934	135	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4935	135	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4936	135	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4937	135	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4938	135	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4939	135	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4940	135	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4941	135	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4942	135	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5038	136	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4572	129	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
4573	129	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4574	129	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
4575	129	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
4576	129	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
4577	129	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
4578	129	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T00:11:42.179Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
4579	129	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
4580	129	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
4581	129	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
4582	129	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
4583	129	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
4584	129	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
4585	129	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
4586	129	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
4587	129	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
4588	129	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
4589	129	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4590	129	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
4591	129	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4592	129	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4593	129	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
4594	129	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4595	129	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
4596	129	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
4597	129	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
4598	129	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
4599	129	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
4600	129	243	11	json	[{"pk": 243, "model": "cms.cmsplugin", "fields": {"rght": 3, "changed_date": "2014-11-12T23:22:19.177Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-12T21:03:23.664Z", "lft": 2, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	243	243
4601	129	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5217	140	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
4602	129	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
4603	129	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
4604	129	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
4605	129	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
4606	129	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
4607	129	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
4608	129	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
4609	129	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
4610	129	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
4611	129	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
4612	129	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
4613	129	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
4614	129	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
4615	129	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
4616	129	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
4617	129	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
4618	129	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
4619	129	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
4620	129	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_243\\" alt=\\"Imagen\\" title=\\"Imagen - sinagro.png\\" src=\\"/media/filer_public_thumbnails/filer_public/a0/97/a0978ed0-59c6-4577-88c4-67845450f3f1/sinagro.png__1429x718_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
4621	129	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
4622	129	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
4623	129	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
4624	129	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
4625	129	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T23:22:24.030Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
4626	129	243	49	json	[{"pk": 243, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 15, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	sinagro.png	243
4627	129	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
4628	129	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
4629	129	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
4630	129	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
4943	135	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
4944	135	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
4945	135	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
4946	135	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
4947	135	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
4948	135	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
4949	135	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5017	136	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
5018	136	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
5019	136	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
5020	136	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5021	136	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
5022	136	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5023	136	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
5024	136	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
5025	136	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
5026	136	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
5027	136	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5028	136	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
5029	136	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": ""}}]		242
5030	136	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
5031	136	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
5032	136	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5033	136	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5034	136	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-13T00:30:04.969Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
5035	136	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
5036	136	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
5037	136	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
5039	136	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
5040	137	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T00:32:02.020Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
5041	137	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
5042	137	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
5043	137	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
5044	137	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
5045	137	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
5046	137	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
5047	137	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
5048	137	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
5049	137	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
5050	137	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
5051	137	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
5052	137	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
5053	137	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
5054	137	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
5055	137	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
5056	137	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5057	137	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
5058	137	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
5059	137	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
5060	137	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
5061	137	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
5062	137	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
5063	137	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5064	137	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
5065	137	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
5066	137	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
5067	137	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
5068	137	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5069	137	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
5070	137	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
5071	137	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
5072	137	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
5073	137	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
5074	137	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
5075	137	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
5076	137	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
5077	137	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5078	137	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
5079	137	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5080	137	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
5081	137	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
5082	137	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
5083	137	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
5084	137	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
5085	137	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5086	137	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
5087	137	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": ""}}]		242
5088	137	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
5089	137	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
5090	137	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5091	137	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5092	137	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-13T00:30:04.969Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
5093	137	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
5094	137	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
5095	137	468	11	json	[{"pk": 468, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-13T15:51:42.079Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-13T15:51:41.940Z", "lft": 4, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	468	468
5096	137	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5097	137	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
5098	138	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T15:51:42.578Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
5099	138	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
5100	138	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
5101	138	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
5102	138	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
5103	138	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
5104	138	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
5105	138	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
5106	138	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
5107	138	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
5108	138	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
5109	138	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
5110	138	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
5111	138	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
5112	138	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
5113	138	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
5114	138	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5115	138	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
5116	138	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
5117	138	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
5118	138	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
5119	138	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
5120	138	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
5121	138	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5122	138	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
5123	138	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
5124	138	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
5125	138	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
5126	138	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5127	138	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
5128	138	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
5129	138	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
5130	138	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
5131	138	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
5132	138	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
5133	138	468	11	json	[{"pk": 468, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-13T15:56:18.812Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-13T15:51:41.940Z", "lft": 4, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	468	468
5134	138	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
5135	138	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5136	138	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
5137	138	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5138	138	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
5139	138	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
5140	138	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
5141	138	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
5142	138	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
5143	138	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5144	138	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
5145	138	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": ""}}]		242
5146	138	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
5147	138	468	49	json	[{"pk": 468, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 17, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	conagro.png	468
5148	138	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
5149	138	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5150	138	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5151	138	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-13T00:30:04.969Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
5152	138	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
5153	138	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
5154	138	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
5155	138	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5156	138	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
5157	139	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T15:56:19.388Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
5158	139	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
5159	139	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
5160	139	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
5161	139	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
5162	139	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
5163	139	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
5164	139	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
5165	139	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
5166	139	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
5167	139	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
5168	139	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
5169	139	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
5170	139	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
5171	139	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
5172	139	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
5173	139	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5174	139	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
5175	139	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
5176	139	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
5177	139	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
5178	139	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
5179	139	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
5180	139	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5181	139	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
5182	139	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
5183	139	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
5184	139	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
5185	139	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5186	139	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
5187	139	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
5188	139	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
5189	139	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
5190	139	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
5191	139	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
5192	139	468	11	json	[{"pk": 468, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-13T15:56:18.812Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-13T15:51:41.940Z", "lft": 4, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	468	468
5193	139	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
5194	139	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5195	139	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
5196	139	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5197	139	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
5198	139	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
5199	139	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
5200	139	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
5201	139	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
5202	139	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5203	139	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
5204	139	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_468\\" alt=\\"Imagen\\" title=\\"Destaju Agro\\" src=\\"/media/filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__800x399_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
5205	139	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
5206	139	468	49	json	[{"pk": 468, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 17, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	conagro.png	468
5207	139	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
5208	139	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5209	139	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5210	139	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-13T15:58:03.308Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
5211	139	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
5212	139	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
5213	139	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
5214	139	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5215	139	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
5216	140	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T16:35:46.087Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
5218	140	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
5219	140	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
5220	140	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
5221	140	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
5222	140	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
5223	140	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
5224	140	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
5225	140	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
5226	140	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
5227	140	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
5228	140	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
5229	140	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
5230	140	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
5231	140	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
5232	140	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5233	140	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
5234	140	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
5235	140	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
5236	140	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
5237	140	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
5238	140	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
5239	140	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5240	140	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
5241	140	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
5242	140	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
5243	140	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 0, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
5244	140	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5245	140	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
5246	140	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
5247	140	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
5248	140	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
5249	140	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
5250	140	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
5251	140	468	11	json	[{"pk": 468, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-13T15:56:18.812Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-13T15:51:41.940Z", "lft": 4, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	468	468
5252	140	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
5253	140	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5254	140	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
5255	140	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5256	140	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
5257	140	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
5258	140	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
5259	140	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
5260	140	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
5261	140	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5262	140	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
5263	140	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img id=\\"plugin_obj_468\\" alt=\\"Imagen\\" title=\\"Destaju Agro\\" src=\\"/media/filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__800x399_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
5264	140	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
5265	140	468	49	json	[{"pk": 468, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 17, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	conagro.png	468
5266	140	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
5267	140	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5268	140	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5269	140	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-13T15:58:03.308Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
5270	140	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
5271	140	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
5272	140	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
5273	140	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5274	140	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
5275	141	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T16:35:46.422Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
5276	141	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
5277	141	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
5278	141	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
5279	141	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
5280	141	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
5281	141	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
5282	141	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
5283	141	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
5284	141	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
5285	141	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
5286	141	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
5287	141	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
5288	141	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
5289	141	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
5290	141	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
5291	141	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5292	141	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
5293	141	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
5294	141	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
5295	141	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
5296	141	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
5297	141	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
5298	141	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5299	141	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
5300	141	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
5301	141	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
5302	141	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
5303	141	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5304	141	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
5305	141	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
5306	141	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
5307	141	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
5308	141	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
5309	141	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
5310	141	468	11	json	[{"pk": 468, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-13T15:56:18.812Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-13T15:51:41.940Z", "lft": 4, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	468	468
5311	141	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
5312	141	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5313	141	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
5314	141	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5315	141	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
5316	141	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
5317	141	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
5318	141	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
5319	141	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
5320	141	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5321	141	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
5322	141	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img class=\\"img-responsive\\" alt=\\"Imagen\\" title=\\"Destaju Agro\\" id=\\"plugin_obj_468\\" src=\\"/media/filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__800x399_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
5323	141	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
5324	141	468	49	json	[{"pk": 468, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 17, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	conagro.png	468
5325	141	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
5326	141	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5327	141	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5328	141	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-13T16:46:40.634Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
5329	141	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
5330	141	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
5331	141	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
5332	141	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5333	141	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
5334	142	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T16:46:41.194Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
5335	142	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
5336	142	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
5337	142	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
5338	142	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
5339	142	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
5340	142	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
5341	142	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
5342	142	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
5343	142	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
5344	142	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
5345	142	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
5346	142	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
5347	142	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
5348	142	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
5349	142	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
5350	142	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5351	142	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
5352	142	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
5353	142	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
5354	142	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
5355	142	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
5356	142	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
5357	142	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5358	142	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
5359	142	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
5360	142	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
5361	142	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
5362	142	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5363	142	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
5364	142	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
5365	142	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
5366	142	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
5367	142	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
5368	142	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
5369	142	468	11	json	[{"pk": 468, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-13T15:56:18.812Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-13T15:51:41.940Z", "lft": 4, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	468	468
5370	142	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
5371	142	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5372	142	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
5373	142	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5374	142	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
5375	142	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
5376	142	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
5377	142	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
5378	142	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
5379	142	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5380	142	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
5381	142	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img class=\\"img-responsive\\" alt=\\"Imagen\\" title=\\"Destaju Agro\\" id=\\"plugin_obj_468\\" src=\\"/media/filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__800x399_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
5382	142	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
5383	142	468	49	json	[{"pk": 468, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 17, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	conagro.png	468
5384	142	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
5385	142	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5386	142	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5387	142	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-13T16:48:18.526Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
5388	142	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
5389	142	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
5390	142	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
5391	142	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5392	142	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
5437	143	212	11	json	[{"pk": 212, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-12T16:18:40.597Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:18:25.902Z", "lft": 1, "tree_id": 9, "position": 2, "placeholder": 7, "plugin_type": "StylePlugin"}}]	212	212
5393	143	1	12	json	[{"pk": 1, "model": "cms.page", "fields": {"rght": 2, "navigation_extenders": null, "site": 1, "application_namespace": null, "lft": 1, "in_navigation": true, "reverse_id": null, "login_required": false, "created_by": "admin", "languages": "es", "publication_end_date": null, "template": "INHERIT", "tree_id": 1, "placeholders": [2, 4, 5, 6, 7], "changed_date": "2014-11-13T16:48:18.849Z", "limit_visibility_in_menu": null, "parent": null, "soft_root": false, "is_home": true, "publication_date": "2014-11-06T20:22:57.810Z", "creation_date": "2014-11-06T20:22:57.712Z", "level": 0, "changed_by": "admin", "application_urls": null, "xframe_options": 0, "revision_id": 0}}]	Inicio	1
5394	143	2	10	json	[{"pk": 2, "model": "cms.placeholder", "fields": {"slot": "content", "default_width": null}}]	content	2
5395	143	43	49	json	[{"pk": 43, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 4, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Inventario", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-2.png	43
5396	143	4	10	json	[{"pk": 4, "model": "cms.placeholder", "fields": {"slot": "home", "default_width": null}}]	home	4
5397	143	5	10	json	[{"pk": 5, "model": "cms.placeholder", "fields": {"slot": "benefits", "default_width": null}}]	benefits	5
5398	143	6	10	json	[{"pk": 6, "model": "cms.placeholder", "fields": {"slot": "sectors", "default_width": null}}]	sectors	6
5399	143	7	10	json	[{"pk": 7, "model": "cms.placeholder", "fields": {"slot": "contact", "default_width": null}}]	contact	7
5400	143	1	36	json	[{"pk": 1, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 0, "g": 0, "image": 11, "bg_type": "image", "r": 0}}]	path.png	1
5401	143	215	23	json	[{"pk": 215, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6, contact-info", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	215
5402	143	17	23	json	[{"pk": 17, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	17
5403	143	18	21	json	[{"pk": 18, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">BENEFICIOS</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	BENEFICIOS	18
5404	143	17	11	json	[{"pk": 17, "model": "cms.cmsplugin", "fields": {"rght": 26, "changed_date": "2014-11-11T16:53:00.275Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:15.507Z", "lft": 1, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	17	17
5405	143	24	23	json	[{"pk": 24, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	24
5406	143	30	21	json	[{"pk": 30, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_31\\" alt=\\"Imagen\\" title=\\"Imagen - ico-3.png\\" src=\\"/media/filer_public_thumbnails/filer_public/f2/97/f297bb27-ee1b-4689-a940-c3561ea99609/ico-3.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Acceso a su informaci\\u00f3n<br>\\ndesde cualquier dispositivo</h4>\\n"}}]	Acceso a su...	30
5407	143	31	49	json	[{"pk": 31, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 3, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Portable", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-3.png	31
5408	143	35	11	json	[{"pk": 35, "model": "cms.cmsplugin", "fields": {"rght": 13, "changed_date": "2014-11-11T15:33:27.562Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 8, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "StylePlugin"}}]	35	35
5409	143	18	11	json	[{"pk": 18, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T15:28:41.444Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 3, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	18	18
5410	143	35	23	json	[{"pk": 35, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	35
5411	143	1	11	json	[{"pk": 1, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-11T16:55:38.716Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-06T21:14:34.907Z", "lft": 1, "tree_id": 1, "position": 0, "placeholder": 4, "plugin_type": "CssBackgroundPlugIn"}}]	1	1
5412	143	37	11	json	[{"pk": 37, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-11T15:29:01.607Z", "parent": 36, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 10, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	37	37
5413	143	38	11	json	[{"pk": 38, "model": "cms.cmsplugin", "fields": {"rght": 7, "changed_date": "2014-11-11T15:33:57.770Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 2, "tree_id": 2, "position": 3, "placeholder": 5, "plugin_type": "StylePlugin"}}]	38	38
5414	143	39	21	json	[{"pk": 39, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_40\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Exporte su informaci\\u00f3n<br>\\npara alimentar su contabilidad</h4>\\n"}}]	Exporte su información...	39
5415	143	40	11	json	[{"pk": 40, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-11T15:32:28.182Z", "parent": 39, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 4, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	40	40
5416	143	41	23	json	[{"pk": 41, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	41
5417	143	42	21	json	[{"pk": 42, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_43\\" alt=\\"Imagen\\" title=\\"Imagen - ico-2.png\\" src=\\"/media/filer_public_thumbnails/filer_public/83/51/8351eef8-4fba-48c2-8afb-23afdd610f48/ico-2.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de<br>\\nsus equipos e insumos</h4>\\n"}}]	Mayor control de...	42
5418	143	43	11	json	[{"pk": 43, "model": "cms.cmsplugin", "fields": {"rght": 23, "changed_date": "2014-11-11T15:31:05.160Z", "parent": 42, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 22, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	43	43
5419	143	240	21	json	[{"pk": 240, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>D\\u00e9jenos un mensaje!</h4>\\n\\n<hr>"}}]	Déjenos un mensaje!	240
5420	143	1	17	json	[{"pk": 1, "model": "cms.title", "fields": {"menu_title": "Inicio", "meta_description": "Plataforma pagos a destajo, destajo, pagos a destajo, destaju, daiech, parquesoft", "page_title": "Inicio", "language": "es", "title": "Inicio", "has_url_overwrite": false, "redirect": null, "publisher_is_draft": true, "page": 1, "published": true, "path": "", "publisher_state": 1, "creation_date": "2014-11-06T20:22:57.762Z", "slug": "inicio", "publisher_public": 2}}]	Inicio (inicio, es)	1
5421	143	30	11	json	[{"pk": 30, "model": "cms.cmsplugin", "fields": {"rght": 18, "changed_date": "2014-11-11T15:42:09.186Z", "parent": 24, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 15, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	30	30
5422	143	31	11	json	[{"pk": 31, "model": "cms.cmsplugin", "fields": {"rght": 17, "changed_date": "2014-11-11T15:31:34.489Z", "parent": 30, "language": "es", "level": 3, "creation_date": "2014-11-11T15:26:03.686Z", "lft": 16, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "FilerImagePlugin"}}]	31	31
5423	143	36	11	json	[{"pk": 36, "model": "cms.cmsplugin", "fields": {"rght": 12, "changed_date": "2014-11-11T15:41:40.268Z", "parent": 35, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 9, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	36	36
5424	143	207	36	json	[{"pk": 207, "model": "djangocms-css-background.cssbackground", "fields": {"a": 0, "b": 217, "g": 224, "image": null, "bg_type": "rgb", "r": 210}}]	rgb: 210-224-217	207
5425	143	209	11	json	[{"pk": 209, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.193Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 7, "position": 0, "placeholder": 6, "plugin_type": "TextPlugin"}}]	209	209
5426	143	210	11	json	[{"pk": 210, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T16:09:23.524Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-07T23:13:50.764Z", "lft": 1, "tree_id": 8, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	210	210
5427	143	211	11	json	[{"pk": 211, "model": "cms.cmsplugin", "fields": {"rght": 8, "changed_date": "2014-11-12T20:16:43.445Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T16:13:44.469Z", "lft": 7, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "ContactPlugin"}}]	211	211
5428	143	468	11	json	[{"pk": 468, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-13T15:56:18.812Z", "parent": 242, "language": "es", "level": 1, "creation_date": "2014-11-13T15:51:41.940Z", "lft": 4, "tree_id": 17, "position": 0, "placeholder": 6, "plugin_type": "FilerImagePlugin"}}]	468	468
5429	143	213	23	json	[{"pk": 213, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-6, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	213
5430	143	24	11	json	[{"pk": 24, "model": "cms.cmsplugin", "fields": {"rght": 19, "changed_date": "2014-11-11T15:33:48.726Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 14, "tree_id": 2, "position": 2, "placeholder": 5, "plugin_type": "StylePlugin"}}]	24	24
5431	143	215	11	json	[{"pk": 215, "model": "cms.cmsplugin", "fields": {"rght": 5, "changed_date": "2014-11-12T19:59:56.478Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 2, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "StylePlugin"}}]	215	215
5432	143	216	21	json	[{"pk": 216, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h4>\\u00bfTiene alguna duda?</h4>\\n\\n<hr>\\n<p>Cra 31 #15-87</p>\\n\\n<p>Barrio San Luis</p>\\n\\n<p>Pereira, Colombia, Sur Am\\u00e9rica</p>\\n\\n<p>contacto@daiech.com</p>\\n\\n<p>\\u00a0</p>\\n"}}]	¿Tiene alguna duda?...	216
5433	143	36	21	json	[{"pk": 36, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><img id=\\"plugin_obj_37\\" alt=\\"Imagen - ico-1.png\\" title=\\"Imagen - ico-1.png\\" src=\\"/media/filer_public_thumbnails/filer_public/66/79/6679225c-8536-440d-ade6-d91ff74c16da/ico-1.png__184x183_q85_crop_subsampling-2_upscale.png\\"></p>\\n\\n<h4 style=\\"text-align: center;\\">Mayor control de las<br>\\nactividades de sus empleados</h4>\\n"}}]	Mayor control de...	36
5434	143	207	11	json	[{"pk": 207, "model": "cms.cmsplugin", "fields": {"rght": 2, "changed_date": "2014-11-12T21:03:03.209Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T16:01:14.717Z", "lft": 1, "tree_id": 6, "position": 1, "placeholder": 6, "plugin_type": "CssBackgroundPlugIn"}}]	207	207
5435	143	216	11	json	[{"pk": 216, "model": "cms.cmsplugin", "fields": {"rght": 4, "changed_date": "2014-11-12T20:31:24.579Z", "parent": 215, "language": "es", "level": 2, "creation_date": "2014-11-12T16:19:45.251Z", "lft": 3, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	216	216
5436	143	37	49	json	[{"pk": 37, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 5, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "Control", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-1.png	37
5438	143	38	23	json	[{"pk": 38, "model": "djangocms_style.style", "fields": {"additional_classes": "col-md-3, col-sm-6", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	38
5439	143	209	21	json	[{"pk": 209, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">SECTORES</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	SECTORES	209
5440	143	242	21	json	[{"pk": 242, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<p style=\\"text-align: center;\\"><a href=\\"http://destaju.com/agro\\"><img class=\\" img-responsive \\" alt=\\"Imagen\\" title=\\"Destaju Agro\\" id=\\"plugin_obj_468\\" src=\\"/media/filer_public_thumbnails/filer_public/ef/06/ef06aa7d-d6c7-4641-9c45-576ca4b9f997/conagro.png__800x399_q85_crop_subsampling-2_upscale.png\\"></a></p>\\n"}}]		242
5441	143	39	11	json	[{"pk": 39, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-11T15:42:20.120Z", "parent": 38, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 3, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	39	39
5442	143	468	49	json	[{"pk": 468, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 17, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	conagro.png	468
5443	143	210	21	json	[{"pk": 210, "model": "djangocms_text_ckeditor.text", "fields": {"body": "<h2 style=\\"text-align: center;\\">CONTACTO</h2>\\n\\n<p>\\u00a0</p>\\n"}}]	CONTACTO	210
5444	143	240	11	json	[{"pk": 240, "model": "cms.cmsplugin", "fields": {"rght": 10, "changed_date": "2014-11-12T20:30:26.628Z", "parent": 213, "language": "es", "level": 2, "creation_date": "2014-11-12T20:16:16.360Z", "lft": 9, "tree_id": 9, "position": 0, "placeholder": 7, "plugin_type": "TextPlugin"}}]	240	240
5445	143	40	49	json	[{"pk": 40, "model": "cmsplugin_filer_image.filerimage", "fields": {"style": "", "free_link": "", "description": "", "width": null, "thumbnail_option": null, "use_original_image": false, "image": 6, "caption_text": "", "page_link": null, "crop": true, "height": null, "alt_text": "N\\u00f3mina", "target_blank": false, "image_url": "", "upscale": true, "use_autoscale": false, "file_link": null, "original_link": false, "alignment": null}}]	ico-4.png	40
5446	143	242	11	json	[{"pk": 242, "model": "cms.cmsplugin", "fields": {"rght": 6, "changed_date": "2014-11-13T16:48:53.066Z", "parent": null, "language": "es", "level": 0, "creation_date": "2014-11-12T21:02:46.170Z", "lft": 1, "tree_id": 17, "position": 2, "placeholder": 6, "plugin_type": "TextPlugin"}}]	242	242
5447	143	211	53	json	[{"pk": 211, "model": "cmsplugin_contact.contact", "fields": {"form_layout": "cmsplugin_contact.forms.ContactForm", "recaptcha_theme": "clean", "site_email": "contacto@daiech.com", "spam_protection_method": 0, "submit": "Enviar", "thanks": "<p>Gracias por contactarnos, le responderemos inmediatamente leamos su mensaje.</p>\\r\\n", "redirect_url": "", "form_name": "Destaju General", "akismet_api_key": "", "recaptcha_public_key": "", "recaptcha_private_key": ""}}]	contacto@daiech.com	211
5448	143	41	11	json	[{"pk": 41, "model": "cms.cmsplugin", "fields": {"rght": 25, "changed_date": "2014-11-11T15:33:38.650Z", "parent": 17, "language": "es", "level": 1, "creation_date": "2014-11-11T15:14:55.426Z", "lft": 20, "tree_id": 2, "position": 1, "placeholder": 5, "plugin_type": "StylePlugin"}}]	41	41
5449	143	212	23	json	[{"pk": 212, "model": "djangocms_style.style", "fields": {"additional_classes": "row-fluid, box", "margin_right": null, "class_name": "info", "padding_bottom": null, "margin_left": null, "padding_right": null, "margin_top": null, "padding_left": null, "padding_top": null, "margin_bottom": null, "tag_type": "div"}}]	información	212
5450	143	42	11	json	[{"pk": 42, "model": "cms.cmsplugin", "fields": {"rght": 24, "changed_date": "2014-11-11T15:41:53.632Z", "parent": 41, "language": "es", "level": 2, "creation_date": "2014-11-11T15:25:59.158Z", "lft": 21, "tree_id": 2, "position": 0, "placeholder": 5, "plugin_type": "TextPlugin"}}]	42	42
5451	143	213	11	json	[{"pk": 213, "model": "cms.cmsplugin", "fields": {"rght": 11, "changed_date": "2014-11-12T16:33:28.600Z", "parent": 212, "language": "es", "level": 1, "creation_date": "2014-11-12T16:18:51.977Z", "lft": 6, "tree_id": 9, "position": 1, "placeholder": 7, "plugin_type": "StylePlugin"}}]	213	213
\.


--
-- Name: reversion_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('reversion_version_id_seq', 5510, true);


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
129	cmsplugin_filer_file	0001_initial	2014-11-11 10:25:28.416124-05
130	cmsplugin_filer_file	0002_auto__add_field_filerfile_target_blank	2014-11-11 10:25:28.593326-05
131	cmsplugin_filer_file	0003_auto__add_field_filerfile_style	2014-11-11 10:25:28.754356-05
132	cmsplugin_filer_file	0004_fix_table_names	2014-11-11 10:25:28.847357-05
133	cmsplugin_filer_folder	0001_initial	2014-11-11 10:25:29.063586-05
134	cmsplugin_filer_folder	0002_auto__add_field_filerfolder_style	2014-11-11 10:25:29.180805-05
135	cmsplugin_filer_folder	0003_move_view_option_to_style	2014-11-11 10:25:29.209417-05
136	cmsplugin_filer_folder	0004_auto__del_field_filerfolder_view_option	2014-11-11 10:25:29.236378-05
137	cmsplugin_filer_folder	0005_fix_table_names	2014-11-11 10:25:29.311328-05
138	cmsplugin_filer_link	0001_initial	2014-11-11 10:25:29.560469-05
139	cmsplugin_filer_link	0002_auto__chg_field_filerlinkplugin_file	2014-11-11 10:25:29.703835-05
140	cmsplugin_filer_link	0003_fix_table_names	2014-11-11 10:25:29.752966-05
141	cmsplugin_filer_image	0001_initial	2014-11-11 10:25:30.07209-05
142	cmsplugin_filer_image	0002_auto__add_field_filerimage_image_url__chg_field_filerimage_image	2014-11-11 10:25:30.164531-05
143	cmsplugin_filer_image	0003_auto__add_thumbnailoption__add_field_filerimage_thumbnail_option	2014-11-11 10:25:30.305834-05
144	cmsplugin_filer_image	0004_auto__del_field_thumbnailoption_is_scaled__del_field_thumbnailoption_i	2014-11-11 10:25:30.766904-05
145	cmsplugin_filer_image	0005_rename_float_to_alignment	2014-11-11 10:25:30.828584-05
146	cmsplugin_filer_image	0006_auto__add_field_filerimage_original_link	2014-11-11 10:25:31.012484-05
147	cmsplugin_filer_image	0007_rename_caption_to_caption_text	2014-11-11 10:25:31.06385-05
148	cmsplugin_filer_image	0008_auto__add_field_filerimage_file_link	2014-11-11 10:25:31.145438-05
149	cmsplugin_filer_image	0009_auto__add_field_filerimage_use_original_image	2014-11-11 10:25:31.383605-05
150	cmsplugin_filer_image	0010_auto__add_field_filerimage_target_blank	2014-11-11 10:25:31.599288-05
151	cmsplugin_filer_image	0011_auto__add_field_filerimage_style	2014-11-11 10:25:31.825288-05
152	cmsplugin_filer_image	0012_fix_table_names	2014-11-11 10:25:31.878964-05
153	cmsplugin_filer_teaser	0001_initial	2014-11-11 10:25:32.210085-05
154	cmsplugin_filer_teaser	0002_add_teaser_style_choice	2014-11-11 10:25:32.249387-05
155	cmsplugin_filer_teaser	0003_target_blank	2014-11-11 10:25:32.490349-05
156	cmsplugin_filer_teaser	0004_add_optional_external_image_url	2014-11-11 10:25:32.530474-05
157	cmsplugin_filer_teaser	0004_auto__chg_field_filerteaser_title	2014-11-11 10:25:32.588272-05
158	cmsplugin_filer_teaser	0005_auto__add_field_filerteaser_external_image	2014-11-11 10:25:32.625844-05
159	cmsplugin_filer_teaser	0006_fix_migration_mess	2014-11-11 10:25:32.65173-05
160	cmsplugin_filer_teaser	0007_auto__chg_field_filerteaser_style	2014-11-11 10:25:32.716259-05
161	cmsplugin_filer_teaser	0008_fix_table_names	2014-11-11 10:25:32.750789-05
162	cmsplugin_filer_video	0001_initial	2014-11-11 10:25:32.948779-05
163	cmsplugin_filer_video	0002_fix_table_names	2014-11-11 10:25:32.99725-05
164	cmsplugin_contact	0001_initial	2014-11-12 11:13:14.617341-05
165	cmsplugin_contact	0002_auto__chg_field_contact_thanks	2014-11-12 11:13:14.806764-05
166	cmsplugin_contact	0003_auto__add_field_contact_form_name	2014-11-12 11:13:14.938733-05
167	cmsplugin_contact	0004_add_field_Contact_form_layout	2014-11-12 11:13:15.017404-05
168	cmsplugin_contact	0005_auto__del_field_contact_content_label__del_field_contact_subject_label	2014-11-12 11:13:15.037286-05
169	cmsplugin_contact	0006_fix_table_names	2014-11-12 11:13:15.054403-05
170	cmsplugin_contact	0007_add_url_field	2014-11-12 11:13:15.135314-05
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: daiech
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 170, true);


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
-- Name: cmsplugin_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_contact_contact
    ADD CONSTRAINT cmsplugin_contact_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filer_image_thumbnailoption_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filer_image_thumbnailoption
    ADD CONSTRAINT cmsplugin_filer_image_thumbnailoption_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_filerfile_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filer_file_filerfile
    ADD CONSTRAINT cmsplugin_filerfile_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filerfolder_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filer_folder_filerfolder
    ADD CONSTRAINT cmsplugin_filerfolder_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filerimage_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filer_image_filerimage
    ADD CONSTRAINT cmsplugin_filerimage_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filerlinkplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filer_link_filerlinkplugin
    ADD CONSTRAINT cmsplugin_filerlinkplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filerteaser_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filer_teaser_filerteaser
    ADD CONSTRAINT cmsplugin_filerteaser_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filervideo_pkey; Type: CONSTRAINT; Schema: public; Owner: daiech; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filer_video_filervideo
    ADD CONSTRAINT cmsplugin_filervideo_pkey PRIMARY KEY (cmsplugin_ptr_id);


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
-- Name: cmsplugin_filerfile_file_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerfile_file_id ON cmsplugin_filer_file_filerfile USING btree (file_id);


--
-- Name: cmsplugin_filerfolder_folder_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerfolder_folder_id ON cmsplugin_filer_folder_filerfolder USING btree (folder_id);


--
-- Name: cmsplugin_filerimage_file_link_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_file_link_id ON cmsplugin_filer_image_filerimage USING btree (file_link_id);


--
-- Name: cmsplugin_filerimage_image_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_image_id ON cmsplugin_filer_image_filerimage USING btree (image_id);


--
-- Name: cmsplugin_filerimage_page_link_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_page_link_id ON cmsplugin_filer_image_filerimage USING btree (page_link_id);


--
-- Name: cmsplugin_filerimage_thumbnail_option_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_thumbnail_option_id ON cmsplugin_filer_image_filerimage USING btree (thumbnail_option_id);


--
-- Name: cmsplugin_filerlinkplugin_file_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerlinkplugin_file_id ON cmsplugin_filer_link_filerlinkplugin USING btree (file_id);


--
-- Name: cmsplugin_filerlinkplugin_page_link_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerlinkplugin_page_link_id ON cmsplugin_filer_link_filerlinkplugin USING btree (page_link_id);


--
-- Name: cmsplugin_filerteaser_image_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerteaser_image_id ON cmsplugin_filer_teaser_filerteaser USING btree (image_id);


--
-- Name: cmsplugin_filerteaser_page_link_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filerteaser_page_link_id ON cmsplugin_filer_teaser_filerteaser USING btree (page_link_id);


--
-- Name: cmsplugin_filervideo_image_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filervideo_image_id ON cmsplugin_filer_video_filervideo USING btree (image_id);


--
-- Name: cmsplugin_filervideo_movie_id; Type: INDEX; Schema: public; Owner: daiech; Tablespace: 
--

CREATE INDEX cmsplugin_filervideo_movie_id ON cmsplugin_filer_video_filervideo USING btree (movie_id);


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
-- Name: cmsplugin_ptr_id_refs_id_03752e6e; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_image_filerimage
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_03752e6e FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_0c0e6fa6; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_file_filerfile
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_0c0e6fa6 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_1338e6cf; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_folder_filerfolder
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_1338e6cf FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: cmsplugin_ptr_id_refs_id_67e67ad8; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_video_filervideo
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_67e67ad8 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: cmsplugin_ptr_id_refs_id_af15835a; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_link_filerlinkplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_af15835a FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: cmsplugin_ptr_id_refs_id_d6b82c62; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_contact_contact
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_d6b82c62 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_da8dcc7b; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_teaser_filerteaser
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_da8dcc7b FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: file_id_refs_id_a0a03232; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_file_filerfile
    ADD CONSTRAINT file_id_refs_id_a0a03232 FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_id_refs_id_a869c276; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT file_id_refs_id_a869c276 FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_id_refs_id_c513cb68; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_link_filerlinkplugin
    ADD CONSTRAINT file_id_refs_id_c513cb68 FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_link_id_refs_id_3a714936; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_image_filerimage
    ADD CONSTRAINT file_link_id_refs_id_3a714936 FOREIGN KEY (file_link_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_ptr_id_refs_id_7375d00c; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT file_ptr_id_refs_id_7375d00c FOREIGN KEY (file_ptr_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: folder_id_refs_id_00ca90ce; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_folder_filerfolder
    ADD CONSTRAINT folder_id_refs_id_00ca90ce FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: image_id_refs_file_ptr_id_304d65b4; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_teaser_filerteaser
    ADD CONSTRAINT image_id_refs_file_ptr_id_304d65b4 FOREIGN KEY (image_id) REFERENCES filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_file_ptr_id_39d7a4bd; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_video_filervideo
    ADD CONSTRAINT image_id_refs_file_ptr_id_39d7a4bd FOREIGN KEY (image_id) REFERENCES filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_file_ptr_id_affb196b; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_image_filerimage
    ADD CONSTRAINT image_id_refs_file_ptr_id_affb196b FOREIGN KEY (image_id) REFERENCES filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: movie_id_refs_id_4c14f008; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_video_filervideo
    ADD CONSTRAINT movie_id_refs_id_4c14f008 FOREIGN KEY (movie_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: page_link_id_refs_id_52e597bc; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_link_filerlinkplugin
    ADD CONSTRAINT page_link_id_refs_id_52e597bc FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_70de2e4a; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_image_filerimage
    ADD CONSTRAINT page_link_id_refs_id_70de2e4a FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_7b657a76; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_teaser_filerteaser
    ADD CONSTRAINT page_link_id_refs_id_7b657a76 FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: thumbnail_option_id_refs_id_c267cfb1; Type: FK CONSTRAINT; Schema: public; Owner: daiech
--

ALTER TABLE ONLY cmsplugin_filer_image_filerimage
    ADD CONSTRAINT thumbnail_option_id_refs_id_c267cfb1 FOREIGN KEY (thumbnail_option_id) REFERENCES cmsplugin_filer_image_thumbnailoption(id) DEFERRABLE INITIALLY DEFERRED;


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

