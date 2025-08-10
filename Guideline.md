# Fk-NVim Contribution Guidelines

<p align="center">
  <a href="https://github.com/Fk-NVim/Fk-NVim">
    <img src="https://img.shields.io/badge/Fk--NVim-Neovim%20Configuration-blue.svg?style=for-the-badge&logo=neovim" alt="Fk-NVim Badge"/>
  </a>
  <a href="https://github.com/Fk-NVim/Fk-NVim/stargazers">
    <img src="https://img.shields.io/github/stars/Fk-NVim/Fk-NVim?style=for-the-badge" alt="GitHub Stars"/>
  </a>
  <a href="https://github.com/Fk-NVim/Fk-NVim/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/Fk-NVim/Fk-NVim?style=for-the-badge" alt="License"/>
  </a>
</p>

Welcome to the Fk-NVim project! We are excited that you are interested in contributing. This document provides a comprehensive guide for contributors, whether you are a seasoned open-source developer or a newcomer participating in programs like Google Summer of Code (GSoC) or Open Source Connect.

## Philosophy and Goals

Fk-NVim aims to provide a highly personalized and efficient Neovim experience. Our goal is to create a configuration that is:

-   **Fast and Responsive:** We prioritize performance to ensure a smooth user experience.
-   **Easy to Customize:** We want users to be able to tailor the configuration to their needs.
-   **Well-Documented:** We believe that good documentation is essential for a successful open-source project.
-   **Community-Driven:** We encourage and value contributions from the community.

## Community and Communication

We have several channels for communication and collaboration:

-   **GitHub Discussions:** For general questions, ideas, and discussions.
-   **GitHub Issues:** For bug reports and feature requests.
-   **Discord/Matrix:** (Coming Soon) We are in the process of setting up a chat server for real-time communication.

## Getting Started for New Contributors

1.  **Fork the Repository:** Click the "Fork" button at the top right of the [Fk-NVim repository](https://github.com/Fk-NVim/Fk-NVim).
2.  **Clone Your Fork:**
    ```bash
    git clone https://github.com/your-username/Fk-NVim.git
    cd Fk-NVim
    ```
3.  **Set Upstream Remote:**
    ```bash
    git remote add upstream https://github.com/Fk-NVim/Fk-NVim.git
    ```
4.  **Install Dependencies:** Follow the instructions in the `README.md` file to install the necessary dependencies.
5.  **Find an Issue:** Look for issues labeled `good first issue`, `help wanted`, or `GSoC`.
6.  **Claim an Issue:** Comment on the issue to let us know you are working on it.
7.  **Create a Branch:**
    ```bash
    git checkout -b your-branch-name
    ```
8.  **Start Coding!**

## Development Workflow

1.  **Make Changes:** Make your changes to the codebase.
2.  **Test Your Changes:** Run the existing tests and add new ones if necessary.
3.  **Commit Your Changes:** Write a clear and concise commit message. We follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.
4.  **Push Your Changes:**
    ```bash
    git push origin your-branch-name
    ```
5.  **Create a Pull Request:** Open a pull request from your fork to the `main` branch of the Fk-NVim repository.
6.  **Code Review:** We will review your pull request and provide feedback.
7.  **Merge:** Once your pull request is approved, we will merge it into the `main` branch.

## Coding Style and Conventions

-   **Lua:** We follow the [Lua Style Guide](https://roblox.github.io/lua-style-guide/).
-   **Vimscript:** We follow the [Google Vimscript Style Guide](https://google.github.io/styleguide/vimscriptguide.xml).
-   **Documentation:** We use `LDoc` for Lua documentation.

## Testing

We use [busted](https://lunarmodules.github.io/busted/) for testing. To run the tests, use the following command:

```bash
busted
```

Please make sure to add tests for any new features or bug fixes.

## Documentation

We believe that documentation is crucial for a successful open-source project. Please make sure to document your code clearly and concisely. We use `LDoc` to generate documentation from the source code.

## Roadmap and Future Plans

We have a public [roadmap](https://github.com/Fk-NVim/Fk-NVim/projects) that outlines our future plans for the project. We encourage you to take a look and contribute to the features that interest you the most.

## Code of Conduct

We have a [Code of Conduct](https://github.com/Fk-NVim/Fk-NVim/blob/main/CODE_OF_CONDUCT.md) that we expect all contributors to follow. Please make sure to read it before you start contributing.

## Acknowledging Contributors

We are grateful for all our contributors. We will acknowledge your contributions in the `README.md` file and on our website.

Thank you for your interest in contributing to Fk-NVim! We look forward to your contributions.