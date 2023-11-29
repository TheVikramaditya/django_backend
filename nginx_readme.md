






    What is NGINX

        Nginx is a web server, reverse proxy and load balancer.
        When designing web software systems at scale which receive a lot of traffic, it's not advisable to
        have requests made directly from your browser or any other client straight to your application server
        hosted on GCP or any other host.    
            Typically, web content is not served like that.

    So how is web content served and where does Nginx fit in all this?

        Nginx sits in front of other web servers and thus it acts as a reverse proxy.
        
        A reverse proxy is a web server that sits in front of other web servers.
        It can encrypt outgoing traffic, set additional security features, and even redirect traffic based
        on the domain or port you want to access.

        So now when a client makes a request, the request is not directly made to the application server hosted
        on AWS, GCP, Digital Ocean.

        The request is made to the Nginx server, then the Nginx server forwards the request to the application
        server.

        It also helps with encryption and security.
        That is, the server is encrypting and decrypting data sent and returned, which is mostly done via
        HTTPS.

    Horizontal Scaling and Vertical Scaling

        Horizontal scaling means scaling by adding more machines to your pool of resources also described as
                                                SCALING OUT.
                                            
        Whereas vertical scaling refers to scaling by adding more power.For example, a CPU and RAM to an existing machine also described as 
                                                SCALING UP.
    
    Issue with horizontal scaling 

        When we carry out horizontal scaling, an issue presents itself.How will request from a client be distributed across the machines?
                                        Here is where Nginx now acts as a load balancer.

        A load balancer acts like a traffic cop sitting in front of your servers and routing client requests
        across all servers capable of fulfilling those requests.

        It does this in a manner that maximizes speed and capacity utilization and ensures that no one server
        is overworked, which could degrade performance.
        This is done with different algorithms, the most common one being round robin.

########################################################################################################################################################## 
    