# Service Composer
The Service Composer tool allows combining existing services, tools and applications to compose larger applications in an easy and graphical way. This tools is part of the AIoTES IDE.


The current implementation of this tool is based on [Node-RED](https://nodered.org/).



### Deployment

The Service Composer is deployed as part of the AIoTES IDE Docker stack.

Current version: 0.0.3



### Build docker image

To build a new Docker image, run:

`sudo docker build --no-cache -t docker-activage.satrd.es/activage-nr-service-composition:<version> .`


To test the new image, you can run it in Docker using:
```
sudo docker run -d -p 1880:1880 docker-activage.satrd.es/activage-nr-service-composition:<version>
chmod a+rwx -R nodered-data
```

The web interface will be available at http://localhost:1880


You can upload the image to the Docker registry using:

`docker push docker-activage.satrd.es/activage-nr-service-composition:0.0.2`

