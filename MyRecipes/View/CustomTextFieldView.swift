//
//  CustomTextFieldStyle.swift
//  MyRecipes
//
//  Created by Alicja Gruca on 17/09/2022.
//

import SwiftUI

struct CustomTextFieldView: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .frame(height: 32)
            .background(Color("green").opacity(0.25))
            .cornerRadius(10)
            .font(.system(size: 15))
            .multilineTextAlignment(.center)
            .foregroundColor(Color("textColor"))
            .accentColor(Color("textColor"))
    }
}
