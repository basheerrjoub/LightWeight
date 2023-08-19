import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  final String adUnitId;
  final int size;


  BannerAdWidget({required this.adUnitId, required this.size});

  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  late List<dynamic> adsize;

  @override
  void initState() {
    super.initState();
    adsize = [
      AdSize.banner,
      AdSize.largeBanner,
      AdSize.mediumRectangle,
      AdSize.fullBanner,
      AdSize.leaderboard,
    ];
    initBannerAd();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }

  void initBannerAd() {
    bannerAd = BannerAd(
      size: adsize[widget.size],
      adUnitId: widget.adUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return isAdLoaded
        ? SizedBox(
      height: bannerAd.size.height.toDouble(),
      width: bannerAd.size.width.toDouble(),
      child: AdWidget(ad: bannerAd),
    )
        : SizedBox(height: 50); // Adjust this as per your needs
  }
}
