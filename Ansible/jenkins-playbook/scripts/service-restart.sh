#!/bin/bash

#Restart Jenkins Services
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl restart jenkins

#Restart Docker Services
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl restart docker