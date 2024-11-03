enum CardCategory {
  popularMovies,
  nowInCinemas,
  comingSoon,
}

extension CardThemeExtension on CardCategory {
  String get value {
    switch (this) {
      case CardCategory.popularMovies:
        return 'Popular Movies';
      case CardCategory.nowInCinemas:
        return 'Now in Cinemas';
      case CardCategory.comingSoon:
        return 'Coming Soon';
      default:
        return '';
    }
  }
}
