
# Notes

`@ref` (From OG Docker image) https://github.com/mattrayner/docker-lamp#adding-your-app

## Quick ref


### **Building image**
 
```bash
docker build --tag vue-lampy:latest .
```

### **Tag image**
 
```bash
docker tag vue-lampy:latest d3vl1m3/vue-lampy:latest
```

### **Deploying to docker hub**
 
```bash
docker push d3vl1m3/vue-lampy:latest
```

### **Adding your own content** and **Persisting your MySQL**
 
```bash
docker run -i -t -p "80:80" -v ${PWD}/app:/app -v ${PWD}/mysql:/var/lib/mysql d3vl1m3/vue-lampy:latest
```

## Adding your own content

The 'easiest' way to add your own content to the lamp image is using Docker volumes. This will effectively 'sync' a particular folder on your machine with that on the docker container.

The below examples assume the following project layout and that you are running the commands from the 'project root'.

```
/ (project root)
/app/ (your PHP files live here)
/mysql/ (docker will create this and store your MySQL data here)
In english, your project should contain a folder called app containing all of your app's code. That's pretty much it.
```

### Adding your app

The below command will run the docker image `d3vl1m3/vue-lampy:latest` interactively, exposing port 80 on the host machine with port 80 on the docker container. It will then create a volume linking the app/ directory within your project to the /app directory on the container. This is where Apache is expecting your PHP to live.

```bash
docker run -i -t -p "80:80" -v ${PWD}/app:/app d3vl1m3/vue-lampy:latest
```

### Persisting your MySQL

The below command will run the docker image mattrayner/lamp:latest, creating a mysql/ folder within your project. This folder will be linked to `/var/lib/mysql` where all of the MySQL files from container lives. You will now be able to stop/start the container and keep your database changes.

You may also add `-p 3306:3306 after -p 80:80` to expose the mysql sockets on your host machine. This will allow you to connect an external application such as SequelPro or MySQL Workbench.

```bash
docker run -i -t -p "80:80" -v ${PWD}/mysql:/var/lib/mysql d3vl1m3/vue-lampy:latest
```

### Doing both

The below command is our 'recommended' solution. It both adds your own PHP and persists database files. We have created a more advanced alias in our .bash_profile files to enable the short commands ldi and launchdocker. See the next section for an example.

```bash
docker run -i -t -p "80:80" -v ${PWD}/app:/app -v ${PWD}/mysql:/var/lib/mysql d3vl1m3/vue-lampy:latest
```
