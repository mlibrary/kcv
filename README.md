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

## License

Checkpoint is licensed under the BSD-3-Clause license. See [LICENSE.md](LICENSE.md).
