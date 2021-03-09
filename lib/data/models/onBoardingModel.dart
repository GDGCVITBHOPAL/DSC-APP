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
  sliderModel.setDesc("discover people");
  sliderModel.setTitle("Developer Student Club");
  sliderModel.setImageAssetPath(Assets.dsc_logo);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("discover thyself");
  sliderModel.setTitle("A community which inspires thousands.");
  sliderModel.setImageAssetPath(Assets.vitb_dsc_logo);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("discover so much");
  sliderModel.setTitle("Learn || Develope || Success");
  sliderModel.setImageAssetPath(Assets.thirdPage);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
