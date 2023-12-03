import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentsapp/presentation/screens/adding_details/adding_details_controller.dart';

class AddDetailsScreen extends StatelessWidget {
  const AddDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            addDetailsController.clearControllers();
            Get.back();
          },
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 30,
          ),
        ),
        elevation: 4.0,
        shadowColor: Colors.grey.shade400,
        title: const Text(
          "Add the details of the student",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 115, 46, 233),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white24, Color.fromARGB(255, 91, 54, 255)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                        blurRadius: 6,
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.deepPurple,
                  ),
                  width: 150,
                  height: 150,
                  child: addDetailsController.selectedImage.value != null
                      ? ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          child: Image.memory(
                            addDetailsController
                                .selectedImage.value!.files.single.bytes!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: addDetailsController.pickImage,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 6,
                      spreadRadius: 0,
                    )
                  ],
                  color: Colors.deepPurple.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                width: 300,
                height: 50,
                child: TextField(
                  controller: addDetailsController.nameController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Enter Student Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 6,
                      spreadRadius: 0,
                    )
                  ],
                  color: Colors.deepPurple.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                width: 300,
                height: 50,
                child: TextField(
                  controller: addDetailsController.classController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Enter Student Class",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 6,
                      spreadRadius: 0,
                    )
                  ],
                  color: Colors.deepPurple.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                width: 300,
                height: 50,
                child: TextField(
                  controller: addDetailsController.rollController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Enter Student Roll",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 5),
                          blurRadius: 6,
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.green.shade400,
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                    ),
                    width: 100,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        addDetailsController.uploadStudentDetails();
                        // addDetailsController.clearControllers();
                        // Get.back();
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 5),
                          blurRadius: 6,
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.red.shade400,
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                    ),
                    width: 150,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        addDetailsController.clearControllers();
                        Get.back();
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
