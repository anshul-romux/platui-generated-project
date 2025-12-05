import 'package:flutter/foundation.dart';
import '../models/destination_model.dart';
import '../models/region_model.dart';

enum PlanType { countries, regional }

class HomeViewModel extends ChangeNotifier {
  // State
  PlanType _selectedPlanType = PlanType.regional; // Default to regional for demo
  String _searchQuery = '';
  String _selectedContinent = 'Europe';
  
  // Mock Data - Destinations
  final List<Destination> _allDestinations = [
    Destination(id: '1', name: 'Cuba', flagEmoji: '🇨🇺', continent: 'North America'),
    Destination(id: '2', name: 'Cyprus', flagEmoji: '🇨🇾', continent: 'Europe'),
    Destination(id: '3', name: 'Iceland', flagEmoji: '🇮🇸', continent: 'Europe'),
    Destination(id: '4', name: 'Russia', flagEmoji: '🇷🇺', continent: 'Europe'),
    Destination(id: '5', name: 'Azerbaijan', flagEmoji: '🇦🇿', continent: 'Asia'),
  ];

  // Mock Data - Regions
  final List<Region> _regions = [
    Region(
      id: 'africa',
      name: 'Africa',
      countryCount: 20,
      countries: List.generate(30, (index) => index % 2 == 0 ? 'Algeria' : 'Morocco'),
    ),
    Region(
      id: 'america',
      name: 'America',
      countryCount: 5,
      countries: ['USA', 'Canada', 'Mexico', 'Brazil', 'Argentina'],
    ),
    Region(
      id: 'asia',
      name: 'Asia',
      countryCount: 12,
      countries: ['China', 'Japan', 'India', 'Thailand', 'Vietnam', 'Korea', 'Indonesia'],
    ),
  ];

  // Getters
  PlanType get selectedPlanType => _selectedPlanType;
  String get selectedContinent => _selectedContinent;
  List<Region> get regions => _regions;
  
  List<Destination> get filteredDestinations {
    return _allDestinations.where((dest) {
      final matchesSearch = dest.name.toLowerCase().contains(_searchQuery.toLowerCase());
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
