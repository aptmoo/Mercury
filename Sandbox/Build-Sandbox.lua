project "App"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    targetdir "Binaries/%{cfg.buildcfg}"
    staticruntime "off"

    files
    {
        "Source/**.h", "Source/**.cpp",
        "Dependencies/**.h", "Dependencies/**.cpp",
    }

    includedirs
    {
        "Source",
        "Dependencies",

        -- Include Core
        "../Core/Source"
    }

    links
    {
        "Core"
    }

    targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
    objdir ("../Intermediates/" .. OutputDir .. "/%{prj.name}")

    filter "system:windows"
        systemversion "latest"
        defines { "BUILD_WINDOWS" }

    filter "system:linux"
        systemversion "latest"
        defines { "BUILD_LINUX" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"