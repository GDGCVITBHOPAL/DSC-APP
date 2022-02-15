import 'package:dsc_client/configs/assets.dart';

class SliderModel {
  String? imageAssetPath;
  String? title;
  String? desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String? getImageAssetPath() {
    return imageAssetPath;
  }

  String? getTitle() {
    return title;
  }

  String? getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("");
  sliderModel.setTitle(
      "Stay in the know \n \n \n Keep track of all our previous and upcoming events.");
  sliderModel.setImageAssetPath(Assets.dsc_logo);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("");
  sliderModel.setTitle(
      "Learn and grow \n \n \n Read technical blogs and articles written by the team.");
  sliderModel.setImageAssetPath(Assets.second_page);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("");
  sliderModel.setTitle("Ready? Let's Go!");
  sliderModel.setImageAssetPath(Assets.thirdPage);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
