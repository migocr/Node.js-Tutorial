--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

-- Started on 2021-08-30 14:57:05

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
-- TOC entry 6 (class 2615 OID 16398)
-- Name: test; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA test;


ALTER SCHEMA test OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16395)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    name character varying(20),
    age smallint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16415)
-- Name: test; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.test AS
 SELECT users.name,
    users.age
   FROM public.users
  WITH NO DATA;


ALTER TABLE public.test OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16411)
-- Name: xtest; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.xtest AS
 SELECT users.name,
    users.age
   FROM public.users;


ALTER TABLE public.xtest OWNER TO postgres;

--
-- TOC entry 2989 (class 0 OID 16395)
-- Dependencies: 201
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (name, age) FROM stdin;
john	21
\.


-- Completed on 2021-08-30 14:57:05

--
-- PostgreSQL database dump complete
--

