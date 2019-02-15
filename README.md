# ComeOnUIAlertController
An example project for a UIKit bug

## Issue Description

Turns out there's some sort of retain cycle when trying to present a UIAlertController on a UIViewController that is being dismissed.

This is a violation of the presenting on a dismissed controller API, but it still smells like a bug to me that the view controller would be kept around in memory.

## Repro Steps

1. Open the sample app
2. Click on `Present Modally?`
3. Click on `Dismiss`
4. Try to click on `Present Modally?` again
5. It should *not* present and instead the text that was previously "Unknown" should change to "The view controller should not exist!!"

Bonus points:
- There's an `NSLog("This will never be called!")` in the `ModalViewController.deinit` that never gets hit.
