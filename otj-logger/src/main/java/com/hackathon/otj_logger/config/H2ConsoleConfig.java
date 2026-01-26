package com.hackathon.otj_logger.config;

import jakarta.servlet.Servlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Arrays;

@Configuration
public class H2ConsoleConfig {

    @Bean
    public ServletRegistrationBean<Servlet> h2ConsoleServletRegistration() throws Exception {
        // Prefer Jakarta servlet variant (org.h2.server.web.JakartaWebServlet)
        Class<?> servletClass = Class.forName("org.h2.server.web.JakartaWebServlet");
        Servlet servlet = (Servlet) servletClass.getDeclaredConstructor().newInstance();
        ServletRegistrationBean<Servlet> registration = new ServletRegistrationBean<>(servlet);
        registration.setName("H2Console");
        registration.setLoadOnStartup(1);
        // register both exact and wildcard mappings
        registration.setUrlMappings(Arrays.asList("/h2-console", "/h2-console/*"));
        System.out.println("H2Console servlet registered at /h2-console");
        return registration;
    }

}
