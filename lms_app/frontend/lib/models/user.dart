class User{
    String id;
    String name;
    String username;
    String email;
    String password;

    User({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.password,
    });

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            id: json['_id'],
            name: json['name'],
            username: json['username'],
            email: json['email'],
            password: json['password'],
        );
    }

    Map<String, dynamic> toJson() {
        return {
            '_id': id,
            'name': name,
            'username': username,
            'email': email,
            'password': password,
        };
    }
}