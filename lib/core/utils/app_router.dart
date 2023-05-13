import 'package:go_router/go_router.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/widgets/coin_links_view.dart';
import '../../features/home/presentation/views/widgets/spin_links_view.dart';

abstract class AppRouter {
  static const CoinLinks = '/CoinLinks';
  static const SpinLinks = '/SpinLinks';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: CoinLinks,
        builder: (context, state) => const CoinLinksView(),
      ),
      GoRoute(
        path: SpinLinks,
        builder: (context, state) => const SpinLinksView(),
      ),
    ],
  );
}
