//
//  WideCustomButton.swift
//  GB-PROJ
//
//  Created by aaa on 02/10/2023.
//

import SwiftUI


struct WideBlueButton: View {
    
    @State var buttonText: String
    var onPress: () -> Void
    
    init(buttonText: String, onPress: @escaping () -> Void) {
        self._buttonText = State(initialValue: buttonText)
        self.onPress = onPress
    }
    var body: some View {
        Button(action: {
            onPress()
        }) {
            Text(buttonText)
                .font(Font.T2TextSemibold())
        }
        .frame(maxWidth: .infinity, maxHeight: 52)
        .foregroundColor(.black)
        .background(Color.Primary.num1)
        .cornerRadius(12)
        
    }
}


struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        WideBlueButton(buttonText: "Button", onPress: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


