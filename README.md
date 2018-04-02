# Titanium Empty State

Use the (awesome) [DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet) library in your Titanium iOS projects. Once imported, it can be used on
any Ti.UI.TableView and Ti.UI.ListView by simply using the `placeholder` dictionary property.

⚠️ Custom views are currently unsupported due to an issue in the native library ([#384](https://github.com/dzenbot/DZNEmptyDataSet/issues/384), [#376](https://github.com/dzenbot/DZNEmptyDataSet/issues/376), [#370](https://github.com/dzenbot/DZNEmptyDataSet/issues/370)).

![Screenshots_Row1](https://raw.githubusercontent.com/dzenbot/DZNEmptyDataSet/v2-swift/Examples/Applications/Screenshots/Screenshots_row1.png)
![Screenshots_Row2](https://raw.githubusercontent.com/dzenbot/DZNEmptyDataSet/v2-swift/Examples/Applications/Screenshots/Screenshots_row2.png)

## APIs

### Properties

#### `placeholder` (Dictionary)

- `title` (Ti.UI.AttributedString)
- `description` (Ti.UI.AttributedString)
- `image` (String)
- `buttonTitle` (String)
- `buttonImage` (String)
- `backgroundColor` (String)
- `scrollEnabled` (String)

### Methods

#### `togglePlaceholder(show)`

Passing `true` will **show** the placeholder, passing `false` will **hide** it.

### Events

#### `placeholderclick`

- `clicksource` ("button" or "image")

## Example

Please check out the example for a brief API documentation!

## License

MIT

## Build from Source

`appc run -p ios --build-only`

## Author
Hans Knöchel ([@hansemannnn](https://twitter.com/hansemannnn) / [Web](http://hans-knoechel.de))
