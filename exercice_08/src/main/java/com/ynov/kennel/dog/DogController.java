package com.ynov.kennel.dog;

import jakarta.validation.Valid;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/api/v1/dogs")
public class DogController {

    private final DogRepository repository;

    public DogController(DogRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public List<Dog> findAll() {
        return repository.findAll();
    }

    @GetMapping("/{dogId}")
    public Dog findById(@PathVariable Long dogId) {
        return repository.findById(dogId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Dog not found"));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Dog create(@Valid @RequestBody Dog dog) {
        dog.setId(null); // l'ID est toujours généré par la base
        return repository.save(dog);
    }

    @PutMapping("/{dogId}")
    public Dog update(@PathVariable Long dogId, @Valid @RequestBody Dog dog) {
        Dog existing = findById(dogId);
        existing.setName(dog.getName());
        existing.setBirthDate(dog.getBirthDate());
        existing.setBreed(dog.getBreed());
        existing.setSterilized(dog.isSterilized());
        return repository.save(existing);
    }

    @DeleteMapping("/{dogId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long dogId) {
        if (!repository.existsById(dogId)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Dog not found");
        }
        repository.deleteById(dogId);
    }
}
