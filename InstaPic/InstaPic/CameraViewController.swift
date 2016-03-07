//
//  CameraViewController.swift
//  InstaPic
//
//  Created by Jordi Turner on 3/1/16.
//  Copyright © 2016 Jordi Turner. All rights reserved.
//

import UIKit
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var captionTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            //let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            let resizedImage = UserMedia.resize(originalImage, newSize: CGSize(width: originalImage.size.width / 2, height: originalImage.size.height / 2))
            UserMedia.postUserImage(resizedImage,  withCaption: captionTextField.text,  withCompletion: { (success: Bool, error: NSError?) -> Void in
                if success {
                    print("Yay, uploaded a photo")
                }else{
                    print(error?.localizedDescription)
                }
            })
            captionTextField.text = ""
            self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    

    @IBAction func onCamera(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func onCameraRoll(sender: AnyObject) {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

