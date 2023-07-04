# BepInEx Mod Template for Derail Valley

TODO: What is this template repository? How do I use it?

## Improving MOD_NAME

It's recommended to have a section describing how to contribute to the project. At the very least, it's important to include any environment setup that may be necessary to build the project successfully. The following section is provided as a starting point for such environment setup documentation. Update it according to your project's specific details and needs.

### Environment Setup

After cloning the repository, some setup is required in order to successfully build the mod DLLs. You will need to create a new [Directory.Build.targets](https://learn.microsoft.com/en-us/visualstudio/msbuild/customize-your-build?view=vs-2022) file to specify your reference paths. This file will be located in the main directory, next to MOD_NAME.sln.

Below is an example of the necessary structure. When creating your targets file, you will need to replace the reference paths with the corresponding folders on your system. Make sure to include the semicolons **between** each of the paths and no semicolon after the last path. Also note that shortcuts that you might use in file explorer—such as %ProgramFiles%—won't be expanded in these paths. You need to use full, absolute paths.
```xml
<Project>
	<PropertyGroup>
		<ReferencePath>
			X:\SteamLibrary\steamapps\common\Derail Valley\DerailValley_Data\Managed\;
			X:\SteamLibrary\steamapps\common\Derail Valley\DerailValley_Data\Managed\UnityModManager\
		</ReferencePath>
		<AssemblySearchPaths>$(AssemblySearchPaths);$(ReferencePath);</AssemblySearchPaths>
	</PropertyGroup>
</Project>
```

### Publishing

TODO: How to publish a mod for BepInEx? Directory structure, files, etc.
