//
//  InfoView.swift
//  English_Project
//
//  Created by Leonardo Mesquita Alves on 19/12/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("WORDS COUNT")
                    .font(.title3)
                    .fontWeight(.black)
                    .padding(.top, 20)
                    .padding(.bottom, 8)
                Divider()
                HStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("1,000 to 2 - ").fontWeight(.heavy)
                                .font(.title3)
                                .foregroundStyle(.red)
                            Text("Basic conversation")
                        }
                        HStack {
                            Text("8,000 - ").fontWeight(.heavy)
                                .font(.title3)
                                .foregroundStyle(.orange)
                            Text("Advanced conversation")
                        }
                        HStack {
                            Text("10,000 to 20 - ").fontWeight(.heavy)
                                .font(.title3)
                                .foregroundStyle(.green)
                            Text("University level")
                        }
                        Spacer()
                    }
                    Spacer()
                }.padding(.top)
            }
        }
    }
}

#Preview {
    InfoView()
}
