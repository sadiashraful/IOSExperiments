//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Mohammad Ashraful Islam Sadi on 29/12/19.
//  Copyright © 2019 Wheels-Corporation. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?

    override func viewDidLoad() {    //The method gets called after the screen has loaded and the customization will now sit on top of it.
        super.viewDidLoad()          //Telling the parent class to run its code before the user runs the customized code.
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    

}
