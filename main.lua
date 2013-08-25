local StickLib   = require("lib_analog_stick")
 
local screenW = display.contentWidth
local screenH = display.contentHeight
local Text        = display.newText( " ", screenW*.6, screenH-20, native.systemFont, 15 )
local bg =  display.newImage('ground.png')
local health = 100
   local scoreText1 
    local scoreText
    local gameScore = 0
    local newScore
    local dsrawatGroup = display.newGroup()
local startButtonListeners = {}
local shield = {}
local teleport = {}

local Ship      = display.newImage('ship.png')
Ship.x          = 50
Ship.y          = 400
		

			local timeLimit = 10
timeLeft = display.newText(timeLimit, 150, 20, native.systemFontBold, 30)
timeLeft:setTextColor(255,0,0)


local function timerDown()
   timeLimit = timeLimit-1
   timeLeft.text = timeLimit
     
	if (timeLimit < 1) then
	 display.newImage('lost.png')
	
	 
	 end
     end
	 timer.performWithDelay(1000,timerDown,timeLimit)

	 local function hasCollidedCircle( Ship, coins )
   if ( Ship == nil ) then  
      return false
   end
   if ( coins == nil ) then  
      return false
   end

   local dx = Ship.x - coins.x
   local dy = Ship.y - coins.y

   local distance = math.sqrt( dx*dx + dy*dy )
   local objectSize = (coins.contentWidth/2) + (Ship.contentWidth/2)

   if ( distance < objectSize ) then
      return true
   end
   return false
end				
				
	 local function hasCollidedCircle2( Ship, danger )
   if ( Ship == nil ) then  
      return false
   end
   if ( danger == nil ) then  
      return false
   end

   local dx = Ship.x - danger.x
   local dy = Ship.y - danger.y

   local distance = math.sqrt( dx*dx + dy*dy )
   local objectSize = (danger.contentWidth/2) + (Ship.contentWidth/2)

   if ( distance < objectSize ) then
      return true
   end
   return false
end			
				
				
				 local comma_value = function(amount)
        local formatted = amount
            while true do  
            formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
            if (k==0) then
                  break
            end
          end
        
        return formatted
    end
				
		 local setScore = function( scoreNum )
        local newScore = scoreNum
        
        gameScore = newScore
        
        if gameScore < 0 then gameScore = 0; end
        
        scoreText.text = comma_value(gameScore)
        scoreText.xScale = 0.5; scoreText.yScale = 0.5  
        scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 15
        scoreText.y = 20
    end

scoreText = display.newText( "0", 470, 22, "AmericanTypewriter-Bold", 64 )
         scoreText:setTextColor( 217, 233, 33)    
        scoreText.text = gameScore
        scoreText.xScale = .5; 
        scoreText.yScale = .5   
        scoreText.x = (480 - (scoreText.contentWidth * 0.5)) - 15
        scoreText.y = 20
        dsrawatGroup:insert( scoreText )
  scoreText1 = display.newText( "SCORE", 470, 22, "AmericanTypewriter-Bold", 64 )
            scoreText1:setTextColor( 217, 233, 33)    
             scoreText1.xScale = .5; 
            scoreText1.yScale = .5    
            scoreText1.x = (380 - (scoreText.contentWidth * 0.5)) - 15
            scoreText1.y = 20
            dsrawatGroup:insert( scoreText1 )
   
   
  
local coins = {}
for i = 1,14 do
   coins[i] = display.newImage('green.png')

   coins[i].x = math.random( 15, display.contentWidth - 15 ) + 100
   coins[i].y = math.random( 15, display.contentHeight - 15 ) - 200
end
	local danger = {}
for i = 1,4 do
   danger[i]= display.newImage('red.png')

   danger[i].x = math.random( 15, display.contentWidth - 15 ) + 100
   danger[i].y = math.random( 15, display.contentHeight - 15) - 200
end
local function gameLoop( event )
   for i = 1,table.maxn( coins ) do
      if ( coins[i] and hasCollidedCircle( Ship, coins[i]) ) then
	  
	  coins[i].x = 1000
  local newScore = gameScore + 1 -- put as many as score you want to add replacing '10'
            setScore( newScore )
	   if(gameScore > 10) then
   
   display.newImage('win.png')
   
   end
	  
      end
   end
   return true
end

local function gameLoop2( event )
   for i = 1,table.maxn( danger ) do
      if ( danger[i] and hasCollidedCircle( Ship, danger[i]) ) then
	
	  danger[i].x = 1000
display.newImage('lost.png')
	
      end
   end
   return true
end


Runtime:addEventListener( "enterFrame", gameLoop )
		
Runtime:addEventListener( "enterFrame", gameLoop2 )
		
		 
 
-- CREATE ANALOG STICK
MyStick = StickLib.NewStick( 
        {
        x             = 350,
        y             = 1205,
        thumbSize     = 30,
        borderSize    = 36, 
        snapBackSpeed = .75, 
        R             = 255,
        G             = 255,
        B             = 255
        } )
----------------------------------------------------------------
-- MAIN LOOP
----------------------------------------------------------------
local function main( event )
        
        -- MOVE THE SHIP
        MyStick:move(Ship, 7.0, true)
 
        -- SHOW STICK INFO
        Text.text = "ANGLE = "..MyStick:getAngle().."   DISTANCE = "..math.ceil(MyStick:getDistance()).."   PERCENT = "..math.ceil(MyStick:getPercent()*100).."%"
        
		
local shield = display.newImage('shield.png', 15, 1137)	
local teleport = display.newImage('speedboost.png', 600, 1137)	
				
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		end

 
Runtime:addEventListener( "enterFrame", main )