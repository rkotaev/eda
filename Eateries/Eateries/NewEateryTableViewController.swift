//
//  NewEateryTableViewController.swift
//  Eateries
//
//  Created by Kotaev Ruslan on 26.04.2021.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//

import UIKit

class NewEateryTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        ImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        ImageView.contentMode = .scaleAspectFill
        ImageView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let alertController = UIAlertController(title: "Источник фото", message: nil, preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: "Камера", style: .default, handler:  { (action) in
                self.chooseImagePickerAction(source: .camera)
            })
            let photoLibAction = UIAlertAction(title: "Фото", style: .default, handler: { (action) in
                self.chooseImagePickerAction(source: .photoLibrary)
            })
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alertController.addAction(cameraAction)
            alertController.addAction(photoLibAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func chooseImagePickerAction(source: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}
