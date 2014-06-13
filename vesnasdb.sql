--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.13
-- Dumped by pg_dump version 9.1.13
-- Started on 2014-06-13 15:20:18 CEST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 183 (class 3079 OID 11677)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 183
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 17151)
-- Dependencies: 6
-- Name: contexts; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE contexts (
    context_id bigint NOT NULL,
    context_description character varying
);


ALTER TABLE public.contexts OWNER TO matevz;

--
-- TOC entry 162 (class 1259 OID 17157)
-- Dependencies: 161 6
-- Name: contexts_context_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE contexts_context_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contexts_context_id_seq OWNER TO matevz;

--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 162
-- Name: contexts_context_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE contexts_context_id_seq OWNED BY contexts.context_id;


--
-- TOC entry 163 (class 1259 OID 17159)
-- Dependencies: 6
-- Name: locations; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE locations (
    location_id bigint NOT NULL,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.locations OWNER TO matevz;

--
-- TOC entry 164 (class 1259 OID 17162)
-- Dependencies: 163 6
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE locations_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_location_id_seq OWNER TO matevz;

--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 164
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE locations_location_id_seq OWNED BY locations.location_id;


--
-- TOC entry 165 (class 1259 OID 17164)
-- Dependencies: 6
-- Name: measurements; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE measurements (
    measurement_id bigint NOT NULL,
    node_id bigint,
    sensor_id bigint,
    quantity_id bigint,
    location_id bigint,
    context_id bigint,
    unit_id bigint,
    measurement_ts timestamp without time zone,
    measurement_value double precision
);


ALTER TABLE public.measurements OWNER TO matevz;

--
-- TOC entry 166 (class 1259 OID 17167)
-- Dependencies: 6 165
-- Name: measurements_measurement_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE measurements_measurement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measurements_measurement_id_seq OWNER TO matevz;

--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 166
-- Name: measurements_measurement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE measurements_measurement_id_seq OWNED BY measurements.measurement_id;


--
-- TOC entry 167 (class 1259 OID 17169)
-- Dependencies: 6
-- Name: nodes; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE nodes (
    node_id bigint NOT NULL,
    node_name character varying
);


ALTER TABLE public.nodes OWNER TO matevz;

--
-- TOC entry 168 (class 1259 OID 17175)
-- Dependencies: 167 6
-- Name: node_node_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE node_node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.node_node_id_seq OWNER TO matevz;

--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 168
-- Name: node_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE node_node_id_seq OWNED BY nodes.node_id;


--
-- TOC entry 169 (class 1259 OID 17177)
-- Dependencies: 6
-- Name: nodes_locations; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE nodes_locations (
    node_location_id bigint NOT NULL,
    node_id bigint,
    location_id bigint,
    node_location_ts timestamp with time zone
);


ALTER TABLE public.nodes_locations OWNER TO matevz;

--
-- TOC entry 170 (class 1259 OID 17180)
-- Dependencies: 6 169
-- Name: nodes_locations_node_location_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE nodes_locations_node_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nodes_locations_node_location_id_seq OWNER TO matevz;

--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 170
-- Name: nodes_locations_node_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE nodes_locations_node_location_id_seq OWNED BY nodes_locations.node_location_id;


--
-- TOC entry 171 (class 1259 OID 17182)
-- Dependencies: 6
-- Name: nodes_sensors; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE nodes_sensors (
    node_sensor_id bigint NOT NULL,
    node_id bigint,
    sensor_id bigint
);


ALTER TABLE public.nodes_sensors OWNER TO matevz;

--
-- TOC entry 172 (class 1259 OID 17185)
-- Dependencies: 6 171
-- Name: nodes_sensors_node_sensor_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE nodes_sensors_node_sensor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nodes_sensors_node_sensor_id_seq OWNER TO matevz;

--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 172
-- Name: nodes_sensors_node_sensor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE nodes_sensors_node_sensor_id_seq OWNED BY nodes_sensors.node_sensor_id;


--
-- TOC entry 173 (class 1259 OID 17187)
-- Dependencies: 6
-- Name: quantities; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE quantities (
    quantity_id bigint NOT NULL,
    quantity_name character varying
);


ALTER TABLE public.quantities OWNER TO matevz;

--
-- TOC entry 174 (class 1259 OID 17193)
-- Dependencies: 173 6
-- Name: quantities_quantity_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE quantities_quantity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quantities_quantity_id_seq OWNER TO matevz;

--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 174
-- Name: quantities_quantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE quantities_quantity_id_seq OWNED BY quantities.quantity_id;


--
-- TOC entry 182 (class 1259 OID 17469)
-- Dependencies: 6
-- Name: quantities_units; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE quantities_units (
    quantity_unit_id bigint NOT NULL,
    quantity_id bigint,
    unit_id bigint
);


ALTER TABLE public.quantities_units OWNER TO matevz;

--
-- TOC entry 181 (class 1259 OID 17467)
-- Dependencies: 182 6
-- Name: quantities_units_quantity_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE quantities_units_quantity_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quantities_units_quantity_unit_id_seq OWNER TO matevz;

--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 181
-- Name: quantities_units_quantity_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE quantities_units_quantity_unit_id_seq OWNED BY quantities_units.quantity_unit_id;


--
-- TOC entry 175 (class 1259 OID 17195)
-- Dependencies: 6
-- Name: sensors; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE sensors (
    sensor_id bigint NOT NULL,
    sensor_name character varying
);


ALTER TABLE public.sensors OWNER TO matevz;

--
-- TOC entry 176 (class 1259 OID 17201)
-- Dependencies: 6
-- Name: sensors_quantities; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE sensors_quantities (
    sensor_quantity_id bigint NOT NULL,
    sensor_id bigint,
    quantity_id bigint
);


ALTER TABLE public.sensors_quantities OWNER TO matevz;

--
-- TOC entry 177 (class 1259 OID 17204)
-- Dependencies: 176 6
-- Name: sensors_quantities_sensor_quantity_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE sensors_quantities_sensor_quantity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensors_quantities_sensor_quantity_id_seq OWNER TO matevz;

--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 177
-- Name: sensors_quantities_sensor_quantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE sensors_quantities_sensor_quantity_id_seq OWNED BY sensors_quantities.sensor_quantity_id;


--
-- TOC entry 178 (class 1259 OID 17206)
-- Dependencies: 6 175
-- Name: sensors_sensor_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE sensors_sensor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensors_sensor_id_seq OWNER TO matevz;

--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 178
-- Name: sensors_sensor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE sensors_sensor_id_seq OWNED BY sensors.sensor_id;


--
-- TOC entry 179 (class 1259 OID 17208)
-- Dependencies: 6
-- Name: units; Type: TABLE; Schema: public; Owner: matevz; Tablespace: 
--

CREATE TABLE units (
    unit_id bigint NOT NULL,
    unit_name character varying
);


ALTER TABLE public.units OWNER TO matevz;

--
-- TOC entry 180 (class 1259 OID 17214)
-- Dependencies: 6 179
-- Name: units_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: matevz
--

CREATE SEQUENCE units_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.units_unit_id_seq OWNER TO matevz;

--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 180
-- Name: units_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matevz
--

ALTER SEQUENCE units_unit_id_seq OWNED BY units.unit_id;


--
-- TOC entry 1848 (class 2604 OID 17216)
-- Dependencies: 162 161
-- Name: context_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY contexts ALTER COLUMN context_id SET DEFAULT nextval('contexts_context_id_seq'::regclass);


--
-- TOC entry 1849 (class 2604 OID 17217)
-- Dependencies: 164 163
-- Name: location_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY locations ALTER COLUMN location_id SET DEFAULT nextval('locations_location_id_seq'::regclass);


--
-- TOC entry 1850 (class 2604 OID 17218)
-- Dependencies: 166 165
-- Name: measurement_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY measurements ALTER COLUMN measurement_id SET DEFAULT nextval('measurements_measurement_id_seq'::regclass);


--
-- TOC entry 1851 (class 2604 OID 17219)
-- Dependencies: 168 167
-- Name: node_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY nodes ALTER COLUMN node_id SET DEFAULT nextval('node_node_id_seq'::regclass);


--
-- TOC entry 1852 (class 2604 OID 17220)
-- Dependencies: 170 169
-- Name: node_location_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY nodes_locations ALTER COLUMN node_location_id SET DEFAULT nextval('nodes_locations_node_location_id_seq'::regclass);


--
-- TOC entry 1853 (class 2604 OID 17221)
-- Dependencies: 172 171
-- Name: node_sensor_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY nodes_sensors ALTER COLUMN node_sensor_id SET DEFAULT nextval('nodes_sensors_node_sensor_id_seq'::regclass);


--
-- TOC entry 1854 (class 2604 OID 17222)
-- Dependencies: 174 173
-- Name: quantity_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY quantities ALTER COLUMN quantity_id SET DEFAULT nextval('quantities_quantity_id_seq'::regclass);


--
-- TOC entry 1858 (class 2604 OID 17472)
-- Dependencies: 182 181 182
-- Name: quantity_unit_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY quantities_units ALTER COLUMN quantity_unit_id SET DEFAULT nextval('quantities_units_quantity_unit_id_seq'::regclass);


--
-- TOC entry 1855 (class 2604 OID 17223)
-- Dependencies: 178 175
-- Name: sensor_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY sensors ALTER COLUMN sensor_id SET DEFAULT nextval('sensors_sensor_id_seq'::regclass);


--
-- TOC entry 1856 (class 2604 OID 17224)
-- Dependencies: 177 176
-- Name: sensor_quantity_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY sensors_quantities ALTER COLUMN sensor_quantity_id SET DEFAULT nextval('sensors_quantities_sensor_quantity_id_seq'::regclass);


--
-- TOC entry 1857 (class 2604 OID 17225)
-- Dependencies: 180 179
-- Name: unit_id; Type: DEFAULT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY units ALTER COLUMN unit_id SET DEFAULT nextval('units_unit_id_seq'::regclass);


--
-- TOC entry 2010 (class 0 OID 17151)
-- Dependencies: 161 2032
-- Data for Name: contexts; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY contexts (context_id, context_description) FROM stdin;
\.


--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 162
-- Name: contexts_context_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('contexts_context_id_seq', 1, false);


--
-- TOC entry 2012 (class 0 OID 17159)
-- Dependencies: 163 2032
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY locations (location_id, latitude, longitude) FROM stdin;
\.


--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 164
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('locations_location_id_seq', 1, false);


--
-- TOC entry 2014 (class 0 OID 17164)
-- Dependencies: 165 2032
-- Data for Name: measurements; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY measurements (measurement_id, node_id, sensor_id, quantity_id, location_id, context_id, unit_id, measurement_ts, measurement_value) FROM stdin;
\.


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 166
-- Name: measurements_measurement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('measurements_measurement_id_seq', 1, false);


--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 168
-- Name: node_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('node_node_id_seq', 1, false);


--
-- TOC entry 2016 (class 0 OID 17169)
-- Dependencies: 167 2032
-- Data for Name: nodes; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY nodes (node_id, node_name) FROM stdin;
\.


--
-- TOC entry 2018 (class 0 OID 17177)
-- Dependencies: 169 2032
-- Data for Name: nodes_locations; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY nodes_locations (node_location_id, node_id, location_id, node_location_ts) FROM stdin;
\.


--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 170
-- Name: nodes_locations_node_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('nodes_locations_node_location_id_seq', 1, false);


--
-- TOC entry 2020 (class 0 OID 17182)
-- Dependencies: 171 2032
-- Data for Name: nodes_sensors; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY nodes_sensors (node_sensor_id, node_id, sensor_id) FROM stdin;
\.


--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 172
-- Name: nodes_sensors_node_sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('nodes_sensors_node_sensor_id_seq', 1, false);


--
-- TOC entry 2022 (class 0 OID 17187)
-- Dependencies: 173 2032
-- Data for Name: quantities; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY quantities (quantity_id, quantity_name) FROM stdin;
\.


--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 174
-- Name: quantities_quantity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('quantities_quantity_id_seq', 1, false);


--
-- TOC entry 2031 (class 0 OID 17469)
-- Dependencies: 182 2032
-- Data for Name: quantities_units; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY quantities_units (quantity_unit_id, quantity_id, unit_id) FROM stdin;
\.


--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 181
-- Name: quantities_units_quantity_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('quantities_units_quantity_unit_id_seq', 1, false);


--
-- TOC entry 2024 (class 0 OID 17195)
-- Dependencies: 175 2032
-- Data for Name: sensors; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY sensors (sensor_id, sensor_name) FROM stdin;
\.


--
-- TOC entry 2025 (class 0 OID 17201)
-- Dependencies: 176 2032
-- Data for Name: sensors_quantities; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY sensors_quantities (sensor_quantity_id, sensor_id, quantity_id) FROM stdin;
\.


--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 177
-- Name: sensors_quantities_sensor_quantity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('sensors_quantities_sensor_quantity_id_seq', 1, false);


--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 178
-- Name: sensors_sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('sensors_sensor_id_seq', 1, false);


--
-- TOC entry 2028 (class 0 OID 17208)
-- Dependencies: 179 2032
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: matevz
--

COPY units (unit_id, unit_name) FROM stdin;
\.


--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 180
-- Name: units_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matevz
--

SELECT pg_catalog.setval('units_unit_id_seq', 1, false);


--
-- TOC entry 1860 (class 2606 OID 17321)
-- Dependencies: 161 161 2033
-- Name: contexts_context_description_key; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY contexts
    ADD CONSTRAINT contexts_context_description_key UNIQUE (context_description);


--
-- TOC entry 1862 (class 2606 OID 17227)
-- Dependencies: 161 161 2033
-- Name: contexts_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY contexts
    ADD CONSTRAINT contexts_pkey PRIMARY KEY (context_id);


--
-- TOC entry 1864 (class 2606 OID 17323)
-- Dependencies: 163 163 2033
-- Name: locations_latitude_key; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_latitude_key UNIQUE (latitude);


--
-- TOC entry 1866 (class 2606 OID 17325)
-- Dependencies: 163 163 2033
-- Name: locations_longitude_key; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_longitude_key UNIQUE (longitude);


--
-- TOC entry 1868 (class 2606 OID 17229)
-- Dependencies: 163 163 2033
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- TOC entry 1870 (class 2606 OID 17231)
-- Dependencies: 165 165 2033
-- Name: measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_pkey PRIMARY KEY (measurement_id);


--
-- TOC entry 1872 (class 2606 OID 17233)
-- Dependencies: 167 167 2033
-- Name: node_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT node_pkey PRIMARY KEY (node_id);


--
-- TOC entry 1876 (class 2606 OID 17235)
-- Dependencies: 169 169 2033
-- Name: nodes_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY nodes_locations
    ADD CONSTRAINT nodes_locations_pkey PRIMARY KEY (node_location_id);


--
-- TOC entry 1874 (class 2606 OID 17317)
-- Dependencies: 167 167 2033
-- Name: nodes_node_name_key; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT nodes_node_name_key UNIQUE (node_name);


--
-- TOC entry 1878 (class 2606 OID 17237)
-- Dependencies: 171 171 2033
-- Name: nodes_sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY nodes_sensors
    ADD CONSTRAINT nodes_sensors_pkey PRIMARY KEY (node_sensor_id);


--
-- TOC entry 1880 (class 2606 OID 17239)
-- Dependencies: 173 173 2033
-- Name: quantities_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY quantities
    ADD CONSTRAINT quantities_pkey PRIMARY KEY (quantity_id);


--
-- TOC entry 1882 (class 2606 OID 17241)
-- Dependencies: 173 173 2033
-- Name: quantities_quantity_name_key; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY quantities
    ADD CONSTRAINT quantities_quantity_name_key UNIQUE (quantity_name);


--
-- TOC entry 1894 (class 2606 OID 17474)
-- Dependencies: 182 182 2033
-- Name: quantities_units_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY quantities_units
    ADD CONSTRAINT quantities_units_pkey PRIMARY KEY (quantity_unit_id);


--
-- TOC entry 1884 (class 2606 OID 17243)
-- Dependencies: 175 175 2033
-- Name: sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (sensor_id);


--
-- TOC entry 1888 (class 2606 OID 17245)
-- Dependencies: 176 176 2033
-- Name: sensors_quantities_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY sensors_quantities
    ADD CONSTRAINT sensors_quantities_pkey PRIMARY KEY (sensor_quantity_id);


--
-- TOC entry 1886 (class 2606 OID 17319)
-- Dependencies: 175 175 2033
-- Name: sensors_sensor_name_key; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY sensors
    ADD CONSTRAINT sensors_sensor_name_key UNIQUE (sensor_name);


--
-- TOC entry 1890 (class 2606 OID 17247)
-- Dependencies: 179 179 2033
-- Name: units_pkey; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_pkey PRIMARY KEY (unit_id);


--
-- TOC entry 1892 (class 2606 OID 17249)
-- Dependencies: 179 179 2033
-- Name: units_unit_name_key; Type: CONSTRAINT; Schema: public; Owner: matevz; Tablespace: 
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_unit_name_key UNIQUE (unit_name);


--
-- TOC entry 1895 (class 2606 OID 17250)
-- Dependencies: 161 165 1861 2033
-- Name: measurements_context_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_context_id_fkey FOREIGN KEY (context_id) REFERENCES contexts(context_id);


--
-- TOC entry 1896 (class 2606 OID 17255)
-- Dependencies: 163 165 1867 2033
-- Name: measurements_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_location_id_fkey FOREIGN KEY (location_id) REFERENCES locations(location_id);


--
-- TOC entry 1897 (class 2606 OID 17260)
-- Dependencies: 167 165 1871 2033
-- Name: measurements_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_node_id_fkey FOREIGN KEY (node_id) REFERENCES nodes(node_id);


--
-- TOC entry 1898 (class 2606 OID 17265)
-- Dependencies: 173 165 1879 2033
-- Name: measurements_quantity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_quantity_id_fkey FOREIGN KEY (quantity_id) REFERENCES quantities(quantity_id);


--
-- TOC entry 1899 (class 2606 OID 17270)
-- Dependencies: 175 165 1883 2033
-- Name: measurements_sensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES sensors(sensor_id);


--
-- TOC entry 1900 (class 2606 OID 18794)
-- Dependencies: 165 1889 179 2033
-- Name: measurements_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES units(unit_id);


--
-- TOC entry 1901 (class 2606 OID 17280)
-- Dependencies: 169 1867 163 2033
-- Name: nodes_locations_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY nodes_locations
    ADD CONSTRAINT nodes_locations_location_id_fkey FOREIGN KEY (location_id) REFERENCES locations(location_id);


--
-- TOC entry 1902 (class 2606 OID 17285)
-- Dependencies: 169 1871 167 2033
-- Name: nodes_locations_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY nodes_locations
    ADD CONSTRAINT nodes_locations_node_id_fkey FOREIGN KEY (node_id) REFERENCES nodes(node_id);


--
-- TOC entry 1903 (class 2606 OID 17290)
-- Dependencies: 171 1871 167 2033
-- Name: nodes_sensors_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY nodes_sensors
    ADD CONSTRAINT nodes_sensors_node_id_fkey FOREIGN KEY (node_id) REFERENCES nodes(node_id);


--
-- TOC entry 1904 (class 2606 OID 17295)
-- Dependencies: 175 171 1883 2033
-- Name: nodes_sensors_sensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY nodes_sensors
    ADD CONSTRAINT nodes_sensors_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES sensors(sensor_id);


--
-- TOC entry 1907 (class 2606 OID 17475)
-- Dependencies: 1879 182 173 2033
-- Name: quantities_units_quantity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY quantities_units
    ADD CONSTRAINT quantities_units_quantity_id_fkey FOREIGN KEY (quantity_id) REFERENCES quantities(quantity_id);


--
-- TOC entry 1908 (class 2606 OID 17480)
-- Dependencies: 182 179 1889 2033
-- Name: quantities_units_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY quantities_units
    ADD CONSTRAINT quantities_units_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES units(unit_id);


--
-- TOC entry 1905 (class 2606 OID 17300)
-- Dependencies: 176 173 1879 2033
-- Name: sensors_quantities_quantity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY sensors_quantities
    ADD CONSTRAINT sensors_quantities_quantity_id_fkey FOREIGN KEY (quantity_id) REFERENCES quantities(quantity_id);


--
-- TOC entry 1906 (class 2606 OID 17305)
-- Dependencies: 176 1883 175 2033
-- Name: sensors_quantities_sensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matevz
--

ALTER TABLE ONLY sensors_quantities
    ADD CONSTRAINT sensors_quantities_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES sensors(sensor_id);


--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-06-13 15:20:18 CEST

--
-- PostgreSQL database dump complete
--

