# (c) David Cunningham 2011, Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php

COMPILING=echo "Compiling: [32m$<[0m"
LINKING=echo "Linking: [1;32m$@[0m"

%.o: ../src/win32/%.c++
	@$(COMPILING)
	@$(COMPILER) -c $< -o $@ $(CFLAGS)

%.o: ../src/linux/%.c++
	@$(COMPILING)
	@$(COMPILER) -c $< -o $@ $(CFLAGS)

%.o: ../src/%.c++
	@$(COMPILING)
	@$(COMPILER) -c $< -o $@ $(CFLAGS)

%.o: ../src/gfx/%.c++
	@$(COMPILING)
	@$(COMPILER) -c $< -o $@ $(CFLAGS)

%.o: ../src/physics/%.c++
	@$(COMPILING)
	@$(COMPILER) -c $< -o $@ $(CFLAGS)

QUEX_PATH2 = ../$(QUEX_PATH)
../src/physics/TColLexer: ../src/physics/TColLexer.qx
	cd ../src/physics && QUEX_PATH=$(QUEX_PATH2) $(QUEX_PATH2)/quex-exe.py -i TColLexer.qx --engine TColLexer

%.o: ../src/physics/%.cpp
	@$(COMPILING)
	@$(WEAKCOMPILER) -c $< -o $@ $(CFLAGS)



COMMON_OBJ=\
        BackgroundLoader.o \
        BulletDebugDrawer.o \
        Clutter.o \
        CollisionMesh.o \
        CentralisedLog.o \
        ExternalTable.o \
        GfxDiskResource.o \
        gfx.o \
        GritClass.o \
        GritObject.o \
        Streamer.o \
        HUD.o \
        ldbglue.o \
        lua_util.o \
        lua_wrappers_core.o \
        lua_wrappers_gfx.o \
        lua_wrappers_gpuprog.o \
        lua_wrappers_gritobj.o \
        lua_wrappers_hud.o \
        lua_wrappers_material.o \
        lua_wrappers_mesh.o \
        lua_wrappers_mobj.o \
        lua_wrappers_physics.o \
        lua_wrappers_primitives.o \
        lua_wrappers_render.o \
        lua_wrappers_scnmgr.o \
        lua_wrappers_tex.o \
        lua_utf8.o \
        main.o \
        path_util.o \
        PhysicsWorld.o \
        ray.o \
        TColLexer.o \
        TColLexer-core-engine.o \
        TColParser.o \
        TextListOverlayElement.o \
        unicode_util.o \

LINUX_OBJ=$(COMMON_OBJ) MouseX11.o KeyboardX11.o posix_sleep.o x11_clipboard.o
WIN32_OBJ=$(COMMON_OBJ) MouseDirectInput8.o KeyboardDirectInput8.o KeyboardWinAPI.o win32_clipboard.o win32_sleep.o

grit.x11: $(LINUX_OBJ) $(DEPENDENT_LIBS)
	@$(LINKING)
	@$(COMPILER) $(LINUX_OBJ) -o $@ $(LDFLAGS)

grit.exe: $(WIN32_OBJ) $(DEPENDENT_LIBS)
	@$(LINKING)
	@$(COMPILER) $(WIN32_OBJ) -o $@ $(LDFLAGS)

clean:
	rm -fv $(TARGETS) *.o




# DO NOT DELETE

