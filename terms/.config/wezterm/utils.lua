local M = {}

M.startWith = function(str, start)
  return str:sub(1, #start) == start
end

M.exec = function(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

M.file_exists = function(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

M.lines_from = function(file)
  if not M.file_exists(file) then
    return {}
  end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

M.etc_os_name = function()
  local lines = M.lines_from('/etc/os-release')
  local os_name_key = "NAME="

  local res = ""

  for _, line in pairs(lines) do
    if M.startWith(line, os_name_key) then
      res = line:sub(#os_name_key + 1)
      res = string.gsub(res, '"', '')
      break
    end
  end

  return res:lower()
end

M.uname_s = function()
  return M.exec("uname -s", false):lower()
end

M.UNKNOWN_OS = "_UNKNOWN_"

M.os_name = function()

  local uname = M.uname_s()
  if uname == "darwin" then
    return uname, "macos"
  end

  if uname == "linux" then
    local linux_os = M.etc_os_name()
    if linux_os then
      return uname, linux_os
    end
    return uname, M.UNKNOWN_OS
  end

  return M.UNKNOWN_OS, M.UNKNOWN_OS
end

return M
