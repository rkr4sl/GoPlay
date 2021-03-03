#!/bin/sh

echo 'Clear output folder'
rm -frv ./output

echo 'Building simulator framework'
xcodebuild archive \
-scheme RtspPlayerLib \
-destination "generic/platform=iOS Simulator" \
-archivePath ./output/RtspLib-Sim \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme RtspPlayerLib \
-destination "generic/platform=iOS" \
-archivePath ./output/RtspLib-ios \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework ./output/RtspLib-Sim.xcarchive/Products/Library/Frameworks/RtspPlayerLib.framework \
-framework ./output/RtspLib-ios.xcarchive/Products/Library/Frameworks/RtspPlayerLib.framework \
-output ./output/RtspPlayerLib.xcframework

echo 'XCFramework Build complete'

