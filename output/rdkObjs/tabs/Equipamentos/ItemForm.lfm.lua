require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_ItemForm()
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
    obj:setName("ItemForm");
    obj.grid.role = "container";
    obj.grid["cnt-horz-align"] = "center";
    obj:setMargins({top=5, bottom=5});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setText("Apagar");
    obj.button1.grid.role = "col";
    obj.button1.grid.width = 1;
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setText("+Atributo");
    obj.button2.grid.role = "col";
    obj.button2.grid.width = 1;
    obj.button2.grid["break-line-after"] = true;
    obj.button2:setName("button2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1.grid.role = "block";
    obj.rectangle1:setWidth(150);
    obj.rectangle1:setHeight(150);
    obj.rectangle1.grid["break-line-after"] = true;
    obj.rectangle1:setMargins({top=5, bottom=5});
    obj.rectangle1:setXradius(25);
    obj.rectangle1:setYradius(25);
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setStrokeColor("silver");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setOptimize(true);
    obj.image1:setField("ImagemEquipamento");
    obj.image1:setEditable(true);
    obj.image1:setAlign("client");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setText("Nome do Equipamento muito foda que conta historia no nome");
    obj.label1.grid.role = "row";
    obj.label1.grid["min-height"] = 20;
    lfm_setPropAsString(obj.label1, "fontStyle", "bold");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(25);
    obj.label1:setName("label1");

    obj.rclAtributoEquipamento = GUI.fromHandle(_obj_newObject("gridRecordList"));
    obj.rclAtributoEquipamento:setParent(obj);
    obj.rclAtributoEquipamento:setName("rclAtributoEquipamento");
    obj.rclAtributoEquipamento.field = "atributoEquipamento";
    obj.rclAtributoEquipamento.templateForm = "AtributoDeEquipamento";
    obj.rclAtributoEquipamento.grid.role = "container";
    obj.rclAtributoEquipamento.grid.width = 10;

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (event)
            self.rclAtributoEquipamento:append();
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rclAtributoEquipamento ~= nil then self.rclAtributoEquipamento:destroy(); self.rclAtributoEquipamento = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newItemForm()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_ItemForm();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _ItemForm = {
    newEditor = newItemForm, 
    new = newItemForm, 
    name = "ItemForm", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

ItemForm = _ItemForm;
Firecast.registrarForm(_ItemForm);

return _ItemForm;
