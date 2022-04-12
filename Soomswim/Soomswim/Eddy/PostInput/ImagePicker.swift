//
//  ImageAdd.swift
//  soomswimProject
//
//  Created by 지준용 on 2022/04/06.
//

import SwiftUI

struct SUImagePicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    
    @Environment(\.presentationMode) private var presentationMode // 해당 뷰컨트롤러의 노출 여부
    let sourceType: UIImagePickerController.SourceType
    let imagePicked: (UIImage) -> () // 이미지가 선택됐을때 결과 호출
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

            let parent: SUImagePicker
            init(parent: SUImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
                if let image = info[.originalImage] as? UIImage {
                    parent.imagePicked(image)
                    parent.presentationMode.wrappedValue.dismiss()
                }
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(parent: self)
        }
        
        
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }

}
