FROM joson/kms670:built
MAINTAINER joson chen <josonchen@sina.com>
ENV REFRESHED_AT 20180321

# Set the working directory to /app


# Copy the current directory contents into the container at /app



RUN apt-get -yqq update  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8888 

WORKDIR /app

ADD . /app

# HEALTHCHECK --start-period=15s --interval=30s --timeout=3s --retries=1 CMD /healthchecker.sh


ENTRYPOINT ["bash", "deploy-kms.sh"]    
