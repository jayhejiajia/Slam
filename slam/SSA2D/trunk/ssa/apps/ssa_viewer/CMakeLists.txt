INCLUDE(${QT_USE_FILE})

QT4_WRAP_UI(UI_HEADERS base_main_window.ui)
QT4_WRAP_CPP(UI_SOURCES ssa_qglviewer_widget.h)

# ${QT_INCLUDE_DIR} does not appear to work; therefore have to
# manually rig it; also have to add QtCore directly because qglviewer
# doesn't seem to handle the Qt directories properly

INCLUDE_DIRECTORIES(${QGLVIEWER_INCLUDE_DIR} ${CMAKE_BINARY_DIR} ${QT_QTCORE_INCLUDE_DIR} ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR} ${QT_QTCORE_INCLUDE_DIR}/.. ${CHOLMOD_INCLUDE_DIR})

ADD_EXECUTABLE(ssa_viewer
  ssa_viewer.cpp
  ssa_qglviewer_widget.cpp
  ${UI_HEADERS}
  ${UI_SOURCES}
)

TARGET_LINK_LIBRARIES(ssa_viewer ssa_core data_association types g2o_types_slam2d g2o_core g2o_solver_cholmod g2o_solver_csparse g2o_solver_pcg ${QGLVIEWER_LIBRARY} ${QT_QTXML_LIBRARY} ${QT_QTOPENGL_LIBRARY} ${QT_QTGUI_LIBRARY} ${QT_QTCORE_LIBRARY} ${OPENGL_gl_LIBRARY} ${OPENGL_glu_LIBRARY})


INSTALL(TARGETS ssa_viewer
  RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
  LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
  ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
)
