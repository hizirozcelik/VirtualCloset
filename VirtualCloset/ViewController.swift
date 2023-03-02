//
//  ViewController.swift
//  VirtualCloset
//
//  Created by HIZIR OZCELIK on 2023-02-17.
//  Main branch
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var button : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.backgroundColor = .secondarySystemBackground
        
        button.backgroundColor = .systemBlue
        button.setTitle("Take Picture", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
    }
    
    @IBAction func didButtonClicked(){
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
        
    }
}

extension ViewController: UIImagePickerControllerDelegate,
                          UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as?
                UIImage else{
            return
        }
        imageView.image = image
    }
}

