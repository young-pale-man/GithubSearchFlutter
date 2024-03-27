import 'package:flutter/material.dart';
import 'package:github_search/components/boxes.dart';
import 'package:github_search/constants.dart';
import 'package:github_search/models/repo.dart';

class ResultCard extends StatefulWidget {
  const ResultCard({
    super.key,
    required this.resultTitle,
    required this.resultID,
  });

  final String resultTitle;
  final int resultID;

  @override
  State<StatefulWidget> createState() {
    return _ResultCard();
  }
}

class _ResultCard extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite(int key) {
      try {
        if (boxFavoritesRepositories.get(key).isFavorite != false) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    }

    void chosedAsFavorite(int key) {
      setState(() {
        if (boxFavoritesRepositories.get(key) != null) {
          boxFavoritesRepositories.delete(widget.resultID);
        } else {
          boxFavoritesRepositories.put(
            widget.resultID,
            Repo(title: widget.resultTitle),
          );
        }
      });
    }

    return SizedBox(
      height: 55,
      child: Card(
        color: kLayer1,
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0.3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  widget.resultTitle,
                  style: kHeaderBody.copyWith(color: kTextPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  chosedAsFavorite(widget.resultID);
                },
                icon: ImageIcon(
                  const AssetImage('lib/assets/Favorite_active.png'),
                  color: isFavorite(widget.resultID)
                      ? kAccentPrimary
                      : kTextPlaceholder,
                  size: 20,
                ),
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
