import 'package:fonta_app/app/utils/shared_pref.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localPrefProvider = Provider<SharedPrefs>((ref) => SharedPrefs());
