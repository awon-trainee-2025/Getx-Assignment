class Project {
  final String projectId;
  final String projectName;
  final String roleInProject;

  Project({
    required this.projectId,
    required this.projectName,
    required this.roleInProject,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectId: json['projectId'],
      projectName: json['projectName'],
      roleInProject: json['roleInProject'],
    );
  }

  Map<String, dynamic> toJson() => {
        'projectId': projectId,
        'projectName': projectName,
        'roleInProject': roleInProject,
      };
}
