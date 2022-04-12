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


struct PostInputView: View {
    @State private var text: String = "당신의 이야기를 들려주세요."
    
    @State private var showingImagePicker = false
    @State var pickedImage: Image?

    @State var showTextEditor = ""
    @State var itemArray: [String] = []
    private let name: String
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        VStack {
            TextEditor(text: self.$text)
                .foregroundColor(self.text == "당신의 이야기를 들려주세요." ? .gray : .primary)
                .onTapGesture {
                  if self.text == "당신의 이야기를 들려주세요." {
                    self.text = ""
                  }
                }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 800)
            .border(Color.gray, width: 1)
            .font(.system(size:15, weight: .regular))
            .lineSpacing(2.5)
            .multilineTextAlignment(.center)
            .disableAutocorrection(true)
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
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
                    
                    Button(action: {
                        guard let request = try? RequestFactory(url: SoomswimURL.mypageStroy).request(params: ["writer": self.name, "content": self.text]) else { return print("error") }
                        NetworkService().request(request, handler: switchPage)
                    }) {
                        Text("완료")
                    }
                    .foregroundColor(.orange)
                    .font(.body)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func switchPage(data: Response<String>, response: URLResponse?) -> Void {
        DispatchQueue.main.async {
            self.presentationMode.wrappedValue.dismiss()
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
