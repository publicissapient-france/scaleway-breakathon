FROM python:3.8.5-slim
WORKDIR /app
RUN python -m pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY *.py ./
COPY model.pth model.pth

ENV FLASK_APP "app.py"
ENV FLASK_ENV "to complete"

CMD ["flask", "run"]
