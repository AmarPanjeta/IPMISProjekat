--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.19
-- Dumped by pg_dump version 9.3.19
-- Started on 2017-11-07 14:40:18 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE ppis;
--
-- TOC entry 2061 (class 1262 OID 41962)
-- Name: ppis; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ppis WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE ppis OWNER TO postgres;

\connect ppis

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11787)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 41963)
-- Name: answer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE answer (
    id bigint NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    text character varying(255),
    autor_id bigint
);


ALTER TABLE public.answer OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 41969)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE department (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 42023)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 41974)
-- Name: incident; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE incident (
    id bigint NOT NULL,
    closed_time_date date,
    contact_method integer NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    fixed_time_date date,
    priority integer NOT NULL,
    repetition integer,
    report_method integer NOT NULL,
    title character varying(255),
    urgency integer NOT NULL,
    department_id bigint,
    evidenter_user_id bigint,
    incident_id bigint,
    service_id bigint,
    status_id bigint,
    user_id bigint,
    taken bigint NOT NULL
);


ALTER TABLE public.incident OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 41983)
-- Name: incident_answer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE incident_answer (
    id bigint NOT NULL,
    answer_id bigint,
    incident_id bigint
);


ALTER TABLE public.incident_answer OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 41988)
-- Name: registered_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE registered_user (
    id bigint NOT NULL,
    address character varying(255),
    email character varying(255),
    name character varying(255),
    password character varying(255),
    surname character varying(255),
    telephone character varying(255),
    type integer NOT NULL,
    username character varying(255)
);


ALTER TABLE public.registered_user OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 41996)
-- Name: request; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE request (
    id bigint NOT NULL,
    contact_method integer NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(255),
    priority integer NOT NULL,
    report_method integer NOT NULL,
    title character varying(255),
    urgency integer NOT NULL,
    department_id bigint,
    status_id bigint,
    user_id bigint
);


ALTER TABLE public.request OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 42108)
-- Name: request_answer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE request_answer (
    id bigint NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    text character varying(255),
    autor_id bigint,
    request_id bigint
);


ALTER TABLE public.request_answer OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 42005)
-- Name: service; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE service (
    id bigint NOT NULL,
    available boolean NOT NULL,
    description character varying(255),
    name character varying(255),
    price double precision NOT NULL
);


ALTER TABLE public.service OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 42013)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE status (
    id bigint NOT NULL,
    status character varying(255)
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 42018)
-- Name: user_service; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_service (
    id bigint NOT NULL,
    service_id bigint,
    user_id bigint
);


ALTER TABLE public.user_service OWNER TO postgres;

--
-- TOC entry 2046 (class 0 OID 41963)
-- Dependencies: 171
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO answer (id, created, text, autor_id) VALUES (1, '2017-05-25 11:57:10.348669', 'Restartuj ruter', 1);
INSERT INTO answer (id, created, text, autor_id) VALUES (14, '2017-06-03 15:00:24.531044', 'problem rijesen restartovanjem rutera', 1);
INSERT INTO answer (id, created, text, autor_id) VALUES (27, '2017-06-03 21:43:40.331119', 'i dalje ne radi', 2);
INSERT INTO answer (id, created, text, autor_id) VALUES (34, '2017-06-03 23:20:55.135868', 'radovi su u toku', 1);
INSERT INTO answer (id, created, text, autor_id) VALUES (37, '2017-06-06 10:01:00.090077', 'u ugovoru pise 100mbps a ostvaruje samo 50', 2);
INSERT INTO answer (id, created, text, autor_id) VALUES (46, '2017-06-06 16:22:01.159501', 'potrebno je restartovati ruter', 1);
INSERT INTO answer (id, created, text, autor_id) VALUES (51, '2017-06-06 17:22:00.882487', 'pronadjena je greska na vezi koja je popravljen', 1);


