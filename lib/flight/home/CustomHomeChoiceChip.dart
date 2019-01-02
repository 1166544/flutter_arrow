import 'package:flutter/material.dart';

/**
 * 选择按钮
 */
class ChoiceChipIcon extends StatefulWidget {
	final IconData icon;
	final String text;
	final bool isSelected;

	ChoiceChipIcon(this.icon, this.text, this.isSelected);

	@override
	_ChoiceChipState createState() => _ChoiceChipState();
}

/// 选择按钮状态处理类
class _ChoiceChipState extends State<ChoiceChipIcon> {
	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
			decoration: widget.isSelected
				? BoxDecoration(
					color: Colors.white.withOpacity(0.15),
					borderRadius: BorderRadius.all(Radius.circular(20.0))
				)
				: null,
			child: Row(
				mainAxisSize: MainAxisSize.min,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Icon(widget.icon, size: 20.0, color: Colors.white),
					SizedBox(width: 8.0),
					Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 16.0))
				],
			),
		);
	}
}

