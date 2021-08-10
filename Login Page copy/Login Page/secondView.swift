//
//  secondView.swift
//  Login Page
//
//  Created by Mekala Vamsi Krishna on 09/08/21.
//

import SwiftUI

struct secondView: View {
    @State var email: String = ""
    @State var emailPassword: String = ""
    var body: some View {
            ZStack {
                VStack{
                    SignUpDetails()
                    emailTextField(email: $email)
                    emailSecureField(emailPassword: $emailPassword)
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("Forgot Password ?")
                                .foregroundColor(Color.orange.opacity(0.5))
                        }
                    }
                    Button(action: {
                        
                    }) {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.orange)
                            .cornerRadius(15.0)
                    }
                }
                .padding()
            }
    }
}


struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        secondView()
    }
}

struct SignUpDetails: View {
    var body: some View {
        Text("Sign Up Details")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct emailTextField: View {
    @Binding var email: String
    var body: some View {
    
        TextField("Create Username", text: $email)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct emailSecureField: View {
    @Binding var emailPassword: String
    var body: some View {
        SecureField("Create Password", text: $emailPassword)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
