# FlexGap Library

FlexGap is a Flutter library for managing spaces and flexibility in your layouts.

<img src="https://github.com/JhonaCodes/flex_gap/assets/53523825/44dcda71-761d-4284-bd40-a969eb3f893c" width="300" height="150"  alt=""/>


[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![text_field_validation](https://img.shields.io/pub/v/flex_gap.svg)](https://pub.dev/packages/flex_gap)
[![Dart 3](https://img.shields.io/badge/Dart-3%2B-blue.svg)](https://dart.dev/)
[![Flutter 3.10](https://img.shields.io/badge/Flutter-3%2B-blue.svg)](https://flutter.dev/)


## Installation
Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flex_gap: ^0.3.0
```
Or
## Rus this command:
``` $ flutter pub add flex_gap ```

Then, run `flutter pub get` in your terminal.

## Usage

### startIndexSpace

Generates a space up to the maximum width or height of the parent widget from selected index.

```
FlexGap(
  axis: Axis.vertical,
  crossAxisAlignment: CrossAxisAlignment.center,
  startSpacerIndex: 2,
 children: [
    _listElements[1],
    _listElements[2],
    _listElements[3],
    _listElements[4],
    _listElements[5],
 ],
),
```


<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flex_gap/assets/53523825/1f20b421-9453-4fbc-a975-ec5a4d61dff0">


### isScrollable

`isScrollable` Adds scroll functionality, no matter if it is vertical or horizontal, you cannot use "startIndexSpace" with "isScrollable" at the same time.

```
FlexGap(
  axis: Axis.vertical,
  crossAxisAlignment: CrossAxisAlignment.center,
  isScrollable: true,
 children: [
    _listElements[1],
    _listElements[2],
    _listElements[3],
    _listElements[4],
    _listElements[5],
 ],
),
```
<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flex_gap/assets/53523825/f5f326aa-4350-4ec6-9af8-6e4f46f45fb6">

### locatedSpace

`locatedSpace` We select the index where we want to apply a specific space.

```
FlexGap(
  axis: Axis.vertical,
  crossAxisAlignment: CrossAxisAlignment.center,
  locatedSpace: const {
      3 : 50
  },
 children: [
    _listElements[1],
    _listElements[2],
    _listElements[3],
    _listElements[4],
    _listElements[5],
 ],
),
```

<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flex_gap/assets/53523825/6b1292c1-02a7-4ed4-9548-7ed8f91d2ad9">

### globalSpace

`globalSpace` Adds a specific space to all elements using RederBox so it is an invisible element in the widget tree.

```
FlexGap(
  axis: Axis.vertical,
  crossAxisAlignment: CrossAxisAlignment.center,
  globalSpace: 20,
 children: [
    _listElements[1],
    _listElements[2],
    _listElements[3],
    _listElements[4],
    _listElements[5],
 ],
),
```
<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flex_gap/assets/53523825/ea8bb401-5aca-41b7-a25b-2c56722b4b77">



### isAdaptive

`isAdaptive` Use all the elements to organize them in a coherent way in the available space.

```
FlexGap(
  axis: Axis.vertical,
  crossAxisAlignment: CrossAxisAlignment.center,
  isAdaptive: true,
 children: _listElements,
),
```

<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flex_gap/assets/53523825/ae7edb41-b308-44a2-8c0f-7489b0685ee4">

###  MainAxisAlignment && CrossAxisAlignment 😃

You can use all MainAxisAlignment and CrossAxisAlignment elements to establish standard separation patterns.


#### Example MainAxisAlignment.spaceBetween
```
FlexGap(
  axis: Axis.vertical,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    _listElements[1],
    _listElements[2],
    _listElements[3],
    _listElements[4],
    _listElements[5],
 ],
),

```

<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flex_gap/assets/53523825/a7daf786-cad3-4c08-a56c-f0a7f605de15">

For this behavior you can also apply spaces in the desired index, enjoy experimenting and helping improve this library 🙃.

## Contributions

Contributions are welcome. If you find an issue or want to improve the library, create an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
```
