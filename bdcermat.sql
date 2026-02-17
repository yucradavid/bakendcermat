--
-- PostgreSQL database dump
--

\restrict 9LdYBEhZYCjX1t7vJrT88McYB0qFKNiDRbEif9foTJsuqxeuOkxz7XhyLAo4ccl

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-02-06 21:32:41

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 35 (class 2615 OID 16494)
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- TOC entry 22 (class 2615 OID 16388)
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- TOC entry 33 (class 2615 OID 16624)
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- TOC entry 32 (class 2615 OID 16613)
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- TOC entry 11 (class 2615 OID 16386)
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- TOC entry 12 (class 2615 OID 16605)
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- TOC entry 36 (class 2615 OID 16542)
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- TOC entry 30 (class 2615 OID 16653)
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- TOC entry 6 (class 3079 OID 16689)
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- TOC entry 2 (class 3079 OID 16389)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- TOC entry 4 (class 3079 OID 16443)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 5 (class 3079 OID 16654)
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- TOC entry 7 (class 3079 OID 40590)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- TOC entry 3 (class 3079 OID 16432)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 1239 (class 1247 OID 16784)
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- TOC entry 1263 (class 1247 OID 16925)
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- TOC entry 1236 (class 1247 OID 16778)
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- TOC entry 1233 (class 1247 OID 16773)
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1281 (class 1247 OID 17028)
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- TOC entry 1293 (class 1247 OID 17101)
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1275 (class 1247 OID 17006)
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1284 (class 1247 OID 17038)
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1269 (class 1247 OID 16967)
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1410 (class 1247 OID 17936)
-- Name: announcement_audience; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.announcement_audience AS ENUM (
    'todos',
    'docentes',
    'estudiantes',
    'apoderados',
    'seccion_especifica'
);


ALTER TYPE public.announcement_audience OWNER TO postgres;

--
-- TOC entry 1407 (class 1247 OID 17926)
-- Name: announcement_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.announcement_status AS ENUM (
    'borrador',
    'pendiente_aprobacion',
    'publicado',
    'archivado'
);


ALTER TYPE public.announcement_status OWNER TO postgres;

--
-- TOC entry 1383 (class 1247 OID 17762)
-- Name: attendance_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.attendance_status AS ENUM (
    'presente',
    'tarde',
    'falta',
    'justificado'
);


ALTER TYPE public.attendance_status OWNER TO postgres;

--
-- TOC entry 1470 (class 1247 OID 21972)
-- Name: audit_action; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.audit_action AS ENUM (
    'insert',
    'update',
    'delete',
    'publish',
    'approve',
    'reject',
    'close'
);


ALTER TYPE public.audit_action OWNER TO postgres;

--
-- TOC entry 1419 (class 1247 OID 17988)
-- Name: charge_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.charge_status AS ENUM (
    'pendiente',
    'pagado_parcial',
    'pagado',
    'vencido'
);


ALTER TYPE public.charge_status OWNER TO postgres;

--
-- TOC entry 1416 (class 1247 OID 17976)
-- Name: charge_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.charge_type AS ENUM (
    'matricula',
    'pension',
    'material',
    'uniforme',
    'otro'
);


ALTER TYPE public.charge_type OWNER TO postgres;

--
-- TOC entry 1479 (class 1247 OID 26068)
-- Name: concept_periodicity; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.concept_periodicity AS ENUM (
    'unico',
    'mensual',
    'anual',
    'opcional'
);


ALTER TYPE public.concept_periodicity OWNER TO postgres;

--
-- TOC entry 1476 (class 1247 OID 26052)
-- Name: concept_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.concept_type AS ENUM (
    'matricula',
    'pension',
    'interes',
    'certificado',
    'taller',
    'servicio',
    'otro'
);


ALTER TYPE public.concept_type OWNER TO postgres;

--
-- TOC entry 1485 (class 1247 OID 26084)
-- Name: discount_scope; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.discount_scope AS ENUM (
    'todos',
    'pension',
    'matricula',
    'especifico'
);


ALTER TYPE public.discount_scope OWNER TO postgres;

--
-- TOC entry 1482 (class 1247 OID 26078)
-- Name: discount_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.discount_type AS ENUM (
    'porcentaje',
    'monto_fijo'
);


ALTER TYPE public.discount_type OWNER TO postgres;

--
-- TOC entry 1353 (class 1247 OID 17569)
-- Name: education_level; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.education_level AS ENUM (
    'inicial',
    'primaria',
    'secundaria'
);


ALTER TYPE public.education_level OWNER TO postgres;

--
-- TOC entry 1389 (class 1247 OID 17806)
-- Name: evaluation_grade; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.evaluation_grade AS ENUM (
    'AD',
    'A',
    'B',
    'C'
);


ALTER TYPE public.evaluation_grade OWNER TO postgres;

--
-- TOC entry 1392 (class 1247 OID 17816)
-- Name: evaluation_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.evaluation_status AS ENUM (
    'borrador',
    'publicada',
    'cerrada'
);


ALTER TYPE public.evaluation_status OWNER TO postgres;

--
-- TOC entry 1443 (class 1247 OID 21610)
-- Name: justification_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.justification_status AS ENUM (
    'pendiente',
    'aprobada',
    'rechazada'
);


ALTER TYPE public.justification_status OWNER TO postgres;

--
-- TOC entry 1464 (class 1247 OID 21946)
-- Name: notification_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.notification_status AS ENUM (
    'no_leida',
    'leida'
);


ALTER TYPE public.notification_status OWNER TO postgres;

--
-- TOC entry 1461 (class 1247 OID 21930)
-- Name: notification_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.notification_type AS ENUM (
    'evaluacion_publicada',
    'justificacion_aprobada',
    'justificacion_rechazada',
    'pago_registrado',
    'comunicado_nuevo',
    'tarea_nueva',
    'recordatorio_pago'
);


ALTER TYPE public.notification_type OWNER TO postgres;

--
-- TOC entry 1425 (class 1247 OID 18025)
-- Name: payment_method; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_method AS ENUM (
    'efectivo',
    'transferencia',
    'tarjeta',
    'yape',
    'plin',
    'pasarela'
);


ALTER TYPE public.payment_method OWNER TO postgres;

--
-- TOC entry 1533 (class 1247 OID 40606)
-- Name: public_news_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.public_news_category AS ENUM (
    'institucional',
    'academico',
    'eventos',
    'deportes',
    'tecnologia',
    'admisiones',
    'logros',
    'comunidad',
    'otro'
);


ALTER TYPE public.public_news_category OWNER TO postgres;

--
-- TOC entry 1530 (class 1247 OID 40598)
-- Name: public_news_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.public_news_status AS ENUM (
    'borrador',
    'publicado',
    'archivado'
);


ALTER TYPE public.public_news_status OWNER TO postgres;

--
-- TOC entry 1401 (class 1247 OID 17888)
-- Name: submission_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.submission_status AS ENUM (
    'pendiente',
    'entregada',
    'revisada',
    'atrasada'
);


ALTER TYPE public.submission_status OWNER TO postgres;

--
-- TOC entry 1338 (class 1247 OID 17503)
-- Name: user_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role AS ENUM (
    'admin',
    'director',
    'coordinator',
    'secretary',
    'teacher',
    'student',
    'guardian',
    'finance',
    'cashier',
    'web_editor'
);


ALTER TYPE public.user_role OWNER TO postgres;

--
-- TOC entry 1329 (class 1247 OID 17354)
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- TOC entry 1320 (class 1247 OID 17310)
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- TOC entry 1323 (class 1247 OID 17325)
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- TOC entry 1335 (class 1247 OID 17396)
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- TOC entry 1332 (class 1247 OID 17367)
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- TOC entry 1305 (class 1247 OID 17236)
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- TOC entry 479 (class 1255 OID 16540)
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 479
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- TOC entry 489 (class 1255 OID 16755)
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- TOC entry 435 (class 1255 OID 16539)
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 435
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- TOC entry 450 (class 1255 OID 16538)
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 450
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- TOC entry 527 (class 1255 OID 16597)
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 527
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- TOC entry 504 (class 1255 OID 16618)
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 504
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- TOC entry 468 (class 1255 OID 16599)
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 468
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- TOC entry 428 (class 1255 OID 16609)
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- TOC entry 543 (class 1255 OID 16610)
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- TOC entry 441 (class 1255 OID 16620)
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 441
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- TOC entry 482 (class 1255 OID 16387)
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO ''
    AS $_$
  BEGIN
      RAISE DEBUG 'PgBouncer auth request: %', p_usename;

      RETURN QUERY
      SELECT
          rolname::text,
          CASE WHEN rolvaliduntil < now()
              THEN null
              ELSE rolpassword::text
          END
      FROM pg_authid
      WHERE rolname=$1 and rolcanlogin;
  END;
  $_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- TOC entry 464 (class 1255 OID 22212)
-- Name: activate_user(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.activate_user(p_user_id uuid) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  -- Verificar que quien ejecuta es admin/director
  IF NOT EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid()
    AND role IN ('admin', 'director')
  ) THEN
    RAISE EXCEPTION 'No autorizado para activar usuarios';
  END IF;

  -- Activar usuario
  UPDATE profiles
  SET is_active = true
  WHERE id = p_user_id;

  RETURN true;
END;
$$;


ALTER FUNCTION public.activate_user(p_user_id uuid) OWNER TO postgres;

--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 464
-- Name: FUNCTION activate_user(p_user_id uuid); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.activate_user(p_user_id uuid) IS 'Activa un usuario (solo admin/director)';


