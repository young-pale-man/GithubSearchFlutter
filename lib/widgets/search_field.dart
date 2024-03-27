import 'package:flutter/material.dart';
import 'package:github_search/constants.dart';
import 'package:github_search/widgets/search_field_button.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.onInput,
  });

  final Function(String) onInput;

  @override
  State<StatefulWidget> createState() {
    return _SearchField();
  }
}

class _SearchField extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();
  bool _validate = true;

  void performSearch() {
    setState(() {
      _validate = _searchController.text.isEmpty;
    });
    if (_validate) {
    } else {
      widget.onInput(_searchController.text);
    }
  }

  OutlineInputBorder fieldBorder(bool isNotActive) {
    if (isNotActive) {
      return const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      );
    } else {
      return const OutlineInputBorder(
        borderSide: BorderSide(
          color: kAccentPrimary,
          style: BorderStyle.solid,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.search,
      onSubmitted: (context) {
        performSearch();
      },
      onChanged: (context) {
        setState(() {
          _validate = _searchController.text.isEmpty;
        });
      },
      style: kHeaderMain.copyWith(color: kTextPrimary),
      cursorColor: kAccentPrimary,
      decoration: InputDecoration(
        prefixIcon: SearchFieldButton(
          onPressed: performSearch,
          iconPath: 'lib/assets/Search.png',
        ),
        suffixIcon: _validate
            ? null
            : SearchFieldButton(
                onPressed: () {
                  setState(() {
                    _searchController.clear();
                    _validate = true;
                  });
                },
                iconPath: 'lib/assets/Close.png',
              ),
        fillColor: _validate ? kLayer1 : kAccentSecondary,
        filled: true,
        hintText: "Search",
        hintStyle: kHeaderMain.copyWith(color: kTextPlaceholder),
        focusColor: kAccentPrimary,
        border: fieldBorder(_validate),
        focusedBorder: fieldBorder(_validate),
        enabledBorder: fieldBorder(_validate),
      ),
    );
  }
}
