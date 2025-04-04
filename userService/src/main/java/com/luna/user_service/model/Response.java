package com.luna.user_service.model;

import jakarta.persistence.Id;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class Response {
    @Id
    private final int id;
    private final String answer;
}
