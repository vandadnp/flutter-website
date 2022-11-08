---
title: Flutter for web developers
description: Learn how to apply Web developer knowledge when building Flutter apps.
css-old: [two_column.css]
---

<?code-excerpt path-base="get-started/flutter-for/web_devs"?>

This page is for users who are familiar with the HTML
and CSS syntax for arranging components of an application's UI.
It maps HTML/CSS code snippets to their Flutter/Dart code equivalents.

One of the fundamental differences between
designing a web layout and a Flutter layout,
is learning how constraints work,
and how widgets are sized and positioned.
To learn more, see [Understanding constraints][].

The examples assume:

* The HTML document starts with `<!DOCTYPE html>`, and the CSS box model
  for all HTML elements is set to [`border-box`][],
  for consistency with the Flutter model.

  ```css
  {
      box-sizing: border-box;
  }
  ```
* In Flutter, the default styling of the 'Lorem ipsum' text
  is defined by the `bold24Roboto` variable as follows,
  to keep the syntax simple:

  <?code-excerpt "lib/main.dart (TextStyle)"?>
  ```dart
  TextStyle bold24Roboto = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  ```

{{site.alert.secondary}}
  How is react-style, or _declarative_, programming different from the
  traditional imperative style?
  For a comparison, see [Introduction to declarative UI][].
{{site.alert.end}}

## Performing basic layout operations

The following examples show how to perform the most common UI layout tasks.

### Styling and aligning text

Font style, size, and other text attributes that CSS
handles with the font and color properties are individual
properties of a [`TextStyle`][] child of a [`Text`][] widget.

For text-align property in CSS that is used for aligning text,
there is a textAlign property of a [`Text`][] widget.

In both HTML and Flutter, child elements or widgets
are anchored at the top left, by default.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  Lorem ipsum
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    [[highlight]]font: 900 24px Georgia;[[/highlight]]
}
{% endprettify %}
</div>
<div class="righthighlight">
<?code-excerpt "lib/main.dart (Container)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: const Text(
    'Lorem ipsum',
    style: [[highlight]]TextStyle(
      fontFamily: 'Georgia',
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    [[/highlight]]
    [[highlight]]textAlign: TextAlign.center, [[/highlight]]
  ),
);
{% endprettify %}
</div>

### Setting background color

In Flutter, you set the background color using the `color` property
or the `decoration` property of a [`Container`][].
However, you cannot supply both, since it would potentially
result in the decoration drawing over the background color.
The `color` property should be preferred
when the background is a simple color.
For other cases, such as gradients or images,
use the `decoration` property.

The CSS examples use the hex color equivalents to the Material color palette.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  Lorem ipsum
</div>

.grey-box {
    [[highlight]]background-color: #e0e0e0;[[/highlight]] /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
}
{% endprettify %}
</div>

<div class="righthighlight">
<?code-excerpt "lib/main.dart (Container2)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  [[highlight]]color: Colors.grey[300],
  [[/highlight]]
  child: Text(
    'Lorem ipsum',
    style: bold24Roboto,
  ),
);
{% endprettify %}
</div>

<div class="righthighlight">
<?code-excerpt "lib/main.dart (Container3)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  [[highlight]]decoration: BoxDecoration(
    color: Colors.grey[300],
  ),
  [[/highlight]]
  child: Text(
    'Lorem ipsum',
    style: bold24Roboto,
  ),
);
{% endprettify %}
</div>

### Centering components

A [`Center`][] widget centers its child both horizontally
and vertically.

To accomplish a similar effect in CSS, the parent element uses either a flex
or table-cell display behavior. The examples on this page show the flex
behavior.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  Lorem ipsum
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    [[highlight]]display: flex;
    align-items: center;
    justify-content: center;[[/highlight]]
}
{% endprettify %}
</div>

<div class="righthighlight">
<?code-excerpt "lib/main.dart (Center)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: [[highlight]]Center(
    child: [[/highlight]]Text(
      'Lorem ipsum',
      style: bold24Roboto,
    ),
  ),
);
{% endprettify %}
</div>

### Setting container width

To specify the width of a [`Container`][]
widget, use its `width` property.
This is a fixed width, unlike the CSS max-width property
that adjusts the container width up to a maximum value.
To mimic that effect in Flutter,
use the `constraints` property of the Container.
Create a new [`BoxConstraints`][] widget with a `minWidth` or `maxWidth`.

For nested Containers, if the parent’s width is less than the child’s width,
the child Container sizes itself to match the parent.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    [[highlight]]width: 320px;[[/highlight]]
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
    [[highlight]]width: 100%;
    max-width: 240px;[[/highlight]]
}
{% endprettify %}
</div>

