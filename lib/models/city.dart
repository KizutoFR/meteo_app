class City {
  final String name;

  const City({
    required this.name,
  });

  static City fromJson(Map<String, Object?> json) => City(
    name: json['name'] as String
  );

  Map<String, Object?> toJson() => {
    'name': name
  };
}