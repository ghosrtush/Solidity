// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }
    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({text:_text, completed: false}));
    }

    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text;
    }

    function get(uint _index) external view returns(string memory, bool) {
        Todo memory todo = todos[_index];
        return(todo.text, todo.completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }

}



// 35138 gas as the array index is accessed 4 times. better for one field update
// todos[_index].text = _text;
// todos[_index].text = _text;
// todos[_index].text = _text;
// todos[_index].text = _text;

//34578 gas as the array index is accessed once and the updated 4
// Todo storage todo = todos[_index]
// todos[_index].text = _text;
// todos[_index].text = _text;
// todos[_index].text = _text;
// todos[_index].text = _text;
