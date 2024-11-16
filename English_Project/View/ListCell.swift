//
//  ListCell.swift
//  English_Project
//
//  Created by Leonardo Mesquita Alves on 19/12/23.
//

import SwiftUI

struct ListCell: View {
    let item: Item
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                        .fontWeight(
                            Calendar.current.isDate(
                                item.date,
                                equalTo: .now,
                                toGranularity: .hour
                            ) ? .bold : .medium)
                    if Calendar.current.isDate(item.date, equalTo: .now, toGranularity: .hour) {
                        Circle()
                            .frame(width: 7)
                            .foregroundStyle(.green)
                            .opacity(0.6)
                    }
                }
                Text(item.descrip)
                    .font(.caption2)
                    .lineLimit(1)
            }
            Spacer(minLength: 20)
            if let image = item.image, let uiimage = UIImage(data: image) {
                Image(uiImage: uiimage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(.vertical, 2)
    }
}
