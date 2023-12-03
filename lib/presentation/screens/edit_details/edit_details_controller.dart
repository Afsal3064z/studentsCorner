import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:studentsapp/presentation/screens/home/home_page.dart';

class EditStudentDetailsController extends GetxController {
  late String editedName;
  late String editedClass;
  late String editedRoll;
  late String studentDocumentId;

  // Method to initialize data
  void initData(
      String name, String studentClass, String roll, String documentId) {
    editedName = name;
    editedClass = studentClass;
    editedRoll = roll;
    studentDocumentId = documentId;
  }

  // Method to save edited details
  void saveEditedDetails() {
    if (editedName.isEmpty) {
      // Handle empty name case
      Get.snackbar('Error', 'Please enter a student name');
      return;
    }

    FirebaseFirestore.instance
        .collection('students')
        .doc(studentDocumentId)
        .update({
      'name': editedName,
      'class': editedClass,
      'rollNumber': editedRoll,
    }).then((value) {
      Get.off(() =>  HomePage());
    }).catchError((error) {
      // Handle error while updating
      Get.snackbar('Error', 'Failed to save edited details');
    });
  }

  // Method to cancel the edit
  void cancelEdit() {
    Get.off(() =>  HomePage());
  }
}

final EditStudentDetailsController editStudentDetailsController =
    Get.put(EditStudentDetailsController());