BackgroundLoader.o: ../src/sleep.h ../src/BackgroundLoader.h
BackgroundLoader.o: ../depend_stubs/vector ../src/vect_util.h
BackgroundLoader.o: ../depend_stubs/algorithm ../src/CentralisedLog.h
BackgroundLoader.o: ../depend_stubs/iostream ../depend_stubs/sstream
BackgroundLoader.o: ../src/console_colour.h ../depend_stubs/list
BackgroundLoader.o: ../depend_stubs/boost/thread/thread.hpp
BackgroundLoader.o: ../depend_stubs/boost/thread/condition.hpp
BackgroundLoader.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
BackgroundLoader.o: ../src/gfx/GfxDiskResource.h
BackgroundLoader.o: ../depend_stubs/OgreResource.h
BackgroundLoader.o: ../src/CentralisedLog.h ../src/BackgroundLoader.h
BackgroundLoader.o: ../src/main.h ../depend_stubs/lua.h ../src/Mouse.h
BackgroundLoader.o: ../src/Keyboard.h ../depend_stubs/string
BackgroundLoader.o: ../src/BulletDebugDrawer.h
BackgroundLoader.o: ../depend_stubs/OgreFrameListener.h
BackgroundLoader.o: ../depend_stubs/OgreManualObject.h
BackgroundLoader.o: ../depend_stubs/btBulletCollisionCommon.h
BackgroundLoader.o: ../src/gfx/lua_userdata_dependency_tracker.h
BackgroundLoader.o: ../depend_stubs/OgreStaticGeometry.h
BackgroundLoader.o: ../depend_stubs/OgreInstancedGeometry.h
BackgroundLoader.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
BackgroundLoader.o: ../depend_stubs/OgreMovableObject.h
BackgroundLoader.o: ../depend_stubs/OgreVertexIndexData.h
BackgroundLoader.o: ../depend_stubs/OgreMaterial.h
BackgroundLoader.o: ../depend_stubs/OgreMesh.h ../src/math_util.h
BackgroundLoader.o: ../depend_stubs/cmath
BackgroundLoader.o: ../src/CacheFriendlyRangeSpaceSIMD.h
BackgroundLoader.o: ../depend_stubs/map ../src/SSEAllocator.h
BackgroundLoader.o: ../src/Streamer.h ../depend_stubs/lauxlib.h
BackgroundLoader.o: ../depend_stubs/lualib.h ../src/GritClass.h
BackgroundLoader.o: ../src/ExternalTable.h ../src/math_util.h
BackgroundLoader.o: ../src/SharedPtr.h ../depend_stubs/cstdlib
BackgroundLoader.o: ../depend_stubs/functional ../src/LuaPtr.h
BackgroundLoader.o: ../src/SplineTable.h ../src/lua_util.h
BackgroundLoader.o: ../depend_stubs/limits ../src/GritObject.h
BackgroundLoader.o: ../depend_stubs/set ../src/Streamer.h
BackgroundLoader.o: ../src/CacheFriendlyRangeSpaceSIMD.h
BackgroundLoader.o: ../src/gfx/HUD.h ../depend_stubs/climits
BackgroundLoader.o: ../depend_stubs/OgrePanelOverlayElement.h
BackgroundLoader.o: ../depend_stubs/OgreOverlayElementFactory.h
BackgroundLoader.o: ../depend_stubs/OgreOverlay.h
BackgroundLoader.o: ../depend_stubs/OgreOverlayManager.h
BackgroundLoader.o: ../src/gfx/TextListOverlayElement.h
BackgroundLoader.o: ../depend_stubs/OgrePrerequisites.h
BackgroundLoader.o: ../depend_stubs/OgreOverlayElement.h
BackgroundLoader.o: ../depend_stubs/OgreFont.h
BackgroundLoader.o: ../src/physics/PhysicsWorld.h ../src/SharedPtr.h
BackgroundLoader.o: ../depend_stubs/btBulletDynamicsCommon.h
BackgroundLoader.o: ../src/physics/TColParser.h
BackgroundLoader.o: ../src/physics/TColLexer ../depend_stubs/istream
BackgroundLoader.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
BackgroundLoader.o: ../src/physics/TColLexer-token_ids
BackgroundLoader.o: ../depend_stubs/cstdio
BackgroundLoader.o: ../depend_stubs/quex/code_base/Token
BackgroundLoader.o: ../depend_stubs/quex/code_base/definitions
BackgroundLoader.o: ../depend_stubs/quex/code_base/buffer/Buffer
BackgroundLoader.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/QuexMode
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/Analyser
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/Counter
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/Accumulator
BackgroundLoader.o: ../depend_stubs/quex/code_base/TokenQueue
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/IncludeStack
BackgroundLoader.o: ../depend_stubs/quex/code_base/temporary_macros_on
BackgroundLoader.o: ../depend_stubs/quex/code_base/temporary_macros_off
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/constructor.i
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/Counter.i
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/Accumulator.i
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/mode_handling.i
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/misc.i
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/buffer_access.i
BackgroundLoader.o: ../depend_stubs/quex/code_base/template/Analyser.i
BackgroundLoader.o: ../src/physics/CollisionMesh.h
BackgroundLoader.o: ../depend_stubs/OgreDataStream.h ../src/sleep.h
BackgroundLoader.o: ../src/physics/LooseEnd.h
BulletDebugDrawer.o: ../depend_stubs/OgreSceneManager.h
BulletDebugDrawer.o: ../depend_stubs/OgreMaterialManager.h
BulletDebugDrawer.o: ../depend_stubs/OgreRoot.h
BulletDebugDrawer.o: ../src/BulletDebugDrawer.h
BulletDebugDrawer.o: ../depend_stubs/OgreFrameListener.h
BulletDebugDrawer.o: ../depend_stubs/OgreManualObject.h
BulletDebugDrawer.o: ../depend_stubs/btBulletCollisionCommon.h
BulletDebugDrawer.o: ../src/CentralisedLog.h ../depend_stubs/iostream
BulletDebugDrawer.o: ../depend_stubs/sstream ../src/console_colour.h
BulletDebugDrawer.o: ../src/gfx/gfx.h ../src/SharedPtr.h
BulletDebugDrawer.o: ../depend_stubs/cstdlib
BulletDebugDrawer.o: ../depend_stubs/functional ../depend_stubs/string
BulletDebugDrawer.o: ../src/gfx/HUD.h ../depend_stubs/vector
BulletDebugDrawer.o: ../depend_stubs/climits
BulletDebugDrawer.o: ../depend_stubs/OgrePanelOverlayElement.h
BulletDebugDrawer.o: ../depend_stubs/OgreOverlayElementFactory.h
BulletDebugDrawer.o: ../depend_stubs/OgreOverlay.h
BulletDebugDrawer.o: ../depend_stubs/OgreOverlayManager.h
BulletDebugDrawer.o: ../src/gfx/TextListOverlayElement.h
BulletDebugDrawer.o: ../depend_stubs/OgrePrerequisites.h
BulletDebugDrawer.o: ../depend_stubs/OgreOverlayElement.h
BulletDebugDrawer.o: ../depend_stubs/OgreFont.h ../src/vect_util.h
BulletDebugDrawer.o: ../depend_stubs/algorithm ../src/math_util.h
BulletDebugDrawer.o: ../depend_stubs/cmath ../depend_stubs/cfloat
BulletDebugDrawer.o: ../depend_stubs/OgreOctreeSceneManager.h
BulletDebugDrawer.o: ../depend_stubs/OgreRenderWindow.h
BulletDebugDrawer.o: ../src/physics/PhysicsWorld.h ../depend_stubs/map
BulletDebugDrawer.o: ../src/CentralisedLog.h ../src/SharedPtr.h
BulletDebugDrawer.o: ../depend_stubs/btBulletDynamicsCommon.h
BulletDebugDrawer.o: ../depend_stubs/lua.h ../depend_stubs/lauxlib.h
BulletDebugDrawer.o: ../depend_stubs/lualib.h
BulletDebugDrawer.o: ../src/physics/TColParser.h
BulletDebugDrawer.o: ../src/physics/TColLexer ../depend_stubs/istream
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
BulletDebugDrawer.o: ../src/physics/TColLexer-token_ids
BulletDebugDrawer.o: ../depend_stubs/cstdio
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/Token
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/definitions
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/buffer/Buffer
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/QuexMode
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/Analyser
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/Counter
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/Accumulator
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/TokenQueue
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/IncludeStack
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/temporary_macros_on
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/temporary_macros_off
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/constructor.i
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/Counter.i
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/Accumulator.i
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/mode_handling.i
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/misc.i
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/buffer_access.i
BulletDebugDrawer.o: ../depend_stubs/quex/code_base/template/Analyser.i
BulletDebugDrawer.o: ../src/physics/CollisionMesh.h
BulletDebugDrawer.o: ../depend_stubs/OgreDataStream.h ../src/sleep.h
BulletDebugDrawer.o: ../src/physics/LooseEnd.h ../src/GritObject.h
BulletDebugDrawer.o: ../depend_stubs/set ../src/Streamer.h
BulletDebugDrawer.o: ../src/ExternalTable.h ../src/math_util.h
BulletDebugDrawer.o: ../src/LuaPtr.h ../src/SplineTable.h
BulletDebugDrawer.o: ../src/BackgroundLoader.h ../src/vect_util.h
BulletDebugDrawer.o: ../depend_stubs/list
BulletDebugDrawer.o: ../depend_stubs/boost/thread/thread.hpp
BulletDebugDrawer.o: ../depend_stubs/boost/thread/condition.hpp
BulletDebugDrawer.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
CentralisedLog.o: ../src/CentralisedLog.h ../depend_stubs/iostream
CentralisedLog.o: ../depend_stubs/sstream ../src/console_colour.h
ExternalTable.o: ../src/ExternalTable.h ../depend_stubs/map
ExternalTable.o: ../depend_stubs/string ../depend_stubs/lua.h
ExternalTable.o: ../depend_stubs/lauxlib.h ../src/math_util.h
ExternalTable.o: ../src/SharedPtr.h ../depend_stubs/cstdlib
ExternalTable.o: ../depend_stubs/functional ../src/LuaPtr.h
ExternalTable.o: ../src/SplineTable.h ../src/lua_util.h
ExternalTable.o: ../depend_stubs/limits ../depend_stubs/vector
ExternalTable.o: ../depend_stubs/lualib.h ../src/CentralisedLog.h
ExternalTable.o: ../depend_stubs/iostream ../depend_stubs/sstream
ExternalTable.o: ../src/console_colour.h
ExternalTable.o: ../src/lua_wrappers_primitives.h
ExternalTable.o: ../src/lua_wrappers_common.h
ExternalTable.o: ../depend_stubs/OgreException.h
GritClass.o: ../src/GritClass.h ../depend_stubs/string
GritClass.o: ../depend_stubs/lua.h ../depend_stubs/lauxlib.h
GritClass.o: ../depend_stubs/lualib.h ../src/ExternalTable.h
GritClass.o: ../depend_stubs/map ../src/math_util.h ../src/SharedPtr.h
GritClass.o: ../depend_stubs/cstdlib ../depend_stubs/functional
GritClass.o: ../src/LuaPtr.h ../src/SplineTable.h ../src/lua_util.h
GritClass.o: ../depend_stubs/limits ../depend_stubs/vector
GritClass.o: ../src/CentralisedLog.h ../depend_stubs/iostream
GritClass.o: ../depend_stubs/sstream ../src/console_colour.h
GritObject.o: ../depend_stubs/cmath ../depend_stubs/OgreException.h
GritObject.o: ../depend_stubs/OgreSceneNode.h
GritObject.o: ../depend_stubs/OgreMeshManager.h
GritObject.o: ../depend_stubs/OgreTextureManager.h
GritObject.o: ../depend_stubs/OgreMaterialManager.h
GritObject.o: ../depend_stubs/OgreTexture.h
GritObject.o: ../depend_stubs/OgreSubMesh.h ../src/main.h
GritObject.o: ../depend_stubs/lua.h ../src/Mouse.h
GritObject.o: ../depend_stubs/vector ../src/Keyboard.h
GritObject.o: ../depend_stubs/string ../src/BackgroundLoader.h
GritObject.o: ../src/vect_util.h ../depend_stubs/algorithm
GritObject.o: ../src/CentralisedLog.h ../depend_stubs/iostream
GritObject.o: ../depend_stubs/sstream ../src/console_colour.h
GritObject.o: ../depend_stubs/list
GritObject.o: ../depend_stubs/boost/thread/thread.hpp
GritObject.o: ../depend_stubs/boost/thread/condition.hpp
GritObject.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
GritObject.o: ../src/BulletDebugDrawer.h
GritObject.o: ../depend_stubs/OgreFrameListener.h
GritObject.o: ../depend_stubs/OgreManualObject.h
GritObject.o: ../depend_stubs/btBulletCollisionCommon.h
GritObject.o: ../src/gfx/lua_userdata_dependency_tracker.h
GritObject.o: ../depend_stubs/OgreStaticGeometry.h
GritObject.o: ../depend_stubs/OgreInstancedGeometry.h
GritObject.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
GritObject.o: ../depend_stubs/OgreMovableObject.h
GritObject.o: ../depend_stubs/OgreVertexIndexData.h
GritObject.o: ../depend_stubs/OgreMaterial.h
GritObject.o: ../depend_stubs/OgreMesh.h ../src/math_util.h
GritObject.o: ../src/CacheFriendlyRangeSpaceSIMD.h ../depend_stubs/map
GritObject.o: ../src/SSEAllocator.h ../src/Streamer.h
GritObject.o: ../depend_stubs/lauxlib.h ../depend_stubs/lualib.h
GritObject.o: ../src/GritClass.h ../src/ExternalTable.h
GritObject.o: ../src/math_util.h ../src/SharedPtr.h
GritObject.o: ../depend_stubs/cstdlib ../depend_stubs/functional
GritObject.o: ../src/LuaPtr.h ../src/SplineTable.h ../src/lua_util.h
GritObject.o: ../depend_stubs/limits ../src/GritObject.h
GritObject.o: ../depend_stubs/set ../src/Streamer.h
GritObject.o: ../src/CacheFriendlyRangeSpaceSIMD.h ../src/gfx/HUD.h
GritObject.o: ../depend_stubs/climits
GritObject.o: ../depend_stubs/OgrePanelOverlayElement.h
GritObject.o: ../depend_stubs/OgreOverlayElementFactory.h
GritObject.o: ../depend_stubs/OgreOverlay.h
GritObject.o: ../depend_stubs/OgreOverlayManager.h
GritObject.o: ../src/gfx/TextListOverlayElement.h
GritObject.o: ../depend_stubs/OgrePrerequisites.h
GritObject.o: ../depend_stubs/OgreOverlayElement.h
GritObject.o: ../depend_stubs/OgreFont.h ../src/physics/PhysicsWorld.h
GritObject.o: ../src/CentralisedLog.h ../src/SharedPtr.h
GritObject.o: ../depend_stubs/btBulletDynamicsCommon.h
GritObject.o: ../src/physics/TColParser.h ../src/physics/TColLexer
GritObject.o: ../depend_stubs/istream
GritObject.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
GritObject.o: ../src/physics/TColLexer-token_ids
GritObject.o: ../depend_stubs/cstdio
GritObject.o: ../depend_stubs/quex/code_base/Token
GritObject.o: ../depend_stubs/quex/code_base/definitions
GritObject.o: ../depend_stubs/quex/code_base/buffer/Buffer
GritObject.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
GritObject.o: ../depend_stubs/quex/code_base/template/QuexMode
GritObject.o: ../depend_stubs/quex/code_base/template/Analyser
GritObject.o: ../depend_stubs/quex/code_base/template/Counter
GritObject.o: ../depend_stubs/quex/code_base/template/Accumulator
GritObject.o: ../depend_stubs/quex/code_base/TokenQueue
GritObject.o: ../depend_stubs/quex/code_base/template/IncludeStack
GritObject.o: ../depend_stubs/quex/code_base/temporary_macros_on
GritObject.o: ../depend_stubs/quex/code_base/temporary_macros_off
GritObject.o: ../depend_stubs/quex/code_base/template/constructor.i
GritObject.o: ../depend_stubs/quex/code_base/template/Counter.i
GritObject.o: ../depend_stubs/quex/code_base/template/Accumulator.i
GritObject.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
GritObject.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
GritObject.o: ../depend_stubs/quex/code_base/template/mode_handling.i
GritObject.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
GritObject.o: ../depend_stubs/quex/code_base/template/misc.i
GritObject.o: ../depend_stubs/quex/code_base/template/buffer_access.i
GritObject.o: ../depend_stubs/quex/code_base/template/Analyser.i
GritObject.o: ../src/physics/CollisionMesh.h
GritObject.o: ../depend_stubs/OgreDataStream.h ../src/sleep.h
GritObject.o: ../src/physics/LooseEnd.h ../src/lua_wrappers_gritobj.h
GritObject.o: ../src/lua_wrappers_common.h
Streamer.o: ../src/Streamer.h ../src/main.h ../depend_stubs/lua.h
Streamer.o: ../src/Mouse.h ../depend_stubs/vector ../src/Keyboard.h
Streamer.o: ../depend_stubs/string ../src/BackgroundLoader.h
Streamer.o: ../src/vect_util.h ../depend_stubs/algorithm
Streamer.o: ../src/CentralisedLog.h ../depend_stubs/iostream
Streamer.o: ../depend_stubs/sstream ../src/console_colour.h
Streamer.o: ../depend_stubs/list
Streamer.o: ../depend_stubs/boost/thread/thread.hpp
Streamer.o: ../depend_stubs/boost/thread/condition.hpp
Streamer.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
Streamer.o: ../src/BulletDebugDrawer.h
Streamer.o: ../depend_stubs/OgreFrameListener.h
Streamer.o: ../depend_stubs/OgreManualObject.h
Streamer.o: ../depend_stubs/btBulletCollisionCommon.h
Streamer.o: ../src/gfx/lua_userdata_dependency_tracker.h
Streamer.o: ../depend_stubs/OgreStaticGeometry.h
Streamer.o: ../depend_stubs/OgreInstancedGeometry.h
Streamer.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
Streamer.o: ../depend_stubs/OgreMovableObject.h
Streamer.o: ../depend_stubs/OgreVertexIndexData.h
Streamer.o: ../depend_stubs/OgreMaterial.h ../depend_stubs/OgreMesh.h
Streamer.o: ../src/math_util.h ../depend_stubs/cmath
Streamer.o: ../src/CacheFriendlyRangeSpaceSIMD.h ../depend_stubs/map
Streamer.o: ../src/SSEAllocator.h ../src/Streamer.h
Streamer.o: ../depend_stubs/lauxlib.h ../depend_stubs/lualib.h
Streamer.o: ../src/GritClass.h ../src/ExternalTable.h
Streamer.o: ../src/math_util.h ../src/SharedPtr.h
Streamer.o: ../depend_stubs/cstdlib ../depend_stubs/functional
Streamer.o: ../src/LuaPtr.h ../src/SplineTable.h ../src/lua_util.h
Streamer.o: ../depend_stubs/limits ../src/GritObject.h
Streamer.o: ../depend_stubs/set ../src/CacheFriendlyRangeSpaceSIMD.h
Streamer.o: ../src/gfx/HUD.h ../depend_stubs/climits
Streamer.o: ../depend_stubs/OgrePanelOverlayElement.h
Streamer.o: ../depend_stubs/OgreOverlayElementFactory.h
Streamer.o: ../depend_stubs/OgreOverlay.h
Streamer.o: ../depend_stubs/OgreOverlayManager.h
Streamer.o: ../src/gfx/TextListOverlayElement.h
Streamer.o: ../depend_stubs/OgrePrerequisites.h
Streamer.o: ../depend_stubs/OgreOverlayElement.h
Streamer.o: ../depend_stubs/OgreFont.h ../src/physics/PhysicsWorld.h
Streamer.o: ../src/CentralisedLog.h ../src/SharedPtr.h
Streamer.o: ../depend_stubs/btBulletDynamicsCommon.h
Streamer.o: ../src/physics/TColParser.h ../src/physics/TColLexer
Streamer.o: ../depend_stubs/istream
Streamer.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
Streamer.o: ../src/physics/TColLexer-token_ids ../depend_stubs/cstdio
Streamer.o: ../depend_stubs/quex/code_base/Token
Streamer.o: ../depend_stubs/quex/code_base/definitions
Streamer.o: ../depend_stubs/quex/code_base/buffer/Buffer
Streamer.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
Streamer.o: ../depend_stubs/quex/code_base/template/QuexMode
Streamer.o: ../depend_stubs/quex/code_base/template/Analyser
Streamer.o: ../depend_stubs/quex/code_base/template/Counter
Streamer.o: ../depend_stubs/quex/code_base/template/Accumulator
Streamer.o: ../depend_stubs/quex/code_base/TokenQueue
Streamer.o: ../depend_stubs/quex/code_base/template/IncludeStack
Streamer.o: ../depend_stubs/quex/code_base/temporary_macros_on
Streamer.o: ../depend_stubs/quex/code_base/temporary_macros_off
Streamer.o: ../depend_stubs/quex/code_base/template/constructor.i
Streamer.o: ../depend_stubs/quex/code_base/template/Counter.i
Streamer.o: ../depend_stubs/quex/code_base/template/Accumulator.i
Streamer.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
Streamer.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
Streamer.o: ../depend_stubs/quex/code_base/template/mode_handling.i
Streamer.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
Streamer.o: ../depend_stubs/quex/code_base/template/misc.i
Streamer.o: ../depend_stubs/quex/code_base/template/buffer_access.i
Streamer.o: ../depend_stubs/quex/code_base/template/Analyser.i
Streamer.o: ../src/physics/CollisionMesh.h
Streamer.o: ../depend_stubs/OgreDataStream.h ../src/sleep.h
Streamer.o: ../src/physics/LooseEnd.h
ldbglue.o: ../depend_stubs/lua.h
lua_utf8.o: ../depend_stubs/cstdlib ../depend_stubs/cstdio
lua_utf8.o: ../depend_stubs/cassert ../depend_stubs/iostream
lua_utf8.o: ../depend_stubs/string ../depend_stubs/lua.h
lua_utf8.o: ../depend_stubs/unicode/unistr.h
lua_utf8.o: ../depend_stubs/unicode/regex.h ../src/lua_utf8.h
lua_utf8.o: ../src/lua_wrappers_common.h
lua_utf8.o: ../depend_stubs/OgreException.h ../depend_stubs/lauxlib.h
lua_utf8.o: ../depend_stubs/lualib.h ../src/lua_util.h
lua_utf8.o: ../depend_stubs/limits ../depend_stubs/vector
lua_utf8.o: ../src/CentralisedLog.h ../depend_stubs/sstream
lua_utf8.o: ../src/console_colour.h ../src/math_util.h
lua_util.o: ../depend_stubs/cstdlib ../depend_stubs/cmath
lua_util.o: ../depend_stubs/map ../depend_stubs/sstream
lua_util.o: ../src/lua_util.h ../depend_stubs/string
lua_util.o: ../depend_stubs/limits ../depend_stubs/vector
lua_util.o: ../depend_stubs/lua.h ../depend_stubs/lauxlib.h
lua_util.o: ../depend_stubs/lualib.h ../src/CentralisedLog.h
lua_util.o: ../depend_stubs/iostream ../src/console_colour.h
lua_util.o: ../src/math_util.h ../src/LuaPtr.h
lua_wrappers_core.o: ../depend_stubs/limits.h
lua_wrappers_core.o: ../depend_stubs/sys/mman.h ../src/Keyboard.h
lua_wrappers_core.o: ../depend_stubs/string ../depend_stubs/vector
lua_wrappers_core.o: ../src/Mouse.h ../src/BackgroundLoader.h
lua_wrappers_core.o: ../src/vect_util.h ../depend_stubs/algorithm
lua_wrappers_core.o: ../src/CentralisedLog.h ../depend_stubs/iostream
lua_wrappers_core.o: ../depend_stubs/sstream ../src/console_colour.h
lua_wrappers_core.o: ../depend_stubs/list
lua_wrappers_core.o: ../depend_stubs/boost/thread/thread.hpp
lua_wrappers_core.o: ../depend_stubs/boost/thread/condition.hpp
lua_wrappers_core.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
lua_wrappers_core.o: ../src/sleep.h ../src/clipboard.h ../src/main.h
lua_wrappers_core.o: ../depend_stubs/lua.h ../src/BulletDebugDrawer.h
lua_wrappers_core.o: ../depend_stubs/OgreFrameListener.h
lua_wrappers_core.o: ../depend_stubs/OgreManualObject.h
lua_wrappers_core.o: ../depend_stubs/btBulletCollisionCommon.h
lua_wrappers_core.o: ../src/gfx/lua_userdata_dependency_tracker.h
lua_wrappers_core.o: ../depend_stubs/OgreStaticGeometry.h
lua_wrappers_core.o: ../depend_stubs/OgreInstancedGeometry.h
lua_wrappers_core.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
lua_wrappers_core.o: ../depend_stubs/OgreMovableObject.h
lua_wrappers_core.o: ../depend_stubs/OgreVertexIndexData.h
lua_wrappers_core.o: ../depend_stubs/OgreMaterial.h
lua_wrappers_core.o: ../depend_stubs/OgreMesh.h ../src/math_util.h
lua_wrappers_core.o: ../depend_stubs/cmath
lua_wrappers_core.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_core.o: ../depend_stubs/map ../src/SSEAllocator.h
lua_wrappers_core.o: ../src/Streamer.h ../depend_stubs/lauxlib.h
lua_wrappers_core.o: ../depend_stubs/lualib.h ../src/GritClass.h
lua_wrappers_core.o: ../src/ExternalTable.h ../src/math_util.h
lua_wrappers_core.o: ../src/SharedPtr.h ../depend_stubs/cstdlib
lua_wrappers_core.o: ../depend_stubs/functional ../src/LuaPtr.h
lua_wrappers_core.o: ../src/SplineTable.h ../src/lua_util.h
lua_wrappers_core.o: ../depend_stubs/limits ../src/GritObject.h
lua_wrappers_core.o: ../depend_stubs/set ../src/Streamer.h
lua_wrappers_core.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_core.o: ../src/gfx/HUD.h ../depend_stubs/climits
lua_wrappers_core.o: ../depend_stubs/OgrePanelOverlayElement.h
lua_wrappers_core.o: ../depend_stubs/OgreOverlayElementFactory.h
lua_wrappers_core.o: ../depend_stubs/OgreOverlay.h
lua_wrappers_core.o: ../depend_stubs/OgreOverlayManager.h
lua_wrappers_core.o: ../src/gfx/TextListOverlayElement.h
lua_wrappers_core.o: ../depend_stubs/OgrePrerequisites.h
lua_wrappers_core.o: ../depend_stubs/OgreOverlayElement.h
lua_wrappers_core.o: ../depend_stubs/OgreFont.h
lua_wrappers_core.o: ../src/physics/PhysicsWorld.h
lua_wrappers_core.o: ../src/CentralisedLog.h ../src/SharedPtr.h
lua_wrappers_core.o: ../depend_stubs/btBulletDynamicsCommon.h
lua_wrappers_core.o: ../src/physics/TColParser.h
lua_wrappers_core.o: ../src/physics/TColLexer ../depend_stubs/istream
lua_wrappers_core.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
lua_wrappers_core.o: ../src/physics/TColLexer-token_ids
lua_wrappers_core.o: ../depend_stubs/cstdio
lua_wrappers_core.o: ../depend_stubs/quex/code_base/Token
lua_wrappers_core.o: ../depend_stubs/quex/code_base/definitions
lua_wrappers_core.o: ../depend_stubs/quex/code_base/buffer/Buffer
lua_wrappers_core.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/QuexMode
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/Analyser
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/Counter
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/Accumulator
lua_wrappers_core.o: ../depend_stubs/quex/code_base/TokenQueue
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/IncludeStack
lua_wrappers_core.o: ../depend_stubs/quex/code_base/temporary_macros_on
lua_wrappers_core.o: ../depend_stubs/quex/code_base/temporary_macros_off
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/constructor.i
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/Counter.i
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/Accumulator.i
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/mode_handling.i
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/misc.i
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/buffer_access.i
lua_wrappers_core.o: ../depend_stubs/quex/code_base/template/Analyser.i
lua_wrappers_core.o: ../src/physics/CollisionMesh.h
lua_wrappers_core.o: ../depend_stubs/OgreDataStream.h ../src/sleep.h
lua_wrappers_core.o: ../src/physics/LooseEnd.h ../src/lua_utf8.h
lua_wrappers_core.o: ../src/lua_wrappers_primitives.h
lua_wrappers_core.o: ../src/lua_wrappers_common.h
lua_wrappers_core.o: ../depend_stubs/OgreException.h
lua_wrappers_core.o: ../src/path_util.h ../src/lua_wrappers_gritobj.h
lua_wrappers_core.o: ../src/gfx/lua_wrappers_gfx.h ../src/gfx/gfx.h
lua_wrappers_core.o: ../src/gfx/HUD.h ../src/vect_util.h
lua_wrappers_core.o: ../depend_stubs/OgreRoot.h
lua_wrappers_core.o: ../depend_stubs/OgreOctreeSceneManager.h
lua_wrappers_core.o: ../depend_stubs/OgreRenderWindow.h
lua_wrappers_core.o: ../src/physics/lua_wrappers_physics.h
lua_wrappers_core.o: ../src/physics/PhysicsWorld.h
lua_wrappers_gritobj.o: ../src/GritObject.h ../depend_stubs/map
lua_wrappers_gritobj.o: ../depend_stubs/vector ../depend_stubs/set
lua_wrappers_gritobj.o: ../depend_stubs/string ../src/SharedPtr.h
lua_wrappers_gritobj.o: ../depend_stubs/cstdlib
lua_wrappers_gritobj.o: ../depend_stubs/functional ../src/Streamer.h
lua_wrappers_gritobj.o: ../src/ExternalTable.h ../depend_stubs/lua.h
lua_wrappers_gritobj.o: ../depend_stubs/lauxlib.h ../src/math_util.h
lua_wrappers_gritobj.o: ../src/LuaPtr.h ../src/SplineTable.h
lua_wrappers_gritobj.o: ../src/BackgroundLoader.h ../src/vect_util.h
lua_wrappers_gritobj.o: ../depend_stubs/algorithm
lua_wrappers_gritobj.o: ../src/CentralisedLog.h
lua_wrappers_gritobj.o: ../depend_stubs/iostream
lua_wrappers_gritobj.o: ../depend_stubs/sstream
lua_wrappers_gritobj.o: ../src/console_colour.h ../depend_stubs/list
lua_wrappers_gritobj.o: ../depend_stubs/boost/thread/thread.hpp
lua_wrappers_gritobj.o: ../depend_stubs/boost/thread/condition.hpp
lua_wrappers_gritobj.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
lua_wrappers_gritobj.o: ../src/main.h ../src/Mouse.h ../src/Keyboard.h
lua_wrappers_gritobj.o: ../src/BulletDebugDrawer.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreFrameListener.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreManualObject.h
lua_wrappers_gritobj.o: ../depend_stubs/btBulletCollisionCommon.h
lua_wrappers_gritobj.o: ../src/gfx/lua_userdata_dependency_tracker.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreStaticGeometry.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreInstancedGeometry.h
lua_wrappers_gritobj.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
lua_wrappers_gritobj.o: ../depend_stubs/OgreMovableObject.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreVertexIndexData.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreMaterial.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreMesh.h ../src/math_util.h
lua_wrappers_gritobj.o: ../depend_stubs/cmath
lua_wrappers_gritobj.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_gritobj.o: ../src/SSEAllocator.h ../src/Streamer.h
lua_wrappers_gritobj.o: ../depend_stubs/lualib.h ../src/GritClass.h
lua_wrappers_gritobj.o: ../src/lua_util.h ../depend_stubs/limits
lua_wrappers_gritobj.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_gritobj.o: ../src/gfx/HUD.h ../depend_stubs/climits
lua_wrappers_gritobj.o: ../depend_stubs/OgrePanelOverlayElement.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreOverlayElementFactory.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreOverlay.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreOverlayManager.h
lua_wrappers_gritobj.o: ../src/gfx/TextListOverlayElement.h
lua_wrappers_gritobj.o: ../depend_stubs/OgrePrerequisites.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreOverlayElement.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreFont.h
lua_wrappers_gritobj.o: ../src/physics/PhysicsWorld.h
lua_wrappers_gritobj.o: ../src/CentralisedLog.h ../src/SharedPtr.h
lua_wrappers_gritobj.o: ../depend_stubs/btBulletDynamicsCommon.h
lua_wrappers_gritobj.o: ../src/physics/TColParser.h
lua_wrappers_gritobj.o: ../src/physics/TColLexer
lua_wrappers_gritobj.o: ../depend_stubs/istream
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
lua_wrappers_gritobj.o: ../src/physics/TColLexer-token_ids
lua_wrappers_gritobj.o: ../depend_stubs/cstdio
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/Token
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/definitions
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/buffer/Buffer
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/QuexMode
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/Analyser
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/Counter
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/Accumulator
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/TokenQueue
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/IncludeStack
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/temporary_macros_on
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/temporary_macros_off
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/constructor.i
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/Counter.i
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/Accumulator.i
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/mode_handling.i
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/misc.i
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/buffer_access.i
lua_wrappers_gritobj.o: ../depend_stubs/quex/code_base/template/Analyser.i
lua_wrappers_gritobj.o: ../src/physics/CollisionMesh.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreDataStream.h
lua_wrappers_gritobj.o: ../src/sleep.h ../src/physics/LooseEnd.h
lua_wrappers_gritobj.o: ../src/lua_wrappers_gritobj.h
lua_wrappers_gritobj.o: ../src/lua_wrappers_common.h
lua_wrappers_gritobj.o: ../depend_stubs/OgreException.h
lua_wrappers_gritobj.o: ../src/lua_wrappers_primitives.h
lua_wrappers_gritobj.o: ../src/lua_wrappers_core.h ../src/path_util.h
lua_wrappers_primitives.o: ../depend_stubs/algorithm
lua_wrappers_primitives.o: ../src/lua_wrappers_primitives.h
lua_wrappers_primitives.o: ../src/lua_wrappers_common.h
lua_wrappers_primitives.o: ../depend_stubs/string
lua_wrappers_primitives.o: ../depend_stubs/OgreException.h
lua_wrappers_primitives.o: ../depend_stubs/lua.h
lua_wrappers_primitives.o: ../depend_stubs/lauxlib.h
lua_wrappers_primitives.o: ../depend_stubs/lualib.h ../src/lua_util.h
lua_wrappers_primitives.o: ../depend_stubs/limits
lua_wrappers_primitives.o: ../depend_stubs/vector
lua_wrappers_primitives.o: ../src/CentralisedLog.h
lua_wrappers_primitives.o: ../depend_stubs/iostream
lua_wrappers_primitives.o: ../depend_stubs/sstream
lua_wrappers_primitives.o: ../src/console_colour.h ../src/math_util.h
lua_wrappers_primitives.o: ../src/SplineTable.h
lua_wrappers_primitives.o: ../depend_stubs/cstdlib ../depend_stubs/map
main.o: ../depend_stubs/cerrno ../depend_stubs/sstream
main.o: ../src/linux/KeyboardX11.h ../depend_stubs/set
main.o: ../depend_stubs/map ../depend_stubs/X11/Xlib.h
main.o: ../depend_stubs/X11/Xutil.h ../depend_stubs/X11/keysym.h
main.o: ../src/Keyboard.h ../depend_stubs/string
main.o: ../depend_stubs/vector ../src/linux/MouseX11.h ../src/Mouse.h
main.o: ../src/main.h ../depend_stubs/lua.h ../src/Mouse.h
main.o: ../src/Keyboard.h ../src/BackgroundLoader.h ../src/vect_util.h
main.o: ../depend_stubs/algorithm ../src/CentralisedLog.h
main.o: ../depend_stubs/iostream ../src/console_colour.h
main.o: ../depend_stubs/list ../depend_stubs/boost/thread/thread.hpp
main.o: ../depend_stubs/boost/thread/condition.hpp
main.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
main.o: ../src/BulletDebugDrawer.h ../depend_stubs/OgreFrameListener.h
main.o: ../depend_stubs/OgreManualObject.h
main.o: ../depend_stubs/btBulletCollisionCommon.h
main.o: ../src/gfx/lua_userdata_dependency_tracker.h
main.o: ../depend_stubs/OgreStaticGeometry.h
main.o: ../depend_stubs/OgreInstancedGeometry.h ../src/gfx/Clutter.h
main.o: ../depend_stubs/cfloat ../depend_stubs/OgreMovableObject.h
main.o: ../depend_stubs/OgreVertexIndexData.h
main.o: ../depend_stubs/OgreMaterial.h ../depend_stubs/OgreMesh.h
main.o: ../src/math_util.h ../depend_stubs/cmath
main.o: ../src/CacheFriendlyRangeSpaceSIMD.h ../src/SSEAllocator.h
main.o: ../src/Streamer.h ../depend_stubs/lauxlib.h
main.o: ../depend_stubs/lualib.h ../src/GritClass.h
main.o: ../src/ExternalTable.h ../src/math_util.h ../src/SharedPtr.h
main.o: ../depend_stubs/cstdlib ../depend_stubs/functional
main.o: ../src/LuaPtr.h ../src/SplineTable.h ../src/lua_util.h
main.o: ../depend_stubs/limits ../src/GritObject.h ../src/Streamer.h
main.o: ../src/CacheFriendlyRangeSpaceSIMD.h ../src/gfx/HUD.h
main.o: ../depend_stubs/climits
main.o: ../depend_stubs/OgrePanelOverlayElement.h
main.o: ../depend_stubs/OgreOverlayElementFactory.h
main.o: ../depend_stubs/OgreOverlay.h
main.o: ../depend_stubs/OgreOverlayManager.h
main.o: ../src/gfx/TextListOverlayElement.h
main.o: ../depend_stubs/OgrePrerequisites.h
main.o: ../depend_stubs/OgreOverlayElement.h
main.o: ../depend_stubs/OgreFont.h ../src/physics/PhysicsWorld.h
main.o: ../src/CentralisedLog.h ../src/SharedPtr.h
main.o: ../depend_stubs/btBulletDynamicsCommon.h
main.o: ../src/physics/TColParser.h ../src/physics/TColLexer
main.o: ../depend_stubs/istream
main.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
main.o: ../src/physics/TColLexer-token_ids ../depend_stubs/cstdio
main.o: ../depend_stubs/quex/code_base/Token
main.o: ../depend_stubs/quex/code_base/definitions
main.o: ../depend_stubs/quex/code_base/buffer/Buffer
main.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
main.o: ../depend_stubs/quex/code_base/template/QuexMode
main.o: ../depend_stubs/quex/code_base/template/Analyser
main.o: ../depend_stubs/quex/code_base/template/Counter
main.o: ../depend_stubs/quex/code_base/template/Accumulator
main.o: ../depend_stubs/quex/code_base/TokenQueue
main.o: ../depend_stubs/quex/code_base/template/IncludeStack
main.o: ../depend_stubs/quex/code_base/temporary_macros_on
main.o: ../depend_stubs/quex/code_base/temporary_macros_off
main.o: ../depend_stubs/quex/code_base/template/constructor.i
main.o: ../depend_stubs/quex/code_base/template/Counter.i
main.o: ../depend_stubs/quex/code_base/template/Accumulator.i
main.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
main.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
main.o: ../depend_stubs/quex/code_base/template/mode_handling.i
main.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
main.o: ../depend_stubs/quex/code_base/template/misc.i
main.o: ../depend_stubs/quex/code_base/template/buffer_access.i
main.o: ../depend_stubs/quex/code_base/template/Analyser.i
main.o: ../src/physics/CollisionMesh.h
main.o: ../depend_stubs/OgreDataStream.h ../src/sleep.h
main.o: ../src/physics/LooseEnd.h ../src/lua_wrappers_core.h
main.o: ../src/gfx/gfx.h ../src/gfx/HUD.h ../src/vect_util.h
main.o: ../depend_stubs/OgreRoot.h
main.o: ../depend_stubs/OgreOctreeSceneManager.h
main.o: ../depend_stubs/OgreRenderWindow.h
path_util.o: ../src/CentralisedLog.h ../depend_stubs/iostream
path_util.o: ../depend_stubs/sstream ../src/console_colour.h
path_util.o: ../src/path_util.h ../depend_stubs/vector
path_util.o: ../depend_stubs/string ../src/lua_util.h
path_util.o: ../depend_stubs/limits ../depend_stubs/lua.h
path_util.o: ../depend_stubs/lauxlib.h ../depend_stubs/lualib.h
path_util.o: ../src/math_util.h
unicode_util.o: ../depend_stubs/cstdlib ../depend_stubs/cstring
unicode_util.o: ../depend_stubs/cstdio ../src/unicode_util.h
unicode_util.o: ../depend_stubs/string
KeyboardX11.o: ../depend_stubs/iostream ../depend_stubs/sstream
KeyboardX11.o: ../src/linux/KeyboardX11.h ../depend_stubs/set
KeyboardX11.o: ../depend_stubs/map ../depend_stubs/X11/Xlib.h
KeyboardX11.o: ../depend_stubs/X11/Xutil.h
KeyboardX11.o: ../depend_stubs/X11/keysym.h ../src/Keyboard.h
KeyboardX11.o: ../depend_stubs/string ../depend_stubs/vector
KeyboardX11.o: ../src/CentralisedLog.h ../src/unicode_util.h
KeyboardX11.o: ../depend_stubs/cstdlib
MouseX11.o: ../depend_stubs/sstream ../src/linux/MouseX11.h
MouseX11.o: ../depend_stubs/X11/Xlib.h ../src/Mouse.h
MouseX11.o: ../depend_stubs/vector ../src/CentralisedLog.h
posix_sleep.o: ../depend_stubs/time.h ../depend_stubs/assert.h
posix_sleep.o: ../depend_stubs/stdio.h
x11_clipboard.o: ../depend_stubs/cstdlib ../depend_stubs/string
KeyboardDirectInput8.o: ../depend_stubs/assert.h
KeyboardDirectInput8.o: ../depend_stubs/iostream
KeyboardDirectInput8.o: ../src/win32/KeyboardDirectInput8.h
KeyboardDirectInput8.o: ../depend_stubs/map ../depend_stubs/set
KeyboardDirectInput8.o: ../depend_stubs/dinput.h
KeyboardDirectInput8.o: ../src/Keyboard.h ../depend_stubs/string
KeyboardDirectInput8.o: ../depend_stubs/vector
KeyboardDirectInput8.o: ../src/CentralisedLog.h
KeyboardWinAPI.o: ../depend_stubs/assert.h
KeyboardWinAPI.o: ../depend_stubs/iostream
KeyboardWinAPI.o: ../src/win32/KeyboardWinAPI.h
KeyboardWinAPI.o: ../depend_stubs/map ../depend_stubs/set
KeyboardWinAPI.o: ../depend_stubs/windows.h ../src/Keyboard.h
KeyboardWinAPI.o: ../depend_stubs/string ../depend_stubs/vector
KeyboardWinAPI.o: ../src/CentralisedLog.h ../src/unicode_util.h
KeyboardWinAPI.o: ../depend_stubs/cstdlib
MouseDirectInput8.o: ../depend_stubs/assert.h
MouseDirectInput8.o: ../depend_stubs/iostream
MouseDirectInput8.o: ../src/win32/MouseDirectInput8.h
MouseDirectInput8.o: ../depend_stubs/dinput.h ../src/Mouse.h
MouseDirectInput8.o: ../depend_stubs/vector
MouseDirectInput8.o: ../src/CentralisedLog.h
win32_clipboard.o: ../depend_stubs/cstdlib
win32_clipboard.o: ../depend_stubs/string
win32_clipboard.o: ../depend_stubs/windows.h
win32_clipboard.o: ../src/unicode_util.h
win32_sleep.o: ../depend_stubs/windows.h
Clutter.o: ../depend_stubs/OgreHardwareBufferManager.h
Clutter.o: ../depend_stubs/OgreMaterialManager.h
Clutter.o: ../depend_stubs/OgreSubMesh.h
Clutter.o: ../depend_stubs/OgreMesh.h ../src/main.h
Clutter.o: ../depend_stubs/lua.h ../src/Mouse.h
Clutter.o: ../depend_stubs/vector ../src/Keyboard.h
Clutter.o: ../depend_stubs/string ../src/BackgroundLoader.h
Clutter.o: ../src/vect_util.h ../depend_stubs/algorithm
Clutter.o: ../src/CentralisedLog.h ../depend_stubs/iostream
Clutter.o: ../depend_stubs/sstream ../src/console_colour.h
Clutter.o: ../depend_stubs/list
Clutter.o: ../depend_stubs/boost/thread/thread.hpp
Clutter.o: ../depend_stubs/boost/thread/condition.hpp
Clutter.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
Clutter.o: ../src/BulletDebugDrawer.h
Clutter.o: ../depend_stubs/OgreFrameListener.h
Clutter.o: ../depend_stubs/OgreManualObject.h
Clutter.o: ../depend_stubs/btBulletCollisionCommon.h
Clutter.o: ../src/gfx/lua_userdata_dependency_tracker.h
Clutter.o: ../depend_stubs/OgreStaticGeometry.h
Clutter.o: ../depend_stubs/OgreInstancedGeometry.h
Clutter.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
Clutter.o: ../depend_stubs/OgreMovableObject.h
Clutter.o: ../depend_stubs/OgreVertexIndexData.h
Clutter.o: ../depend_stubs/OgreMaterial.h ../src/math_util.h
Clutter.o: ../depend_stubs/cmath
Clutter.o: ../src/CacheFriendlyRangeSpaceSIMD.h
Clutter.o: ../depend_stubs/map ../src/SSEAllocator.h
Clutter.o: ../src/Streamer.h ../depend_stubs/lauxlib.h
Clutter.o: ../depend_stubs/lualib.h ../src/GritClass.h
Clutter.o: ../src/ExternalTable.h ../src/math_util.h
Clutter.o: ../src/SharedPtr.h ../depend_stubs/cstdlib
Clutter.o: ../depend_stubs/functional ../src/LuaPtr.h
Clutter.o: ../src/SplineTable.h ../src/lua_util.h
Clutter.o: ../depend_stubs/limits ../src/GritObject.h
Clutter.o: ../depend_stubs/set ../src/Streamer.h
Clutter.o: ../src/CacheFriendlyRangeSpaceSIMD.h ../src/gfx/HUD.h
Clutter.o: ../depend_stubs/climits
Clutter.o: ../depend_stubs/OgrePanelOverlayElement.h
Clutter.o: ../depend_stubs/OgreOverlayElementFactory.h
Clutter.o: ../depend_stubs/OgreOverlay.h
Clutter.o: ../depend_stubs/OgreOverlayManager.h
Clutter.o: ../src/gfx/TextListOverlayElement.h
Clutter.o: ../depend_stubs/OgrePrerequisites.h
Clutter.o: ../depend_stubs/OgreOverlayElement.h
Clutter.o: ../depend_stubs/OgreFont.h
Clutter.o: ../src/physics/PhysicsWorld.h ../src/CentralisedLog.h
Clutter.o: ../src/SharedPtr.h
Clutter.o: ../depend_stubs/btBulletDynamicsCommon.h
Clutter.o: ../src/physics/TColParser.h ../src/physics/TColLexer
Clutter.o: ../depend_stubs/istream
Clutter.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
Clutter.o: ../src/physics/TColLexer-token_ids
Clutter.o: ../depend_stubs/cstdio
Clutter.o: ../depend_stubs/quex/code_base/Token
Clutter.o: ../depend_stubs/quex/code_base/definitions
Clutter.o: ../depend_stubs/quex/code_base/buffer/Buffer
Clutter.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
Clutter.o: ../depend_stubs/quex/code_base/template/QuexMode
Clutter.o: ../depend_stubs/quex/code_base/template/Analyser
Clutter.o: ../depend_stubs/quex/code_base/template/Counter
Clutter.o: ../depend_stubs/quex/code_base/template/Accumulator
Clutter.o: ../depend_stubs/quex/code_base/TokenQueue
Clutter.o: ../depend_stubs/quex/code_base/template/IncludeStack
Clutter.o: ../depend_stubs/quex/code_base/temporary_macros_on
Clutter.o: ../depend_stubs/quex/code_base/temporary_macros_off
Clutter.o: ../depend_stubs/quex/code_base/template/constructor.i
Clutter.o: ../depend_stubs/quex/code_base/template/Counter.i
Clutter.o: ../depend_stubs/quex/code_base/template/Accumulator.i
Clutter.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
Clutter.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
Clutter.o: ../depend_stubs/quex/code_base/template/mode_handling.i
Clutter.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
Clutter.o: ../depend_stubs/quex/code_base/template/misc.i
Clutter.o: ../depend_stubs/quex/code_base/template/buffer_access.i
Clutter.o: ../depend_stubs/quex/code_base/template/Analyser.i
Clutter.o: ../src/physics/CollisionMesh.h
Clutter.o: ../depend_stubs/OgreDataStream.h ../src/sleep.h
Clutter.o: ../src/physics/LooseEnd.h ../src/gfx/gfx.h
Clutter.o: ../src/gfx/HUD.h ../src/vect_util.h
Clutter.o: ../depend_stubs/OgreRoot.h
Clutter.o: ../depend_stubs/OgreOctreeSceneManager.h
Clutter.o: ../depend_stubs/OgreRenderWindow.h
GfxDiskResource.o: ../depend_stubs/OgreMesh.h
GfxDiskResource.o: ../depend_stubs/OgreMeshManager.h
GfxDiskResource.o: ../depend_stubs/OgreTexture.h
GfxDiskResource.o: ../depend_stubs/OgreTextureManager.h
GfxDiskResource.o: ../src/gfx/GfxDiskResource.h
GfxDiskResource.o: ../depend_stubs/OgreResource.h
GfxDiskResource.o: ../src/CentralisedLog.h
GfxDiskResource.o: ../src/BackgroundLoader.h
GfxDiskResource.o: ../depend_stubs/vector ../src/vect_util.h
GfxDiskResource.o: ../depend_stubs/algorithm
GfxDiskResource.o: ../src/CentralisedLog.h
GfxDiskResource.o: ../depend_stubs/iostream
GfxDiskResource.o: ../depend_stubs/sstream ../src/console_colour.h
HUD.o: ../depend_stubs/math.h ../depend_stubs/OgreFontManager.h
HUD.o: ../src/gfx/HUD.h ../depend_stubs/vector
HUD.o: ../depend_stubs/climits
HUD.o: ../depend_stubs/OgrePanelOverlayElement.h
HUD.o: ../depend_stubs/OgreOverlayElementFactory.h
HUD.o: ../depend_stubs/OgreOverlay.h
HUD.o: ../depend_stubs/OgreOverlayManager.h
HUD.o: ../src/gfx/TextListOverlayElement.h
HUD.o: ../depend_stubs/OgrePrerequisites.h
HUD.o: ../depend_stubs/OgreOverlayElement.h
HUD.o: ../depend_stubs/OgreFont.h ../src/CentralisedLog.h
HUD.o: ../depend_stubs/iostream ../depend_stubs/sstream
HUD.o: ../src/console_colour.h
TextListOverlayElement.o: ../depend_stubs/OgreStableHeaders.h
TextListOverlayElement.o: ../depend_stubs/OgreRoot.h
TextListOverlayElement.o: ../depend_stubs/OgreLogManager.h
TextListOverlayElement.o: ../depend_stubs/OgreOverlayManager.h
TextListOverlayElement.o: ../depend_stubs/OgreHardwareBufferManager.h
TextListOverlayElement.o: ../depend_stubs/OgreHardwareVertexBuffer.h
TextListOverlayElement.o: ../depend_stubs/OgreException.h
TextListOverlayElement.o: ../depend_stubs/OgreStringConverter.h
TextListOverlayElement.o: ../depend_stubs/OgreFont.h
TextListOverlayElement.o: ../depend_stubs/OgreFontManager.h
TextListOverlayElement.o: ../src/gfx/TextListOverlayElement.h
TextListOverlayElement.o: ../depend_stubs/OgrePrerequisites.h
TextListOverlayElement.o: ../depend_stubs/OgreOverlayElement.h
TextListOverlayElement.o: ../src/main.h ../depend_stubs/lua.h
TextListOverlayElement.o: ../src/Mouse.h ../depend_stubs/vector
TextListOverlayElement.o: ../src/Keyboard.h ../depend_stubs/string
TextListOverlayElement.o: ../src/BackgroundLoader.h
TextListOverlayElement.o: ../src/vect_util.h
TextListOverlayElement.o: ../depend_stubs/algorithm
TextListOverlayElement.o: ../src/CentralisedLog.h
TextListOverlayElement.o: ../depend_stubs/iostream
TextListOverlayElement.o: ../depend_stubs/sstream
TextListOverlayElement.o: ../src/console_colour.h
TextListOverlayElement.o: ../depend_stubs/list
TextListOverlayElement.o: ../depend_stubs/boost/thread/thread.hpp
TextListOverlayElement.o: ../depend_stubs/boost/thread/condition.hpp
TextListOverlayElement.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
TextListOverlayElement.o: ../src/BulletDebugDrawer.h
TextListOverlayElement.o: ../depend_stubs/OgreFrameListener.h
TextListOverlayElement.o: ../depend_stubs/OgreManualObject.h
TextListOverlayElement.o: ../depend_stubs/btBulletCollisionCommon.h
TextListOverlayElement.o: ../src/gfx/lua_userdata_dependency_tracker.h
TextListOverlayElement.o: ../depend_stubs/OgreStaticGeometry.h
TextListOverlayElement.o: ../depend_stubs/OgreInstancedGeometry.h
TextListOverlayElement.o: ../src/gfx/Clutter.h
TextListOverlayElement.o: ../depend_stubs/cfloat
TextListOverlayElement.o: ../depend_stubs/OgreMovableObject.h
TextListOverlayElement.o: ../depend_stubs/OgreVertexIndexData.h
TextListOverlayElement.o: ../depend_stubs/OgreMaterial.h
TextListOverlayElement.o: ../depend_stubs/OgreMesh.h
TextListOverlayElement.o: ../src/math_util.h ../depend_stubs/cmath
TextListOverlayElement.o: ../src/CacheFriendlyRangeSpaceSIMD.h
TextListOverlayElement.o: ../depend_stubs/map
TextListOverlayElement.o: ../src/SSEAllocator.h ../src/Streamer.h
TextListOverlayElement.o: ../depend_stubs/lauxlib.h
TextListOverlayElement.o: ../depend_stubs/lualib.h
TextListOverlayElement.o: ../src/GritClass.h
TextListOverlayElement.o: ../src/ExternalTable.h
TextListOverlayElement.o: ../src/math_util.h ../src/SharedPtr.h
TextListOverlayElement.o: ../depend_stubs/cstdlib
TextListOverlayElement.o: ../depend_stubs/functional
TextListOverlayElement.o: ../src/LuaPtr.h ../src/SplineTable.h
TextListOverlayElement.o: ../src/lua_util.h ../depend_stubs/limits
TextListOverlayElement.o: ../src/GritObject.h ../depend_stubs/set
TextListOverlayElement.o: ../src/Streamer.h
TextListOverlayElement.o: ../src/CacheFriendlyRangeSpaceSIMD.h
TextListOverlayElement.o: ../src/gfx/HUD.h ../depend_stubs/climits
TextListOverlayElement.o: ../depend_stubs/OgrePanelOverlayElement.h
TextListOverlayElement.o: ../depend_stubs/OgreOverlayElementFactory.h
TextListOverlayElement.o: ../depend_stubs/OgreOverlay.h
TextListOverlayElement.o: ../src/physics/PhysicsWorld.h
TextListOverlayElement.o: ../src/CentralisedLog.h
TextListOverlayElement.o: ../src/SharedPtr.h
TextListOverlayElement.o: ../depend_stubs/btBulletDynamicsCommon.h
TextListOverlayElement.o: ../src/physics/TColParser.h
TextListOverlayElement.o: ../src/physics/TColLexer
TextListOverlayElement.o: ../depend_stubs/istream
TextListOverlayElement.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
TextListOverlayElement.o: ../src/physics/TColLexer-token_ids
TextListOverlayElement.o: ../depend_stubs/cstdio
TextListOverlayElement.o: ../depend_stubs/quex/code_base/Token
TextListOverlayElement.o: ../depend_stubs/quex/code_base/definitions
TextListOverlayElement.o: ../depend_stubs/quex/code_base/buffer/Buffer
TextListOverlayElement.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/QuexMode
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/Analyser
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/Counter
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/Accumulator
TextListOverlayElement.o: ../depend_stubs/quex/code_base/TokenQueue
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/IncludeStack
TextListOverlayElement.o: ../depend_stubs/quex/code_base/temporary_macros_on
TextListOverlayElement.o: ../depend_stubs/quex/code_base/temporary_macros_off
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/constructor.i
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/Counter.i
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/Accumulator.i
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/mode_handling.i
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/misc.i
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/buffer_access.i
TextListOverlayElement.o: ../depend_stubs/quex/code_base/template/Analyser.i
TextListOverlayElement.o: ../src/physics/CollisionMesh.h
TextListOverlayElement.o: ../depend_stubs/OgreDataStream.h
TextListOverlayElement.o: ../src/sleep.h ../src/physics/LooseEnd.h
TextListOverlayElement.o: ../src/gfx/gfx.h ../src/gfx/HUD.h
TextListOverlayElement.o: ../src/vect_util.h
TextListOverlayElement.o: ../depend_stubs/OgreOctreeSceneManager.h
TextListOverlayElement.o: ../depend_stubs/OgreRenderWindow.h
gfx.o: ../depend_stubs/sstream ../depend_stubs/Ogre.h
gfx.o: ../depend_stubs/OgreFontManager.h
gfx.o: ../depend_stubs/OgreMeshManager.h
gfx.o: ../depend_stubs/OgreOverlayElementFactory.h
gfx.o: ../depend_stubs/OgreOctreeSceneManager.h
gfx.o: ../depend_stubs/OgreVector3.h
gfx.o: ../depend_stubs/OgreQuaternion.h
gfx.o: ../depend_stubs/OgreCustomCompositionPass.h
gfx.o: ../depend_stubs/OgreCompositor.h ../src/gfx/gfx.h
gfx.o: ../src/SharedPtr.h ../depend_stubs/cstdlib
gfx.o: ../depend_stubs/functional ../depend_stubs/string
gfx.o: ../src/gfx/HUD.h ../depend_stubs/vector
gfx.o: ../depend_stubs/climits
gfx.o: ../depend_stubs/OgrePanelOverlayElement.h
gfx.o: ../depend_stubs/OgreOverlay.h
gfx.o: ../depend_stubs/OgreOverlayManager.h
gfx.o: ../src/gfx/TextListOverlayElement.h
gfx.o: ../depend_stubs/OgrePrerequisites.h
gfx.o: ../depend_stubs/OgreOverlayElement.h
gfx.o: ../depend_stubs/OgreFont.h ../src/vect_util.h
gfx.o: ../depend_stubs/algorithm ../src/CentralisedLog.h
gfx.o: ../depend_stubs/iostream ../src/console_colour.h
gfx.o: ../src/math_util.h ../depend_stubs/cmath
gfx.o: ../depend_stubs/cfloat ../depend_stubs/OgreRoot.h
gfx.o: ../depend_stubs/OgreRenderWindow.h ../src/gfx/Clutter.h
gfx.o: ../depend_stubs/OgreMovableObject.h
gfx.o: ../depend_stubs/OgreVertexIndexData.h
gfx.o: ../depend_stubs/OgreMaterial.h ../depend_stubs/OgreMesh.h
gfx.o: ../src/CacheFriendlyRangeSpaceSIMD.h ../depend_stubs/map
gfx.o: ../src/SSEAllocator.h ../src/Streamer.h
gfx.o: ../depend_stubs/lua.h ../depend_stubs/lauxlib.h
gfx.o: ../depend_stubs/lualib.h ../src/GritClass.h
gfx.o: ../src/ExternalTable.h ../src/math_util.h ../src/LuaPtr.h
gfx.o: ../src/SplineTable.h ../src/lua_util.h
gfx.o: ../depend_stubs/limits ../src/GritObject.h
gfx.o: ../depend_stubs/set ../src/Streamer.h
gfx.o: ../src/BackgroundLoader.h ../src/vect_util.h
gfx.o: ../depend_stubs/list
gfx.o: ../depend_stubs/boost/thread/thread.hpp
gfx.o: ../depend_stubs/boost/thread/condition.hpp
gfx.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
gfx.o: ../src/CacheFriendlyRangeSpaceSIMD.h ../src/path_util.h
lua_wrappers_gfx.o: ../src/main.h ../depend_stubs/lua.h
lua_wrappers_gfx.o: ../src/Mouse.h ../depend_stubs/vector
lua_wrappers_gfx.o: ../src/Keyboard.h ../depend_stubs/string
lua_wrappers_gfx.o: ../src/BackgroundLoader.h ../src/vect_util.h
lua_wrappers_gfx.o: ../depend_stubs/algorithm
lua_wrappers_gfx.o: ../src/CentralisedLog.h
lua_wrappers_gfx.o: ../depend_stubs/iostream
lua_wrappers_gfx.o: ../depend_stubs/sstream
lua_wrappers_gfx.o: ../src/console_colour.h ../depend_stubs/list
lua_wrappers_gfx.o: ../depend_stubs/boost/thread/thread.hpp
lua_wrappers_gfx.o: ../depend_stubs/boost/thread/condition.hpp
lua_wrappers_gfx.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
lua_wrappers_gfx.o: ../src/BulletDebugDrawer.h
lua_wrappers_gfx.o: ../depend_stubs/OgreFrameListener.h
lua_wrappers_gfx.o: ../depend_stubs/OgreManualObject.h
lua_wrappers_gfx.o: ../depend_stubs/btBulletCollisionCommon.h
lua_wrappers_gfx.o: ../src/gfx/lua_userdata_dependency_tracker.h
lua_wrappers_gfx.o: ../depend_stubs/OgreStaticGeometry.h
lua_wrappers_gfx.o: ../depend_stubs/OgreInstancedGeometry.h
lua_wrappers_gfx.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
lua_wrappers_gfx.o: ../depend_stubs/OgreMovableObject.h
lua_wrappers_gfx.o: ../depend_stubs/OgreVertexIndexData.h
lua_wrappers_gfx.o: ../depend_stubs/OgreMaterial.h
lua_wrappers_gfx.o: ../depend_stubs/OgreMesh.h ../src/math_util.h
lua_wrappers_gfx.o: ../depend_stubs/cmath
lua_wrappers_gfx.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_gfx.o: ../depend_stubs/map ../src/SSEAllocator.h
lua_wrappers_gfx.o: ../src/Streamer.h ../depend_stubs/lauxlib.h
lua_wrappers_gfx.o: ../depend_stubs/lualib.h ../src/GritClass.h
lua_wrappers_gfx.o: ../src/ExternalTable.h ../src/math_util.h
lua_wrappers_gfx.o: ../src/SharedPtr.h ../depend_stubs/cstdlib
lua_wrappers_gfx.o: ../depend_stubs/functional ../src/LuaPtr.h
lua_wrappers_gfx.o: ../src/SplineTable.h ../src/lua_util.h
lua_wrappers_gfx.o: ../depend_stubs/limits ../src/GritObject.h
lua_wrappers_gfx.o: ../depend_stubs/set ../src/Streamer.h
lua_wrappers_gfx.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_gfx.o: ../src/gfx/HUD.h ../depend_stubs/climits
lua_wrappers_gfx.o: ../depend_stubs/OgrePanelOverlayElement.h
lua_wrappers_gfx.o: ../depend_stubs/OgreOverlayElementFactory.h
lua_wrappers_gfx.o: ../depend_stubs/OgreOverlay.h
lua_wrappers_gfx.o: ../depend_stubs/OgreOverlayManager.h
lua_wrappers_gfx.o: ../src/gfx/TextListOverlayElement.h
lua_wrappers_gfx.o: ../depend_stubs/OgrePrerequisites.h
lua_wrappers_gfx.o: ../depend_stubs/OgreOverlayElement.h
lua_wrappers_gfx.o: ../depend_stubs/OgreFont.h
lua_wrappers_gfx.o: ../src/physics/PhysicsWorld.h
lua_wrappers_gfx.o: ../src/CentralisedLog.h ../src/SharedPtr.h
lua_wrappers_gfx.o: ../depend_stubs/btBulletDynamicsCommon.h
lua_wrappers_gfx.o: ../src/physics/TColParser.h
lua_wrappers_gfx.o: ../src/physics/TColLexer
lua_wrappers_gfx.o: ../depend_stubs/istream
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
lua_wrappers_gfx.o: ../src/physics/TColLexer-token_ids
lua_wrappers_gfx.o: ../depend_stubs/cstdio
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/Token
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/definitions
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/buffer/Buffer
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/QuexMode
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/Analyser
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/Counter
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/Accumulator
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/TokenQueue
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/IncludeStack
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/temporary_macros_on
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/temporary_macros_off
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/constructor.i
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/Counter.i
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/Accumulator.i
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/mode_handling.i
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/misc.i
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/buffer_access.i
lua_wrappers_gfx.o: ../depend_stubs/quex/code_base/template/Analyser.i
lua_wrappers_gfx.o: ../src/physics/CollisionMesh.h
lua_wrappers_gfx.o: ../depend_stubs/OgreDataStream.h
lua_wrappers_gfx.o: ../src/sleep.h ../src/physics/LooseEnd.h
lua_wrappers_gfx.o: ../src/ExternalTable.h ../src/LuaPtr.h
lua_wrappers_gfx.o: ../src/path_util.h ../src/gfx/gfx.h
lua_wrappers_gfx.o: ../src/gfx/HUD.h ../src/vect_util.h
lua_wrappers_gfx.o: ../depend_stubs/OgreRoot.h
lua_wrappers_gfx.o: ../depend_stubs/OgreOctreeSceneManager.h
lua_wrappers_gfx.o: ../depend_stubs/OgreRenderWindow.h
lua_wrappers_gfx.o: ../src/gfx/lua_wrappers_gfx.h
lua_wrappers_gfx.o: ../src/lua_wrappers_common.h
lua_wrappers_gfx.o: ../depend_stubs/OgreException.h
lua_wrappers_gfx.o: ../src/lua_wrappers_primitives.h
lua_wrappers_gfx.o: ../src/gfx/lua_wrappers_scnmgr.h
lua_wrappers_gfx.o: ../depend_stubs/OgrePixelFormat.h
lua_wrappers_gfx.o: ../src/gfx/lua_wrappers_mobj.h
lua_wrappers_gfx.o: ../depend_stubs/OgreLight.h
lua_wrappers_gfx.o: ../depend_stubs/OgreFontManager.h
lua_wrappers_gfx.o: ../depend_stubs/OgreHighLevelGpuProgramManager.h
lua_wrappers_gfx.o: ../depend_stubs/OgreTextureManager.h
lua_wrappers_gfx.o: ../depend_stubs/OgreSkeletonManager.h
lua_wrappers_gfx.o: ../depend_stubs/OgreMeshManager.h
lua_wrappers_gfx.o: ../depend_stubs/OgreGpuProgramManager.h
lua_wrappers_gfx.o: ../src/gfx/lua_wrappers_material.h
lua_wrappers_gfx.o: ../depend_stubs/OgreCommon.h
lua_wrappers_gfx.o: ../src/gfx/lua_wrappers_mesh.h
lua_wrappers_gfx.o: ../src/gfx/lua_wrappers_gpuprog.h
lua_wrappers_gfx.o: ../depend_stubs/OgreGpuProgram.h
lua_wrappers_gfx.o: ../src/gfx/lua_wrappers_tex.h
lua_wrappers_gfx.o: ../depend_stubs/OgreTexture.h
lua_wrappers_gfx.o: ../src/gfx/lua_wrappers_render.h
lua_wrappers_gfx.o: ../src/gfx/lua_wrappers_hud.h
lua_wrappers_gpuprog.o: ../depend_stubs/OgreVector3.h
lua_wrappers_gpuprog.o: ../depend_stubs/OgreVector4.h
lua_wrappers_gpuprog.o: ../depend_stubs/OgreCgProgram.h
lua_wrappers_gpuprog.o: ../depend_stubs/OgreGLSLProgram.h
lua_wrappers_gpuprog.o: ../depend_stubs/OgreGLSLGpuProgram.h
lua_wrappers_gpuprog.o: ../src/gfx/lua_wrappers_gpuprog.h
lua_wrappers_gpuprog.o: ../depend_stubs/OgreGpuProgram.h
lua_wrappers_gpuprog.o: ../src/lua_wrappers_common.h
lua_wrappers_gpuprog.o: ../depend_stubs/string
lua_wrappers_gpuprog.o: ../depend_stubs/OgreException.h
lua_wrappers_gpuprog.o: ../depend_stubs/lua.h
lua_wrappers_gpuprog.o: ../depend_stubs/lauxlib.h
lua_wrappers_gpuprog.o: ../depend_stubs/lualib.h ../src/lua_util.h
lua_wrappers_gpuprog.o: ../depend_stubs/limits
lua_wrappers_gpuprog.o: ../depend_stubs/vector
lua_wrappers_gpuprog.o: ../src/CentralisedLog.h
lua_wrappers_gpuprog.o: ../depend_stubs/iostream
lua_wrappers_gpuprog.o: ../depend_stubs/sstream
lua_wrappers_gpuprog.o: ../src/console_colour.h ../src/math_util.h
lua_wrappers_hud.o: ../src/gfx/HUD.h ../depend_stubs/vector
lua_wrappers_hud.o: ../depend_stubs/climits
lua_wrappers_hud.o: ../depend_stubs/OgrePanelOverlayElement.h
lua_wrappers_hud.o: ../depend_stubs/OgreOverlayElementFactory.h
lua_wrappers_hud.o: ../depend_stubs/OgreOverlay.h
lua_wrappers_hud.o: ../depend_stubs/OgreOverlayManager.h
lua_wrappers_hud.o: ../src/gfx/TextListOverlayElement.h
lua_wrappers_hud.o: ../depend_stubs/OgrePrerequisites.h
lua_wrappers_hud.o: ../depend_stubs/OgreOverlayElement.h
lua_wrappers_hud.o: ../depend_stubs/OgreFont.h
lua_wrappers_hud.o: ../src/gfx/lua_wrappers_hud.h
lua_wrappers_hud.o: ../src/lua_wrappers_common.h
lua_wrappers_hud.o: ../depend_stubs/string
lua_wrappers_hud.o: ../depend_stubs/OgreException.h
lua_wrappers_hud.o: ../depend_stubs/lua.h
lua_wrappers_hud.o: ../depend_stubs/lauxlib.h
lua_wrappers_hud.o: ../depend_stubs/lualib.h ../src/lua_util.h
lua_wrappers_hud.o: ../depend_stubs/limits ../src/CentralisedLog.h
lua_wrappers_hud.o: ../depend_stubs/iostream
lua_wrappers_hud.o: ../depend_stubs/sstream
lua_wrappers_hud.o: ../src/console_colour.h ../src/math_util.h
lua_wrappers_hud.o: ../src/gfx/lua_wrappers_material.h
lua_wrappers_hud.o: ../depend_stubs/OgreCommon.h
lua_wrappers_material.o: ../depend_stubs/OgreMaterial.h
lua_wrappers_material.o: ../depend_stubs/OgreTechnique.h
lua_wrappers_material.o: ../depend_stubs/OgrePass.h
lua_wrappers_material.o: ../depend_stubs/OgreTextureUnitState.h
lua_wrappers_material.o: ../src/gfx/lua_wrappers_material.h
lua_wrappers_material.o: ../depend_stubs/OgreCommon.h
lua_wrappers_material.o: ../src/lua_wrappers_common.h
lua_wrappers_material.o: ../depend_stubs/string
lua_wrappers_material.o: ../depend_stubs/OgreException.h
lua_wrappers_material.o: ../depend_stubs/lua.h
lua_wrappers_material.o: ../depend_stubs/lauxlib.h
lua_wrappers_material.o: ../depend_stubs/lualib.h
lua_wrappers_material.o: ../src/lua_util.h ../depend_stubs/limits
lua_wrappers_material.o: ../depend_stubs/vector
lua_wrappers_material.o: ../src/CentralisedLog.h
lua_wrappers_material.o: ../depend_stubs/iostream
lua_wrappers_material.o: ../depend_stubs/sstream
lua_wrappers_material.o: ../src/console_colour.h
lua_wrappers_material.o: ../src/math_util.h
lua_wrappers_mesh.o: ../depend_stubs/OgreSubMesh.h
lua_wrappers_mesh.o: ../depend_stubs/OgreMaterialManager.h
lua_wrappers_mesh.o: ../src/gfx/lua_wrappers_mesh.h
lua_wrappers_mesh.o: ../depend_stubs/OgreMesh.h
lua_wrappers_mesh.o: ../src/lua_wrappers_common.h
lua_wrappers_mesh.o: ../depend_stubs/string
lua_wrappers_mesh.o: ../depend_stubs/OgreException.h
lua_wrappers_mesh.o: ../depend_stubs/lua.h
lua_wrappers_mesh.o: ../depend_stubs/lauxlib.h
lua_wrappers_mesh.o: ../depend_stubs/lualib.h ../src/lua_util.h
lua_wrappers_mesh.o: ../depend_stubs/limits ../depend_stubs/vector
lua_wrappers_mesh.o: ../src/CentralisedLog.h
lua_wrappers_mesh.o: ../depend_stubs/iostream
lua_wrappers_mesh.o: ../depend_stubs/sstream
lua_wrappers_mesh.o: ../src/console_colour.h ../src/math_util.h
lua_wrappers_mesh.o: ../src/gfx/lua_wrappers_material.h
lua_wrappers_mesh.o: ../depend_stubs/OgreCommon.h
lua_wrappers_mobj.o: ../depend_stubs/OgreMovableObject.h
lua_wrappers_mobj.o: ../depend_stubs/OgreManualObject.h
lua_wrappers_mobj.o: ../depend_stubs/OgreEntity.h
lua_wrappers_mobj.o: ../depend_stubs/OgreInstancedGeometry.h
lua_wrappers_mobj.o: ../depend_stubs/OgreStaticGeometry.h
lua_wrappers_mobj.o: ../depend_stubs/OgreCamera.h
lua_wrappers_mobj.o: ../depend_stubs/OgreMaterialManager.h
lua_wrappers_mobj.o: ../depend_stubs/OgreSubEntity.h
lua_wrappers_mobj.o: ../depend_stubs/OgreMeshManager.h
lua_wrappers_mobj.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
lua_wrappers_mobj.o: ../depend_stubs/OgreVertexIndexData.h
lua_wrappers_mobj.o: ../depend_stubs/OgreMaterial.h
lua_wrappers_mobj.o: ../depend_stubs/OgreMesh.h ../src/math_util.h
lua_wrappers_mobj.o: ../depend_stubs/cmath ../src/CentralisedLog.h
lua_wrappers_mobj.o: ../depend_stubs/iostream
lua_wrappers_mobj.o: ../depend_stubs/sstream
lua_wrappers_mobj.o: ../src/console_colour.h
lua_wrappers_mobj.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_mobj.o: ../depend_stubs/map ../depend_stubs/vector
lua_wrappers_mobj.o: ../depend_stubs/algorithm
lua_wrappers_mobj.o: ../src/SSEAllocator.h ../src/Streamer.h
lua_wrappers_mobj.o: ../depend_stubs/lua.h
lua_wrappers_mobj.o: ../depend_stubs/lauxlib.h
lua_wrappers_mobj.o: ../depend_stubs/lualib.h ../src/GritClass.h
lua_wrappers_mobj.o: ../depend_stubs/string ../src/ExternalTable.h
lua_wrappers_mobj.o: ../src/math_util.h ../src/SharedPtr.h
lua_wrappers_mobj.o: ../depend_stubs/cstdlib
lua_wrappers_mobj.o: ../depend_stubs/functional ../src/LuaPtr.h
lua_wrappers_mobj.o: ../src/SplineTable.h ../src/lua_util.h
lua_wrappers_mobj.o: ../depend_stubs/limits ../src/GritObject.h
lua_wrappers_mobj.o: ../depend_stubs/set ../src/Streamer.h
lua_wrappers_mobj.o: ../src/BackgroundLoader.h ../src/vect_util.h
lua_wrappers_mobj.o: ../depend_stubs/list
lua_wrappers_mobj.o: ../depend_stubs/boost/thread/thread.hpp
lua_wrappers_mobj.o: ../depend_stubs/boost/thread/condition.hpp
lua_wrappers_mobj.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
lua_wrappers_mobj.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_mobj.o: ../src/main.h ../src/Mouse.h
lua_wrappers_mobj.o: ../src/Keyboard.h ../src/BulletDebugDrawer.h
lua_wrappers_mobj.o: ../depend_stubs/OgreFrameListener.h
lua_wrappers_mobj.o: ../depend_stubs/btBulletCollisionCommon.h
lua_wrappers_mobj.o: ../src/gfx/lua_userdata_dependency_tracker.h
lua_wrappers_mobj.o: ../src/gfx/HUD.h ../depend_stubs/climits
lua_wrappers_mobj.o: ../depend_stubs/OgrePanelOverlayElement.h
lua_wrappers_mobj.o: ../depend_stubs/OgreOverlayElementFactory.h
lua_wrappers_mobj.o: ../depend_stubs/OgreOverlay.h
lua_wrappers_mobj.o: ../depend_stubs/OgreOverlayManager.h
lua_wrappers_mobj.o: ../src/gfx/TextListOverlayElement.h
lua_wrappers_mobj.o: ../depend_stubs/OgrePrerequisites.h
lua_wrappers_mobj.o: ../depend_stubs/OgreOverlayElement.h
lua_wrappers_mobj.o: ../depend_stubs/OgreFont.h
lua_wrappers_mobj.o: ../src/physics/PhysicsWorld.h
lua_wrappers_mobj.o: ../src/CentralisedLog.h ../src/SharedPtr.h
lua_wrappers_mobj.o: ../depend_stubs/btBulletDynamicsCommon.h
lua_wrappers_mobj.o: ../src/physics/TColParser.h
lua_wrappers_mobj.o: ../src/physics/TColLexer
lua_wrappers_mobj.o: ../depend_stubs/istream
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
lua_wrappers_mobj.o: ../src/physics/TColLexer-token_ids
lua_wrappers_mobj.o: ../depend_stubs/cstdio
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/Token
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/definitions
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/buffer/Buffer
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/QuexMode
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/Analyser
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/Counter
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/Accumulator
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/TokenQueue
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/IncludeStack
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/temporary_macros_on
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/temporary_macros_off
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/constructor.i
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/Counter.i
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/Accumulator.i
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/mode_handling.i
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/misc.i
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/buffer_access.i
lua_wrappers_mobj.o: ../depend_stubs/quex/code_base/template/Analyser.i
lua_wrappers_mobj.o: ../src/physics/CollisionMesh.h
lua_wrappers_mobj.o: ../depend_stubs/OgreDataStream.h
lua_wrappers_mobj.o: ../src/sleep.h ../src/physics/LooseEnd.h
lua_wrappers_mobj.o: ../src/gfx/gfx.h ../src/gfx/HUD.h
lua_wrappers_mobj.o: ../src/vect_util.h ../depend_stubs/OgreRoot.h
lua_wrappers_mobj.o: ../depend_stubs/OgreOctreeSceneManager.h
lua_wrappers_mobj.o: ../depend_stubs/OgreRenderWindow.h
lua_wrappers_mobj.o: ../src/gfx/lua_wrappers_mobj.h
lua_wrappers_mobj.o: ../src/lua_wrappers_common.h
lua_wrappers_mobj.o: ../depend_stubs/OgreException.h
lua_wrappers_mobj.o: ../depend_stubs/OgreLight.h
lua_wrappers_mobj.o: ../src/gfx/lua_wrappers_scnmgr.h
lua_wrappers_mobj.o: ../depend_stubs/OgrePixelFormat.h
lua_wrappers_mobj.o: ../src/lua_wrappers_primitives.h
lua_wrappers_mobj.o: ../src/gfx/lua_wrappers_material.h
lua_wrappers_mobj.o: ../depend_stubs/OgreCommon.h
lua_wrappers_mobj.o: ../src/gfx/lua_wrappers_mesh.h
lua_wrappers_mobj.o: ../src/gfx/lua_userdata_dependency_tracker.h
lua_wrappers_mobj.o: ../src/gfx/lua_userdata_dependency_tracker_funcs.h
lua_wrappers_render.o: ../depend_stubs/OgreViewport.h
lua_wrappers_render.o: ../depend_stubs/OgreRenderTarget.h
lua_wrappers_render.o: ../depend_stubs/OgreRenderWindow.h
lua_wrappers_render.o: ../depend_stubs/OgreRenderTexture.h
lua_wrappers_render.o: ../depend_stubs/OgreCompositorManager.h
lua_wrappers_render.o: ../src/main.h ../depend_stubs/lua.h
lua_wrappers_render.o: ../src/Mouse.h ../depend_stubs/vector
lua_wrappers_render.o: ../src/Keyboard.h ../depend_stubs/string
lua_wrappers_render.o: ../src/BackgroundLoader.h
lua_wrappers_render.o: ../src/vect_util.h
lua_wrappers_render.o: ../depend_stubs/algorithm
lua_wrappers_render.o: ../src/CentralisedLog.h
lua_wrappers_render.o: ../depend_stubs/iostream
lua_wrappers_render.o: ../depend_stubs/sstream
lua_wrappers_render.o: ../src/console_colour.h
lua_wrappers_render.o: ../depend_stubs/list
lua_wrappers_render.o: ../depend_stubs/boost/thread/thread.hpp
lua_wrappers_render.o: ../depend_stubs/boost/thread/condition.hpp
lua_wrappers_render.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
lua_wrappers_render.o: ../src/BulletDebugDrawer.h
lua_wrappers_render.o: ../depend_stubs/OgreFrameListener.h
lua_wrappers_render.o: ../depend_stubs/OgreManualObject.h
lua_wrappers_render.o: ../depend_stubs/btBulletCollisionCommon.h
lua_wrappers_render.o: ../src/gfx/lua_userdata_dependency_tracker.h
lua_wrappers_render.o: ../depend_stubs/OgreStaticGeometry.h
lua_wrappers_render.o: ../depend_stubs/OgreInstancedGeometry.h
lua_wrappers_render.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
lua_wrappers_render.o: ../depend_stubs/OgreMovableObject.h
lua_wrappers_render.o: ../depend_stubs/OgreVertexIndexData.h
lua_wrappers_render.o: ../depend_stubs/OgreMaterial.h
lua_wrappers_render.o: ../depend_stubs/OgreMesh.h
lua_wrappers_render.o: ../src/math_util.h ../depend_stubs/cmath
lua_wrappers_render.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_render.o: ../depend_stubs/map ../src/SSEAllocator.h
lua_wrappers_render.o: ../src/Streamer.h ../depend_stubs/lauxlib.h
lua_wrappers_render.o: ../depend_stubs/lualib.h ../src/GritClass.h
lua_wrappers_render.o: ../src/ExternalTable.h ../src/math_util.h
lua_wrappers_render.o: ../src/SharedPtr.h ../depend_stubs/cstdlib
lua_wrappers_render.o: ../depend_stubs/functional ../src/LuaPtr.h
lua_wrappers_render.o: ../src/SplineTable.h ../src/lua_util.h
lua_wrappers_render.o: ../depend_stubs/limits ../src/GritObject.h
lua_wrappers_render.o: ../depend_stubs/set ../src/Streamer.h
lua_wrappers_render.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_render.o: ../src/gfx/HUD.h ../depend_stubs/climits
lua_wrappers_render.o: ../depend_stubs/OgrePanelOverlayElement.h
lua_wrappers_render.o: ../depend_stubs/OgreOverlayElementFactory.h
lua_wrappers_render.o: ../depend_stubs/OgreOverlay.h
lua_wrappers_render.o: ../depend_stubs/OgreOverlayManager.h
lua_wrappers_render.o: ../src/gfx/TextListOverlayElement.h
lua_wrappers_render.o: ../depend_stubs/OgrePrerequisites.h
lua_wrappers_render.o: ../depend_stubs/OgreOverlayElement.h
lua_wrappers_render.o: ../depend_stubs/OgreFont.h
lua_wrappers_render.o: ../src/physics/PhysicsWorld.h
lua_wrappers_render.o: ../src/CentralisedLog.h ../src/SharedPtr.h
lua_wrappers_render.o: ../depend_stubs/btBulletDynamicsCommon.h
lua_wrappers_render.o: ../src/physics/TColParser.h
lua_wrappers_render.o: ../src/physics/TColLexer
lua_wrappers_render.o: ../depend_stubs/istream
lua_wrappers_render.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
lua_wrappers_render.o: ../src/physics/TColLexer-token_ids
lua_wrappers_render.o: ../depend_stubs/cstdio
lua_wrappers_render.o: ../depend_stubs/quex/code_base/Token
lua_wrappers_render.o: ../depend_stubs/quex/code_base/definitions
lua_wrappers_render.o: ../depend_stubs/quex/code_base/buffer/Buffer
lua_wrappers_render.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/QuexMode
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/Analyser
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/Counter
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/Accumulator
lua_wrappers_render.o: ../depend_stubs/quex/code_base/TokenQueue
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/IncludeStack
lua_wrappers_render.o: ../depend_stubs/quex/code_base/temporary_macros_on
lua_wrappers_render.o: ../depend_stubs/quex/code_base/temporary_macros_off
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/constructor.i
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/Counter.i
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/Accumulator.i
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/mode_handling.i
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/misc.i
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/buffer_access.i
lua_wrappers_render.o: ../depend_stubs/quex/code_base/template/Analyser.i
lua_wrappers_render.o: ../src/physics/CollisionMesh.h
lua_wrappers_render.o: ../depend_stubs/OgreDataStream.h
lua_wrappers_render.o: ../src/sleep.h ../src/physics/LooseEnd.h
lua_wrappers_render.o: ../src/gfx/gfx.h ../src/gfx/HUD.h
lua_wrappers_render.o: ../src/vect_util.h
lua_wrappers_render.o: ../depend_stubs/OgreRoot.h
lua_wrappers_render.o: ../depend_stubs/OgreOctreeSceneManager.h
lua_wrappers_render.o: ../src/gfx/lua_wrappers_render.h
lua_wrappers_render.o: ../src/lua_wrappers_common.h
lua_wrappers_render.o: ../depend_stubs/OgreException.h
lua_wrappers_render.o: ../src/gfx/lua_wrappers_tex.h
lua_wrappers_render.o: ../depend_stubs/OgreTexture.h
lua_wrappers_render.o: ../src/gfx/lua_wrappers_mobj.h
lua_wrappers_render.o: ../depend_stubs/OgreLight.h
lua_wrappers_render.o: ../src/gfx/lua_userdata_dependency_tracker_funcs.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreSceneManager.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreSceneNode.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreEntity.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreManualObject.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreShadowCameraSetup.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreShadowCameraSetupFocused.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreShadowCameraSetupLiSPSM.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreShadowCameraSetupPSSM.h
lua_wrappers_scnmgr.o: ../src/main.h ../depend_stubs/lua.h
lua_wrappers_scnmgr.o: ../src/Mouse.h ../depend_stubs/vector
lua_wrappers_scnmgr.o: ../src/Keyboard.h ../depend_stubs/string
lua_wrappers_scnmgr.o: ../src/BackgroundLoader.h
lua_wrappers_scnmgr.o: ../src/vect_util.h
lua_wrappers_scnmgr.o: ../depend_stubs/algorithm
lua_wrappers_scnmgr.o: ../src/CentralisedLog.h
lua_wrappers_scnmgr.o: ../depend_stubs/iostream
lua_wrappers_scnmgr.o: ../depend_stubs/sstream
lua_wrappers_scnmgr.o: ../src/console_colour.h
lua_wrappers_scnmgr.o: ../depend_stubs/list
lua_wrappers_scnmgr.o: ../depend_stubs/boost/thread/thread.hpp
lua_wrappers_scnmgr.o: ../depend_stubs/boost/thread/condition.hpp
lua_wrappers_scnmgr.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
lua_wrappers_scnmgr.o: ../src/BulletDebugDrawer.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreFrameListener.h
lua_wrappers_scnmgr.o: ../depend_stubs/btBulletCollisionCommon.h
lua_wrappers_scnmgr.o: ../src/gfx/lua_userdata_dependency_tracker.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreStaticGeometry.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreInstancedGeometry.h
lua_wrappers_scnmgr.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
lua_wrappers_scnmgr.o: ../depend_stubs/OgreMovableObject.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreVertexIndexData.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreMaterial.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreMesh.h
lua_wrappers_scnmgr.o: ../src/math_util.h ../depend_stubs/cmath
lua_wrappers_scnmgr.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_scnmgr.o: ../depend_stubs/map ../src/SSEAllocator.h
lua_wrappers_scnmgr.o: ../src/Streamer.h ../depend_stubs/lauxlib.h
lua_wrappers_scnmgr.o: ../depend_stubs/lualib.h ../src/GritClass.h
lua_wrappers_scnmgr.o: ../src/ExternalTable.h ../src/math_util.h
lua_wrappers_scnmgr.o: ../src/SharedPtr.h ../depend_stubs/cstdlib
lua_wrappers_scnmgr.o: ../depend_stubs/functional ../src/LuaPtr.h
lua_wrappers_scnmgr.o: ../src/SplineTable.h ../src/lua_util.h
lua_wrappers_scnmgr.o: ../depend_stubs/limits ../src/GritObject.h
lua_wrappers_scnmgr.o: ../depend_stubs/set ../src/Streamer.h
lua_wrappers_scnmgr.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_scnmgr.o: ../src/gfx/HUD.h ../depend_stubs/climits
lua_wrappers_scnmgr.o: ../depend_stubs/OgrePanelOverlayElement.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreOverlayElementFactory.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreOverlay.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreOverlayManager.h
lua_wrappers_scnmgr.o: ../src/gfx/TextListOverlayElement.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgrePrerequisites.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreOverlayElement.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreFont.h
lua_wrappers_scnmgr.o: ../src/physics/PhysicsWorld.h
lua_wrappers_scnmgr.o: ../src/CentralisedLog.h ../src/SharedPtr.h
lua_wrappers_scnmgr.o: ../depend_stubs/btBulletDynamicsCommon.h
lua_wrappers_scnmgr.o: ../src/physics/TColParser.h
lua_wrappers_scnmgr.o: ../src/physics/TColLexer
lua_wrappers_scnmgr.o: ../depend_stubs/istream
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
lua_wrappers_scnmgr.o: ../src/physics/TColLexer-token_ids
lua_wrappers_scnmgr.o: ../depend_stubs/cstdio
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/Token
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/definitions
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/buffer/Buffer
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/QuexMode
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/Analyser
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/Counter
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/Accumulator
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/TokenQueue
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/IncludeStack
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/temporary_macros_on
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/temporary_macros_off
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/constructor.i
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/Counter.i
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/Accumulator.i
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/mode_handling.i
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/misc.i
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/buffer_access.i
lua_wrappers_scnmgr.o: ../depend_stubs/quex/code_base/template/Analyser.i
lua_wrappers_scnmgr.o: ../src/physics/CollisionMesh.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreDataStream.h
lua_wrappers_scnmgr.o: ../src/sleep.h ../src/physics/LooseEnd.h
lua_wrappers_scnmgr.o: ../src/gfx/gfx.h ../src/gfx/HUD.h
lua_wrappers_scnmgr.o: ../src/vect_util.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreRoot.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreOctreeSceneManager.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreRenderWindow.h
lua_wrappers_scnmgr.o: ../src/gfx/lua_wrappers_scnmgr.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgrePixelFormat.h
lua_wrappers_scnmgr.o: ../src/lua_wrappers_common.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreException.h
lua_wrappers_scnmgr.o: ../src/gfx/lua_wrappers_mobj.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreLight.h
lua_wrappers_scnmgr.o: ../src/lua_wrappers_primitives.h
lua_wrappers_scnmgr.o: ../src/gfx/lua_wrappers_material.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreCommon.h
lua_wrappers_scnmgr.o: ../src/gfx/lua_wrappers_tex.h
lua_wrappers_scnmgr.o: ../depend_stubs/OgreTexture.h
lua_wrappers_scnmgr.o: ../src/gfx/lua_userdata_dependency_tracker_funcs.h
lua_wrappers_tex.o: ../depend_stubs/OgreTexture.h
lua_wrappers_tex.o: ../depend_stubs/OgreHardwarePixelBuffer.h
lua_wrappers_tex.o: ../src/gfx/lua_wrappers_tex.h
lua_wrappers_tex.o: ../src/lua_wrappers_common.h
lua_wrappers_tex.o: ../depend_stubs/string
lua_wrappers_tex.o: ../depend_stubs/OgreException.h
lua_wrappers_tex.o: ../depend_stubs/lua.h
lua_wrappers_tex.o: ../depend_stubs/lauxlib.h
lua_wrappers_tex.o: ../depend_stubs/lualib.h ../src/lua_util.h
lua_wrappers_tex.o: ../depend_stubs/limits ../depend_stubs/vector
lua_wrappers_tex.o: ../src/CentralisedLog.h
lua_wrappers_tex.o: ../depend_stubs/iostream
lua_wrappers_tex.o: ../depend_stubs/sstream
lua_wrappers_tex.o: ../src/console_colour.h ../src/math_util.h
lua_wrappers_tex.o: ../src/gfx/lua_wrappers_render.h
lua_wrappers_tex.o: ../src/gfx/lua_wrappers_scnmgr.h
lua_wrappers_tex.o: ../depend_stubs/OgrePixelFormat.h
ray.o: ../depend_stubs/float.h ../src/gfx/ray.h
ray.o: ../depend_stubs/Ogre.h ../depend_stubs/OgreSceneQuery.h
CollisionMesh.o: ../depend_stubs/iostream
CollisionMesh.o: ../depend_stubs/cstdlib ../depend_stubs/ctime
CollisionMesh.o: ../depend_stubs/OgreException.h
CollisionMesh.o: ../depend_stubs/OgreTimer.h
CollisionMesh.o: ../depend_stubs/OgreResourceGroupManager.h
CollisionMesh.o: ../depend_stubs/LinearMath/btGeometryUtil.h
CollisionMesh.o: ../depend_stubs/BulletCollision/Gimpact/btGImpactShape.h
CollisionMesh.o: ../depend_stubs/BulletCollision/CollisionDispatch/btInternalEdgeUtility.h
CollisionMesh.o: ../src/CentralisedLog.h ../src/path_util.h
CollisionMesh.o: ../depend_stubs/vector ../depend_stubs/string
CollisionMesh.o: ../src/physics/CollisionMesh.h
CollisionMesh.o: ../depend_stubs/map
CollisionMesh.o: ../depend_stubs/OgreDataStream.h
CollisionMesh.o: ../src/sleep.h ../src/SharedPtr.h
CollisionMesh.o: ../src/physics/TColParser.h
CollisionMesh.o: ../src/math_util.h ../depend_stubs/cmath
CollisionMesh.o: ../depend_stubs/cfloat
CollisionMesh.o: ../src/CentralisedLog.h
CollisionMesh.o: ../depend_stubs/sstream
CollisionMesh.o: ../src/console_colour.h
CollisionMesh.o: ../src/physics/TColLexer
CollisionMesh.o: ../depend_stubs/istream
CollisionMesh.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
CollisionMesh.o: ../src/physics/TColLexer-token_ids
CollisionMesh.o: ../depend_stubs/cstdio
CollisionMesh.o: ../depend_stubs/quex/code_base/Token
CollisionMesh.o: ../depend_stubs/quex/code_base/definitions
CollisionMesh.o: ../depend_stubs/quex/code_base/buffer/Buffer
CollisionMesh.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
CollisionMesh.o: ../depend_stubs/quex/code_base/template/QuexMode
CollisionMesh.o: ../depend_stubs/quex/code_base/template/Analyser
CollisionMesh.o: ../depend_stubs/quex/code_base/template/Counter
CollisionMesh.o: ../depend_stubs/quex/code_base/template/Accumulator
CollisionMesh.o: ../depend_stubs/quex/code_base/TokenQueue
CollisionMesh.o: ../depend_stubs/quex/code_base/template/IncludeStack
CollisionMesh.o: ../depend_stubs/quex/code_base/temporary_macros_on
CollisionMesh.o: ../depend_stubs/quex/code_base/temporary_macros_off
CollisionMesh.o: ../depend_stubs/quex/code_base/template/constructor.i
CollisionMesh.o: ../depend_stubs/quex/code_base/template/Counter.i
CollisionMesh.o: ../depend_stubs/quex/code_base/template/Accumulator.i
CollisionMesh.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
CollisionMesh.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
CollisionMesh.o: ../depend_stubs/quex/code_base/template/mode_handling.i
CollisionMesh.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
CollisionMesh.o: ../depend_stubs/quex/code_base/template/misc.i
CollisionMesh.o: ../depend_stubs/quex/code_base/template/buffer_access.i
CollisionMesh.o: ../depend_stubs/quex/code_base/template/Analyser.i
CollisionMesh.o: ../src/physics/LooseEnd.h
CollisionMesh.o: ../depend_stubs/btBulletCollisionCommon.h
CollisionMesh.o: ../src/physics/PhysicsWorld.h
PhysicsWorld.o: ../depend_stubs/BulletCollision/Gimpact/btGImpactCollisionAlgorithm.h
PhysicsWorld.o: ../depend_stubs/BulletCollision/CollisionDispatch/btInternalEdgeUtility.h
PhysicsWorld.o: ../src/GritObject.h ../depend_stubs/map
PhysicsWorld.o: ../depend_stubs/vector ../depend_stubs/set
PhysicsWorld.o: ../depend_stubs/string ../src/SharedPtr.h
PhysicsWorld.o: ../depend_stubs/cstdlib
PhysicsWorld.o: ../depend_stubs/functional ../src/Streamer.h
PhysicsWorld.o: ../src/ExternalTable.h ../depend_stubs/lua.h
PhysicsWorld.o: ../depend_stubs/lauxlib.h ../src/math_util.h
PhysicsWorld.o: ../src/LuaPtr.h ../src/SplineTable.h
PhysicsWorld.o: ../src/BackgroundLoader.h ../src/vect_util.h
PhysicsWorld.o: ../depend_stubs/algorithm
PhysicsWorld.o: ../src/CentralisedLog.h
PhysicsWorld.o: ../depend_stubs/iostream
PhysicsWorld.o: ../depend_stubs/sstream
PhysicsWorld.o: ../src/console_colour.h ../depend_stubs/list
PhysicsWorld.o: ../depend_stubs/boost/thread/thread.hpp
PhysicsWorld.o: ../depend_stubs/boost/thread/condition.hpp
PhysicsWorld.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
PhysicsWorld.o: ../src/main.h ../src/Mouse.h ../src/Keyboard.h
PhysicsWorld.o: ../src/BulletDebugDrawer.h
PhysicsWorld.o: ../depend_stubs/OgreFrameListener.h
PhysicsWorld.o: ../depend_stubs/OgreManualObject.h
PhysicsWorld.o: ../depend_stubs/btBulletCollisionCommon.h
PhysicsWorld.o: ../src/gfx/lua_userdata_dependency_tracker.h
PhysicsWorld.o: ../depend_stubs/OgreStaticGeometry.h
PhysicsWorld.o: ../depend_stubs/OgreInstancedGeometry.h
PhysicsWorld.o: ../src/gfx/Clutter.h ../depend_stubs/cfloat
PhysicsWorld.o: ../depend_stubs/OgreMovableObject.h
PhysicsWorld.o: ../depend_stubs/OgreVertexIndexData.h
PhysicsWorld.o: ../depend_stubs/OgreMaterial.h
PhysicsWorld.o: ../depend_stubs/OgreMesh.h ../src/math_util.h
PhysicsWorld.o: ../depend_stubs/cmath
PhysicsWorld.o: ../src/CacheFriendlyRangeSpaceSIMD.h
PhysicsWorld.o: ../src/SSEAllocator.h ../src/Streamer.h
PhysicsWorld.o: ../depend_stubs/lualib.h ../src/GritClass.h
PhysicsWorld.o: ../src/lua_util.h ../depend_stubs/limits
PhysicsWorld.o: ../src/GritObject.h
PhysicsWorld.o: ../src/CacheFriendlyRangeSpaceSIMD.h
PhysicsWorld.o: ../src/gfx/HUD.h ../depend_stubs/climits
PhysicsWorld.o: ../depend_stubs/OgrePanelOverlayElement.h
PhysicsWorld.o: ../depend_stubs/OgreOverlayElementFactory.h
PhysicsWorld.o: ../depend_stubs/OgreOverlay.h
PhysicsWorld.o: ../depend_stubs/OgreOverlayManager.h
PhysicsWorld.o: ../src/gfx/TextListOverlayElement.h
PhysicsWorld.o: ../depend_stubs/OgrePrerequisites.h
PhysicsWorld.o: ../depend_stubs/OgreOverlayElement.h
PhysicsWorld.o: ../depend_stubs/OgreFont.h
PhysicsWorld.o: ../src/physics/PhysicsWorld.h
PhysicsWorld.o: ../src/CentralisedLog.h ../src/SharedPtr.h
PhysicsWorld.o: ../depend_stubs/btBulletDynamicsCommon.h
PhysicsWorld.o: ../src/physics/TColParser.h
PhysicsWorld.o: ../src/physics/TColLexer
PhysicsWorld.o: ../depend_stubs/istream
PhysicsWorld.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
PhysicsWorld.o: ../src/physics/TColLexer-token_ids
PhysicsWorld.o: ../depend_stubs/cstdio
PhysicsWorld.o: ../depend_stubs/quex/code_base/Token
PhysicsWorld.o: ../depend_stubs/quex/code_base/definitions
PhysicsWorld.o: ../depend_stubs/quex/code_base/buffer/Buffer
PhysicsWorld.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/QuexMode
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/Analyser
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/Counter
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/Accumulator
PhysicsWorld.o: ../depend_stubs/quex/code_base/TokenQueue
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/IncludeStack
PhysicsWorld.o: ../depend_stubs/quex/code_base/temporary_macros_on
PhysicsWorld.o: ../depend_stubs/quex/code_base/temporary_macros_off
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/constructor.i
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/Counter.i
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/Accumulator.i
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/mode_handling.i
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/misc.i
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/buffer_access.i
PhysicsWorld.o: ../depend_stubs/quex/code_base/template/Analyser.i
PhysicsWorld.o: ../src/physics/CollisionMesh.h
PhysicsWorld.o: ../depend_stubs/OgreDataStream.h
PhysicsWorld.o: ../src/sleep.h ../src/physics/LooseEnd.h
PhysicsWorld.o: ../src/physics/PhysicsWorld.h
PhysicsWorld.o: ../src/physics/lua_wrappers_physics.h
TColParser.o: ../depend_stubs/iostream ../depend_stubs/cstdlib
TColParser.o: ../src/math_util.h ../depend_stubs/cmath
TColParser.o: ../depend_stubs/cfloat ../src/CentralisedLog.h
TColParser.o: ../depend_stubs/sstream ../src/console_colour.h
TColParser.o: ../src/path_util.h ../depend_stubs/vector
TColParser.o: ../depend_stubs/string ../src/physics/TColLexer
TColParser.o: ../depend_stubs/map ../depend_stubs/istream
TColParser.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
TColParser.o: ../src/physics/TColLexer-token_ids
TColParser.o: ../depend_stubs/cstdio
TColParser.o: ../depend_stubs/quex/code_base/Token
TColParser.o: ../depend_stubs/quex/code_base/definitions
TColParser.o: ../depend_stubs/quex/code_base/buffer/Buffer
TColParser.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
TColParser.o: ../depend_stubs/quex/code_base/template/QuexMode
TColParser.o: ../depend_stubs/quex/code_base/template/Analyser
TColParser.o: ../depend_stubs/quex/code_base/template/Counter
TColParser.o: ../depend_stubs/quex/code_base/template/Accumulator
TColParser.o: ../depend_stubs/quex/code_base/TokenQueue
TColParser.o: ../depend_stubs/quex/code_base/template/IncludeStack
TColParser.o: ../depend_stubs/quex/code_base/temporary_macros_on
TColParser.o: ../depend_stubs/quex/code_base/temporary_macros_off
TColParser.o: ../depend_stubs/quex/code_base/template/constructor.i
TColParser.o: ../depend_stubs/quex/code_base/template/Counter.i
TColParser.o: ../depend_stubs/quex/code_base/template/Accumulator.i
TColParser.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
TColParser.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
TColParser.o: ../depend_stubs/quex/code_base/template/mode_handling.i
TColParser.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
TColParser.o: ../depend_stubs/quex/code_base/template/misc.i
TColParser.o: ../depend_stubs/quex/code_base/template/buffer_access.i
TColParser.o: ../depend_stubs/quex/code_base/template/Analyser.i
TColParser.o: ../src/physics/TColParser.h
lua_wrappers_physics.o: ../depend_stubs/limits
lua_wrappers_physics.o: ../depend_stubs/OgreSceneManager.h
lua_wrappers_physics.o: ../src/gfx/Clutter.h
lua_wrappers_physics.o: ../depend_stubs/cfloat
lua_wrappers_physics.o: ../depend_stubs/OgreMovableObject.h
lua_wrappers_physics.o: ../depend_stubs/OgreVertexIndexData.h
lua_wrappers_physics.o: ../depend_stubs/OgreMaterial.h
lua_wrappers_physics.o: ../depend_stubs/OgreMesh.h
lua_wrappers_physics.o: ../src/math_util.h
lua_wrappers_physics.o: ../depend_stubs/cmath
lua_wrappers_physics.o: ../src/CentralisedLog.h
lua_wrappers_physics.o: ../depend_stubs/iostream
lua_wrappers_physics.o: ../depend_stubs/sstream
lua_wrappers_physics.o: ../src/console_colour.h
lua_wrappers_physics.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_physics.o: ../depend_stubs/map
lua_wrappers_physics.o: ../depend_stubs/vector
lua_wrappers_physics.o: ../depend_stubs/algorithm
lua_wrappers_physics.o: ../src/SSEAllocator.h
lua_wrappers_physics.o: ../src/Streamer.h
lua_wrappers_physics.o: ../depend_stubs/lua.h
lua_wrappers_physics.o: ../depend_stubs/lauxlib.h
lua_wrappers_physics.o: ../depend_stubs/lualib.h
lua_wrappers_physics.o: ../src/GritClass.h
lua_wrappers_physics.o: ../depend_stubs/string
lua_wrappers_physics.o: ../src/ExternalTable.h
lua_wrappers_physics.o: ../src/math_util.h ../src/SharedPtr.h
lua_wrappers_physics.o: ../depend_stubs/cstdlib
lua_wrappers_physics.o: ../depend_stubs/functional
lua_wrappers_physics.o: ../src/LuaPtr.h ../src/SplineTable.h
lua_wrappers_physics.o: ../src/lua_util.h ../src/GritObject.h
lua_wrappers_physics.o: ../depend_stubs/set ../src/Streamer.h
lua_wrappers_physics.o: ../src/BackgroundLoader.h
lua_wrappers_physics.o: ../src/vect_util.h
lua_wrappers_physics.o: ../depend_stubs/list
lua_wrappers_physics.o: ../depend_stubs/boost/thread/thread.hpp
lua_wrappers_physics.o: ../depend_stubs/boost/thread/condition.hpp
lua_wrappers_physics.o: ../depend_stubs/boost/thread/recursive_mutex.hpp
lua_wrappers_physics.o: ../src/CacheFriendlyRangeSpaceSIMD.h
lua_wrappers_physics.o: ../src/lua_wrappers_gritobj.h
lua_wrappers_physics.o: ../src/lua_wrappers_common.h
lua_wrappers_physics.o: ../depend_stubs/OgreException.h
lua_wrappers_physics.o: ../src/main.h ../src/Mouse.h
lua_wrappers_physics.o: ../src/Keyboard.h
lua_wrappers_physics.o: ../src/BulletDebugDrawer.h
lua_wrappers_physics.o: ../depend_stubs/OgreFrameListener.h
lua_wrappers_physics.o: ../depend_stubs/OgreManualObject.h
lua_wrappers_physics.o: ../depend_stubs/btBulletCollisionCommon.h
lua_wrappers_physics.o: ../src/gfx/lua_userdata_dependency_tracker.h
lua_wrappers_physics.o: ../depend_stubs/OgreStaticGeometry.h
lua_wrappers_physics.o: ../depend_stubs/OgreInstancedGeometry.h
lua_wrappers_physics.o: ../src/gfx/Clutter.h ../src/gfx/HUD.h
lua_wrappers_physics.o: ../depend_stubs/climits
lua_wrappers_physics.o: ../depend_stubs/OgrePanelOverlayElement.h
lua_wrappers_physics.o: ../depend_stubs/OgreOverlayElementFactory.h
lua_wrappers_physics.o: ../depend_stubs/OgreOverlay.h
lua_wrappers_physics.o: ../depend_stubs/OgreOverlayManager.h
lua_wrappers_physics.o: ../src/gfx/TextListOverlayElement.h
lua_wrappers_physics.o: ../depend_stubs/OgrePrerequisites.h
lua_wrappers_physics.o: ../depend_stubs/OgreOverlayElement.h
lua_wrappers_physics.o: ../depend_stubs/OgreFont.h
lua_wrappers_physics.o: ../src/physics/PhysicsWorld.h
lua_wrappers_physics.o: ../src/CentralisedLog.h
lua_wrappers_physics.o: ../src/SharedPtr.h
lua_wrappers_physics.o: ../depend_stubs/btBulletDynamicsCommon.h
lua_wrappers_physics.o: ../src/physics/TColParser.h
lua_wrappers_physics.o: ../src/physics/TColLexer
lua_wrappers_physics.o: ../depend_stubs/istream
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/compatibility/inttypes.h
lua_wrappers_physics.o: ../src/physics/TColLexer-token_ids
lua_wrappers_physics.o: ../depend_stubs/cstdio
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/Token
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/definitions
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/buffer/Buffer
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/buffer/plain/BufferFiller_Plain
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/QuexMode
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/Analyser
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/Counter
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/Accumulator
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/TokenQueue
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/IncludeStack
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/temporary_macros_on
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/temporary_macros_off
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/constructor.i
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/Counter.i
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/Accumulator.i
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/token_receiving_via_queue.i
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/token_sending_via_queue.i
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/mode_handling.i
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/IncludeStack.i
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/misc.i
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/buffer_access.i
lua_wrappers_physics.o: ../depend_stubs/quex/code_base/template/Analyser.i
lua_wrappers_physics.o: ../src/physics/CollisionMesh.h
lua_wrappers_physics.o: ../depend_stubs/OgreDataStream.h
lua_wrappers_physics.o: ../src/sleep.h
lua_wrappers_physics.o: ../src/physics/LooseEnd.h
lua_wrappers_physics.o: ../src/gfx/gfx.h ../src/gfx/HUD.h
lua_wrappers_physics.o: ../src/vect_util.h
lua_wrappers_physics.o: ../depend_stubs/OgreRoot.h
lua_wrappers_physics.o: ../depend_stubs/OgreOctreeSceneManager.h
lua_wrappers_physics.o: ../depend_stubs/OgreRenderWindow.h
lua_wrappers_physics.o: ../src/gfx/lua_wrappers_scnmgr.h
lua_wrappers_physics.o: ../depend_stubs/OgrePixelFormat.h
lua_wrappers_physics.o: ../src/gfx/lua_wrappers_mesh.h
lua_wrappers_physics.o: ../src/gfx/lua_wrappers_mobj.h
lua_wrappers_physics.o: ../depend_stubs/OgreLight.h
lua_wrappers_physics.o: ../src/physics/PhysicsWorld.h
lua_wrappers_physics.o: ../src/physics/lua_wrappers_physics.h
