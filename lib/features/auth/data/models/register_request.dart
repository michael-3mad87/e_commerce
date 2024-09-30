class RegisterRequest {
  final String name;
  final String email;
  final String phone;
  final String password;
 const RegisterRequest(
    this.name,
    this.email,
    this.phone,
    this.password,
  );
  Map<String, dynamic> toJSon() => {
     "name":name,
    "email":email,
    "password":password,
    "rePassword":password,
    "phone":phone,
  };
}
