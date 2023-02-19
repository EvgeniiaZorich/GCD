//
//  SecondViewController.swift
//  GCD
//
//  Created by Евгения Зорич on 19.02.2023.
//

import UIKit

class SecondViewController: ViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://memepedia.ru/wp-content/uploads/2020/10/big-floppa-meme.png")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)
    }
}