--
-- TOC entry 427 (class 1255 OID 23626)
-- Name: approve_enrollment_application(uuid, uuid, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.approve_enrollment_application(p_application_id uuid, p_section_id uuid, p_approved_by uuid) RETURNS TABLE(success boolean, message text, student_id uuid, guardian_id uuid, user_id uuid)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  v_application RECORD;
  v_guardian_id UUID;
  v_student_id UUID;
  v_user_id UUID;
  v_student_code TEXT;
  v_temp_password TEXT;
  v_academic_year_id UUID;
BEGIN
  -- Obtener datos de la solicitud
  SELECT * INTO v_application
  FROM enrollment_applications
  WHERE id = p_application_id AND status = 'pending';
  
  IF NOT FOUND THEN
    RETURN QUERY SELECT false, 'Solicitud no encontrada o ya procesada'::TEXT, NULL::UUID, NULL::UUID, NULL::UUID;
    RETURN;
  END IF;
  
  -- Verificar que la sección corresponde al grado solicitado
  IF NOT EXISTS (
    SELECT 1 FROM sections s
    WHERE s.id = p_section_id AND s.grade_level_id = v_application.grade_level_id
  ) THEN
    RETURN QUERY SELECT false, 'La sección no corresponde al grado solicitado'::TEXT, NULL::UUID, NULL::UUID, NULL::UUID;
    RETURN;
  END IF;
  
  -- Obtener año académico activo
  SELECT id INTO v_academic_year_id
  FROM academic_years
  WHERE is_active = TRUE
  LIMIT 1;
  
  IF v_academic_year_id IS NULL THEN
    RETURN QUERY SELECT false, 'No hay año académico activo'::TEXT, NULL::UUID, NULL::UUID, NULL::UUID;
    RETURN;
  END IF;
  
  -- 1. Crear o buscar apoderado
  SELECT id INTO v_guardian_id
  FROM guardians
  WHERE dni = v_application.guardian_document_number
  LIMIT 1;
  
  IF v_guardian_id IS NULL THEN
    -- Crear apoderado SIN usuario (se creará después desde el frontend/admin)
    -- La creación de usuarios de Supabase Auth debe hacerse desde el API, no desde SQL
    INSERT INTO guardians (
      user_id,
      first_name,
      last_name,
      dni,
      phone,
      email,
      address,
      relationship
    ) VALUES (
      NULL,  -- user_id se asignará cuando el admin cree el usuario manualmente
      v_application.guardian_first_name,
      v_application.guardian_last_name,
      v_application.guardian_document_number,
      v_application.guardian_phone,
      v_application.guardian_email,
      v_application.guardian_address,
      v_application.guardian_relationship
    )
    RETURNING id INTO v_guardian_id;
  END IF;
  
  -- 2. Generar código de estudiante
  v_student_code := 'EST' || LPAD(
    (SELECT COALESCE(MAX(CAST(SUBSTRING(student_code FROM 4) AS INTEGER)), 0) + 1
     FROM students
     WHERE student_code ~ '^EST[0-9]+$')::TEXT,
    6, '0'
  );
  
  -- NOTA: La creación del usuario de Supabase Auth debe hacerse desde el frontend
  -- porque no tenemos acceso directo a auth.users desde funciones SQL.
  -- El frontend deberá llamar a supabase.auth.admin.createUser() después de esta función.
  
  -- 3. Crear estudiante (sin user_id, se asignará después desde el frontend)
  INSERT INTO students (
    user_id,
    section_id,
    student_code,
    first_name,
    last_name,
    dni,
    birth_date,
    gender,
    address,
    photo_url,
    enrollment_date,
    status
  ) VALUES (
    NULL,  -- user_id se asignará cuando el admin cree el usuario manualmente o desde frontend
    p_section_id,
    v_student_code,
    v_application.student_first_name,
    v_application.student_last_name,
    v_application.student_document_number,  -- Se guarda en dni
    v_application.student_birth_date,
    v_application.student_gender,
    v_application.student_address,
    v_application.student_photo_url,
    now(),
    'active'
  )
  RETURNING id INTO v_student_id;
  
  -- 4. Crear relación estudiante-apoderado
  INSERT INTO student_guardians (
    student_id,
    guardian_id,
    is_primary
  ) VALUES (
    v_student_id,
    v_guardian_id,
    true  -- Primer apoderado es principal
  );
  
  -- 5. Actualizar solicitud
  UPDATE enrollment_applications
  SET
    status = 'approved',
    reviewed_at = now(),
    reviewed_by = p_approved_by
  WHERE id = p_application_id;
  
  -- 6. Verificar que el trigger haya inscrito al estudiante en cursos
  -- (El trigger auto_enroll_student_to_section_courses debería ejecutarse automáticamente)
  PERFORM pg_sleep(0.1); -- Pequeña pausa para asegurar que el trigger se complete
  
  -- 7. Crear notificación para el apoderado (solo si tiene usuario)
  -- Obtener user_id del guardian si existe
  SELECT g.user_id INTO v_user_id FROM guardians g WHERE g.id = v_guardian_id;
  
  IF v_user_id IS NOT NULL THEN
    INSERT INTO notifications (
      user_id,
      type,
      title,
      message,
      related_entity_type,
      related_entity_id,
      status
    ) VALUES (
      v_user_id,
      'matricula_aprobada',
      'Matrícula Aprobada',
      'La solicitud de matrícula para ' || v_application.student_first_name || ' ' || v_application.student_last_name || ' ha sido aprobada. Código: ' || v_student_code,
      'enrollment_application',
      p_application_id,
      'unread'
    );
  END IF;
  
  -- Retornar éxito con IDs
  RETURN QUERY SELECT true, 'Matrícula aprobada exitosamente. Estudiante inscrito en ' || 
    (SELECT COUNT(*)::TEXT FROM student_course_enrollments sce WHERE sce.student_id = v_student_id AND sce.status = 'active') || 
    ' cursos.'::TEXT, v_student_id, v_guardian_id, v_user_id;
END;
$_$;


ALTER FUNCTION public.approve_enrollment_application(p_application_id uuid, p_section_id uuid, p_approved_by uuid) OWNER TO postgres;

--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 427
-- Name: FUNCTION approve_enrollment_application(p_application_id uuid, p_section_id uuid, p_approved_by uuid); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.approve_enrollment_application(p_application_id uuid, p_section_id uuid, p_approved_by uuid) IS 'Aprueba una solicitud de matrícula, crea estudiante y apoderado, y usa student_guardians en lugar de guardian_id directo. El trigger auto_enroll_student_to_section_courses inscribe automáticamente al estudiante en los cursos de su sección.';


--
-- TOC entry 524 (class 1255 OID 22014)
-- Name: audit_and_notify_payment(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.audit_and_notify_payment() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  v_student_id uuid;
  v_guardian_user_id uuid;
BEGIN
  IF TG_OP = 'INSERT' THEN
    -- Auditar el pago
    PERFORM create_audit_log(
      NEW.received_by,
      'insert'::audit_action,
      'payment',
      NEW.id,
      NULL,
      to_jsonb(NEW),
      NEW.notes
    );
    
    -- Obtener student_id y notificar al apoderado
    v_student_id := NEW.student_id;
    
    -- Buscar apoderado principal
    SELECT g.user_id INTO v_guardian_user_id
    FROM student_guardians sg
    JOIN guardians g ON g.id = sg.guardian_id
    WHERE sg.student_id = v_student_id AND sg.is_primary = true
    LIMIT 1;
    
    IF v_guardian_user_id IS NOT NULL THEN
      PERFORM create_notification(
        v_guardian_user_id,
        'pago_registrado'::notification_type,
        'Pago registrado exitosamente',
        'Se ha registrado un pago de S/ ' || NEW.amount::text,
        'payment',
        NEW.id
      );
    END IF;
  END IF;
  
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.audit_and_notify_payment() OWNER TO postgres;

--
-- TOC entry 562 (class 1255 OID 22010)
-- Name: audit_evaluation_changes(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.audit_evaluation_changes() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  v_student_user_id UUID;
BEGIN
  IF TG_OP = 'UPDATE' THEN
    -- Solo auditar si cambió el grado o el estado
    IF OLD.grade IS DISTINCT FROM NEW.grade OR OLD.status IS DISTINCT FROM NEW.status THEN
      PERFORM create_audit_log(
        NEW.recorded_by,
        'update'::audit_action,
        'evaluation',
        NEW.id,
        to_jsonb(OLD),
        to_jsonb(NEW),
        NULL
      );
      
      -- Si se publicó, notificar al estudiante y apoderados
      IF OLD.status = 'borrador' AND NEW.status = 'publicada' THEN
        -- Obtener user_id del estudiante de forma segura
        SELECT user_id INTO v_student_user_id
        FROM students
        WHERE id = NEW.student_id;
        
        -- Solo crear notificación si el estudiante tiene user_id
        IF v_student_user_id IS NOT NULL THEN
          PERFORM create_notification(
            v_student_user_id,
            'evaluacion_publicada'::notification_type,
            'Nueva calificación publicada',
            'Se ha publicado una nueva calificación en ' || (SELECT name FROM courses WHERE id = NEW.course_id),
            'evaluation',
            NEW.id
          );
        END IF;
      END IF;
    END IF;
  END IF;
  
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.audit_evaluation_changes() OWNER TO postgres;

--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 562
-- Name: FUNCTION audit_evaluation_changes(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.audit_evaluation_changes() IS 'Auditoria cambios en evaluaciones y notifica cuando se publican. Solo crea notificaciones si el estudiante tiene user_id.';


--
-- TOC entry 465 (class 1255 OID 23248)
-- Name: auto_enroll_student_to_section_courses(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_enroll_student_to_section_courses() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_academic_year_id UUID;
  v_course RECORD;
BEGIN
  -- Solo procesar cuando se asigna o cambia de sección (y el estudiante está activo)
  IF (NEW.section_id IS NOT NULL AND NEW.status = 'active') AND 
     (OLD IS NULL OR OLD.section_id IS DISTINCT FROM NEW.section_id OR OLD.status IS DISTINCT FROM NEW.status) THEN
    
    -- Obtener año académico activo
    SELECT id INTO v_academic_year_id
    FROM academic_years
    WHERE is_active = TRUE
    LIMIT 1;
    
    IF v_academic_year_id IS NULL THEN
      RAISE EXCEPTION 'No hay año académico activo';
    END IF;
    
    -- Si cambió de sección, marcar cursos antiguos como dropped
    IF OLD IS NOT NULL AND OLD.section_id IS NOT NULL AND OLD.section_id != NEW.section_id THEN
      UPDATE student_course_enrollments
      SET status = 'dropped'
      WHERE student_id = NEW.id 
        AND section_id = OLD.section_id
        AND academic_year_id = v_academic_year_id
        AND status = 'active';
    END IF;
    
    -- Inscribir en todos los cursos asignados a la nueva sección
    FOR v_course IN
      SELECT DISTINCT course_id
      FROM teacher_course_assignments
      WHERE section_id = NEW.section_id
        AND academic_year_id = v_academic_year_id
        AND is_active = TRUE
    LOOP
      -- Insertar solo si no existe
      INSERT INTO student_course_enrollments (
        student_id,
        course_id,
        section_id,
        academic_year_id,
        status
      ) VALUES (
        NEW.id,
        v_course.course_id,
        NEW.section_id,
        v_academic_year_id,
        'active'
      )
      ON CONFLICT (student_id, course_id, academic_year_id) 
      DO UPDATE SET 
        status = 'active',
        section_id = NEW.section_id,
        enrollment_date = NOW();
    END LOOP;
  END IF;
  
  -- Si el estudiante se retira, marcar todos sus cursos como dropped
  IF NEW.status != 'active' AND (OLD IS NULL OR OLD.status != NEW.status) THEN
    UPDATE student_course_enrollments
    SET status = 'dropped'
    WHERE student_id = NEW.id AND status = 'active';
  END IF;
  
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.auto_enroll_student_to_section_courses() OWNER TO postgres;

--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 465
-- Name: FUNCTION auto_enroll_student_to_section_courses(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.auto_enroll_student_to_section_courses() IS 'Auto-inscribe al estudiante en todos los cursos de su sección cuando se matricula';


--
-- TOC entry 432 (class 1255 OID 34917)
-- Name: check_schedule_overlap(uuid, integer, time without time zone, time without time zone, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_schedule_overlap(p_section_id uuid, p_day_of_week integer, p_start_time time without time zone, p_end_time time without time zone, p_schedule_id uuid DEFAULT NULL::uuid) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    overlap_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO overlap_count
    FROM course_schedules
    WHERE section_id = p_section_id
    AND day_of_week = p_day_of_week
    AND (p_schedule_id IS NULL OR id != p_schedule_id)
    AND (
        (start_time <= p_start_time AND end_time > p_start_time) OR
        (start_time < p_end_time AND end_time >= p_end_time) OR
        (start_time >= p_start_time AND end_time <= p_end_time)
    );
    
    RETURN overlap_count > 0;
END;
$$;


ALTER FUNCTION public.check_schedule_overlap(p_section_id uuid, p_day_of_week integer, p_start_time time without time zone, p_end_time time without time zone, p_schedule_id uuid) OWNER TO postgres;

--
-- TOC entry 510 (class 1255 OID 22009)
-- Name: create_audit_log(uuid, public.audit_action, text, uuid, jsonb, jsonb, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_audit_log(p_user_id uuid, p_action public.audit_action, p_entity_type text, p_entity_id uuid, p_old_values jsonb DEFAULT NULL::jsonb, p_new_values jsonb DEFAULT NULL::jsonb, p_reason text DEFAULT NULL::text) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  v_log_id uuid;
BEGIN
  INSERT INTO audit_logs (
    user_id,
    action,
    entity_type,
    entity_id,
    old_values,
    new_values,
    reason
  ) VALUES (
    p_user_id,
    p_action,
    p_entity_type,
    p_entity_id,
    p_old_values,
    p_new_values,
    p_reason
  ) RETURNING id INTO v_log_id;
  
  RETURN v_log_id;
END;
$$;


ALTER FUNCTION public.create_audit_log(p_user_id uuid, p_action public.audit_action, p_entity_type text, p_entity_id uuid, p_old_values jsonb, p_new_values jsonb, p_reason text) OWNER TO postgres;

--
-- TOC entry 459 (class 1255 OID 22008)
-- Name: create_notification(uuid, public.notification_type, text, text, text, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_notification(p_user_id uuid, p_type public.notification_type, p_title text, p_message text, p_entity_type text DEFAULT NULL::text, p_entity_id uuid DEFAULT NULL::uuid) RETURNS uuid
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  v_notification_id uuid;
BEGIN
  INSERT INTO notifications (
    user_id,
    type,
    title,
    message,
    related_entity_type,
    related_entity_id
  ) VALUES (
    p_user_id,
    p_type,
    p_title,
    p_message,
    p_entity_type,
    p_entity_id
  ) RETURNING id INTO v_notification_id;
  
  RETURN v_notification_id;
END;
$$;


ALTER FUNCTION public.create_notification(p_user_id uuid, p_type public.notification_type, p_title text, p_message text, p_entity_type text, p_entity_id uuid) OWNER TO postgres;

--
-- TOC entry 473 (class 1255 OID 22210)
-- Name: create_user_with_profile(text, text, text, text, text, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_user_with_profile(p_email text, p_password text, p_role text, p_first_name text, p_last_name text, p_created_by uuid) RETURNS json
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  v_user_id UUID;
  v_result JSON;
BEGIN
  -- Nota: La creación real del usuario en auth.users debe hacerse
  -- desde el servidor con la API de Supabase Auth (no desde SQL)
  -- Esta función solo prepara la estructura

  -- Validar rol
  IF p_role NOT IN ('admin', 'director', 'coordinator', 'secretary', 'teacher', 'student', 'guardian', 'finance', 'cashier', 'web_editor') THEN
    RAISE EXCEPTION 'Rol inválido: %', p_role;
  END IF;

  -- Retornar estructura esperada
  v_result := json_build_object(
    'success', true,
    'message', 'Usar Supabase Admin API para crear usuario en auth.users',
    'email', p_email,
    'role', p_role,
    'first_name', p_first_name,
    'last_name', p_last_name
  );

  RETURN v_result;
END;
$$;


ALTER FUNCTION public.create_user_with_profile(p_email text, p_password text, p_role text, p_first_name text, p_last_name text, p_created_by uuid) OWNER TO postgres;

--
-- TOC entry 539 (class 1255 OID 22211)
-- Name: deactivate_user(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.deactivate_user(p_user_id uuid) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  -- Verificar que quien ejecuta es admin/director
  IF NOT EXISTS (
    SELECT 1 FROM profiles
    WHERE id = auth.uid()
    AND role IN ('admin', 'director')
  ) THEN
    RAISE EXCEPTION 'No autorizado para desactivar usuarios';
  END IF;

  -- Desactivar usuario
  UPDATE profiles
  SET is_active = false
  WHERE id = p_user_id;

  RETURN true;
END;
$$;


ALTER FUNCTION public.deactivate_user(p_user_id uuid) OWNER TO postgres;

--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 539
-- Name: FUNCTION deactivate_user(p_user_id uuid); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.deactivate_user(p_user_id uuid) IS 'Desactiva un usuario (solo admin/director)';


--
-- TOC entry 514 (class 1255 OID 40660)
-- Name: generate_news_slug(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_news_slug() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  base_slug text;
BEGIN
  IF NEW.slug IS NULL OR NEW.slug = '' THEN
    -- Intentar usar unaccent si está disponible, sino usar el título directamente
    BEGIN
      base_slug := unaccent(NEW.title);
    EXCEPTION WHEN undefined_function THEN
      base_slug := NEW.title;
    END;
    
    -- Limpiar el slug: minúsculas, solo alfanuméricos y guiones
    NEW.slug := lower(
      regexp_replace(
        regexp_replace(
          base_slug,
          '[^a-zA-Z0-9\s-]', '', 'g'
        ),
        '\s+', '-', 'g'
      )
    ) || '-' || substring(NEW.id::text, 1, 8);
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.generate_news_slug() OWNER TO postgres;

--
-- TOC entry 434 (class 1255 OID 23167)
-- Name: get_teacher_course_load(uuid, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_teacher_course_load(p_teacher_id uuid, p_academic_year_id uuid) RETURNS TABLE(course_name character varying, section_name character varying, grade_level_name character varying, total_assignments bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
  SELECT 
    c.name AS course_name,
    s.section_letter AS section_name,
    gl.name AS grade_level_name,
    COUNT(*) AS total_assignments
  FROM teacher_course_assignments tca
  INNER JOIN courses c ON tca.course_id = c.id
  INNER JOIN sections s ON tca.section_id = s.id
  INNER JOIN grade_levels gl ON s.grade_level_id = gl.id
  WHERE tca.teacher_id = p_teacher_id
    AND tca.academic_year_id = p_academic_year_id
    AND tca.is_active = TRUE
  GROUP BY c.name, s.name, gl.name
  ORDER BY gl.name, s.name, c.name;
END;
$$;


ALTER FUNCTION public.get_teacher_course_load(p_teacher_id uuid, p_academic_year_id uuid) OWNER TO postgres;

--
-- TOC entry 426 (class 1255 OID 22262)
-- Name: get_user_role(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_user_role(user_id uuid) RETURNS text
    LANGUAGE sql STABLE SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
  SELECT role FROM profiles WHERE id = user_id LIMIT 1;
$$;


ALTER FUNCTION public.get_user_role(user_id uuid) OWNER TO postgres;

--
-- TOC entry 522 (class 1255 OID 22012)
-- Name: notify_justification_status(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.notify_justification_status() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  v_guardian_user_id UUID;
BEGIN
  IF TG_OP = 'UPDATE' AND OLD.status IS DISTINCT FROM NEW.status THEN
    -- Auditar el cambio
    PERFORM create_audit_log(
      NEW.reviewed_by,
      CASE 
        WHEN NEW.status = 'aprobada' THEN 'approve'::audit_action
        WHEN NEW.status = 'rechazada' THEN 'reject'::audit_action
        ELSE 'update'::audit_action
      END,
      'attendance_justification',
      NEW.id,
      to_jsonb(OLD),
      to_jsonb(NEW),
      NEW.review_notes
    );
    
    -- Notificar al apoderado solo si tiene user_id
    IF NEW.status IN ('aprobada', 'rechazada') AND NEW.guardian_id IS NOT NULL THEN
      SELECT user_id INTO v_guardian_user_id
      FROM guardians
      WHERE id = NEW.guardian_id;
      
      IF v_guardian_user_id IS NOT NULL THEN
        PERFORM create_notification(
          v_guardian_user_id,
          CASE 
            WHEN NEW.status = 'aprobada' THEN 'justificacion_aprobada'::notification_type
            ELSE 'justificacion_rechazada'::notification_type
          END,
          'Justificación ' || NEW.status,
          'Su justificación de inasistencia ha sido ' || NEW.status,
          'justification',
          NEW.id
        );
      END IF;
    END IF;
  END IF;
  
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.notify_justification_status() OWNER TO postgres;

--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 522
-- Name: FUNCTION notify_justification_status(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.notify_justification_status() IS 'Auditoria cambios en justificaciones y notifica al apoderado. Solo crea notificaciones si el apoderado tiene user_id.';


--
-- TOC entry 451 (class 1255 OID 23250)
-- Name: sync_student_enrollments_on_teacher_assignment(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sync_student_enrollments_on_teacher_assignment() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_student RECORD;
BEGIN
  -- Solo procesar cuando se crea o activa una asignación
  IF NEW.is_active = TRUE AND (OLD IS NULL OR OLD.is_active = FALSE) THEN
    
    -- Inscribir a todos los estudiantes activos de esa sección en el curso
    FOR v_student IN
      SELECT id
      FROM students
      WHERE section_id = NEW.section_id
        AND status = 'active'
    LOOP
      INSERT INTO student_course_enrollments (
        student_id,
        course_id,
        section_id,
        academic_year_id,
        status
      ) VALUES (
        v_student.id,
        NEW.course_id,
        NEW.section_id,
        NEW.academic_year_id,
        'active'
      )
      ON CONFLICT (student_id, course_id, academic_year_id) 
      DO UPDATE SET 
        status = 'active',
        section_id = NEW.section_id,
        enrollment_date = NOW();
    END LOOP;
  END IF;
  
  -- Si se desactiva la asignación, marcar inscripciones como dropped
  IF NEW.is_active = FALSE AND (OLD IS NULL OR OLD.is_active = TRUE) THEN
    UPDATE student_course_enrollments
    SET status = 'dropped'
    WHERE course_id = NEW.course_id
      AND section_id = NEW.section_id
      AND academic_year_id = NEW.academic_year_id
      AND status = 'active';
  END IF;
  
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.sync_student_enrollments_on_teacher_assignment() OWNER TO postgres;

--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 451
-- Name: FUNCTION sync_student_enrollments_on_teacher_assignment(); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.sync_student_enrollments_on_teacher_assignment() IS 'Sincroniza inscripciones cuando se asigna un nuevo curso a una sección';


--
-- TOC entry 442 (class 1255 OID 34915)
-- Name: update_course_schedules_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_course_schedules_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_course_schedules_updated_at() OWNER TO postgres;

--
-- TOC entry 499 (class 1255 OID 23112)
-- Name: update_enrollment_applications_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_enrollment_applications_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_enrollment_applications_updated_at() OWNER TO postgres;

--
-- TOC entry 492 (class 1255 OID 22180)
-- Name: update_profiles_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_profiles_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_profiles_updated_at() OWNER TO postgres;

--
-- TOC entry 560 (class 1255 OID 40662)
-- Name: update_public_news_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_public_news_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_public_news_updated_at() OWNER TO postgres;

--
-- TOC entry 481 (class 1255 OID 23246)
-- Name: update_student_course_enrollments_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_student_course_enrollments_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_student_course_enrollments_updated_at() OWNER TO postgres;

--
-- TOC entry 501 (class 1255 OID 23064)
-- Name: update_task_submissions_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_task_submissions_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_task_submissions_updated_at() OWNER TO postgres;

--
-- TOC entry 569 (class 1255 OID 23163)
-- Name: update_teacher_assignments_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_teacher_assignments_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_teacher_assignments_updated_at() OWNER TO postgres;

--
-- TOC entry 454 (class 1255 OID 23165)
-- Name: validate_teacher_course_limit(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_teacher_course_limit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  current_course_count INTEGER;
  max_courses_per_teacher INTEGER := 6;
BEGIN
  SELECT COUNT(DISTINCT course_id)
  INTO current_course_count
  FROM teacher_course_assignments
  WHERE teacher_id = NEW.teacher_id
    AND academic_year_id = NEW.academic_year_id
    AND is_active = TRUE
    AND id != COALESCE(NEW.id, '00000000-0000-0000-0000-000000000000'::UUID);

  IF current_course_count >= max_courses_per_teacher THEN
    RAISE EXCEPTION 'El docente ya tiene % cursos asignados. Máximo permitido: %', 
      current_course_count, max_courses_per_teacher;
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.validate_teacher_course_limit() OWNER TO postgres;

--
-- TOC entry 513 (class 1255 OID 17389)
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 433 (class 1255 OID 17470)
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- TOC entry 470 (class 1255 OID 17402)
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- TOC entry 436 (class 1255 OID 17351)
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- TOC entry 533 (class 1255 OID 17342)
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- TOC entry 571 (class 1255 OID 17397)
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- TOC entry 457 (class 1255 OID 17410)
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 491 (class 1255 OID 17341)
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- TOC entry 516 (class 1255 OID 17469)
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- TOC entry 573 (class 1255 OID 17339)
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- TOC entry 500 (class 1255 OID 17378)
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- TOC entry 431 (class 1255 OID 17463)
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- TOC entry 508 (class 1255 OID 17214)
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 530 (class 1255 OID 17140)
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- TOC entry 484 (class 1255 OID 17255)
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- TOC entry 447 (class 1255 OID 17215)
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 486 (class 1255 OID 17218)
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 471 (class 1255 OID 17233)
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- TOC entry 549 (class 1255 OID 17114)
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 494 (class 1255 OID 17113)
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 455 (class 1255 OID 17112)
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 497 (class 1255 OID 17196)
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 528 (class 1255 OID 17212)
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 537 (class 1255 OID 17213)
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 487 (class 1255 OID 17231)
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- TOC entry 550 (class 1255 OID 17179)
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 566 (class 1255 OID 17142)
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 490 (class 1255 OID 17254)
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- TOC entry 511 (class 1255 OID 17256)
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- TOC entry 496 (class 1255 OID 17217)
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 547 (class 1255 OID 17257)
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- TOC entry 515 (class 1255 OID 17262)
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 572 (class 1255 OID 17232)
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 519 (class 1255 OID 17195)
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- TOC entry 498 (class 1255 OID 17258)
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- TOC entry 469 (class 1255 OID 17216)
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 518 (class 1255 OID 17129)
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 531 (class 1255 OID 17229)
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 517 (class 1255 OID 17228)
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 478 (class 1255 OID 17253)
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- TOC entry 526 (class 1255 OID 17130)
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 345 (class 1259 OID 16525)
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 345
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- TOC entry 362 (class 1259 OID 16929)
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text,
    code_challenge_method auth.code_challenge_method,
    code_challenge text,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone,
    invite_token text,
    referrer text,
    oauth_client_state_id uuid,
    linking_target_id uuid,
    email_optional boolean DEFAULT false NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 362
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'Stores metadata for all OAuth/SSO login flows';


--
-- TOC entry 353 (class 1259 OID 16727)
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 353
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 353
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- TOC entry 344 (class 1259 OID 16518)
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 344
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- TOC entry 357 (class 1259 OID 16816)
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 357
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- TOC entry 356 (class 1259 OID 16804)
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 356
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- TOC entry 355 (class 1259 OID 16791)
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 355
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 355
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- TOC entry 365 (class 1259 OID 17041)
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    nonce text,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_nonce_length CHECK ((char_length(nonce) <= 255)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- TOC entry 419 (class 1259 OID 30401)
-- Name: oauth_client_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_client_states (
    id uuid NOT NULL,
    provider_type text NOT NULL,
    code_verifier text,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE auth.oauth_client_states OWNER TO supabase_auth_admin;

--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 419
-- Name: TABLE oauth_client_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.oauth_client_states IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';


--
-- TOC entry 364 (class 1259 OID 17011)
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    token_endpoint_auth_method text NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048)),
    CONSTRAINT oauth_clients_token_endpoint_auth_method_check CHECK ((token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text])))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- TOC entry 366 (class 1259 OID 17074)
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- TOC entry 363 (class 1259 OID 16979)
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 343 (class 1259 OID 16507)
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 343
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- TOC entry 342 (class 1259 OID 16506)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 342
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- TOC entry 360 (class 1259 OID 16858)
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 5231 (class 0 OID 0)
-- Dependencies: 360
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- TOC entry 361 (class 1259 OID 16876)
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 361
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- TOC entry 346 (class 1259 OID 16533)
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 346
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- TOC entry 354 (class 1259 OID 16757)
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint,
    scopes text,
    CONSTRAINT sessions_scopes_length CHECK ((char_length(scopes) <= 4096))
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 354
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 354
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 354
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 354
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- TOC entry 359 (class 1259 OID 16843)
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 359
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- TOC entry 358 (class 1259 OID 16834)
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 358
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 358
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- TOC entry 341 (class 1259 OID 16495)
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- TOC entry 5247 (class 0 OID 0)
-- Dependencies: 341
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- TOC entry 5248 (class 0 OID 0)
-- Dependencies: 341
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- TOC entry 381 (class 1259 OID 17541)
-- Name: academic_years; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academic_years (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    year integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.academic_years OWNER TO postgres;

--
-- TOC entry 396 (class 1259 OID 17947)
-- Name: announcements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.announcements (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    audience public.announcement_audience DEFAULT 'todos'::public.announcement_audience NOT NULL,
    section_id uuid,
    status public.announcement_status DEFAULT 'borrador'::public.announcement_status,
    priority text DEFAULT 'normal'::text,
    attachment_url text,
    created_by uuid,
    approved_by uuid,
    published_at timestamp with time zone,
    expires_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.announcements OWNER TO postgres;

--
-- TOC entry 395 (class 1259 OID 17897)
-- Name: assignment_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignment_submissions (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    assignment_id uuid NOT NULL,
    student_id uuid NOT NULL,
    submission_text text,
    attachment_url text,
    score integer,
    feedback text,
    status public.submission_status DEFAULT 'pendiente'::public.submission_status,
    submitted_at timestamp with time zone,
    reviewed_at timestamp with time zone,
    reviewed_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.assignment_submissions OWNER TO postgres;

--
-- TOC entry 394 (class 1259 OID 17861)
-- Name: assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignments (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    course_id uuid NOT NULL,
    section_id uuid NOT NULL,
    title text NOT NULL,
    description text,
    instructions text,
    due_date timestamp with time zone NOT NULL,
    max_score integer DEFAULT 20,
    attachment_url text,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.assignments OWNER TO postgres;

--
-- TOC entry 392 (class 1259 OID 17771)
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    student_id uuid NOT NULL,
    section_id uuid NOT NULL,
    course_id uuid,
    date date DEFAULT CURRENT_DATE NOT NULL,
    status public.attendance_status DEFAULT 'presente'::public.attendance_status NOT NULL,
    justification text,
    recorded_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- TOC entry 401 (class 1259 OID 21617)
-- Name: attendance_justifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance_justifications (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    attendance_id uuid NOT NULL,
    student_id uuid NOT NULL,
    guardian_id uuid,
    reason text NOT NULL,
    attachment_url text,
    status public.justification_status DEFAULT 'pendiente'::public.justification_status,
    reviewed_by uuid,
    reviewed_at timestamp with time zone,
    review_notes text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.attendance_justifications OWNER TO postgres;

--
-- TOC entry 403 (class 1259 OID 21987)
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_logs (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid,
    action public.audit_action NOT NULL,
    entity_type text NOT NULL,
    entity_id uuid NOT NULL,
    old_values jsonb,
    new_values jsonb,
    reason text,
    ip_address text,
    user_agent text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.audit_logs OWNER TO postgres;

--
-- TOC entry 400 (class 1259 OID 18089)
-- Name: cash_closures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cash_closures (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    closure_date date DEFAULT CURRENT_DATE NOT NULL,
    opening_balance numeric(10,2) DEFAULT 0,
    cash_received numeric(10,2) NOT NULL,
    expected_balance numeric(10,2) NOT NULL,
    actual_balance numeric(10,2) NOT NULL,
    difference numeric(10,2) NOT NULL,
    notes text,
    closed_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    cashier_id uuid,
    opening_time timestamp with time zone,
    closing_time timestamp with time zone,
    total_cash numeric(10,2) DEFAULT 0,
    total_cards numeric(10,2) DEFAULT 0,
    total_transfers numeric(10,2) DEFAULT 0,
    total_yape numeric(10,2) DEFAULT 0,
    total_plin numeric(10,2) DEFAULT 0,
    total_amount numeric(10,2) DEFAULT 0,
    payments_count integer DEFAULT 0
);


ALTER TABLE public.cash_closures OWNER TO postgres;

--
-- TOC entry 397 (class 1259 OID 17997)
-- Name: charges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.charges (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    student_id uuid NOT NULL,
    academic_year_id uuid NOT NULL,
    type public.charge_type NOT NULL,
    description text NOT NULL,
    amount numeric(10,2) NOT NULL,
    discount numeric(10,2) DEFAULT 0,
    final_amount numeric(10,2) NOT NULL,
    due_date date NOT NULL,
    status public.charge_status DEFAULT 'pendiente'::public.charge_status,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    concept_id uuid,
    period_month integer,
    period_year integer,
    CONSTRAINT charges_period_month_check CHECK (((period_month >= 1) AND (period_month <= 12)))
);


ALTER TABLE public.charges OWNER TO postgres;

--
-- TOC entry 386 (class 1259 OID 17625)
-- Name: competencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competencies (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    course_id uuid NOT NULL,
    code text NOT NULL,
    description text NOT NULL,
    order_index integer DEFAULT 0,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.competencies OWNER TO postgres;

--
-- TOC entry 391 (class 1259 OID 17731)
-- Name: course_assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_assignments (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    teacher_id uuid NOT NULL,
    course_id uuid NOT NULL,
    section_id uuid NOT NULL,
    academic_year_id uuid NOT NULL,
    is_tutor boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.course_assignments OWNER TO postgres;

--
-- TOC entry 424 (class 1259 OID 34872)
-- Name: course_schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_schedules (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    academic_year_id uuid NOT NULL,
    section_id uuid NOT NULL,
    course_id uuid NOT NULL,
    teacher_id uuid,
    day_of_week integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    room_number character varying(50),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT course_schedules_day_of_week_check CHECK (((day_of_week >= 1) AND (day_of_week <= 7))),
    CONSTRAINT valid_time_range CHECK ((end_time > start_time))
);


ALTER TABLE public.course_schedules OWNER TO postgres;

--
-- TOC entry 5263 (class 0 OID 0)
-- Dependencies: 424
-- Name: TABLE course_schedules; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.course_schedules IS 'Horarios de clases por sección, curso y docente';


--
-- TOC entry 5264 (class 0 OID 0)
-- Dependencies: 424
-- Name: COLUMN course_schedules.day_of_week; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.course_schedules.day_of_week IS '1=Lunes, 2=Martes, 3=Miércoles, 4=Jueves, 5=Viernes, 6=Sábado, 7=Domingo';


--
-- TOC entry 5265 (class 0 OID 0)
-- Dependencies: 424
-- Name: COLUMN course_schedules.room_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.course_schedules.room_number IS 'Número o nombre del aula/salón';


--
-- TOC entry 385 (class 1259 OID 17608)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    description text,
    grade_level_id uuid NOT NULL,
    hours_per_week integer DEFAULT 2,
    created_at timestamp with time zone DEFAULT now(),
    color character varying(7) DEFAULT '#1D4ED8'::character varying
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 5267 (class 0 OID 0)
-- Dependencies: 385
-- Name: COLUMN courses.color; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.courses.color IS 'Color hexadecimal para identificación visual del curso (#RRGGBB)';


--
-- TOC entry 413 (class 1259 OID 26146)
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    type public.discount_type NOT NULL,
    value numeric(10,2) NOT NULL,
    scope public.discount_scope DEFAULT 'todos'::public.discount_scope,
    specific_concept_id uuid,
    description text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT discounts_value_check CHECK ((value >= (0)::numeric))
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- TOC entry 405 (class 1259 OID 23073)
-- Name: enrollment_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment_applications (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    student_first_name text NOT NULL,
    student_last_name text NOT NULL,
    student_document_type text NOT NULL,
    student_document_number text NOT NULL,
    student_birth_date date NOT NULL,
    student_gender text NOT NULL,
    student_address text,
    student_photo_url text,
    guardian_first_name text NOT NULL,
    guardian_last_name text NOT NULL,
    guardian_document_type text NOT NULL,
    guardian_document_number text NOT NULL,
    guardian_phone text NOT NULL,
    guardian_email text NOT NULL,
    guardian_address text,
    guardian_relationship text NOT NULL,
    grade_level_id uuid NOT NULL,
    previous_school text,
    has_special_needs boolean DEFAULT false,
    special_needs_description text,
    emergency_contact_name text,
    emergency_contact_phone text,
    notes text,
    status text DEFAULT 'pending'::text,
    application_date timestamp with time zone DEFAULT now(),
    reviewed_at timestamp with time zone,
    reviewed_by uuid,
    rejection_reason text,
    admin_notes text,
    academic_year_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT enrollment_applications_guardian_document_type_check CHECK ((guardian_document_type = ANY (ARRAY['DNI'::text, 'CE'::text, 'Pasaporte'::text]))),
    CONSTRAINT enrollment_applications_guardian_relationship_check CHECK ((guardian_relationship = ANY (ARRAY['Padre'::text, 'Madre'::text, 'Tutor'::text, 'Otro'::text]))),
    CONSTRAINT enrollment_applications_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'approved'::text, 'rejected'::text, 'cancelled'::text]))),
    CONSTRAINT enrollment_applications_student_document_type_check CHECK ((student_document_type = ANY (ARRAY['DNI'::text, 'CE'::text, 'Pasaporte'::text]))),
    CONSTRAINT enrollment_applications_student_gender_check CHECK ((student_gender = ANY (ARRAY['M'::text, 'F'::text])))
);


ALTER TABLE public.enrollment_applications OWNER TO postgres;

--
-- TOC entry 393 (class 1259 OID 17823)
-- Name: evaluations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluations (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    student_id uuid NOT NULL,
    course_id uuid NOT NULL,
    competency_id uuid NOT NULL,
    period_id uuid NOT NULL,
    grade public.evaluation_grade,
    observations text,
    status public.evaluation_status DEFAULT 'borrador'::public.evaluation_status,
    recorded_by uuid,
    published_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.evaluations OWNER TO postgres;

--
-- TOC entry 410 (class 1259 OID 26093)
-- Name: fee_concepts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fee_concepts (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    type public.concept_type NOT NULL,
    base_amount numeric(10,2) NOT NULL,
    periodicity public.concept_periodicity DEFAULT 'unico'::public.concept_periodicity,
    description text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT fee_concepts_base_amount_check CHECK ((base_amount >= (0)::numeric))
);


ALTER TABLE public.fee_concepts OWNER TO postgres;

--
-- TOC entry 411 (class 1259 OID 26106)
-- Name: financial_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.financial_plans (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    academic_year_id uuid NOT NULL,
    concept_id uuid NOT NULL,
    number_of_installments integer NOT NULL,
    description text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT financial_plans_number_of_installments_check CHECK ((number_of_installments > 0))
);


ALTER TABLE public.financial_plans OWNER TO postgres;

--
-- TOC entry 383 (class 1259 OID 17575)
-- Name: grade_levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade_levels (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    level public.education_level NOT NULL,
    grade integer NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.grade_levels OWNER TO postgres;

--
-- TOC entry 388 (class 1259 OID 17668)
-- Name: guardians; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guardians (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid,
    first_name text NOT NULL,
    last_name text NOT NULL,
    dni text,
    phone text,
    email text,
    address text,
    relationship text,
    is_primary boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.guardians OWNER TO postgres;

--
-- TOC entry 416 (class 1259 OID 26834)
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    student_id uuid NOT NULL,
    sender_role text NOT NULL,
    sender_id uuid NOT NULL,
    content text NOT NULL,
    is_read boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT messages_sender_role_check CHECK ((sender_role = ANY (ARRAY['teacher'::text, 'guardian'::text])))
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- TOC entry 402 (class 1259 OID 21951)
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    type public.notification_type NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    status public.notification_status DEFAULT 'no_leida'::public.notification_status,
    related_entity_type text,
    related_entity_id uuid,
    created_at timestamp with time zone DEFAULT now(),
    read_at timestamp with time zone
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- TOC entry 398 (class 1259 OID 18037)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    charge_id uuid NOT NULL,
    student_id uuid NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_method public.payment_method NOT NULL,
    transaction_ref text,
    notes text,
    received_by uuid,
    payment_date timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 382 (class 1259 OID 17551)
-- Name: periods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periods (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    academic_year_id uuid NOT NULL,
    name text NOT NULL,
    period_number integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    is_closed boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.periods OWNER TO postgres;

--
-- TOC entry 412 (class 1259 OID 26128)
-- Name: plan_installments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan_installments (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    plan_id uuid NOT NULL,
    installment_number integer NOT NULL,
    due_date date NOT NULL,
    amount numeric(10,2) NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now(),
    CONSTRAINT plan_installments_amount_check CHECK ((amount >= (0)::numeric)),
    CONSTRAINT plan_installments_installment_number_check CHECK ((installment_number > 0))
);


ALTER TABLE public.plan_installments OWNER TO postgres;

--
-- TOC entry 380 (class 1259 OID 17523)
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    role public.user_role DEFAULT 'student'::public.user_role NOT NULL,
    full_name text NOT NULL,
    dni text,
    phone text,
    email text,
    avatar_url text,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    created_by uuid
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- TOC entry 5281 (class 0 OID 0)
-- Dependencies: 380
-- Name: COLUMN profiles.is_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.profiles.is_active IS 'Usuario activo en el sistema (soft delete)';


--
-- TOC entry 5282 (class 0 OID 0)
-- Dependencies: 380
-- Name: COLUMN profiles.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.profiles.updated_at IS 'Última actualización del perfil';


--
-- TOC entry 5283 (class 0 OID 0)
-- Dependencies: 380
-- Name: COLUMN profiles.created_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.profiles.created_by IS 'Usuario administrador que creó este perfil';


--
-- TOC entry 425 (class 1259 OID 40625)
-- Name: public_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.public_news (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    slug text,
    excerpt text NOT NULL,
    content text,
    image_url text,
    category public.public_news_category DEFAULT 'institucional'::public.public_news_category NOT NULL,
    author text DEFAULT 'Dirección General'::text,
    status public.public_news_status DEFAULT 'borrador'::public.public_news_status NOT NULL,
    is_featured boolean DEFAULT false,
    published_at timestamp with time zone,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.public_news OWNER TO postgres;

--
-- TOC entry 399 (class 1259 OID 18062)
-- Name: receipts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipts (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    receipt_number text NOT NULL,
    payment_id uuid NOT NULL,
    student_id uuid NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    pdf_url text,
    issued_by uuid,
    issued_at timestamp with time zone DEFAULT now(),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.receipts OWNER TO postgres;

--
-- TOC entry 384 (class 1259 OID 17586)
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sections (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    academic_year_id uuid NOT NULL,
    grade_level_id uuid NOT NULL,
    section_letter text NOT NULL,
    capacity integer DEFAULT 30,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.sections OWNER TO postgres;

--
-- TOC entry 409 (class 1259 OID 23206)
-- Name: student_course_enrollments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_course_enrollments (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    student_id uuid NOT NULL,
    course_id uuid NOT NULL,
    section_id uuid NOT NULL,
    academic_year_id uuid NOT NULL,
    enrollment_date timestamp with time zone DEFAULT now(),
    status text DEFAULT 'active'::text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT student_course_enrollments_status_check CHECK ((status = ANY (ARRAY['active'::text, 'dropped'::text, 'completed'::text])))
);


ALTER TABLE public.student_course_enrollments OWNER TO postgres;

--
-- TOC entry 5288 (class 0 OID 0)
-- Dependencies: 409
-- Name: TABLE student_course_enrollments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.student_course_enrollments IS 'Inscripciones de estudiantes a cursos específicos';


--
-- TOC entry 5289 (class 0 OID 0)
-- Dependencies: 409
-- Name: COLUMN student_course_enrollments.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.student_course_enrollments.status IS 'active: inscrito actualmente, dropped: dado de baja, completed: curso completado';


--
-- TOC entry 414 (class 1259 OID 26164)
-- Name: student_discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_discounts (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    student_id uuid NOT NULL,
    discount_id uuid NOT NULL,
    academic_year_id uuid NOT NULL,
    notes text,
    assigned_by uuid,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.student_discounts OWNER TO postgres;

--
-- TOC entry 389 (class 1259 OID 17688)
-- Name: student_guardians; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_guardians (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    student_id uuid NOT NULL,
    guardian_id uuid NOT NULL,
    is_primary boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.student_guardians OWNER TO postgres;

--
-- TOC entry 387 (class 1259 OID 17642)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid,
    student_code text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    dni text,
    birth_date date,
    gender text,
    address text,
    section_id uuid,
    enrollment_date date DEFAULT CURRENT_DATE,
    status text DEFAULT 'active'::text,
    photo_url text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 404 (class 1259 OID 23029)
-- Name: task_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_submissions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    assignment_id uuid NOT NULL,
    student_id uuid NOT NULL,
    submission_date timestamp with time zone DEFAULT now(),
    content text,
    attachment_url text,
    attachment_name text,
    attachment_size integer,
    status text DEFAULT 'submitted'::text,
    grade numeric(5,2),
    grade_letter text,
    feedback text,
    graded_by uuid,
    graded_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    CONSTRAINT task_submissions_grade_letter_check CHECK ((grade_letter = ANY (ARRAY['AD'::text, 'A'::text, 'B'::text, 'C'::text, NULL::text]))),
    CONSTRAINT task_submissions_status_check CHECK ((status = ANY (ARRAY['draft'::text, 'submitted'::text, 'graded'::text, 'returned'::text])))
);


ALTER TABLE public.task_submissions OWNER TO postgres;

--
-- TOC entry 406 (class 1259 OID 23119)
-- Name: teacher_course_assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_course_assignments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    teacher_id uuid NOT NULL,
    section_id uuid NOT NULL,
    course_id uuid NOT NULL,
    academic_year_id uuid NOT NULL,
    assigned_by uuid,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_active boolean DEFAULT true,
    notes text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.teacher_course_assignments OWNER TO postgres;

--
-- TOC entry 390 (class 1259 OID 17708)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    user_id uuid,
    teacher_code text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    dni text,
    phone text,
    email text,
    specialization text,
    hire_date date DEFAULT CURRENT_DATE,
    status text DEFAULT 'active'::text,
    photo_url text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 408 (class 1259 OID 23173)
-- Name: teacher_assignment_stats; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.teacher_assignment_stats AS
 SELECT t.id AS teacher_id,
    ((t.first_name || ' '::text) || t.last_name) AS teacher_name,
    count(DISTINCT tca.course_id) AS total_courses,
    count(DISTINCT tca.section_id) AS total_sections,
    sum(( SELECT count(*) AS count
           FROM public.students st
          WHERE ((st.section_id = tca.section_id) AND (st.status = 'active'::text)))) AS total_students,
    string_agg(DISTINCT c.name, ', '::text ORDER BY c.name) AS courses_list
   FROM ((public.teachers t
     LEFT JOIN public.teacher_course_assignments tca ON (((t.id = tca.teacher_id) AND (tca.is_active = true))))
     LEFT JOIN public.courses c ON ((tca.course_id = c.id)))
  WHERE (t.status = 'active'::text)
  GROUP BY t.id, t.first_name, t.last_name
  ORDER BY t.last_name, t.first_name;


ALTER VIEW public.teacher_assignment_stats OWNER TO postgres;

--
-- TOC entry 407 (class 1259 OID 23168)
-- Name: teacher_assignments_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.teacher_assignments_view AS
 SELECT tca.id,
    tca.teacher_id,
    ((t.first_name || ' '::text) || t.last_name) AS teacher_name,
    p.email AS teacher_email,
    tca.section_id,
    sec.section_letter AS section_name,
    gl.id AS grade_level_id,
    gl.name AS grade_level_name,
    gl.level,
    tca.course_id,
    c.name AS course_name,
    c.code AS course_code,
    tca.academic_year_id,
    ay.year AS academic_year,
    ay.is_active AS is_current_year,
    tca.is_active,
    tca.assigned_at,
    tca.notes,
    ( SELECT count(*) AS count
           FROM public.students st
          WHERE ((st.section_id = tca.section_id) AND (st.status = 'active'::text))) AS student_count
   FROM ((((((public.teacher_course_assignments tca
     JOIN public.teachers t ON ((tca.teacher_id = t.id)))
     JOIN public.profiles p ON ((t.user_id = p.id)))
     JOIN public.sections sec ON ((tca.section_id = sec.id)))
     JOIN public.grade_levels gl ON ((sec.grade_level_id = gl.id)))
     JOIN public.courses c ON ((tca.course_id = c.id)))
     JOIN public.academic_years ay ON ((tca.academic_year_id = ay.id)))
  WHERE (tca.is_active = true);


ALTER VIEW public.teacher_assignments_view OWNER TO postgres;

--
-- TOC entry 379 (class 1259 OID 17473)
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- TOC entry 415 (class 1259 OID 26620)
-- Name: messages_2025_12_13; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_13 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_13 OWNER TO supabase_admin;

--
-- TOC entry 417 (class 1259 OID 28169)
-- Name: messages_2025_12_14; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_14 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_14 OWNER TO supabase_admin;

--
-- TOC entry 418 (class 1259 OID 30387)
-- Name: messages_2025_12_15; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_15 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_15 OWNER TO supabase_admin;

--
-- TOC entry 420 (class 1259 OID 33720)
-- Name: messages_2025_12_16; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_16 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_16 OWNER TO supabase_admin;

--
-- TOC entry 421 (class 1259 OID 33732)
-- Name: messages_2025_12_17; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_17 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_17 OWNER TO supabase_admin;

--
-- TOC entry 422 (class 1259 OID 33744)
-- Name: messages_2025_12_18; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_18 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_18 OWNER TO supabase_admin;

--
-- TOC entry 423 (class 1259 OID 33756)
-- Name: messages_2025_12_19; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_12_19 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_12_19 OWNER TO supabase_admin;

--
-- TOC entry 373 (class 1259 OID 17304)
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- TOC entry 376 (class 1259 OID 17327)
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- TOC entry 375 (class 1259 OID 17326)
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 347 (class 1259 OID 16546)
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 347
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 370 (class 1259 OID 17242)
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- TOC entry 371 (class 1259 OID 17269)
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- TOC entry 349 (class 1259 OID 16588)
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- TOC entry 348 (class 1259 OID 16561)
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 348
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 369 (class 1259 OID 17197)
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- TOC entry 367 (class 1259 OID 17144)
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- TOC entry 368 (class 1259 OID 17158)
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- TOC entry 372 (class 1259 OID 17279)
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- TOC entry 3937 (class 0 OID 0)
-- Name: messages_2025_12_13; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_13 FOR VALUES FROM ('2025-12-13 00:00:00') TO ('2025-12-14 00:00:00');


--
-- TOC entry 3938 (class 0 OID 0)
-- Name: messages_2025_12_14; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_14 FOR VALUES FROM ('2025-12-14 00:00:00') TO ('2025-12-15 00:00:00');


--
-- TOC entry 3939 (class 0 OID 0)
-- Name: messages_2025_12_15; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_15 FOR VALUES FROM ('2025-12-15 00:00:00') TO ('2025-12-16 00:00:00');


--
-- TOC entry 3940 (class 0 OID 0)
-- Name: messages_2025_12_16; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_16 FOR VALUES FROM ('2025-12-16 00:00:00') TO ('2025-12-17 00:00:00');


--
-- TOC entry 3941 (class 0 OID 0)
-- Name: messages_2025_12_17; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_17 FOR VALUES FROM ('2025-12-17 00:00:00') TO ('2025-12-18 00:00:00');


--
-- TOC entry 3942 (class 0 OID 0)
-- Name: messages_2025_12_18; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_18 FOR VALUES FROM ('2025-12-18 00:00:00') TO ('2025-12-19 00:00:00');


--
-- TOC entry 3943 (class 0 OID 0)
-- Name: messages_2025_12_19; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_12_19 FOR VALUES FROM ('2025-12-19 00:00:00') TO ('2025-12-20 00:00:00');


--
-- TOC entry 3953 (class 2604 OID 16510)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 4298 (class 2606 OID 16829)
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- TOC entry 4252 (class 2606 OID 16531)
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 4321 (class 2606 OID 16935)
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- TOC entry 4276 (class 2606 OID 16953)
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- TOC entry 4278 (class 2606 OID 16963)
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- TOC entry 4250 (class 2606 OID 16524)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 4300 (class 2606 OID 16822)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- TOC entry 4296 (class 2606 OID 16810)
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 4288 (class 2606 OID 17003)
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- TOC entry 4290 (class 2606 OID 16797)
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- TOC entry 4334 (class 2606 OID 17062)
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- TOC entry 4336 (class 2606 OID 17060)
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- TOC entry 4338 (class 2606 OID 17058)
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- TOC entry 4564 (class 2606 OID 30407)
-- Name: oauth_client_states oauth_client_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_client_states
    ADD CONSTRAINT oauth_client_states_pkey PRIMARY KEY (id);


--
-- TOC entry 4331 (class 2606 OID 17022)
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 4342 (class 2606 OID 17084)
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- TOC entry 4344 (class 2606 OID 17086)
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- TOC entry 4325 (class 2606 OID 16988)
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4244 (class 2606 OID 16514)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4247 (class 2606 OID 16740)
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4310 (class 2606 OID 16869)
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- TOC entry 4312 (class 2606 OID 16867)
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 4317 (class 2606 OID 16883)
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- TOC entry 4255 (class 2606 OID 16537)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 4283 (class 2606 OID 16761)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4307 (class 2606 OID 16850)
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- TOC entry 4302 (class 2606 OID 16841)
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 4237 (class 2606 OID 16923)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 4239 (class 2606 OID 16501)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4380 (class 2606 OID 17548)
-- Name: academic_years academic_years_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_years
    ADD CONSTRAINT academic_years_pkey PRIMARY KEY (id);


--
-- TOC entry 4382 (class 2606 OID 17550)
-- Name: academic_years academic_years_year_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academic_years
    ADD CONSTRAINT academic_years_year_key UNIQUE (year);


--
-- TOC entry 4455 (class 2606 OID 17959)
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- TOC entry 4451 (class 2606 OID 17909)
-- Name: assignment_submissions assignment_submissions_assignment_id_student_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignment_submissions
    ADD CONSTRAINT assignment_submissions_assignment_id_student_id_key UNIQUE (assignment_id, student_id);


--
-- TOC entry 4453 (class 2606 OID 17907)
-- Name: assignment_submissions assignment_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignment_submissions
    ADD CONSTRAINT assignment_submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4447 (class 2606 OID 17871)
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 4480 (class 2606 OID 21629)
-- Name: attendance_justifications attendance_justifications_attendance_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_justifications
    ADD CONSTRAINT attendance_justifications_attendance_id_key UNIQUE (attendance_id);


--
-- TOC entry 4482 (class 2606 OID 21627)
-- Name: attendance_justifications attendance_justifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_justifications
    ADD CONSTRAINT attendance_justifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4434 (class 2606 OID 17782)
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);


--
-- TOC entry 4436 (class 2606 OID 17784)
-- Name: attendance attendance_student_id_course_id_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_student_id_course_id_date_key UNIQUE (student_id, course_id, date);


--
-- TOC entry 4492 (class 2606 OID 21995)
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 4473 (class 2606 OID 18101)
-- Name: cash_closures cash_closures_closure_date_closed_by_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cash_closures
    ADD CONSTRAINT cash_closures_closure_date_closed_by_key UNIQUE (closure_date, closed_by);


--
-- TOC entry 4475 (class 2606 OID 18099)
-- Name: cash_closures cash_closures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cash_closures
    ADD CONSTRAINT cash_closures_pkey PRIMARY KEY (id);


--
-- TOC entry 4457 (class 2606 OID 18008)
-- Name: charges charges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charges
    ADD CONSTRAINT charges_pkey PRIMARY KEY (id);


--
-- TOC entry 4400 (class 2606 OID 17636)
-- Name: competencies competencies_course_id_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencies
    ADD CONSTRAINT competencies_course_id_code_key UNIQUE (course_id, code);


--
-- TOC entry 4402 (class 2606 OID 17634)
-- Name: competencies competencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencies
    ADD CONSTRAINT competencies_pkey PRIMARY KEY (id);


--
-- TOC entry 4430 (class 2606 OID 17740)
-- Name: course_assignments course_assignments_course_id_section_id_academic_year_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_assignments
    ADD CONSTRAINT course_assignments_course_id_section_id_academic_year_id_key UNIQUE (course_id, section_id, academic_year_id);


--
-- TOC entry 4432 (class 2606 OID 17738)
-- Name: course_assignments course_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_assignments
    ADD CONSTRAINT course_assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 4578 (class 2606 OID 34881)
-- Name: course_schedules course_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_schedules
    ADD CONSTRAINT course_schedules_pkey PRIMARY KEY (id);


--
-- TOC entry 4396 (class 2606 OID 17619)
-- Name: courses courses_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_code_key UNIQUE (code);


--
-- TOC entry 4398 (class 2606 OID 17617)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4541 (class 2606 OID 26158)
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 4506 (class 2606 OID 23090)
-- Name: enrollment_applications enrollment_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment_applications
    ADD CONSTRAINT enrollment_applications_pkey PRIMARY KEY (id);


--
-- TOC entry 4440 (class 2606 OID 17833)
-- Name: evaluations evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_pkey PRIMARY KEY (id);


--
-- TOC entry 4442 (class 2606 OID 17835)
-- Name: evaluations evaluations_student_id_competency_id_period_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_student_id_competency_id_period_id_key UNIQUE (student_id, competency_id, period_id);


--
-- TOC entry 4532 (class 2606 OID 26105)
-- Name: fee_concepts fee_concepts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fee_concepts
    ADD CONSTRAINT fee_concepts_pkey PRIMARY KEY (id);


--
-- TOC entry 4534 (class 2606 OID 26117)
-- Name: financial_plans financial_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_plans
    ADD CONSTRAINT financial_plans_pkey PRIMARY KEY (id);


--
-- TOC entry 4388 (class 2606 OID 17585)
-- Name: grade_levels grade_levels_level_grade_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_levels
    ADD CONSTRAINT grade_levels_level_grade_key UNIQUE (level, grade);


--
-- TOC entry 4390 (class 2606 OID 17583)
-- Name: grade_levels grade_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_levels
    ADD CONSTRAINT grade_levels_pkey PRIMARY KEY (id);


--
-- TOC entry 4412 (class 2606 OID 17682)
-- Name: guardians guardians_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardians
    ADD CONSTRAINT guardians_dni_key UNIQUE (dni);


--
-- TOC entry 4414 (class 2606 OID 17678)
-- Name: guardians guardians_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardians
    ADD CONSTRAINT guardians_pkey PRIMARY KEY (id);


--
-- TOC entry 4416 (class 2606 OID 17680)
-- Name: guardians guardians_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardians
    ADD CONSTRAINT guardians_user_id_key UNIQUE (user_id);


--
-- TOC entry 4555 (class 2606 OID 26844)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4490 (class 2606 OID 21960)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4466 (class 2606 OID 18046)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 4384 (class 2606 OID 17562)
-- Name: periods periods_academic_year_id_period_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_academic_year_id_period_number_key UNIQUE (academic_year_id, period_number);


--
-- TOC entry 4386 (class 2606 OID 17560)
-- Name: periods periods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);


--
-- TOC entry 4537 (class 2606 OID 26138)
-- Name: plan_installments plan_installments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_installments
    ADD CONSTRAINT plan_installments_pkey PRIMARY KEY (id);


--
-- TOC entry 4539 (class 2606 OID 26140)
-- Name: plan_installments plan_installments_plan_id_installment_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_installments
    ADD CONSTRAINT plan_installments_plan_id_installment_number_key UNIQUE (plan_id, installment_number);


--
-- TOC entry 4376 (class 2606 OID 17535)
-- Name: profiles profiles_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_dni_key UNIQUE (dni);


--
-- TOC entry 4378 (class 2606 OID 17533)
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 4590 (class 2606 OID 40638)
-- Name: public_news public_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_news
    ADD CONSTRAINT public_news_pkey PRIMARY KEY (id);


--
-- TOC entry 4592 (class 2606 OID 40640)
-- Name: public_news public_news_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_news
    ADD CONSTRAINT public_news_slug_key UNIQUE (slug);


--
-- TOC entry 4469 (class 2606 OID 18071)
-- Name: receipts receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);


--
-- TOC entry 4471 (class 2606 OID 18073)
-- Name: receipts receipts_receipt_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_receipt_number_key UNIQUE (receipt_number);


--
-- TOC entry 4392 (class 2606 OID 17597)
-- Name: sections sections_academic_year_id_grade_level_id_section_letter_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_academic_year_id_grade_level_id_section_letter_key UNIQUE (academic_year_id, grade_level_id, section_letter);


--
-- TOC entry 4394 (class 2606 OID 17595)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- TOC entry 4528 (class 2606 OID 23218)
-- Name: student_course_enrollments student_course_enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollments
    ADD CONSTRAINT student_course_enrollments_pkey PRIMARY KEY (id);


--
-- TOC entry 4530 (class 2606 OID 23220)
-- Name: student_course_enrollments student_course_enrollments_student_id_course_id_academic_ye_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollments
    ADD CONSTRAINT student_course_enrollments_student_id_course_id_academic_ye_key UNIQUE (student_id, course_id, academic_year_id);


--
-- TOC entry 4544 (class 2606 OID 26172)
-- Name: student_discounts student_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_discounts
    ADD CONSTRAINT student_discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 4546 (class 2606 OID 26174)
-- Name: student_discounts student_discounts_student_id_discount_id_academic_year_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_discounts
    ADD CONSTRAINT student_discounts_student_id_discount_id_academic_year_id_key UNIQUE (student_id, discount_id, academic_year_id);


--
-- TOC entry 4418 (class 2606 OID 17695)
-- Name: student_guardians student_guardians_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_guardians
    ADD CONSTRAINT student_guardians_pkey PRIMARY KEY (id);


--
-- TOC entry 4420 (class 2606 OID 17697)
-- Name: student_guardians student_guardians_student_id_guardian_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_guardians
    ADD CONSTRAINT student_guardians_student_id_guardian_id_key UNIQUE (student_id, guardian_id);


--
-- TOC entry 4406 (class 2606 OID 17657)
-- Name: students students_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_dni_key UNIQUE (dni);


--
-- TOC entry 4408 (class 2606 OID 17653)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4410 (class 2606 OID 17655)
-- Name: students students_student_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_student_code_key UNIQUE (student_code);


--
-- TOC entry 4502 (class 2606 OID 23044)
-- Name: task_submissions task_submissions_assignment_id_student_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_submissions
    ADD CONSTRAINT task_submissions_assignment_id_student_id_key UNIQUE (assignment_id, student_id);


--
-- TOC entry 4504 (class 2606 OID 23042)
-- Name: task_submissions task_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_submissions
    ADD CONSTRAINT task_submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4519 (class 2606 OID 23130)
-- Name: teacher_course_assignments teacher_course_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_course_assignments
    ADD CONSTRAINT teacher_course_assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 4521 (class 2606 OID 23132)
-- Name: teacher_course_assignments teacher_course_assignments_teacher_id_section_id_course_id__key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_course_assignments
    ADD CONSTRAINT teacher_course_assignments_teacher_id_section_id_course_id__key UNIQUE (teacher_id, section_id, course_id, academic_year_id);


--
-- TOC entry 4422 (class 2606 OID 17725)
-- Name: teachers teachers_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_dni_key UNIQUE (dni);


--
-- TOC entry 4424 (class 2606 OID 17719)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 4426 (class 2606 OID 17723)
-- Name: teachers teachers_teacher_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_teacher_code_key UNIQUE (teacher_code);


--
-- TOC entry 4428 (class 2606 OID 17721)
-- Name: teachers teachers_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_user_id_key UNIQUE (user_id);


--
-- TOC entry 4370 (class 2606 OID 17487)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 4549 (class 2606 OID 26628)
-- Name: messages_2025_12_13 messages_2025_12_13_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_13
    ADD CONSTRAINT messages_2025_12_13_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 4558 (class 2606 OID 28177)
-- Name: messages_2025_12_14 messages_2025_12_14_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_14
    ADD CONSTRAINT messages_2025_12_14_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 4561 (class 2606 OID 30395)
-- Name: messages_2025_12_15 messages_2025_12_15_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_15
    ADD CONSTRAINT messages_2025_12_15_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 4567 (class 2606 OID 33728)
-- Name: messages_2025_12_16 messages_2025_12_16_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_16
    ADD CONSTRAINT messages_2025_12_16_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 4570 (class 2606 OID 33740)
-- Name: messages_2025_12_17 messages_2025_12_17_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_17
    ADD CONSTRAINT messages_2025_12_17_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 4573 (class 2606 OID 33752)
-- Name: messages_2025_12_18 messages_2025_12_18_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_18
    ADD CONSTRAINT messages_2025_12_18_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 4576 (class 2606 OID 33764)
-- Name: messages_2025_12_19 messages_2025_12_19_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_12_19
    ADD CONSTRAINT messages_2025_12_19_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 4366 (class 2606 OID 17335)
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- TOC entry 4363 (class 2606 OID 17308)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 4355 (class 2606 OID 17302)
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- TOC entry 4258 (class 2606 OID 16554)
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- TOC entry 4358 (class 2606 OID 17278)
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- TOC entry 4268 (class 2606 OID 16595)
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- TOC entry 4270 (class 2606 OID 16593)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4266 (class 2606 OID 16571)
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- TOC entry 4353 (class 2606 OID 17206)
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- TOC entry 4350 (class 2606 OID 17167)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- TOC entry 4348 (class 2606 OID 17152)
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- TOC entry 4361 (class 2606 OID 17288)
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- TOC entry 4253 (class 1259 OID 16532)
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- TOC entry 4227 (class 1259 OID 16750)
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4228 (class 1259 OID 16752)
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4229 (class 1259 OID 16753)
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4286 (class 1259 OID 16831)
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- TOC entry 4319 (class 1259 OID 16939)
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- TOC entry 4274 (class 1259 OID 16919)
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 4274
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- TOC entry 4279 (class 1259 OID 16747)
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- TOC entry 4322 (class 1259 OID 16936)
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- TOC entry 4562 (class 1259 OID 30408)
-- Name: idx_oauth_client_states_created_at; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_oauth_client_states_created_at ON auth.oauth_client_states USING btree (created_at);


--
-- TOC entry 4323 (class 1259 OID 16937)
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- TOC entry 4294 (class 1259 OID 16942)
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- TOC entry 4291 (class 1259 OID 16803)
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- TOC entry 4292 (class 1259 OID 16948)
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- TOC entry 4332 (class 1259 OID 17073)
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- TOC entry 4329 (class 1259 OID 17026)
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- TOC entry 4339 (class 1259 OID 17099)
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- TOC entry 4340 (class 1259 OID 17097)
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- TOC entry 4345 (class 1259 OID 17098)
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- TOC entry 4326 (class 1259 OID 16995)
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- TOC entry 4327 (class 1259 OID 16994)
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- TOC entry 4328 (class 1259 OID 16996)
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- TOC entry 4230 (class 1259 OID 16754)
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4231 (class 1259 OID 16751)
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 4240 (class 1259 OID 16515)
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- TOC entry 4241 (class 1259 OID 16516)
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- TOC entry 4242 (class 1259 OID 16746)
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- TOC entry 4245 (class 1259 OID 16833)
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- TOC entry 4248 (class 1259 OID 16938)
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- TOC entry 4313 (class 1259 OID 16875)
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- TOC entry 4314 (class 1259 OID 16940)
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- TOC entry 4315 (class 1259 OID 16890)
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- TOC entry 4318 (class 1259 OID 16889)
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- TOC entry 4280 (class 1259 OID 16941)
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- TOC entry 4281 (class 1259 OID 17111)
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- TOC entry 4284 (class 1259 OID 16832)
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- TOC entry 4305 (class 1259 OID 16857)
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- TOC entry 4308 (class 1259 OID 16856)
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- TOC entry 4303 (class 1259 OID 16842)
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- TOC entry 4304 (class 1259 OID 17004)
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- TOC entry 4293 (class 1259 OID 17001)
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- TOC entry 4285 (class 1259 OID 16830)
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- TOC entry 4232 (class 1259 OID 16910)
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 4232
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- TOC entry 4233 (class 1259 OID 16748)
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- TOC entry 4234 (class 1259 OID 16505)
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- TOC entry 4235 (class 1259 OID 16965)
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- TOC entry 4448 (class 1259 OID 18115)
-- Name: idx_assignments_due_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_assignments_due_date ON public.assignments USING btree (due_date);


--
-- TOC entry 4449 (class 1259 OID 18114)
-- Name: idx_assignments_section; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_assignments_section ON public.assignments USING btree (section_id);


--
-- TOC entry 4437 (class 1259 OID 18109)
-- Name: idx_attendance_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_attendance_date ON public.attendance USING btree (date);


--
-- TOC entry 4438 (class 1259 OID 18110)
-- Name: idx_attendance_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_attendance_student ON public.attendance USING btree (student_id);


--
-- TOC entry 4493 (class 1259 OID 22004)
-- Name: idx_audit_logs_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_logs_action ON public.audit_logs USING btree (action);


--
-- TOC entry 4494 (class 1259 OID 22003)
-- Name: idx_audit_logs_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_logs_created ON public.audit_logs USING btree (created_at DESC);


--
-- TOC entry 4495 (class 1259 OID 22001)
-- Name: idx_audit_logs_entity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_logs_entity ON public.audit_logs USING btree (entity_type, entity_id);


--
-- TOC entry 4496 (class 1259 OID 22002)
-- Name: idx_audit_logs_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_audit_logs_user ON public.audit_logs USING btree (user_id);


--
-- TOC entry 4476 (class 1259 OID 25430)
-- Name: idx_cash_closures_cashier; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cash_closures_cashier ON public.cash_closures USING btree (cashier_id);


--
-- TOC entry 4477 (class 1259 OID 25431)
-- Name: idx_cash_closures_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cash_closures_date ON public.cash_closures USING btree (closure_date);


--
-- TOC entry 4478 (class 1259 OID 25432)
-- Name: idx_cash_closures_opening_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cash_closures_opening_time ON public.cash_closures USING btree (opening_time);


--
-- TOC entry 4458 (class 1259 OID 25215)
-- Name: idx_charges_concept; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_charges_concept ON public.charges USING btree (concept_id);


--
-- TOC entry 4459 (class 1259 OID 18118)
-- Name: idx_charges_due_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_charges_due_date ON public.charges USING btree (due_date);


--
-- TOC entry 4460 (class 1259 OID 18117)
-- Name: idx_charges_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_charges_status ON public.charges USING btree (status);


--
-- TOC entry 4461 (class 1259 OID 18116)
-- Name: idx_charges_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_charges_student ON public.charges USING btree (student_id);


--
-- TOC entry 4507 (class 1259 OID 23107)
-- Name: idx_enrollment_applications_academic_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_enrollment_applications_academic_year ON public.enrollment_applications USING btree (academic_year_id);


--
-- TOC entry 4508 (class 1259 OID 23109)
-- Name: idx_enrollment_applications_application_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_enrollment_applications_application_date ON public.enrollment_applications USING btree (application_date);


--
-- TOC entry 4509 (class 1259 OID 23108)
-- Name: idx_enrollment_applications_grade_level; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_enrollment_applications_grade_level ON public.enrollment_applications USING btree (grade_level_id);


--
-- TOC entry 4510 (class 1259 OID 23110)
-- Name: idx_enrollment_applications_guardian_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_enrollment_applications_guardian_email ON public.enrollment_applications USING btree (guardian_email);


--
-- TOC entry 4511 (class 1259 OID 23106)
-- Name: idx_enrollment_applications_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_enrollment_applications_status ON public.enrollment_applications USING btree (status);


--
-- TOC entry 4512 (class 1259 OID 23111)
-- Name: idx_enrollment_applications_student_document; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_enrollment_applications_student_document ON public.enrollment_applications USING btree (student_document_number);


--
-- TOC entry 4443 (class 1259 OID 18112)
-- Name: idx_evaluations_period; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_evaluations_period ON public.evaluations USING btree (period_id);


--
-- TOC entry 4444 (class 1259 OID 18113)
-- Name: idx_evaluations_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_evaluations_status ON public.evaluations USING btree (status);


--
-- TOC entry 4445 (class 1259 OID 18111)
-- Name: idx_evaluations_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_evaluations_student ON public.evaluations USING btree (student_id);


--
-- TOC entry 4483 (class 1259 OID 21652)
-- Name: idx_justifications_attendance; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_justifications_attendance ON public.attendance_justifications USING btree (attendance_id);


--
-- TOC entry 4484 (class 1259 OID 21650)
-- Name: idx_justifications_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_justifications_status ON public.attendance_justifications USING btree (status);


--
-- TOC entry 4485 (class 1259 OID 21651)
-- Name: idx_justifications_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_justifications_student ON public.attendance_justifications USING btree (student_id);


--
-- TOC entry 4550 (class 1259 OID 26863)
-- Name: idx_messages_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_created_at ON public.messages USING btree (created_at DESC);


--
-- TOC entry 4551 (class 1259 OID 26864)
-- Name: idx_messages_is_read; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_is_read ON public.messages USING btree (is_read) WHERE (is_read = false);


--
-- TOC entry 4552 (class 1259 OID 26862)
-- Name: idx_messages_sender_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_sender_id ON public.messages USING btree (sender_id);


--
-- TOC entry 4553 (class 1259 OID 26861)
-- Name: idx_messages_student_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_student_id ON public.messages USING btree (student_id);


--
-- TOC entry 4486 (class 1259 OID 21968)
-- Name: idx_notifications_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_notifications_created ON public.notifications USING btree (created_at DESC);


--
-- TOC entry 4487 (class 1259 OID 21967)
-- Name: idx_notifications_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_notifications_status ON public.notifications USING btree (status) WHERE (status = 'no_leida'::public.notification_status);


--
-- TOC entry 4488 (class 1259 OID 21966)
-- Name: idx_notifications_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_notifications_user ON public.notifications USING btree (user_id);


--
-- TOC entry 4462 (class 1259 OID 18119)
-- Name: idx_payments_charge; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_charge ON public.payments USING btree (charge_id);


--
-- TOC entry 4463 (class 1259 OID 18120)
-- Name: idx_payments_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_date ON public.payments USING btree (payment_date);


--
-- TOC entry 4464 (class 1259 OID 25216)
-- Name: idx_payments_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_student ON public.payments USING btree (student_id);


--
-- TOC entry 4535 (class 1259 OID 26196)
-- Name: idx_plan_installments_plan; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_plan_installments_plan ON public.plan_installments USING btree (plan_id);


--
-- TOC entry 4371 (class 1259 OID 22179)
-- Name: idx_profiles_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profiles_created_at ON public.profiles USING btree (created_at);


--
-- TOC entry 4372 (class 1259 OID 22178)
-- Name: idx_profiles_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profiles_email ON public.profiles USING btree (email);


--
-- TOC entry 4373 (class 1259 OID 22177)
-- Name: idx_profiles_is_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profiles_is_active ON public.profiles USING btree (is_active);


--
-- TOC entry 4374 (class 1259 OID 22176)
-- Name: idx_profiles_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_profiles_role ON public.profiles USING btree (role);


--
-- TOC entry 4585 (class 1259 OID 40652)
-- Name: idx_public_news_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_public_news_category ON public.public_news USING btree (category);


--
-- TOC entry 4586 (class 1259 OID 40654)
-- Name: idx_public_news_is_featured; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_public_news_is_featured ON public.public_news USING btree (is_featured) WHERE (is_featured = true);


--
-- TOC entry 4587 (class 1259 OID 40653)
-- Name: idx_public_news_published_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_public_news_published_at ON public.public_news USING btree (published_at DESC);


--
-- TOC entry 4588 (class 1259 OID 40651)
-- Name: idx_public_news_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_public_news_status ON public.public_news USING btree (status);


--
-- TOC entry 4467 (class 1259 OID 25217)
-- Name: idx_receipts_payment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_receipts_payment ON public.receipts USING btree (payment_id);


--
-- TOC entry 4579 (class 1259 OID 34904)
-- Name: idx_schedules_course; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_schedules_course ON public.course_schedules USING btree (course_id);


--
-- TOC entry 4580 (class 1259 OID 34905)
-- Name: idx_schedules_day; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_schedules_day ON public.course_schedules USING btree (day_of_week);


--
-- TOC entry 4581 (class 1259 OID 34902)
-- Name: idx_schedules_section; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_schedules_section ON public.course_schedules USING btree (section_id);


--
-- TOC entry 4582 (class 1259 OID 34907)
-- Name: idx_schedules_section_day; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_schedules_section_day ON public.course_schedules USING btree (section_id, day_of_week, start_time);


--
-- TOC entry 4583 (class 1259 OID 34903)
-- Name: idx_schedules_teacher; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_schedules_teacher ON public.course_schedules USING btree (teacher_id);


--
-- TOC entry 4584 (class 1259 OID 34906)
-- Name: idx_schedules_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_schedules_year ON public.course_schedules USING btree (academic_year_id);


--
-- TOC entry 4522 (class 1259 OID 23242)
-- Name: idx_student_course_enrollments_course; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_student_course_enrollments_course ON public.student_course_enrollments USING btree (course_id);


--
-- TOC entry 4523 (class 1259 OID 23243)
-- Name: idx_student_course_enrollments_section; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_student_course_enrollments_section ON public.student_course_enrollments USING btree (section_id);


--
-- TOC entry 4524 (class 1259 OID 23245)
-- Name: idx_student_course_enrollments_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_student_course_enrollments_status ON public.student_course_enrollments USING btree (status);


--
-- TOC entry 4525 (class 1259 OID 23241)
-- Name: idx_student_course_enrollments_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_student_course_enrollments_student ON public.student_course_enrollments USING btree (student_id);


--
-- TOC entry 4526 (class 1259 OID 23244)
-- Name: idx_student_course_enrollments_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_student_course_enrollments_year ON public.student_course_enrollments USING btree (academic_year_id);


--
-- TOC entry 4542 (class 1259 OID 26195)
-- Name: idx_student_discounts_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_student_discounts_student ON public.student_discounts USING btree (student_id);


--
-- TOC entry 4403 (class 1259 OID 18107)
-- Name: idx_students_section; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_students_section ON public.students USING btree (section_id);


--
-- TOC entry 4404 (class 1259 OID 18108)
-- Name: idx_students_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_students_status ON public.students USING btree (status);


--
-- TOC entry 4497 (class 1259 OID 23060)
-- Name: idx_task_submissions_assignment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_submissions_assignment ON public.task_submissions USING btree (assignment_id);


--
-- TOC entry 4498 (class 1259 OID 23063)
-- Name: idx_task_submissions_graded; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_submissions_graded ON public.task_submissions USING btree (graded_at);


--
-- TOC entry 4499 (class 1259 OID 23062)
-- Name: idx_task_submissions_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_submissions_status ON public.task_submissions USING btree (status);


--
-- TOC entry 4500 (class 1259 OID 23061)
-- Name: idx_task_submissions_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_submissions_student ON public.task_submissions USING btree (student_id);


--
-- TOC entry 4513 (class 1259 OID 23161)
-- Name: idx_teacher_assignments_academic_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_teacher_assignments_academic_year ON public.teacher_course_assignments USING btree (academic_year_id);


--
-- TOC entry 4514 (class 1259 OID 23162)
-- Name: idx_teacher_assignments_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_teacher_assignments_active ON public.teacher_course_assignments USING btree (is_active);


--
-- TOC entry 4515 (class 1259 OID 23160)
-- Name: idx_teacher_assignments_course; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_teacher_assignments_course ON public.teacher_course_assignments USING btree (course_id);


--
-- TOC entry 4516 (class 1259 OID 23159)
-- Name: idx_teacher_assignments_section; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_teacher_assignments_section ON public.teacher_course_assignments USING btree (section_id);


--
-- TOC entry 4517 (class 1259 OID 23158)
-- Name: idx_teacher_assignments_teacher; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_teacher_assignments_teacher ON public.teacher_course_assignments USING btree (teacher_id);


--
-- TOC entry 4364 (class 1259 OID 17488)
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- TOC entry 4368 (class 1259 OID 17489)
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 4547 (class 1259 OID 26629)
-- Name: messages_2025_12_13_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_13_inserted_at_topic_idx ON realtime.messages_2025_12_13 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 4556 (class 1259 OID 28178)
-- Name: messages_2025_12_14_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_14_inserted_at_topic_idx ON realtime.messages_2025_12_14 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 4559 (class 1259 OID 30396)
-- Name: messages_2025_12_15_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_15_inserted_at_topic_idx ON realtime.messages_2025_12_15 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 4565 (class 1259 OID 33729)
-- Name: messages_2025_12_16_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_16_inserted_at_topic_idx ON realtime.messages_2025_12_16 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 4568 (class 1259 OID 33741)
-- Name: messages_2025_12_17_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_17_inserted_at_topic_idx ON realtime.messages_2025_12_17 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 4571 (class 1259 OID 33753)
-- Name: messages_2025_12_18_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_18_inserted_at_topic_idx ON realtime.messages_2025_12_18 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 4574 (class 1259 OID 33765)
-- Name: messages_2025_12_19_inserted_at_topic_idx; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX messages_2025_12_19_inserted_at_topic_idx ON realtime.messages_2025_12_19 USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- TOC entry 4367 (class 1259 OID 17388)
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- TOC entry 4256 (class 1259 OID 16560)
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- TOC entry 4259 (class 1259 OID 16582)
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- TOC entry 4356 (class 1259 OID 17303)
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- TOC entry 4346 (class 1259 OID 17178)
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- TOC entry 4260 (class 1259 OID 17224)
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- TOC entry 4261 (class 1259 OID 17143)
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- TOC entry 4262 (class 1259 OID 17226)
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- TOC entry 4351 (class 1259 OID 17227)
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- TOC entry 4263 (class 1259 OID 16583)
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- TOC entry 4264 (class 1259 OID 17225)
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- TOC entry 4359 (class 1259 OID 17294)
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- TOC entry 4593 (class 0 OID 0)
-- Name: messages_2025_12_13_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_13_inserted_at_topic_idx;


--
-- TOC entry 4594 (class 0 OID 0)
-- Name: messages_2025_12_13_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_13_pkey;


--
-- TOC entry 4595 (class 0 OID 0)
-- Name: messages_2025_12_14_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_14_inserted_at_topic_idx;


--
-- TOC entry 4596 (class 0 OID 0)
-- Name: messages_2025_12_14_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_14_pkey;


--
-- TOC entry 4597 (class 0 OID 0)
-- Name: messages_2025_12_15_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_15_inserted_at_topic_idx;


--
-- TOC entry 4598 (class 0 OID 0)
-- Name: messages_2025_12_15_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_15_pkey;


--
-- TOC entry 4599 (class 0 OID 0)
-- Name: messages_2025_12_16_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_16_inserted_at_topic_idx;


--
-- TOC entry 4600 (class 0 OID 0)
-- Name: messages_2025_12_16_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_16_pkey;


--
-- TOC entry 4601 (class 0 OID 0)
-- Name: messages_2025_12_17_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_17_inserted_at_topic_idx;


--
-- TOC entry 4602 (class 0 OID 0)
-- Name: messages_2025_12_17_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_17_pkey;


--
-- TOC entry 4603 (class 0 OID 0)
-- Name: messages_2025_12_18_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_18_inserted_at_topic_idx;


--
-- TOC entry 4604 (class 0 OID 0)
-- Name: messages_2025_12_18_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_18_pkey;


--
-- TOC entry 4605 (class 0 OID 0)
-- Name: messages_2025_12_19_inserted_at_topic_idx; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_inserted_at_topic_index ATTACH PARTITION realtime.messages_2025_12_19_inserted_at_topic_idx;


--
-- TOC entry 4606 (class 0 OID 0)
-- Name: messages_2025_12_19_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_12_19_pkey;


--
-- TOC entry 4731 (class 2620 OID 34916)
-- Name: course_schedules course_schedules_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER course_schedules_updated_at BEFORE UPDATE ON public.course_schedules FOR EACH ROW EXECUTE FUNCTION public.update_course_schedules_updated_at();


--
-- TOC entry 4726 (class 2620 OID 23113)
-- Name: enrollment_applications enrollment_applications_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER enrollment_applications_updated_at BEFORE UPDATE ON public.enrollment_applications FOR EACH ROW EXECUTE FUNCTION public.update_enrollment_applications_updated_at();


--
-- TOC entry 4720 (class 2620 OID 22205)
-- Name: profiles profiles_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.update_profiles_updated_at();


--
-- TOC entry 4725 (class 2620 OID 23065)
-- Name: task_submissions task_submissions_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER task_submissions_updated_at BEFORE UPDATE ON public.task_submissions FOR EACH ROW EXECUTE FUNCTION public.update_task_submissions_updated_at();


--
-- TOC entry 4722 (class 2620 OID 22011)
-- Name: evaluations trigger_audit_evaluations; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_audit_evaluations AFTER UPDATE ON public.evaluations FOR EACH ROW EXECUTE FUNCTION public.audit_evaluation_changes();


--
-- TOC entry 4723 (class 2620 OID 22015)
-- Name: payments trigger_audit_payments; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_audit_payments AFTER INSERT ON public.payments FOR EACH ROW EXECUTE FUNCTION public.audit_and_notify_payment();


--
-- TOC entry 4721 (class 2620 OID 23439)
-- Name: students trigger_auto_enroll_student_courses; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_auto_enroll_student_courses AFTER INSERT OR UPDATE OF section_id, status ON public.students FOR EACH ROW EXECUTE FUNCTION public.auto_enroll_student_to_section_courses();


--
-- TOC entry 4732 (class 2620 OID 40661)
-- Name: public_news trigger_generate_news_slug; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_generate_news_slug BEFORE INSERT ON public.public_news FOR EACH ROW EXECUTE FUNCTION public.generate_news_slug();


--
-- TOC entry 4724 (class 2620 OID 22013)
-- Name: attendance_justifications trigger_notify_justifications; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_notify_justifications AFTER UPDATE ON public.attendance_justifications FOR EACH ROW EXECUTE FUNCTION public.notify_justification_status();


--
-- TOC entry 4727 (class 2620 OID 23440)
-- Name: teacher_course_assignments trigger_sync_student_enrollments; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_sync_student_enrollments AFTER INSERT OR UPDATE OF is_active ON public.teacher_course_assignments FOR EACH ROW EXECUTE FUNCTION public.sync_student_enrollments_on_teacher_assignment();


--
-- TOC entry 4733 (class 2620 OID 40663)
-- Name: public_news trigger_update_public_news_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_update_public_news_updated_at BEFORE UPDATE ON public.public_news FOR EACH ROW EXECUTE FUNCTION public.update_public_news_updated_at();


--
-- TOC entry 4730 (class 2620 OID 23438)
-- Name: student_course_enrollments trigger_update_student_course_enrollments_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_update_student_course_enrollments_updated_at BEFORE UPDATE ON public.student_course_enrollments FOR EACH ROW EXECUTE FUNCTION public.update_student_course_enrollments_updated_at();


--
-- TOC entry 4728 (class 2620 OID 23164)
-- Name: teacher_course_assignments trigger_update_teacher_assignments_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_update_teacher_assignments_updated_at BEFORE UPDATE ON public.teacher_course_assignments FOR EACH ROW EXECUTE FUNCTION public.update_teacher_assignments_updated_at();


--
-- TOC entry 4729 (class 2620 OID 23166)
-- Name: teacher_course_assignments trigger_validate_teacher_course_limit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_validate_teacher_course_limit BEFORE INSERT OR UPDATE ON public.teacher_course_assignments FOR EACH ROW WHEN ((new.is_active = true)) EXECUTE FUNCTION public.validate_teacher_course_limit();


--
-- TOC entry 4719 (class 2620 OID 17340)
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- TOC entry 4712 (class 2620 OID 17234)
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- TOC entry 4713 (class 2620 OID 17265)
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- TOC entry 4714 (class 2620 OID 17220)
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- TOC entry 4715 (class 2620 OID 17264)
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- TOC entry 4717 (class 2620 OID 17230)
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- TOC entry 4718 (class 2620 OID 17266)
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- TOC entry 4716 (class 2620 OID 17131)
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- TOC entry 4609 (class 2606 OID 16734)
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4614 (class 2606 OID 16823)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 4613 (class 2606 OID 16811)
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- TOC entry 4612 (class 2606 OID 16798)
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4620 (class 2606 OID 17063)
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- TOC entry 4621 (class 2606 OID 17068)
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4622 (class 2606 OID 17092)
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- TOC entry 4623 (class 2606 OID 17087)
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4619 (class 2606 OID 16989)
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4607 (class 2606 OID 16767)
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 4616 (class 2606 OID 16870)
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4617 (class 2606 OID 16943)
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- TOC entry 4618 (class 2606 OID 16884)
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4610 (class 2606 OID 17106)
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- TOC entry 4611 (class 2606 OID 16762)
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4615 (class 2606 OID 16851)
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 4661 (class 2606 OID 24887)
-- Name: announcements announcements_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_approved_by_fkey FOREIGN KEY (approved_by) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- TOC entry 4662 (class 2606 OID 24882)
-- Name: announcements announcements_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- TOC entry 4663 (class 2606 OID 17960)
-- Name: announcements announcements_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE SET NULL;


--
-- TOC entry 4658 (class 2606 OID 17910)
-- Name: assignment_submissions assignment_submissions_assignment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignment_submissions
    ADD CONSTRAINT assignment_submissions_assignment_id_fkey FOREIGN KEY (assignment_id) REFERENCES public.assignments(id) ON DELETE CASCADE;


--
-- TOC entry 4659 (class 2606 OID 17920)
-- Name: assignment_submissions assignment_submissions_reviewed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignment_submissions
    ADD CONSTRAINT assignment_submissions_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4660 (class 2606 OID 17915)
-- Name: assignment_submissions assignment_submissions_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignment_submissions
    ADD CONSTRAINT assignment_submissions_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4655 (class 2606 OID 17872)
-- Name: assignments assignments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4656 (class 2606 OID 17882)
-- Name: assignments assignments_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4657 (class 2606 OID 17877)
-- Name: assignments assignments_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE CASCADE;


--
-- TOC entry 4646 (class 2606 OID 17795)
-- Name: attendance attendance_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE SET NULL;


--
-- TOC entry 4675 (class 2606 OID 21630)
-- Name: attendance_justifications attendance_justifications_attendance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_justifications
    ADD CONSTRAINT attendance_justifications_attendance_id_fkey FOREIGN KEY (attendance_id) REFERENCES public.attendance(id) ON DELETE CASCADE;


--
-- TOC entry 4676 (class 2606 OID 21640)
-- Name: attendance_justifications attendance_justifications_guardian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_justifications
    ADD CONSTRAINT attendance_justifications_guardian_id_fkey FOREIGN KEY (guardian_id) REFERENCES public.guardians(id) ON DELETE SET NULL;


--
-- TOC entry 4677 (class 2606 OID 21645)
-- Name: attendance_justifications attendance_justifications_reviewed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_justifications
    ADD CONSTRAINT attendance_justifications_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4678 (class 2606 OID 21635)
-- Name: attendance_justifications attendance_justifications_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance_justifications
    ADD CONSTRAINT attendance_justifications_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4647 (class 2606 OID 17800)
-- Name: attendance attendance_recorded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_recorded_by_fkey FOREIGN KEY (recorded_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4648 (class 2606 OID 17790)
-- Name: attendance attendance_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE CASCADE;


--
-- TOC entry 4649 (class 2606 OID 17785)
-- Name: attendance attendance_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4680 (class 2606 OID 21996)
-- Name: audit_logs audit_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4673 (class 2606 OID 25425)
-- Name: cash_closures cash_closures_cashier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cash_closures
    ADD CONSTRAINT cash_closures_cashier_id_fkey FOREIGN KEY (cashier_id) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- TOC entry 4674 (class 2606 OID 18102)
-- Name: cash_closures cash_closures_closed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cash_closures
    ADD CONSTRAINT cash_closures_closed_by_fkey FOREIGN KEY (closed_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4664 (class 2606 OID 18014)
-- Name: charges charges_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charges
    ADD CONSTRAINT charges_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id) ON DELETE CASCADE;


--
-- TOC entry 4665 (class 2606 OID 18019)
-- Name: charges charges_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charges
    ADD CONSTRAINT charges_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4666 (class 2606 OID 18009)
-- Name: charges charges_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charges
    ADD CONSTRAINT charges_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4635 (class 2606 OID 17637)
-- Name: competencies competencies_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencies
    ADD CONSTRAINT competencies_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4642 (class 2606 OID 17756)
-- Name: course_assignments course_assignments_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_assignments
    ADD CONSTRAINT course_assignments_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id) ON DELETE CASCADE;


--
-- TOC entry 4643 (class 2606 OID 17746)
-- Name: course_assignments course_assignments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_assignments
    ADD CONSTRAINT course_assignments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4644 (class 2606 OID 17751)
-- Name: course_assignments course_assignments_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_assignments
    ADD CONSTRAINT course_assignments_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE CASCADE;


--
-- TOC entry 4645 (class 2606 OID 17741)
-- Name: course_assignments course_assignments_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_assignments
    ADD CONSTRAINT course_assignments_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


--
-- TOC entry 4706 (class 2606 OID 34882)
-- Name: course_schedules course_schedules_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_schedules
    ADD CONSTRAINT course_schedules_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id) ON DELETE CASCADE;


--
-- TOC entry 4707 (class 2606 OID 34892)
-- Name: course_schedules course_schedules_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_schedules
    ADD CONSTRAINT course_schedules_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4708 (class 2606 OID 34887)
-- Name: course_schedules course_schedules_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_schedules
    ADD CONSTRAINT course_schedules_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE CASCADE;


--
-- TOC entry 4709 (class 2606 OID 34897)
-- Name: course_schedules course_schedules_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_schedules
    ADD CONSTRAINT course_schedules_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE SET NULL;


--
-- TOC entry 4634 (class 2606 OID 17620)
-- Name: courses courses_grade_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_grade_level_id_fkey FOREIGN KEY (grade_level_id) REFERENCES public.grade_levels(id) ON DELETE RESTRICT;


--
-- TOC entry 4699 (class 2606 OID 26159)
-- Name: discounts discounts_specific_concept_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_specific_concept_id_fkey FOREIGN KEY (specific_concept_id) REFERENCES public.fee_concepts(id) ON DELETE SET NULL;


--
-- TOC entry 4684 (class 2606 OID 23101)
-- Name: enrollment_applications enrollment_applications_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment_applications
    ADD CONSTRAINT enrollment_applications_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id);


--
-- TOC entry 4685 (class 2606 OID 23091)
-- Name: enrollment_applications enrollment_applications_grade_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment_applications
    ADD CONSTRAINT enrollment_applications_grade_level_id_fkey FOREIGN KEY (grade_level_id) REFERENCES public.grade_levels(id);


--
-- TOC entry 4686 (class 2606 OID 23096)
-- Name: enrollment_applications enrollment_applications_reviewed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment_applications
    ADD CONSTRAINT enrollment_applications_reviewed_by_fkey FOREIGN KEY (reviewed_by) REFERENCES public.profiles(id);


--
-- TOC entry 4650 (class 2606 OID 17846)
-- Name: evaluations evaluations_competency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_competency_id_fkey FOREIGN KEY (competency_id) REFERENCES public.competencies(id) ON DELETE CASCADE;


--
-- TOC entry 4651 (class 2606 OID 17841)
-- Name: evaluations evaluations_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4652 (class 2606 OID 17851)
-- Name: evaluations evaluations_period_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_period_id_fkey FOREIGN KEY (period_id) REFERENCES public.periods(id) ON DELETE CASCADE;


--
-- TOC entry 4653 (class 2606 OID 17856)
-- Name: evaluations evaluations_recorded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_recorded_by_fkey FOREIGN KEY (recorded_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4654 (class 2606 OID 17836)
-- Name: evaluations evaluations_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4696 (class 2606 OID 26118)
-- Name: financial_plans financial_plans_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_plans
    ADD CONSTRAINT financial_plans_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id) ON DELETE CASCADE;


--
-- TOC entry 4697 (class 2606 OID 26123)
-- Name: financial_plans financial_plans_concept_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_plans
    ADD CONSTRAINT financial_plans_concept_id_fkey FOREIGN KEY (concept_id) REFERENCES public.fee_concepts(id) ON DELETE RESTRICT;


--
-- TOC entry 4638 (class 2606 OID 17683)
-- Name: guardians guardians_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guardians
    ADD CONSTRAINT guardians_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4704 (class 2606 OID 26850)
-- Name: messages messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- TOC entry 4705 (class 2606 OID 26845)
-- Name: messages messages_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4679 (class 2606 OID 21961)
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4667 (class 2606 OID 18047)
-- Name: payments payments_charge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_charge_id_fkey FOREIGN KEY (charge_id) REFERENCES public.charges(id) ON DELETE RESTRICT;


--
-- TOC entry 4668 (class 2606 OID 18057)
-- Name: payments payments_received_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_received_by_fkey FOREIGN KEY (received_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4669 (class 2606 OID 18052)
-- Name: payments payments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4631 (class 2606 OID 17563)
-- Name: periods periods_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id) ON DELETE CASCADE;


--
-- TOC entry 4698 (class 2606 OID 26141)
-- Name: plan_installments plan_installments_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_installments
    ADD CONSTRAINT plan_installments_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.financial_plans(id) ON DELETE CASCADE;


--
-- TOC entry 4629 (class 2606 OID 22171)
-- Name: profiles profiles_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id);


--
-- TOC entry 4630 (class 2606 OID 17536)
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 4710 (class 2606 OID 40641)
-- Name: public_news public_news_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_news
    ADD CONSTRAINT public_news_created_by_fkey FOREIGN KEY (created_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4711 (class 2606 OID 40646)
-- Name: public_news public_news_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_news
    ADD CONSTRAINT public_news_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4670 (class 2606 OID 18084)
-- Name: receipts receipts_issued_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_issued_by_fkey FOREIGN KEY (issued_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4671 (class 2606 OID 18074)
-- Name: receipts receipts_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payments(id) ON DELETE RESTRICT;


--
-- TOC entry 4672 (class 2606 OID 18079)
-- Name: receipts receipts_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipts
    ADD CONSTRAINT receipts_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4632 (class 2606 OID 17598)
-- Name: sections sections_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id) ON DELETE CASCADE;


--
-- TOC entry 4633 (class 2606 OID 17603)
-- Name: sections sections_grade_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_grade_level_id_fkey FOREIGN KEY (grade_level_id) REFERENCES public.grade_levels(id) ON DELETE RESTRICT;


--
-- TOC entry 4692 (class 2606 OID 23236)
-- Name: student_course_enrollments student_course_enrollments_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollments
    ADD CONSTRAINT student_course_enrollments_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id) ON DELETE CASCADE;


--
-- TOC entry 4693 (class 2606 OID 23226)
-- Name: student_course_enrollments student_course_enrollments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollments
    ADD CONSTRAINT student_course_enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4694 (class 2606 OID 23231)
-- Name: student_course_enrollments student_course_enrollments_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollments
    ADD CONSTRAINT student_course_enrollments_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE CASCADE;


--
-- TOC entry 4695 (class 2606 OID 23221)
-- Name: student_course_enrollments student_course_enrollments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_course_enrollments
    ADD CONSTRAINT student_course_enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4700 (class 2606 OID 26185)
-- Name: student_discounts student_discounts_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_discounts
    ADD CONSTRAINT student_discounts_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id) ON DELETE CASCADE;


--
-- TOC entry 4701 (class 2606 OID 26190)
-- Name: student_discounts student_discounts_assigned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_discounts
    ADD CONSTRAINT student_discounts_assigned_by_fkey FOREIGN KEY (assigned_by) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4702 (class 2606 OID 26180)
-- Name: student_discounts student_discounts_discount_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_discounts
    ADD CONSTRAINT student_discounts_discount_id_fkey FOREIGN KEY (discount_id) REFERENCES public.discounts(id) ON DELETE CASCADE;


--
-- TOC entry 4703 (class 2606 OID 26175)
-- Name: student_discounts student_discounts_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_discounts
    ADD CONSTRAINT student_discounts_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4639 (class 2606 OID 17703)
-- Name: student_guardians student_guardians_guardian_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_guardians
    ADD CONSTRAINT student_guardians_guardian_id_fkey FOREIGN KEY (guardian_id) REFERENCES public.guardians(id) ON DELETE CASCADE;


--
-- TOC entry 4640 (class 2606 OID 17698)
-- Name: student_guardians student_guardians_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_guardians
    ADD CONSTRAINT student_guardians_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4636 (class 2606 OID 17663)
-- Name: students students_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE SET NULL;


--
-- TOC entry 4637 (class 2606 OID 17658)
-- Name: students students_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4681 (class 2606 OID 23045)
-- Name: task_submissions task_submissions_assignment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_submissions
    ADD CONSTRAINT task_submissions_assignment_id_fkey FOREIGN KEY (assignment_id) REFERENCES public.assignments(id) ON DELETE CASCADE;


--
-- TOC entry 4682 (class 2606 OID 23055)
-- Name: task_submissions task_submissions_graded_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_submissions
    ADD CONSTRAINT task_submissions_graded_by_fkey FOREIGN KEY (graded_by) REFERENCES public.profiles(id);


--
-- TOC entry 4683 (class 2606 OID 23050)
-- Name: task_submissions task_submissions_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_submissions
    ADD CONSTRAINT task_submissions_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4687 (class 2606 OID 23148)
-- Name: teacher_course_assignments teacher_course_assignments_academic_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_course_assignments
    ADD CONSTRAINT teacher_course_assignments_academic_year_id_fkey FOREIGN KEY (academic_year_id) REFERENCES public.academic_years(id) ON DELETE CASCADE;


--
-- TOC entry 4688 (class 2606 OID 23153)
-- Name: teacher_course_assignments teacher_course_assignments_assigned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_course_assignments
    ADD CONSTRAINT teacher_course_assignments_assigned_by_fkey FOREIGN KEY (assigned_by) REFERENCES public.profiles(id);


--
-- TOC entry 4689 (class 2606 OID 23143)
-- Name: teacher_course_assignments teacher_course_assignments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_course_assignments
    ADD CONSTRAINT teacher_course_assignments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- TOC entry 4690 (class 2606 OID 23138)
-- Name: teacher_course_assignments teacher_course_assignments_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_course_assignments
    ADD CONSTRAINT teacher_course_assignments_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE CASCADE;


--
-- TOC entry 4691 (class 2606 OID 23133)
-- Name: teacher_course_assignments teacher_course_assignments_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_course_assignments
    ADD CONSTRAINT teacher_course_assignments_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON DELETE CASCADE;


--
-- TOC entry 4641 (class 2606 OID 17726)
-- Name: teachers teachers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE SET NULL;


--
-- TOC entry 4608 (class 2606 OID 16572)
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4627 (class 2606 OID 17207)
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4624 (class 2606 OID 17153)
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4625 (class 2606 OID 17173)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 4626 (class 2606 OID 17168)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- TOC entry 4628 (class 2606 OID 17289)
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- TOC entry 4887 (class 0 OID 16525)
-- Dependencies: 345
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4901 (class 0 OID 16929)
-- Dependencies: 362
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4892 (class 0 OID 16727)
-- Dependencies: 353
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4886 (class 0 OID 16518)
-- Dependencies: 344
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4896 (class 0 OID 16816)
-- Dependencies: 357
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4895 (class 0 OID 16804)
-- Dependencies: 356
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4894 (class 0 OID 16791)
-- Dependencies: 355
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4902 (class 0 OID 16979)
-- Dependencies: 363
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4885 (class 0 OID 16507)
-- Dependencies: 343
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4899 (class 0 OID 16858)
-- Dependencies: 360
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4900 (class 0 OID 16876)
-- Dependencies: 361
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4888 (class 0 OID 16533)
-- Dependencies: 346
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4893 (class 0 OID 16757)
-- Dependencies: 354
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4898 (class 0 OID 16843)
-- Dependencies: 359
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4897 (class 0 OID 16834)
-- Dependencies: 358
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4884 (class 0 OID 16495)
-- Dependencies: 341
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4997 (class 3256 OID 22005)
-- Name: audit_logs Admin can read all audit logs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin can read all audit logs" ON public.audit_logs FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4965 (class 3256 OID 21656)
-- Name: attendance_justifications Admin roles can manage all justifications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin roles can manage all justifications" ON public.attendance_justifications TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'secretary'::public.user_role]))))));


--
-- TOC entry 5052 (class 3256 OID 34913)
-- Name: course_schedules Admin roles can manage schedules; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin roles can manage schedules" ON public.course_schedules TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role])))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role]))))));


--
-- TOC entry 5048 (class 3256 OID 34908)
-- Name: course_schedules Admin roles can view all schedules; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admin roles can view all schedules" ON public.course_schedules FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role, 'secretary'::public.user_role]))))));


--
-- TOC entry 4968 (class 3256 OID 21704)
-- Name: academic_years Admins can delete academic years; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can delete academic years" ON public.academic_years FOR DELETE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4983 (class 3256 OID 21719)
-- Name: competencies Admins can delete competencies; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can delete competencies" ON public.competencies FOR DELETE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4980 (class 3256 OID 21716)
-- Name: courses Admins can delete courses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can delete courses" ON public.courses FOR DELETE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4974 (class 3256 OID 21710)
-- Name: grade_levels Admins can delete grade levels; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can delete grade levels" ON public.grade_levels FOR DELETE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4971 (class 3256 OID 21707)
-- Name: periods Admins can delete periods; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can delete periods" ON public.periods FOR DELETE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4977 (class 3256 OID 21713)
-- Name: sections Admins can delete sections; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can delete sections" ON public.sections FOR DELETE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4966 (class 3256 OID 21702)
-- Name: academic_years Admins can insert academic years; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert academic years" ON public.academic_years FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4981 (class 3256 OID 21717)
-- Name: competencies Admins can insert competencies; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert competencies" ON public.competencies FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4978 (class 3256 OID 21714)
-- Name: courses Admins can insert courses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert courses" ON public.courses FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4972 (class 3256 OID 21708)
-- Name: grade_levels Admins can insert grade levels; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert grade levels" ON public.grade_levels FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4969 (class 3256 OID 21705)
-- Name: periods Admins can insert periods; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert periods" ON public.periods FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4975 (class 3256 OID 21711)
-- Name: sections Admins can insert sections; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert sections" ON public.sections FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4967 (class 3256 OID 21703)
-- Name: academic_years Admins can update academic years; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update academic years" ON public.academic_years FOR UPDATE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4982 (class 3256 OID 21718)
-- Name: competencies Admins can update competencies; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update competencies" ON public.competencies FOR UPDATE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4979 (class 3256 OID 21715)
-- Name: courses Admins can update courses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update courses" ON public.courses FOR UPDATE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4973 (class 3256 OID 21709)
-- Name: grade_levels Admins can update grade levels; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update grade levels" ON public.grade_levels FOR UPDATE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4970 (class 3256 OID 21706)
-- Name: periods Admins can update periods; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update periods" ON public.periods FOR UPDATE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 4976 (class 3256 OID 21712)
-- Name: sections Admins can update sections; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update sections" ON public.sections FOR UPDATE TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 5065 (class 3256 OID 40670)
-- Name: enrollment_applications Allow anonymous insert enrollment_applications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow anonymous insert enrollment_applications" ON public.enrollment_applications FOR INSERT TO anon WITH CHECK (true);


--
-- TOC entry 5064 (class 3256 OID 40669)
-- Name: academic_years Allow anonymous read academic_years; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow anonymous read academic_years" ON public.academic_years FOR SELECT TO anon USING (true);


--
-- TOC entry 5063 (class 3256 OID 40668)
-- Name: grade_levels Allow anonymous read grade_levels; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow anonymous read grade_levels" ON public.grade_levels FOR SELECT TO anon USING (true);


--
-- TOC entry 5066 (class 3256 OID 40671)
-- Name: enrollment_applications Allow anonymous read own enrollment_applications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow anonymous read own enrollment_applications" ON public.enrollment_applications FOR SELECT TO anon USING (true);


--
-- TOC entry 5040 (class 3256 OID 26598)
-- Name: guardians Allow authenticated all on guardians; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow authenticated all on guardians" ON public.guardians TO authenticated USING (true) WITH CHECK (true);


--
-- TOC entry 5008 (class 3256 OID 25697)
-- Name: profiles Allow authenticated inserts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow authenticated inserts" ON public.profiles FOR INSERT TO authenticated WITH CHECK (true);


--
-- TOC entry 5060 (class 3256 OID 40666)
-- Name: enrollment_applications Anyone can submit enrollment application; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Anyone can submit enrollment application" ON public.enrollment_applications FOR INSERT TO authenticated, anon WITH CHECK (true);


--
-- TOC entry 5061 (class 3256 OID 40667)
-- Name: enrollment_applications Applicants can read own applications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Applicants can read own applications" ON public.enrollment_applications FOR SELECT TO authenticated, anon USING (((guardian_email = ((current_setting('request.headers'::text, true))::json ->> 'x-applicant-email'::text)) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'secretary'::public.user_role, 'coordinator'::public.user_role])))))));


--
-- TOC entry 4945 (class 3256 OID 18123)
-- Name: academic_years Authenticated users can read academic years; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can read academic years" ON public.academic_years FOR SELECT TO authenticated USING (true);


--
-- TOC entry 4950 (class 3256 OID 18128)
-- Name: competencies Authenticated users can read competencies; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can read competencies" ON public.competencies FOR SELECT TO authenticated USING (true);


--
-- TOC entry 4949 (class 3256 OID 18127)
-- Name: courses Authenticated users can read courses; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can read courses" ON public.courses FOR SELECT TO authenticated USING (true);


--
-- TOC entry 4947 (class 3256 OID 18125)
-- Name: grade_levels Authenticated users can read grade levels; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can read grade levels" ON public.grade_levels FOR SELECT TO authenticated USING (true);


--
-- TOC entry 4946 (class 3256 OID 18124)
-- Name: periods Authenticated users can read periods; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can read periods" ON public.periods FOR SELECT TO authenticated USING (true);


--
-- TOC entry 4948 (class 3256 OID 18126)
-- Name: sections Authenticated users can read sections; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can read sections" ON public.sections FOR SELECT TO authenticated USING (true);


--
-- TOC entry 4951 (class 3256 OID 18129)
-- Name: students Authenticated users can read students; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can read students" ON public.students FOR SELECT TO authenticated USING (true);


--
-- TOC entry 5062 (class 3256 OID 25932)
-- Name: cash_closures Cashiers can manage cash closures; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Cashiers can manage cash closures" ON public.cash_closures TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'cashier'::public.user_role]))))));


--
-- TOC entry 4961 (class 3256 OID 18145)
-- Name: cash_closures Finance roles can insert cash closures; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance roles can insert cash closures" ON public.cash_closures FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['cashier'::public.user_role, 'admin'::public.user_role]))))));


--
-- TOC entry 4960 (class 3256 OID 18144)
-- Name: cash_closures Finance roles can read cash closures; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance roles can read cash closures" ON public.cash_closures FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'cashier'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role]))))));


--
-- TOC entry 5026 (class 3256 OID 25924)
-- Name: charges Finance staff can manage charges; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can manage charges" ON public.charges TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'cashier'::public.user_role]))))));


--
-- TOC entry 5033 (class 3256 OID 26204)
-- Name: discounts Finance staff can manage discounts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can manage discounts" ON public.discounts TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role]))))));


--
-- TOC entry 4992 (class 3256 OID 26198)
-- Name: fee_concepts Finance staff can manage fee concepts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can manage fee concepts" ON public.fee_concepts TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role]))))));


--
-- TOC entry 5029 (class 3256 OID 26200)
-- Name: financial_plans Finance staff can manage financial plans; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can manage financial plans" ON public.financial_plans TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role]))))));


--
-- TOC entry 5041 (class 3256 OID 25927)
-- Name: payments Finance staff can manage payments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can manage payments" ON public.payments TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'cashier'::public.user_role]))))));


--
-- TOC entry 5031 (class 3256 OID 26202)
-- Name: plan_installments Finance staff can manage plan installments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can manage plan installments" ON public.plan_installments TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role]))))));


--
-- TOC entry 5043 (class 3256 OID 25930)
-- Name: receipts Finance staff can manage receipts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can manage receipts" ON public.receipts TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'cashier'::public.user_role]))))));


--
-- TOC entry 5036 (class 3256 OID 26207)
-- Name: student_discounts Finance staff can manage student discounts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can manage student discounts" ON public.student_discounts TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role]))))));


--
-- TOC entry 5044 (class 3256 OID 25931)
-- Name: cash_closures Finance staff can read cash closures; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can read cash closures" ON public.cash_closures FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'cashier'::public.user_role]))))));


--
-- TOC entry 5032 (class 3256 OID 26203)
-- Name: discounts Finance staff can read discounts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can read discounts" ON public.discounts FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'cashier'::public.user_role]))))));


--
-- TOC entry 4991 (class 3256 OID 26197)
-- Name: fee_concepts Finance staff can read fee concepts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can read fee concepts" ON public.fee_concepts FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'cashier'::public.user_role]))))));


--
-- TOC entry 4993 (class 3256 OID 26199)
-- Name: financial_plans Finance staff can read financial plans; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can read financial plans" ON public.financial_plans FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'cashier'::public.user_role]))))));


--
-- TOC entry 5030 (class 3256 OID 26201)
-- Name: plan_installments Finance staff can read plan installments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can read plan installments" ON public.plan_installments FOR SELECT TO authenticated USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'cashier'::public.user_role]))))));


--
-- TOC entry 5034 (class 3256 OID 26205)
-- Name: student_discounts Finance staff can read student discounts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Finance staff can read student discounts" ON public.student_discounts FOR SELECT TO authenticated USING (((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'cashier'::public.user_role]))))) OR (student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))) OR (student_id IN ( SELECT sg.student_id
   FROM (public.student_guardians sg
     JOIN public.guardians g ON ((sg.guardian_id = g.id)))
  WHERE (g.user_id = auth.uid())))));


--
-- TOC entry 4963 (class 3256 OID 21654)
-- Name: attendance_justifications Guardians can insert justifications for their students; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Guardians can insert justifications for their students" ON public.attendance_justifications FOR INSERT TO authenticated WITH CHECK ((guardian_id IN ( SELECT guardians.id
   FROM public.guardians
  WHERE (guardians.user_id = auth.uid()))));


--
-- TOC entry 4952 (class 3256 OID 18130)
-- Name: guardians Guardians can read own data; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Guardians can read own data" ON public.guardians FOR SELECT TO authenticated USING ((user_id = auth.uid()));


--
-- TOC entry 4962 (class 3256 OID 21653)
-- Name: attendance_justifications Guardians can read their students' justifications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Guardians can read their students' justifications" ON public.attendance_justifications FOR SELECT TO authenticated USING (((guardian_id IN ( SELECT guardians.id
   FROM public.guardians
  WHERE (guardians.user_id = auth.uid()))) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'secretary'::public.user_role, 'coordinator'::public.user_role])))))));


--
-- TOC entry 4953 (class 3256 OID 18131)
-- Name: student_guardians Guardians can see their students; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Guardians can see their students" ON public.student_guardians FOR SELECT TO authenticated USING ((guardian_id IN ( SELECT guardians.id
   FROM public.guardians
  WHERE (guardians.user_id = auth.uid()))));


--
-- TOC entry 4964 (class 3256 OID 21655)
-- Name: attendance_justifications Guardians can update pending justifications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Guardians can update pending justifications" ON public.attendance_justifications FOR UPDATE TO authenticated USING ((((guardian_id IN ( SELECT guardians.id
   FROM public.guardians
  WHERE (guardians.user_id = auth.uid()))) AND (status = 'pendiente'::public.justification_status)) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'secretary'::public.user_role])))))));


