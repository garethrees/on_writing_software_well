# On Writing Software Well Code Snippets

This repository includes code snippets from the [On Writing Software Well](https://www.youtube.com/playlist?list=PL9wALaIpe0Py6E_oHCgTrD6FvFETwJLlx) series hosted by [David Heinemeier Hansson](https://twitter.com/dhh).

This repository is heavily inspired by [virolea/on_writing_software_well](https://github.com/virolea/on_writing_software_well), but whereas that lists the code samples episode-by-episode, this repository aims to recreate as much as the `bc3` codebase as possible within a conventional Rails folder structure.

The repo contains two main directories:

1. [`bc3`](./bc3): Only files that were discussed in the episodes.
2. [`bc3_with_stub_files`](./bc3_with_stub_files):  The contents of `bc3` plus empty files where they were visible in the TextMate File Browser. This helps to build a better picture of the overall architecture of the application.

The intention of this repository is to be able to more easily read the code presented in the episodes without needing to remember exactly which episode a given file was discussed, and also to learn from the domain language and architecture revealed through the stub files.

## List of episodes

- [Episode 1](https://www.youtube.com/watch?v=wXaC0YvDgIo&list=PL9wALaIpe0Py6E_oHCgTrD6FvFETwJLlx&index=1): Pilot Episode
- [Episode 2](https://www.youtube.com/watch?v=M3JPTOTqsnE&list=PL9wALaIpe0Py6E_oHCgTrD6FvFETwJLlx&index=2): Using callbacks to manage auxiliary complexity
- [Episode 3](https://www.youtube.com/watch?v=lEUkarkROv0&list=PL9wALaIpe0Py6E_oHCgTrD6FvFETwJLlx&index=3): Using globals when the price is right
- [Episode 4](https://www.youtube.com/watch?v=hkmrfjex7jI&list=PL9wALaIpe0Py6E_oHCgTrD6FvFETwJLlx&index=4): Not every model is backed by a database
- [Episode 5](https://www.youtube.com/watch?v=5hN6OZDyQtk&list=PL9wALaIpe0Py6E_oHCgTrD6FvFETwJLlx&index=5): Testing without test damage or excessive isolation.
- [Episode 6](https://www.youtube.com/watch?v=AoxoPfilKqE&list=PL9wALaIpe0Py6E_oHCgTrD6FvFETwJLlx&index=6): Actually deleting data, not just pretending to
- [Episode 7](https://www.youtube.com/watch?v=Yd3j3ZEx6DU&list=PL9wALaIpe0Py6E_oHCgTrD6FvFETwJLlx&index=7): Move the specifics down as far as it'll go when evolving your codebase
- [Bonus](https://gist.github.com/tomafro/054d7d1a7c40ade27405599289196a54): `Suppressible` module posted by a Basecamp programmer
