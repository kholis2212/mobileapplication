
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/features/dashboard/data/model/dashboard_model.dart';
import 'package:flutter_application_1/features/dashboard/data/repositories/dashboard_repository.dart';

// Repository provider
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository();
});

// Simple future provider for one-time dashboard data fetch
final dashboardDataProvider = FutureProvider.autoDispose<DashboardData>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  return repository.getDashboardData();
});

// State notifier for managing complex dashboard state
class DashboardNotifier extends StateNotifier<AsyncValue<DashboardData>> {
  final DashboardRepository _repository;

  DashboardNotifier(this._repository) : super(const AsyncValue.loading());

  /// Load dashboard data from repository
  Future<void> loadDashboard() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getDashboardData();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Refresh dashboard data
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.refreshDashboard();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Update user name locally (example of partial state update)
  void updateUserName(String newName) {
    state.whenData((data) {
      state = AsyncValue.data(data.copyWith(userName: newName));
    });
  }
}

// Provider for DashboardNotifier (auto-dispose)
final dashboardNotifierProvider = StateNotifierProvider.autoDispose<DashboardNotifier, AsyncValue<DashboardData>>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return DashboardNotifier(repository);
});

// Selected statistic index (e.g., which chart is highlighted)
final selectedStatIndexProvider = StateProvider<int>((ref) => 0);

// Theme mode: false = light, true = dark
final themeModeProvider = StateProvider<bool>((ref) => false);