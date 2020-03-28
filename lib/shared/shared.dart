import 'package:flutter/material.dart';
import 'dart:html';

extension HoverExtension on Widget {
  static final container = window.document.getElementById('container');

  Widget get showPointerOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) {
        container.style.cursor = 'pointer';
      },
      onExit: (event) {
        container.style.cursor = 'default';
      },
    );
  }

  Widget get showDragOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) {
        container.style.cursor = 'move';
      },
      onExit: (event) {
        container.style.cursor = 'default';
      },
    );
  }
}