--
-- TOC entry 2047 (class 0 OID 41969)
-- Dependencies: 172
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO department (id, name) VALUES (1, 'Odjel za IT');
INSERT INTO department (id, name) VALUES (2, 'Odjel za podrsku korisnicima');
INSERT INTO department (id, name) VALUES (3, 'Odjel ya sigurnost');


--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 180
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 56, true);


--
-- TOC entry 2048 (class 0 OID 41974)
-- Dependencies: 173
-- Data for Name: incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (44, NULL, 2, '2017-06-06 16:19:51.510547', 'dobio sam racun koji je veci nego ugovoreni', NULL, 0, 0, 3, 'prevelik racun', 0, NULL, 2, NULL, 2, 3, 2, 0);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (50, NULL, 1, '2017-06-06 16:24:24.246797', 'nista ne rad', NULL, 0, 0, 1, 'ne radi nista', 0, 2, NULL, NULL, NULL, 10, 2, 0);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (33, '2017-06-06', 2, '2017-06-03 23:16:41.942188', 'brzina interneta je manja nego sto pise u ugovoru', '2017-06-06', 0, 0, 3, 'internet je spor', 0, NULL, 2, NULL, 1, 3, 2, 1);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (54, NULL, 1, '2017-06-06 17:38:32.88231', 'neki opis', NULL, 0, 0, 3, 'naziv', 0, NULL, 2, NULL, 2, 3, 2, 0);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (1, '2017-06-06', 2, '2017-05-25 12:07:15.142795', 'Mala brzina', '2017-06-06', 5, 0, 1, 'Ne radi konekcija', 2, 1, 1, 33, 2, 6, 1, 1);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (8, NULL, 1, '2017-06-01 11:24:52.400608', 'iospd', NULL, 0, 0, 1, 'opis', 0, 2, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (9, NULL, 2, '2017-06-01 12:32:29.283531', 'fghjkl', NULL, 0, 0, 1, 'dfghjk', 0, 1, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (10, NULL, 1, '2017-06-01 12:32:40.365786', 'opis zahtjeva', NULL, 0, 0, 1, 'naslov zahtjeva', 1, 1, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (13, NULL, 2, '2017-06-01 12:37:19.328194', 'opiiiiiis', NULL, 0, 0, 1, 'opis', 0, 3, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (2, NULL, 0, '2017-05-26 15:14:20.777648', 'incident', NULL, 5, 0, 0, 'incident', 2, NULL, 1, NULL, NULL, 3, NULL, 0);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (7, NULL, 0, '2017-06-01 02:44:19.97117', 'jako bitan incident', NULL, 0, 0, 0, 'jako bitan incident', 0, 1, NULL, NULL, NULL, 10, 1, 0);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (26, '2017-06-03', 1, '2017-06-03 21:43:24.244666', 'internet', '2017-06-03', 0, 0, 3, 'spor internet', 0, NULL, 2, NULL, 1, 8, 2, 1);
INSERT INTO incident (id, closed_time_date, contact_method, created, description, fixed_time_date, priority, repetition, report_method, title, urgency, department_id, evidenter_user_id, incident_id, service_id, status_id, user_id, taken) VALUES (39, NULL, 1, '2017-06-06 11:27:52.370004', 'a nece ni sutra', NULL, 0, 0, 3, 'ne radi  danas mreza', 0, NULL, 2, NULL, 1, 8, 2, 0);


--
-- TOC entry 2049 (class 0 OID 41983)
-- Dependencies: 174
-- Data for Name: incident_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (1, 1, 1);
INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (15, 14, 1);
INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (28, 27, 26);
INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (35, 34, 26);
INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (38, 37, 33);
INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (45, 37, 1);
INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (47, 46, 1);
INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (48, NULL, 1);
INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (52, 51, 33);
INSERT INTO incident_answer (id, answer_id, incident_id) VALUES (56, 51, 1);


--
-- TOC entry 2050 (class 0 OID 41988)
-- Dependencies: 175
-- Data for Name: registered_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO registered_user (id, address, email, name, password, surname, telephone, type, username) VALUES (1, 'Zmaja od Bosne', 'admin@gmail.com', 'Dzala', 'admin', 'Dzalic', '062329552', 1, 'admin');
INSERT INTO registered_user (id, address, email, name, password, surname, telephone, type, username) VALUES (2, 'Hamdije Cemerlica br. 3', 'user@user.com', 'Korisnik', 'user', 'Korisnick', '033245678', 2, 'user');
INSERT INTO registered_user (id, address, email, name, password, surname, telephone, type, username) VALUES (4, 'Adresa 2', 'rqm@rqm.rm', 'rqm', 'rqm', 'rqm', '666666', 3, 'rqm');
INSERT INTO registered_user (id, address, email, name, password, surname, telephone, type, username) VALUES (5, 'Adresa 3', 'im@im.im', 'im', 'im', 'im', '777777', 4, 'im');
INSERT INTO registered_user (id, address, email, name, password, surname, telephone, type, username) VALUES (3, 'Adresa', 'user@nije.ba', 'Korisnik', 'korisnik', 'korisnik', '9999999', 2, 'korisnik');


--
-- TOC entry 2051 (class 0 OID 41996)
-- Dependencies: 176
-- Data for Name: request; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (5, 1, '2017-05-31 14:46:56.560391', 'iospd', 3, 1, 'opis', 0, 2, 9, 1);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (12, 2, '2017-06-01 12:36:59.792698', 'opiiiiiis', 5, 1, 'opis', 0, 3, 9, 1);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (11, 1, '2017-06-01 12:36:30.359046', 'fghjhftyj', 3, 1, 'fghjjgtyujhg', 0, 3, 11, 1);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (29, 1, '2017-06-03 22:15:46.83977', 'moze li se napraviti paket samo sa internetom', 0, 3, 'internet paket', 0, 2, 3, 2);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (1, 1, '2017-05-26 13:23:45.949257', 'internet incident', 1, 1, 'zahtjev za internet', 1, 1, 9, 1);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (6, 0, '2017-06-01 01:54:33.235896', NULL, 5, 0, 'zahtjev za internet', 0, 1, 9, 1);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (4, 0, '2017-05-28 03:50:14.900435', 'ovo je incident', 5, 0, 'zahtjev za mobilnom uslugom', 0, 1, 5, 1);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (3, 2, '2017-05-27 18:00:21.736063', 'telefon incident', 1, 1, 'dfghjk', 0, 1, 5, 1);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (31, 2, '2017-06-03 22:16:53.852038', 'zelim internet', 3, 3, 'zelim internet', 0, 2, 8, 2);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (40, 2, '2017-06-06 11:38:23.771024', 'novi', 0, 3, 'novi', 0, 2, 8, 2);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (49, 1, '2017-06-06 16:24:17.40041', 'nista ne rad', 1, 1, 'ne radi nista', 0, 2, 9, 2);
INSERT INTO request (id, contact_method, created, description, priority, report_method, title, urgency, department_id, status_id, user_id) VALUES (55, 1, '2017-06-06 17:40:36.175896', 'doatni', 0, 3, 'dodatni', 0, 2, 3, 2);


--
-- TOC entry 2056 (class 0 OID 42108)
-- Dependencies: 181
-- Data for Name: request_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (16, '2017-06-03 16:03:38.02119', 'wfg', 1, 11);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (17, '2017-06-03 16:04:41.84623', 'wwewew', 1, 11);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (18, '2017-06-03 16:05:43.139449', 'da li da li dali salvador', 1, 11);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (19, '2017-06-03 16:09:08.140193', 'pa to je to', 1, 11);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (20, '2017-06-03 16:10:15.134569', 'cisti se', 1, 11);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (21, '2017-06-03 16:10:30.449011', 'ili ipak ne', 1, 11);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (22, '2017-06-03 17:01:37.229016', 'odg', 1, 11);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (23, '2017-06-03 17:09:58.963266', 'sdfghj', 1, 11);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (30, '2017-06-03 22:15:54.324073', 'i?', 2, 29);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (32, '2017-06-03 22:17:35.905429', 'prijavite internet', 1, 31);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (36, '2017-06-03 23:54:55.315004', 'vas zahtjev je danas stigao', 1, 31);
INSERT INTO request_answer (id, created, text, autor_id, request_id) VALUES (41, '2017-06-06 11:38:31.371055', 'ma nista, ja se zeznuo', 2, 40);


--
-- TOC entry 2052 (class 0 OID 42005)
-- Dependencies: 177
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO service (id, available, description, name, price) VALUES (1, true, 'Opis neki', 'Student 1', 20);
INSERT INTO service (id, available, description, name, price) VALUES (2, true, 'Opis', 'Student 2', 30);


--
-- TOC entry 2053 (class 0 OID 42013)
-- Dependencies: 178
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO status (id, status) VALUES (1, 'Incident');
INSERT INTO status (id, status) VALUES (2, 'Zahtjev');
INSERT INTO status (id, status) VALUES (3, 'Nerijesen');
INSERT INTO status (id, status) VALUES (4, 'Odobren');
INSERT INTO status (id, status) VALUES (5, 'Odbijen');
INSERT INTO status (id, status) VALUES (6, 'Popravljen');
INSERT INTO status (id, status) VALUES (7, 'Otkazan');
INSERT INTO status (id, status) VALUES (8, 'Zatvoren');
INSERT INTO status (id, status) VALUES (9, 'Pogresno prijavljen');
INSERT INTO status (id, status) VALUES (10, 'Poslan');
INSERT INTO status (id, status) VALUES (11, 'U obradi');


--
-- TOC entry 2054 (class 0 OID 42018)
-- Dependencies: 179
-- Data for Name: user_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_service (id, service_id, user_id) VALUES (1, 1, 1);
INSERT INTO user_service (id, service_id, user_id) VALUES (2, 2, 1);
INSERT INTO user_service (id, service_id, user_id) VALUES (25, 1, 2);
INSERT INTO user_service (id, service_id, user_id) VALUES (53, 2, 2);


--
-- TOC entry 1904 (class 2606 OID 41968)
-- Name: answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- TOC entry 1906 (class 2606 OID 41973)
-- Name: department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- TOC entry 1910 (class 2606 OID 41987)
-- Name: incident_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY incident_answer
    ADD CONSTRAINT incident_answer_pkey PRIMARY KEY (id);


--
-- TOC entry 1908 (class 2606 OID 41982)
-- Name: incident_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT incident_pkey PRIMARY KEY (id);


--
-- TOC entry 1912 (class 2606 OID 41995)
-- Name: registered_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY registered_user
    ADD CONSTRAINT registered_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1922 (class 2606 OID 42113)
-- Name: request_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY request_answer
    ADD CONSTRAINT request_answer_pkey PRIMARY KEY (id);


--
-- TOC entry 1914 (class 2606 OID 42004)
-- Name: request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id);


--
-- TOC entry 1916 (class 2606 OID 42012)
-- Name: service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- TOC entry 1918 (class 2606 OID 42017)
-- Name: status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 1920 (class 2606 OID 42022)
-- Name: user_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_service
    ADD CONSTRAINT user_service_pkey PRIMARY KEY (id);


--
-- TOC entry 1938 (class 2606 OID 42119)
-- Name: fk10msj5aguow0l5kjvnutiy1li; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY request_answer
    ADD CONSTRAINT fk10msj5aguow0l5kjvnutiy1li FOREIGN KEY (request_id) REFERENCES request(id);


--
-- TOC entry 1923 (class 2606 OID 42025)
-- Name: fk2negk2yr2jitscnbi1pihdhh6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answer
    ADD CONSTRAINT fk2negk2yr2jitscnbi1pihdhh6 FOREIGN KEY (autor_id) REFERENCES registered_user(id);


--
-- TOC entry 1926 (class 2606 OID 42040)
-- Name: fk3baxeyjawu1w9rrkeqvid0q2k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fk3baxeyjawu1w9rrkeqvid0q2k FOREIGN KEY (incident_id) REFERENCES incident(id);


--
-- TOC entry 1934 (class 2606 OID 42080)
-- Name: fk3bixmv7rt2a9w28gs8896idu3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY request
    ADD CONSTRAINT fk3bixmv7rt2a9w28gs8896idu3 FOREIGN KEY (user_id) REFERENCES registered_user(id);


--
-- TOC entry 1932 (class 2606 OID 42070)
-- Name: fk8efits1bgv0p2u99jaxynja07; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY request
    ADD CONSTRAINT fk8efits1bgv0p2u99jaxynja07 FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 1936 (class 2606 OID 42090)
-- Name: fk99s1sng94mnjixkego2q0hbtt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_service
    ADD CONSTRAINT fk99s1sng94mnjixkego2q0hbtt FOREIGN KEY (user_id) REFERENCES registered_user(id);


--
-- TOC entry 1927 (class 2606 OID 42045)
-- Name: fk9iyx0bx22qbvtxaybkh34s32m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fk9iyx0bx22qbvtxaybkh34s32m FOREIGN KEY (service_id) REFERENCES service(id);


--
-- TOC entry 1933 (class 2606 OID 42075)
-- Name: fk9vq2pk42lwv57luvm5h5yle7y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY request
    ADD CONSTRAINT fk9vq2pk42lwv57luvm5h5yle7y FOREIGN KEY (status_id) REFERENCES status(id);


--
-- TOC entry 1929 (class 2606 OID 42055)
-- Name: fkaofy4k2ngcu9c54y3pn853e8k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fkaofy4k2ngcu9c54y3pn853e8k FOREIGN KEY (user_id) REFERENCES registered_user(id);


--
-- TOC entry 1925 (class 2606 OID 42035)
-- Name: fke08biv93sy5ogsyhy6lus6971; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fke08biv93sy5ogsyhy6lus6971 FOREIGN KEY (evidenter_user_id) REFERENCES registered_user(id);


--
-- TOC entry 1924 (class 2606 OID 42030)
-- Name: fkg6cssslg0m5b086o9ka74bguk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fkg6cssslg0m5b086o9ka74bguk FOREIGN KEY (department_id) REFERENCES department(id);


--
-- TOC entry 1935 (class 2606 OID 42085)
-- Name: fkh3j8qx28ovbd1pxoyetawnns6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_service
    ADD CONSTRAINT fkh3j8qx28ovbd1pxoyetawnns6 FOREIGN KEY (service_id) REFERENCES service(id);


--
-- TOC entry 1930 (class 2606 OID 42060)
-- Name: fkhr9tf2dwyyokrk7l0b6bf21uj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_answer
    ADD CONSTRAINT fkhr9tf2dwyyokrk7l0b6bf21uj FOREIGN KEY (answer_id) REFERENCES answer(id);


--
-- TOC entry 1937 (class 2606 OID 42114)
-- Name: fkjaqtlfr4n0mdwbwbsoir7tosn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY request_answer
    ADD CONSTRAINT fkjaqtlfr4n0mdwbwbsoir7tosn FOREIGN KEY (autor_id) REFERENCES registered_user(id);


--
-- TOC entry 1931 (class 2606 OID 42065)
-- Name: fkls798tsdqn0qya3eyltjyvo3j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_answer
    ADD CONSTRAINT fkls798tsdqn0qya3eyltjyvo3j FOREIGN KEY (incident_id) REFERENCES incident(id);


--
-- TOC entry 1928 (class 2606 OID 42050)
-- Name: fknnvqhgllxqbqdrpobr7v3qmo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fknnvqhgllxqbqdrpobr7v3qmo FOREIGN KEY (status_id) REFERENCES status(id);


--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-11-07 14:40:18 CET

--
-- PostgreSQL database dump complete
--

