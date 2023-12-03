import 'package:flutter/material.dart';

//This is the container which is used to accepts the username, email,password from the user
class FormContainerWidget extends StatefulWidget {
  final Key? fieldKey;
  final bool isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final TextEditingController? controller;

  const FormContainerWidget({
    super.key,
    this.fieldKey,
    required this.isPasswordField,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.controller,
  });

  @override
  FormContainerWidgetState createState() => FormContainerWidgetState();
}

class FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.deepPurple.shade300,
          filled: true,
          hintText: widget.hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: widget.isPasswordField
              //This is the icon in the trailing of text form fied to check the fiels is passord or note
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    //while user click on the visibility icon for the obscure text
                    //while tapping in the same icon again the icon will change accordingly
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText ? Colors.deepPurple : Colors.white,
                  ),
                )
              : null, // Remove the suffixIcon for non-password fields
        ),
      ),
    );
  }
}
