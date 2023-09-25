# Cross-compile in Unix (or Cygwin) to Windows 32bit/64bit

### Windows 64-bit binaries
/usr/bin/x86_64-w64-mingw32-gcc -Os -I. -DSQLITE_THREADSAFE=0 -DSQLITE_ENABLE_EXPLAIN_COMMENTS -DSQLITE_HAVE_ZLIB -DSQLITE_INTROSPECTION_PRAGMAS -DSQLITE_ENABLE_UNKNOWN_SQL_FUNCTION -DSQLITE_ENABLE_STMTVTAB -DSQLITE_ENABLE_DBPAGE_VTAB -DSQLITE_ENABLE_DBSTAT_VTAB -DSQLITE_ENABLE_OFFSET_SQL_FUNC -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS5 -DSQLITE_ENABLE_GEOPOLY shell.c sqlite3.c -lexpat -ldl -lpthread -lz -o mingw64-x86_64/xlsxsqlite.exe
/usr/bin/x86_64-w64-mingw32-strip mingw64-x86_64/xlsxsqlite.exe
cp -u /usr/x86_64-w64-mingw32/sys-root/mingw/bin/libexpat-1.dll mingw64-x86_64/
cp -u /usr/x86_64-w64-mingw32/sys-root/mingw/bin/zlib1.dll mingw64-x86_64/

### Windows 64-bit Little Brother extensions https://github.com/little-brother/sqlite-gui/wiki#extensions
/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/ora.c -o mingw64-x86_64/ora.dll -s -static-libgcc
/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/exec.c -o mingw64-x86_64/exec.dll -s -static-libgcc
/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/odbc.c -o mingw64-x86_64/odbc.dll -lodbc32 -s -static-libgcc
#/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/transform.c -o mingw64-x86_64/transform.dll -s -static-libgcc
/usr/bin/x86_64-w64-mingw32-g++ -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/xml.cpp ../sqlite-gui/include/pugixml.cpp -o mingw64-x86_64/xml.dll -DPUGIXML_NO_STL -s -static
/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/test.c -o mingw64-x86_64/test.dll -s -static-libgcc

# vorchunpaul https://github.com/sqlitebrowser/sqlitebrowser/issues/2795
/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/util.c -o mingw64-x86_64/util.dll -s -static-libgcc

### Windows 64-bit SQLite misc extensions https://www.sqlite.org/src/file?name=ext/misc/
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/csv.c -o mingw64-x86_64/csv.dll -s -static-libgcc

### Windows 64-bit Keith Medcalf extensions http://www.dessus.com/files/sqlite3extensions.zip
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../KeithMedcalf/vsv.c -o mingw64-x86_64/vsv.dll -s -static-libgcc

### Windows 64-bit jakethaw extensions https://github.com/jakethaw/pivot_vtab
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../pivot_vtab/pivot_vtab.c -o mingw64-x86_64/pivot_vtab.dll -s -static-libgcc

### Windows 64-bit David Jones xlsxvtab extension https://sourceforge.net/projects/vms-ports/files/SQLITE3/excel_convert_003c.zip/download
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../xlsxvtab/{xlsxvtab.c,xlsxmap.c,excel_scan.c,excel_misc.c,zipscan.c,xml_parse_expat.c,xml_parse_minmem.c,xlsxmap.h,xml_parse.h} -o mingw64-x86_64/xlsxvtab.dll -DOMIT_BZIP -lz -lexpat -D'sysconf(a)=4096' -ldl -s -static-libgcc
cp -u /usr/x86_64-w64-mingw32/sys-root/mingw/bin/zlib1.dll mingw64-x86_64/
cp -u /usr/x86_64-w64-mingw32/sys-root/mingw/bin/libdl.dll mingw64-x86_64/

### Windows 64-bit Christian Werner extensions https://github.com/softace/sqliteodbc
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../sqliteodbc/impexp.c -o mingw64-x86_64/impexp.dll -s -static-libgcc -lcomdlg32
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../sqliteodbc/blobtoxy.c -o mingw64-x86_64/blobtoxy.dll -s -static-libgcc
# /usr/bin/x86_64-w64-mingw32-gcc -Os -I . -I ../tcc/ -shared ../sqliteodbc/sqlite+tcc.c -o mingw64-x86_64/sqlite+tcc.dll -s -static-libgcc ../tcc/lib/libtcc1-64.a
# http://download.savannah.nongnu.org/releases/tinycc/
# cp -u  ../tcc-0.9.27-win64/libtcc.dll mingw64-x86_64/
# cp -ur ../tcc-0.9.27-win64/include/tcc/ mingw64-x86_64/
# cp -ur ../tcc-0.9.27-win64/{lib,libtcc}/ mingw64-x86_64/
/usr/bin/x86_64-w64-mingw32-gcc -Os -I/usr/x86_64-w64-mingw32/sys-root/mingw/include/libxml2 -I . -shared ../sqliteodbc/xpath.c -o mingw64-x86_64/xpath.dll -lxml2 -lxslt -s -static-libgcc

### Windows 64 Alex García https://github.com/asg017/sqlite-lines
cd ../sqlite-lines/
COMMIT=$(shell git rev-parse HEAD)
VERSION=$(shell cat VERSION)
DATE=$(shell date +'%FT%TZ%z')
cd -
DEFINE_SQLITE_LINES_DATE=-DSQLITE_LINES_DATE="\"$(DATE)\""
DEFINE_SQLITE_LINES_VERSION=-DSQLITE_LINES_VERSION="\"$(VERSION)\""
DEFINE_SQLITE_LINES_SOURCE=-DSQLITE_LINES_SOURCE="\"$(COMMIT)\""
DEFINE_SQLITE_LINES=$(DEFINE_SQLITE_LINES_DATE) $(DEFINE_SQLITE_LINES_VERSION) $(DEFINE_SQLITE_LINES_SOURCE)
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -I ../sqlite-lines/ -shared ../sqlite-lines/sqlite-lines.c -o mingw64-x86_64/sqlite-lines.dll -s -static-libgcc