<div class="righthighlight">
<?code-excerpt "lib/main.dart (Nested)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  [[highlight]]width: 320,
  [[/highlight]]
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: Container(
      // red box
      [[highlight]]width: 240,
      [[/highlight]]// max-width is 240
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      child: Text(
        'Lorem ipsum',
        style: bold24Roboto,
      ),
    ),
  ),
);
{% endprettify %}
</div>

## Manipulating position and size

The following examples show how to perform more complex operations
on widget position, size, and background.

### Setting absolute position

By default, widgets are positioned relative to their parent.

To specify an absolute position for a widget as x-y coordinates,
nest it in a [`Positioned`][] widget that is,
in turn, nested in a [`Stack`][] widget.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum
  </div>
</div>

.grey-box {
    [[highlight]]position: relative;[[/highlight]]
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
}
.red-box {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
    [[highlight]]position: absolute;
    top: 24px;
    left: 24px;[[/highlight]]
}
{% endprettify %}
</div>

<div class="righthighlight">
<?code-excerpt "lib/main.dart (Absolute)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  [[highlight]]child: Stack(
    children: [[/highlight]][
      Positioned(
        // red box
        [[highlight]]left: 24,
        top: 24,
        [[/highlight]]
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red[400],
          ),
          child: Text(
            'Lorem ipsum',
            style: bold24Roboto,
          ),
        ),
      ),
    ],
  ),
);
{% endprettify %}
</div>

### Rotating components

To rotate a widget, nest it in a [`Transform`][] widget.
Use the `Transform` widget’s `alignment` and `origin` properties
to specify the transform origin (fulcrum) in relative and absolute terms,
respectively.

For a simple 2D rotation, in which the widget is rotated on the Z axis,
create a new [`Matrix4`][] identity object
and use its `rotateZ()` method to specify the rotation factor
using radians (degrees × π / 180).

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
    [[highlight]]transform: rotate(15deg);[[/highlight]]
}
{% endprettify %}
</div>

<div class="righthighlight">
<?code-excerpt "lib/main.dart (Rotating)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: [[highlight]]Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateZ(15 * 3.1415927 / 180),
      child: [[/highlight]]Container(
        // red box
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red[400],
        ),
        child: Text(
          'Lorem ipsum',
          style: bold24Roboto,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ),
);
{% endprettify %}
</div>

### Scaling components

To scale a widget up or down, nest it in a [`Transform`][] widget.
Use the Transform widget’s `alignment` and `origin` properties
to specify the transform origin (fulcrum) in relative or absolute terms,
respectively.

For a simple scaling operation along the x-axis,
create a new [`Matrix4`][] identity object
and use its `scale()` method to specify the scaling factor.

When you scale a parent widget,
its child widgets are scaled accordingly.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
    [[highlight]]transform: scale(1.5);[[/highlight]]
}
{% endprettify %}
</div>

<div class="righthighlight">
<?code-excerpt "lib/main.dart (Scaling)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: [[highlight]]Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scale(1.5),
      child: [[/highlight]]Container(
        // red box
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red[400],
        ),
        child: Text(
          'Lorem ipsum',
          style: bold24Roboto,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ),
);
{% endprettify %}
</div>

### Applying a linear gradient

To apply a linear gradient to a widget's background,
nest it in a [`Container`][] widget.
Then use the `Container` widget’s `decoration` property to create a
[`BoxDecoration`][] object, and use `BoxDecoration`'s `gradient`
property to transform the background fill.

The gradient “angle” is based on the Alignment (x, y) values:

* If the beginning and ending x values are equal,
  the gradient is vertical (0° | 180°).
* If the beginning and ending y values are equal,
  the gradient is horizontal (90° | 270°).

#### Vertical gradient

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    padding: 16px;
    color: #ffffff;
    [[highlight]]background: linear-gradient(180deg, #ef5350, rgba(0, 0, 0, 0) 80%);[[/highlight]]
}
{% endprettify %}
</div>
<div class="righthighlight">
<?code-excerpt "lib/main.dart (Gradient)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: Container(
      // red box
      [[highlight]]decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.0, 0.6),
          colors: <Color>[
            Color(0xffef5350),
            Color(0x00ef5350),
          ],
        ),
      ),
      [[/highlight]]
      padding: const EdgeInsets.all(16),
      child: Text(
        'Lorem ipsum',
        style: bold24Roboto,
      ),
    ),
  ),
);
{% endprettify %}
</div>

