class Response {
  int code;
  String message;
  int token;
  String status;

  Response(int code, String message, String status,int token) {
    this.code = code;
    this.message = message;
    this.token = token;
    this.status =  status;
  }

  Response.fromJson(Map json)
      : code = json['code'],
        message = json['message'],
        status = json['status'],
        token = json['token'];

  Map toJson() {
    return {'code': code, 'message': message, 'status': status,'token':token };
  }
}