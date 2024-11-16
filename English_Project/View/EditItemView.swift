//
//  EditItemView.swift
//  English_Project
//
//  Created by Leonardo Mesquita Alves on 19/12/23.
//

import SwiftUI

struct EditItemView: View {
    @State var title: String = ""
    @State var origin: String = ""
    @State var descrip: String = ""
    @State var img: Data?
    let item: Item
    var body: some View {
        NavigationStack {
            VStack {
                Text(descrip)
                if let image = item.image, let uiImage = UIImage(data: image) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }.padding()
            .navigationTitle(title)
        }.onAppear {
            title = item.name
            origin = item.origin
            descrip = item.descrip
            img = item.image
        }
    }
}
