A three-tier architecture in AWS which can be used in a client server application where the application has a frontend, backend and database. Each of these tiers has a specific task and can be managed independently.

Here in the code I have added simple ec2 instance for front end and backend, but using autoscaling groups we can ensure the high availability and almost zero downtime for the applications which I have depicted using the diagram. Also it could be created in separate region for high availability. Using autoscaling groups would also help in auto maintenance of the server size. 


<img width="428" alt="image" src="https://user-images.githubusercontent.com/119726781/205720885-b09a172e-3b11-469a-b7a6-5f3105569286.png">
