import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/widgets/coin_links_view.dart';
import '../../features/home/presentation/views/widgets/spin_links_view.dart';

abstract class AppRouter {
  static const coinLinks = '/CoinLinks';
  static const spinLinks = '/SpinLinks';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: coinLinks,
        builder: (context, state) => const CoinLinksView(),
      ),
      GoRoute(
        path: spinLinks,
        builder: (context, state) => const SpinLinksView(),
      ),
    ],
  );
}
