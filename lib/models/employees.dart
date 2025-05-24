class employees {
  Departments? departments;
  Projects? projects;

  employees({this.departments, this.projects});

  employees.fromJson(Map<String, dynamic> json) {
    departments =
        json['departments'] != null
            ? new Departments.fromJson(json['departments'])
            : null;
    projects =
        json['projects'] != null
            ? new Projects.fromJson(json['projects'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.departments != null) {
      data['departments'] = this.departments!.toJson();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.toJson();
    }
    return data;
  }
}

class Departments {
  Engineering? engineering;
  Marketing? marketing;

  Departments({this.engineering, this.marketing});

  Departments.fromJson(Map<String, dynamic> json) {
    engineering =
        json['engineering'] != null
            ? new Engineering.fromJson(json['engineering'])
            : null;
    marketing =
        json['marketing'] != null
            ? new Marketing.fromJson(json['marketing'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.engineering != null) {
      data['engineering'] = this.engineering!.toJson();
    }
    if (this.marketing != null) {
      data['marketing'] = this.marketing!.toJson();
    }
    return data;
  }
}

class Engineering {
  List<Employees>? employees;

  Engineering({this.employees});

  Engineering.fromJson(Map<String, dynamic> json) {
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  String? id;
  String? name;
  String? role;
  Contact? contact;
  List<Projects>? projects;

  Employees({this.id, this.name, this.role, this.contact, this.projects});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contact {
  String? email;
  String? phone;

  Contact({this.email, this.phone});

  Contact.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Projects {
  String? projectId;
  String? projectName;
  String? roleInProject;

  Projects({this.projectId, this.projectName, this.roleInProject});

  Projects.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    projectName = json['projectName'];
    roleInProject = json['roleInProject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['projectName'] = this.projectName;
    data['roleInProject'] = this.roleInProject;
    return data;
  }
}

class Marketing {
  List<Employees>? employees;
  Budget? budget;

  Marketing({this.employees, this.budget});

  Marketing.fromJson(Map<String, dynamic> json) {
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
    budget =
        json['budget'] != null ? new Budget.fromJson(json['budget']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    if (this.budget != null) {
      data['budget'] = this.budget!.toJson();
    }
    return data;
  }
}

class Budget {
  int? total;
  List<Expenses>? expenses;

  Budget({this.total, this.expenses});

  Budget.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['expenses'] != null) {
      expenses = <Expenses>[];
      json['expenses'].forEach((v) {
        expenses!.add(new Expenses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.expenses != null) {
      data['expenses'] = this.expenses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Expenses {
  String? item;
  int? amount;

  Expenses({this.item, this.amount});

  Expenses.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['amount'] = this.amount;
    return data;
  }
}

class Projects1 {
  ProjectA? projectA;
  ProjectA? projectB;
  ProjectA? projectC;
  ProjectA? projectD;

  Projects1({this.projectA, this.projectB, this.projectC, this.projectD});

  Projects1.fromJson(Map<String, dynamic> json) {
    projectA =
        json['projectA'] != null
            ? new ProjectA.fromJson(json['projectA'])
            : null;
    projectB =
        json['projectB'] != null
            ? new ProjectA.fromJson(json['projectB'])
            : null;
    projectC =
        json['projectC'] != null
            ? new ProjectA.fromJson(json['projectC'])
            : null;
    projectD =
        json['projectD'] != null
            ? new ProjectA.fromJson(json['projectD'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projectA != null) {
      data['projectA'] = this.projectA!.toJson();
    }
    if (this.projectB != null) {
      data['projectB'] = this.projectB!.toJson();
    }
    if (this.projectC != null) {
      data['projectC'] = this.projectC!.toJson();
    }
    if (this.projectD != null) {
      data['projectD'] = this.projectD!.toJson();
    }
    return data;
  }
}

class ProjectA {
  String? id;
  String? name;
  String? deadline;
  List<Team>? team;

  ProjectA({this.id, this.name, this.deadline, this.team});

  ProjectA.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deadline = json['deadline'];
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(new Team.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['deadline'] = this.deadline;
    if (this.team != null) {
      data['team'] = this.team!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  String? employeeId;
  String? role;

  Team({this.employeeId, this.role});

  Team.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['role'] = this.role;
    return data;
  }
}
