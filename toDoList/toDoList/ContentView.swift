//
//  ContentView.swift
//  toDoList
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    //This variable will track how many tasks are added
    @State private var numOfTasks : Int = 0
    //This variable holds what the inputted tasks are
    @State private var tasks : String = ""
    //This array holds all the tasks that user puts in
    @State var taskList : [String] = []
    
    
    var body: some View {
        //This allows for the title to be displayed bold and on the top of the screen on the left like a header
        NavigationView {
            //this vstack will organize everything to present top to bottom on screen
            VStack {
                //This hstack organizes text to go from left to right
                HStack{
                    Text("Number of tasks: \(numOfTasks)")
                    //this spacer takes the space and puts it all on the right
                    Spacer()
                        //This padding will add space between text so it looks neater
                        .padding()
                }
                //This is an input field for user to type in their task
                TextField("Enter a new task", text: $tasks)
                //this styles the entry field so it's rounded on the edges
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //This will organize the buttons from left to right
                HStack {
                    //This is the add task button and it will call the function too
                    Button("Add Task", action: addTask)
                    //this adds spacing around text in button
                        .padding()
                        //using ternary operator, the button will be gray when there's no text but turn blue when there is a text
                        .background(tasks.isEmpty ? Color.gray : Color.blue)
                        //This makes the text/font color white
                        .foregroundColor(.white)
                        //this rounds up the corners of button
                        .cornerRadius(10)
                    //This button will remove all the task, calling the function when clicked
                    Button("Remove All Tasks", action: deleteAll)
                        //this adds spacing around text in button
                        .padding()
                        //using ternary operator, the button will be gray when there's no task but turn blue when there is at least one task in array
                        .background(taskList.isEmpty ? Color.gray : Color.blue)
                        //this makes font color white
                        .foregroundColor(.white)
                        //this rounds the corner edges of button
                        .cornerRadius(10)
                    }
                //This is for the items to present in a list format
                List{
                    //Using for each loop, every string in array will be an indivual item so every task has its own component
                    ForEach(taskList, id: \.self){ item in
                        //The text will be what the user put in as their tasks using string interpolation
                        Text("\(item)")
                    }
                    //When user slides over task, the delete will pop up and when clicked, function to delete will be called & perform action
                    .onDelete(perform: deleteItem)
                }
                //This adds padding so its not cluttered
                .padding()
            }
            //This adds padding so its not cluttered
            .padding()
            //this makes the navigation bar title say 'to-do list'
            .navigationBarTitle("To-Do List")
        }
       
    }
    
    //This function is responsible for adding a task to the list
    func addTask(){
        //If tasks is not empty, meaning there is a task inputted, the code will run
        if !tasks.isEmpty{
            //the array will append the string, adding the task to the list of tasks
            taskList.append(tasks)
            //This adds one every time a new task gets added, updating everytime
            numOfTasks += 1
            //this resets text field back to empty after task gets added
            tasks = ""
        }
    }
    //This function will allow user to delete each task individually
    func deleteItem(offset: IndexSet){
        taskList.remove(atOffsets: offset)
        //The number of tasks will decrease by one because a task got deleted
        numOfTasks -= 1
    }
    
    //This function will delee all the tasks when button clicked
    func deleteAll(){
        //the entire array will become empty
        taskList.removeAll()
        //the number of tasks will reset to 0
        numOfTasks = 0
    }
}

#Preview {
    ContentView()
}
