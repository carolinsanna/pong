--[[
    GD50 - Pong Remake

    -- Programa principal --
    Autora: Carolina Dias 
    @carolinsanna
    carolina.dias@one.com.br

    Originalmente desenvolvido pela Atari em 1972.
    Consiste em duas raquetes controladas por dois jogadores,
    cujo objetivo é fazer pontos na quadra do adversário,
    rebatendo a bola de forma que o adversário não consiga rebate-la de volta.
    O primeiro a atingir a pontuação 10, vence!

    Esta versão foi desenvolvida mais próxima do sistema NES do que 
    do sistema original do Atari 2600 em termos de resolução.
]]

-- push é uma lib que permite renderizar uma resolução virtual menor do que a 
-- que é realmente, utilizada para dar um aspecto mais retrô.

push = require 'push'
WINDOW_WIDTH = 1280 
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest') --esse método impede o efeito de blur na renderização

    smallFont = love.graphics.newFont('font.ttf', 8)
    scoreFont = love.graphics.newFont('font.ttf', 32)

    love.graphics.setFont(smallFont)

    --love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, { --seria assim sem utilizar a lib push
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

playerOneScore = 0
playerTwoScore = 0

playerOneY = 30 
playerTwoY = VIRTUAL_HEIGHT - 50
end

function love.update(dt)
    --movimento do player 1 
    if love.keyboard.isDown('w') then
        playerOneY = playerOneY + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then 
        playerOneY = playerOneY + PADDLE_SPEED * dt
    end

    --movimento do player 2 
    if love.keyboard.isDown('up') then
        playerTwoY = playerTwoY + -PADDLE_SPEED * dt 
    elseif love.keyboard.isDown('down') then 
        playerTwoY = playerTwoY + PADDLE_SPEED * dt 
    end 
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end
end

function love.draw()
    push:apply('start')

    love.graphics.clear(40/225, 45/225, 52/255, 255/255)
    
 --[[   love.graphics.printf(
        'Hello Pong!',
        0,
        --WINDOW_HEIGHT / 2-6,
        --WINDOW_WIDTH,
        VIRTUAL_HEIGHT / 2-6,
        VIRTUAL_WIDTH,
        'center'
    )]]

    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    love.graphics.rectangle('fill', 10, 30, 5, 20) --('preenchido', x-axis, y-axis, width, heigth)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, VIRTUAL_HEIGHT - 50, 5, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)


    push:apply('end')
end
