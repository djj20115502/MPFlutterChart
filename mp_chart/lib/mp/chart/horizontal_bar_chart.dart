import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mp_chart/mp/chart/bar_chart.dart';
import 'package:mp_chart/mp/core/axis/y_axis.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/functions.dart';
import 'package:mp_chart/mp/core/marker/horizontal_bar_chart_marker.dart';
import 'package:mp_chart/mp/core/marker/i_marker.dart';
import 'package:mp_chart/mp/core/render/x_axis_renderer.dart';
import 'package:mp_chart/mp/core/render/x_axis_renderer_horizontal_bar_chart.dart';
import 'package:mp_chart/mp/core/render/y_axis_renderer.dart';
import 'package:mp_chart/mp/core/render/y_axis_renderer_horizontal_bar_chart.dart';
import 'package:mp_chart/mp/core/transformer/transformer.dart';
import 'package:mp_chart/mp/core/transformer/transformer_horizontal_bar_chart.dart';
import 'package:mp_chart/mp/core/view_port.dart';
import 'package:mp_chart/mp/painter/horizontal_bar_chart_painter.dart';

class HorizontalBarChart extends BarChart {
  HorizontalBarChart(BarData data,
      {IMarker marker,
      Description description,
      AxisLeftSettingFunction axisLeftSettingFunction,
      AxisRightSettingFunction axisRightSettingFunction,
      XAxisSettingFunction xAxisSettingFunction,
      LegendSettingFunction legendSettingFunction,
      DataRendererSettingFunction rendererSettingFunction,
      OnChartValueSelectedListener selectionListener,
      Color backgroundColor,
      Color borderColor,
      double borderStrokeWidth = 1.0,
      int maxVisibleCount = 100,
      bool autoScaleMinMaxEnabled = true,
      bool pinchZoomEnabled = true,
      bool doubleTapToZoomEnabled = true,
      bool highlightPerDragEnabled = true,
      bool dragXEnabled = true,
      bool dragYEnabled = true,
      bool scaleXEnabled = true,
      bool scaleYEnabled = true,
      bool drawGridBackground = false,
      bool drawBorders = false,
      bool clipValuesToContent = false,
      double minOffset = 30,
      bool keepPositionOnRotation = false,
      bool customViewPortEnabled = false,
      double minXRange = 1.0,
      double maxXRange = 1.0,
      double minimumScaleX = 1.0,
      double minimumScaleY = 1.0,
      double maxHighlightDistance = 100.0,
      bool highLightPerTapEnabled = true,
      bool dragDecelerationEnabled = true,
      double dragDecelerationFrictionCoef = 0.9,
      double extraTopOffset = 0.0,
      double extraRightOffset = 0.0,
      double extraBottomOffset = 0.0,
      double extraLeftOffset = 0.0,
      String noDataText = "No chart data available.",
      bool touchEnabled = true,
      bool drawMarkers = true,
      double descTextSize = 12,
      double infoTextSize = 12,
      Color descTextColor,
      Color infoTextColor,
      OnDrawListener drawListener,
      YAxis axisLeft,
      YAxis axisRight,
      YAxisRenderer axisRendererLeft,
      YAxisRenderer axisRendererRight,
      Transformer leftAxisTransformer,
      Transformer rightAxisTransformer,
      XAxisRenderer xAxisRenderer,
      Matrix4 zoomMatrixBuffer,
      bool highlightFullBarEnabled = true,
      bool drawValueAboveBar = false,
      bool drawBarShadow = false,
      bool fitBars = true})
      : super(data,
            marker: marker,
            description: description,
            selectionListener: selectionListener,
            axisLeftSettingFunction: axisLeftSettingFunction,
            axisRightSettingFunction: axisRightSettingFunction,
            xAxisSettingFunction: xAxisSettingFunction,
            legendSettingFunction: legendSettingFunction,
            rendererSettingFunction: rendererSettingFunction,
            backgroundColor: backgroundColor,
            maxHighlightDistance: maxHighlightDistance,
            highLightPerTapEnabled: highLightPerTapEnabled,
            dragDecelerationEnabled: dragDecelerationEnabled,
            dragDecelerationFrictionCoef: dragDecelerationFrictionCoef,
            extraTopOffset: extraTopOffset,
            extraRightOffset: extraRightOffset,
            extraBottomOffset: extraBottomOffset,
            extraLeftOffset: extraLeftOffset,
            noDataText: noDataText,
            touchEnabled: touchEnabled,
            drawMarkers: drawMarkers,
            descTextSize: descTextSize,
            infoTextSize: infoTextSize,
            descTextColor: descTextColor,
            infoTextColor: infoTextColor,
            maxVisibleCount: maxVisibleCount,
            autoScaleMinMaxEnabled: autoScaleMinMaxEnabled,
            pinchZoomEnabled: pinchZoomEnabled,
            doubleTapToZoomEnabled: doubleTapToZoomEnabled,
            highlightPerDragEnabled: highlightPerDragEnabled,
            dragXEnabled: dragXEnabled,
            dragYEnabled: dragYEnabled,
            scaleXEnabled: scaleXEnabled,
            scaleYEnabled: scaleYEnabled,
            drawGridBackground: drawGridBackground,
            drawBorders: drawBorders,
            clipValuesToContent: clipValuesToContent,
            minOffset: minOffset,
            keepPositionOnRotation: keepPositionOnRotation,
            drawListener: drawListener,
            axisLeft: axisLeft,
            axisRight: axisRight,
            axisRendererLeft: axisRendererLeft,
            axisRendererRight: axisRendererRight,
            leftAxisTransformer: leftAxisTransformer,
            rightAxisTransformer: rightAxisTransformer,
            xAxisRenderer: xAxisRenderer,
            customViewPortEnabled: customViewPortEnabled,
            zoomMatrixBuffer: zoomMatrixBuffer,
            minXRange: minXRange,
            maxXRange: maxXRange,
            minimumScaleX: minimumScaleX,
            minimumScaleY: minimumScaleY,
            highlightFullBarEnabled: highlightFullBarEnabled,
            drawValueAboveBar: drawValueAboveBar,
            drawBarShadow: drawBarShadow,
            fitBars: fitBars);

