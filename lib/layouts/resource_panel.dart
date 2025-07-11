import 'package:blueprint_master/editors/editors.dart';
import 'package:blueprint_master/editors/graphics/graphics.dart';
import 'package:flutter/material.dart';

class RootGraphicInfo {
  final String title;

  final RootGraphic graphic;

  RootGraphicInfo({required this.title, required this.graphic});
}

final List<RootGraphicInfo> infos = [
  RootGraphicInfo(
    title: "Cell_1",
    graphic: RootGraphic(
      children: [
        PolygonGraphic(vertices: [Offset(-50, -50), Offset(50, -50), Offset(50, 50), Offset(-50, 50), Offset(-50, -50)]),
      ],
    ),
  ),
  RootGraphicInfo(
    title: "Cell_2",
    graphic: RootGraphic(
      children: [
        PolygonGraphic(vertices: [Offset(-50, -50), Offset(50, -50), Offset(50, 50), Offset(-50, 50), Offset(-50, -50)]),
        CircleGraphic(position: Offset(0, 0), radius: 50),
      ],
    ),
  ),
];

class ResourcePanel extends StatefulWidget {
  const ResourcePanel({super.key});

  @override
  State<ResourcePanel> createState() => _ResourcePanelState();
}

class _ResourcePanelState extends State<ResourcePanel> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final title = infos[index].title;
        return ListTile(
          title: Text(title),
          onTap: () {
            editorManager.createEditor(EditorConfig(title: title));
          },
        );
      },
      itemCount: infos.length,
    );
  }
}
