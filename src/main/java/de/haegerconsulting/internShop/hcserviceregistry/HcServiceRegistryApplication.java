package de.haegerconsulting.internShop.hcserviceregistry;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class HcServiceRegistryApplication {

	public static void main(String[] args) {
		SpringApplication.run(HcServiceRegistryApplication.class, args);
	}

}
