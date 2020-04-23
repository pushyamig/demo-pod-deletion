FROM python:3.7

# apt-utils needs to be installed separately
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-dev xmlsec1 cron && \
    apt-get clean -y

WORKDIR /app/
COPY . /app/

# Sets the local timezone of the docker image
ENV TZ=America/Detroit
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


CMD ["python job-process.py"]