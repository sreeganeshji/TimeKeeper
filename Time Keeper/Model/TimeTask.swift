//
//  Task.swift
//  Time Keeper
//
//  Created by Ganesh Bangalore on 8/12/23.
//

import Foundation

/*
 task1
 task2
 
 storage: [TaskId->[[startUTC: stopUTC][Start: Stop][]
 
 When should I update the backend?
 when a task is running, or when it stops? or when we minimize the app?
 
 Only when there is a state transition.
 I could do the DB integration in the backend.
 I could send the state to the backend too.
 When I pull up the screen, it can check the backend for the latest info.
 
 1. When you create a task:
    Call the backend API to create it
 2. When you start a task:
    Call the API to say that it has been started
 3. When you stop the task, call the backend and inform the change of state.
 
 Considerations:
 * Wrong. Don't need to pass the timestamp since the call will have a timestamp. (This is not sufficient since there can be a scenario where there are delays in the request reaching the API)
 * Don't need to store any files on the local system (Caching) because everyting is user based and the APIs should provide the info.
 * 5 main API endpoints
 : 1. Auth related stuff
 2. Create Task
 3. Update Task
 4. Delete Task
 5. Metadata about Task usage, like analytics
 
 So the current total could be based on the last started time, or the start of day. There will be bad consequences if I keep track of the time based on start of day because the UI will break.
 I can store the last updated time locally.
 1. if current state is running and last updated time was 5 days ago, then we keep adding up time since then. It needs to also be
 2. if current state is stopped and last update time was 5 days ago, then you need to show the total since that day, month, year, etc. or just the last session since opening the App.
 
 Actally I would want to know the total since start of day, etc.
 I could keep the reference as day, week, month. Keep default as day
 
 If I keep the data with min as a day, then it would simplify it further.
 [task][day][value]
 Keep it in UTC
 You just need to know today's value
 
 actually the granularity might help.
 
 I could pull the snippets based on the time range set.
 
 
 */

public class TimeTask: Codable
{
    /**
     Id to identify instance uniquely
     */
    public var Id: Int
    
    /**
     Title to identify a task. Doesn't have to be unique
     */
    public var Title: String
    
    /**
     Description of the task. could be length limited.
     */
    public var Description: String
    
    /**
     Current state of the task
     */
    public var State: TaskState
    
    /**
     Start of the available data fetched from the backend.
     
     */
    public var DataStartTime: Date
    
    /**
     History of previous usage
     */
    public var History: [TimeSpan]
    
    /**
     Category
     */
    public var TaskCategory: TaskCategory
    
    public func ToJsonString() throws -> String
    {
        let encoder: JSONEncoder = JSONEncoder()
        let jsondata: Data = try encoder.encode(self)
        guard let jsonString = String(data: jsondata, encoding: .utf8) else
        {
            throw EncodingError.invalidValue(self, .init(codingPath: [], debugDescription: "Could not extract json"))
        }
        
        return jsonString
    }
    
    static func FromJSONString(jsonString: String) throws -> TimeTask {
        guard let jsonData = jsonString.data(using: .utf8) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Could not decode string \(jsonString)"))
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(TimeTask.self, from: jsonData)
    }
}
