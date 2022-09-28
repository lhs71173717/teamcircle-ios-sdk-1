# [TeamCircle](https://teamcircle.io) SDK for iOS

![Platform](https://img.shields.io/badge/platform-iOS-orange.svg)
![Languages](https://img.shields.io/badge/language-Swift-orange.svg)

# Introduction
This guide introduces a detailed integration guide of Team Circle iOS SDK. 
If you want to learn more about the social SDK functions, please visit [Team Circle iOS & Android SDK Introduction](https://www.teamcircle.io/document/Team_Circle_iOS_Android_Social_SDK_Introduction)

# System environmental requirements

XCode, version 13.2 or above
iOS, version 10.0 or above

# Main features

Team Circle offers a social SDK which is fully customizable and easy to integrate.

* **Circle** 
This is the core community function which Team Cricle SDK provides within your app. App users can make new posts, browse, comment, like, and collect other users’ posts. Please find more information about the introduction of Circle at [Circle in-app community](https://www.teamcircle.io/document/Team_Circle_iOS_Android_Social_SDK_Introduction?target=Circle_in-app_community).

![guide1 bb3f6089](https://user-images.githubusercontent.com/114135053/192727471-e96837fe-8fa5-43dd-a30f-9bf82c07d392.png)

* **Store**
If you subscribed to the Premium Plan, the built-in store function is enabled in your SDK. The store banner appears at the top of customer’s social feed page. Your customer can also tag store products when making a new prost. Please find out more info about the UI & UX of the store section here [Store](https://www.teamcircle.io/document/Team_Circle_iOS_SDK_Integration_Guide?target=Store). You can [manage products and categories](https://www.teamcircle.io/document/Team_Circle_Admin_Dashboard_Feature_Introduction?target=Manage_store) in the store via Admin Dashboard. If you already have an existing eCommerce section in your app and still wish to utilize Team Circle Customer Posts Bar to funnel UGC to your product listings, we also offer [a module that can be integrated into your own app pages outside the Circle](https://www.teamcircle.io/document/Team_Circle_iOS_SDK_Integration_Guide?target=Store).

![guide2 d3ae7fe5](https://user-images.githubusercontent.com/114135053/192728188-dd3a80a1-7e8c-480f-a526-fb6f378ed664.png)

* **Instant messaging** Customers can chat with others individually using our IM system. We currently support sending text messages, voice messages, photos, videos. An admin can also [link the admin account with a Circle community account](https://www.teamcircle.io/document/Team_Circle_Admin_Dashboard_Feature_Introduction?target=Link_unlink_accounts). After linking, an “official staff” badge will appear next to the Circle account. Please find more information about details of the IM system here [Instant Messaging](https://www.teamcircle.io/document/Team_Circle_iOS_Android_Social_SDK_Introduction?target=Instant_messaging).

![guide3 7d7b6b12](https://user-images.githubusercontent.com/114135053/192732545-e686d10f-bd3c-4c70-a7eb-ab1b3f7475d0.png)

* **Customizable UI** Circle SDK offers customizable UI components so that you can fine tune the Circle to match the style of the rest of your app. First of all, you may switch between two different themes: Light Theme or Dark Theme. Then, all buttons, text, icons, and click effects can be customized. Please find more information about details of the Customizable UI here [Customizable UI](https://www.teamcircle.io/document/Team_Circle_iOS_Android_Social_SDK_Introduction?target=Customizable_UI).

![guide4 328e0f73](https://user-images.githubusercontent.com/114135053/192732951-bbefef0a-d617-46a9-81f5-24c171a3ef0d.png)

# Integration
## Get started
* Sign up at https://www.TeamCircle.io.
* Login and find App ID and App Key in Admin Dashboard → SDK&DOC → App Info, you will need them in the following steps.

## Project configuration
### Step 1 Add cocoapods dependencies
Circle SDK has local data storage and UI interface, so you also need to include the following dependencies in your project:

```bash
IGListKit，SDWebImage，lottie-ios，SnapKit，Giphy，WCDB.swift，AWSS3， HyphenateChat，EMVoiceConvert，MJRefresh，FMDB
```

If your project does not have the above dependent package files, you can also install the dependent packages in the following ways:

```bash
pod 'IGListKit'
pod 'SDWebImage'
pod 'lottie-ios'
pod 'SnapKit'
pod 'Giphy', '~> 1.3.0'
pod 'WCDB.swift'
pod 'HyphenateChat', '3.9.5'
pod 'EMVoiceConvert'
pod 'MJRefresh'
pod 'FMDB'
pod 'AWSS3'
```

### Step 2 Xcode Settings
In Xcode, go to [Build Setting] > [Architectures] > [Excluded Architectures] > Add armv7

![guide5 9deac41b](https://user-images.githubusercontent.com/114135053/192769661-03750b1b-cee4-4349-aff4-5f14626060f4.png)

### Step 3 Xcode Add Framework and Bundle
Drag Team CircleSDK.framework and Team CircleSDK.bundle into your project, and do the following as the below image shows:

![guide6 621b4f16](https://user-images.githubusercontent.com/114135053/192769856-92cfce4a-65dd-45f0-a139-81d656e18dfc.png)

### Step 4 Xcode Add Privacy Permission Description
Add the following lines into info.plist:

Privacy - Microphone Usage Description
Privacy - Photo Library Usage Description
Privacy - Camera Usage Description
Privacy - Media Library Usage Description

### Step 5 Support Portrait Mode Only
Make sure your app supports portrait mode only, because most of our modules and UI components only support portrait mode for now.

### Step 6 Add App Transport Security
In Info.plist，right click, open as, select source code, add the following code:

```bash
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
```
## TCManagerDelegate callbacks
TCManagerDelegate Callbacks return the results (success or fail) of SDK initialization, login, log out, user data modification, download json file, and unread messages number.

```bash
public protocol TCManagerDelegate : AnyObject {
func teamCirleFail(error:NSError)
func teamCirleSDKInit()
func teamCirleAccountLogin()
func teamCirleAccountLogout()
func teamCirleDeleteAccount()
func teamCirleAccountProfileChange(accountName: String, avatarUrl: String, bio: String)
func shareJsonDownloaded(json: String)
func notificationStateChanged(count: Int)
func messageChanged(count: Int)
}
```

Error Codes:
20001: SDK initialization fail
20002: Obtain UUID fail
20003: User not login
20004: Feature not supported
20005: IM function is not enabled

## SDK initialization
First, you need to initialize the SDK in application.

Import header file：

```bash
public func initSDK(appId : String, appKey : String, delegate : Any, theme : TCThemeType)
```

Sample Code:

```bash
TCManager.sharedInstance.userLogin(userId: "userId", userName: "userName", avatarUrl: "avatarUrl", userEmail: "userEmail", userBio: "userBio")
```
