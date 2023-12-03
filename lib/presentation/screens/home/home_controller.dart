import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Map<String, dynamic>> studentDataList = <Map<String, dynamic>>[].obs;

  Future<void> fetchStudentData(RxBool refresh) async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('students').get();
      final dataList = snapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data(),
              })
          .toList();
      studentDataList.value = dataList;
      if (refresh.value) {
        refresh.value = false; // Reset the refresh flag
      }
    } catch (e, stackTrace) {
      // ignore: avoid_print
      print('Error fetching student data: $e');
      // ignore: avoid_print
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> deleteStudentData(String documentId, RxBool refresh) async {
    try {
      await FirebaseFirestore.instance
          .collection('students')
          .doc(documentId)
          .delete();
      studentDataList.removeWhere((student) => student['id'] == documentId);
      if (refresh.value) {
        refresh.value = false; // Reset the refresh flag
      }
    } catch (e, stackTrace) {
      // ignore: avoid_print
      print('Error deleting student data: $e');
      // ignore: avoid_print
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> confirmDeleteStudent(
      BuildContext context, String documentId, RxBool refresh) async {
    return Get.defaultDialog(
      title: 'Confirm Deletion',
      middleText: 'Are you sure you want to delete this student?',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      confirm: ElevatedButton(
        onPressed: () {
          deleteStudentData(documentId, refresh);
          Get.back(); // Close the dialog
        },
        child: const Text('Delete'),
      ),
    );
  }
}

final HomeController homeController = Get.put(HomeController());
