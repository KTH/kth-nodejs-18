#!/bin/bash

info() { printf "\033[1;31m\n   %s\033[0;33m$@\033[0;0m\n\n";  }
error() { printf "\033[1;31m • $@\033[0;0m\n"; }
passed() { printf "\033[0;32m • $@\033[0;0m\n"; }

FAILED=""

#
# /KTH_NODEJS should contain a pattern or show infor
#
# Usage: expectFileToContain "Build date" "No build date pressent in /KTH_NODEJS"
#
expectFileToContain() {
    FILE=$(cat /$1)
    PATTERN="$2"
    FAILURE_INFO="$3"
    
    if [[ "$FILE" == *"$PATTERN"* ]]; then
        if [ ! -z "$FAILURE_INFO" ]; then
            passed "$FAILURE_INFO"
        else 
            passed "/KTH_NODEJS contains $PATTERN"
        fi
 
    else
        if [ ! -z "$FAILURE_INFO" ]; then
            error "$FAILURE_INFO"
        fi
        info "/KTH_NODEJS does not contain pattern '$PATTERN'."
        
        FAILED="true"
    fi

}

#
# Usage: expectCommandToContain "node --version" "16" "Node should be version 16"
#
expectCommandToContain() {
    CMD="$1"
    PATTERN="$2"
    FAILURE_INFO="$3"
    OUTPUT=`$CMD`
    
    if [[ "$OUTPUT" == *"$PATTERN"* ]]; then
        if [ ! -z "$FAILURE_INFO" ]; then
            passed "$FAILURE_INFO"
        else 
            passed "'$CMD' contains '$PATTERN'"
        fi
 
    else
        if [ ! -z "$FAILURE_INFO" ]; then
            error "$FAILURE_INFO"
        fi
        info "'$CMD' did not contain pattern '$PATTERN'."
        
        FAILED="true"
    fi

}

# ---------------- Tests ----------------

echo ""
echo "OS"
expectFileToContain "/KTH_OS" "Build date:" "/KTH_OS should contain the date when the images was built."
expectFileToContain "/KTH_OS" "Alpine version: 3" "/KTH_OS should contain the Alpine version."

echo ""
echo "Packages"
expectCommandToContain "curl --version" "curl 7" "Image should have cURL 7.* installed as a package."

echo ""
echo "Node JS"
expectFileToContain "/KTH_NODEJS" "Build date:" "/KTH_NODEJS should contain the date when the images was built."
expectFileToContain "/KTH_NODEJS" "Node: v18" "Image should have Node v18* installed."
expectFileToContain "/KTH_NODEJS" 'NPM: 9.' "Image should have 'npm 9.*.*' installed."
expectFileToContain "/KTH_NODEJS" "Yarn: 1." "Image should have 'Yarn 1.*.*' installed."
expectFileToContain "/KTH_NODEJS" "merge-descriptors@" "Image should have global package 'merge-descriptors' installed."

# Result
if [[ "$FAILED" != *"true"* ]]; then
    info "🎉 All unit tests passed."
    exit 0
else
    echo ""
    exit 1
fi







