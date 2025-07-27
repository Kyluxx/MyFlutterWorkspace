import 'package:flutter_application_1/global/types.dart';
import 'package:flutter_application_1/models/res_messages_model.dart';

void resCodeCallback(
  ResMessagesModel resMsg, {
  required ResCallback onSuccess,
  required ResCallback onFail,
}) {
  if (resMsg.status == "200") {
    onSuccess(msg: resMsg.msg);
  } else {
    onFail(msg: resMsg.msg);
  }
}
