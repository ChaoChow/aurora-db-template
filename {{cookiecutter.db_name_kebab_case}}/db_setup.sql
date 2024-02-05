CREATE DATABASE {{ cookiecutter.db_name }};

REVOKE ALL ON DATABASE {{ cookiecutter.db_name }} FROM PUBLIC;

CREATE SCHEMA {{ cookiecutter.starting_schema }};

-- Create flyway user with read write permissions
CREATE USER {{ cookiecutter.flyway_user_name }} WITH ENCRYPTED PASSWORD '';
GRANT pg_read_all_data TO {{ cookiecutter.flyway_user_name }};
GRANT pg_write_all_data TO {{ cookiecutter.flyway_user_name }};
GRANT CONNECT ON DATABASE {{ cookiecutter.db_name }} TO {{ cookiecutter.flyway_user_name }};
GRANT ALL ON SCHEMA {{ cookiecutter.starting_schema }} TO {{ cookiecutter.flyway_user_name }};
ALTER USER {{ cookiecutter.flyway_user_name }} SET search_path = {{ cookiecutter.starting_schema }};

-- Create app user with read write permissions
CREATE USER {{ cookiecutter.app_user }} WITH ENCRYPTED PASSWORD '';
GRANT pg_read_all_data TO {{ cookiecutter.app_user }};
GRANT pg_write_all_data TO {{ cookiecutter.app_user }};
GRANT CONNECT ON DATABASE {{ cookiecutter.db_name }} TO {{ cookiecutter.app_user }};
ALTER USER {{ cookiecutter.app_user }} SET search_path = {{ cookiecutter.starting_schema }};

-- Create eng user with read permissions
CREATE USER {{ cookiecutter.support_user }} WITH ENCRYPTED PASSWORD '';
GRANT pg_read_all_data TO {{ cookiecutter.support_user }};
GRANT pg_write_all_data TO {{ cookiecutter.support_user }};
GRANT CONNECT ON DATABASE {{ cookiecutter.db_name }} TO {{ cookiecutter.support_user }};
ALTER USER {{ cookiecutter.support_user }} SET search_path = {{ cookiecutter.starting_schema }};