// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class contect extends StatefulWidget {
  const contect({Key? key}) : super(key: key);

  @override
  State<contect> createState() => _contectState();
}

class _contectState extends State<contect> {
  bool isFirst = true;

  TextEditingController nameController = TextEditingController(text: "Hello");
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = "";

  final ImagePicker picker = ImagePicker();
  String? filePath;
  XFile? xFile;

  @override
  void initState() {
    // nameController.text="Ravi";
    // emailController.text="ravi007@gmail.com";
    // phoneController.text="9898989898";
    // addressController.text="150 ring";
    // address1Controller.text="raj";
    // address2Controller.text="ind";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xC5FFFFFF),
      appBar: AppBar(
        title: Text("Resumes Workspace"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    isFirst = true;
                    setState(() {});
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Contact",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      if (isFirst)
                        Divider(
                          thickness: 3,
                          height: 3,
                          color: Colors.yellow,
                        )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    isFirst = false;
                    setState(() {});
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.blue,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Photo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      if (!isFirst)
                        Divider(
                          thickness: 3,
                          height: 3,
                          color: Colors.yellow,
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: IndexedStack(
                index: isFirst ? 0 : 1,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: 400,
                      width: 400,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(21),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Icons.mail,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(Icons.phone_android, color: Colors.grey),
                              SizedBox(width: 15),
                              Expanded(
                                child: TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  onSaved: (newValue) {},
                                  validator: (value) {
                                    if (value?.isEmpty ?? false) {
                                      return "Enter Phone Number";
                                    } else if (int.tryParse(value ?? "") == null) {
                                      return "Enter Valid Phone Number";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Phone",
                                    // prefix: Icon(Icons.phone_android),
                                    // prefixIcon: Icon(Icons.phone_android),
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  children: [
                                    TextField(
                                      keyboardType: TextInputType.streetAddress,
                                      obscureText: true,
                                      obscuringCharacter: "-",
                                      decoration: InputDecoration(
                                        hintText: "Address",
                                        // prefix: Icon(Icons.phone_android),
                                        // prefixIcon: Icon(Icons.phone_android),
                                        hintStyle: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: "Address Line 1",
                                        // prefix: Icon(Icons.phone_android),
                                        // prefixIcon: Icon(Icons.phone_android),
                                        hintStyle: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: "Address Line 2",
                                        // prefix: Icon(Icons.phone_android),
                                        // prefixIcon: Icon(Icons.phone_android),
                                        hintStyle: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Stack(
                      children: [
                        Container(
                          height: 230,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),

                          child: Padding(
                            padding: const EdgeInsets.all(60),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.black12,
                              foregroundColor: Colors.black,
                              backgroundImage: xFile != null
                                  ? FileImage(
                                File(xFile?.path ?? ""),
                              )
                                  : null,
                              child: Text("Add"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 115,left: 205),
                          child: InkWell(
                            onTap: (){
                              if (formKey.currentState?.validate() ?? false) {
                                FocusScope.of(context).unfocus(); // For keyboard Close
                                formKey.currentState?.save();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("Save Successfully"),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                  action: SnackBarAction(
                                    label: "Send",
                                    onPressed: () {},
                                  ),
                                ));

                                print("Save $name");
                              } else {
                                print("Invalid");
                              }
                            },
                            child: IconButton(
                                onPressed: () {
                                  picker.pickImage(source: ImageSource.gallery).then((value) {
                                    xFile = value;
                                    setState(() {});
                                  });
                                },
                                icon: Icon(Icons.add_circle,color: Colors.blue,)),
                          )
                          ),

                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
