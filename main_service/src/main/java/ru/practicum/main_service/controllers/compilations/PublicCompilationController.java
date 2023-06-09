package ru.practicum.main_service.controllers.compilations;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;
import ru.practicum.main_service.dto.compilations.CompilationDto;
import ru.practicum.main_service.services.compilations.CompilationService;

import java.util.List;

@RestController
@RequestMapping("/compilations")
@AllArgsConstructor
public class PublicCompilationController {
    private final CompilationService compilationService;

    @GetMapping()
    public List<CompilationDto> getAllCompilations(@RequestParam(name = "pinned", required = false) boolean pinned,
                                                   @RequestParam(name = "from", defaultValue = "0") Integer from,
                                                   @RequestParam(name = "size", defaultValue = "10") Integer size) {
        return compilationService.getAllCompilations(pinned, from, size);
    }

    @GetMapping("/{compId}")
    public CompilationDto getCompilationById(@PathVariable long compId) {
        return compilationService.getCompilationById(compId);
    }
}
