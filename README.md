# Dealer

My first elixir project to see what the language and functional programming is like. 
The elixir dealer provides functions for creating and handling a Standard 52-card deck.

## Things to know

- "mix" is like npm for JavaScript. It generates and compiles projects and their manages dependencies. `mix new dealer` generates a new elixir project with the name "dealer".
- To call a function in elixir you don't have to add "()" at the end.
- "iex" stand for "interactive elixir shell" which is just like jshell. 
- The `mix.exs` file is like a `package.json`in npm containing meta data and dependencys.
- The `mix.lock` file is like a `package-lock.json` in npm.
- You can compile the project with `iex -S mix` and then call functions on the module like `Dealer.create_deck`
- You can recompile inside iex by calling `recompile`
- The last statment in a function is automatically returned, there is no need to explicitly return.
- "?" is a valid identifier for functions in elixir and is commonly used to if functions return true/false.
- Pipe operator "|>" automatically passes result of method to next method as first parameter.
- `mix deps.get` is like `npm install`.
- `mix docs` generates "exdoc" which is like JavaDoc under "doc" folder.
- `mix test` runs all unit tests
- In elixir you can write Doctests which are a good way to test your code but also generate documentation for users.
