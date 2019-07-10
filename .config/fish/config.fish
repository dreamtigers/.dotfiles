# Don't print working directory in a compact way.
set -gx fish_prompt_pwd_dir_length 0

# ---------------------------------------------------------------------
# PATH
# ---------------------------------------------------------------------
# If Ruby exists, we want to have it's bins available.
if command -v ruby > /dev/null
  set -l ruby_dir (ruby -e 'print Gem.user_dir')
  set -l ruby_bin_dir "$ruby_dir/bin"
  if test ! -d $ruby_bin_dir
    echo "Creating $ruby_bin_dir"
    mkdir -p $ruby_bin_dir
  end

  set -x GEM_HOME $ruby_dir
  set -x PATH $PATH $ruby_bin_dir
end

# How can we miss Rust?
if command -v cargo > /dev/null
  set -l cargo_bin_dir "$HOME/.cargo/bin"
  if test ! -d $cargo_bin_dir
    echo "Creating $cargo_bin_dir"
    mkdir -p $cargo_bin_dir
  end

  set -x PATH $PATH $cargo_bin_dir
end

# The same applies to Yarn
if command -v yarn > /dev/null
  set -l yarn_bin_dir "$HOME/.yarn/bin"
  if test ! -d $yarn_bin_dir
    echo "Creating $yarn_bin_dir"
    mkdir -p $yarn_bin_dir
  end

  set -x PATH $PATH $yarn_bin_dir
end

# Set the best editor
if command -v nvim > /dev/null
  set -x EDITOR nvim
  set -x MANPAGER 'nvim +Man!'
else if command -v vim > /dev/null
  set -x EDITOR vim
else
  set -x EDITOR vi
end
