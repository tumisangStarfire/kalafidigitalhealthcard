
class ApiResponse {
  String _status;
  String _message;
  String _data;

  ApiResponse({String status, String message, String data, int code}) {
    this._status = _status;
    this._message = message;
    this._data = data;

  }

  String get getStatus => _status;
  set setStatus(String status) => _status = _status;
  String get getMessage => _message;
  set setMessage(String message) => _message = message;
  String get getData => _data;
  set setData(String data) => _data = data;


  ApiResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    data['data'] = this._data;
    return data;
  }

  @override
  String toString() {
    return "Status : $_status \n Message : $_message \n Data : $_data";
  }
}
