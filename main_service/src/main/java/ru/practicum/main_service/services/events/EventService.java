package ru.practicum.main_service.services.events;

import ru.practicum.main_service.dto.events.*;
import ru.practicum.main_service.models.Event;

import java.time.LocalDateTime;
import java.util.List;

public interface EventService {
    List<EventShortDto> getUserEventsPrivate(long userId, Integer from, Integer size);

    EventFullDto addEventPrivate(NewEventDto newEventDto, long userId);

    EventFullDto getEventDtoByIdPrivate(long userId, long eventId, String ip);

    Event getEventById(long eventId);

    EventFullDto updateEventByUserIdPrivate(long userId, long eventId, UpdateEventUserRequest updateEventUserRequest);

    List<Event> getAllEventsIn(List<Long> eventIds);

    List<EventFullDto> getAllEventsAdmin(List<Long> users, List<String> states, List<Long> categories, LocalDateTime rangeStart, LocalDateTime rangeEnd, Integer from, Integer size);

    EventFullDto updateEventAdmin(UpdateEventAdminRequest updateEventAdminRequest, long eventId);

    List<EventShortDto> getAllEventsPublic(String text, List<Long> categories, Boolean paid, LocalDateTime rangeStart, LocalDateTime rangeEnd, Boolean onlyAvailable, String sort, Integer from, Integer size, String requestURI, String remoteAddr);

    EventFullDto getEventByIdPublic(long id, String requestURI, String remoteAddr);
}
