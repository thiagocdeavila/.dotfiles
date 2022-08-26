local status_flutter_tools, flutter_tools = pcall(require, 'flutter_tools')
if (not status_flutter_tools) then return end

flutter_tools.setup {}
