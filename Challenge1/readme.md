A three-tier architecture in AWS which can be used in a client server application where the application has a frontend, backend and database. Each of these tiers has a specific task and can be managed independently.

Here in the code I have added simple ec2 instance for front end and backend, but using autoscaling groups and keeping them in different regions, we can ensure the high availability and almost zero downtime for the applications which I have depicted using the diagram. Using autoscaling groups would also help in maintenance of the server size automatically. 


<img width="428" alt="image" src="https://user-images.githubusercontent.com/119726781/205720885-b09a172e-3b11-469a-b7a6-5f3105569286.png">


The repository consists of modules for some of the resources that could be reused while creating resources for other environments.
The modules are for creating - 
1. ec2
2. db instance
3. networking - VPC, subnets, internet gateway, nat gateway, route tables

The env consists fo demo env which is being created for this demo. 
The demo env consists of creating 
1. network which will consist of VPC, public subnet, private subnet, internet gateway, nat gateway and route tables.
2. Creating security groups for frontend, application and database.
3. creating loadbalancer and target groups.
4. creating ec2 server for frontend and application.
5. creating database - database username and password are passed as sensitive variables. They can be stored in jenkins credentials or can be stored in an encrypted file and can be passed as variable while running the teraform command. Can also be secured using hashicorp vault.
