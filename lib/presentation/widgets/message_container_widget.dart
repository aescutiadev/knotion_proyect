import 'package:flutter/material.dart';

enum MessageType { INFO, SUCCESS, ERROR }

class MessageContainerWidget extends StatelessWidget {
  final String message;
  final MessageType type;

  const MessageContainerWidget({
    Key? key,
    required this.message,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: _getColorByType(type)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            _getIconByType(type),
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              message,
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorByType(MessageType type) {
    switch (type) {
      case MessageType.INFO:
        return Colors.blueAccent;
      case MessageType.ERROR:
        return Colors.red;
      case MessageType.SUCCESS:
        return Colors.green;
      default:
        return Colors.blueAccent;
    }
  }

  IconData _getIconByType(MessageType type) {
    switch (type) {
      case MessageType.INFO:
        return Icons.info_outline;
      case MessageType.ERROR:
        return Icons.dangerous;
      case MessageType.SUCCESS:
        return Icons.check_circle_outline;
      default:
        return Icons.info;
    }
  }
}
