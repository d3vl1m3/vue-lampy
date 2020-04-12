
# Notes
`@purpose` For me to gain some more ground using Docker to maintain projects

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

## Adding your own content

The 'easiest' way to add your own content to the lamp image is using Docker volumes. This will effectively 'sync' a particular folder on your machine with that on the docker container.

The below examples assume the following project layout and that you are running the commands from the 'project root'.

```
/ (project root)
../app/ (your PHP files live here)
../mysql/ (docker will create this and store your MySQL data here)
```

### **Adding your own content** and **Persisting your MySQL** in to/from a parent directory folder
 
```bash
docker run -i -t -p "80:80" -v $(dirname "${PWD}")/app/:/app -v $(dirname "${PWD}")/mysql:/var/lib/mysql d3vl1m3/vue-lampy:latest
```
