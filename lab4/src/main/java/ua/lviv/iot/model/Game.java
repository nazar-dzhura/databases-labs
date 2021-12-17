package ua.lviv.iot.model;

import lombok.*;
import ua.lviv.iot.annotations.Column;
import ua.lviv.iot.annotations.PrimaryKey;
import ua.lviv.iot.annotations.Table;

@Table(name = "game")
@NoArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "id")
public class Game {

    @PrimaryKey
    @Column(name = "id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "developer_id")
    private Integer developerId;

    @Column(name = "system_requirement_id")
    private Integer systemRequirementId;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "language_id")
    private Integer languageId;

}
