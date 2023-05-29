package ru.practicum.main_service.dto.categories;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class NewCategoryDto {
    @NotBlank
    @Size(max = 50)
    private String name;
}
