package ua.lviv.iot.model;

import lombok.*;
import ua.lviv.iot.annotations.Column;
import ua.lviv.iot.annotations.PrimaryKey;
import ua.lviv.iot.annotations.Table;

import java.util.Date;

@Table(name = "user")
@NoArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "id")
public class User {

    @PrimaryKey
    @Column(name = "id")
    private Integer id;

    @Column(name = "nickname")
    private String nickname;

    @Column(name = "status_id")
    private Integer statusId;

    @Column(name = "last_played")
    private Date lastPlayed;

    @Column(name = "total_playtime")
    private Double totalPlaytime;

    @Column(name = "group_id")
    private Integer groupId;
}
