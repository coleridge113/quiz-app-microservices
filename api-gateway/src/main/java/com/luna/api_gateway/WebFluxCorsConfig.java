package com.luna.api_gateway;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;
import java.util.List;

@Configuration
public class WebFluxCorsConfig {

    @Bean
    CorsWebFilter corsWebFilter() {
        System.out.println("CORS WebFilter is being initialized...");
        CorsConfiguration corsConfig = new CorsConfiguration();
        corsConfig.setAllowedOrigins(List.of("http://localhost:8084", "http://localhost:5174")); // Allow all origins
        corsConfig.setAllowedMethods(List.of("GET", "POST")); // Allow all HTTP methods
        corsConfig.setAllowedHeaders(List.of("*")); // Allow all headers
        corsConfig.setAllowCredentials(true); // Allow credentials (e.g., cookies)

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", corsConfig);

        // System.out.println("CORS CONFIG ALLOWED ORIGINS: " + corsConfig.getAllowedOrigins());

        return new CorsWebFilter(source);
    }
}