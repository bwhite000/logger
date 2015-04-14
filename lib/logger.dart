library Logger;

import "dart:html";

bool isEnabled = true;
bool shouldIncludeTimestamp = true;

void log(final dynamic message) {
  if (isEnabled) {
    if (shouldIncludeTimestamp) {
      print('[${_generateTimestamp()}] $message');
    } else {
      print(message);
    }
  }
}

void error(final dynamic errMessage) {
  if (isEnabled) {
    if (shouldIncludeTimestamp) {
      window.console.error('[${_generateTimestamp()}] $errMessage');
    } else {
      window.console.error(errMessage);
    }
  }
}

void warn(final dynamic warnMessage) {
  if (isEnabled) {
    if (shouldIncludeTimestamp) {
      window.console.warn('[${_generateTimestamp()}] $warnMessage');
    } else {
      window.console.warn(warnMessage);
    }
  }
}

void info(final dynamic infoMessage) {
  if (isEnabled) {
    if (shouldIncludeTimestamp) {
      window.console.info('[${_generateTimestamp()}] $infoMessage');
    } else {
      window.console.info(infoMessage);
    }
  }
}

void group(final String groupName) {
  if (isEnabled) {
    window
        ..console.groupEnd() // prevent infinite groups if the developer forgets to end a different group
        ..console.group(groupName);
  }
}

void groupEnd() {
  if (isEnabled) {
    window.console.groupEnd();
  }
}

String _generateTimestamp() {
  final DateTime timestamp = new DateTime.now();

  return '${(timestamp.hour > 12) ? (timestamp.hour - 12) : timestamp.hour}:' +
      '${(timestamp.minute < 10) ? '0${timestamp.minute}' : timestamp.minute}:' +
      '${(timestamp.second < 10) ? '0${timestamp.second}' : timestamp.second}.' +
      '${(timestamp.millisecond < 10) ? '00${timestamp.millisecond}' : (timestamp.millisecond >= 10 && timestamp.millisecond < 100) ? '0${timestamp.millisecond}' : timestamp.millisecond}';
}