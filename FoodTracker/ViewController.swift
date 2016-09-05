//
//  ViewController.swift
//  FoodTracker
//
//  Created by LeeJuYong on 2016. 8. 30..
//  Copyright © 2016년 LeeJuYong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        print("ViewController - viewDidLoad")
        nameTextField.delegate = self;
    }
    
    override func viewWillAppear(animated: Bool) {
        print("ViewController - viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        print("ViewController - viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("ViewController - viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("ViewController - viewDidDisappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return textField.resignFirstResponder();
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("textFieldDidEndEditing")
        mealNameLabel.text = textField.text
    }
    
    // MARK: Actions
//    @IBAction func setDefaultLabelText(sender: UIButton) {
//        mealNameLabel.text = "Default Text";
//    }
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self;
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        let selectedImage  = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoImageView.image = selectedImage
    }
}