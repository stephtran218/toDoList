//
//  ContentView.swift
//  toDoList
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numOfTasks : Int = 0
    @State private var tasks : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Number of tasks: \(numOfTasks)")
                TextField("Enter a new task", text: $tasks)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Button("Add Task", action: newTask)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    Button("Remove All Tasks", action: deleteAll)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            .navigationBarTitle("To-Do List")
        }
       
    }
    
    func newTask(){
        
    }
    func deleteAll(){
        
    }
}

#Preview {
    ContentView()
}
