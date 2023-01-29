import 'package:flutter/material.dart';

import '../../../bookmarks/UI/pages/bookmarks_page.dart';
import '../../../details/UI/details_page.dart';

detailsPage(BuildContext context, String movieId) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DetailsPage(movieId)));
}

bookmarksPage(BuildContext context,String id) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => BookmarksPage()));
}
