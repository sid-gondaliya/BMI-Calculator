import 'package:flutter/material.dart';

const Color MaleButtonEnable = Colors.lightBlue;
const Color FemaleButtonEnable = Colors.pinkAccent;
const Color DisableButton = Colors.white;

class GenderIcon extends StatelessWidget {
  final IconTheme icon;
  final String label;
  final Function ontap;
  GenderIcon({this.icon, this.label, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
          onPressed: ontap,
          child: icon,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class ContainerCard extends StatelessWidget {
  final Widget childwidget;
  final double w;
  final double h;
  ContainerCard({this.childwidget, this.w, this.h});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * w,
      height: MediaQuery.of(context).size.height * h,
      child: childwidget,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
