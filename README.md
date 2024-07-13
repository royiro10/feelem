# FeelEm

## Overview

`FeelEm` is a Git hook for the `commit-msg` hook that uses Husky to automatically prefix your commit messages with an emoji based on the commit topic. Emojis are selected from a predefined table, which is determined using a language model. This tool enhances your commit messages with visual cues, making it easier to categorize and understand changes at a glance.

## Features

- **Automated Emoji Prefixing:** Adds an emoji prefix to your commit messages based on the commit topic.
- **Customizable Emoji Table:** Uses an emoji table defined on GitHub, which you can modify to suit your project.
- **Seamless Integration:** Integrates easily with Husky for straightforward setup.

## Installation

1. **Install Husky:** If Husky is not already installed, add it to your project by running:

   ```bash
   npm install husky --save-dev
   ```

   then init your husky project:

   ```bash
   npx husky init
   ```

2. **Install `feelem`:**

   ```bash
   npm install feelem --save-dev
   ```

3. **Set up Husky Hooks:**

  Set up should happen automaticlly after installing the package

4. **Set up Gemini API Key:**

  `feelem` requires Gemini to work. you should supply it GEMINI_API_KEY as an environemnt variable so it can use Google Gemini LLM.
  
  ```bash
  export GEMINI_API_KEY= # you private key
  ```

## Usage

When making a commit, `feelem` will analyze the commit message and automatically prefix it with an appropriate emoji based on the topic. For example:

- A commit message with the topic "fix bug" might be prefixed with a 🐛 (bug) emoji.
- A commit message with the topic "add feature" might be prefixed with a ✨ (sparkles) emoji.

## Contributing

Contributions are welcome! To contribute to `feelem`, please follow these steps:

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Push your changes to your fork.
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or issues, please open an issue on the [GitHub repository](https://github.com/royiro10/feelem).
