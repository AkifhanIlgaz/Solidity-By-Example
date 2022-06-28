// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

// You can import structs from other files

contract Struct {
    struct ToDo {
        string text;
        bool isCompleted;
    }

    // An array of "ToDo" structs
    ToDo[] public todos;

    function create(string calldata _text) public {
        // There are 3 ways to initialize a struct

        // 1) Calling like a function
        todos.push(ToDo(_text, false));

        // 2) Key-value mapping
        todos.push(ToDo({text: _text, isCompleted: false}));

        // 3) Initialize an empty struct and update it

        ToDo memory todo;
        todo.text = _text;
        todo.isCompleted = false;
        todos.push(todo);
    }

    //  Update the text of an ToDo
    function updateText(uint256 _index, string calldata _text) public {
        ToDo storage todo = todos[_index];
        todo.text = _text;
    }

    // Complete ToDo
    function toggleCompleted(uint256 _index) public {
        ToDo storage todo = todos[_index];
        todo.isCompleted = true;
    }
}
