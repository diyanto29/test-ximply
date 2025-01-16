import 'package:flutter/material.dart';
import 'package:fonta_app/app/modules/profile/models/profile_model/data_profile.dart';

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget({
    super.key,
    this.data,
  });
  final DataProfile? data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716044962/tje4vyigverxlotuhvpb.png",
            scale: 100),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data?.name ?? '',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data?.mobilePhone ?? '-',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
      subtitle: Text(data?.email ?? ''),
      trailing: const Icon(
        Icons.edit,
        size: 24.0,
      ),
    );
  }
}
