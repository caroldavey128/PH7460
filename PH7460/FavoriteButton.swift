//
//  FavoriteButton.swift
//  PH7460
//
//  Created by John Davey Ferrer on 2021-07-22.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .renderingMode(.template)
                .frame(width: 10, height: 10, alignment: .center)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
