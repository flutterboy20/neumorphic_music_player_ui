class SongDetails {
  SongDetails(
      {required this.imageUrl,
      required this.songName,
      required this.artistName,
      required this.songDuration});

  String imageUrl;
  String songName;
  String artistName;
  String songDuration;

  factory SongDetails.fromJson(Map<String, dynamic> json) => SongDetails(
        imageUrl: json["imageUrl"],
        songName: json["songName"],
        artistName: json["artistName"],
        songDuration: json["songDuration"],
      );
}
