class ProjectMember {
  final String employeeId;
  final String role;

  ProjectMember({required this.employeeId, required this.role});

  factory ProjectMember.fromJson(Map<String, dynamic> json) {
    return ProjectMember(
      employeeId: json['employeeId'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'role': role,
    };
  }
}

class ProjectModel {
  final String id;
  final String name;
  final String deadline;
  final List<ProjectMember> team;

  ProjectModel({
    required this.id,
    required this.name,
    required this.deadline,
    required this.team,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      deadline: json['deadline'],
      team: (json['team'] as List)
          .map((member) => ProjectMember.fromJson(member))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'deadline': deadline,
      'team': team.map((member) => member.toJson()).toList(),
    };
  }
}