import 'package:blueprint_master/editors/graphics/graphics.dart';
import 'package:blueprint_master/editors/state_machines/state_machine.dart';
import 'package:blueprint_master/extensions/extensions.dart';
import 'package:flutter/gestures.dart';

import 'base_state_machine.dart';

class SelectionStateMachine extends BaseStateMachine {
  SelectionStateMachine({required this.world});

  final World world;

  late double startZoom;

  // late Vector2 startPivot;

  late ScaleStartDetails scaleStartDetails;

  @override
  void onTap() {
    // super.onTap();
  }

  @override
  void onPanUpdate(info) {
    // world.viewport.matrix4;
    // print(info.delta);
    // final Viewfinder viewfinder = game.camera.viewfinder;
    // viewfinder.position -= info.delta.global / viewfinder.zoom;
  }

  @override
  void onScaleStart(info) {
    scaleStartDetails = info;
    prevZoom = 1;
    // startZoom = world.viewport.matrix4.getMaxScaleOnAxis();

    // startPivot = game.camera.globalToLocal(info.eventPosition.widget);
    // startZoom = game.camera.viewfinder.zoom;
  }

  // // final defaultFactor = Vector2.all(1);

  // final step = 0.05;

  late double prevZoom;

  @override
  void onScaleUpdate(info) {
    // scale
    if (prevZoom != info.scale) {
      final zoomFn = prevZoom < info.scale ? world.viewport.zoomIn : world.viewport.zoomOut;
      final point = world.viewport.windowToWorld(info.localFocalPoint.toVector3()).toOffset();
      zoomFn(point);
      prevZoom = info.scale;
    }

    // translate
    // Offset focalPointDelta = (scaleStartDetails.localFocalPoint - info.localFocalPoint) * newZoom;
    // world.viewport.setTranslation(focalPointDelta.dx, focalPointDelta.dy);

    world.viewport.translate(info.focalPointDelta);
    world.render();
    // final scaleFactor = info.scale.global;
    // if (scaleFactor == defaultFactor) return;

    // final worldOffset = info.eventPosition.widget;
    // final newZoom = (startZoom * scaleFactor.x).clamp(kMinZoom, kMaxZoom);

    // zoomCubit.zoomAt(newZoom, startPivot, worldOffset);
  }

  @override
  void onScroll(info) {
    final point = world.viewport.windowToWorld(info.localPosition.toVector3()).toOffset();

    final zoomFn = switch (info.direction) {
      ScrollDirection.up => world.viewport.zoomIn,
      ScrollDirection.down => world.viewport.zoomOut,
    };
    zoomFn(point);
    world.render();
  }
}
