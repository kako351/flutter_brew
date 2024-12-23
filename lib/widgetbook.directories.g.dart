// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_brew/ui/beverage_detail.dart' as _i2;
import 'package:flutter_brew/ui/beverage_list.dart' as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'widgets',
    children: [
      _i1.WidgetbookFolder(
        name: 'beverage_detail_content',
        children: [
          _i1.WidgetbookLeafComponent(
            name: '_BeverageDetailContent',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeverageDetail',
              builder: _i2.beverageDetailContent,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'beverage_image',
        children: [
          _i1.WidgetbookLeafComponent(
            name: '_BeverageImage',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeverageImage',
              builder: _i2.beverageImage,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'beverage_list',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'BeverageCellWidget',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeverageCellWidget',
              builder: _i3.beverageList,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'beverage_title',
        children: [
          _i1.WidgetbookLeafComponent(
            name: '_BeverageTitle',
            useCase: _i1.WidgetbookUseCase(
              name: 'BeverageTitle',
              builder: _i2.beverageTitle,
            ),
          )
        ],
      ),
    ],
  )
];
