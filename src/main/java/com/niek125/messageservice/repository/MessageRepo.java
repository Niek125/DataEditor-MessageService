package com.niek125.messageservice.repository;

import com.niek125.messageservice.models.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MessageRepo extends JpaRepository<Message, String> {
    @Query("select m from message m where m.projectId = :projectId order by m.sendTime")
    List<Message> findMessagesByProjectId(@Param("projectId") String projectId);
}