--
-- TOC entry 5051 (class 3256 OID 34911)
-- Name: course_schedules Guardians can view their children schedules; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Guardians can view their children schedules" ON public.course_schedules FOR SELECT TO authenticated USING ((section_id IN ( SELECT s.section_id
   FROM ((public.students s
     JOIN public.student_guardians sg ON ((s.id = sg.student_id)))
     JOIN public.guardians g ON ((sg.guardian_id = g.id)))
  WHERE ((g.user_id = auth.uid()) AND (s.section_id IS NOT NULL)))));


--
-- TOC entry 5059 (class 3256 OID 40665)
-- Name: academic_years Public can read academic years; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public can read academic years" ON public.academic_years FOR SELECT TO anon USING (true);


--
-- TOC entry 5058 (class 3256 OID 40664)
-- Name: grade_levels Public can read grade levels; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public can read grade levels" ON public.grade_levels FOR SELECT TO anon USING (true);


--
-- TOC entry 4989 (class 3256 OID 21725)
-- Name: assignment_submissions Students can insert submissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Students can insert submissions" ON public.assignment_submissions FOR INSERT TO authenticated WITH CHECK ((student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))));


--
-- TOC entry 4958 (class 3256 OID 18136)
-- Name: assignment_submissions Students can manage own submissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Students can manage own submissions" ON public.assignment_submissions TO authenticated USING (((student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['teacher'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role])))))));


