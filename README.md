# FlexGap Library

FlexGap is a Flutter library for managing spaces and flexibility in your layouts.

<img src="https://github.com/JhonaCodes/flexgap/assets/53523825/8e2fd9fb-e3a9-4950-bf49-b510d33cdefe" width="300" height="150"  alt=""/>


[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![text_field_validation](https://img.shields.io/pub/v/flex_gap.svg)](https://pub.dev/packages/flex_gap)
[![Dart 3](https://img.shields.io/badge/Dart-3%2B-blue.svg)](https://dart.dev/)
[![Flutter 3.10](https://img.shields.io/badge/Flutter-3%2B-blue.svg)](https://flutter.dev/)


## Installation
Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flex_gap: ^0.2.2
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

<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flexgap/assets/53523825/b0b48ee9-d14a-4e2b-99e2-b33b9eb8ddaa">


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
<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flexgap/assets/53523825/4f8ea0c8-4459-4dfd-81e7-24842444ada4">


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

<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flexgap/assets/53523825/de69e382-e3d8-4261-bd5d-010ffee5913d">

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
<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flexgap/assets/53523825/fc551ad5-7788-4fb3-ba46-b7f85d1b6013">




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

<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flexgap/assets/53523825/a900895e-75fa-476c-9e3e-0e094ce6b63b">

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

<img width="250" height="500" alt="wrong_data" src="https://github.com/JhonaCodes/flexgap/assets/53523825/137fda77-7568-41f5-9995-f2408a0ec427">

For this behavior you can also apply spaces in the desired index, enjoy experimenting and helping improve this library 🙃.

## Contributions

Contributions are welcome. If you find an issue or want to improve the library, create an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
```
