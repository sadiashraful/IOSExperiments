//
//  ViewController.swift
//  Instafilter
//
//  Created by Mohammad Ashraful Islam Sadi on 12/1/20.
//  Copyright © 2020 Wheels-Corporation. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentImage: UIImage!
    var context: CIContext!
    var currentFilter: CIFilter!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var intensitySlider: UISlider!
    @IBOutlet weak var instructionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "InstaFilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera,
                                                            target: self,
                                                            action: #selector(importPicture))
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
        
    }
    
    @objc func importPicture(){
        instructionLabel.isHidden = true
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        dismiss(animated: true)
        currentImage = image
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    @IBAction func changeFilterTapped(_ sender: Any){
        let alertController = UIAlertController(title: "Choose filter", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        alertController.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        alertController.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        alertController.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        alertController.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        alertController.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        alertController.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alertController, animated: true)
    }
    
    func setFilter(action: UIAlertAction){
        guard currentImage != nil else {return}
        guard let actionTitle = action.title else {return}
        currentFilter = CIFilter(name: actionTitle)
        let beginIamge = CIImage(image: currentImage)
        currentFilter.setValue(beginIamge, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    @IBAction func saveTapped(_ sender: UIButton){
        guard let image = imageView.image else {return}
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_ : didFinishSavingWithError:contextInfo:)), nil)
    }

    @IBAction func intensityChanged(_ sender: Any) {
        applyProcessing()
    }
    
    func applyProcessing(){
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(intensitySlider.value, forKey: kCIInputIntensityKey)}
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(intensitySlider.value * 200, forKey: kCIInputRadiusKey)}
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(intensitySlider.value * 10, forKey: kCIInputScaleKey)}
        if inputKeys.contains(kCIInputCenterKey) {
            currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2),
                                   forKey: kCIInputCenterKey)}
        
        if let cgimg = context.createCGImage(currentFilter.outputImage!,
                                             from: currentFilter.outputImage!.extent) {
            let processImage = UIImage(cgImage: cgimg)
            self.imageView.image = processImage
        }
    }
    
    @objc func image(_ iamge: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let alertController = UIAlertController(title: "Save error",
                                                    message: error.localizedDescription,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(title: "Saved",
                                                    message: "Your altered image is now saved to photos",
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertController, animated: true)
        }
    }
    
    
}