--
-- TOC entry 4990 (class 3256 OID 21726)
-- Name: assignment_submissions Students can update own submissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Students can update own submissions" ON public.assignment_submissions FOR UPDATE TO authenticated USING (((student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))) OR (reviewed_by = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['teacher'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role])))))));


--
-- TOC entry 5050 (class 3256 OID 34910)
-- Name: course_schedules Students can view their section schedules; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Students can view their section schedules" ON public.course_schedules FOR SELECT TO authenticated USING ((section_id IN ( SELECT students.section_id
   FROM public.students
  WHERE ((students.user_id = auth.uid()) AND (students.section_id IS NOT NULL)))));


--
-- TOC entry 4999 (class 3256 OID 22007)
-- Name: audit_logs System can insert audit logs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "System can insert audit logs" ON public.audit_logs FOR INSERT TO authenticated WITH CHECK (true);


--
-- TOC entry 5046 (class 3256 OID 26857)
-- Name: messages Teachers and guardians can insert messages; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers and guardians can insert messages" ON public.messages FOR INSERT TO authenticated WITH CHECK (((sender_id = auth.uid()) AND (((sender_role = 'teacher'::text) AND (EXISTS ( SELECT 1
   FROM ((public.teachers t
     JOIN public.teacher_course_assignments tca ON ((tca.teacher_id = t.id)))
     JOIN public.students s ON ((s.section_id = tca.section_id)))
  WHERE ((t.user_id = auth.uid()) AND (s.id = messages.student_id))))) OR ((sender_role = 'guardian'::text) AND (EXISTS ( SELECT 1
   FROM (public.guardians g
     JOIN public.student_guardians sg ON ((sg.guardian_id = g.id)))
  WHERE ((g.user_id = auth.uid()) AND (sg.student_id = messages.student_id))))))));


