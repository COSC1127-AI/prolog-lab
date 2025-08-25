# AI Prolog Lab

This repository contains all of the Prolog code for the RMIT AI Prolog lab.
Exercises are contained in the `lab_exercises.pl` file.
The corresponding slides can be found [here](https://docs.google.com/presentation/d/1WawWqV4g7SQM29SsHZhNlBtQFrEY4lwu0TdMwcjvQyY/edit?usp=sharing) and in the [`.pptx` file](slides/AI24%20-%20Prolog%20Lab.pptx).

This lab was developed by:

- Harry Porter (AI'24 and AI'25 tutor)
- Prof. Sebastian Sardina (instructor)
    - **Email**: ssardina@gmail.com
    - **GitHub**: @ssardina

## Database Files

The `language_database_predicates.pl` and `language_database_lists.pl` files both contain four definitions:

- `is_language/1` specifies that a language is attested, i.e. that it is still spoken or there is written record of it
- `is_proto_language/1` denotes that a language is unattested, and has been theorised or partially reconstructed using its descendants; it is mutually exclusive with `is_language/1`
- `is_extinct/1` means there are no living speakers of a language left today
- `is_parent/2` represents the evolution of languages from their parents

The `language_database_predicates.pl` file should be used for all exercses in `lab_exercises.pl` except the final two: `has_descendants/2` and `has_spoken_descendants/2`.
For these, use `language_database_lists.pl` instead.
The `language_database_propositions.pl` file is only for demonstration.

### Loading Databases

To load SWI Prolog with `.pl` database files, use the `swipl` command with the file names as arguments:

```prolog
$ swipl language_database_predicates.pl lab_exercises.pl
```

Alternatively, `consult` the files inside your `swipl` session:

```prolog
$ swipl
?- consult('language_database_predicates.pl').
true.

?- consult('lab_exercises.pl').
true.
```
