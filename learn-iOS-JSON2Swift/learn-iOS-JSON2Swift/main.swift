//
//  main.swift
//  learn-iOS-JSON2Swift
//
//  Created by levypan on 10/9/20.
//  Copyright © 2020 Googo. All rights reserved.
//

import Foundation

// MARK: 输入输出
let input_path = "/Users/levypan/Documents/*code/learn-iOS-JSON2Swift/test/input.json"
let output_path = "/Users/levypan/Documents/*code/learn-iOS-JSON2Swift/test/output.swift"
let readHandle = FileHandle.init(forReadingAtPath: input_path)
let writeHandle = FileHandle.init(forWritingAtPath: output_path)
let updateHandle = FileHandle.init(forUpdatingAtPath:  input_path)

// 数据输入
let string = try! String.init(contentsOfFile: input_path)
let data2 = readHandle?.readDataToEndOfFile()
let str2 = String.init(data: data2!, encoding: String.Encoding.utf8)

// 标识符
var indexLeft = str2!.startIndex
var indexRight = str2!.startIndex

var name_l = 0
var name_r = 0

var value_l = 0
var value_r = 0

// 最终结果
let prefix = "\tvar "
let demo = ": "
let next = "\n"
var resultString = "struct " + "Output" + ": Codable " + "{\n"

// MARK: 处理
for index in str2!.indices {
    if name_r == 0 && str2![index] == "\"" {
        name_l = 1
        indexLeft = str2!.index(index, offsetBy: 1)
    }
	
    if name_l == 1 && str2![index] == "\"" {
        name_r = 1
        indexRight = index
    }
	
    if name_l + name_r == 2 && str2![index] == ":" {
        let sub = String(str2![indexLeft..<indexRight])
        let newString = String(sub)
        resultString += prefix + newString + demo
        name_l = 0
        name_r = 0
        value_l = 0
        value_r = 0
    }
	
    if value_l == 0 && str2![index] == "\"" {
        value_l = 1
    } else {
        if value_r == 0 && str2![index] == "." {
            value_r = 1
        }
    }
	
    if str2![index] == "," || str2![index] == "}" {
        var newString1 = ""
        if value_l == 1 {
            newString1 = "String"
        } else {
            if value_r == 1 {
                newString1 = "Float"
            } else {
                newString1 = "Int"
            }
        }
        resultString += newString1 + next // append
		
        name_l = 0
        name_r = 0
        value_l = 0
        value_r = 0
    }
}

// 最终输出
resultString += "}"
let writeData = resultString.data(using: String.Encoding.utf8)
writeHandle?.write(writeData!)

print("JSON to Swift Success!!")



