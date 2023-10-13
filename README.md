# YAMTL Plugin for Pygments
[Pygments](https://pygments.org/) lexer support for YAMTL variants (ready to use with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/)). YAMTL is a model transformation language. To learn more about YAMTL, head over to the [official documentation](https://yamtl.github.io/).

## Installation

If you want to install it from PyPI:
```
pip install yamtl-pygments-lexer
```

**OR**

If you want to run the latest package via GitHub:
```
git clone https://github.com/iNafey/yamtl-pygments-lexer.git
cd yamtl-pygments-lexer
sudo python setup.py install
```
Please note: the site-packages/easy-install.pth file (generated by the above command) needs to not include a relative path but a full path to the egg file. You could also replace the last line for (``sudo python setup.py develop``) if you will make changes to the code.


## Usage

To use any of the YAMTL lexers, you need to have Pygments installed (so you can use the ``pygmentize`` command). Then, you can perform syntax highlighting using the following command:

```
 pygmentize -l <LexerAlias> -x <RelativePathToFile>
```

Where ``LexerAlias`` is the alias of the lexer you want to use (e.g. ``yamtl-groovy`` for Groovy-variant of YAMTL) and ``RelativePathToFile`` is the relative path to the file you want to highlight.

For example, if you want to highlight the file ``test.groovy`` using the Groovy-flavoured YAMTL lexer, you would use:

```
 pygmentize -l yamtl-groovy -x test_scripts/test.groovy
```

### MkDocs Material Support

If you want to use the lexers with MkDocs Material, simply call the ``LexerAlias`` in the code blocks of your Markdown files. For example, if you want to highlight a Groovy code block using the Yamtl-Groovy lexer, you would use:

```
    ``` yamtl-groovy
        //MT definition containing rules
    ```
```

## Color Customization

You can select from various pygments [styles](https://pygments.org/styles/) already available for highlighting within the terminal:

```
 pygmentize -O <StyleName>  -l <LexerAlias> -x <RelativePathToFile>
```

Where ``StyleName`` is the name of the style you want to use (e.g. ``monokai``). The default style is ``default``.

To change the style for MkDocs Material, you will need to find the token types of the keywords you want to highlight (Inspect Element via your browser). Then, follow the instructions [here](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/#custom-syntax-theme) to add the custom style to your documentation site.


## Available YAMTL lexers based on JVM languages

* Groovy variant : ``yamtl-groovy``
* Xtend variant: ``yamtl-xtend``
* Java variant: ``yamtl-java``
* Kotlin variant: ``yamtl-kotlin``
