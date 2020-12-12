// To parse this JSON data, do
//
//     final estudianteHp = estudianteHpFromJson(jsonString);

import 'dart:convert';

List<EstudianteHp> estudianteHpFromJson(String str) => List<EstudianteHp>.from(json.decode(str).map((x) => EstudianteHp.fromJson(x)));

String estudianteHpToJson(List<EstudianteHp> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EstudianteHp {
    EstudianteHp({
        this.name,
        this.species,
        this.gender,
        this.house,
        this.dateOfBirth,
        this.yearOfBirth,
        this.ancestry,
        this.eyeColour,
        this.hairColour,
        this.wand,
        this.patronus,
        this.hogwartsStudent,
        this.hogwartsStaff,
        this.actor,
        this.alive,
        this.image,
    });

    String name;
    Species species;
    Gender gender;
    String house;
    String dateOfBirth;
    dynamic yearOfBirth;
    String ancestry;
    String eyeColour;
    String hairColour;
    Wand wand;
    String patronus;
    bool hogwartsStudent;
    bool hogwartsStaff;
    String actor;
    bool alive;
    String image;

    factory EstudianteHp.fromJson(Map<String, dynamic> json) => EstudianteHp(
        name: json["name"],
        species: speciesValues.map[json["species"]],
        gender: genderValues.map[json["gender"]],
        house: json["house"],
        dateOfBirth: json["dateOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        ancestry: json["ancestry"],
        eyeColour: json["eyeColour"],
        hairColour: json["hairColour"],
        wand: Wand.fromJson(json["wand"]),
        patronus: json["patronus"],
        hogwartsStudent: json["hogwartsStudent"],
        hogwartsStaff: json["hogwartsStaff"],
        actor: json["actor"],
        alive: json["alive"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "species": speciesValues.reverse[species],
        "gender": genderValues.reverse[gender],
        "house": house,
        "dateOfBirth": dateOfBirth,
        "yearOfBirth": yearOfBirth,
        "ancestry": ancestry,
        "eyeColour": eyeColour,
        "hairColour": hairColour,
        "wand": wand.toJson(),
        "patronus": patronus,
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alive": alive,
        "image": image,
    };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({
    "female": Gender.FEMALE,
    "male": Gender.MALE
});

enum Species { HUMAN }

final speciesValues = EnumValues({
    "human": Species.HUMAN
});

class Wand {
    Wand({
        this.wood,
        this.core,
        this.length,
    });

    String wood;
    String core;
    dynamic length;

    factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: json["wood"],
        core: json["core"],
        length: json["length"],
    );

    Map<String, dynamic> toJson() => {
        "wood": wood,
        "core": core,
        "length": length,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
