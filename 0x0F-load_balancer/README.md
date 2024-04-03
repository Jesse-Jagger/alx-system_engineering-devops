AD BALANCER
=================

A load balancer is a critical component used to distribute incoming network traffic across multiple servers or resources. Its primary purpose is to enhance the performance, reliability, and scalability of web applications by efficiently managing the workload among the available servers.

## This is how it works:
======================

### Traffic Distribution: When a client makes a request to access a web application, such as visiting a website or using an API, the request first reaches the load balancer. Instead of directly sending the request to a single server, the load balancer evaluates the current load on each server and decides where to forward the request.

### Load Distribution Algorithms: Load balancers employ various algorithms to determine how to distribute incoming requests. These algorithms can be based on factors such as server health, server response time, or simply distributing requests evenly across all available servers.

### Scalability and Redundancy: Load balancers play a crucial role in scaling web applications horizontally. As the number of incoming requests increases, additional servers can be added to the server pool, and the load balancer will automatically distribute the workload across these new servers. Similarly, if a server becomes unavailable due to maintenance or failure, the load balancer can redirect traffic to the remaining healthy servers, ensuring high availability and redundancy.

### Health Monitoring: Load balancers continuously monitor the health and performance of the servers in the pool. If a server becomes unresponsive or experiences issues, the load balancer can detect this and stop sending requests to that server until it becomes healthy again.

### Session Persistence: In some cases, it's necessary to maintain session persistence, ensuring that a user's requests are always directed to the same server to preserve session state. Load balancers can implement techniques such as cookie-based session affinity to achieve this while still distributing the overall workload effectively.


