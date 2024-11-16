//
//  CreateNewItemView.swift
//  English_Project
//
//  Created by Leonardo Mesquita Alves on 19/12/23.
//

import SwiftUI
import PhotosUI

struct CreateNewItemView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    @State var title: String = ""
    @State var origin: String = ""
    @State var desc: String = ""
    @State var selectedImage: PhotosPickerItem?
    @State var selectedImageData: Data?
    var body: some View {
        NavigationStack {
            VStack(spacing: nil) {
                List {
                    Section {
                        TextField("Write the name of the new word...", text: $title)
                        TextField("Origin of the new word...", text: $origin)
                    } header: {
                        Text("Word")
                    }
                    Section {
                        TextEditor(text: $desc)
                    } header: {
                        Text("Description")
                    }
                    Section {
                        if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 300)
                        }
                        HStack(alignment: .center) {
                            Spacer()
                            PhotosPicker(selection: $selectedImage,
                                         matching: .images,
                                         photoLibrary: .shared()) {
                                Text("Add an Image")
                            }
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Write a new Word")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Submit") {
                        let item = Item(
                            times: 1,
                            name: title,
                            descrip: desc,
                            origin: origin,
                            image: selectedImageData ?? nil
                        )
                        context.insert(item)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(title.isEmpty || desc.isEmpty)
                }
            }
            .task(id: selectedImage) {
                if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                }
            }
        }
    }
}

#Preview {
    CreateNewItemView()
}
