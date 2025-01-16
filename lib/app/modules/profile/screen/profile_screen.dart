import 'package:flutter/material.dart';
import 'package:fonta_app/app/modules/auth/pods/auth_pod.dart';
import 'package:fonta_app/app/modules/profile/pods/profile_pod.dart';
import 'package:fonta_app/app/modules/profile/screen/widget/balance_points_widget.dart';
import 'package:fonta_app/app/modules/profile/screen/widget/header_profile_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    Future.microtask(() => ref.read(profilePodProvider.notifier).getProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profilePod = ref.watch(profilePodProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          actions: const [],
        ),
        body: profilePod.when(
          data: (data) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderProfileWidget(
                          data: data?.profile,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          "Saldo & Points",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BalancePointsWidget(
                          data: data?.balance,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pengaturan Akun",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const ListTile(
                          leading: Icon(Icons.pin_drop),
                          minLeadingWidth: 0.0,
                          title: Text('Daftar Alamat'),
                          subtitle: Text(
                            'Atur alamat pengiriman belanja',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(Icons.assured_workload),
                          minLeadingWidth: 0.0,
                          title: Text('Rekening Bank'),
                          subtitle: Text(
                            'Atur alat pembayaran belanja',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const ListTile(
                          leading: Icon(Icons.account_circle),
                          minLeadingWidth: 0.0,
                          title: Text('Hapus Account'),
                          subtitle: Text(
                            'Hapus account secara permanen',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.exit_to_app_rounded),
                          minLeadingWidth: 0.0,
                          onTap: () => _showExitDialog(context),
                          title: const Text('Logout'),
                          subtitle: const Text(
                            'Keluarkan account dari Aplikasi',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          error: (error, state) => Text(
            error.toString(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ));
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Apakah Anda ingin keluar?'),
          content: const Text('Anda akan keluar dari aplikasi ini.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(authPodProvider.notifier).logout();
              },
              child: const Text('Keluar'),
            ),
          ],
        );
      },
    );
  }
}
