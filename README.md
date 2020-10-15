# Service Composer
The Service Composer tool allows combining existing services, tools and applications to compose larger applications in an easy and graphical way. This tools is part of the AIoTES IDE.


The current implementation of this tool is based on [Node-RED](https://nodered.org/).



## Getting stated

### Deployment

The Service Composer is deployed as part of the AIoTES IDE Docker stack.


### Adding new nodes

Although the Service Composer includes a default set of nodes for AIoTES and other related services, you can include new nodes in the Service Composer to integrate new services.


You can find more nodes at the [Node-RED library](https://flows.nodered.org/)


You can also create your own nodes easily. [Check this guide](https://inter-iot.readthedocs.io/projects/inter-iot-cookbook/en/latest/inter-layer/as2as/as2as-recipe2/).



### Creating flows

Service composition in Node-RED is based on the definition of flows. Node-RED prodes a web interface for definining and running flows. Check this [guide for flow creation](https://inter-iot-cookbook.readthedocs.io/en/latest/inter-layer/as2as/as2as-recipe3/).



## Build docker image

To build a new Docker image, run:

`sudo docker build --no-cache -t aiotesdocker/devtools-ide-servicecomposer:<version> .`



## Testing

To test the new image, you can run it in Docker using:

```
sudo docker run -d -p 1880:1880 aiotesdocker/devtools-ide-servicecomposer:<version>
chmod a+rwx -R nodered-data
```

The web interface will be available at http://localhost:1880



## Further information

[Available Docker images](https://hub.docker.com/r/aiotesdocker/devtools-ide-servicecomposer)


### Additional Node-RED information

[Official Node-RED documentation](https://nodered.org/docs/).

[Additional Node-RED resources](https://inter-iot.readthedocs.io/projects/as2as/en/latest/user-guide/advanced-documentation/)