#### Horizontal gradient

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    padding: 16px;
    color: #ffffff;
    [[highlight]]background: linear-gradient(90deg, #ef5350, rgba(0, 0, 0, 0) 80%);[[/highlight]]
}
{% endprettify %}
</div>
<div class="righthighlight">
<?code-excerpt "lib/main.dart (HorizontalGradient)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: Container(
      // red box
      padding: const EdgeInsets.all(16),
      [[highlight]]decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.0, 0.0),
          end: Alignment(0.6, 0.0),
          colors: <Color>[
            Color(0xffef5350),
            Color(0x00ef5350),
          ],
        ),
      ),
      [[/highlight]]
      child: Text(
        'Lorem ipsum',
        style: bold24Roboto,
      ),
    ),
  ),
);
{% endprettify %}
</div>

## Manipulating shapes

The following examples show how to make and customize shapes.

### Rounding corners

To round the corners of a rectangular shape,
use the `borderRadius` property of a [`BoxDecoration`][] object.
Create a new [`BorderRadius`][]
object that specifies the radius for rounding each corner.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
    [[highlight]]border-radius: 8px;[[/highlight]]
}
{% endprettify %}
</div>
<div class="righthighlight">
<?code-excerpt "lib/main.dart (RoundCorners)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: Container(
      // red circle
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[400],
        [[highlight]]borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ), [[/highlight]]
      ),
      child: Text(
        'Lorem ipsum',
        style: bold24Roboto,
      ),
    ),
  ),
);
{% endprettify %}
</div>

### Adding box shadows

In CSS you can specify shadow offset and blur in shorthand,
using the box-shadow property. This example shows two box shadows,
with properties:

* `xOffset: 0px, yOffset: 2px, blur: 4px, color: black @80% alpha`
* `xOffset: 0px, yOffset: 06x, blur: 20px, color: black @50% alpha`

In Flutter, each property and value is specified separately.
Use the `boxShadow` property of `BoxDecoration` to create a list of
[`BoxShadow`][] widgets. You can define one or multiple
`BoxShadow` widgets, which can be stacked
to customize the shadow depth, color, and so on.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
    [[highlight]]box-shadow: 0 2px 4px rgba(0, 0, 0, 0.8),
              0 6px 20px rgba(0, 0, 0, 0.5);[[/highlight]]
}
{% endprettify %}
</div>
<div class="righthighlight">
<?code-excerpt "lib/main.dart (BoxShadow)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  margin: const EdgeInsets.only(bottom: 16),
  decoration: BoxDecoration(
    color: Colors.grey[300],
  ),
  child: Center(
    child: Container(
      // red box
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[400],
        [[highlight]]boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xcc000000),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Color(0x80000000),
            offset: Offset(0, 6),
            blurRadius: 20,
          ),
        ], [[/highlight]]
      ),
      child: Text(
        'Lorem ipsum',
        style: bold24Roboto,
      ),
    ),
  ),
);
{% endprettify %}
</div>

### Making circles and ellipses

Making a circle in CSS requires a workaround of applying a
border-radius of 50% to all four sides of a rectangle,
though there are [basic shapes][].

While this approach is supported
with the `borderRadius` property of [`BoxDecoration`][],
Flutter provides a `shape` property
with [`BoxShape` enum][] for this purpose.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-circle">
    Lorem ipsum
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-circle {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
    [[highlight]]text-align: center;
    width: 160px;
    height: 160px;
    border-radius: 50%;[[/highlight]]
}
{% endprettify %}
</div>
<div class="righthighlight">
<?code-excerpt "lib/main.dart (Circle)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: Container(
      // red circle
      decoration: BoxDecoration(
        color: Colors.red[400],
        [[highlight]]shape: BoxShape.circle, [[/highlight]]
      ),
      padding: const EdgeInsets.all(16),
      [[highlight]]width: 160,
      height: 160,
      [[/highlight]]
      child: Text(
        'Lorem ipsum',
        style: bold24Roboto,
        [[highlight]]textAlign: TextAlign.center, [[/highlight]]
      ),
    ),
  ),
);
{% endprettify %}
</div>

## Manipulating text

The following examples show how to specify fonts and other
text attributes. They also show how to transform text strings,
customize spacing, and create excerpts.

### Adjusting text spacing

In CSS, you specify the amount of white space
between each letter or word by giving a length value
for the letter-spacing and word-spacing properties, respectively.
The amount of space can be in px, pt, cm, em, etc.

In Flutter, you specify white space as logical pixels
(negative values are allowed)
for the `letterSpacing` and `wordSpacing` properties
of a [`TextStyle`][] child of a `Text` widget.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
    [[highlight]]letter-spacing: 4px;[[/highlight]]
}
{% endprettify %}
</div>
<div class="righthighlight">
<?code-excerpt "lib/main.dart (TextSpacing)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: Container(
      // red box
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      child: const Text(
        'Lorem ipsum',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w900,
          [[highlight]]letterSpacing: 4, [[/highlight]]
        ),
      ),
    ),
  ),
);
{% endprettify %}
</div>

