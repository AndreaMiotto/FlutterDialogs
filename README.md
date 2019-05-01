# FlutterDialogs
An util class to build effective OS native dialogs

## How to use

Call the function **showOSDialog** to display a native Alert dialogs according the user's OS.

```dart
static showOSDialog(BuildContext context, String title, String message,
      String firstButtonText, Function firstCallBack,
      {ActionStyle firstActionStyle = ActionStyle.normal,
      String secondButtonText,
      Function secondCallback,
      ActionStyle secondActionStyle = ActionStyle.normal})
```

### Parameters
- BuildContext **context**: the context where to build the widget
- String **title**: the title of the alert
- String **message**: the message displayed below the title
- String **firstButtonText**: the title of the first action shown on the left
- ActionStyle **firstActionStyle**: the style of the first button, as default is set to 'normal'
- Function **firstCallBack**: the fuction to perform on the click on the first button
- String **secondButtonText**: the title of the secondo action shown on the right
- Function **secondCallback**: the fuction to perform on the click on the second button
- ActionStyle **secondActionStyle**: the style of the second button, as default is set to 'normal'

### ActionStyle:

```dart
enum ActionStyle { normal, destructive, important, important_destructive }
```

- normal: normal color, and normal font weight;
- destructive: destructive color and normal font weight;
- important: normal color, bold font weight
- important_destructive: destructive color, bold font weight

### Set the colors
To change the colors of the button actions in the Dialogs class change the color of:

```dart
static Color _normal = Colors.black;
static Color _destructive = Colors.red;
```
