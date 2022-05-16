require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_habilidadercl()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setName("habilidadercl");
    obj:setHeight(70);
    obj:setMargins({top=2,bottom=2});


                local function possui(campo, valor)
			        if string.find(campo, valor) ~= nil then
			            return true
			        else
			            return false
			        end
			    end

			    local function valorBase(campo)
                    local classe = sheet.classe
                    local raca = sheet.raca

                    if campo == 'magia' then
                        if possui(classe,'Arcanista') then return 2
                        end

                    elseif campo == 'linguagemComum' then
                        if possui(raca,'Elfo') then return 8
                        end

                    elseif campo == 'linguagemElfica' then
                        if possui(raca,'Elfo') then return 8
                        end

                    elseif campo == 'linguagemAna' then
                        if possui(classe,'Arcanista') then return 2
                        end

                    elseif campo == 'percepcao' then
                        if possui(raca,'Elfo') then return 4
                        end

                    else return 0
                    end
			    end

                local function sobeNivel(campo)
                    if campo == 'classe' then
                        sheet.nivelClasse = sheet.nivelClasse + 1
                        sheet.pontosRestantes = sheet.pontosRestantes + 2
                    elseif campo == 'profissao' then
                        sheet.nivelProfissao = sheet.nivelProfissao + 1
                    end
                end
			


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setMargins({left=5,right=5,top=5,bottom=5});
    obj.rectangle1:setHeight(60);
    obj.rectangle1:setWidth(400);
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setName("rectangle1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.rectangle1);
    obj.flowLayout1:setHeight(60);
    obj.flowLayout1:setWidth(400);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setWidth(280);
    obj.flowPart1:setHeight(25);
    obj.flowPart1:setAlign("left");
    obj.flowPart1:setMargins({left=10,top=5});
    obj.flowPart1:setName("flowPart1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setTextPrompt("Nome da Habilidade");
    obj.edit1:setFontSize(15);
    obj.edit1:setTransparent(true);
    obj.edit1:setField("habilidadeNome($baseName)");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setWidth(280);
    obj.edit1:setName("edit1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setStrokeColor("black");
    obj.horzLine1:setName("horzLine1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowLayout1);
    obj.rectangle2:setCornerType("innerLine");
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setXradius(3);
    obj.rectangle2:setYradius(3);
    obj.rectangle2:setMargins({left=5,right=5});
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setWidth(55);
    obj.rectangle2:setColor("#40000000");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setName("rectangle2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle2);
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setItems({'', 'C', 'C+','B', 'B+', 'A', 'A+', 'S', 'S+'});
    obj.comboBox1:setField("habilidadeRank");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setName("comboBox1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setHeight(20);
    obj.flowPart2:setWidth(30);
    obj.flowPart2:setAlign("right");
    obj.flowPart2:setMargins({right=10, top=5});
    obj.flowPart2:setName("flowPart2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowPart2);
    obj.rectangle3:setCornerType("innerLine");
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setXradius(3);
    obj.rectangle3:setYradius(3);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setWidth(30);
    obj.rectangle3:setColor("#40000000");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setName("rectangle3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle3);
    obj.edit2:setHeight(20);
    obj.edit2:setWidth(30);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setFontSize(15);
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontColor("black");
    obj.edit2:setField("habilidadeCargas");
    obj.edit2:setType("number");
    obj.edit2:setTransparent(true);
    obj.edit2:setName("edit2");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flowLayout1);
    obj.flowLayout2:setHeight(35);
    obj.flowLayout2:setWidth(400);
    obj.flowLayout2:setAlign("client");
    obj.flowLayout2:setMargins({top=5,left=15});
    obj.flowLayout2:setName("flowLayout2");

    obj.habilidadeTipoComboBox = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.habilidadeTipoComboBox:setParent(obj.flowLayout2);
    obj.habilidadeTipoComboBox:setWidth(150);
    obj.habilidadeTipoComboBox:setField("habilidadeTipo");
    obj.habilidadeTipoComboBox:setTransparent(true);
    obj.habilidadeTipoComboBox:setLeft(35);
    obj.habilidadeTipoComboBox:setFontSize(16);
    lfm_setPropAsString(obj.habilidadeTipoComboBox, "fontStyle",  "italic bold");
    obj.habilidadeTipoComboBox:setFontColor("silver");
    obj.habilidadeTipoComboBox:setName("habilidadeTipoComboBox");
    obj.habilidadeTipoComboBox:setItems({'Benção', 'Brasão','Canção', 'Conjuração', 'Combo', 'Dança', 'Evocação','Habilidade', 'Ilusão',
                           'Ki', 'Kokyuu (呼吸)', 'Magia', 'Magia Nula', 'Maldição','Od', 'Postura', 'Sinal'});
    obj.habilidadeTipoComboBox:setValues({'bencao', 'brasao', 'cancao', 'conjuracao', 'combo', 'danca', 'evocacao','habilidade', 'ilusao',
                           'ki', 'kokyuu', 'magia', 'magiaNula', 'maldicao', 'od', 'postura', 'sinal'});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout2);
    obj.button1:setText("usar");
    obj.button1:setHeight(20);
    obj.button1:setWidth(50);
    obj.button1:setMargins({left=5,right=5});
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout2);
    obj.button2:setText("i");
    obj.button2:setHeight(20);
    obj.button2:setWidth(20);
    obj.button2:setMargins({left=5,right=5});
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout2);
    obj.button3:setText("excluir");
    obj.button3:setHeight(20);
    obj.button3:setWidth(50);
    obj.button3:setMargins({left=5,right=5});
    obj.button3:setName("button3");


			local function askForDelete()
				Dialogs.confirmYesNo("Deseja realmente apagar esta habilidade?",
									 function (confirmado)
										if confirmado then
											NDB.deleteNode(self.sheet);
										end;
									 end);
			end;

			local function showHabilidadePopup()
			    local pop = self:findControlByName("editaHabilidade");

				if pop ~= nil then
					pop:setNodeObject(self.sheet);
					pop:show();
				else
					showMessage("Ops, bug.. nao encontrei o popup de habilidade para exibir");
				end;
			end;


			


    obj._e_event0 = obj.habilidadeTipoComboBox:addEventListener("onChange",
        function (_)
            if sheet.habilidadeTipo == 'bencao' then
                                                     self.sheet.fontColor = 'black' end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            showHabilidadePopup();
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.habilidadeTipoComboBox ~= nil then self.habilidadeTipoComboBox:destroy(); self.habilidadeTipoComboBox = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newhabilidadercl()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_habilidadercl();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _habilidadercl = {
    newEditor = newhabilidadercl, 
    new = newhabilidadercl, 
    name = "habilidadercl", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

habilidadercl = _habilidadercl;
Firecast.registrarForm(_habilidadercl);

return _habilidadercl;
