% Start the game
start_game :-
    run_menu([a, b, c]).

% Menu and options
run_menu(Letters) :-
    nl, write('Hi. This is the "Name Game".'), nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    write(': '),
    read(Choice),
    handle_choice(Choice, Letters).

handle_choice(1, Letters) :-
    write('Current letters: '), write(Letters), nl,
    run_menu(Letters).

handle_choice(2, Letters) :-
    write('Enter the letter to add: '), nl,
    read(Letter),
    NewLetters = [Letter | Letters],
    run_menu(NewLetters).

handle_choice(3, Letters) :-
    write('Enter the letter to add at the top: '), nl,
    read(Letter),
    NewLetters = [Letter | Letters],
    run_menu(NewLetters).

handle_choice(4, Letters) :-
    write('Enter the letter to add at the bottom: '), nl,
    read(Letter),
    append(Letters, [Letter], NewLetters),
    run_menu(NewLetters).

handle_choice(5, Letters) :-
    write('Enter the letter you want to delete: '), nl,
    read(Letter),
    delete_element(Letter, Letters, NewLetters),
    run_menu(NewLetters).

handle_choice(6, _) :-
    run_menu([]).

handle_choice(7, _) :-
    write('Goodbye!'), nl.

handle_choice(_, Letters) :-
    run_menu(Letters).

% Helper predicate to delete an element
delete_element(_, [], []).
delete_element(X, [X | Tail], Tail).
delete_element(X, [H | Tail], [H | Result]) :-
    X \= H,
    delete_element(X, Tail, Result).