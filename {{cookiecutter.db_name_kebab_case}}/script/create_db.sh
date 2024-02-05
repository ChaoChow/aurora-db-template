#!/bin/bash

db_name="{{ cookiecutter.db_name }}"
schema="{{ cookiecutter.starting_schema }}"

flyway_user="{{ cookiecutter.flyway_user_name }}"
flyway_user_password="{{ cookiecutter.flyway_user_password }}"

app_user="{{ cookiecutter.app_user }}"
app_user_password="{{ cookiecutter.app_user_password }}"

support_user="{{ cookiecutter.support_user }}"
support_user_password="{{ cookiecutter.support_user_password }}"

revoke_public_access_db="
REVOKE ALL ON DATABASE $db_name FROM PUBLIC;
"

create_schema="CREATE SCHEMA $schema;"

create_flyway_user="
CREATE USER $flyway_user WITH ENCRYPTED PASSWORD '$flyway_user_password';
GRANT pg_read_all_data TO $flyway_user;
GRANT pg_write_all_data TO $flyway_user;
GRANT CONNECT ON DATABASE $db_name TO $flyway_user;
GRANT ALL ON SCHEMA $schema TO $flyway_user;
ALTER USER $flyway_user SET search_path = $schema;
"

create_app_user="
CREATE USER $app_user WITH ENCRYPTED PASSWORD '$app_user_password';
GRANT pg_read_all_data TO $app_user;
GRANT pg_write_all_data TO $app_user;
GRANT CONNECT ON DATABASE $db_name TO $app_user;
ALTER USER $app_user SET search_path = $schema;
"

create_support_user="
CREATE USER $support_user WITH ENCRYPTED PASSWORD '$support_user_password';
GRANT pg_read_all_data TO $support_user;
GRANT pg_write_all_data TO $support_user;
GRANT CONNECT ON DATABASE $db_name TO $support_user;
ALTER USER $support_user SET search_path = $schema;
"

echo $revoke_public_access_db
echo $create_schema
echo $create_flyway_user
echo $create_app_user
echo $create_support_user