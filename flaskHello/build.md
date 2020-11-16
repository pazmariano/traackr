# Image Build How To
This article exaplins how the Flask Hello Docker Image was built.

## Step by Step

Download the repository

```bash
git clone https://github.com/pazmariano/traackr.git
```

Get inside the app directory and build a copy of the image (Docker service must be runnign at this point)

```bash
cd flaskHello
## Validate Docker deamon is up. The following command will return error if you docker is not running
docker version
## Build the image. This will build an image called flaskhello tagged as v0.1.0 in your local registry. If you want the image to be available online think about using a Public registry like docker hub. [Read More](https://hub.docker.com/)
docker build -t flaskhello:v0.1.0 .
## Validate the image was built successfully
docker image list
## Should display something like this:
## REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
## flaskhello           v0.1.0              deafaced3a09        5 seconds ago       892MB
```

## How to run the app

Once the image is ok, you can test it by running a copy of the app

```bash
## Start the container
docker run -d -p 5000:5000 -t flaskhello:v0.1.0
## List running containers
docker ps
## Should display something like this:
## CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                    NAMES
## 00cef872c622        traackr/flaskhello:v0.1.0   "python ./server.py"   1 minute ago        Up 1 minute         0.0.0.0:5000->5000/tcp   quizzical_easley
```

Test your app image

```bash
## Depending on which system you are running your app (Windows, Linux or OSx) the test might need you to hit localhost or you internal IP address
## On Linux
curl http://localhost:5000/
## On OSX
curl http://<your_internal_ip>:5000/
## Should return:
## Hello World!S
```

--

[Back to Flask Hello Root](./flaskhello.md)