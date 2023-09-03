import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ConstrainedBox(
          constraints: widget.isExpanded
              ? BoxConstraints()
              : BoxConstraints(maxHeight: 50.0.h),
          child: Text(
            widget.text,
            softWrap: true,
            overflow: TextOverflow.fade,
          )),
      widget.isExpanded
          ? Container()
          : InkWell(
              onTap: () {
                setState(() => widget.isExpanded = true);
              },
              child: const Text(
                'Read more',
                style: TextStyle(color: Colors.blue),
              ),
            )
    ]);
  }
}
