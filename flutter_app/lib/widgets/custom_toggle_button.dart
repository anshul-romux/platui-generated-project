import 'package:flutter/material.dart';
import '../viewmodels/home_viewmodel.dart';

class CustomToggleButton extends StatelessWidget {
  final PlanType selectedType;
  final Function(PlanType) onTypeChanged;

  const CustomToggleButton({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildButton(
              context,
              title: 'Countries',
              isSelected: selectedType == PlanType.countries,
              onTap: () => onTypeChanged(PlanType.countries),
            ),
          ),
          Expanded(
            child: _buildButton(
              context,
              title: 'Regional plans',
              isSelected: selectedType == PlanType.regional,
              onTap: () => onTypeChanged(PlanType.regional),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEA4C36) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade600,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
