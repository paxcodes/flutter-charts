import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedBarChart(this.seriesList, {this.animate});

  factory StackedBarChart.withSampleData() {
    return new StackedBarChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(3),
        groupingType: charts.BarGroupingType.stacked,
        strokeWidthPx: 2,
      ),
      primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
        labelOffsetFromAxisPx: 15,
        labelStyle: new charts.TextStyleSpec(
          fontSize: 18,
          color: charts.Color(r: 0xDC, g: 0xDC, b: 0xDC, a: 0xFF),
        ),
        lineStyle: new charts.LineStyleSpec(
          color: charts.Color(r: 0xDC, g: 0xDC, b: 0xDC, a: 0x55),
        ),
      )),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: new charts.SmallTickRendererSpec(
          labelOffsetFromAxisPx: 15,
          labelStyle: new charts.TextStyleSpec(
            fontSize: 18,
            color: charts.Color(r: 0xDC, g: 0xDC, b: 0xDC, a: 0xFF),
          ),
        ),
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Desktop',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesData,
          colorFn: (_, __) =>
              charts.MaterialPalette.purple.shadeDefault.lighter),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault.darker,
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
