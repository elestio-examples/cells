<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Cells, verified and packaged by Elestio

A better community platform for the modern web.

[Cells](https://github.com/pydio/cells) is the nextgen file sharing platform for organizations. It is a full rewrite of the Pydio project using the Go language following a micro-service architecture.

<img src="https://github.com/elestio-examples/cells/raw/main/cells.png" alt="Cells" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/cells">fully managed cells</a> on <a target="_blank" href="https://elest.io/">elest.io</a> For Securely Transfer and Store Your Files .

[![deploy](https://github.com/elestio-examples/cells/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/cells)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/cells.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

    mkdir -p ./cellsdir
    chown -R 1000:1000 ./cellsdir

    mkdir -p ./install-conf.yml
    chown -R 1000:1000 ./install-conf.yml

    mkdir -p ./mysqldir
    chown -R 1000:1000 ./mysqldir

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:8080`

## Docker-compose

Here are some example snippets to help you get started creating a container.

      
    version: "3.3"

    services:
        cells:
            image: elestio4test/cells:latest
            restart: always
            ports:
                - 172.17.0.1:8080:8080
            environment:
                - CELLS_INSTALL_YAML=/pydio/config/install.yml
                - CELLS_SITE_BIND=0.0.0.0:8080
                - CELLS_SITE_NO_TLS=1
                - CELLS_SITE_EXTERNAL=https://${PUBLIC_FQDN}
            volumes:
                - ./cellsdir:/var/cells
                - ./install-conf.yml:/pydio/config/install.yml:ro

        mysql:
            image: mysql:8
            restart: always
            environment:
                MYSQL_ROOT_PASSWORD: ${MYSQL_PASSWORD}
                MYSQL_DATABASE: cells
                MYSQL_USER: pydio
                MYSQL_PASSWORD: ${MYSQL_PASSWORD}
            volumes:
                - ./mysqldir:/var/lib/mysql
            command:
                [
                    mysqld,
                    --character-set-server=utf8mb4,
                    --collation-server=utf8mb4_unicode_ci,
                ]


### Environment variables

|       Variable       | Value (example) |
| :------------------: | :-------------: |
| SOFTWARE_VERSION_TAG |     latest      |


# Maintenance

## Logging

The Elestio Cells Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/pydio/cells">Cells documentation</a>

- <a target="_blank" href="https://pydio.com/en/docs/legacy-documentation">Cells Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/cells">Elestio/cells Github repository</a>