import 'package:flutter/material.dart';

void main() => runApp(ModalBottomSheetDemo());

class ModalBottomSheetDemo extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return Center(
	child: RaisedButton(
		child: const Text('showModalBottomSheet'),
		onPressed: () {
		// adding some properties
		showModalBottomSheet(
			context: context,
			// color is applied to main screen when modal bottom screen is displayed
			barrierColor: Colors.greenAccent,
			//background color for modal bottom screen
			backgroundColor: Colors.yellow,
			//elevates modal bottom screen
			elevation: 10,
			// gives rounded corner to modal bottom screen
			shape: RoundedRectangleBorder(
			borderRadius: BorderRadius.circular(10.0),
			),
			builder: (BuildContext context) {
			return Container(
				height: 200,
				child: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
					const Text('GeeksforGeeks'),
					],
				),
				),
			);
			},
		);
		},
	),
	);
}
}
