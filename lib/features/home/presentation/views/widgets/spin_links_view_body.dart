import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spin_links/features/home/presentation/views/widgets/custom_list_of_spins.dart';
import '../../../data/ad_helper.dart';

class SpinLinksViewBody extends StatefulWidget {
  const SpinLinksViewBody({Key? key}) : super(key: key);

  @override
  State<SpinLinksViewBody> createState() => _SpinLinksViewBodyState();
}

class _SpinLinksViewBodyState extends State<SpinLinksViewBody> {
  late BannerAd _bottomBannerAd;
  bool _isBottomBannerAdLoaded = false;

  void _createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBottomBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bottomBannerAd.load();
  }

  @override
  void initState() {
    _createBottomBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bottomBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _isBottomBannerAdLoaded
          ? SizedBox(
              height: _bottomBannerAd.size.height.toDouble(),
              width: _bottomBannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bottomBannerAd),
            )
          : null,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Spin Links'),
      ),
      body: const CustomListOfSpins(
        color: Colors.blue,
        icon: Icons.offline_bolt,
      ),
    );
  }
}