### Making inline formatting changes

A [`Text`][] widget lets you display text
with some formatting characteristics.
To display text that uses multiple styles
(in this example, a single word with emphasis),
use a [`RichText`][] widget instead.
Its `text` property can specify one or more
[`TextSpan`][] objects that can be individually styled.

In the following example, "Lorem" is in a `TextSpan`
with the default (inherited) text styling,
and "ipsum" is in a separate `TextSpan` with custom styling.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    [[highlight]]Lorem <em>ipsum</em>[[/highlight]]
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    [[highlight]]font: 900 24px Roboto;[[/highlight]]
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
}
[[highlight]].red-box em {
    font: 300 48px Roboto;
    font-style: italic;
}[[/highlight]]
{% endprettify %}
</div>
<div class="righthighlight">
<?code-excerpt "lib/main.dart (InlineFormatting)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: Container(
      // red box
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      padding: const EdgeInsets.all(16),
      child: [[highlight]]RichText(
        text: TextSpan(
          style: bold24Roboto,
          children: const <TextSpan>[
            TextSpan(text: 'Lorem '),
            TextSpan(
              text: 'ipsum',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 48,
              ),
            ),
          ],
        ),
      ), [[/highlight]]
    ),
  ),
);
{% endprettify %}
</div>

### Creating text excerpts

An excerpt displays the initial line(s) of text in a paragraph,
and handles the overflow text, often using an ellipsis.

In Flutter, use the `maxLines` property of a [`Text`][] widget
to specify the number of lines to include in the excerpt,
and the `overflow` property for handling overflow text.

<div class="lefthighlight">
{% prettify css %}
<div class="grey-box">
  <div class="red-box">
    Lorem ipsum dolor sit amet, consec etur
  </div>
</div>

.grey-box {
    background-color: #e0e0e0; /* grey 300 */
    width: 320px;
    height: 240px;
    font: 900 24px Roboto;
    display: flex;
    align-items: center;
    justify-content: center;
}
.red-box {
    background-color: #ef5350; /* red 400 */
    padding: 16px;
    color: #ffffff;
    [[highlight]]overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;[[/highlight]]
}
{% endprettify %}
</div>
<div class="righthighlight">
<?code-excerpt "lib/main.dart (TextExcerpt)" replace="/\/\*//g;/\*\/ *//g"?>
{% prettify dart %}
final container = Container(
  // grey box
  width: 320,
  height: 240,
  color: Colors.grey[300],
  child: Center(
    child: Container(
      // red box
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        'Lorem ipsum dolor sit amet, consec etur',
        style: bold24Roboto,
        [[highlight]]overflow: TextOverflow.ellipsis,
        maxLines: 1, [[/highlight]]
      ),
    ),
  ),
);
{% endprettify %}
</div>
<div class="end-examples"></div>


[basic shapes]: https://developer.mozilla.org/en-US/docs/Web/CSS/basic-shape
[`border-box`]: https://css-tricks.com/box-sizing/
[`BorderRadius`]: {{site.api}}/flutter/painting/BorderRadius-class.html
[`BoxDecoration`]: {{site.api}}/flutter/painting/BoxDecoration-class.html
[`BoxConstraints`]: {{site.api}}/flutter/rendering/BoxConstraints-class.html
[`BoxShape` enum]: {{site.api}}/flutter/painting/BoxShape-class.html
[`BoxShadow`]: {{site.api}}/flutter/painting/BoxShadow-class.html
[`Center`]: {{site.api}}/flutter/widgets/Center-class.html
[`Container`]: {{site.api}}/flutter/widgets/Container-class.html
[Introduction to declarative UI]: {{site.url}}/get-started/flutter-for/declarative
[`Matrix4`]: {{site.api}}/flutter/vector_math_64/Matrix4-class.html
[`Positioned`]: {{site.api}}/flutter/widgets/Positioned-class.html
[`RichText`]: {{site.api}}/flutter/widgets/RichText-class.html
[`Stack`]: {{site.api}}/flutter/widgets/Stack-class.html
[`Text`]: {{site.api}}/flutter/widgets/Text-class.html
[`TextSpan`]: {{site.api}}/flutter/painting/TextSpan-class.html
[`TextStyle`]: {{site.api}}/flutter/painting/TextStyle-class.html
[`Transform`]: {{site.api}}/flutter/widgets/Transform-class.html
[Understanding constraints]: {{site.url}}/development/ui/layout/constraints

