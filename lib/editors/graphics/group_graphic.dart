import 'dart:ui';

import 'package:flutter/rendering.dart';

import 'base_graphic.dart';

class GroupGraphic extends BaseGraphic {
  GroupGraphic({required this.position, this.children = const []});

  final Offset position;

  final List<BaseGraphic> children;

  void addChild(BaseGraphic child) {
    children.add(child);
  }

  void removeChild(BaseGraphic child) {
    children.remove(child);
  }

  @override
  void paint(Context ctx, Offset offset) {
    ctx.canvas.save();
    ctx.canvas.translate(position.dx, position.dy);
    for (final child in children) {
      child.paint(ctx, offset + position);
    }

    ctx.canvas.restore();
  }
}
