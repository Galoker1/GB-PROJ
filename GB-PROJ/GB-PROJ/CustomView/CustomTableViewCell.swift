//
//  CustomTableViewCell.swift
//  GB-PROJ
//
//  Created by Александра Макей on 18.10.2023.
//

import SwiftUI

struct CustomTableViewCell: View {
    let mediaItem: MediaItem
    
    var body: some View {
        HStack {
            if let posterImage = mediaItem.poster {
                Image(uiImage: posterImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(12)
                    .shadow(color: Color.white.opacity(0.5), radius: 3)
            } else {
                ProgressView()
                    .frame(width: UIScreen.main.bounds.width,  height: 500)
            }
            CustomDisplayTextLabel(textLabel: mediaItem.name, color: Color.Neutral.white, style: .T3DisplayRegular)
            Spacer()
        }
    }
}
