# minchalle_rubocop

A shared RuboCop configuration gem to enforce consistent Ruby coding standards across projects.

## Installation & Usage

### Adding to a Project Gemfile

Since this is a public repository, you can reference it directly via GitHub in your `Gemfile`:

```ruby
group :development, :test do
  gem "minchalle_rubocop", github: "a10lab/minchalle_rubocop", branch: "main"
end
```

Then, add the plugin to your project's `.rubocop.yml`:

```yaml
plugins:
  - minchalle_rubocop
```

#### Alternative: Using Git Submodules

If you prefer vendoring the gem into your repository using Git submodules:

1. Add as a submodule:
   ```sh
   mkdir -p vendor/gems
   git submodule add https://github.com/a10lab/minchalle_rubocop.git vendor/gems/minchalle_rubocop
   git submodule update --init
   ```

2. Reference the local path in your `Gemfile`:
   ```ruby
   group :development, :test do
     gem "minchalle_rubocop", path: "vendor/gems/minchalle_rubocop"
   end
   ```

### Global Installation for Local Development

To use this configuration across all local projects without adding it to a specific `Gemfile`:

1. Clone the repository:
   ```sh
   git clone https://github.com/a10lab/minchalle_rubocop.git
   cd minchalle_rubocop
   ```

2. Build and install the gem locally:
   ```sh
   # Remove old builds if present
   rm -f minchalle_rubocop-*.gem

   # Build and install
   gem build minchalle_rubocop.gemspec
   gem install minchalle_rubocop-*.gem
   ```

3. Add the plugin to your global `~/.rubocop.yml`:
   ```sh
   echo -e "plugins:\n  - minchalle_rubocop" >> ~/.rubocop.yml
   ```
