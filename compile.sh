# Cross-compile in Unix (or Cygwin) to Windows 32bit/64bit

### Windows 64-bit binaries
/usr/bin/x86_64-w64-mingw32-gcc -Os -I. -DTHREADSAFE=0 -DENABLE_EXPLAIN_COMMENTS -DHAVE_ZLIB -DINTROSPECTION_PRAGMAS -DENABLE_UNKNOWN_SQL_FUNCTION -DENABLE_STMTVTAB -DENABLE_DBPAGE_VTAB -DENABLE_DBSTAT_VTAB -DENABLE_OFFSET_SQL_FUNC -DENABLE_JSON1 -DENABLE_RTREE -DENABLE_FTS4 -DENABLE_FTS5 -DENABLE_GEOPOLY shell.c sqlite3.c -lexpat -lpthread -o mingw64-x86_64/xlsxsqlite.exe
/usr/bin/x86_64-w64-mingw32-strip mingw64-x86_64/xlsxsqlite.exe
cp -u /usr/x86_64-w64-mingw32/sys-root/mingw/bin/libexpat-1.dll mingw64-x86_64/

### Windows 64-bit Little Brother extensions https://github.com/little-brother/sqlite-gui/wiki#extensions
/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/ora.c -o mingw64-x86_64/ora.dll -s -static-libgcc
/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/exec.c -o mingw64-x86_64/exec.dll -s -static-libgcc
#/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/odbc.c -o mingw64-x86_64/odbc.dll -s -static-libgcc
#/usr/bin/x86_64-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/transform.c -o mingw64-x86_64/transform.dll -s -static-libgcc
/usr/bin/x86_64-w64-mingw32-g++ -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/xml.cpp ../sqlite-gui/include/pugixml.cpp -o mingw64-x86_64/xml.dll -DPUGIXML_NO_STL -s -static

### Windows 64-bit SQLite extensions https://www.sqlite.org/src/file?name=ext/misc/
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/json1.c -o mingw64-x86_64/json1.dll -s -static-libgcc
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/regexp.c -o mingw64-x86_64/regexp.dll -s -static-libgcc
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/csv.c -o mingw64-x86_64/csv.dll -s -static-libgcc
/usr/bin/x86_64-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/series.c -o mingw64-x86_64/series.dll -s -static-libgcc

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
/usr/bin/i686-w64-mingw32-gcc -Os -I. -DTHREADSAFE=0 -DENABLE_EXPLAIN_COMMENTS -DHAVE_ZLIB -DINTROSPECTION_PRAGMAS -DENABLE_UNKNOWN_SQL_FUNCTION -DENABLE_STMTVTAB -DENABLE_DBPAGE_VTAB -DENABLE_DBSTAT_VTAB -DENABLE_OFFSET_SQL_FUNC -DENABLE_JSON1 -DENABLE_RTREE -DENABLE_FTS4 -DENABLE_FTS5 -DENABLE_GEOPOLY shell.c sqlite3.c -lexpat -lpthread -o mingw64-i686/xlsxsqlite.exe
/usr/bin/i686-w64-mingw32-strip mingw64-i686/xlsxsqlite.exe
cp -u /usr/i686-w64-mingw32/sys-root/mingw/bin/libexpat-1.dll mingw64-i686/

### Windows 32-bit Little Brother extensions
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/ora.c -o mingw64-i686/ora.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/exec.c -o mingw64-i686/exec.dll -s -static-libgcc
#/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/odbc.c -o mingw64-i686/odbc.dll -s -static-libgcc -lodbc32
#/usr/bin/i686-w64-mingw32-gcc -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/transform.c -o mingw64-i686/transform.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-g++ -Os -I ../sqlite-gui/include -shared ../sqlite-gui/extensions/xml.cpp ../sqlite-gui/include/pugixml.cpp -o mingw64-i686/xml.dll -DPUGIXML_NO_STL -s -static

### Windows 32-bit SQLite extensions
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/json1.c -o mingw64-i686/json1.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/regexp.c -o mingw64-i686/regexp.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/csv.c -o mingw64-i686/csv.dll -s -static-libgcc
/usr/bin/i686-w64-mingw32-gcc -Os -I . -shared ../sqlite/ext/misc/series.c -o mingw64-i686/series.dll -s -static-libgcc

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
