// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

import 'dart:core';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:veggie_seasons_v2/components/Button.dart';
import 'package:veggie_seasons_v2/components/CustomSwitch.dart';
import 'package:veggie_seasons_v2/components/NumberedCircle.dart';
import 'package:veggie_seasons_v2/styles/styles.dart';
import 'package:widgetbook/widgetbook.dart';

final directories = [
  WidgetbookFolder(
    name: 'components',
    children: [
      WidgetbookComponent(
        name: 'Button',
        useCases: [
          WidgetbookUseCase(
            name: 'Trivia Button',
            builder: (context) => buttonUseCase(context),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'CustomSwitch',
        useCases: [
          WidgetbookUseCase(
            name: 'Switch',
            builder: (context) => switchUseCase(context),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'NumberedCircle',
        useCases: [
          WidgetbookUseCase(
            name: 'Numbered Circle',
            builder: (context) => numberedCircleUseCase(context),
          ),
        ],
      ),
    ],
  ),
];
