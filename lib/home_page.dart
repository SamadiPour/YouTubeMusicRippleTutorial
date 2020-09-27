import 'package:flutter/material.dart';
import 'package:youtube_music_ripple_tutorial/artist_card.dart';
import 'package:youtube_music_ripple_tutorial/data.dart';
import 'package:youtube_music_ripple_tutorial/playlist_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - 80;
    final eachBox = height / 2;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Music"),
        backgroundColor: Color(0xff1D1D1D),
      ),
      body: ListView(
        children: [
          _buildBox(
            size: eachBox,
            title: 'Mood Playlists',
            children: playlists
                .map((item) => PlaylistCard(item, eachBox / 8))
                .toList(),
          ),
          _buildBox(
            size: eachBox,
            title: 'Top Artists',
            children: artists
                .map((item) => ArtistCard(item, eachBox / 8))
                .toList(),
          ),
          _buildBox(
            size: eachBox,
            title: 'Mood Playlists',
            children: playlists
                .map((item) => PlaylistCard(item, eachBox / 8))
                .toList(),
          ),
          _buildBox(
            size: eachBox,
            title: 'Top Artists',
            children: artists
                .map((item) => ArtistCard(item, eachBox / 8))
                .toList(),
          ),
        ],
      ),
    );
  }

  _buildBox({
    @required double size,
    @required List<Widget> children,
    @required String title,
  }) {
    final pieceSize = size / 8;
    return Container(
      height: size,
      padding: EdgeInsets.only(top: pieceSize, bottom: pieceSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: pieceSize,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 5 * pieceSize,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
