FROM python:3.5-slim
# WARNING: The script virtualenv is installed in '/root/.local/bin' which is not on PATH.
# Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
ENV PATH="${PATH}:/root/.local/bin"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    libc6-dev && \
    pip install --upgrade pip && \
    pip install --user pipenv

# Copy the current directory contents into the container at /app
COPY . /app
COPY start.sh /home/root/

WORKDIR /app

# This fails with: Installing dependencies from Pipfile.lock (93009e)…
# An error occurred while installing py-bcrypt==0.4 --hash=sha256:5fa13bce551468350d66c4883694850570f3da28d6866bb638ba44fe5eabda78! Will try again.

ENTRYPOINT ["/home/root/start.sh"]


#RUN pipenv shell

#CMD pipenv shell

#WORKDIR /app/appat

#CMD pipenv run python manage.py migrate

#CMD pipenv run python manage.py runserver
