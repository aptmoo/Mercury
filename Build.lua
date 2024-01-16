-- premake5.lua
workspace "Mercury"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject ""

-- Workspace-wide build options for MSVC
filter "system:windows"
   buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }

OutputDir = "/%{cfg.buildcfg}/"

group "Core"
   include "Core/Build-Core.lua"
group ""