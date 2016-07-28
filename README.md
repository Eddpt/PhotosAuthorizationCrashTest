# PhotosAuthorizationCrashTest
A sample project showcasing a crash when requesting permission for the Photos Library in iOS 10

Crash log:

> PhotosAuthorizationCrashTest[2014:42551] [access] <private>

# Solution

I've found the issue to be related with the fact that some Usage Description keys have become mandatory in iOS 10.

Even though `NSPhotoLibraryUsageDescription` has been around since iOS 6, it has only become a requirement in iOS 10, and the crash message wasn't very helpful.

In the simulator of the latest Xcode (Xcode 8 beta 3 at the moment) the crash message is a bit more detailed, (even though on a device it is still the same):

> [access] This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSPhotoLibraryUsageDescription key with a string value explaining to the user how the app uses this data.


So adding `NSPhotoLibraryUsageDescription` to my `Info.plist` file has fixed the issue.

For more documentation, see [Cocoa Keys](https://developer.apple.com/library/prerelease/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html)

More specifically, the section named `NSPhotoLibraryUsageDescription`:

> Important: To protect user privacy, an iOS app linked on or after iOS 10.0, and which accesses the user’s photo library, must statically declare the intent to do so. Include the NSPhotoLibraryUsageDescription key in your app’s Info.plist file and provide a purpose string for this key. If your app attempts to access the user’s photo library without a corresponding purpose string, your app exits.
