# AI Prolog Lab

This repository contains all of the Prolog code for the RMIT AI Prolog lab. All exercises are contained in the `lab-exercises.pl` file.

Google Slides used can be found [HERE](https://docs.google.com/presentation/d/1WawWqV4g7SQM29SsHZhNlBtQFrEY4lwu0TdMwcjvQyY/edit?usp=sharing) and in the [PTT file](slides/AI24%20-%20Prolog%20Lab.pptx).

Lab was developed by Harry Porter (AI'24 tutor) and Prof. Sebastian Sardina (instructor; ssardina@gmail.com; ssardina @ GH).

## Databases

### Database Files

The `language-database-predicates.pl` and `language-database-lists.pl` files both contain four predicates:

- `isLanguage/1` specifies that a language is attested, i.e. that it is still spoken or there is written record of it.
- `isProtoLanguage/1` denotes that a language is unattested, and has been theorised or partially reconstructed using its descendants. Mutually exclusive with `isLanguage/1`.
- `isExtinct/1` means that there are no living speakers of a language left today.
- `isParent/2` represents the evolution of languages from their parents.

The `language-database-predicates.pl` file should be used for all exercses in `lab-exercises.pl` except the final two: `hasDescendants/2` and `hasSpokenDescendants/2`. For these, use `language-database-lists.pl`. The `language-database-propositional.pl` database is only for demonstration.

### Loading Databases

To load SWI Prolog with `.pl` database files, use the `swipl` command with the file names as arguments:

```prolog
$ swipl language-database-predicates.pl lab-exercises.pl
?-
```
