class Student {
  final String name;
  final String className;

  Student({
    required this.name,
    required this.className,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['hoten'],
      className: json['tenlop'],
    );
  }
}
