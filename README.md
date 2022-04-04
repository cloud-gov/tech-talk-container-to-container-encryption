# Tech Talk: Container-to-container Encryption

A tech talk providing an overview of container-to-container encryption on cloud.gov

## What it is?

Container-to-Container networking allows your applications to communicate with one another without having to hit an outside network. In addition to this you can add an extra layer of security by implementing Encrypted Container-to-Container networking, which uses SSL/TLS to encrypt all traffic between your applications.

## How to implement it

In order to implement Container-to-Container encryption you first need to set up an internal route for your destination application. 

`cf map-route APP apps.internal --hostname APP`

Then you need to setup a network policy that allows your source application to communicate with your destination application, making sure to specify the port as `61443`. All traffic to this port uses SSL/TLS.

`cf add-network-policy SOURCE_APP DESTINATION_APP --protocol tcp --port 61443`

## About this demo

This Tech Talk demonstrates the use of Container-to-Container encryption by setting up an Nginx server with a webpage that, upon pressing a button, requests data from a Python Flask Application securely over the internal network.

## Using this demo

To run this demo yourself, clone the repo to your local machine.

Once the repo is cloned, update the following files:

- frontend/manifest.yml
- frontend/nginx.conf
- backend/manifest.yml

Run `cf push` for the frontend and backend. Go to the frontend url. Click on the button, and confirm that it returns an error message.

Set up your route and network policy.

Once these are in place click on the test button again, and you should see the data sent from the backend application.