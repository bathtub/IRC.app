#!/bin/sh

cd "${PROJECT_DIR}/Resources/"

bundleVersion=$(/usr/libexec/PlistBuddy -c "Print \"CFBundleShortVersionString\"" Info.plist)

gitBundle=`which git`
gitDescribe=`${gitBundle} describe --long`
gitRefInfo=$(echo $gitDescribe | grep -oE "([0-9]{1,3})\-([a-zA-Z0-9]{8})")
gitCommitCount=`${gitBundle} rev-list HEAD --count`

buildRef="${bundleVersion}-${gitRefInfo}-${IRC_GITREF_BUILD_ID}"

echo "Building IRC (Build Reference: ${gitRefInfo})"

bundleIdentifier=$(/usr/libexec/PlistBuddy -c "Print \"CFBundleIdentifier\"" Info.plist)

test "${bundleIdentifier}" != "${IRC_BUNDLE_ID}" && \
	/usr/libexec/PlistBuddy -c "Set :\"CFBundleIdentifier\" ${IRC_BUNDLE_ID}" Info.plist

mkdir -p "${PROJECT_DIR}/.tmp/"

cd "${PROJECT_DIR}/.tmp/"

echo "/* ANY CHANGES TO THIS FILE WILL NOT BE SAVED AND WILL NOT BE COMMITTED */" > BuildConfig.h
echo "" >> BuildConfig.h
echo "#define TXBundleCommitCount		@\"${gitCommitCount}\"" >> BuildConfig.h

if [ -n "$CODE_SIGN_IDENTITY" ]; then
echo "#define TXBundleBuildReference	@\"${buildRef}\"" >> BuildConfig.h
else
echo "#define TXBundleBuildReference	@\"${buildRef},nocdsign\"" >> BuildConfig.h
echo "#define TXBundleBuiltWithoutCodeSigning                   1" >> BuildConfig.h
fi

echo "                                                                                        "
echo " /!\ ***************************************************************************** /!\  "
echo "                  WARNING: BUILDING UNSTABLE & UNSUPPORTED SOFTWARE.                    "
echo " /!\ ***************************************************************************** /!\  "
echo "                                                                                        "
echo "   You are building a custom copy of IRC. Custom copies are not supported by        "
echo "   Codeux Software or any members of the #irc IRC channel community. It is not      "
echo "   recommended to build your own copy of IRC unless absolutely necessary.           "
echo "                                                                                        "
echo "   IRC is open source for various reasons, but we do not encourage many users       "
echo "   to actually build and run it on their own. The source code, unless in the Mac        "
echo "   App Store, is considered in a constant state of instability so use of it can         "
echo "   lead to undefined behavior.                                                          "
echo "                                                                                        "
echo "   It is highly recommended that you use the Mac App Store version of IRC.          "
echo "   The only reason you should be building it on your own is if you were asked to        "
echo "   by one of the developers to test a fix specific to you. Wait for the official        "
echo "   update or at least the one posted to our mailing list.                               "
echo "                                                                                        "
echo " /!\ ***************************************************************************** /!\  "
echo "                                                                                        "
