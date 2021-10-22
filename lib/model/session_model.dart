class Session {
  String? name;
  String? lastname;
  String? email;
  String? password;
  String? employeId;

  Session({
    this.name,
    this.lastname,
    this.email,
    this.password,
    this.employeId,
  });

  Session.fromService(Map<String, dynamic> data) {
    name = data['name'];
    lastname = data['lastname'];
    email = data['email'];
    employeId = data['employe_id'];
  }

  Session.fromDatabase(Map<String, dynamic> data) {
    name = data['name'];
    lastname = data['lastname'];
    email = data['email'];
    employeId = data['employe_id'];
  }

  Map<String, dynamic> toDatabase() => {
        "name": name,
        "lastname": lastname,
        "email": email,
        "employe_id": employeId,
      };
}

class UserSession {
  Session? session;

  UserSession();

  UserSession.fromJsonList(dynamic json) {
    if (json == null) return;

    session = Session.fromService(json);
  }
}
