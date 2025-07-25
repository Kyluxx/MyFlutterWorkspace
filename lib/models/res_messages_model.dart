class ResMessagesModel {
  final String msg;
  final String status;

  ResMessagesModel({required this.msg, required this.status});
  factory ResMessagesModel.fromJson(Map<String, dynamic> json) {
    return ResMessagesModel(
      msg: json['msg'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
      'status': status,
    };
  }
}