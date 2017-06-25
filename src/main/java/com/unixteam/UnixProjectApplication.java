package com.unixteam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
@EnableWebMvc
public class UnixProjectApplication extends WebMvcConfigurerAdapter {

	@Bean
	public ViewResolver jspViewResolver(){

		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/sources/");
		resolver.setSuffix(".jsp");
		resolver.setContentType("text/html; charset=UTF-8");

		return resolver;
	}

	@Bean
	public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
		ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
		resolver.setContentNegotiationManager(manager);

		// Define all possible view resolvers
		List<ViewResolver> resolvers = new ArrayList<ViewResolver>();


		resolvers.add(jspViewResolver());

		resolver.setViewResolvers(resolvers);
		return resolver;
	}
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/sources/**").addResourceLocations("/sources/");
	}

	public static void main(String[] args) {
		SpringApplication.run(UnixProjectApplication.class, args);
	}
}
