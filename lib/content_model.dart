class UnboardingContent{
  late String image;
  late String title;
  late String description;
  UnboardingContent({required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents=[
  UnboardingContent(
      description: "Pick your food from our menu\n     More than 35 times",
      image: "assets/images/Untitled design(2).png",
      title: "Select from our\n  Best Menu"),
  UnboardingContent(
      description: "You can pay cash on delivery \n and Card payment is available",
      image:"assets/images/Untitled design(5).png",
      title: "Easy and Online payment"),
  UnboardingContent(
      description: "Deliver your food at your doorsteps",
      image: "assets/images/Untitled design(4).png",
      title: "Quick delivery at your doorsteps"),
];