--
-- TOC entry 5045 (class 3256 OID 26855)
-- Name: messages Teachers and guardians can read relevant messages; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers and guardians can read relevant messages" ON public.messages FOR SELECT TO authenticated USING (((EXISTS ( SELECT 1
   FROM ((public.teachers t
     JOIN public.teacher_course_assignments tca ON ((tca.teacher_id = t.id)))
     JOIN public.students s ON ((s.section_id = tca.section_id)))
  WHERE ((t.user_id = auth.uid()) AND (s.id = messages.student_id)))) OR (EXISTS ( SELECT 1
   FROM (public.guardians g
     JOIN public.student_guardians sg ON ((sg.guardian_id = g.id)))
  WHERE ((g.user_id = auth.uid()) AND (sg.student_id = messages.student_id)))) OR (sender_id = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role])))))));


--
-- TOC entry 4988 (class 3256 OID 21724)
-- Name: assignments Teachers can delete assignments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers can delete assignments" ON public.assignments FOR DELETE TO authenticated USING (((created_by = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role])))))));


--
-- TOC entry 4986 (class 3256 OID 21722)
-- Name: assignments Teachers can insert assignments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers can insert assignments" ON public.assignments FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['teacher'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role]))))));


--
-- TOC entry 4984 (class 3256 OID 21720)
-- Name: evaluations Teachers can insert evaluations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers can insert evaluations" ON public.evaluations FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['teacher'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role]))))));


