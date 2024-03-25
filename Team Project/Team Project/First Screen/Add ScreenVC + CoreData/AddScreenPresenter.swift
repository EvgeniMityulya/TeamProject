import SwiftUI
import UIKit

//MARK: - ADDSCREEN PRESENTER
final class AddScreenPresenter: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var didSelectImage: ((UIImage) -> Void)?
    
    func editButtonTapped() {
        showImagePicker()
    }
    
    //MARK: - IMAGE PICKER
    private func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        UIApplication.shared.windows.first?.rootViewController?.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            didSelectImage?(image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
