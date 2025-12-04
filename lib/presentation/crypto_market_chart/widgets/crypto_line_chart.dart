import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:challenge_crypto_tracker_lite/domain/domain.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoLineChart extends StatelessWidget {
  final List<TimeValueEntity> prices;

  const CryptoLineChart({required this.prices, super.key});

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots = prices
        .map((TimeValueEntity e) => FlSpot(e.timestampMs.toDouble(), e.value))
        .toList();

    final NumberFormat formatter = NumberFormat.compactCurrency(
      decimalDigits: 1,
      symbol: "\$",
    );

    final double minY = spots
        .map((FlSpot e) => e.y)
        .reduce((double a, double b) => a < b ? a : b);
    final double maxY = spots
        .map((FlSpot e) => e.y)
        .reduce((double a, double b) => a > b ? a : b);

    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  _bottomLabel(value, prices),
                  style: const TextStyle(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 10,
                  ),
                );
              },
              interval: (spots.last.x - spots.first.x) / 6,
            ),
          ),
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: (maxY - minY) / 4,
              reservedSize: 50,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  formatter.format(value),
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.onSurfaceVariant,
                  ),
                );
              },
            ),
          ),
        ),
        minX: spots.first.x,
        maxX: spots.last.x,
        gridData: FlGridData(
          getDrawingHorizontalLine: (double value) => const FlLine(
            color: AppColors.outline,
            strokeWidth: 1,
            dashArray: <int>[4, 4],
          ),
          drawVerticalLine: false,
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: AppColors.outline),
            left: BorderSide(color: AppColors.outline),
            right: BorderSide(color: Colors.transparent, width: 0),
            top: BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
        lineBarsData: <LineChartBarData>[
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: AppColors.error,
            barWidth: 2.5,
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.error.withValues(alpha: 0.15),
            ),
            dotData: const FlDotData(show: false),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (List<LineBarSpot> touchedSpots) {
              return touchedSpots.map((LineBarSpot spot) {
                return LineTooltipItem(
                  _formatTooltip(spot.x, spot.y),
                  const TextStyle(
                    color: AppColors.onSurface,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }

  String _bottomLabel(double value, List<TimeValueEntity> prices) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(
      value.toInt(),
      isUtc: true,
    );
    return "${date.month}/${date.day}";
  }

  String _formatTooltip(double x, double y) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(
      x.toInt(),
      isUtc: true,
    );

    final String dateFormatted = DateFormat('dd-MM-yyyy').format(date);

    final String priceFormatted = NumberFormat.currency(
      symbol: "\$",
      decimalDigits: 2,
    ).format(y);

    return "$dateFormatted\n$priceFormatted";
  }
}
