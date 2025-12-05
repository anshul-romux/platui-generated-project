import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/region_model.dart';

class RegionCard extends StatefulWidget {
  final Region region;
  final bool isInitiallyExpanded;

  const RegionCard({
    super.key,
    required this.region,
    this.isInitiallyExpanded = false,
  });

  @override
  State<RegionCard> createState() => _RegionCardState();
}

class _RegionCardState extends State<RegionCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isInitiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: widget.isInitiallyExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.cyan.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.public, color: Colors.cyan.shade700, size: 28),
          ),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.region.name,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                if (widget.region.countryCount > 0)
                  TextSpan(
                    text: ' (${widget.region.countryCount} countries)',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF64748B),
                    ),
                  ),
              ],
            ),
          ),
          trailing: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _isExpanded ? const Color(0xFF86EFAC) : const Color(0xFFD1FAE5), // Green shades
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 24,
            ),
          ),
          children: [
            _buildCountryGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate number of items per column for a 3-column layout
        // This is a simplified grid implementation to match the visual list style
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3.5, // Adjust for text height
            crossAxisSpacing: 8,
            mainAxisSpacing: 4,
          ),
          itemCount: widget.region.countries.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(
                  '${index + 1}. ',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.region.countries[index],
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF334155),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
