-- local ws_diagnostic_counts = function(_, buffer)
--     local messages = {}
--     local ws_diagnostics = vim.lsp.diagnostic

--     local error_count = ws_diagnostics.get_count(buffer, "Error")
--     local hint_count = ws_diagnostics.get_count(buffer, "Hint")
--     local warnings_count = ws_diagnostics.get_count(buffer, "Warning")
--     local info_count = ws_diagnostics.get_count(buffer, "Information")
--     local x = "⬤"
--     table.insert(messages, 'E ' .. error_count )
--     table.insert(messages, 'W ' .. warnings_count )
--     table.insert(messages, 'H ' .. hint_count)
--     table.insert(messages, 'I ' .. info_count )

--     return table.concat(messages, " ")
-- end

-- local buffer = vim.nvim_get_current_buf
-- local msg = ws_diagnostic_counts(1, buffer)

-- print(msg)

local function repr(tab,...)
    if type(tab) ~= 'table' then return tab end
    local i, s, is_list, is_nest = 1, '', true, select('#', ...)
    local pre, sep, value_type = '    ', '\n'
    if is_nest ~= 0 then
        pre, sep = '', ' '
    end
    for k,v in pairs(tab) do
        if i > 5 then
            s = s..','..sep..pre..'...'
            break
        end
        if i ~= 1 then
            s = s..','
        end
        s = s..sep..pre
        if k ~= i then
            is_list = false
            s = s..'"'..k..'": '
        end
        value_type = type(v)
        if value_type == 'string' then
            v = '"'..v..'"'
        elseif value_type == 'table' then
            v = repr(v, 1)
        end
        s = s..v
        i = i + 1
    end
    if is_list then
        s = '['..s..sep..']'
    else
        s = '{'..s..sep..'}'
    end
    return s
end

function mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, sep) do
                table.insert(t, str)
        end
        return t
end

io.write("age (year/month/day): ")
local age_year = io.read( "l")

local current_year = os.date("%Y")
local current_month = os.date("%m")
local current_day = os.date("%d")


local Usr_year, Usr_month, Usr_day = table.unpack(mysplit(age_year, "%d+"))

if tonumber(Usr_day) > tonumber(current_day) then
    current_day = current_day + 30
    current_month = current_month - 1
end
print('day: '..current_day - Usr_day)
if tonumber(Usr_month) > tonumber(current_month) then
    current_month = current_month + 1
    current_year = current_year - 1
end
print('month: '..current_month - Usr_month)
print('year: '..current_year - Usr_year)

