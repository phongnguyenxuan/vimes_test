import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vimes_test/models/model.dart';

class CloudService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addData({required Model model}) async {
    try {
      await EasyLoading.show();
      await firestore.collection("data").doc().set(model.toMap());
      await EasyLoading.showSuccess(
        "Ghi dữ liệu thành công",
        duration: const Duration(milliseconds: 500),
      );
    } on FirebaseException catch (e) {
      await EasyLoading.showError(
          "Đã xảy ra lỗi vui lòng thử lại\n"
          "Mã lỗi ${e.code}",
          duration: const Duration(milliseconds: 500));
    }
  }
}
