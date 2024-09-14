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

    obj.atributoFlat = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributoFlat:setParent(obj.layout1);
    obj.atributoFlat:setName("atributoFlat");
    obj.atributoFlat.grid.role = "row";
    obj.atributoFlat.grid["min-height"] = 30;
    obj.atributoFlat.grid["cnt-horz-align"] = "center";
    obj.atributoFlat.grid["cnt-vert-align"] = "center";
    obj.atributoFlat:setMargins({top=2, bottom=2});
    obj.atributoFlat.grid["cnt-gutter"] = 10;

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.atributoFlat);
    obj.label1.grid.role = "block";
    obj.label1:setText("+");
    obj.label1:setWidth(10);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.atributoFlat);
    obj.edit1.grid.role = "col";
    obj.edit1:setField("valorAtributo");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.atributoFlat);
    obj.label2.grid.role = "block";
    obj.label2:setText("de");
    obj.label2:setWidth(15);
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.atributoFlat);
    obj.comboBox1.grid.role = "col";
    obj.comboBox1:setField("nomeAtributo");
    obj.comboBox1:setItems({'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox1:setValues({'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.atributoFlat);
    obj.comboBox2:setField("tipoDeCalculo");
    obj.comboBox2.grid.role = "col";
    obj.comboBox2.grid.width = 1;
    obj.comboBox2:setItems({'Flat', 'Porcentagem', 'Vermelho'});
    obj.comboBox2:setValues({'flat', 'porcentagem', 'vermelho'});
    obj.comboBox2:setName("comboBox2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.atributoFlat);
    obj.button1:setText("X");
    obj.button1.grid.role = "block";
    obj.button1:setWidth(20);
    obj.button1:setName("button1");

    obj.atributoPorcentagem = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributoPorcentagem:setParent(obj.layout1);
    obj.atributoPorcentagem:setName("atributoPorcentagem");
    obj.atributoPorcentagem.grid.role = "row";
    obj.atributoPorcentagem.grid["min-height"] = 30;
    obj.atributoPorcentagem.grid["cnt-horz-align"] = "center";
    obj.atributoPorcentagem.grid["cnt-vert-align"] = "center";
    obj.atributoPorcentagem:setVisible(false);
    obj.atributoPorcentagem:setMargins({top=2, bottom=2});
    obj.atributoPorcentagem.grid["cnt-gutter"] = 10;

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.atributoPorcentagem);
    obj.label3.grid.role = "block";
    obj.label3:setText("+");
    obj.label3:setWidth(10);
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.atributoPorcentagem);
    obj.edit2.grid.role = "col";
    obj.edit2:setField("valorAtributo");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.atributoPorcentagem);
    obj.label4.grid.role = "block";
    obj.label4:setText("% de");
    obj.label4:setWidth(30);
    obj.label4:setName("label4");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.atributoPorcentagem);
    obj.comboBox3.grid.role = "col";
    obj.comboBox3:setField("nomeAtributo");
    obj.comboBox3:setItems({'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox3:setValues({'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox3:setName("comboBox3");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.atributoPorcentagem);
    obj.comboBox4:setField("tipoDeCalculo");
    obj.comboBox4.grid.role = "col";
    obj.comboBox4.grid.width = 1;
    obj.comboBox4:setItems({'Flat', 'Porcentagem', 'Vermelho'});
    obj.comboBox4:setValues({'flat', 'porcentagem', 'vermelho'});
    obj.comboBox4:setName("comboBox4");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.atributoPorcentagem);
    obj.button2:setText("X");
    obj.button2.grid.role = "block";
    obj.button2:setWidth(20);
    obj.button2:setName("button2");

    obj.retanguloVermelho = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.retanguloVermelho:setParent(obj.layout1);
    obj.retanguloVermelho:setName("retanguloVermelho");
    obj.retanguloVermelho:setAlign("client");
    obj.retanguloVermelho:setColor("red");
    obj.retanguloVermelho:setVisible(false);

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.retanguloVermelho);
    obj.comboBox5:setField("tipoDeCalculo");
    obj.comboBox5.grid.role = "col";
    obj.comboBox5.grid.width = 1;
    obj.comboBox5:setItems({'Flat', 'Porcentagem', 'Vermelho'});
    obj.comboBox5:setValues({'flat', 'porcentagem', 'vermelho'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("tipoDeCalculo");
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.tipoDeCalculo == "flat" then
                        self.atributoFlat.visible = true
                        self.atributoPorcentagem.visible = false
                        self.retanguloVermelho.visible = false
                        elseif sheet.tipoDeCalculo == "porcentagem" then
                        self.atributoFlat.visible = false
                        self.atributoPorcentagem.visible = true
                        self.retanguloVermelho.visible = false
                        elseif sheet.tipoDeCalculo == "vermelho" then
                        self.atributoFlat.visible = false
                        self.atributoPorcentagem.visible = false
                        self.retanguloVermelho.visible = true
                        end
        end);

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

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.atributoFlat ~= nil then self.atributoFlat:destroy(); self.atributoFlat = nil; end;
        if self.atributoPorcentagem ~= nil then self.atributoPorcentagem:destroy(); self.atributoPorcentagem = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.retanguloVermelho ~= nil then self.retanguloVermelho:destroy(); self.retanguloVermelho = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
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
