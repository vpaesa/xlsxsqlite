# Cross-compile in Unix (or Cygwin) to Windows 32bit/64bit

### Windows 64-bit binaries
# -DSQLITE_HAVE_ZLIB conflicts with minizip.c
/usr/bin/x86_64-w64-mingw32-gcc -Os -I. -DSQLITE_THREADSAFE=0 -DSQLITE_ENABLE_EXPLAIN_COMMENTS -DSQLITE_INTROSPECTION_PRAGMAS -DSQLITE_ENABLE_UNKNOWN_SQL_FUNCTION -DSQLITE_ENABLE_STMTVTAB -DSQLITE_ENABLE_DBPAGE_VTAB -DSQLITE_ENABLE_DBSTAT_VTAB -DSQLITE_ENABLE_OFFSET_SQL_FUNC -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS5 -DSQLITE_ENABLE_GEOPOLY shell.c sqlite3.c -lexpat -ldl -lpthread -o mingw64-x86_64/xlsxsqlite.exe
/usr/bin/x86_64-w64-mingw32-strip mingw64-x86_64/xlsxsqlite.exe
cp -u /usr/x86_64-w64-mingw32/sys-root/mingw/bin/libexpat-1.dll mingw64-x86_64/

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
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/zipfile.c -o mingw64-x86_64/zipfile.dll -lz -s -static-libgcc
cp -u /usr/x86_64-w64-mingw32/sys-root/mingw/bin/zlib1.dll mingw64-x86_64/

### Windows 64-bit Keith Medcalf extensions http://www.dessus.com/files/sqlite3extensions.zip
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../KeithMedcalf/vsv.c -o mingw64-x86_64/vsv.dll -s -static-libgcc

### Windows 64-bit jakethaw extensions https://github.com/jakethaw/pivot_vtab
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../pivot_vtab/pivot_vtab.c -o mingw64-x86_64/pivot_vtab.dll -s -static-libgcc

### Windows 64-bit David Jones xlsxvtab extension https://sourceforge.net/projects/vms-ports/files/SQLITE3/excel_convert_003c.zip/download
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../xlsxvtab/{xlsxvtab.c,xlsxmap.c,excel_scan.c,excel_misc.c,zipscan.c,xml_parse_expat.c,xml_parse_minmem.c,xlsxmap.h,xml_parse.h} -o mingw64-x86_64/xlsxvtab.dll -DOMIT_BZIP -lz -lexpat -D'sysconf(a)=4096' -ldl -s -static-libgcc
cp -u /usr/x86_64-w64-mingw32/sys-root/mingw/bin/zlib1.dll mingw64-x86_64/
cp -u /usr/x86_64-w64-mingw32/sys-root/mingw/bin/libdl.dll mingw64-x86_64/

########################################

### Windows 32-bit binaries
# -DSQLITE_HAVE_ZLIB conflicts with minizip.c
/usr/bin/i686-w64-mingw32-gcc -Os -I. -DSQLITE_THREADSAFE=0 -DSQLITE_ENABLE_EXPLAIN_COMMENTS -DSQLITE_INTROSPECTION_PRAGMAS -DSQLITE_ENABLE_UNKNOWN_SQL_FUNCTION -DSQLITE_ENABLE_STMTVTAB -DSQLITE_ENABLE_DBPAGE_VTAB -DSQLITE_ENABLE_DBSTAT_VTAB -DSQLITE_ENABLE_OFFSET_SQL_FUNC -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_FTS5 -DSQLITE_ENABLE_GEOPOLY shell.c sqlite3.c -lexpat -ldl -lpthread -o mingw64-i686/xlsxsqlite.exe
/usr/bin/i686-w64-mingw32-strip mingw64-i686/xlsxsqlite.exe
cp -u /usr/i686-w64-mingw32/sys-root/mingw/bin/libexpat-1.dll mingw64-i686/

### Windows 32-bit Little Brother extensions
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/ora.c -o mingw64-i686/ora.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/exec.c -o mingw64-i686/exec.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/odbc.c -o mingw64-i686/odbc.dll -lodbc32 -s -static-libgcc -lodbc32
#/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/transform.c -o mingw64-i686/transform.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-g++ -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/xml.cpp ../sqlite-gui/include/pugixml.cpp -o mingw64-i686/xml.dll -DPUGIXML_NO_STL -s -static

/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/test.c -o mingw64-i686/test.dll -s -static-libgcc

# vorchunpaul https://github.com/sqlitebrowser/sqlitebrowser/issues/2795
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/util.c -o mingw64-i686/util.dll -s -static-libgcc

### Windows 32-bit SQLite misc extensions
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/csv.c -o mingw64-i686/csv.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/zipfile.c -o mingw64-i686/zipfile.dll -lz -s -static-libgcc
cp -u /usr/i686-w64-mingw32/sys-root/mingw/bin/zlib1.dll mingw64-i686/

### Windows 32-bit Keith Medcalf extensions http://www.dessus.com/files/sqlite3extensions.zip
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../KeithMedcalf/vsv.c -o mingw64-i686/vsv.dll -s -static-libgcc

### Windows 64-bit jakethaw extensions https://github.com/jakethaw/pivot_vtab
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../pivot_vtab/pivot_vtab.c -o mingw64-i686/pivot_vtab.dll -s -static-libgcc

### Windows 32-bit David Jones xlsxvtab extension https://sourceforge.net/projects/vms-ports/files/SQLITE3/excel_convert_003c.zip/download
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../xlsxvtab/{xlsxvtab.c,xlsxmap.c,excel_scan.c,excel_misc.c,zipscan.c,xml_parse_expat.c,xml_parse_minmem.c,xlsxmap.h,xml_parse.h} -o mingw64-i686/xlsxvtab.dll -DOMIT_BZIP -lz -lexpat -D'sysconf(a)=4096' -ldl -s -static-libgcc
cp -u /usr/i686-w64-mingw32/sys-root/mingw/bin/zlib1.dll mingw64-i686/
cp -u /usr/i686-w64-mingw32/sys-root/mingw/bin/libdl.dll mingw64-i686/

############################
# More SQLite extensions, not compiled:
# https://github.com/abetlen/sqlite3-bfsvtab-ext
# https://github.com/mlin/sqlite_zstd_vfs/
# https://github.com/mlin/sqlite_web_vfs
# https://github.com/igorski89/SQLiteFuzzySearch
# https://github.com/jhowie/sqlite3-ext
# https://gitlab.com/liamh/extension-functions.git
# https://github.com/SeanTater/sqlite3-extras
# https://github.com/schiffma/distlib
# https://github.com/schiffma/permutations
# https://github.com/0x09/sqlite-statement-vtab