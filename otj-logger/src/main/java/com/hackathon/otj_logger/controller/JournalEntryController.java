package com.hackathon.otj_logger.controller;

import com.hackathon.otj_logger.model.JournalEntry;
import com.hackathon.otj_logger.repository.JournalEntryRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.util.List;

@RestController
@RequestMapping("/entries")
public class JournalEntryController {

    private final JournalEntryRepository repository;

    public JournalEntryController(JournalEntryRepository repository) {
        this.repository = repository;
    }

    @GetMapping
    public List<JournalEntry> list() {
        return repository.findAll();
    }

    @PostMapping
    public ResponseEntity<JournalEntry> create(@RequestBody JournalEntry entry) {
        JournalEntry saved = repository.save(entry);
        return ResponseEntity.created(URI.create("/entries/" + saved.getId())).body(saved);
    }
}

