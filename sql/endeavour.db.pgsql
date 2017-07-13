--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: lsf; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA lsf;


ALTER SCHEMA lsf OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: endeavour_jobfinishlog_exitinfo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE endeavour_jobfinishlog_exitinfo AS ENUM (
    'TERM_UNKNOWN',
    'TERM_PREEMPT',
    'TERM_WINDOW',
    'TERM_LOAD',
    'TERM_OTHER',
    'TERM_RUNLIMIT',
    'TERM_DEADLINE',
    'TERM_PROCESSLIMIT',
    'TERM_FORCE_OWNER',
    'TERM_FORCE_ADMIN',
    'TERM_REQUEUE_OWNER',
    'TERM_REQUEUE_ADMIN',
    'TERM_CPULIMIT',
    'TERM_CHKPNT',
    'TERM_OWNER',
    'TERM_ADMIN',
    'TERM_MEMLIMIT',
    'TERM_EXTERNAL_SIGNAL',
    'TERM_RMS',
    'TERM_ZOMBIE',
    'TERM_SWAP',
    'TERM_THREADLIMIT',
    'TERM_SLURM',
    'TERM_BUCKET_KILL',
    'TERM_CTRL_PID',
    'TERM_CWD_NOTEXIST'
);


ALTER TYPE public.endeavour_jobfinishlog_exitinfo OWNER TO postgres;

--
-- Name: endeavour_jobfinishlog_jstatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE endeavour_jobfinishlog_jstatus AS ENUM (
    'NULL',
    'PEND',
    'PSUSP',
    'RUN',
    'SSUSP',
    'USUSP',
    'EXIT',
    'DONE',
    'PDONE',
    'PERR',
    'WAIT',
    'UNKWN'
);


ALTER TYPE public.endeavour_jobfinishlog_jstatus OWNER TO postgres;

