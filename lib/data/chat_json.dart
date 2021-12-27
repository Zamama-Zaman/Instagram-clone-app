class Chat {
  final String? id;
  final String? profile;
  final String? username;
  final String? description;
  final String? dateTime;

  Chat({this.id, this.profile, this.username, this.description, this.dateTime});
}

List<Chat> chats = [
  Chat(
    id: '1',
    profile: 'https://source.unsplash.com/500x500/?men,face',
    username: 'Alex Bob',
    dateTime: 'now',
    description: 'Active',
  ),
  Chat(
    id: '2',
    profile: 'https://source.unsplash.com/500x500/?nature,girl,face',
    username: 'Sobhan Joodi',
    dateTime: '2h ago',
    description: 'Active',
  ),
  Chat(
    id: '3',
    profile: 'https://source.unsplash.com/500x500/?child,face',
    username: 'Christopher Ben',
    dateTime: 'now',
    description: 'Active',
  ),
  Chat(
    id: '4',
    profile: 'https://source.unsplash.com/500x500/?nature,flower',
    username: 'Zanab Ilyas',
    dateTime: '3h ago',
    description: 'Active',
  ),
  Chat(
    id: '5',
    profile: 'https://source.unsplash.com/500x500/?bike',
    username: 'Yuris Alhumaydy',
    dateTime: 'now',
    description: 'Active',
  ),
];
