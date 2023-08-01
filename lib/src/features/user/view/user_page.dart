import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/src/features/user/provider/user_provider.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userProvider);
    final isLoading = ref.watch(isLoadingUserProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(userProvider.notifier).fetchUsers,
        child: const Icon(Icons.refresh),
      ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(data[index].name ?? ""),
                    subtitle: Text(data[index].gender ?? ""),
                    visualDensity: const VisualDensity(vertical: 1.0),
                  );
                }));
  }
}
