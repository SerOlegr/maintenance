#####################################################################
# This function will create version string for about window and
# DMG file.
#####################################################################

function create_version_string() {
    # Create version string.
    log "Creating version string for about dialog..."
    # Snapshotted thing already have everything for version string.
    PSI_BUILD=`cd "${PSI_SOURCE_DIR}/admin" && ./git_revnumber.sh`
    PSI_REVISION=`cd "${PSI_SOURCE_DIR}" && git rev-parse --short HEAD`
    PSI_PLUS_REVISION=`cd "${PSI_DIR}/plus" && git rev-parse --short HEAD`
    VERSION_STRING_RAW="${PSI_VERSION}.${PSI_BUILD}"

    VERSION_STRING="${VERSION_STRING_RAW} ($(date +"%Y-%m-%d"), Psi:${PSI_REVISION}, Psi+:${PSI_PLUS_REVISION}"
    if [ "${ENABLE_WEBENGINE}" -eq "1" ]; then
        VERSION_STRING="${VERSION_STRING}, webengine)"
    else
        VERSION_STRING="${VERSION_STRING})"
    fi

    # Add qt5 note to VERSION_STRING_RAW as we support only it on macs.
    # Should be removed at version 2.0 :).
    # Also add note about webengine usage.
    if [ "${ENABLE_WEBENGINE}" -eq "1" ]; then
        VERSION_STRING_RAW="${VERSION_STRING_RAW}-qt5-webengine"
    else
        VERSION_STRING_RAW="${VERSION_STRING_RAW}-qt5"
    fi

    log "Version string: ${VERSION_STRING}"
    log "Raw version string (will be used e.g. in filename): ${VERSION_STRING_RAW}"

    # Just a build date.
    BUILD_DATE=`date +'%Y-%m-%d'`
}
