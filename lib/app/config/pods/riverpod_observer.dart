import 'dart:developer';

import 'package:fonta_app/app/config/pods/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Log.info('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue",
  "newValue": "$newValue",
  "providerContainer": "$container"
}''');
    if (previousValue != null) inspect(previousValue);
    inspect(newValue);
  }
}
