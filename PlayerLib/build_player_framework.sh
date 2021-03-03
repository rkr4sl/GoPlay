#!/bin/sh

echo 'Clear output folder'
rm -frv ./output

echo 'Building simulator framework'
xcodebuild archive \
-scheme PlayerLib \
-destination "generic/platform=iOS Simulator" \
-archivePath ./output/Player-sim \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo 'Building iOS framework'
xcodebuild archive \
-scheme PlayerLib \
-destination "generic/platform=iOS" \
-archivePath ./output/Player-ios \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework ./output/Player-Sim.xcarchive/Products/Library/Frameworks/PlayerLib.framework \
-framework ./output/Player-ios.xcarchive/Products/Library/Frameworks/PlayerLib.framework \
-output ./output/FFPlayerLib.xcframework

echo 'XCFramework Build complete'

