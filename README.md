PointerImageView

PointerImageView is a simple iOS project that demonstrates how to add red pointers on an image at user-specified locations and save those pointer locations using UserDefaults. This allows the app to persist the user’s interactions with the image and reload the pointers on subsequent launches.

Features

	•	Tap anywhere on the image to add a red “X” pointer at that location.
	•	Persist the pointer locations using UserDefaults.
	•	Load previously saved pointers when the app is relaunched.
	•	Easily customizable for different pointer designs or behaviors.

Code Overview

ViewController.swift

The main class ViewController is responsible for:

	•	Handling user taps on the image.
	•	Adding a red pointer (in the form of a UILabel) at the tap location.
	•	Saving and loading pointer locations using UserDefaults.

Methods

	•	handleTap(_:): Called when the user taps on the UIImageView. It retrieves the tap location, adds a red pointer at that position, and saves the location.
	•	addRedPointer(at:): Adds a red “X” label at the specified CGPoint.
	•	savePointer(_:): Saves the pointer location in UserDefaults as a dictionary with x and y coordinates.
	•	loadPointers(): Loads the saved pointer locations from UserDefaults and adds the corresponding red pointers to the image.

Gesture Handling

A UITapGestureRecognizer is added to the UIImageView to detect tap events and trigger the handleTap method.

UserDefaults

Pointer locations are saved as an array of dictionaries where each dictionary contains the x and y coordinates of a tap. These are loaded back when the app starts.

How to Use

	1.	Clone the repository.
	2.	Open the project in Xcode.
	3.	Run the project on a simulator or device.
	4.	Tap on the image to add a red “X” pointer at any location.
	5.	Relaunch the app to see the saved pointers restored.

Customization

	•	Change the pointer style by modifying the addRedPointer(at:) method.
	•	Store additional data (e.g., pointer colors or shapes) by extending the savePointer(_:) and loadPointers() methods.

Requirements

	•	iOS 11.0 or later.
	•	Xcode 11 or later.

License

This project is licensed under the MIT License. See the LICENSE file for details.
