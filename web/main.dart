import 'quill.dart' as QUILL;

import 'dart:html';
QUILL.QuillStatic quillEditor;

// ignoring leap years
final int secondsInAYear = 31536000;
final String prompt = 'Something happened. Make is sound puzzeling and heroic.';

main() {
  quillEditor = new QUILL.QuillStatic('#editor',
      new QUILL.QuillOptionsStatic(theme:'snow', placeholder: prompt));
  document.getElementById('save').onClick.listen(saveLog);
  loadPreviousEntries();
}

void saveLog(Event _) {
  // get the contents of the editor
  Element contentElement = document.getElementById('editor').firstChild;
  String logEntryHtml = contentElement.innerHtml;

  appendToLog(logEntryHtml);

  // clear the editor
  quillEditor.deleteText(0, quillEditor.getLength());
}

void appendToLog(String logEntryHtml) {
  Element logElement = document.getElementById('log');
  if (logElement.children.isNotEmpty) {
    logElement.insertAdjacentElement('afterBegin', new HRElement());
  }

  logElement.insertAdjacentHtml('afterBegin', logEntryHtml);
  logElement.insertAdjacentElement('afterBegin', generateStardateHeading());

  window.localStorage['log'] = logElement.innerHtml;
}

double calcStardate() {
  DateTime now = new DateTime.now();
  DateTime beginningOfYear = new DateTime(now.year);
  int secondsThisYear = now.difference(beginningOfYear).inSeconds;
  return now.year + secondsThisYear / secondsInAYear;
}

HtmlElement generateStardateHeading() {
  HtmlElement stardateElement = new HeadingElement.h1();
  stardateElement.text = 'Stardate: ' + calcStardate().toString() + '\n';
  return stardateElement;
}

void loadPreviousEntries() {
  Element logElement = document.getElementById('log');
  logElement.innerHtml = window.localStorage['log'] ?? '';
}
