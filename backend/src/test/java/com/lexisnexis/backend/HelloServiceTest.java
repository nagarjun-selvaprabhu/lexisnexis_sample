package com.lexisnexis.backend;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class HelloServiceTest {

    @Test
    void testHello() {
        String message = "Hello from Backend!";
        assertEquals("Hello from Backend!", message);
    }
}
