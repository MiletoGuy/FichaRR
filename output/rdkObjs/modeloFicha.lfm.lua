require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaDePersonagem()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("FICHA_DE_PERSONAGEM_GAIA");
    obj:setTitle("Ficha de Personagem");
    obj:setName("frmFichaDePersonagem");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setWidth(700);
    obj.layout1:setHeight(400);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("Perfil");
    obj.label1:setName("label1");
    obj.label1:setAlign("client");
    obj.label1:setHorzTextAlign("trailing");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setTop(45);
    obj.layout2:setHeight(25);
    obj.layout2:setWidth(350);
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Nome:");
    obj.label2:setName("label2");
    obj.label2:setAlign("client");
    obj.label2:setHorzTextAlign("trailing");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setName("edit1");
    obj.edit1:setAlign("right");
    obj.edit1:setMargins({left=10});
    obj.edit1:setWidth(200);
    obj.edit1:setTransparent(false);
    obj.edit1:setHorzTextAlign("leading");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setTop(45);
    obj.layout3:setRight(400);
    obj.layout3:setHeight(25);
    obj.layout3:setWidth(350);
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setText("Raça:");
    obj.label3:setName("label3");
    obj.label3:setAlign("client");
    obj.label3:setHorzTextAlign("trailing");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setName("edit2");
    obj.edit2:setAlign("right");
    obj.edit2:setMargins({left=10});
    obj.edit2:setWidth(200);
    obj.edit2:setTransparent(false);
    obj.edit2:setHorzTextAlign("leading");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setTop(90);
    obj.layout4:setHeight(25);
    obj.layout4:setWidth(350);
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setText("Peso:");
    obj.label4:setName("label4");
    obj.label4:setAlign("client");
    obj.label4:setHorzTextAlign("trailing");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setName("edit3");
    obj.edit3:setAlign("right");
    obj.edit3:setMargins({left=10});
    obj.edit3:setWidth(200);
    obj.edit3:setTransparent(false);
    obj.edit3:setHorzTextAlign("leading");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setTop(90);
    obj.layout5:setRight(400);
    obj.layout5:setHeight(25);
    obj.layout5:setWidth(350);
    obj.layout5:setName("layout5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setText("Classe:");
    obj.label5:setName("label5");
    obj.label5:setAlign("client");
    obj.label5:setHorzTextAlign("trailing");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setName("edit4");
    obj.edit4:setAlign("right");
    obj.edit4:setMargins({left=10});
    obj.edit4:setWidth(200);
    obj.edit4:setTransparent(false);
    obj.edit4:setHorzTextAlign("leading");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setTop(135);
    obj.layout6:setHeight(25);
    obj.layout6:setWidth(350);
    obj.layout6:setName("layout6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout6);
    obj.label6:setText("Altura:");
    obj.label6:setName("label6");
    obj.label6:setAlign("client");
    obj.label6:setHorzTextAlign("trailing");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setName("edit5");
    obj.edit5:setAlign("right");
    obj.edit5:setMargins({left=10});
    obj.edit5:setWidth(200);
    obj.edit5:setTransparent(false);
    obj.edit5:setHorzTextAlign("leading");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setTop(135);
    obj.layout7:setRight(400);
    obj.layout7:setHeight(25);
    obj.layout7:setWidth(350);
    obj.layout7:setName("layout7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setText("Idade:");
    obj.label7:setName("label7");
    obj.label7:setAlign("client");
    obj.label7:setHorzTextAlign("trailing");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setName("edit6");
    obj.edit6:setAlign("right");
    obj.edit6:setMargins({left=10});
    obj.edit6:setWidth(200);
    obj.edit6:setTransparent(false);
    obj.edit6:setHorzTextAlign("leading");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setTop(180);
    obj.layout8:setHeight(25);
    obj.layout8:setWidth(350);
    obj.layout8:setName("layout8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8:setText("Nivel de Classe:");
    obj.label8:setName("label8");
    obj.label8:setAlign("client");
    obj.label8:setHorzTextAlign("trailing");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setName("edit7");
    obj.edit7:setAlign("right");
    obj.edit7:setMargins({left=10});
    obj.edit7:setWidth(200);
    obj.edit7:setTransparent(false);
    obj.edit7:setHorzTextAlign("leading");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setTop(180);
    obj.layout9:setRight(400);
    obj.layout9:setHeight(25);
    obj.layout9:setWidth(350);
    obj.layout9:setName("layout9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout9);
    obj.label9:setText("Sexo:");
    obj.label9:setName("label9");
    obj.label9:setAlign("client");
    obj.label9:setHorzTextAlign("trailing");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setName("edit8");
    obj.edit8:setAlign("right");
    obj.edit8:setMargins({left=10});
    obj.edit8:setWidth(200);
    obj.edit8:setTransparent(false);
    obj.edit8:setHorzTextAlign("leading");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setTop(225);
    obj.layout10:setHeight(25);
    obj.layout10:setWidth(350);
    obj.layout10:setName("layout10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout10);
    obj.label10:setText("Nível de Profissão:");
    obj.label10:setName("label10");
    obj.label10:setAlign("client");
    obj.label10:setHorzTextAlign("trailing");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setName("edit9");
    obj.edit9:setAlign("right");
    obj.edit9:setMargins({left=10});
    obj.edit9:setWidth(200);
    obj.edit9:setTransparent(false);
    obj.edit9:setHorzTextAlign("leading");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setTop(225);
    obj.layout11:setRight(400);
    obj.layout11:setHeight(25);
    obj.layout11:setWidth(350);
    obj.layout11:setName("layout11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout11);
    obj.label11:setText("Nacionalidade");
    obj.label11:setName("label11");
    obj.label11:setAlign("client");
    obj.label11:setHorzTextAlign("trailing");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout11);
    obj.edit10:setName("edit10");
    obj.edit10:setAlign("right");
    obj.edit10:setMargins({left=10});
    obj.edit10:setWidth(200);
    obj.edit10:setTransparent(false);
    obj.edit10:setHorzTextAlign("leading");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout1);
    obj.layout12:setTop(270);
    obj.layout12:setHeight(25);
    obj.layout12:setWidth(350);
    obj.layout12:setName("layout12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout12);
    obj.label12:setText("Divindade:");
    obj.label12:setName("label12");
    obj.label12:setAlign("client");
    obj.label12:setHorzTextAlign("trailing");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout12);
    obj.edit11:setName("edit11");
    obj.edit11:setAlign("right");
    obj.edit11:setMargins({left=10});
    obj.edit11:setWidth(200);
    obj.edit11:setTransparent(false);
    obj.edit11:setHorzTextAlign("leading");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout1);
    obj.layout13:setTop(270);
    obj.layout13:setRight(400);
    obj.layout13:setHeight(25);
    obj.layout13:setWidth(350);
    obj.layout13:setName("layout13");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout13);
    obj.label13:setText("P. Destino");
    obj.label13:setName("label13");
    obj.label13:setAlign("client");
    obj.label13:setHorzTextAlign("trailing");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout13);
    obj.edit12:setName("edit12");
    obj.edit12:setAlign("right");
    obj.edit12:setMargins({left=10});
    obj.edit12:setWidth(200);
    obj.edit12:setTransparent(false);
    obj.edit12:setHorzTextAlign("leading");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj);
    obj.layout14:setTop(400);
    obj.layout14:setWidth(700);
    obj.layout14:setHeight(400);
    obj.layout14:setName("layout14");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout14);
    obj.label14:setText("Atributos");
    obj.label14:setName("label14");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaDePersonagem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaDePersonagem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaDePersonagem = {
    newEditor = newfrmFichaDePersonagem, 
    new = newfrmFichaDePersonagem, 
    name = "frmFichaDePersonagem", 
    dataType = "FICHA_DE_PERSONAGEM_GAIA", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha de Personagem", 
    description=""};

frmFichaDePersonagem = _frmFichaDePersonagem;
Firecast.registrarForm(_frmFichaDePersonagem);
Firecast.registrarDataType(_frmFichaDePersonagem);

return _frmFichaDePersonagem;
