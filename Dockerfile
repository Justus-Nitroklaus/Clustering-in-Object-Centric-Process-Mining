# Dockerfile, Image, Container

# base image
FROM python:3.10.0

# work envornment variable
ENV DockerHOME=/home/app/webapp

# work directory
RUN mkdir -p $DockerHOME 

# where the code will be contained
WORKDIR ${DockerHOME}

# environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# install dependencies  
RUN pip install --upgrade pip 

# copy whole project to your docker home directory. 
COPY . $DockerHOME  

# run this command to install all dependencies  
RUN pip install -r requirements.txt  

# port where the Django app runs  
EXPOSE 8000  

# start server 
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]