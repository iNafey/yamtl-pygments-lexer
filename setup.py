from setuptools import setup, find_packages

setup (
  name='yamtl-pygments-lexer',
  packages=find_packages(),
  entry_points =
  """
  [pygments.lexers]
  yamtlgroovy = YamtlLexer.lexer:YamtlGroovyLexer
  yamtljava = YamtlLexer.lexer:YamtlJavaLexer
  yamtlkotlin = YamtlLexer.lexer:YamtlKotlinLexer
  yamtlxtend = YamtlLexer.lexer:YamtlXtendLexer
  """,
)
