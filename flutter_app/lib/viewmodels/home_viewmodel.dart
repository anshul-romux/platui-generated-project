import 'package:flutter/foundation.dart';
import '../models/destination_model.dart';

enum PlanType { countries, regional }

class HomeViewModel extends ChangeNotifier {
  // State
  PlanType _selectedPlanType = PlanType.countries;
  String _searchQuery = '';
  String _selectedContinent = 'Europe';
  
  // Mock Data
  final List<Destination> _allDestinations = [
    Destination(id: '1', name: 'Cuba', flagEmoji: '🇨🇺', continent: 'North America'),
    Destination(id: '2', name: 'Cyprus', flagEmoji: '🇨🇾', continent: 'Europe'),
    Destination(id: '3', name: 'Iceland', flagEmoji: '🇮🇸', continent: 'Europe'),
    Destination(id: '4', name: 'Russia', flagEmoji: '🇷🇺', continent: 'Europe'),
    Destination(id: '5', name: 'Azerbaijan', flagEmoji: '🇦🇿', continent: 'Asia'),
  ];

  // Getters
  PlanType get selectedPlanType => _selectedPlanType;
  String get selectedContinent => _selectedContinent;
  
  List<Destination> get filteredDestinations {
    return _allDestinations.where((dest) {
      final matchesSearch = dest.name.toLowerCase().contains(_searchQuery.toLowerCase());
      // In a real app, you might filter by continent here too
      return matchesSearch;
    }).toList();
  }

  // Actions
  void setPlanType(PlanType type) {
    _selectedPlanType = type;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setContinent(String continent) {
    _selectedContinent = continent;
    notifyListeners();
  }
}
