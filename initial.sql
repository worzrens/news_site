--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: back_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.back_comment (
    id integer NOT NULL,
    text text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    to_post_id integer NOT NULL
);


ALTER TABLE public.back_comment OWNER TO postgres;

--
-- Name: back_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.back_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.back_comment_id_seq OWNER TO postgres;

--
-- Name: back_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.back_comment_id_seq OWNED BY public.back_comment.id;


--
-- Name: back_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.back_post (
    id integer NOT NULL,
    text text NOT NULL,
    html_body text NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.back_post OWNER TO postgres;

--
-- Name: back_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.back_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.back_post_id_seq OWNER TO postgres;

--
-- Name: back_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.back_post_id_seq OWNED BY public.back_post.id;


--
-- Name: back_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.back_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    name character varying(50),
    last_name character varying(50),
    date_of_birth timestamp with time zone,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    role character varying(10) NOT NULL
);


ALTER TABLE public.back_user OWNER TO postgres;

--
-- Name: back_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.back_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.back_user_groups OWNER TO postgres;

--
-- Name: back_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.back_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.back_user_groups_id_seq OWNER TO postgres;

--
-- Name: back_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.back_user_groups_id_seq OWNED BY public.back_user_groups.id;


--
-- Name: back_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.back_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.back_user_id_seq OWNER TO postgres;

--
-- Name: back_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.back_user_id_seq OWNED BY public.back_user.id;


--
-- Name: back_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.back_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.back_user_user_permissions OWNER TO postgres;

--
-- Name: back_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.back_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.back_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: back_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.back_user_user_permissions_id_seq OWNED BY public.back_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: back_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_comment ALTER COLUMN id SET DEFAULT nextval('public.back_comment_id_seq'::regclass);


--
-- Name: back_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_post ALTER COLUMN id SET DEFAULT nextval('public.back_post_id_seq'::regclass);


--
-- Name: back_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user ALTER COLUMN id SET DEFAULT nextval('public.back_user_id_seq'::regclass);


--
-- Name: back_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_groups ALTER COLUMN id SET DEFAULT nextval('public.back_user_groups_id_seq'::regclass);


--
-- Name: back_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.back_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	3	add_permission
6	Can change permission	3	change_permission
7	Can delete permission	3	delete_permission
8	Can view permission	3	view_permission
9	Can add group	2	add_group
10	Can change group	2	change_group
11	Can delete group	2	delete_group
12	Can view group	2	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	8	add_user
22	Can change user	8	change_user
23	Can delete user	8	delete_user
24	Can view user	8	view_user
25	Can add comment	6	add_comment
26	Can change comment	6	change_comment
27	Can delete comment	6	delete_comment
28	Can view comment	6	view_comment
29	Can add post	7	add_post
30	Can change post	7	change_post
31	Can delete post	7	delete_post
32	Can view post	7	view_post
\.


--
-- Data for Name: back_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.back_comment (id, text, created_at, created_by_id, to_post_id) FROM stdin;
\.