########################################

### Windows 32-bit binaries
/usr/bin/i686-w64-mingw32-gcc -Os -I. -DSQLITE_THREADSAFE=0 -DSQLITE_ENABLE_EXPLAIN_COMMENTS -DSQLITE_HAVE_ZLIB -DSQLITE_INTROSPECTION_PRAGMAS -DSQLITE_ENABLE_UNKNOWN_SQL_FUNCTION -DSQLITE_ENABLE_STMTVTAB -DSQLITE_ENABLE_DBPAGE_VTAB -DSQLITE_ENABLE_DBSTAT_VTAB -DSQLITE_ENABLE_OFFSET_SQL_FUNC -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS5 -DSQLITE_ENABLE_GEOPOLY shell.c sqlite3.c -lexpat -ldl -lpthread -lz -o mingw64-i686/xlsxsqlite.exe
/usr/bin/i686-w64-mingw32-strip mingw64-i686/xlsxsqlite.exe
cp -u /usr/i686-w64-mingw32/sys-root/mingw/bin/libexpat-1.dll mingw64-i686/
cp -u /usr/i686-w64-mingw32/sys-root/mingw/bin/zlib1.dll mingw64-i686/

### Windows 32-bit Little Brother extensions https://github.com/little-brother/sqlite-gui/wiki#extensions
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/ora.c -o mingw64-i686/ora.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/exec.c -o mingw64-i686/exec.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/odbc.c -o mingw64-i686/odbc.dll -lodbc32 -s -static-libgcc -lodbc32
#/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/transform.c -o mingw64-i686/transform.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-g++ -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/xml.cpp ../sqlite-gui/include/pugixml.cpp -o mingw64-i686/xml.dll -DPUGIXML_NO_STL -s -static

/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/test.c -o mingw64-i686/test.dll -s -static-libgcc

# vorchunpaul (PublicDomain) https://github.com/sqlitebrowser/sqlitebrowser/issues/2795
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/util.c -o mingw64-i686/util.dll -s -static-libgcc

### Windows 32-bit SQLite misc extensions (PublicDomain) https://www.sqlite.org/src/file?name=ext/misc/
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/csv.c -o mingw64-i686/csv.dll -s -static-libgcc

### Windows 32-bit Keith Medcalf extensions (PublicDomain) http://www.dessus.com/files/sqlite3extensions.zip
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../KeithMedcalf/vsv.c -o mingw64-i686/vsv.dll -s -static-libgcc

### Windows 64-bit jakethaw extensions (MIT) https://github.com/jakethaw/pivot_vtab
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../pivot_vtab/pivot_vtab.c -o mingw64-i686/pivot_vtab.dll -s -static-libgcc

### Windows 32-bit David Jones xlsxvtab extension (PublicDomain) https://sourceforge.net/projects/vms-ports/files/SQLITE3/excel_convert_003c.zip/download
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../xlsxvtab/{xlsxvtab.c,xlsxmap.c,excel_scan.c,excel_misc.c,zipscan.c,xml_parse_expat.c,xml_parse_minmem.c,xlsxmap.h,xml_parse.h} -o mingw64-i686/xlsxvtab.dll -DOMIT_BZIP -lz -lexpat -D'sysconf(a)=4096' -ldl -s -static-libgcc
cp -u /usr/i686-w64-mingw32/sys-root/mingw/bin/zlib1.dll mingw64-i686/
cp -u /usr/i686-w64-mingw32/sys-root/mingw/bin/libdl.dll mingw64-i686/

############################
# More SQLite extensions, not compiled:
# https://github.com/abetlen/sqlite3-bfsvtab-ext   PublicDomain (Breadth-first search queries against graphs)
# https://github.com/mlin/sqlite_zstd_vfs          Apache2 (VFS Read & Write Zstandard compressed storage)
# https://github.com/mlin/sqlite_zstd_rovfs        Apache2 (VFS Read Only Zstandard compressed storage)
# https://github.com/mlin/sqlite_web_vfs           Apache2 (VFS Read Only from HTTP(S) URLs)
# https://github.com/mlin/GenomicSQLite            Apache2 (Genomic functions)
# https://github.com/igorski89/SQLiteFuzzySearch   PublicDomain (approximate string searching functions)
# https://github.com/jhowie/sqlite3-ext            BSD3 (environment variables functions)
# https://gitlab.com/liamh/extension-functions     PublicDomain (string, statistics functions)
# https://github.com/SeanTater/sqlite3-extras      MIT (Regular Expressions and Scalar/Vector Math)
# https://github.com/schiffma/distlib              MIT (String distance functions)
# https://github.com/schiffma/permutations         PublicDomain (String permutation table-valued function)
# https://github.com/0x09/sqlite-statement-vtab    PublicDomain (define virtual tables and table-valued functions natively using SQL)
# https://github.com/jakethaw/xlsx_vtab            MIT (read xlsx as virtual table)
# https://github.com/jakethaw/xml_to_json          MIT (convert XML to JSON)
# https://github.com/jakethaw/replace_agg          MIT (replace aggregate function)
# https://github.com/softace/sqliteodbc            PublicDomain (blobtoxy, impexp, sqlite+tcc, xpath)