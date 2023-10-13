# Package Maintenance Instructions

The following instructions are for maintaining the package. These include topics like:

* How to edit/update the YAMTL lexer
* MkDocs Material token styles cheatsheet
* How to package the yamtl-pygments-lexer plugin
* How to deploy the plugin to PyPI


## Edit/Update the YAMTL Lexer

The lexer code can be found in `YamtlLexer/lexer.py` file. First, we import things like lexer functions, attributes, tokens and superclass lexers.

All 4 YAMTL variants have been setup as required. You only need to edit these lexers if you want to have a more complete syntax highlighting by adding regex expressions and tokens as key-value pairs. This can be found in the `token` variable of each lexer. There are comments to guide you on where to place your code. Notice how other YAMTL keywords have been defined and you can use that as a basis for creating new ones. Usually, you don't need to add a lot of highlighting as most of it is defined by the superclass lexers that we import using `inherit` operation. Optional: See the [JVM lexers](https://github.com/pygments/pygments/blob/master/pygments/lexers/jvm.py) in the Pygments core to check out their implementation of the highlighting rules (encompasses most of the language except YAMTL related keywords).

For each highlighting rule, the 'regex expression' finds all instances of the pattern in the file and the 'token' is the name of one of the [Pygments builtin token functions](https://pygments.org/docs/tokens/). You can use online regex playgrounds like [regexr](https://regexr.com/) to test your regex expressions before adding them to the lexer.

The **abstract syntax** for a highlighting rule is:
`(r'<RegexExpression>', <TokenName>)`

For multiple tokens in a rule you can use:

`(r'(<RegexExpression1>)(RegexExpression2)', bygroups(<TokenName1>, <TokenName2>))`

For more information on how to develop a lexer using the Pygments API, see the [Pygments documentation](https://pygments.org/docs/lexerdevelopment).

## MkDocs Material Token Styles Cheatsheet

Note: some tokens have separate styles for light and dark themes. Alternate colors will be provided if this is the case.

| Token Name | Color | MkDocs Material Styles |
|------------|-------|------------------------|
| Text | Black/Custom White| --md-code-hl-name-color |
| Comment.Single | <span style="color:grey">Grey</span> | --md-code-hl-comment-color |
| Comment.Multiline | <span style="color:grey">Grey</span> | --md-code-hl-comment-color |
| Comment.Preproc | <span style="color:#f06090">Peach</span> | --md-code-hl-special-color |
| Keyword.Declaration | <span style="color:#6791e0">Blue</span> | --md-code-hl-keyword-color |
| Name.Class | <span style="color:#c973d9">Purple</span> | --md-code-hl-function-color |
| Name.Builtin | <span style="color:#c973d9">Purple</span> | --md-code-hl-function-color |
| Name.Entity | <span style="color:#6791e0">Blue</span> | --md-code-hl-keyword-color |
| Name.Attribute | <span style="color:grey">Grey</span> | --md-code-hl-varriable-color |
| Number.* | <span style="color:#e6695b">Orange</span> | --md-code-hl-number-color |
| String.* | <span style="color:#2fb170">Green</span> | --md-code-hl-string-color |

I have not included all the tokens here but these are the most commonly used ones with a variety of colors in MkDocs Material. The colors can also be found in the [MkDocs Material Code Blocks section](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#custom-syntax-theme). You can always use 'Inspect Element' to find the CSS token style (MkDocs Material Styles as defined above) for a particular element in the code block used in any documentation using MkDocs Material.

Refer to the MkDocs Material documentation above to see how you can update the stylesheets for the MkDocs Material project. Make sure to test this on a local version of your documentation site before deploying it to the live site (e.g. your-site.github.io).

## Package the yamtl-pygments-lexer Plugin

In order to create an executable package that works with the Pygments `pygmentize` command, you need to clone the repo, head over to the root directory and run the command: `sudo python setup.py develop`. This will create a symlink to the plugin in your system. You can then use the `pygmentize` command to highlight YAMTL files. For example, `pygmentize -l yamtl-groovy -x test_scripts/test.groovy` will highlight the input file in the terminal. Once this is successful, you can use the updated YAMTL lexer with the local MkDocs Material documentation (i.e. one that runs on localhost).

To be able to publish your changes to the live documentation site, you need to deploy this plugin to PyPI index site.

## Deploy the Plugin to PyPI

Since you created a new version of the plugin, you need to mention this in the `version` value of the `setup.py` file. Make any other updates to this file as you see fit.

Make sure you have `build` installed using `pip install --upgrade build`. Make sure the `yamtl-pygments-lexer` directory is clean of any build or distribution directories. Then run `python -m build`. Which will create a distribution wheel that you can upload to PyPI.

You need to install `twine` utility package for uploading Python packages to PyPI with ease. You can install it using `pip install twine`. Then go to your project's root directory and run `twine check` to see if the long description of the `setup.py` will be rendered properly (this description is the README.md of the Git repo where the plugin is hosted). Once that check is passed then you can run `twine upload dist/*` to upload the package to PyPI. You will need to enter your PyPI credentials to complete the upload.