class ChatDetail {
  final int? id;
  final bool? isMe;
  final String? profile;
  final String? message;
  final int? messageNo;

  ChatDetail({this.id, this.isMe, this.profile, this.message, this.messageNo});
}

List<ChatDetail> chatDetails = [
  ChatDetail(
    id: 1,
    isMe: false,
    profile: "https://source.unsplash.com/500x500/?men,face",
    message: "Hey mate!",
    messageNo: 1,
  ),
  ChatDetail(
    id: 2,
    isMe: false,
    profile: "https://source.unsplash.com/500x500/?men,face",
    message: "How are you doing?",
    messageNo: 3,
  ),
  ChatDetail(
    id: 3,
    isMe: true,
    profile: "",
    message: "Hi!",
    messageNo: 1,
  ),
  ChatDetail(
    id: 4,
    isMe: true,
    profile: "",
    message: "Fine.",
    messageNo: 2,
  ),
  ChatDetail(
    id: 5,
    isMe: true,
    profile: "",
    message: "Tngai mon khernh u tv aeon2",
    messageNo: 3,
  ),
  ChatDetail(
    id: 6,
    isMe: false,
    profile: "https://source.unsplash.com/500x500/?men,face",
    message: "Nhuii mix min hav pg",
    messageNo: 0,
  ),
  ChatDetail(
    id: 6,
    isMe: true,
    profile: "",
    message: "Eng hav ter tae yg tver min lir ey na",
    messageNo: 1,
  ),
  ChatDetail(
    id: 6,
    isMe: true,
    profile: "",
    message: "😒😒😒",
    messageNo: 3,
  ),
  ChatDetail(
    id: 7,
    isMe: false,
    profile: "https://source.unsplash.com/500x500/?men,face",
    message: "Tv oy ke somtos",
    messageNo: 1,
  ),
  ChatDetail(
    id: 8,
    isMe: false,
    profile: "https://source.unsplash.com/500x500/?men,face",
    message: "Lv nv na c ey ot?",
    messageNo: 3,
  ),
  ChatDetail(
    id: 9,
    isMe: true,
    profile: "",
    message: "Tos",
    messageNo: 1,
  ),
  ChatDetail(
    id: 10,
    isMe: true,
    profile: "",
    message: "C nv na?",
    messageNo: 3,
  ),
  ChatDetail(
    id: 11,
    isMe: false,
    profile: "https://source.unsplash.com/500x500/?men,face",
    message: "Bunchon IFL?",
    messageNo: 0,
  ),
  ChatDetail(
    id: 12,
    isMe: true,
    profile: "",
    message: "Okay",
    messageNo: 0,
  ),
];
