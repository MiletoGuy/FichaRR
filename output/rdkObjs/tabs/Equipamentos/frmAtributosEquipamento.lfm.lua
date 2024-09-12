require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAtributosEquipamento()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

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
    obj:setName("frmAtributosEquipamento");
    obj.grid.role = "container";
    obj.grid["cnt-horz-align"] = "center";
    obj:setMargins({top=5, bottom=5});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1.grid.role = "row";
    obj.layout1.grid["min-height"] = 30;
    obj.layout1:setMargins({top=2, bottom=2});
    obj.layout1:setName("layout1");

    obj.retanguloVerde = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.retanguloVerde:setParent(obj.layout1);
    obj.retanguloVerde:setName("retanguloVerde");
    obj.retanguloVerde:setAlign("client");
    obj.retanguloVerde:setColor("green");
    obj.retanguloVerde:setVisible(false);

    obj.retanguloAmarelo = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.retanguloAmarelo:setParent(obj.layout1);
    obj.retanguloAmarelo:setName("retanguloAmarelo");
    obj.retanguloAmarelo:setAlign("client");
    obj.retanguloAmarelo:setColor("yellow");
    obj.retanguloAmarelo:setVisible(false);

    obj.retanguloVermelho = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.retanguloVermelho:setParent(obj.layout1);
    obj.retanguloVermelho:setName("retanguloVermelho");
    obj.retanguloVermelho:setAlign("client");
    obj.retanguloVermelho:setColor("red");
    obj.retanguloVermelho:setVisible(false);

    obj.botaoOpcoes = GUI.fromHandle(_obj_newObject("button"));
    obj.botaoOpcoes:setParent(obj.layout1);
    obj.botaoOpcoes:setName("botaoOpcoes");
    obj.botaoOpcoes:setText("🛈");

    obj.popOpcoesRetangulo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popOpcoesRetangulo:setParent(obj.layout1);
    obj.popOpcoesRetangulo:setName("popOpcoesRetangulo");
    obj.popOpcoesRetangulo:setWidth(100);
    obj.popOpcoesRetangulo:setHeight(100);

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.popOpcoesRetangulo);
    obj.radioButton1:setText("verde");
    obj.radioButton1:setGroupName("grupo1");
    obj.radioButton1:setTop(5);
    obj.radioButton1:setField("radioTeste");
    obj.radioButton1:setFieldValue("verde");
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.popOpcoesRetangulo);
    obj.radioButton2:setText("vermelho");
    obj.radioButton2:setGroupName("grupo1");
    obj.radioButton2:setTop(25);
    obj.radioButton2:setField("radioTeste");
    obj.radioButton2:setFieldValue("vermelho");
    obj.radioButton2:setName("radioButton2");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.popOpcoesRetangulo);
    obj.radioButton3:setText("amarelo");
    obj.radioButton3:setGroupName("grupo1");
    obj.radioButton3:setTop(45);
    obj.radioButton3:setField("radioTeste");
    obj.radioButton3:setFieldValue("amarelo");
    obj.radioButton3:setName("radioButton3");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("radioTeste");
    obj.dataLink1:setName("dataLink1");


            function atualizaRetangulos()
                if sheet.radioTeste == "verde" then
                    self.retanguloVerde.visible = true
                    self.retanguloAmarelo.visible = false
                    self.retanguloVermelho.visible = false
                elseif sheet.radioTeste == "amarelo" then
                    self.retanguloVerde.visible = false
                    self.retanguloAmarelo.visible = true
                    self.retanguloVermelho.visible = false
                elseif sheet.radioTeste == "vermelho" then
                    self.retanguloVerde.visible = false
                    self.retanguloAmarelo.visible = false
                    self.retanguloVermelho.visible = true
                end
            end
            


    obj._e_event0 = obj.botaoOpcoes:addEventListener("onClick",
        function (event)
            self.popOpcoesRetangulo:show('bottom', self.botaoOpcoes)
        end);

    obj._e_event1 = obj.radioButton1:addEventListener("onChange",
        function ()
            atualizaRetangulos(); self.popOpcoesRetangulo:close()
        end);

    obj._e_event2 = obj.radioButton2:addEventListener("onChange",
        function ()
            atualizaRetangulos(); self.popOpcoesRetangulo:close()
        end);

    obj._e_event3 = obj.radioButton3:addEventListener("onChange",
        function ()
            atualizaRetangulos(); self.popOpcoesRetangulo:close()
        end);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            atualizaRetangulos()
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
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

        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.popOpcoesRetangulo ~= nil then self.popOpcoesRetangulo:destroy(); self.popOpcoesRetangulo = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.botaoOpcoes ~= nil then self.botaoOpcoes:destroy(); self.botaoOpcoes = nil; end;
        if self.retanguloVerde ~= nil then self.retanguloVerde:destroy(); self.retanguloVerde = nil; end;
        if self.retanguloAmarelo ~= nil then self.retanguloAmarelo:destroy(); self.retanguloAmarelo = nil; end;
        if self.retanguloVermelho ~= nil then self.retanguloVermelho:destroy(); self.retanguloVermelho = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAtributosEquipamento()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAtributosEquipamento();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAtributosEquipamento = {
    newEditor = newfrmAtributosEquipamento, 
    new = newfrmAtributosEquipamento, 
    name = "frmAtributosEquipamento", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmAtributosEquipamento = _frmAtributosEquipamento;
Firecast.registrarForm(_frmAtributosEquipamento);

return _frmAtributosEquipamento;
