from setuptools import setup, find_packages

setup (
  name='yamtl-pygments-lexer',
  version='1.1',
  description='Pygments lexer for YAMTL variants.',
  long_description=open('README.md').read(),
  long_description_content_type='text/markdown',
  license='MIT',
  
  author='Abdul Nafey Mohammed',
  
  url='https://github.com/iNafey/yamtl-pygments-lexer',

  packages=find_packages(),
  entry_points =
  """
  [pygments.lexers]
  yamtlgroovy = YamtlLexer.lexer:YamtlGroovyLexer
  yamtljava = YamtlLexer.lexer:YamtlJavaLexer
  yamtlkotlin = YamtlLexer.lexer:YamtlKotlinLexer
  yamtlxtend = YamtlLexer.lexer:YamtlXtendLexer
  """,

  classifiers=[
        'Environment :: Plugins',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 3',
        'Topic :: Software Development :: Libraries :: Python Modules',
    ],
)
