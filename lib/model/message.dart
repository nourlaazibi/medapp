class MessageModel {
  final String id;
  final String text;
  final String sender;
  final String receiver;
  String seenBy;
  final String timestamp;

  MessageModel({
    required this.id,
    required this.text,
    required this.sender,
    required this.receiver,
    required this.seenBy,
    required this.timestamp,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      text: map['text'],
      sender: map['sender'],
      seenBy: map['seenBy'],
      receiver: map['receiver'],
      timestamp: map['timestamp'] 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'sender': sender,
      'receiver': receiver,
      'seenBy': seenBy,
      'timestamp': timestamp,
    };
  }
}
