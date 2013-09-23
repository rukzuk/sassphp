PHP_ARG_ENABLE(sass, [whether to enable sass extension],
[  --enable-sass      Enable sass extension], yes, yes)

if test "$PHP_SASS" != "no"; then
  PHP_REQUIRE_CXX()
  PHP_SUBST(SASS_SHARED_LIBADD)
  PHP_ADD_LIBRARY(stdc++, 1, SASS_SHARED_LIBADD)

  PHP_ADD_LIBRARY_WITH_PATH(sass, lib/libexec, LIBSASS_SHARED_LIBADD)

  LDFLAGS="-lsass -L"`pwd`"/lib/libsass/"

  PHP_NEW_EXTENSION(sass, src/sass.c src/utilities.c, $ext_shared)
fi
