--[[
    Implementation of python-like range, works only with the for loop at the moment.
--]]

local function sgn(x)
    assert(type(x) == "number", "Argument 1 must be a number")

    if x < 0 then
        return -1
    elseif x > 0 then
        return 1
    else
        return 0
    end
end

local function range(a, b, increment)
    local start_idx = a
    local end_idx = b

    if b == nil then
        start_idx = 0
        end_idx = a
    end

    increment = increment or 1

    assert(increment ~= 0, "Increment must be different from 0")
    assert(sgn(end_idx - start_idx) == sgn(increment), "Incorrect increment")

    local function step(t, index)
        assert(start_idx ~= end_idx, "Range is empty")

        if index == nil then
            return start_idx, start_idx
        end
        local new_index = index + increment

        if sgn(increment) == -1 then
            if new_index <= end_idx then
                return
            end
        else
            if new_index >= end_idx then
                return
            end
        end

        return new_index, new_index
    end

    return step
end

for n in range(4) do
    print(n)
end
