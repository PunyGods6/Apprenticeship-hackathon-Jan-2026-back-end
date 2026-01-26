package com.hackathon.otj_logger.repository;

import com.hackathon.otj_logger.model.JournalEntry;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JournalEntryRepository extends JpaRepository<JournalEntry, Long> {
}
