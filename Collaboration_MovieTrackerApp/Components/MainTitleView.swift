//
//  MainTitleView.swift
//  Collaboration_MovieTrackerApp
//
//  Created by Nika Jamatashvili on 07.01.24.
//

import SwiftUI

struct MainTitleView: View {
    //MARK: - Properties
    var title: String
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 8) {
            Rectangle()
                .frame(width: 4, height: 32)
                .foregroundColor(AppColor.primaryGreen)
                .cornerRadius(2)
            
            Text(title)
                .font(.title)
                .bold()
                .foregroundStyle(AppColor.textPrimary)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    MainTitleView(title: "Movies in Cinema")
}
