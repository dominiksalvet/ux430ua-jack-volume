# Contribution Guide

The development of this project is published on the URL stated in the [*meta/dev-url*](meta/dev-url) file and **everyone is welcome to contribute** there. Here is described how.

## Suggestions

If you have any suggestions on development of this project, follow these steps:

1. Take a look at issues of the project and **make sure that the same suggestion wasn't already reported**.
2. If not, open a new issue. In the issue, **try to provide as much relevant information as possible**.

## Merge requests

**Except the merge requests with bug fixes**, every merge request must precede creating an issue as described in the [previous section](#suggestions) and also must be approved. Then, follow these steps:

1. Fork this project.
2. Create a new branch with descriptive name according to your changes.
3. Note your changes to the [Unreleased](CHANGELOG.md#unreleased) section in the [*CHANGELOG.md*](CHANGELOG.md) file.
4. Commit and push your changes to the branch.
5. Submit a new merge request with **clear description of the problem and solution**. Also include the relevant issue number if applicable.

## License

By contributing, you agree that your contributions will be licensed under the same license that is published in the [*LICENSE.md*](LICENSE.md) file.

---

## Forking this project

In case you decide to fork this project and continue with the development on your own, files in the [*meta/*](meta/) directory are all that should be modified to make the forking complete. However, there **still could exist some exceptions** that for some reason can't depend on that files. If they exist, they are listed, in the *exceptions* file placed in the [*meta/*](meta/) directory, one per line.
