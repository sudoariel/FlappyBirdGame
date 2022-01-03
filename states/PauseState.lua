PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    self.bird = params['bird']
    self.pipePairs = params['pipePairs']
    self.timer = params['timer']
    self.score = params['score']
    self.lastY = params['lastY']
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play', {
            bird = self.bird,
            pipePairs = self.pipePairs,
            timer = self.timer,
            score = self.score,
            lastY = self.lastY
        })
    end
end

function PauseState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game paused!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to continue...', 0, 160, VIRTUAL_WIDTH, 'center')
end