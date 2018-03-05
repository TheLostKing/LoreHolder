//
//  LoreViewController.swift
//  LoreHolder
//
//  Created by Zachary Calderone on 3/4/18.
//  Copyright © 2018 Black Kobold Games. All rights reserved.
//

import UIKit
import os.log

class LoreViewController: UIViewController, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptor: UITextView!
    @IBOutlet weak var tabTitle: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var lore: Lore?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = #imageLiteral(resourceName: "defaultphoto")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photoSelctor(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        tabTitle.resignFirstResponder()
        descriptor.resignFirstResponder()
        print("The button is doin something")
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        imageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    
    // MARK: - Navigation
     
     // This method lets you configure a view controller before it's presented.
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     super.prepare(for: segue, sender: sender)
     
     // Configure the destination view controller only when the save button is pressed.
     guard let button = sender as? UIBarButtonItem, button === saveButton else {
     os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
     return
     }
     
     let title = tabTitle.text ?? ""
     let photo = imageView.image
     let description = descriptor.text
     
     // Set the meal to be passed to MealTableViewController after the unwind segue.
        lore = Lore(image: photo!, title: title, description: description!)
     }
    
    
 
    
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