--
-- TOC entry 4955 (class 3256 OID 18133)
-- Name: attendance Teachers can manage attendance; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers can manage attendance" ON public.attendance TO authenticated USING (((recorded_by = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['teacher'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role])))))));


--
-- TOC entry 4954 (class 3256 OID 18132)
-- Name: teachers Teachers can read own data; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers can read own data" ON public.teachers FOR SELECT TO authenticated USING (((user_id = auth.uid()) OR true));


--
-- TOC entry 4987 (class 3256 OID 21723)
-- Name: assignments Teachers can update assignments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers can update assignments" ON public.assignments FOR UPDATE TO authenticated USING (((created_by = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role])))))));


--
-- TOC entry 4985 (class 3256 OID 21721)
-- Name: evaluations Teachers can update evaluations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers can update evaluations" ON public.evaluations FOR UPDATE TO authenticated USING (((recorded_by = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role])))))));


--
-- TOC entry 5049 (class 3256 OID 34909)
-- Name: course_schedules Teachers can view their schedules; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Teachers can view their schedules" ON public.course_schedules FOR SELECT TO authenticated USING ((teacher_id IN ( SELECT teachers.id
   FROM public.teachers
  WHERE (teachers.user_id = auth.uid()))));


--
-- TOC entry 4998 (class 3256 OID 22006)
-- Name: audit_logs Users can read own audit logs; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read own audit logs" ON public.audit_logs FOR SELECT TO authenticated USING ((user_id = auth.uid()));


