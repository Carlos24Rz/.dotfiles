local uv = vim.loop

local M = {}

local file_types = {
  "*.c",
}

local buffer_handles = {}

local function clearTimeout(buffer)
  if not buffer_handles[buffer] then
    return
  end

  local timer = buffer_handles[buffer]

  timer:stop()
  timer:close()

  buffer_handles[buffer] = nil
end

local function setTimeout(time, buffer)
  local timer = uv.new_timer()

  timer:start(time, 0, vim.schedule_wrap(function()
    vim.api.nvim_buf_call(buffer, function()
      vim.cmd.write()
    end)

    timer:stop()
    timer:close()

    buffer_handles[buffer] = nil
  end))

  buffer_handles[buffer] = timer
end

M.setup = function(time)
  vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI",}, {
    pattern = file_types,
    callback = function(event)
      clearTimeout(event.buf)
      setTimeout(time, event.buf)
    end
  })
end

return M

