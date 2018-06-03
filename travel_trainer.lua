local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local thinkMsg = {
	"A natureza faz poucas pessoas fortes, mas esforço e treinamento fazem muitas.",
	"O maior benefício de treinamento não vem de se aprender algo novo, mas de se fazer melhor aquilo que já fazemos bem.",
	"Quanto mais você suar no treino, menos irá sangrar na batalha.",
	"Seu limite fica bem depois daquela vontade de parar.",
	"Se o treinamento for duro, o combate será fácil.",
	"Não é o mais forte que sobrevive, nem o mais inteligente, mas o que melhor se adapta às mudanças.",
	"Um jogador pode ser crucial em uma equipe, mas apenas um jogador, não forma uma equipe.",
	"Ninguém está derrotado até que desista em sua mente.",
	"Se for para DESISTIR desista de ser FRACO!",
	"As dificuldades foram feitas para serem vencidas.",
	"Eu tive sorte, mas só depois que comecei a treinar dez horas por dia.",
	"Nunca é tarde demais para você ser aquilo que deveria ter sido.",
	"Os vencedores tem metas, os perdedores desculpas.",
	"Não existe treino milagroso. O que existe é FOCO, DEDICAÇÃO e PERSISTÊNCIA.",
	"Se você quer se destacar, não seja diferente, seja excelente.",
	"Parte do treinamento de um jogador consiste em expandir os limites de sua mente.",
	"A recompensa de amanhã é a determinação de hoje.",
	"Se você batalhou para chegar ao topo, reserve um tempo para apreciar a vista.",
	"Você nunca sabe a força que tem, até que a sua única alternativa é ser forte.",
	"O caminho para vencer é continuar tentando.",
	"Só desiste da luta quem desconhece o sabor da vitória.",
	"Acredite sempre! E se disserem que você não é capaz, use todas as suas forças para mostrar que eles estão errados.",
	"Com o treinamento vem o aperfeiçoamento.",
	"A vida é um treinamento contínuo, se parar, o adversário facilmente te vencerá.",
	"O treinamento transforma as boas intenções em bons resultados.",
	"O que não te desafia, não te faz mudar.",
	"Tenha um propósito e você não vai precisar de motivação.",
	"Não deixe para Segunda o treino de Sexta.",
	"Para ser um campeão, você tem que acreditar em si mesmo quando ninguém mais acredita.",
	"Vencedor não é aquele que sempre vence, mas sim aquele que nunca para de lutar.",
	"Somos do tamanho que nos permitimos ser... Sonhe, trabalhe, lute, insista, permita-se.",
	"O sacrifício é o intervalo entre o seu objetivo e a sua glória.",
	"É melhor recusar a isca do que se debater na armadilha.",
	"Treine até que os seus ídolos se tornem rivais.",
	"Cada um tem sua própria posição e papel a desempenhar. Os senhores tem a sua própria missão que somente os senhores podem concretizar.",
	"Nunca reclame de sua vida, ela é o resultado das escolhas que você fez.",
	"Você é mais forte do que pensa e será mais feliz do que imagina.",
	"Quando você está determinado a fazer algo, a crítica negativa se torna um fator de motivação.",
	"Se a vida não ficar mais fácil, trate de ficar mais forte.",
	"Toda conquista começa com a decisão de tentar.",
	"Só você pode determinar suas limitações, por isso não desista mesmo que tudo pareça perdido.",
	"Para ter algo que você nunca teve, é preciso fazer algo que você nunca fez.",
	"Durma com idéias, acorde com atitudes!",
	"Para conhecermos os amigos é necessário passar pelo sucesso e pela desgraça. No sucesso verificamos a quantidade e na desgraça, a qualidade.",
	"Quando pensar em desistir, lembre-se porque começou.",
	"Persista! Se tudo fosse fácil, qualquer um conseguiria.",
	"Se você não gosta de recomeçar, pare de desistir.",
	"Assuma riscos, se você ganhar será felix, se perder ficará mais esperto.",
	"E ai, já treinou hoje? Ta esperando o que?!",
	"Se você sempre fizer o que lhe interessa, pelo menos uma pessoa estará satisfeita.",
	"Ninguém acredita em você? Ótimo! Surpreenda.",
	"Quando você realmente quer, você não desiste, não abre mão.",
	"Teste os seus limites, enfrente os seus medos e não deixe que nada impeça você de pelo menos tentar!",
	"A melhor maneira de começar é parar de falar e começar a fazer.",
	"Se não puder se destacar pelo talento, vença pelo esforço.",
	"É melhor você tentar algo, vê-lo não funcionar e aprender com isso, do que não fazer nada.",
	"Não viva para que sua presença seja notada, mas para que sua falta seja sentida.",
	"Seja mais forte do que sua melhor desculpa",
	"Eu faço porque eu posso, eu posso porque eu quero, eu quero porque alguém disse que eu não conseguiria!"
	
}

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink()							npcHandler:onThink() 						end
-- OTServ event handling functions end

function thinkCallback(cid) 
 	local rand = math.random(200) 
 	if thinkMsg[rand] then 
			npcHandler:say(thinkMsg[rand]) 
	end 
	return true 
end 

-- Configuração da conversa NPC
local 
	--	#-Training Room
	--º Colocar x-y-z no travelNode
	travelNode = keywordHandler:addKeyword({'Training Room'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Não esqueça de comprar suprimentos para o treino, deseja continuar para o destino escolhido?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 1000, destination = {x = 0, y = 0, z = 0}})
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Entendemos, boa sorte em sua caminhada.'})
 
-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback) 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())