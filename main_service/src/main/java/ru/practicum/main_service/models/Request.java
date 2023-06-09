package ru.practicum.main_service.models;

import lombok.Getter;
import lombok.Setter;
import ru.practicum.main_service.util.EventRequestStatus;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "requests")
public class Request {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "created")
    private LocalDateTime created;
    @ManyToOne()
    @JoinColumn(name = "event_id")
    private Event event;
    @ManyToOne()
    @JoinColumn(name = "requester_id")
    private User requester;
    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private EventRequestStatus status = EventRequestStatus.PENDING;
}
