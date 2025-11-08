set(EXECUTABLE_NAME "PhyGROM")

project(${EXECUTABLE_NAME} VERSION 0.1)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
qt_add_resources(QML_RESOURCES resources.qrc)

if(NOT DEFINED ICPHDR)
    file(GLOB ICPHDR ${CMAKE_CURRENT_SOURCE_DIR}/win_icp/*.h)
endif()

if(NOT DEFINED HEADERS)
    file(GLOB HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
endif()

if(NOT DEFINED SOURCES)
    file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
endif()

if(NOT DEFINED CONTROLLERHDR)
    file(GLOB CONTROLLERHDR ${CMAKE_CURRENT_SOURCE_DIR}/controllers/*.h)
endif()

if(NOT DEFINED CONTROLLERSRC)
    file(GLOB CONTROLLERSRC ${CMAKE_CURRENT_SOURCE_DIR}/controllers/*.cpp)
endif()

source_group("ICP DAS" FILES ${ICPHDR})
source_group("Header Files" FILES ${HEADERS})
source_group("Source Files" FILES ${SOURCES})
source_group("Controllers Header Files" FILES ${CONTROLLERHDR})
source_group("Controllers Source Files" FILES ${CONTROLLERSRC})

qt_add_executable(${EXECUTABLE_NAME}
${ICPHDR}
${HEADERS} ${SOURCES}
${CONTROLLERHDR} ${CONTROLLERSRC}
${QML_RESOURCES}
)

target_link_libraries(${EXECUTABLE_NAME}
    PRIVATE Qt6::Core
            Qt6::Quick
            Qt6::QuickControls2
            Qt6::SerialPort
            Qt6::Gui
)
