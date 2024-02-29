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
    @State var taskList : [String] = []
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("Number of tasks: \(numOfTasks)")
                    Spacer()
                        .padding()
                }
                TextField("Enter a new task", text: $tasks)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Button("Add Task", action: addTask)
                        .padding()
                        .background(tasks.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    Button("Remove All Tasks", action: deleteAll)
                        .padding()
                        .background(taskList.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                List{
                    ForEach(taskList, id: \.self){ item in
                        Text("\(item)")
                    }
                    .onDelete(perform: deleteItem)
                }
                .padding()
            }
            .padding()
            .navigationBarTitle("To-Do List")
        }
       
    }
    
    func addTask(){
        if !tasks.isEmpty{
            taskList.append(tasks)
            numOfTasks += 1
        }
    }
    func deleteItem(offset: IndexSet){
        taskList.remove(atOffsets: offset)
        numOfTasks -= 1
    }
    func deleteAll(){
        taskList.removeAll()
        numOfTasks = 0
    }
}

#Preview {
    ContentView()
}
