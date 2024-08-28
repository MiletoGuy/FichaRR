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
    obj.layout1.grid["cnt-horz-align"] = "center";
    obj.layout1.grid["cnt-vert-align"] = "center";
    obj.layout1:setMargins({top=2, bottom=2});
    obj.layout1.grid["cnt-gutter"] = 10;
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1.grid.role = "block";
    obj.label1:setText("+");
    obj.label1:setWidth(10);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1.grid.role = "col";
    obj.edit1:setField("valorAtributo");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2.grid.role = "block";
    obj.label2:setText("de");
    obj.label2:setWidth(15);
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1.grid.role = "col";
    obj.comboBox1:setField("nomeAtributo");
    obj.comboBox1:setItems({'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto', 'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox1:setValues({'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox1:setName("comboBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("X");
    obj.button1.grid.role = "block";
    obj.button1:setWidth(20);
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
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