--
-- TOC entry 4995 (class 3256 OID 21969)
-- Name: notifications Users can read own notifications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read own notifications" ON public.notifications FOR SELECT TO authenticated USING ((user_id = auth.uid()));


--
-- TOC entry 5007 (class 3256 OID 25696)
-- Name: profiles Users can read own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read own profile" ON public.profiles FOR SELECT TO authenticated USING ((id = auth.uid()));


--
-- TOC entry 4959 (class 3256 OID 18137)
-- Name: announcements Users can read published announcements; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read published announcements" ON public.announcements FOR SELECT TO authenticated USING (((status = 'publicado'::public.announcement_status) OR (created_by = auth.uid())));


--
-- TOC entry 4957 (class 3256 OID 18135)
-- Name: assignments Users can read relevant assignments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read relevant assignments" ON public.assignments FOR SELECT TO authenticated USING (true);


--
-- TOC entry 5021 (class 3256 OID 25922)
-- Name: charges Users can read relevant charges; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read relevant charges" ON public.charges FOR SELECT TO authenticated USING (((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'cashier'::public.user_role]))))) OR (student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))) OR (student_id IN ( SELECT sg.student_id
   FROM (public.student_guardians sg
     JOIN public.guardians g ON ((sg.guardian_id = g.id)))
  WHERE (g.user_id = auth.uid())))));


--
-- TOC entry 4956 (class 3256 OID 18134)
-- Name: evaluations Users can read relevant evaluations; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read relevant evaluations" ON public.evaluations FOR SELECT TO authenticated USING (((status = 'publicada'::public.evaluation_status) OR (recorded_by = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'teacher'::public.user_role])))))));


--
-- TOC entry 5027 (class 3256 OID 25925)
-- Name: payments Users can read relevant payments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read relevant payments" ON public.payments FOR SELECT TO authenticated USING (((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'cashier'::public.user_role]))))) OR (student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))) OR (student_id IN ( SELECT sg.student_id
   FROM (public.student_guardians sg
     JOIN public.guardians g ON ((sg.guardian_id = g.id)))
  WHERE (g.user_id = auth.uid())))));


--
-- TOC entry 5042 (class 3256 OID 25928)
-- Name: receipts Users can read relevant receipts; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can read relevant receipts" ON public.receipts FOR SELECT TO authenticated USING (((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['finance'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'cashier'::public.user_role]))))) OR (student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))) OR (student_id IN ( SELECT sg.student_id
   FROM (public.student_guardians sg
     JOIN public.guardians g ON ((sg.guardian_id = g.id)))
  WHERE (g.user_id = auth.uid())))));


--
-- TOC entry 5047 (class 3256 OID 26859)
-- Name: messages Users can update message read status; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update message read status" ON public.messages FOR UPDATE TO authenticated USING (((EXISTS ( SELECT 1
   FROM ((public.teachers t
     JOIN public.teacher_course_assignments tca ON ((tca.teacher_id = t.id)))
     JOIN public.students s ON ((s.section_id = tca.section_id)))
  WHERE ((t.user_id = auth.uid()) AND (s.id = messages.student_id)))) OR (EXISTS ( SELECT 1
   FROM (public.guardians g
     JOIN public.student_guardians sg ON ((sg.guardian_id = g.id)))
  WHERE ((g.user_id = auth.uid()) AND (sg.student_id = messages.student_id))))));


--
-- TOC entry 4996 (class 3256 OID 21970)
-- Name: notifications Users can update own notifications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own notifications" ON public.notifications FOR UPDATE TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- TOC entry 5014 (class 3256 OID 25698)
-- Name: profiles Users can update own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update own profile" ON public.profiles FOR UPDATE TO authenticated USING ((id = auth.uid()));


--
-- TOC entry 4911 (class 0 OID 17541)
-- Dependencies: 381
-- Name: academic_years; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.academic_years ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 5019 (class 3256 OID 23180)
-- Name: teacher_course_assignments admin_create_assignments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY admin_create_assignments ON public.teacher_course_assignments FOR INSERT TO authenticated WITH CHECK ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text, 'coordinator'::text])));


--
-- TOC entry 5016 (class 3256 OID 23118)
-- Name: enrollment_applications admin_delete_applications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY admin_delete_applications ON public.enrollment_applications FOR DELETE TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text])));


--
-- TOC entry 5001 (class 3256 OID 23182)
-- Name: teacher_course_assignments admin_delete_assignments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY admin_delete_assignments ON public.teacher_course_assignments FOR DELETE TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text])));


--
-- TOC entry 5017 (class 3256 OID 23178)
-- Name: teacher_course_assignments admin_director_view_all_assignments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY admin_director_view_all_assignments ON public.teacher_course_assignments FOR SELECT TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text, 'coordinator'::text])));


--
-- TOC entry 5028 (class 3256 OID 23447)
-- Name: student_course_enrollments admin_staff_manage_enrollments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY admin_staff_manage_enrollments ON public.student_course_enrollments TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text, 'coordinator'::text, 'secretary'::text]))) WITH CHECK ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text, 'coordinator'::text, 'secretary'::text])));


--
-- TOC entry 5022 (class 3256 OID 23441)
-- Name: student_course_enrollments admin_staff_view_all_enrollments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY admin_staff_view_all_enrollments ON public.student_course_enrollments FOR SELECT TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text, 'coordinator'::text, 'secretary'::text])));


--
-- TOC entry 5020 (class 3256 OID 23181)
-- Name: teacher_course_assignments admin_update_assignments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY admin_update_assignments ON public.teacher_course_assignments FOR UPDATE TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text, 'coordinator'::text])));


--
-- TOC entry 4925 (class 0 OID 17947)
-- Dependencies: 396
-- Name: announcements; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.announcements ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 5039 (class 3256 OID 24828)
-- Name: announcements announcements_delete_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY announcements_delete_policy ON public.announcements FOR DELETE TO authenticated USING ((((created_by = auth.uid()) AND (status = 'borrador'::public.announcement_status)) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role])))))));


--
-- TOC entry 5037 (class 3256 OID 24825)
-- Name: announcements announcements_insert_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY announcements_insert_policy ON public.announcements FOR INSERT TO authenticated WITH CHECK (((created_by = auth.uid()) AND (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['teacher'::public.user_role, 'admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role])))))));


--
-- TOC entry 5035 (class 3256 OID 24824)
-- Name: announcements announcements_select_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY announcements_select_policy ON public.announcements FOR SELECT TO authenticated USING (((status = 'publicado'::public.announcement_status) OR (created_by = auth.uid()) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role])))))));


--
-- TOC entry 5038 (class 3256 OID 24826)
-- Name: announcements announcements_update_policy; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY announcements_update_policy ON public.announcements FOR UPDATE TO authenticated USING ((((created_by = auth.uid()) AND (status = ANY (ARRAY['borrador'::public.announcement_status, 'pendiente_aprobacion'::public.announcement_status]))) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role]))))))) WITH CHECK ((((created_by = auth.uid()) AND (status = ANY (ARRAY['borrador'::public.announcement_status, 'pendiente_aprobacion'::public.announcement_status]))) OR (EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'coordinator'::public.user_role])))))));


--
-- TOC entry 4924 (class 0 OID 17897)
-- Dependencies: 395
-- Name: assignment_submissions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.assignment_submissions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4923 (class 0 OID 17861)
-- Dependencies: 394
-- Name: assignments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.assignments ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4921 (class 0 OID 17771)
-- Dependencies: 392
-- Name: attendance; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.attendance ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4930 (class 0 OID 21617)
-- Dependencies: 401
-- Name: attendance_justifications; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.attendance_justifications ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4932 (class 0 OID 21987)
-- Dependencies: 403
-- Name: audit_logs; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4929 (class 0 OID 18089)
-- Dependencies: 400
-- Name: cash_closures; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.cash_closures ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4926 (class 0 OID 17997)
-- Dependencies: 397
-- Name: charges; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.charges ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4916 (class 0 OID 17625)
-- Dependencies: 386
-- Name: competencies; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.competencies ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4920 (class 0 OID 17731)
-- Dependencies: 391
-- Name: course_assignments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.course_assignments ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4943 (class 0 OID 34872)
-- Dependencies: 424
-- Name: course_schedules; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.course_schedules ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4915 (class 0 OID 17608)
-- Dependencies: 385
-- Name: courses; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.courses ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4940 (class 0 OID 26146)
-- Dependencies: 413
-- Name: discounts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.discounts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4934 (class 0 OID 23073)
-- Dependencies: 405
-- Name: enrollment_applications; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.enrollment_applications ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4922 (class 0 OID 17823)
-- Dependencies: 393
-- Name: evaluations; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.evaluations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4937 (class 0 OID 26093)
-- Dependencies: 410
-- Name: fee_concepts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.fee_concepts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4938 (class 0 OID 26106)
-- Dependencies: 411
-- Name: financial_plans; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.financial_plans ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4913 (class 0 OID 17575)
-- Dependencies: 383
-- Name: grade_levels; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.grade_levels ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 5025 (class 3256 OID 23445)
-- Name: student_course_enrollments guardians_view_children_enrollments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY guardians_view_children_enrollments ON public.student_course_enrollments FOR SELECT TO authenticated USING ((student_id IN ( SELECT s.id
   FROM ((public.students s
     JOIN public.student_guardians sg ON ((sg.student_id = s.id)))
     JOIN public.guardians g ON ((g.id = sg.guardian_id)))
  WHERE (g.user_id = auth.uid()))));


--
-- TOC entry 5005 (class 3256 OID 23072)
-- Name: task_submissions guardians_view_children_submissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY guardians_view_children_submissions ON public.task_submissions FOR SELECT TO authenticated USING ((student_id IN ( SELECT sg.student_id
   FROM (public.student_guardians sg
     JOIN public.guardians g ON ((g.id = sg.guardian_id)))
  WHERE (g.user_id = auth.uid()))));


--
-- TOC entry 5013 (class 3256 OID 23116)
-- Name: enrollment_applications guardians_view_own_applications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY guardians_view_own_applications ON public.enrollment_applications FOR SELECT TO authenticated USING ((guardian_email = ( SELECT profiles.email
   FROM public.profiles
  WHERE (profiles.id = auth.uid()))));


--
-- TOC entry 4942 (class 0 OID 26834)
-- Dependencies: 416
-- Name: messages; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4931 (class 0 OID 21951)
-- Dependencies: 402
-- Name: notifications; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4927 (class 0 OID 18037)
-- Dependencies: 398
-- Name: payments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4912 (class 0 OID 17551)
-- Dependencies: 382
-- Name: periods; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.periods ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4939 (class 0 OID 26128)
-- Dependencies: 412
-- Name: plan_installments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.plan_installments ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4910 (class 0 OID 17523)
-- Dependencies: 380
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 5011 (class 3256 OID 22264)
-- Name: profiles profiles_insert; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY profiles_insert ON public.profiles FOR INSERT TO authenticated WITH CHECK ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text])));


--
-- TOC entry 5010 (class 3256 OID 22263)
-- Name: profiles profiles_select; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY profiles_select ON public.profiles FOR SELECT TO authenticated USING (((id = auth.uid()) OR (public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text]))));


--
-- TOC entry 5012 (class 3256 OID 22265)
-- Name: profiles profiles_update; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY profiles_update ON public.profiles FOR UPDATE TO authenticated USING (((id = auth.uid()) OR (public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text])))) WITH CHECK (((id = auth.uid()) OR (public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text]))));


--
-- TOC entry 5006 (class 3256 OID 23114)
-- Name: enrollment_applications public_can_create_applications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY public_can_create_applications ON public.enrollment_applications FOR INSERT TO authenticated, anon WITH CHECK (true);


--
-- TOC entry 4944 (class 0 OID 40625)
-- Dependencies: 425
-- Name: public_news; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.public_news ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 5057 (class 3256 OID 40659)
-- Name: public_news public_news_delete; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY public_news_delete ON public.public_news FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::public.user_role)))));


--
-- TOC entry 5055 (class 3256 OID 40657)
-- Name: public_news public_news_insert; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY public_news_insert ON public.public_news FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'web_editor'::public.user_role]))))));


--
-- TOC entry 5054 (class 3256 OID 40656)
-- Name: public_news public_news_select_all_for_admin; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY public_news_select_all_for_admin ON public.public_news FOR SELECT USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'web_editor'::public.user_role]))))));


--
-- TOC entry 5053 (class 3256 OID 40655)
-- Name: public_news public_news_select_published; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY public_news_select_published ON public.public_news FOR SELECT USING ((status = 'publicado'::public.public_news_status));


--
-- TOC entry 5056 (class 3256 OID 40658)
-- Name: public_news public_news_update; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY public_news_update ON public.public_news FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::public.user_role, 'director'::public.user_role, 'web_editor'::public.user_role]))))));


--
-- TOC entry 4928 (class 0 OID 18062)
-- Dependencies: 399
-- Name: receipts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.receipts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4914 (class 0 OID 17586)
-- Dependencies: 384
-- Name: sections; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.sections ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 5015 (class 3256 OID 23117)
-- Name: enrollment_applications staff_update_applications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY staff_update_applications ON public.enrollment_applications FOR UPDATE TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text, 'secretary'::text, 'coordinator'::text]))) WITH CHECK ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text, 'secretary'::text, 'coordinator'::text])));


--
-- TOC entry 5009 (class 3256 OID 23115)
-- Name: enrollment_applications staff_view_all_applications; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY staff_view_all_applications ON public.enrollment_applications FOR SELECT TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['admin'::text, 'director'::text, 'secretary'::text, 'coordinator'::text])));


--
-- TOC entry 4936 (class 0 OID 23206)
-- Dependencies: 409
-- Name: student_course_enrollments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.student_course_enrollments ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4941 (class 0 OID 26164)
-- Dependencies: 414
-- Name: student_discounts; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.student_discounts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4918 (class 0 OID 17688)
-- Dependencies: 389
-- Name: student_guardians; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.student_guardians ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4917 (class 0 OID 17642)
-- Dependencies: 387
-- Name: students; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.students ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 5000 (class 3256 OID 23067)
-- Name: task_submissions students_insert_own_submissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY students_insert_own_submissions ON public.task_submissions FOR INSERT TO authenticated WITH CHECK ((student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))));


--
-- TOC entry 5002 (class 3256 OID 23068)
-- Name: task_submissions students_update_own_submissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY students_update_own_submissions ON public.task_submissions FOR UPDATE TO authenticated USING (((student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))) AND (status = ANY (ARRAY['draft'::text, 'submitted'::text])))) WITH CHECK ((student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))));


--
-- TOC entry 5024 (class 3256 OID 23444)
-- Name: student_course_enrollments students_view_own_enrollments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY students_view_own_enrollments ON public.student_course_enrollments FOR SELECT TO authenticated USING ((student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))));


--
-- TOC entry 4994 (class 3256 OID 23066)
-- Name: task_submissions students_view_own_submissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY students_view_own_submissions ON public.task_submissions FOR SELECT TO authenticated USING ((student_id IN ( SELECT students.id
   FROM public.students
  WHERE (students.user_id = auth.uid()))));


--
-- TOC entry 4933 (class 0 OID 23029)
-- Dependencies: 404
-- Name: task_submissions; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.task_submissions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4935 (class 0 OID 23119)
-- Dependencies: 406
-- Name: teacher_course_assignments; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.teacher_course_assignments ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4919 (class 0 OID 17708)
-- Dependencies: 390
-- Name: teachers; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.teachers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 5004 (class 3256 OID 23071)
-- Name: task_submissions teachers_update_submissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY teachers_update_submissions ON public.task_submissions FOR UPDATE TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['teacher'::text, 'admin'::text, 'director'::text, 'coordinator'::text]))) WITH CHECK ((public.get_user_role(auth.uid()) = ANY (ARRAY['teacher'::text, 'admin'::text, 'director'::text, 'coordinator'::text])));


--
-- TOC entry 5018 (class 3256 OID 23179)
-- Name: teacher_course_assignments teachers_view_own_assignments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY teachers_view_own_assignments ON public.teacher_course_assignments FOR SELECT TO authenticated USING ((teacher_id IN ( SELECT teachers.id
   FROM public.teachers
  WHERE (teachers.user_id = auth.uid()))));


--
-- TOC entry 5003 (class 3256 OID 23070)
-- Name: task_submissions teachers_view_submissions; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY teachers_view_submissions ON public.task_submissions FOR SELECT TO authenticated USING ((public.get_user_role(auth.uid()) = ANY (ARRAY['teacher'::text, 'admin'::text, 'director'::text, 'coordinator'::text])));


--
-- TOC entry 5023 (class 3256 OID 23442)
-- Name: student_course_enrollments teachers_view_their_course_enrollments; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY teachers_view_their_course_enrollments ON public.student_course_enrollments FOR SELECT TO authenticated USING ((course_id IN ( SELECT tca.course_id
   FROM (public.teacher_course_assignments tca
     JOIN public.teachers t ON ((t.id = tca.teacher_id)))
  WHERE ((t.user_id = auth.uid()) AND (tca.is_active = true)))));