SET search_path = lsf, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: endeavour_jobfinishlog; Type: TABLE; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE TABLE endeavour_jobfinishlog (
    jobid bigint NOT NULL,
    userid bigint NOT NULL,
    username text NOT NULL,
    numprocessors bigint NOT NULL,
    jstatus public.endeavour_jobfinishlog_jstatus NOT NULL,
    submittime bigint NOT NULL,
    begintime bigint NOT NULL,
    termtime bigint NOT NULL,
    starttime bigint NOT NULL,
    endtime bigint NOT NULL,
    queue text NOT NULL,
    resreq text NOT NULL,
    fromhost text NOT NULL,
    numaskedhosts bigint NOT NULL,
    hostfactor double precision NOT NULL,
    numexhosts bigint NOT NULL,
    numexphysicalhosts bigint NOT NULL,
    cputime double precision NOT NULL,
    jobname text NOT NULL,
    command bytea NOT NULL,
    ru_utime double precision NOT NULL,
    ru_stime double precision NOT NULL,
    ru_maxrss double precision NOT NULL,
    ru_ixrss double precision NOT NULL,
    ru_ismrss double precision NOT NULL,
    ru_idrss double precision NOT NULL,
    ru_isrss double precision NOT NULL,
    ru_minflt double precision NOT NULL,
    ru_majflt double precision NOT NULL,
    ru_nswap double precision NOT NULL,
    ru_inblock double precision NOT NULL,
    ru_oublock double precision NOT NULL,
    ru_msgsnd double precision NOT NULL,
    ru_msgrcv double precision NOT NULL,
    ru_nsignals double precision NOT NULL,
    ru_nvcsw double precision NOT NULL,
    ru_nivcsw double precision NOT NULL,
    ru_exutime double precision NOT NULL,
    dependcond text NOT NULL,
    timeevent text NOT NULL,
    preexeccmd text NOT NULL,
    mailuser text NOT NULL,
    projectname text NOT NULL,
    exitstatus bigint NOT NULL,
    maxnumprocessors bigint NOT NULL,
    loginshell text NOT NULL,
    idx bigint NOT NULL,
    maxrmem bigint NOT NULL,
    maxrswap bigint NOT NULL,
    rsvid text NOT NULL,
    sla text NOT NULL,
    additionalinfo text NOT NULL,
    exitinfo public.endeavour_jobfinishlog_exitinfo NOT NULL,
    warningtimeperiod bigint NOT NULL,
    warningaction text NOT NULL,
    chargedsaap text NOT NULL,
    licenseproject text NOT NULL,
    app text NOT NULL,
    postexeccmd text NOT NULL,
    runtimeestimation bigint NOT NULL,
    jgroup text NOT NULL,
    requeueevalues text NOT NULL,
    notifycmd text NOT NULL,
    lastresizetime bigint NOT NULL,
    jobdescription text NOT NULL,
    sub_job_name boolean NOT NULL,
    sub_queue boolean NOT NULL,
    sub_host boolean NOT NULL,
    sub_in_file boolean NOT NULL,
    sub_out_file boolean NOT NULL,
    sub_err_file boolean NOT NULL,
    sub_exclusive boolean NOT NULL,
    sub_notify_end boolean NOT NULL,
    sub_notify_begin boolean NOT NULL,
    sub_user_group boolean NOT NULL,
    sub_chkpnt_period boolean NOT NULL,
    sub_chkpnt_dir boolean NOT NULL,
    sub_chkpntable boolean NOT NULL,
    sub_restart_force boolean NOT NULL,
    sub_restart boolean NOT NULL,
    sub_rerunnable boolean NOT NULL,
    sub_window_sig boolean NOT NULL,
    sub_host_spec boolean NOT NULL,
    sub_depend_cond boolean NOT NULL,
    sub_res_req boolean NOT NULL,
    sub_other_files boolean NOT NULL,
    sub_pre_exec boolean NOT NULL,
    sub_login_shell boolean NOT NULL,
    sub_mail_user boolean NOT NULL,
    sub_modify boolean NOT NULL,
    sub_modify_once boolean NOT NULL,
    sub_project_name boolean NOT NULL,
    sub_interactive boolean NOT NULL,
    sub_pty boolean NOT NULL,
    sub_pty_shell boolean NOT NULL,
    sub_except boolean NOT NULL,
    sub_time_event boolean NOT NULL,
    sub2_hold boolean NOT NULL,
    sub2_modify_cmd boolean NOT NULL,
    sub2_bsub_block boolean NOT NULL,
    sub2_host_nt boolean NOT NULL,
    sub2_host_ux boolean NOT NULL,
    sub2_queue_chkpnt boolean NOT NULL,
    sub2_queue_rerunnable boolean NOT NULL,
    sub2_in_file_spool boolean NOT NULL,
    sub2_job_cmd_spool boolean NOT NULL,
    sub2_job_priority boolean NOT NULL,
    sub2_use_def_proclimit boolean NOT NULL,
    sub2_modify_run_job boolean NOT NULL,
    sub2_modify_pend_job boolean NOT NULL,
    sub2_warning_time_period boolean NOT NULL,
    sub2_warning_action boolean NOT NULL,
    sub2_use_rsv boolean NOT NULL,
    sub2_tsjob boolean NOT NULL,
    sub2_lsf2tp boolean NOT NULL,
    sub2_job_group boolean NOT NULL,
    sub2_sla boolean NOT NULL,
    sub2_extsched boolean NOT NULL,
    sub2_license_project boolean NOT NULL,
    sub2_overwrite_out_file boolean NOT NULL,
    sub2_overwrite_err_file boolean NOT NULL,
    sub2_ssm_job boolean NOT NULL,
    sub2_sym_job boolean NOT NULL,
    sub2_srv_job boolean NOT NULL,
    sub2_sym_grp boolean NOT NULL,
    sub2_sym_job_parent boolean NOT NULL,
    sub2_sym_job_realtime boolean NOT NULL,
    sub2_sym_job_persist_srv boolean NOT NULL,
    sub2_ssm_job_persist boolean NOT NULL,
    j_except_overrun boolean NOT NULL,
    j_except_underun boolean NOT NULL,
    j_except_idle boolean NOT NULL,
    sql_last_update timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE lsf.endeavour_jobfinishlog OWNER TO postgres;

--
-- Name: endeavour_jobfinishlog_askedhosts; Type: TABLE; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE TABLE endeavour_jobfinishlog_askedhosts (
    jobid bigint NOT NULL,
    submittime bigint DEFAULT 0::bigint NOT NULL,
    idx bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE lsf.endeavour_jobfinishlog_askedhosts OWNER TO postgres;

--
-- Name: endeavour_jobfinishlog_exechosts; Type: TABLE; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE TABLE endeavour_jobfinishlog_exechosts (
    jobid bigint NOT NULL,
    submittime bigint DEFAULT 0::bigint NOT NULL,
    idx bigint NOT NULL,
    name text NOT NULL,
    count bigint NOT NULL
);


ALTER TABLE lsf.endeavour_jobfinishlog_exechosts OWNER TO postgres;

--
-- Name: endeavour_jobfinishlog_hrusages; Type: TABLE; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE TABLE endeavour_jobfinishlog_hrusages (
    jobid bigint NOT NULL,
    submittime bigint DEFAULT 0::bigint NOT NULL,
    idx bigint NOT NULL,
    name text NOT NULL,
    mem bigint NOT NULL,
    swap bigint NOT NULL,
    utime bigint NOT NULL,
    stime bigint NOT NULL
);


ALTER TABLE lsf.endeavour_jobfinishlog_hrusages OWNER TO postgres;

--
-- Name: endeavour_rsvfinishlog; Type: TABLE; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE TABLE endeavour_rsvfinishlog (
    rsvid text NOT NULL,
    rsvreqtime bigint NOT NULL,
    uid bigint NOT NULL,
    name text NOT NULL,
    numreses bigint NOT NULL,
    timewindow_start bigint NOT NULL,
    timewindow_end bigint NOT NULL,
    duration bigint NOT NULL,
    creator text NOT NULL,
    rsv_option_user boolean NOT NULL,
    rsv_option_group boolean NOT NULL,
    rsv_option_system boolean NOT NULL,
    rsv_option_recur boolean NOT NULL,
    rsv_option_resreq boolean NOT NULL,
    rsv_option_host boolean NOT NULL,
    rsv_option_open boolean NOT NULL,
    rsv_option_delete boolean NOT NULL,
    rsv_option_closed boolean NOT NULL,
    rsv_option_exec boolean NOT NULL,
    rsv_option_rmexec boolean NOT NULL,
    rsv_option_nextinstance boolean NOT NULL,
    rsv_option_disable boolean NOT NULL,
    rsv_option_addhost boolean NOT NULL,
    rsv_option_rmhost boolean NOT NULL,
    rsv_option_description boolean NOT NULL,
    rsv_option_twmod boolean NOT NULL,
    rsv_option_switchopenclose boolean NOT NULL,
    rsv_option_usermod boolean NOT NULL,
    rsv_option_rsvname boolean NOT NULL,
    rsv_option_expired boolean NOT NULL
);


ALTER TABLE lsf.endeavour_rsvfinishlog OWNER TO postgres;

--
-- Name: endeavour_rsvfinishlog_alloc; Type: TABLE; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE TABLE endeavour_rsvfinishlog_alloc (
    rsvid text NOT NULL,
    rsvreqtime bigint NOT NULL,
    resname text NOT NULL,
    count bigint NOT NULL,
    usedamt bigint NOT NULL
);


ALTER TABLE lsf.endeavour_rsvfinishlog_alloc OWNER TO postgres;

--
-- Data for Name: endeavour_jobfinishlog; Type: TABLE DATA; Schema: lsf; Owner: postgres
--

COPY endeavour_jobfinishlog (jobid, userid, username, numprocessors, jstatus, submittime, begintime, termtime, starttime, endtime, queue, resreq, fromhost, numaskedhosts, hostfactor, numexhosts, numexphysicalhosts, cputime, jobname, command, ru_utime, ru_stime, ru_maxrss, ru_ixrss, ru_ismrss, ru_idrss, ru_isrss, ru_minflt, ru_majflt, ru_nswap, ru_inblock, ru_oublock, ru_msgsnd, ru_msgrcv, ru_nsignals, ru_nvcsw, ru_nivcsw, ru_exutime, dependcond, timeevent, preexeccmd, mailuser, projectname, exitstatus, maxnumprocessors, loginshell, idx, maxrmem, maxrswap, rsvid, sla, additionalinfo, exitinfo, warningtimeperiod, warningaction, chargedsaap, licenseproject, app, postexeccmd, runtimeestimation, jgroup, requeueevalues, notifycmd, lastresizetime, jobdescription, sub_job_name, sub_queue, sub_host, sub_in_file, sub_out_file, sub_err_file, sub_exclusive, sub_notify_end, sub_notify_begin, sub_user_group, sub_chkpnt_period, sub_chkpnt_dir, sub_chkpntable, sub_restart_force, sub_restart, sub_rerunnable, sub_window_sig, sub_host_spec, sub_depend_cond, sub_res_req, sub_other_files, sub_pre_exec, sub_login_shell, sub_mail_user, sub_modify, sub_modify_once, sub_project_name, sub_interactive, sub_pty, sub_pty_shell, sub_except, sub_time_event, sub2_hold, sub2_modify_cmd, sub2_bsub_block, sub2_host_nt, sub2_host_ux, sub2_queue_chkpnt, sub2_queue_rerunnable, sub2_in_file_spool, sub2_job_cmd_spool, sub2_job_priority, sub2_use_def_proclimit, sub2_modify_run_job, sub2_modify_pend_job, sub2_warning_time_period, sub2_warning_action, sub2_use_rsv, sub2_tsjob, sub2_lsf2tp, sub2_job_group, sub2_sla, sub2_extsched, sub2_license_project, sub2_overwrite_out_file, sub2_overwrite_err_file, sub2_ssm_job, sub2_sym_job, sub2_srv_job, sub2_sym_grp, sub2_sym_job_parent, sub2_sym_job_realtime, sub2_sym_job_persist_srv, sub2_ssm_job_persist, j_except_overrun, j_except_underun, j_except_idle, sql_last_update) FROM stdin;
\.


--
-- Data for Name: endeavour_jobfinishlog_askedhosts; Type: TABLE DATA; Schema: lsf; Owner: postgres
--

COPY endeavour_jobfinishlog_askedhosts (jobid, submittime, idx, name) FROM stdin;
\.


--
-- Data for Name: endeavour_jobfinishlog_exechosts; Type: TABLE DATA; Schema: lsf; Owner: postgres
--

COPY endeavour_jobfinishlog_exechosts (jobid, submittime, idx, name, count) FROM stdin;
\.


--
-- Data for Name: endeavour_jobfinishlog_hrusages; Type: TABLE DATA; Schema: lsf; Owner: postgres
--

COPY endeavour_jobfinishlog_hrusages (jobid, submittime, idx, name, mem, swap, utime, stime) FROM stdin;
\.


--
-- Data for Name: endeavour_rsvfinishlog; Type: TABLE DATA; Schema: lsf; Owner: postgres
--

COPY endeavour_rsvfinishlog (rsvid, rsvreqtime, uid, name, numreses, timewindow_start, timewindow_end, duration, creator, rsv_option_user, rsv_option_group, rsv_option_system, rsv_option_recur, rsv_option_resreq, rsv_option_host, rsv_option_open, rsv_option_delete, rsv_option_closed, rsv_option_exec, rsv_option_rmexec, rsv_option_nextinstance, rsv_option_disable, rsv_option_addhost, rsv_option_rmhost, rsv_option_description, rsv_option_twmod, rsv_option_switchopenclose, rsv_option_usermod, rsv_option_rsvname, rsv_option_expired) FROM stdin;
\.


--
-- Data for Name: endeavour_rsvfinishlog_alloc; Type: TABLE DATA; Schema: lsf; Owner: postgres
--

COPY endeavour_rsvfinishlog_alloc (rsvid, rsvreqtime, resname, count, usedamt) FROM stdin;
\.


--
-- Name: idx_16615_primary; Type: CONSTRAINT; Schema: lsf; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endeavour_jobfinishlog
    ADD CONSTRAINT idx_16615_primary PRIMARY KEY (jobid, submittime, idx);


--
-- Name: idx_16622_primary; Type: CONSTRAINT; Schema: lsf; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endeavour_jobfinishlog_askedhosts
    ADD CONSTRAINT idx_16622_primary PRIMARY KEY (jobid, submittime, idx, name);


--
-- Name: idx_16629_primary; Type: CONSTRAINT; Schema: lsf; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endeavour_jobfinishlog_exechosts
    ADD CONSTRAINT idx_16629_primary PRIMARY KEY (jobid, submittime, idx, name);


--
-- Name: idx_16636_primary; Type: CONSTRAINT; Schema: lsf; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endeavour_jobfinishlog_hrusages
    ADD CONSTRAINT idx_16636_primary PRIMARY KEY (jobid, submittime, idx, name);


--
-- Name: idx_16643_primary; Type: CONSTRAINT; Schema: lsf; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endeavour_rsvfinishlog
    ADD CONSTRAINT idx_16643_primary PRIMARY KEY (rsvid, rsvreqtime);


--
-- Name: idx_16649_primary; Type: CONSTRAINT; Schema: lsf; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY endeavour_rsvfinishlog_alloc
    ADD CONSTRAINT idx_16649_primary PRIMARY KEY (rsvid, rsvreqtime, resname);


--
-- Name: idx_16615_endtime; Type: INDEX; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_16615_endtime ON endeavour_jobfinishlog USING btree (endtime);


--
-- Name: idx_16615_sql_last_update; Type: INDEX; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_16615_sql_last_update ON endeavour_jobfinishlog USING btree (sql_last_update);


--
-- Name: idx_16622_jobid; Type: INDEX; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_16622_jobid ON endeavour_jobfinishlog_askedhosts USING btree (jobid, submittime, idx);


--
-- Name: idx_16629_jobid; Type: INDEX; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_16629_jobid ON endeavour_jobfinishlog_exechosts USING btree (jobid, submittime, idx);


--
-- Name: idx_16636_jobid; Type: INDEX; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_16636_jobid ON endeavour_jobfinishlog_hrusages USING btree (jobid, submittime, idx);


--
-- Name: idx_16649_rsvid; Type: INDEX; Schema: lsf; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_16649_rsvid ON endeavour_rsvfinishlog_alloc USING btree (rsvid, rsvreqtime);


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
