class Project {
  final String projectId;
  final String projectName;
  final String roleInProject;

  Project({required this.projectId, required this.projectName, required this.roleInProject});

  Map<String, dynamic> toJson() => {
    'projectId': projectId,
    'projectName': projectName,
    'roleInProject': roleInProject,
  };
}