--
-- Data for Name: back_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.back_post (id, text, html_body, status, created_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: back_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.back_user (id, password, last_login, is_superuser, email, name, last_name, date_of_birth, is_active, is_staff, role) FROM stdin;
1	pbkdf2_sha256$150000$lCiQitDeT15G$jV4pEPiqDbBzbbJn+/cuia/29MYr+IUw8+/0jXMIFB8=	\N	t	admin@admin.com	\N	\N	\N	t	f	admin
2	pbkdf2_sha256$150000$yE3SJRywVI53$J6wdTWWi9l+Fpbmesn1DvsSvHK2oLepVRjn+CJsnxRI=	\N	t	admin2@admin.com	\N	\N	\N	t	f	admin
\.


--
-- Data for Name: back_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.back_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: back_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.back_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	contenttypes	contenttype
5	sessions	session
6	back	comment
7	back	post
8	back	user
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-15 15:18:05.211263+00
2	contenttypes	0002_remove_content_type_name	2020-02-15 15:18:05.225841+00
3	auth	0001_initial	2020-02-15 15:18:05.257899+00
4	auth	0002_alter_permission_name_max_length	2020-02-15 15:18:05.283395+00
5	auth	0003_alter_user_email_max_length	2020-02-15 15:18:05.294088+00
6	auth	0004_alter_user_username_opts	2020-02-15 15:18:05.302992+00
7	auth	0005_alter_user_last_login_null	2020-02-15 15:18:05.310907+00
8	auth	0006_require_contenttypes_0002	2020-02-15 15:18:05.313105+00
9	auth	0007_alter_validators_add_error_messages	2020-02-15 15:18:05.320574+00
10	auth	0008_alter_user_username_max_length	2020-02-15 15:18:05.32807+00
11	auth	0009_alter_user_last_name_max_length	2020-02-15 15:18:05.335042+00
12	auth	0010_alter_group_name_max_length	2020-02-15 15:18:05.342071+00
13	auth	0011_update_proxy_permissions	2020-02-15 15:18:05.349265+00
14	back	0001_initial	2020-02-15 15:18:05.402333+00
15	admin	0001_initial	2020-02-15 15:18:05.447707+00
16	admin	0002_logentry_remove_auto_add	2020-02-15 15:18:05.466388+00
17	admin	0003_logentry_add_action_flag_choices	2020-02-15 15:18:05.478332+00
18	back	0002_auto_20200214_1608	2020-02-15 15:18:05.502081+00
19	back	0003_auto_20200215_1122	2020-02-15 15:18:05.513863+00
20	back	0004_auto_20200215_1142	2020-02-15 15:18:05.525336+00
21	sessions	0001_initial	2020-02-15 15:18:05.53382+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: back_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.back_comment_id_seq', 1, false);


--
-- Name: back_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.back_post_id_seq', 1, false);


--
-- Name: back_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.back_user_groups_id_seq', 1, false);


--
-- Name: back_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.back_user_id_seq', 2, true);


--
-- Name: back_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.back_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: back_comment back_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_comment
    ADD CONSTRAINT back_comment_pkey PRIMARY KEY (id);


--
-- Name: back_post back_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_post
    ADD CONSTRAINT back_post_pkey PRIMARY KEY (id);


--
-- Name: back_user back_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user
    ADD CONSTRAINT back_user_email_key UNIQUE (email);


--
-- Name: back_user_groups back_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_groups
    ADD CONSTRAINT back_user_groups_pkey PRIMARY KEY (id);


--
-- Name: back_user_groups back_user_groups_user_id_group_id_7e33747d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_groups
    ADD CONSTRAINT back_user_groups_user_id_group_id_7e33747d_uniq UNIQUE (user_id, group_id);


--
-- Name: back_user back_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user
    ADD CONSTRAINT back_user_pkey PRIMARY KEY (id);


--
-- Name: back_user_user_permissions back_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_user_permissions
    ADD CONSTRAINT back_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: back_user_user_permissions back_user_user_permissions_user_id_permission_id_62a2e455_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_user_permissions
    ADD CONSTRAINT back_user_user_permissions_user_id_permission_id_62a2e455_uniq UNIQUE (user_id, permission_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: back_comment_created_by_id_ab336514; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_comment_created_by_id_ab336514 ON public.back_comment USING btree (created_by_id);


--
-- Name: back_comment_to_post_id_71ba3927; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_comment_to_post_id_71ba3927 ON public.back_comment USING btree (to_post_id);


--
-- Name: back_post_created_by_id_8aa28b19; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_post_created_by_id_8aa28b19 ON public.back_post USING btree (created_by_id);


--
-- Name: back_user_email_198049a5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_user_email_198049a5_like ON public.back_user USING btree (email varchar_pattern_ops);


--
-- Name: back_user_groups_group_id_e87c60e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_user_groups_group_id_e87c60e5 ON public.back_user_groups USING btree (group_id);


--
-- Name: back_user_groups_user_id_24d476ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_user_groups_user_id_24d476ca ON public.back_user_groups USING btree (user_id);


--
-- Name: back_user_user_permissions_permission_id_fd6d868d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_user_user_permissions_permission_id_fd6d868d ON public.back_user_user_permissions USING btree (permission_id);


--
-- Name: back_user_user_permissions_user_id_7a645242; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_user_user_permissions_user_id_7a645242 ON public.back_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: back_comment back_comment_created_by_id_ab336514_fk_back_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_comment
    ADD CONSTRAINT back_comment_created_by_id_ab336514_fk_back_user_id FOREIGN KEY (created_by_id) REFERENCES public.back_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: back_comment back_comment_to_post_id_71ba3927_fk_back_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_comment
    ADD CONSTRAINT back_comment_to_post_id_71ba3927_fk_back_post_id FOREIGN KEY (to_post_id) REFERENCES public.back_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: back_post back_post_created_by_id_8aa28b19_fk_back_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_post
    ADD CONSTRAINT back_post_created_by_id_8aa28b19_fk_back_user_id FOREIGN KEY (created_by_id) REFERENCES public.back_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: back_user_groups back_user_groups_group_id_e87c60e5_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_groups
    ADD CONSTRAINT back_user_groups_group_id_e87c60e5_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: back_user_groups back_user_groups_user_id_24d476ca_fk_back_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_groups
    ADD CONSTRAINT back_user_groups_user_id_24d476ca_fk_back_user_id FOREIGN KEY (user_id) REFERENCES public.back_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: back_user_user_permissions back_user_user_permi_permission_id_fd6d868d_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_user_permissions
    ADD CONSTRAINT back_user_user_permi_permission_id_fd6d868d_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: back_user_user_permissions back_user_user_permissions_user_id_7a645242_fk_back_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_user_user_permissions
    ADD CONSTRAINT back_user_user_permissions_user_id_7a645242_fk_back_user_id FOREIGN KEY (user_id) REFERENCES public.back_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_back_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_back_user_id FOREIGN KEY (user_id) REFERENCES public.back_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

