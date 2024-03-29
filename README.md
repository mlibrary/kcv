[![Tests](https://github.com/mlibrary/kcv/actions/workflows/test.yml/badge.svg)](https://github.com/mlibrary/kcv/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/mlibrary/keycard/badge.svg?branch=main)](https://coveralls.io/github/mlibrary/kcv?branch=main)
[![User Docs](https://img.shields.io/badge/user_docs-readthedocs-blue.svg)](https://kcv.readthedocs.io/en/latest)
[![API Docs](https://img.shields.io/badge/API_docs-rubydoc.info-blue.svg)](https://www.rubydoc.info/gems/kcv)

# KCV

KCV is a glue gem for making it easy to use [Keycard](https://github.com/mlibrary/keycard),
[Checkpoint](https://github.com/mlibrary/checkpoint), and [Vizier](https://github.com/mlibrary/keycard)
together in your application.

Each of the above libraries is designed to be independent of each other, but follow relatively
simple interfaces that work together. For example, Checkpoint grants permissions to agents
and has an AgentResolver extension mechanisms and Keycard can inspect a request for the attributes
needed to create agents, but neither should depend on the other. This is where KCV comes in,
providing an AgentResolver implementation that depends on Keycard's interface. Then, this can
be used directly or extended within your application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kcv'
```

And then execute:

    $ bundle

## Compatibility

KCV is intended to be compatible with all community-supported Ruby branches (i.e., minor versions), currently:

 - 2.6
 - 2.7
 - 3.0
 - 3.1

We prefer the newest syntax and linting rules that preserve compatibility with the oldest branch in normal maintenance.
When the security maintenance for a branch expires, Keycard's compatibility should be considered unsupported.

See also, [Ruby's branch maintenance policy](https://www.ruby-lang.org/en/downloads/branches/).

## License

Checkpoint is licensed under the BSD-3-Clause license. See [LICENSE.md](LICENSE.md).
