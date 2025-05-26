class Contact {
  String? email;
  String? phone;

  Contact({this.email, this.phone});

  Contact.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}

class Project {
  String? projectId;
  String? projectName;
  String? roleInProject;

  Project({this.projectId, this.projectName, this.roleInProject});

  Project.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectName = json['projectName'];
    roleInProject = json['roleInProject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['projectId'] = projectId;
    data['projectName'] = projectName;
    data['roleInProject'] = roleInProject;
    return data;
  }
}

class Employee {
  String? id;
  String? name;
  String? role;
  Contact? contact;
  List<Project>? projects;

  Employee({this.id, this.name, this.role, this.contact, this.projects});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    if (json['projects'] != null) {
      projects =
          (json['projects'] as List).map((e) => Project.fromJson(e)).toList();
    } else {
      projects = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    if (projects != null) {
      data['projects'] = projects!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
