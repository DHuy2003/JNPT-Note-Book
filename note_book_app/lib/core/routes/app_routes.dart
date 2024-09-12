import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:note_book_app/presentation/web/home/pages/home_page_web.dart';
import 'package:note_book_app/presentation/web/level/pages/level_page_web.dart';
import 'package:note_book_app/presentation/web/not_found/pages/not_found_page_web.dart';

abstract class AppRoutes {
  static GoRouter goRouterConfig() {
    return GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: "/",
          redirect: (context, state) => "/home",
        ),
        GoRoute(
          path: "/home",
          pageBuilder: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SystemChrome.setApplicationSwitcherDescription(
                const ApplicationSwitcherDescription(
                  label: "JNPT Note Book",
                ),
              );
            });
            return NoTransitionPage(
              child: const HomePageWeb(),
              key: state.pageKey,
            );
          },
          routes: [
            GoRoute(
              path: ":level",
              pageBuilder: (context, state) {
                final level = state.pathParameters['level'];
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  SystemChrome.setApplicationSwitcherDescription(
                    ApplicationSwitcherDescription(
                      label: "$level",
                    ),
                  );
                });
                return NoTransitionPage(
                  child: const LevelPageWeb(),
                  key: state.pageKey,
                );
              },
            ),
          ],
        ),
      ],
      errorPageBuilder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          SystemChrome.setApplicationSwitcherDescription(
            const ApplicationSwitcherDescription(
              label: "Page Not Found",
            ),
          );
        });
        return NoTransitionPage(
          child: const NotFoundPageWeb(),
          key: state.pageKey,
        );
      },
    );
  }
}
