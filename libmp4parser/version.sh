#!/bin/sh
major=0
minor=1
patch=0

libname=$1
output=version.h

LIBNAME=`echo ${libname} | tr 'a-z' 'A-Z'`
export version=${major}.${minor}.${patch}
export buildid=`git log -1 --pretty=format:"git-%cd-%h" --date=short  2>/dev/null`
autogen_version_h()
{
cat > version.h <<!
/* Automatically generated by version.sh - do not modify! */
#ifndef ${LIBNAME}_VERSION_H
#define ${LIBNAME}_VERSION_H

#define ${libname}_version ${version}
#define ${libname}_buildid ${buildid}

#endif

!
}

autogen_version_h
