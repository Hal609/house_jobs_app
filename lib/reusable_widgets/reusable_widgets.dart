import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    color: Colors.white,
  );
}

Image imageLogo(String imageName, bool hasColour, Color colour, double size) {
  return Image(
    image: AssetImage(imageName),
    color: hasColour ? colour : null,
    height: size,
    width: size,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, Function changed) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    onChanged: (String) {
      changed();
    },
  );
}

Container reusableButton(
    BuildContext context,
    Color baseColour,
    Color tapColour,
    String text,
    Color textColour,
    double textSize,
    FontWeight textWeight,
    Alignment alignment,
    bool hasIcon,
    Function onTap,
    [Widget icon = const SizedBox.shrink()]) {
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            alignment: alignment,
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return tapColour;
              }
              return baseColour;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
        child: hasIcon
            ? Row(mainAxisSize: MainAxisSize.min, children: [
                icon,
                const SizedBox(
                  width: 15,
                ),
                Text(text,
                    style: TextStyle(
                        color: textColour,
                        fontWeight: textWeight,
                        fontSize: textSize))
              ])
            : Text(text,
                style: TextStyle(
                    color: textColour,
                    fontWeight: textWeight,
                    fontSize: textSize)),
      ));
}
