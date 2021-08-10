//
//  ContentView.swift
//  Login Page
//
//  Created by Mekala Vamsi Krishna on 09/08/21.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let storedUserName = "R"
let storedPassword = "V"


struct ContentView: View {
    
    
    @State var userName: String = ""
    @State var password: String = ""
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false

    
    var body: some View {
        
    NavigationView {
            ZStack {
                VStack {
                    WelcomeText()
                    UserImage()
                    userNameTextField(userName: $userName)
                    passwordSecureField(password: $password)
                    
                    if authenticationDidFail {
                        Text("Username or password is incorrect, try again!")
                            .offset(y: -10)
                            .foregroundColor(.red)
                            
                    }
                    
                    if authenticationDidSucceed {
                        Text("login Succeeded!")
                            .offset(y: -10)
                            .foregroundColor(.green)
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("Forgot Password ?")
                                .foregroundColor(Color.blue.opacity(0.5))
                            
                        }
                    }
                    
                    Button(action: {
                        if self.userName == storedUserName && self.password == storedPassword {
                            self.authenticationDidSucceed = true
                            self.authenticationDidFail = false
                        }else {
                            self.authenticationDidFail = true
                        }
                    }) {
                        LoginButtonContent()
                    }
                    HStack {
                        Text("Don't have an account ?")
                            .foregroundColor(.gray)
                        NavigationLink(destination: secondView()) {
                            Text("Sign Up")
                                .foregroundColor(.blue)

                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("UserImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct userNameTextField: View {
    @Binding var userName: String
    var body: some View {
        TextField("User Name", text: $userName)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct passwordSecureField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
    }
}
