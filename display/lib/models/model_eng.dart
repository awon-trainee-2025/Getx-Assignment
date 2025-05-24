class CompanyData {
  final Map<String, Department> departments;
  final Map<String, Project> projects;

  CompanyData({required this.departments, required this.projects});

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    return CompanyData(
      departments: (json['departments'] as Map<String, dynamic>).map(
        (k, v) => MapEntry(k, Department.fromJson(v)),
      ),
      projects: (json['projects'] as Map<String, dynamic>).map(
        (k, v) => MapEntry(k, Project.fromJson(v)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'departments': departments.map((k, v) => MapEntry(k, v.toJson())),
      'projects': projects.map((k, v) => MapEntry(k, v.toJson())),
    };
  }
}

class Department {
  final List<Employee> employees;
  final Budget? budget;

  Department({required this.employees, this.budget});

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      employees: (json['employees'] as List)
          .map((e) => Employee.fromJson(e))
          .toList(),
      budget: json['budget'] != null ? Budget.fromJson(json['budget']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employees': employees.map((e) => e.toJson()).toList(),
      if (budget != null) 'budget': budget!.toJson(),
    };
  }
}

class Employee {
  final String id;
  final String name;
  final String role;
  final Contact contact;
  final List<EmployeeProject>? projects;

  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.contact,
    this.projects,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      contact: Contact.fromJson(json['contact']),
      projects: json['projects'] != null
          ? (json['projects'] as List)
              .map((e) => EmployeeProject.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'contact': contact.toJson(),
      if (projects != null)
        'projects': projects!.map((e) => e.toJson()).toList(),
    };
  }
}

class Contact {
  final String email;
  final String phone;

  Contact({required this.email, required this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'phone': phone,
      };
}

class EmployeeProject {
  final String projectId;
  final String projectName;
  final String roleInProject;

  EmployeeProject({
    required this.projectId,
    required this.projectName,
    required this.roleInProject,
  });

  factory EmployeeProject.fromJson(Map<String, dynamic> json) {
    return EmployeeProject(
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

class Budget {
  final int total;
  final List<ExpenseItem> expenses;

  Budget({required this.total, required this.expenses});

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      total: json['total'],
      expenses: (json['expenses'] as List)
          .map((e) => ExpenseItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'expenses': expenses.map((e) => e.toJson()).toList(),
      };
}

class ExpenseItem {
  final String item;
  final int amount;

  ExpenseItem({required this.item, required this.amount});

  factory ExpenseItem.fromJson(Map<String, dynamic> json) {
    return ExpenseItem(
      item: json['item'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() => {
        'item': item,
        'amount': amount,
      };
}

class Project {final String id;
  final String name;
  final String deadline;
  final List<TeamMember> team;

  Project({
    required this.id,
    required this.name,
    required this.deadline,
    required this.team,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      deadline: json['deadline'],
      team: (json['team'] as List)
          .map((e) => TeamMember.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'deadline': deadline,
        'team': team.map((e) => e.toJson()).toList(),
      };
}

class TeamMember {
  final String employeeId;
  final String role;

  TeamMember({required this.employeeId, required this.role});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      employeeId: json['employeeId'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() => {
        'employeeId': employeeId,
        'role': role,
      };
    List<Map<String, dynamic>> getProjectsForEmployees(List<Employee> employees) {
  return employees.map((employee) {
    return {
      'employeeId': employee.id,
      'name': employee.name,
      'projects': employee.projects?.map((project) {
        return {
          'projectId': project.projectId,
          'projectName': project.projectName,
          'roleInProject': project.roleInProject,
        };
      }).toList() ?? [],
    };
  }).toList();
}  
}