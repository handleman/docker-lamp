# docker TAO-lamp server image

It is easy to use  simple LAMP server image based on [phusion baseimage](https://github.com/phusion/baseimage-docker) ( Ubuntu 18.04)  with required dependencies required to run  [ TAO Open Source Assessment Platform ](https://www.taotesting.com) on top of it.

This image is cooked on top of [simple LAMP image using Ubuntu, Apache, PHP and MySql in a single image](https://github.com/mattrayner/docker-lamp) with small addition of T.A.O specific salt and pepper. 

Original documentation is quite applicable here with some minor differences listed below.

## Basic overview
It is **Ubuntu 18.04**+ **apache** + **php 7.3** + **mySQL**  ready to use server image which is able to mount your application source folder together with SQL database files folder. So you would be able to manage your source-files and database on you local machine. Although, you always can use preinstalled */phpMyAdmin* to manage your container’s database on the go.

## Basic usage and image run
you need to define 2 separate folders: one for application source and other for mySQL damp ( not necessary). Fo example you project folder structure could look like this:

```
my_project
   |-- app
   |-- mysql
```

place your source files inside `app` folder and then run this command from parent directory `my_project`

`docker run -i -t -p "88:80" -v ${PWD}/app:/app -v ${PWD}/mysql:/var/lib/mysql handleman/tao_lamp:latest`

That is it. Now your project is served through: `http://localhost:88/`

After  `docker run`  command you would see feedback like this :

```bash
========================================================================
You can now connect to this MySQL Server with dUaCtX7FnFmC

    mysql -uadmin -pdUaCtX7FnFmC -h<host> -P<port>

Please remember to change the above password as soon as possible!
MySQL user 'root' has no password but only allows local connections

enjoy!
========================================================================
```

 There you can take initial credentials with randomly created password for your default mySql database instance, which you would need, for example,  to enter `[http://localhost:88/phpmyadmin/](http://localhost:88/phpmyadmin/)  and manage your own users and databases.


### configuring TAO instance

now you are able to enter created container and work in its terminal as usual, installing composer dependencies, running install scripts and etc.
`docker exec -it <YOUR_CONTAINER_ID> bash`


## *image build:*
If you want to compose your version of the image please follow instructions below.

Clone this repository  and go inside 

`git clone git@github.com:handleman/docker-tao-lamp.git your_folder_name`

`cd your_folder_name`

then run following command :

`docker build -t handleman/tao_lamp:latest -f ./1804/Dockerfile . `
