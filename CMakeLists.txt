cmake_minimum_required(VERSION 3.16)

project(ChatApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/Components")
set(QML_IMPORT_PATH ${QML_DIRS} CACHE STRING "Addons" FORCE)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Network)

qt_standard_project_setup()

qt_add_executable(appChatApp
    main.cpp
    Assets.qrc
    Controlles/database.h
    Controlles/database.cpp
)

qt_add_qml_module(appChatApp
    URI ChatApp
    VERSION 1.0
    QML_FILES Main.qml
)

set_target_properties(appChatApp PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appChatApp
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Network
)

install(TARGETS appChatApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
