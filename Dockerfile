############################################################
# Dockerfile to build Python WSGI Application Containers
# Monitored with Appdynamics python agent
# Based on Ubuntu
############################################################
#Base image
FROM ubuntu

#Author of the file
MAINTAINER rajatparida86@gmail.com

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

#Add application resources URL
#RUN echo "deb http://archive.ubuntu.com/ubuntu/ $(lsb_release -sc) main universe" >> /etc/apt/sources.list

#Update source list
RUN apt-get update

#Install basic applications
RUN apt-get install -y tar curl nano

#Install python and related tools
RUN apt-get install -y python python-dev python-distribute python-pip

#Create the location to hold application
RUN mkdir /application

#cd into the applications folder
WORKDIR /application

#Install virtualenv
RUN pip install virtualenv

#Create python2.7 based virtual environment
RUN virtualenv -p /usr/bin/python2.7 venv

#Activate the virtual environment
RUN source venv/bin/activate

#Install Appdynamics python agent
RUN pip install -U appdynamics==4.2.11.0
