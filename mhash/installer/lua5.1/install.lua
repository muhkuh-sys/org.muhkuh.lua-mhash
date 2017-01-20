local t = ...
local strPlatform = t:get_platform()


if strPlatform=='Windows_x86' then
	t:install('windows_x86/lua_plugins/mhash.dll', '${install_lua_cpath}/')

elseif strPlatform=='Windows_x64' then
	t:install('windows_x64/lua_plugins/mhash.dll', '${install_lua_cpath}/')

end

return true
