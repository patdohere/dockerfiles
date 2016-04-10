[![Docker Pulls](https://img.shields.io/docker/pulls/mashape/kong.svg)](https://hub.docker.com/r/patdohere/jupyter-graphlab/)

# Introduction
Docker Image built on top of [Jupyter Docker Image](https://hub.docker.com/r/jupyter/notebook/) for use with [Coursera Machine Learning specialization]().  Comes packaged with Jupyter Notebook and the following Kernels.  Also has scripts to install GraphLab-Create.
- Python 2
- Python 3


# Getting Started
## For Windows and Mac Users
### Installation
1. Follow install [here](https://www.docker.com/products/docker-toolbox) to install DockerToolbox (docker, docker-machine, Kitematic)
2. Open Kitematic
3. Search for `patdohere/jupyter-graphlab`
4. Click "Create", you should see errors in the screen

### Configure your container
1. Click on "Settings" tab
2. Click on "General" sub-tab to configure your environment variables
3. Edit "DATO_USERNAME" with your username
4. Edit "DATO_PRODUCT_KEY" with your product key
5. Click on "Restart"

### Working with your container
1. Click on "Settings" tab
2. Click on "Volumes" sub-tab
3. Click "change" next to "/notebook"
4. Choose your folder where your notebook files are
5. Click on "Home" tab
6. You will see web preview, click on the box with an arrow next to the cog wheel. Your web browser should pop open with your notebooks.

## For Linux Users
### Installation
1. Install Docker on your machine using the instructions [here](https://docs.docker.com/engine/installation/)

### Starting the Jupyter Notebook container
1. Open Terminal
2. Change to your working directory
```
cd <path to working directory>
```
3. Run the following command from the working directory to start the Jupyter notebook
```

docker run -it -d -p 8888:8888 --name jupyter-graphlab -e DATO_USERNAME="<email>" -e DATO_PRODUCT_KEY="<product_key>" -v "$(pwd):/notebooks" patdohere/jupyter-graphlab
```
4. Open a web browser and go to http://localhost:8888

### Stopping the Jupyter Notebook container
1. Run the following command to stop Jupyter
```
docker stop jupyter-graphlab
```

### Removing the image
1. Make sure the container is stopped
```
docker stop jupyter-graphlab
```
2. Remove the container and image
```
docker rm jupyter-graphlab
docker rmi patdohere/jupyter-graphlab
```

# Resources
[Jupyter Github Repository for Notebook Docker Image](https://github.com/jupyter/notebook)
[Jupyter Github Repository for Docker Images](https://github.com/jupyter/docker-stacks)
[Docker Dockerfile API Guide](https://docs.docker.com/engine/reference/builder/)
[Dato GraphLab Create Installation Guide](https://dato.com/download/install-graphlab-create-command-line.html)
