class PortfolioCarouselModel {
  String amount;
  String title1;
  String title2;
  String subtitle;
  String progressStart;
  String progressEnd;
  double percentage;

  PortfolioCarouselModel(String title1, String title2, String amount, String subtitle, String progressStart, String progressEnd, double percentage) {
    this.amount = amount;
    this.title2 = title2;
    this.title1 = title1;
    this.subtitle = subtitle;
    this.progressStart = progressStart;
    this.progressEnd = progressEnd;
    this.percentage = percentage;
  }
}