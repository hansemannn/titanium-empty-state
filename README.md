# Titanium Empty State

Use the (awesome) DZNEmptyDataSet library in your Titanium iOS projects. Once imported, it can be used on
any Ti.UI.TableView and Ti.UI.ListView by simply using the `placeholder` dictionary property.

> Warning: There might be an issue when you do not use a Table View AND List View in your project. I have not tested this module
so far, so contrubutions are welcome to finalize it. The module may become List View only otherwise, since it's the recommended
way of using large lists these days.

## APIs

### Properties

#### `placeholder` (Dictionary)

- `title` (Ti.UI.AttributedString)
- `description` (Ti.UI.AttributedString)
- `image` (String)
- `buttonTitle` (String)
- `buttonImage` (String)
- `backgroundColor` (String)
- `customView` (Ti.UI.View)
- `visible` (String)
- `scrollEnabled` (String)

### Methods

#### `reloadPlaceholder()`

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
