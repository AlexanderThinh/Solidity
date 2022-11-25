// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo(_text, false));
    }

    function updateTodoText(uint _index, string calldata _text) external {
        //C1
        todos[_index].text = _text;

        //C2
        // Todo storage todo = todos[_index];
        // todo.text = _text;
    }

    function get(uint _index) external view returns(string memory, bool) {
        Todo memory todo = todos[_index];

        return (todo.text, todo.completed);
    }

    function toggleTodoCompleted(uint _index) external {
        //C1
        todos[_index].completed = !todos[_index].completed;

        //C2
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}