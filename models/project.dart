import 'project_team_member.dart';

class Project {
  final String id;
  final String name;
  final String deadline;
  final List<ProjectTeamMember> team;

  Project({
    required this.id,
    required this.name,
    required this.deadline,
    required this.team,
  });
}
