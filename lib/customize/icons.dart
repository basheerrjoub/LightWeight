class MeditationSvgAssets {
  static final MeditationSvgAssets _instance = MeditationSvgAssets._internal();

  factory MeditationSvgAssets() {
    return _instance;
  }

  MeditationSvgAssets._internal();

  Map<AssetName, String> assets = {
    AssetName.search: "assets/icons/search.svg",
    AssetName.vectorBottom: "assets/images/Vector.svg",
    AssetName.vectorTop: "assets/images/Vector-1.svg",
    AssetName.headphone: "assets/icons/headphone.svg",
    AssetName.tape: "assets/icons/tape.svg",
    AssetName.vectorSmallBottom: "assets/images/VectorSmallBottom.svg",
    AssetName.vectorSmallTop: "assets/images/VectorSmallTop.svg",
    AssetName.back: "assets/icons/back.svg",
    AssetName.heart: "assets/icons/heart.svg",
    AssetName.chart: "assets/icons/chart.svg",
    AssetName.discover: "assets/icons/discover.svg",
    AssetName.profile: "assets/icons/profile.svg",
    AssetName.chest: "assets/icons/chest.svg",
    AssetName.triceps: "assets/icons/triceps.svg",
    AssetName.backBody: "assets/icons/backBody.svg",
    AssetName.biceps: "assets/icons/biceps.svg",
    AssetName.legs: "assets/icons/legs.svg",
    AssetName.abs: "assets/icons/abs.svg",
    AssetName.shoulders: "assets/icons/shoulders.svg",
    AssetName.forearms: "assets/icons/forearms.svg",
    AssetName.workout: "assets/icons/workout.svg",
    AssetName.bodybuilding: "assets/icons/bodybuilding.svg",
    AssetName.cardio: "assets/icons/cardio.svg",
    AssetName.diet: "assets/icons/diet.svg",
    AssetName.favourite: "assets/icons/favourite.svg",
    AssetName.bmi: "assets/icons/bmi.svg",
    AssetName.bulb: "assets/icons/bulb.svg",

  };
}

enum AssetName {
  search,
  vectorBottom,
  vectorTop,
  headphone,
  tape,
  vectorSmallBottom,
  vectorSmallTop,
  back,
  heart,
  chart,
  discover,
  profile,
  chest,
  triceps,
  backBody,
  biceps,
  legs,
  abs,
  shoulders,
  forearms,
  workout,
  bodybuilding,
  cardio,
  diet,
  favourite,
  bmi,
  bulb

}