
local left, right = 0, 1
local top, mid = 0, 1

local half_width, full_width = 2, 1
local half_height, full_height = 2, 1

local function move_win(xx, yy, ww, hh)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local max = win:screen():frame()
        f.x = max.x + (max.w/2) * xx
        f.y = max.y + (max.h/2) * yy
        f.w = max.w / ww
        f.h = max.h / hh
        win:setFrame(f)
    end
end

local function more_left_padding()
    print('hello this is more left pading.')
    
    local win = hs.window.focusedWindow()
    local f = win:frame()
    if f.x > 0 then 
        f.x = f.x - 10
    end
    f.w = f.w + 10
    win:setFrame(f)
end

local function more_right_padding()
    print('hello this is more right pading.')
    
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.w = f.w + 10
    win:setFrame(f)
end

local function more_up_padding()
    print('hello this is more up pading.')
    
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.y = f.y - 10
    f.h = f.h + 10
    win:setFrame(f)
end

local function more_down_padding()
    print('hello this is more up pading.')
    
    local win = hs.window.focusedWindow()
    local f = win:frame()
    f.h = f.h + 10
    win:setFrame(f)
end

local function send_window_prev_screen()
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():previous()
    win:moveToScreen(nextScreen)
end

local function send_window_next_screen()
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():next()
    win:moveToScreen(nextScreen)
end

return {
    ['default']      = move_win((left + right)/2, top, half_width, full_height),
    ['left_bottom']  = move_win(left, mid, half_width, half_height),
    ['bottom']       = move_win(left, mid, full_width, half_height),
    ['right_bottom'] = move_win(right, mid, half_width, half_height),
    ['left']         = move_win(left, top, half_width, full_height),
    ['full_screen']  = move_win(left, top, full_width, full_height),
    ['right']        = move_win(right, top, half_width, full_height),
    ['left_top']     = move_win(left, top, half_width, half_height),
    ['top']          = move_win(left, top, full_width, half_height),
    ['right_top']    = move_win(right, top, half_width, half_height),
    ['prev_screen']  = send_window_prev_screen,
    ['next_screen']  = send_window_next_screen,
    ['more_left_padding'] = more_left_padding,
    ['more_right_padding'] = more_right_padding,
    ['more_up_padding'] = more_up_padding,
    ['more_down_padding'] = more_down_padding,
}

