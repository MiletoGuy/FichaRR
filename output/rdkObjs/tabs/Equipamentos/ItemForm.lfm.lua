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
    obj.button1.grid["break-line-after"] = true;
    obj.button1:setName("button1");

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
    obj.label1:setFontColor("black");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(20);
    obj.label1:setName("label1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1.grid.role = "row";
    obj.layout1.grid["min-height"] = 30;
    obj.layout1.grid["cnt-horz-align"] = "center";
    obj.layout1.grid["vert-align"] = "center";
    obj.layout1:setMargins({top=2, bottom=2});
    obj.layout1:setName("layout1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2.grid.role = "col";
    obj.label2.grid.width = 1;
    obj.label2:setText("+");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2.grid["vert-align"] = "center";
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 1;
    obj.edit1:setField("conEquip");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3.grid.role = "col";
    obj.label3.grid.width = 2;
    obj.label3:setText("de Constituição");
    obj.label3:setName("label3");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2.grid.role = "row";
    obj.layout2.grid["min-height"] = 30;
    obj.layout2.grid["cnt-horz-align"] = "center";
    obj.layout2.grid["vert-align"] = "center";
    obj.layout2:setMargins({top=2, bottom=2});
    obj.layout2:setName("layout2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4.grid.role = "col";
    obj.label4.grid.width = 1;
    obj.label4:setText("+");
    obj.label4:setHorzTextAlign("trailing");
    obj.label4.grid["vert-align"] = "center";
    obj.label4:setName("label4");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 1;
    obj.edit2:setField("forEquip");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5.grid.role = "col";
    obj.label5.grid.width = 2;
    obj.label5:setText("de Força");
    obj.label5:setName("label5");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj);
    obj.layout3.grid.role = "row";
    obj.layout3.grid["min-height"] = 30;
    obj.layout3.grid["cnt-horz-align"] = "center";
    obj.layout3.grid["vert-align"] = "center";
    obj.layout3:setMargins({top=2, bottom=2});
    obj.layout3:setName("layout3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6.grid.role = "col";
    obj.label6.grid.width = 1;
    obj.label6:setText("+");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6.grid["vert-align"] = "center";
    obj.label6:setName("label6");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 1;
    obj.edit3:setField("dexEquip");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7.grid.role = "col";
    obj.label7.grid.width = 2;
    obj.label7:setText("de Destreza");
    obj.label7:setName("label7");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj);
    obj.layout4.grid.role = "row";
    obj.layout4.grid["min-height"] = 30;
    obj.layout4.grid["cnt-horz-align"] = "center";
    obj.layout4.grid["vert-align"] = "center";
    obj.layout4:setMargins({top=2, bottom=2});
    obj.layout4:setName("layout4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8.grid.role = "col";
    obj.label8.grid.width = 1;
    obj.label8:setText("+");
    obj.label8:setHorzTextAlign("trailing");
    obj.label8.grid["vert-align"] = "center";
    obj.label8:setName("label8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 1;
    obj.edit4:setField("dexEquip");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout4);
    obj.label9.grid.role = "col";
    obj.label9.grid.width = 2;
    obj.label9:setText("de Carisma");
    obj.label9:setName("label9");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj);
    obj.layout5.grid.role = "row";
    obj.layout5.grid["min-height"] = 30;
    obj.layout5.grid["cnt-horz-align"] = "center";
    obj.layout5.grid["vert-align"] = "center";
    obj.layout5:setMargins({top=2, bottom=2});
    obj.layout5:setName("layout5");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout5);
    obj.label10.grid.role = "col";
    obj.label10.grid.width = 1;
    obj.label10:setText("+");
    obj.label10:setHorzTextAlign("trailing");
    obj.label10.grid["vert-align"] = "center";
    obj.label10:setName("label10");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5.grid.role = "col";
    obj.edit5.grid.width = 1;
    obj.edit5:setField("dexEquip");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout5);
    obj.label11.grid.role = "col";
    obj.label11.grid.width = 2;
    obj.label11:setText("de Inteligência");
    obj.label11:setName("label11");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj);
    obj.layout6.grid.role = "row";
    obj.layout6.grid["min-height"] = 30;
    obj.layout6.grid["cnt-horz-align"] = "center";
    obj.layout6.grid["vert-align"] = "center";
    obj.layout6:setMargins({top=2, bottom=2});
    obj.layout6:setName("layout6");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout6);
    obj.label12.grid.role = "col";
    obj.label12.grid.width = 1;
    obj.label12:setText("+");
    obj.label12:setHorzTextAlign("trailing");
    obj.label12.grid["vert-align"] = "center";
    obj.label12:setName("label12");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6.grid.role = "col";
    obj.edit6.grid.width = 1;
    obj.edit6:setField("dexEquip");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout6);
    obj.label13.grid.role = "col";
    obj.label13.grid.width = 2;
    obj.label13:setText("de Sabedoria");
    obj.label13:setName("label13");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj);
    obj.layout7.grid.role = "row";
    obj.layout7.grid["min-height"] = 30;
    obj.layout7.grid["cnt-horz-align"] = "center";
    obj.layout7.grid["vert-align"] = "center";
    obj.layout7:setMargins({top=2, bottom=2});
    obj.layout7:setName("layout7");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout7);
    obj.label14.grid.role = "col";
    obj.label14.grid.width = 1;
    obj.label14:setText("+");
    obj.label14:setHorzTextAlign("trailing");
    obj.label14.grid["vert-align"] = "center";
    obj.label14:setName("label14");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7.grid.role = "col";
    obj.edit7.grid.width = 1;
    obj.edit7:setField("dexEquip");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout7);
    obj.label15.grid.role = "col";
    obj.label15.grid.width = 2;
    obj.label15:setText("de Acerto");
    obj.label15:setName("label15");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj);
    obj.layout8.grid.role = "row";
    obj.layout8.grid["min-height"] = 30;
    obj.layout8.grid["cnt-horz-align"] = "center";
    obj.layout8.grid["vert-align"] = "center";
    obj.layout8:setMargins({top=2, bottom=2});
    obj.layout8:setName("layout8");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout8);
    obj.label16.grid.role = "col";
    obj.label16.grid.width = 1;
    obj.label16:setText("+");
    obj.label16:setHorzTextAlign("trailing");
    obj.label16.grid["vert-align"] = "center";
    obj.label16:setName("label16");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout8);
    obj.edit8.grid.role = "col";
    obj.edit8.grid.width = 1;
    obj.edit8:setField("dexEquip");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout8);
    obj.label17.grid.role = "col";
    obj.label17.grid.width = 2;
    obj.label17:setText("de Mira");
    obj.label17:setName("label17");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj);
    obj.layout9.grid.role = "row";
    obj.layout9.grid["min-height"] = 30;
    obj.layout9.grid["cnt-horz-align"] = "center";
    obj.layout9.grid["vert-align"] = "center";
    obj.layout9:setMargins({top=2, bottom=2});
    obj.layout9:setName("layout9");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout9);
    obj.label18.grid.role = "col";
    obj.label18.grid.width = 1;
    obj.label18:setText("+");
    obj.label18:setHorzTextAlign("trailing");
    obj.label18.grid["vert-align"] = "center";
    obj.label18:setName("label18");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9.grid.role = "col";
    obj.edit9.grid.width = 1;
    obj.edit9:setField("dexEquip");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout9);
    obj.label19.grid.role = "col";
    obj.label19.grid.width = 2;
    obj.label19:setText("de Esquiva");
    obj.label19:setName("label19");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj);
    obj.layout10.grid.role = "row";
    obj.layout10.grid["min-height"] = 30;
    obj.layout10.grid["cnt-horz-align"] = "center";
    obj.layout10.grid["vert-align"] = "center";
    obj.layout10:setMargins({top=2, bottom=2});
    obj.layout10:setName("layout10");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout10);
    obj.label20.grid.role = "col";
    obj.label20.grid.width = 1;
    obj.label20:setText("+");
    obj.label20:setHorzTextAlign("trailing");
    obj.label20.grid["vert-align"] = "center";
    obj.label20:setName("label20");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10.grid.role = "col";
    obj.edit10.grid.width = 1;
    obj.edit10:setField("dexEquip");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout10);
    obj.label21.grid.role = "col";
    obj.label21.grid.width = 2;
    obj.label21:setText("de Bloqueio");
    obj.label21:setName("label21");

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

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
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
