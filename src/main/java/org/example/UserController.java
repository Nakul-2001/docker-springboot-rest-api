package org.example;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @GetMapping
    public List<Map<String, Object>> getUsers() {
        return List.of(
                Map.of("id", 1, "name", "Rahul"),
                Map.of("id", 2, "name", "Amit"),
                Map.of("id", 3, "name", "Priya")
        );
    }

    @GetMapping("/{id}")
    public Map<String, Object> getUser(@PathVariable int id) {
        return Map.of("id", id, "name", "Rahul");
    }
}
