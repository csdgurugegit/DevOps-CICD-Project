#!/bin/bash

# Restart Docker Services
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl restart docker