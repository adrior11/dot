local function macos_is_dark()
	return os.execute("defaults read -g AppleInterfaceStyle 2>/dev/null | grep -q Dark") == 0
end

if macos_is_dark() then
	vim.o.background = "dark"
else
	vim.o.background = "light"
end
