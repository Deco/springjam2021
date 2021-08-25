local conf = require 'conf'

local emmyCore = nil
if conf.isDebug then
    emmyCore = require 'emmy_core'
    emmyCore.tcpListen('localhost', 9966)
    if conf.waitForDebugger then
        print('Waiting for debugger...')
        emmyCore.waitIDE()
        print('Debugger connected!')
    end
    --emmyCore.breakHere()
end

function nop()
end

return {
    brk = emmyCore and emmyCore.breakHere or nop,
}

