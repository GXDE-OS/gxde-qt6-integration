#-------------------------------------------------
#
# Project created by QtCreator 2016-10-18T17:21:21
#
#-------------------------------------------------

QT        += core gui widgets widgets-private core-private gui-private
CONFIG    += link_pkgconfig c++11
# Qt6 build links the Qt6-built dtk2widget (libdtk2widget.so.2),
# NOT the system Qt5 dtkwidget. The pkg-config name is dtk2widget.
PKGCONFIG += dtk2widget

TARGET = dstyleplugin-gxde-qt6
TEMPLATE = lib
CONFIG += plugin

SOURCES += dstyleplugin.cpp \
    style.cpp \
    sliderhelper.cpp \
    colorutils.cpp \
    geometryutils.cpp \
    paletteextended.cpp \
    pushbuttonhelper.cpp \
    framehelper.cpp \
    lineedithelper.cpp \
    commonhelper.cpp \
    scrollbarhelper.cpp \
    painterhelper.cpp \
    menuhelper.cpp \
    dstyleanimation.cpp \
    progressbarhelper.cpp \
    checkboxhelper.cpp \
    rubberbandhelper.cpp \
    headerviewhelper.cpp \
    comboboxhelper.cpp \
    toolbuttonhelper.cpp \
    tabwidgethelper.cpp \
    spinboxhelper.cpp \
    hidpihelper.cpp \
    tabbarhelper.cpp

HEADERS += dstyleplugin.h \
    style.h \
    common.h \
    colorutils.h \
    geometryutils.h \
    paletteextended.h \
    commonhelper.h \
    painterhelper.h \
    dstyleanimation.h \
    hidpihelper.h

DISTFILES += dstyleplugin.json

DESTDIR = $$_PRO_FILE_PWD_/../bin/plugins/styles/

unix {
    # Standard Qt6 styles plugin dir. Safe to share with chameleon because:
    #  - Our keys are dlight2 / ddark2 / dsemilight2 / dsemidark2 (no chameleon claim)
    #  - chameleon's key is "chameleon"
    # Qt's style factory only loads our plugin when something explicitly
    # asks for one of our keys.
    target.path = $$[QT_INSTALL_PLUGINS]/styles/
    INSTALLS += target
}

RESOURCES += \
    brushchemes.qrc \
    assets_light.qrc \
    assets_dark.qrc \
    assets_semidark.qrc \
    assets_semilight.qrc \
    assets.qrc

load(configure)
qtCompileTest(dtkwidget) {
    DEFINES += DTK_SUPPORT_BLUR_WINDOW
    message(The libdtkwidget support blur window)
} else {
    warning(The libdtkwidget can not support blur window)
}
