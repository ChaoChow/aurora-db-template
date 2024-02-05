"""
{{ cookiecutter.update({"db_name": cookiecutter.db_name_kebab_case.replace('-', '')}) }}
{{ cookiecutter.update({"root_user_password": random_ascii_string(50)}) }}
{{ cookiecutter.update({"flyway_user_password": random_ascii_string(50)}) }}
{{ cookiecutter.update({"app_user_password": random_ascii_string(50)}) }}
{{ cookiecutter.update({"support_user_password": random_ascii_string(50)}) }}
"""