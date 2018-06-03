local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()							npcHandler:onThink() 						end
-- OTServ event handling functions end


-- Configuração da conversa NPC
local 
	--	#-Carmelian
	--º Colocar x-y-z no travelNode
	travelNode = keywordHandler:addKeyword({'Carmelian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Custa 1000gps pelo transporte, deseja continuar para o destino escolhido?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 1000, destination = {x = 0, y = 0, z = 0}})
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Entendemos, boa sorte em sua caminhada.'})

	--	#-Frost Island
	--º Colocar x-y-z no travelNode
	travelNode = keywordHandler:addKeyword({'Frost Island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Custa 1000gps pelo transporte, deseja continuar para o destino escolhido?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 1000, destination = {x = 0, y = 0, z = 0}})
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Entendemos, boa sorte em sua caminhada.'})
 
-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())