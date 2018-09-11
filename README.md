# karaf-on-pas


    Approach 1 - Deploy Karaf app to Pivotal Application Service (PAS)

    To build the applications in this workshop, you need a few things:

    1. Git

    2. Java JDK 8

    3. Maven



    We’ll be pushing applications and creating services in Pivotal Cloud Foundry (PCF). This workshop will use Pivotal Web Services, an instance of PCF managed by Pivotal.

    1. Login or signup for a free Pivotal Web Services account

    2. Click the Tools link and

        a. Download and install the CLI matching your operating system

        b. Login using CF CLI (cf login -a api.run.pivotal.io)



    Steps:

        1. Clone repositories

            $ git clone https://github.com/ajitkadari/karaf-on-pas.git

            $ git clone https://github.com/ajitkadari/Karaf-Tutorial.git

        2. Compile Karaf-Tutorial application

            $ cd Karaf-Tutorial

            $ mvn clean install -DskipTests

        3. Change to karaf-on-pas directory

            $ pwd

                ~/../../karaf-on-pas/

            $ cd karaf-distribution

            $ pwd

                ~/../../karaf-on-pas/karaf-distribution

        3. Deploy Karaf distribution to PAS

            $ ./create-karaf-distribution.sh

        4. Change to karaf-app directory

            $ cd ../karaf-app/

            $ pwd

                ~/../../karaf-on-pas/karaf-app

        5. Deploy Karaf application to PAS

            $ ./deploy-app.sh karafapp appdirectory/

        6. Access the below URL

            https://karafapp.cfapps.io/tasklist/