FROM python:3.10

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

WORKDIR /app

COPY . /app/

RUN pip cache purge

RUN pip install -r requirements.txt


# Copiez le script d'initialisation dans le conteneur
COPY ./entrypoint.sh /entrypoint.sh

# # Rend le script exécutable
# RUN chmod +x /entrypoint.sh

EXPOSE 8000

# Exécutez le script d'initialisation à l'intérieur du Dockerfile
# RUN /entrypoint.sh

# Lancer le serveur Django
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

# Exécutez le script d'initialisation
# ENTRYPOINT ["/entrypoint.sh"]
