# Jekyll Course Notes

**[[Demo]](https://brentyi.github.io/jekyll-course-notes)**

A general Jekyll theme for writing course notes, based on the source code for
the [CS231n notes website](https://github.com/cs231n/cs231n.github.io) written
by Andrej Karpathy.

Attempts to minimize the amount of hardcoding needed for the website by
explicitly organizing contents into a series of _modules_, which each contain
several _chapters_:

- A listing of all modules is found in `index.md`. Each module contains: a
  display name and directory to find chapters within.
- To create a chapter, we add a Markdown file to
  `_chapters/module_dir/chapter_name.md`.
  - The front matter for the chapter contains: a title, keyword list, and
    ordering priority.
