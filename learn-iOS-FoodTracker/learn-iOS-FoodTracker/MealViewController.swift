//
//  MealViewController.swift
//  learn-iOS-FoodTracker
//
//  Created by levypan on 10/12/20.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
	
	// MARK: Properties
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var photoImageView: UIImageView!
	@IBOutlet weak var ratingControl: RatingControl!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		nameTextField.delegate = self
	}
	
	//MARK: UITextFieldDelegate
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		// Hide the keyboard
		textField.resignFirstResponder()
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {

	}
	// MARK: UIImagePickerControllerDelegate
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		// Dismiss the picker if user canceld
		dismiss(animated: true, completion: nil)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		// The info dictionary may contain multpie representations of the image. You want to use the original
		let selectedImage = info[UIImagePickerController.InfoKey.originalImage]  as? UIImage
		
		guard (selectedImage != nil) else {
			fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
		}
		
		// Set photoImageView to display the selected image.
		photoImageView.image = selectedImage
		
		// Dismiss the picker
		dismiss(animated: true, completion: nil)
	}
	
	
	
	// MARK: Action
	@IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
		 // Hide the keyboard.
		nameTextField.resignFirstResponder()
		
		// UIImagePickerController is a view controller that lets a user pick media from their photo library.
		let imagePickerController = UIImagePickerController()
		
		// Only allow photos to be picked, not taken.
		imagePickerController.sourceType = .photoLibrary
		
		// Make sure ViewController is notified when the user picks an image.
		imagePickerController.delegate = self
		present(imagePickerController, animated: true, completion: nil)
		
	}
	
	
}
