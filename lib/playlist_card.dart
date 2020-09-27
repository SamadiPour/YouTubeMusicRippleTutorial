import 'package:flutter/material.dart';
import 'package:inked_box/inked_box.dart';
import 'package:youtube_music_ripple_tutorial/data.dart';
import 'package:youtube_music_ripple_tutorial/custom_ink_splash.dart';

class PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  final double pieceSize;

  PlaylistCard(this.playlist, this.pieceSize);

  static const InteractiveInkFeatureFactory fasterSplash = InkSplashFactory(
    splashFadeDuration: Duration(milliseconds: 120),
    unconfirmedSplashDuration: Duration(milliseconds: 600),
  );

  @override
  Widget build(BuildContext context) {
    InkedBox inkBox = InkedBox(
      child: Ink(
        height: pieceSize * 3.7,
        width: pieceSize * 3.7,
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: NetworkImage(playlist.image),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          onTap: _onTap,
          splashFactory: fasterSplash,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );

    return Material(
      color: Colors.transparent,
      child: InkedChildWidget(
        borderRadius: BorderRadius.circular(4),
        inkBox: inkBox,
        splashFactory: fasterSplash,
        onTap: _onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: pieceSize * 3.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inkBox,
              SizedBox(height: 7),
              Container(
                child: Text(
                  playlist.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 3),
              Container(
                child: Text(
                  playlist.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {}
}
