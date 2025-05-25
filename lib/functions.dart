import 'models/department.dart';

Map<String, dynamic> displayEngineeringEmployees(Map<String, dynamic> data) {
  if (!data.containsKey('departments')) return {};

  var departments = data['departments'] as Map<String, dynamic>;
  if (!departments.containsKey('engineering')) return {};

  var engineeringJson = departments['engineering'] as Map<String, dynamic>;

  var engineeringDept = Department.fromJson('engineering', engineeringJson);

  return {
    'engineeringEmployees': engineeringDept.employees.map((e) => e.toJson()).toList(),
  };
}

Map<String, dynamic> displayProjectsOfEmployees(Map<String, dynamic> data) {
  Map<String, dynamic> result = {};

  if (!data.containsKey('departments')) return result;

  var departments = data['departments'] as Map<String, dynamic>;

  departments.forEach((deptName, deptData) {
    var dept = Department.fromJson(deptName, deptData);
    for (var emp in dept.employees) {
      result[emp.name] = emp.projects?.map((p) => p.toJson()).toList() ?? [];
    }
  });

  return result;
}
