--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-01-15 15:02:11

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
-- TOC entry 201 (class 1259 OID 16429)
-- Name: ad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ad (
    id integer NOT NULL,
    title character varying(100),
    img_url text,
    link text,
    advertiser_id integer NOT NULL,
    clicks integer DEFAULT 0 NOT NULL,
    views integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.ad OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16422)
-- Name: advertiser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advertiser (
    id integer NOT NULL,
    name character varying(50),
    clicks integer DEFAULT 0 NOT NULL,
    views integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.advertiser OWNER TO postgres;

--
-- TOC entry 2994 (class 0 OID 16429)
-- Dependencies: 201
-- Data for Name: ad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ad (id, title, img_url, link, advertiser_id, clicks, views) FROM stdin;
1	title1	img_url1	link1	1	0	0
2	title2	img_url2	link2	2	0	0
\.


--
-- TOC entry 2993 (class 0 OID 16422)
-- Dependencies: 200
-- Data for Name: advertiser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advertiser (id, name, clicks, views) FROM stdin;
1	name1	0	0
2	name2	0	0
\.


--
-- TOC entry 2860 (class 2606 OID 16438)
-- Name: ad ad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ad
    ADD CONSTRAINT ad_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 16428)
-- Name: advertiser advertiser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertiser
    ADD CONSTRAINT advertiser_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 1259 OID 16444)
-- Name: fki_advertiser_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_advertiser_fkey ON public.ad USING btree (advertiser_id);


--
-- TOC entry 2862 (class 2606 OID 16439)
-- Name: ad advertiser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ad
    ADD CONSTRAINT advertiser_fkey FOREIGN KEY (advertiser_id) REFERENCES public.advertiser(id) NOT VALID;


-- Completed on 2021-01-15 15:02:11

--
-- PostgreSQL database dump complete
--

