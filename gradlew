#!/usr/bin/env sh
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -z "$JAVA_HOME" ]; then
  JAVACMD="$(command -v java)"
else
  JAVACMD="$JAVA_HOME/bin/java"
fi
if [ ! -x "$JAVACMD" ]; then
  echo "ERROR: Java executable not found in JAVA_HOME or PATH." >&2
  exit 1
fi
CLASSPATH="$DIR/gradle/wrapper/gradle-wrapper.jar"
exec "$JAVACMD" -cp "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