--
-- TOC entry 4909 (class 0 OID 17473)
-- Dependencies: 379
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4889 (class 0 OID 16546)
-- Dependencies: 347
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4906 (class 0 OID 17242)
-- Dependencies: 370
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4907 (class 0 OID 17269)
-- Dependencies: 371
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4891 (class 0 OID 16588)
-- Dependencies: 349
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4890 (class 0 OID 16561)
-- Dependencies: 348
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4905 (class 0 OID 17197)
-- Dependencies: 369
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4903 (class 0 OID 17144)
-- Dependencies: 367
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4904 (class 0 OID 17158)
-- Dependencies: 368
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4908 (class 0 OID 17279)
-- Dependencies: 372
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 5067 (class 6104 OID 16426)
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- TOC entry 5068 (class 6104 OID 22158)
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- TOC entry 5069 (class 6106 OID 22159)
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 35
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 22
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 127
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 12
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 36
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 30
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 479
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 489
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 435
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 450
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 488
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 538
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 520
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 505
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 506
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 472
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 551
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 529
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 462
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 444
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 534
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 437
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 577
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 574
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 527
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 504
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 468
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 443
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 563
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 542
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 570
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 532
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 476
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 474
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 556
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 430
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 558
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 446
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 567
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 565
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 483
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 477
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 460
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 553
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 555
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 480
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 557
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 554
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 576
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 495
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 449
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 559
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 428
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 543
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 441
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 485
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 546
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 429
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 448
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 458
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 521
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 461
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 561
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 509
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 523
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 564
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 445
-- Name: FUNCTION pg_reload_conf(); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pg_catalog.pg_reload_conf() TO postgres WITH GRANT OPTION;


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 482
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 464
-- Name: FUNCTION activate_user(p_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.activate_user(p_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.activate_user(p_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.activate_user(p_user_id uuid) TO service_role;


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 427
-- Name: FUNCTION approve_enrollment_application(p_application_id uuid, p_section_id uuid, p_approved_by uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.approve_enrollment_application(p_application_id uuid, p_section_id uuid, p_approved_by uuid) TO anon;
GRANT ALL ON FUNCTION public.approve_enrollment_application(p_application_id uuid, p_section_id uuid, p_approved_by uuid) TO authenticated;
GRANT ALL ON FUNCTION public.approve_enrollment_application(p_application_id uuid, p_section_id uuid, p_approved_by uuid) TO service_role;


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 524
-- Name: FUNCTION audit_and_notify_payment(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.audit_and_notify_payment() TO anon;
GRANT ALL ON FUNCTION public.audit_and_notify_payment() TO authenticated;
GRANT ALL ON FUNCTION public.audit_and_notify_payment() TO service_role;


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 562
-- Name: FUNCTION audit_evaluation_changes(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.audit_evaluation_changes() TO anon;
GRANT ALL ON FUNCTION public.audit_evaluation_changes() TO authenticated;
GRANT ALL ON FUNCTION public.audit_evaluation_changes() TO service_role;


--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 465
-- Name: FUNCTION auto_enroll_student_to_section_courses(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.auto_enroll_student_to_section_courses() TO anon;
GRANT ALL ON FUNCTION public.auto_enroll_student_to_section_courses() TO authenticated;
GRANT ALL ON FUNCTION public.auto_enroll_student_to_section_courses() TO service_role;


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 432
-- Name: FUNCTION check_schedule_overlap(p_section_id uuid, p_day_of_week integer, p_start_time time without time zone, p_end_time time without time zone, p_schedule_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.check_schedule_overlap(p_section_id uuid, p_day_of_week integer, p_start_time time without time zone, p_end_time time without time zone, p_schedule_id uuid) TO anon;
GRANT ALL ON FUNCTION public.check_schedule_overlap(p_section_id uuid, p_day_of_week integer, p_start_time time without time zone, p_end_time time without time zone, p_schedule_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.check_schedule_overlap(p_section_id uuid, p_day_of_week integer, p_start_time time without time zone, p_end_time time without time zone, p_schedule_id uuid) TO service_role;


--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 510
-- Name: FUNCTION create_audit_log(p_user_id uuid, p_action public.audit_action, p_entity_type text, p_entity_id uuid, p_old_values jsonb, p_new_values jsonb, p_reason text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_audit_log(p_user_id uuid, p_action public.audit_action, p_entity_type text, p_entity_id uuid, p_old_values jsonb, p_new_values jsonb, p_reason text) TO anon;
GRANT ALL ON FUNCTION public.create_audit_log(p_user_id uuid, p_action public.audit_action, p_entity_type text, p_entity_id uuid, p_old_values jsonb, p_new_values jsonb, p_reason text) TO authenticated;
GRANT ALL ON FUNCTION public.create_audit_log(p_user_id uuid, p_action public.audit_action, p_entity_type text, p_entity_id uuid, p_old_values jsonb, p_new_values jsonb, p_reason text) TO service_role;


--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 459
-- Name: FUNCTION create_notification(p_user_id uuid, p_type public.notification_type, p_title text, p_message text, p_entity_type text, p_entity_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_notification(p_user_id uuid, p_type public.notification_type, p_title text, p_message text, p_entity_type text, p_entity_id uuid) TO anon;
GRANT ALL ON FUNCTION public.create_notification(p_user_id uuid, p_type public.notification_type, p_title text, p_message text, p_entity_type text, p_entity_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.create_notification(p_user_id uuid, p_type public.notification_type, p_title text, p_message text, p_entity_type text, p_entity_id uuid) TO service_role;


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 473
-- Name: FUNCTION create_user_with_profile(p_email text, p_password text, p_role text, p_first_name text, p_last_name text, p_created_by uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_user_with_profile(p_email text, p_password text, p_role text, p_first_name text, p_last_name text, p_created_by uuid) TO anon;
GRANT ALL ON FUNCTION public.create_user_with_profile(p_email text, p_password text, p_role text, p_first_name text, p_last_name text, p_created_by uuid) TO authenticated;
GRANT ALL ON FUNCTION public.create_user_with_profile(p_email text, p_password text, p_role text, p_first_name text, p_last_name text, p_created_by uuid) TO service_role;


--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 539
-- Name: FUNCTION deactivate_user(p_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.deactivate_user(p_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.deactivate_user(p_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.deactivate_user(p_user_id uuid) TO service_role;


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 514
-- Name: FUNCTION generate_news_slug(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.generate_news_slug() TO anon;
GRANT ALL ON FUNCTION public.generate_news_slug() TO authenticated;
GRANT ALL ON FUNCTION public.generate_news_slug() TO service_role;


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 434
-- Name: FUNCTION get_teacher_course_load(p_teacher_id uuid, p_academic_year_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_teacher_course_load(p_teacher_id uuid, p_academic_year_id uuid) TO anon;
GRANT ALL ON FUNCTION public.get_teacher_course_load(p_teacher_id uuid, p_academic_year_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_teacher_course_load(p_teacher_id uuid, p_academic_year_id uuid) TO service_role;


--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 426
-- Name: FUNCTION get_user_role(user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_user_role(user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.get_user_role(user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_user_role(user_id uuid) TO service_role;


--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 522
-- Name: FUNCTION notify_justification_status(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.notify_justification_status() TO anon;
GRANT ALL ON FUNCTION public.notify_justification_status() TO authenticated;
GRANT ALL ON FUNCTION public.notify_justification_status() TO service_role;


--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 451
-- Name: FUNCTION sync_student_enrollments_on_teacher_assignment(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.sync_student_enrollments_on_teacher_assignment() TO anon;
GRANT ALL ON FUNCTION public.sync_student_enrollments_on_teacher_assignment() TO authenticated;
GRANT ALL ON FUNCTION public.sync_student_enrollments_on_teacher_assignment() TO service_role;


--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 456
-- Name: FUNCTION unaccent(text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent(text) TO postgres;
GRANT ALL ON FUNCTION public.unaccent(text) TO anon;
GRANT ALL ON FUNCTION public.unaccent(text) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent(text) TO service_role;


--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 502
-- Name: FUNCTION unaccent(regdictionary, text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO postgres;
GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO anon;
GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent(regdictionary, text) TO service_role;


--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 541
-- Name: FUNCTION unaccent_init(internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent_init(internal) TO postgres;
GRANT ALL ON FUNCTION public.unaccent_init(internal) TO anon;
GRANT ALL ON FUNCTION public.unaccent_init(internal) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent_init(internal) TO service_role;


--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 493
-- Name: FUNCTION unaccent_lexize(internal, internal, internal, internal); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO postgres;
GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO anon;
GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO authenticated;
GRANT ALL ON FUNCTION public.unaccent_lexize(internal, internal, internal, internal) TO service_role;


--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 442
-- Name: FUNCTION update_course_schedules_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_course_schedules_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_course_schedules_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_course_schedules_updated_at() TO service_role;


--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 499
-- Name: FUNCTION update_enrollment_applications_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_enrollment_applications_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_enrollment_applications_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_enrollment_applications_updated_at() TO service_role;


--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 492
-- Name: FUNCTION update_profiles_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_profiles_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_profiles_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_profiles_updated_at() TO service_role;


--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 560
-- Name: FUNCTION update_public_news_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_public_news_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_public_news_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_public_news_updated_at() TO service_role;


--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 481
-- Name: FUNCTION update_student_course_enrollments_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_student_course_enrollments_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_student_course_enrollments_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_student_course_enrollments_updated_at() TO service_role;


--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 501
-- Name: FUNCTION update_task_submissions_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_task_submissions_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_task_submissions_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_task_submissions_updated_at() TO service_role;


--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 569
-- Name: FUNCTION update_teacher_assignments_updated_at(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.update_teacher_assignments_updated_at() TO anon;
GRANT ALL ON FUNCTION public.update_teacher_assignments_updated_at() TO authenticated;
GRANT ALL ON FUNCTION public.update_teacher_assignments_updated_at() TO service_role;


--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 454
-- Name: FUNCTION validate_teacher_course_limit(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.validate_teacher_course_limit() TO anon;
GRANT ALL ON FUNCTION public.validate_teacher_course_limit() TO authenticated;
GRANT ALL ON FUNCTION public.validate_teacher_course_limit() TO service_role;


--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 513
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 433
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 470
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 436
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 533
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 571
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 457
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 491
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 516
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 573
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 500
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 431
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 453
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 440
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 503
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 345
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 362
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 353
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 344
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 357
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 356
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 355
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 365
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 419
-- Name: TABLE oauth_client_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_client_states TO postgres;
GRANT ALL ON TABLE auth.oauth_client_states TO dashboard_user;


--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 364
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 366
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 363
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 343
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- TOC entry 5230 (class 0 OID 0)
-- Dependencies: 342
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 360
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 361
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 346
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 354
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 359
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 358
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- TOC entry 5249 (class 0 OID 0)
-- Dependencies: 341
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- TOC entry 5250 (class 0 OID 0)
-- Dependencies: 340
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- TOC entry 5251 (class 0 OID 0)
-- Dependencies: 339
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- TOC entry 5252 (class 0 OID 0)
-- Dependencies: 381
-- Name: TABLE academic_years; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.academic_years TO anon;
GRANT ALL ON TABLE public.academic_years TO authenticated;
GRANT ALL ON TABLE public.academic_years TO service_role;


--
-- TOC entry 5253 (class 0 OID 0)
-- Dependencies: 396
-- Name: TABLE announcements; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.announcements TO anon;
GRANT ALL ON TABLE public.announcements TO authenticated;
GRANT ALL ON TABLE public.announcements TO service_role;


--
-- TOC entry 5254 (class 0 OID 0)
-- Dependencies: 395
-- Name: TABLE assignment_submissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.assignment_submissions TO anon;
GRANT ALL ON TABLE public.assignment_submissions TO authenticated;
GRANT ALL ON TABLE public.assignment_submissions TO service_role;


--
-- TOC entry 5255 (class 0 OID 0)
-- Dependencies: 394
-- Name: TABLE assignments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.assignments TO anon;
GRANT ALL ON TABLE public.assignments TO authenticated;
GRANT ALL ON TABLE public.assignments TO service_role;


--
-- TOC entry 5256 (class 0 OID 0)
-- Dependencies: 392
-- Name: TABLE attendance; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.attendance TO anon;
GRANT ALL ON TABLE public.attendance TO authenticated;
GRANT ALL ON TABLE public.attendance TO service_role;


--
-- TOC entry 5257 (class 0 OID 0)
-- Dependencies: 401
-- Name: TABLE attendance_justifications; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.attendance_justifications TO anon;
GRANT ALL ON TABLE public.attendance_justifications TO authenticated;
GRANT ALL ON TABLE public.attendance_justifications TO service_role;


--
-- TOC entry 5258 (class 0 OID 0)
-- Dependencies: 403
-- Name: TABLE audit_logs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.audit_logs TO anon;
GRANT ALL ON TABLE public.audit_logs TO authenticated;
GRANT ALL ON TABLE public.audit_logs TO service_role;


--
-- TOC entry 5259 (class 0 OID 0)
-- Dependencies: 400
-- Name: TABLE cash_closures; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cash_closures TO anon;
GRANT ALL ON TABLE public.cash_closures TO authenticated;
GRANT ALL ON TABLE public.cash_closures TO service_role;


--
-- TOC entry 5260 (class 0 OID 0)
-- Dependencies: 397
-- Name: TABLE charges; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.charges TO anon;
GRANT ALL ON TABLE public.charges TO authenticated;
GRANT ALL ON TABLE public.charges TO service_role;


--
-- TOC entry 5261 (class 0 OID 0)
-- Dependencies: 386
-- Name: TABLE competencies; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.competencies TO anon;
GRANT ALL ON TABLE public.competencies TO authenticated;
GRANT ALL ON TABLE public.competencies TO service_role;


--
-- TOC entry 5262 (class 0 OID 0)
-- Dependencies: 391
-- Name: TABLE course_assignments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.course_assignments TO anon;
GRANT ALL ON TABLE public.course_assignments TO authenticated;
GRANT ALL ON TABLE public.course_assignments TO service_role;


--
-- TOC entry 5266 (class 0 OID 0)
-- Dependencies: 424
-- Name: TABLE course_schedules; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.course_schedules TO anon;
GRANT ALL ON TABLE public.course_schedules TO authenticated;
GRANT ALL ON TABLE public.course_schedules TO service_role;


--
-- TOC entry 5268 (class 0 OID 0)
-- Dependencies: 385
-- Name: TABLE courses; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.courses TO anon;
GRANT ALL ON TABLE public.courses TO authenticated;
GRANT ALL ON TABLE public.courses TO service_role;


--
-- TOC entry 5269 (class 0 OID 0)
-- Dependencies: 413
-- Name: TABLE discounts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.discounts TO anon;
GRANT ALL ON TABLE public.discounts TO authenticated;
GRANT ALL ON TABLE public.discounts TO service_role;


--
-- TOC entry 5270 (class 0 OID 0)
-- Dependencies: 405
-- Name: TABLE enrollment_applications; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.enrollment_applications TO anon;
GRANT ALL ON TABLE public.enrollment_applications TO authenticated;
GRANT ALL ON TABLE public.enrollment_applications TO service_role;


--
-- TOC entry 5271 (class 0 OID 0)
-- Dependencies: 393
-- Name: TABLE evaluations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.evaluations TO anon;
GRANT ALL ON TABLE public.evaluations TO authenticated;
GRANT ALL ON TABLE public.evaluations TO service_role;


--
-- TOC entry 5272 (class 0 OID 0)
-- Dependencies: 410
-- Name: TABLE fee_concepts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fee_concepts TO anon;
GRANT ALL ON TABLE public.fee_concepts TO authenticated;
GRANT ALL ON TABLE public.fee_concepts TO service_role;


--
-- TOC entry 5273 (class 0 OID 0)
-- Dependencies: 411
-- Name: TABLE financial_plans; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.financial_plans TO anon;
GRANT ALL ON TABLE public.financial_plans TO authenticated;
GRANT ALL ON TABLE public.financial_plans TO service_role;


--
-- TOC entry 5274 (class 0 OID 0)
-- Dependencies: 383
-- Name: TABLE grade_levels; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.grade_levels TO anon;
GRANT ALL ON TABLE public.grade_levels TO authenticated;
GRANT ALL ON TABLE public.grade_levels TO service_role;


--
-- TOC entry 5275 (class 0 OID 0)
-- Dependencies: 388
-- Name: TABLE guardians; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.guardians TO anon;
GRANT ALL ON TABLE public.guardians TO authenticated;
GRANT ALL ON TABLE public.guardians TO service_role;


--
-- TOC entry 5276 (class 0 OID 0)
-- Dependencies: 416
-- Name: TABLE messages; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.messages TO anon;
GRANT ALL ON TABLE public.messages TO authenticated;
GRANT ALL ON TABLE public.messages TO service_role;


--
-- TOC entry 5277 (class 0 OID 0)
-- Dependencies: 402
-- Name: TABLE notifications; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.notifications TO anon;
GRANT ALL ON TABLE public.notifications TO authenticated;
GRANT ALL ON TABLE public.notifications TO service_role;


--
-- TOC entry 5278 (class 0 OID 0)
-- Dependencies: 398
-- Name: TABLE payments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.payments TO anon;
GRANT ALL ON TABLE public.payments TO authenticated;
GRANT ALL ON TABLE public.payments TO service_role;


--
-- TOC entry 5279 (class 0 OID 0)
-- Dependencies: 382
-- Name: TABLE periods; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.periods TO anon;
GRANT ALL ON TABLE public.periods TO authenticated;
GRANT ALL ON TABLE public.periods TO service_role;


--
-- TOC entry 5280 (class 0 OID 0)
-- Dependencies: 412
-- Name: TABLE plan_installments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.plan_installments TO anon;
GRANT ALL ON TABLE public.plan_installments TO authenticated;
GRANT ALL ON TABLE public.plan_installments TO service_role;


--
-- TOC entry 5284 (class 0 OID 0)
-- Dependencies: 380
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- TOC entry 5285 (class 0 OID 0)
-- Dependencies: 425
-- Name: TABLE public_news; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.public_news TO anon;
GRANT ALL ON TABLE public.public_news TO authenticated;
GRANT ALL ON TABLE public.public_news TO service_role;


--
-- TOC entry 5286 (class 0 OID 0)
-- Dependencies: 399
-- Name: TABLE receipts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.receipts TO anon;
GRANT ALL ON TABLE public.receipts TO authenticated;
GRANT ALL ON TABLE public.receipts TO service_role;


--
-- TOC entry 5287 (class 0 OID 0)
-- Dependencies: 384
-- Name: TABLE sections; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.sections TO anon;
GRANT ALL ON TABLE public.sections TO authenticated;
GRANT ALL ON TABLE public.sections TO service_role;


--
-- TOC entry 5290 (class 0 OID 0)
-- Dependencies: 409
-- Name: TABLE student_course_enrollments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.student_course_enrollments TO anon;
GRANT ALL ON TABLE public.student_course_enrollments TO authenticated;
GRANT ALL ON TABLE public.student_course_enrollments TO service_role;


--
-- TOC entry 5291 (class 0 OID 0)
-- Dependencies: 414
-- Name: TABLE student_discounts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.student_discounts TO anon;
GRANT ALL ON TABLE public.student_discounts TO authenticated;
GRANT ALL ON TABLE public.student_discounts TO service_role;


--
-- TOC entry 5292 (class 0 OID 0)
-- Dependencies: 389
-- Name: TABLE student_guardians; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.student_guardians TO anon;
GRANT ALL ON TABLE public.student_guardians TO authenticated;
GRANT ALL ON TABLE public.student_guardians TO service_role;


--
-- TOC entry 5293 (class 0 OID 0)
-- Dependencies: 387
-- Name: TABLE students; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.students TO anon;
GRANT ALL ON TABLE public.students TO authenticated;
GRANT ALL ON TABLE public.students TO service_role;


--
-- TOC entry 5294 (class 0 OID 0)
-- Dependencies: 404
-- Name: TABLE task_submissions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.task_submissions TO anon;
GRANT ALL ON TABLE public.task_submissions TO authenticated;
GRANT ALL ON TABLE public.task_submissions TO service_role;


--
-- TOC entry 5295 (class 0 OID 0)
-- Dependencies: 406
-- Name: TABLE teacher_course_assignments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teacher_course_assignments TO anon;
GRANT ALL ON TABLE public.teacher_course_assignments TO authenticated;
GRANT ALL ON TABLE public.teacher_course_assignments TO service_role;


--
-- TOC entry 5296 (class 0 OID 0)
-- Dependencies: 390
-- Name: TABLE teachers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teachers TO anon;
GRANT ALL ON TABLE public.teachers TO authenticated;
GRANT ALL ON TABLE public.teachers TO service_role;


--
-- TOC entry 5297 (class 0 OID 0)
-- Dependencies: 408
-- Name: TABLE teacher_assignment_stats; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teacher_assignment_stats TO anon;
GRANT ALL ON TABLE public.teacher_assignment_stats TO authenticated;
GRANT ALL ON TABLE public.teacher_assignment_stats TO service_role;


--
-- TOC entry 5298 (class 0 OID 0)
-- Dependencies: 407
-- Name: TABLE teacher_assignments_view; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teacher_assignments_view TO anon;
GRANT ALL ON TABLE public.teacher_assignments_view TO authenticated;
GRANT ALL ON TABLE public.teacher_assignments_view TO service_role;


--
-- TOC entry 5299 (class 0 OID 0)
-- Dependencies: 379
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- TOC entry 5300 (class 0 OID 0)
-- Dependencies: 415
-- Name: TABLE messages_2025_12_13; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_13 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_13 TO dashboard_user;


--
-- TOC entry 5301 (class 0 OID 0)
-- Dependencies: 417
-- Name: TABLE messages_2025_12_14; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_14 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_14 TO dashboard_user;


--
-- TOC entry 5302 (class 0 OID 0)
-- Dependencies: 418
-- Name: TABLE messages_2025_12_15; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_15 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_15 TO dashboard_user;


--
-- TOC entry 5303 (class 0 OID 0)
-- Dependencies: 420
-- Name: TABLE messages_2025_12_16; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_16 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_16 TO dashboard_user;


--
-- TOC entry 5304 (class 0 OID 0)
-- Dependencies: 421
-- Name: TABLE messages_2025_12_17; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_17 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_17 TO dashboard_user;


--
-- TOC entry 5305 (class 0 OID 0)
-- Dependencies: 422
-- Name: TABLE messages_2025_12_18; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_18 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_18 TO dashboard_user;


--
-- TOC entry 5306 (class 0 OID 0)
-- Dependencies: 423
-- Name: TABLE messages_2025_12_19; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_12_19 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_12_19 TO dashboard_user;


--
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 373
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 376
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 375
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 347
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 370
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 371
-- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 348
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 369
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 367
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 368
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 372
-- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
GRANT SELECT ON TABLE storage.vector_indexes TO anon;


--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 350
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 351
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- TOC entry 2748 (class 826 OID 16603)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2749 (class 826 OID 16604)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2747 (class 826 OID 16602)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2758 (class 826 OID 16682)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2757 (class 826 OID 16681)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- TOC entry 2756 (class 826 OID 16680)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2761 (class 826 OID 16637)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2760 (class 826 OID 16636)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2759 (class 826 OID 16635)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2753 (class 826 OID 16617)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2755 (class 826 OID 16616)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2754 (class 826 OID 16615)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2740 (class 826 OID 16490)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2741 (class 826 OID 16491)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2739 (class 826 OID 16489)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2743 (class 826 OID 16493)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2738 (class 826 OID 16488)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2742 (class 826 OID 16492)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2751 (class 826 OID 16607)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2752 (class 826 OID 16608)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2750 (class 826 OID 16606)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2746 (class 826 OID 16545)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2745 (class 826 OID 16544)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2744 (class 826 OID 16543)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 3929 (class 3466 OID 16621)
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- TOC entry 3934 (class 3466 OID 16700)
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- TOC entry 3928 (class 3466 OID 16619)
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- TOC entry 3935 (class 3466 OID 16703)
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- TOC entry 3930 (class 3466 OID 16622)
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- TOC entry 3931 (class 3466 OID 16623)
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

-- Completed on 2026-02-06 21:33:38

--
-- PostgreSQL database dump complete
--

\unrestrict 9LdYBEhZYCjX1t7vJrT88McYB0qFKNiDRbEif9foTJsuqxeuOkxz7XhyLAo4ccl

