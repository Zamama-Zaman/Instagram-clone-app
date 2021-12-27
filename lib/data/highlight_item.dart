class Highlight {
  String thumbnail;
  String title;
  Highlight({required this.thumbnail, required this.title});
}

List<Highlight> highlightItems = [
  Highlight(
      thumbnail: 'https://source.unsplash.com/500x500/?bike',
      title: "My Bike 🏍"),
  Highlight(
      thumbnail: 'https://source.unsplash.com/500x500/?cooking',
      title: "Cooking 🔪"),
  Highlight(
      thumbnail: 'https://source.unsplash.com/500x500/?nature',
      title: "Nature 🏞"),
  Highlight(
      thumbnail: 'https://source.unsplash.com/500x500/?pet', title: "Pet ❤️"),
  Highlight(
      thumbnail: 'https://source.unsplash.com/500x500/?pool', title: "Pool 🌊"),
  Highlight(
      thumbnail: 'https://source.unsplash.com/500x500/?yoga',
      title: "Yoga 💪🏻"),
];