  @override
  IMarker initMarker() => HorizontalBarChartMarker();

  @override
  Transformer initLeftAxisTransformer() =>
      TransformerHorizontalBarChart(viewPortHandler);

  @override
  Transformer initRightAxisTransformer() =>
      TransformerHorizontalBarChart(viewPortHandler);

  @override
  YAxisRenderer initAxisRendererLeft() => YAxisRendererHorizontalBarChart(
      viewPortHandler, axisLeft, leftAxisTransformer);

  @override
  YAxisRenderer initAxisRendererRight() => YAxisRendererHorizontalBarChart(
      viewPortHandler, axisRight, rightAxisTransformer);

  @override
  XAxisRenderer initXAxisRenderer() => XAxisRendererHorizontalBarChart(
      viewPortHandler, xAxis, leftAxisTransformer);

  @override
  ViewPortHandler initViewPortHandler() => HorizontalViewPortHandler();

  @override
  HorizontalBarChartState createChartState() {
    return HorizontalBarChartState();
  }

  HorizontalBarChartPainter get painter => super.painter;

  @override
  void initialPainter() {
    painter = HorizontalBarChartPainter(
        data,
        animator,
        viewPortHandler,
        maxHighlightDistance,
        highLightPerTapEnabled,
        dragDecelerationEnabled,
        dragDecelerationFrictionCoef,
        extraLeftOffset,
        extraTopOffset,
        extraRightOffset,
        extraBottomOffset,
        noDataText,
        touchEnabled,
        marker,
        description,
        drawMarkers,
        infoPaint,
        descPaint,
        xAxis,
        legend,
        legendRenderer,
        rendererSettingFunction,
        selectionListener,
        maxVisibleCount,
        autoScaleMinMaxEnabled,
        pinchZoomEnabled,
        doubleTapToZoomEnabled,
        highlightPerDragEnabled,
        dragXEnabled,
        dragYEnabled,
        scaleXEnabled,
        scaleYEnabled,
        gridBackgroundPaint,
        borderPaint,
        drawGridBackground,
        drawBorders,
        clipValuesToContent,
        minOffset,
        keepPositionOnRotation,
        drawListener,
        axisLeft,
        axisRight,
        axisRendererLeft,
        axisRendererRight,
        leftAxisTransformer,
        rightAxisTransformer,
        xAxisRenderer,
        zoomMatrixBuffer,
        customViewPortEnabled,
        minXRange,
        maxXRange,
        minimumScaleX,
        minimumScaleY,
        highlightFullBarEnabled,
        drawValueAboveBar,
        drawBarShadow,
        fitBars);
  }
}

class HorizontalBarChartState extends BarChartState<HorizontalBarChart> {
  @override
  void updatePainter() {
    if (widget.painter.getData() != null &&
        widget.painter.getData().dataSets != null &&
        widget.painter.getData().dataSets.length > 0)
      widget.painter.highlightValue6(lastHighlighted, false);
  }
}