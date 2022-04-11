//
//  PostInputView.swift
//  soomswimProject
//
//  Created by 지준용 on 2022/04/07.
//

import SwiftUI

struct TextView: UIViewRepresentable {

    @Binding var text: String
    @Binding var font: UIFont
        
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        return textView
    }
  
    func updateUIView(_ uiView: UITextView, context: Context) {

    }
    func makeCoordinator() -> Coordinator {
      Coordinator($text)
    }
    class Coordinator: NSObject {
        var text: Binding<String>
      
        init(_ text: Binding<String>) {
            self.text = text
        }
    }
}
  
extension TextView.Coordinator: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
      
        self.text.wrappedValue = textView.text
    }

}


struct postInputView: View {

    @Binding var shouldPopToRootView : Bool

    @State private var text: String = ""
    
    @State private var showingImagePicker = false
    @State var pickedImage: Image?

    @State var showTextEditor = ""
    @State var itemArray: [String] = []
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.gray)
            }
        }
    }
    
    
    var body: some View {
        ZStack{
            TextEditor(text: self.$text)
            Text(text).opacity(0).padding()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 800)
        .border(Color.gray, width: 1)
        .font(.system(size:15, weight: .regular))
        .lineSpacing(2.5)
        .multilineTextAlignment(.center)
        .onChange(of: text, perform: { value in
                print("Value of text modified to = \(text)")
            })
        .disableAutocorrection(true)

        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 20){
                    Button(action:{self.showingImagePicker.toggle()
                    }, label: {
                        Image(systemName: "camera")
                    }).sheet(isPresented: $showingImagePicker) {
                        SUImagePicker(sourceType: .photoLibrary) { (image) in
                            self.pickedImage = Image(uiImage: image)
                            print(image)
                        }
                    }
                    .imageScale(.medium)
                    .font(.title3)
                    .foregroundColor(.orange)
                    
                    
                    Button(action: { self.shouldPopToRootView = false } ){
                        Text("완료")
                    }
                    .foregroundColor(.orange)
                    .font(.body)
                }
            }
        }
    }
        }
//extension View {
//    func hideKeyboard() {
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
        
struct PostInputView_Previews: PreviewProvider {
    static var previews: some View {
        BeforePostInputView()
    }
}
