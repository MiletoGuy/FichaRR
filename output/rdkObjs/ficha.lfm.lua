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
    obj:setFormType("sheetTemplate");
    obj:setDataType("FICHA_DE_PERSONAGEM_GAIA");
    obj:setTitle("Ficha Automatizada Gaia");
    obj:setName("frmFichaDePersonagem");
    obj:setTheme("dark");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Atributos");
    obj.tab1:setName("tab1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab1);
    obj.layout1:setAlign("client");
    obj.layout1.grid.role = "container";
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2.grid.role = "row";
    obj.layout2.grid["min-height"] = 20;
    obj.layout2.grid["cnt-horz-align"] = "center";
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("");
    obj.label1.grid.role = "col";
    obj.label1.grid.width = 1;
    obj.label1.grid["min-height"] = 20;
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Nível");
    obj.label2.grid.role = "col";
    obj.label2.grid.width = 1;
    obj.label2.grid["min-height"] = 20;
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setText("Classe");
    obj.label3.grid.role = "col";
    obj.label3.grid.width = 1;
    obj.label3.grid["min-height"] = 20;
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setText("Raça");
    obj.label4.grid.role = "col";
    obj.label4.grid.width = 1;
    obj.label4.grid["min-height"] = 20;
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setText("Treino");
    obj.label5.grid.role = "col";
    obj.label5.grid.width = 1;
    obj.label5.grid["min-height"] = 20;
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setText("Outro");
    obj.label6.grid.role = "col";
    obj.label6.grid.width = 1;
    obj.label6.grid["min-height"] = 20;
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setText("Base");
    obj.label7.grid.role = "col";
    obj.label7.grid.width = 1;
    obj.label7.grid["min-height"] = 20;
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setText("Multiplicador");
    obj.label8.grid.role = "col";
    obj.label8.grid.width = 1;
    obj.label8.grid["min-height"] = 20;
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setText("Extra");
    obj.label9.grid.role = "col";
    obj.label9.grid.width = 1;
    obj.label9.grid["min-height"] = 20;
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setText("Total");
    obj.label10.grid.role = "col";
    obj.label10.grid.width = 1;
    obj.label10.grid["min-height"] = 20;
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3.grid.role = "row";
    obj.layout3.grid["min-height"] = 20;
    obj.layout3.grid["cnt-horz-align"] = "center";
    obj.layout3:setName("layout3");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11.grid.role = "col";
    obj.label11.grid.width = 1;
    obj.label11:setText("Constituição");
    obj.label11:setName("label11");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 1;
    obj.edit1:setReadOnly(false);
    obj.edit1:setCanFocus(true);
    obj.edit1:setCursor("IBeam");
    obj.edit1:setField("conNivel");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 1;
    obj.edit2:setReadOnly(false);
    obj.edit2:setCanFocus(true);
    obj.edit2:setCursor("IBeam");
    obj.edit2:setField("conClasse");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 1;
    obj.edit3:setReadOnly(false);
    obj.edit3:setCanFocus(true);
    obj.edit3:setCursor("IBeam");
    obj.edit3:setField("conRaca");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 1;
    obj.edit4:setReadOnly(false);
    obj.edit4:setCanFocus(true);
    obj.edit4:setCursor("IBeam");
    obj.edit4:setField("conTreino");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5.grid.role = "col";
    obj.edit5.grid.width = 1;
    obj.edit5:setReadOnly(false);
    obj.edit5:setCanFocus(true);
    obj.edit5:setCursor("IBeam");
    obj.edit5:setField("conOutro");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6.grid.role = "col";
    obj.edit6.grid.width = 1;
    obj.edit6:setReadOnly(true);
    obj.edit6:setCanFocus(false);
    obj.edit6:setCursor("default");
    obj.edit6:setField("conBase");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7.grid.role = "col";
    obj.edit7.grid.width = 1;
    obj.edit7:setReadOnly(false);
    obj.edit7:setCanFocus(true);
    obj.edit7:setCursor("IBeam");
    obj.edit7:setField("conMultiplicador");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8.grid.role = "col";
    obj.edit8.grid.width = 1;
    obj.edit8:setReadOnly(false);
    obj.edit8:setCanFocus(true);
    obj.edit8:setCursor("IBeam");
    obj.edit8:setField("conExtra");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9.grid.role = "col";
    obj.edit9.grid.width = 1;
    obj.edit9:setReadOnly(true);
    obj.edit9:setCanFocus(false);
    obj.edit9:setCursor("default");
    obj.edit9:setField("conTotal");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setFields({'conNivel', 'conClasse', 'conRaca', 'conTreino', 'conOutro', 'conMultiplicador', 'conExtra'});
    obj.dataLink1:setName("dataLink1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4.grid.role = "row";
    obj.layout4.grid["min-height"] = 20;
    obj.layout4.grid["cnt-horz-align"] = "center";
    obj.layout4:setName("layout4");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout4);
    obj.label12.grid.role = "col";
    obj.label12.grid.width = 1;
    obj.label12:setText("Força");
    obj.label12:setName("label12");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout4);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10.grid.role = "col";
    obj.edit10.grid.width = 1;
    obj.edit10:setReadOnly(false);
    obj.edit10:setCanFocus(true);
    obj.edit10:setCursor("IBeam");
    obj.edit10:setField("forNivel");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout4);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11.grid.role = "col";
    obj.edit11.grid.width = 1;
    obj.edit11:setReadOnly(false);
    obj.edit11:setCanFocus(true);
    obj.edit11:setCursor("IBeam");
    obj.edit11:setField("forClasse");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout4);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12.grid.role = "col";
    obj.edit12.grid.width = 1;
    obj.edit12:setReadOnly(false);
    obj.edit12:setCanFocus(true);
    obj.edit12:setCursor("IBeam");
    obj.edit12:setField("forRaca");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout4);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13.grid.role = "col";
    obj.edit13.grid.width = 1;
    obj.edit13:setReadOnly(false);
    obj.edit13:setCanFocus(true);
    obj.edit13:setCursor("IBeam");
    obj.edit13:setField("forTreino");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout4);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14.grid.role = "col";
    obj.edit14.grid.width = 1;
    obj.edit14:setReadOnly(false);
    obj.edit14:setCanFocus(true);
    obj.edit14:setCursor("IBeam");
    obj.edit14:setField("forOutro");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout4);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15.grid.role = "col";
    obj.edit15.grid.width = 1;
    obj.edit15:setReadOnly(true);
    obj.edit15:setCanFocus(false);
    obj.edit15:setCursor("default");
    obj.edit15:setField("forBase");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout4);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16.grid.role = "col";
    obj.edit16.grid.width = 1;
    obj.edit16:setReadOnly(false);
    obj.edit16:setCanFocus(true);
    obj.edit16:setCursor("IBeam");
    obj.edit16:setField("forMultiplicador");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout4);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17.grid.role = "col";
    obj.edit17.grid.width = 1;
    obj.edit17:setReadOnly(false);
    obj.edit17:setCanFocus(true);
    obj.edit17:setCursor("IBeam");
    obj.edit17:setField("forExtra");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout4);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18.grid.role = "col";
    obj.edit18.grid.width = 1;
    obj.edit18:setReadOnly(true);
    obj.edit18:setCanFocus(false);
    obj.edit18:setCursor("default");
    obj.edit18:setField("forTotal");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setFields({'forNivel', 'forClasse', 'forRaca', 'forTreino', 'forOutro', 'forMultiplicador', 'forExtra'});
    obj.dataLink2:setName("dataLink2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5.grid.role = "row";
    obj.layout5.grid["min-height"] = 20;
    obj.layout5.grid["cnt-horz-align"] = "center";
    obj.layout5:setName("layout5");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout5);
    obj.label13.grid.role = "col";
    obj.label13.grid.width = 1;
    obj.label13:setText("Destreza");
    obj.label13:setName("label13");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout5);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19.grid.role = "col";
    obj.edit19.grid.width = 1;
    obj.edit19:setReadOnly(false);
    obj.edit19:setCanFocus(true);
    obj.edit19:setCursor("IBeam");
    obj.edit19:setField("dexNivel");
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout5);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20.grid.role = "col";
    obj.edit20.grid.width = 1;
    obj.edit20:setReadOnly(false);
    obj.edit20:setCanFocus(true);
    obj.edit20:setCursor("IBeam");
    obj.edit20:setField("dexClasse");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout5);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21.grid.role = "col";
    obj.edit21.grid.width = 1;
    obj.edit21:setReadOnly(false);
    obj.edit21:setCanFocus(true);
    obj.edit21:setCursor("IBeam");
    obj.edit21:setField("dexRaca");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout5);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22.grid.role = "col";
    obj.edit22.grid.width = 1;
    obj.edit22:setReadOnly(false);
    obj.edit22:setCanFocus(true);
    obj.edit22:setCursor("IBeam");
    obj.edit22:setField("dexTreino");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout5);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23.grid.role = "col";
    obj.edit23.grid.width = 1;
    obj.edit23:setReadOnly(false);
    obj.edit23:setCanFocus(true);
    obj.edit23:setCursor("IBeam");
    obj.edit23:setField("dexOutro");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout5);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24.grid.role = "col";
    obj.edit24.grid.width = 1;
    obj.edit24:setReadOnly(true);
    obj.edit24:setCanFocus(false);
    obj.edit24:setCursor("default");
    obj.edit24:setField("dexBase");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout5);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25.grid.role = "col";
    obj.edit25.grid.width = 1;
    obj.edit25:setReadOnly(false);
    obj.edit25:setCanFocus(true);
    obj.edit25:setCursor("IBeam");
    obj.edit25:setField("dexMultiplicador");
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout5);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26.grid.role = "col";
    obj.edit26.grid.width = 1;
    obj.edit26:setReadOnly(false);
    obj.edit26:setCanFocus(true);
    obj.edit26:setCursor("IBeam");
    obj.edit26:setField("dexExtra");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout5);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27.grid.role = "col";
    obj.edit27.grid.width = 1;
    obj.edit27:setReadOnly(true);
    obj.edit27:setCanFocus(false);
    obj.edit27:setCursor("default");
    obj.edit27:setField("dexTotal");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout1);
    obj.dataLink3:setFields({'dexNivel', 'dexClasse', 'dexRaca', 'dexTreino', 'dexOutro', 'dexMultiplicador', 'dexExtra'});
    obj.dataLink3:setName("dataLink3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6.grid.role = "row";
    obj.layout6.grid["min-height"] = 20;
    obj.layout6.grid["cnt-horz-align"] = "center";
    obj.layout6:setName("layout6");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout6);
    obj.label14.grid.role = "col";
    obj.label14.grid.width = 1;
    obj.label14:setText("Inteligência");
    obj.label14:setName("label14");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout6);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28.grid.role = "col";
    obj.edit28.grid.width = 1;
    obj.edit28:setReadOnly(false);
    obj.edit28:setCanFocus(true);
    obj.edit28:setCursor("IBeam");
    obj.edit28:setField("intNivel");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout6);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29.grid.role = "col";
    obj.edit29.grid.width = 1;
    obj.edit29:setReadOnly(false);
    obj.edit29:setCanFocus(true);
    obj.edit29:setCursor("IBeam");
    obj.edit29:setField("intClasse");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout6);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30.grid.role = "col";
    obj.edit30.grid.width = 1;
    obj.edit30:setReadOnly(false);
    obj.edit30:setCanFocus(true);
    obj.edit30:setCursor("IBeam");
    obj.edit30:setField("intRaca");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout6);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31.grid.role = "col";
    obj.edit31.grid.width = 1;
    obj.edit31:setReadOnly(false);
    obj.edit31:setCanFocus(true);
    obj.edit31:setCursor("IBeam");
    obj.edit31:setField("intTreino");
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout6);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32.grid.role = "col";
    obj.edit32.grid.width = 1;
    obj.edit32:setReadOnly(false);
    obj.edit32:setCanFocus(true);
    obj.edit32:setCursor("IBeam");
    obj.edit32:setField("intOutro");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout6);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33.grid.role = "col";
    obj.edit33.grid.width = 1;
    obj.edit33:setReadOnly(true);
    obj.edit33:setCanFocus(false);
    obj.edit33:setCursor("default");
    obj.edit33:setField("intBase");
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout6);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34.grid.role = "col";
    obj.edit34.grid.width = 1;
    obj.edit34:setReadOnly(false);
    obj.edit34:setCanFocus(true);
    obj.edit34:setCursor("IBeam");
    obj.edit34:setField("intMultiplicador");
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout6);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35.grid.role = "col";
    obj.edit35.grid.width = 1;
    obj.edit35:setReadOnly(false);
    obj.edit35:setCanFocus(true);
    obj.edit35:setCursor("IBeam");
    obj.edit35:setField("intExtra");
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout6);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36.grid.role = "col";
    obj.edit36.grid.width = 1;
    obj.edit36:setReadOnly(true);
    obj.edit36:setCanFocus(false);
    obj.edit36:setCursor("default");
    obj.edit36:setField("intTotal");
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout1);
    obj.dataLink4:setFields({'intNivel', 'intClasse', 'intRaca', 'intTreino', 'intOutro', 'intMultiplicador', 'intExtra'});
    obj.dataLink4:setName("dataLink4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7.grid.role = "row";
    obj.layout7.grid["min-height"] = 20;
    obj.layout7.grid["cnt-horz-align"] = "center";
    obj.layout7:setName("layout7");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout7);
    obj.label15.grid.role = "col";
    obj.label15.grid.width = 1;
    obj.label15:setText("Carisma");
    obj.label15:setName("label15");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout7);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37.grid.role = "col";
    obj.edit37.grid.width = 1;
    obj.edit37:setReadOnly(false);
    obj.edit37:setCanFocus(true);
    obj.edit37:setCursor("IBeam");
    obj.edit37:setField("carNivel");
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout7);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38.grid.role = "col";
    obj.edit38.grid.width = 1;
    obj.edit38:setReadOnly(false);
    obj.edit38:setCanFocus(true);
    obj.edit38:setCursor("IBeam");
    obj.edit38:setField("carClasse");
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout7);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39.grid.role = "col";
    obj.edit39.grid.width = 1;
    obj.edit39:setReadOnly(false);
    obj.edit39:setCanFocus(true);
    obj.edit39:setCursor("IBeam");
    obj.edit39:setField("carRaca");
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout7);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40.grid.role = "col";
    obj.edit40.grid.width = 1;
    obj.edit40:setReadOnly(false);
    obj.edit40:setCanFocus(true);
    obj.edit40:setCursor("IBeam");
    obj.edit40:setField("carTreino");
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout7);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41.grid.role = "col";
    obj.edit41.grid.width = 1;
    obj.edit41:setReadOnly(false);
    obj.edit41:setCanFocus(true);
    obj.edit41:setCursor("IBeam");
    obj.edit41:setField("carOutro");
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout7);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42.grid.role = "col";
    obj.edit42.grid.width = 1;
    obj.edit42:setReadOnly(true);
    obj.edit42:setCanFocus(false);
    obj.edit42:setCursor("default");
    obj.edit42:setField("carBase");
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout7);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43.grid.role = "col";
    obj.edit43.grid.width = 1;
    obj.edit43:setReadOnly(false);
    obj.edit43:setCanFocus(true);
    obj.edit43:setCursor("IBeam");
    obj.edit43:setField("carMultiplicador");
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout7);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44.grid.role = "col";
    obj.edit44.grid.width = 1;
    obj.edit44:setReadOnly(false);
    obj.edit44:setCanFocus(true);
    obj.edit44:setCursor("IBeam");
    obj.edit44:setField("carExtra");
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout7);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45.grid.role = "col";
    obj.edit45.grid.width = 1;
    obj.edit45:setReadOnly(true);
    obj.edit45:setCanFocus(false);
    obj.edit45:setCursor("default");
    obj.edit45:setField("carTotal");
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout1);
    obj.dataLink5:setFields({'carNivel', 'carClasse', 'carRaca', 'carTreino', 'carOutro', 'carMultiplicador', 'carExtra'});
    obj.dataLink5:setName("dataLink5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8.grid.role = "row";
    obj.layout8.grid["min-height"] = 20;
    obj.layout8.grid["cnt-horz-align"] = "center";
    obj.layout8:setName("layout8");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout8);
    obj.label16.grid.role = "col";
    obj.label16.grid.width = 1;
    obj.label16:setText("Sabedoria");
    obj.label16:setName("label16");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout8);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46.grid.role = "col";
    obj.edit46.grid.width = 1;
    obj.edit46:setReadOnly(false);
    obj.edit46:setCanFocus(true);
    obj.edit46:setCursor("IBeam");
    obj.edit46:setField("sabNivel");
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout8);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47.grid.role = "col";
    obj.edit47.grid.width = 1;
    obj.edit47:setReadOnly(false);
    obj.edit47:setCanFocus(true);
    obj.edit47:setCursor("IBeam");
    obj.edit47:setField("sabClasse");
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout8);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48.grid.role = "col";
    obj.edit48.grid.width = 1;
    obj.edit48:setReadOnly(false);
    obj.edit48:setCanFocus(true);
    obj.edit48:setCursor("IBeam");
    obj.edit48:setField("sabRaca");
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout8);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49.grid.role = "col";
    obj.edit49.grid.width = 1;
    obj.edit49:setReadOnly(false);
    obj.edit49:setCanFocus(true);
    obj.edit49:setCursor("IBeam");
    obj.edit49:setField("sabTreino");
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout8);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50.grid.role = "col";
    obj.edit50.grid.width = 1;
    obj.edit50:setReadOnly(false);
    obj.edit50:setCanFocus(true);
    obj.edit50:setCursor("IBeam");
    obj.edit50:setField("sabOutro");
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout8);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51.grid.role = "col";
    obj.edit51.grid.width = 1;
    obj.edit51:setReadOnly(true);
    obj.edit51:setCanFocus(false);
    obj.edit51:setCursor("default");
    obj.edit51:setField("sabBase");
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout8);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52.grid.role = "col";
    obj.edit52.grid.width = 1;
    obj.edit52:setReadOnly(false);
    obj.edit52:setCanFocus(true);
    obj.edit52:setCursor("IBeam");
    obj.edit52:setField("sabMultiplicador");
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout8);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53.grid.role = "col";
    obj.edit53.grid.width = 1;
    obj.edit53:setReadOnly(false);
    obj.edit53:setCanFocus(true);
    obj.edit53:setCursor("IBeam");
    obj.edit53:setField("sabExtra");
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout8);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54.grid.role = "col";
    obj.edit54.grid.width = 1;
    obj.edit54:setReadOnly(true);
    obj.edit54:setCanFocus(false);
    obj.edit54:setCursor("default");
    obj.edit54:setField("sabTotal");
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout1);
    obj.dataLink6:setFields({'sabNivel', 'sabClasse', 'sabRaca', 'sabTreino', 'sabOutro', 'sabMultiplicador', 'sabExtra'});
    obj.dataLink6:setName("dataLink6");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perfil");
    obj.tab2:setName("tab2");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.tab2);
    obj.layout9:setAlign("client");
    obj.layout9.grid.role = "container";
    obj.layout9:setName("layout9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10.grid.role = "col";
    obj.layout10.grid.width = 4;
    obj.layout10.grid["min-height"] = 60;
    obj.layout10:setName("layout10");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout10);
    obj.label17.grid.role = "row";
    obj.label17.grid["min-height"] = 40;
    obj.label17:setText("10");
    obj.label17:setFontSize(30);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout10);
    obj.label18.grid.role = "row";
    obj.label18.grid["min-height"] = 20;
    obj.label18:setText("Constituição");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout9);
    obj.layout11.grid.role = "col";
    obj.layout11.grid.width = 4;
    obj.layout11.grid["min-height"] = 60;
    obj.layout11:setName("layout11");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout11);
    obj.label19.grid.role = "row";
    obj.label19.grid["min-height"] = 40;
    obj.label19:setText("8");
    obj.label19:setFontSize(30);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout11);
    obj.label20.grid.role = "row";
    obj.label20.grid["min-height"] = 20;
    obj.label20:setText("Força");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout9);
    obj.layout12.grid.role = "col";
    obj.layout12.grid.width = 4;
    obj.layout12.grid["min-height"] = 60;
    obj.layout12:setName("layout12");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout12);
    obj.label21.grid.role = "row";
    obj.label21.grid["min-height"] = 40;
    obj.label21:setText("13");
    obj.label21:setFontSize(30);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout12);
    obj.label22.grid.role = "row";
    obj.label22.grid["min-height"] = 20;
    obj.label22:setText("Destreza");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout9);
    obj.layout13.grid.role = "col";
    obj.layout13.grid.width = 4;
    obj.layout13.grid["min-height"] = 60;
    obj.layout13:setName("layout13");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout13);
    obj.label23.grid.role = "row";
    obj.label23.grid["min-height"] = 40;
    obj.label23:setText("5");
    obj.label23:setFontSize(30);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout13);
    obj.label24.grid.role = "row";
    obj.label24.grid["min-height"] = 20;
    obj.label24:setText("Inteligência");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout9);
    obj.layout14.grid.role = "col";
    obj.layout14.grid.width = 4;
    obj.layout14.grid["min-height"] = 60;
    obj.layout14:setName("layout14");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout14);
    obj.label25.grid.role = "row";
    obj.label25.grid["min-height"] = 40;
    obj.label25:setText("100");
    obj.label25:setFontSize(30);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout14);
    obj.label26.grid.role = "row";
    obj.label26.grid["min-height"] = 20;
    obj.label26:setText("Sabedoria");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout9);
    obj.layout15.grid.role = "col";
    obj.layout15.grid.width = 4;
    obj.layout15.grid["min-height"] = 60;
    obj.layout15:setName("layout15");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout15);
    obj.label27.grid.role = "row";
    obj.label27.grid["min-height"] = 40;
    obj.label27:setText("48");
    obj.label27:setFontSize(30);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout15);
    obj.label28.grid.role = "row";
    obj.label28.grid["min-height"] = 20;
    obj.label28:setText("Carisma");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.conBase = (tonumber(sheet.conNivel) or 0) +
                            (tonumber(sheet.conClasse) or 0 ) +
                            (tonumber(sheet.conRaca) or 0) +
                            (tonumber(sheet.conTreino) or 0) +
                            (tonumber(sheet.conOutro) or 0);
            
                            sheet.conTotal = math.floor((tonumber(sheet.conBase) or 0) + 
                            ((((tonumber(sheet.conMultiplicador) or 0)/100)) * sheet.conBase) +
                            (tonumber(sheet.conExtra) or 0 ))
        end);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.forBase = (tonumber(sheet.forNivel) or 0) +
                            (tonumber(sheet.forClasse) or 0 ) +
                            (tonumber(sheet.forRaca) or 0) +
                            (tonumber(sheet.forTreino) or 0) +
                            (tonumber(sheet.forOutro) or 0);
            
                            sheet.forTotal = math.floor((tonumber(sheet.forBase) or 0) + 
                            ((((tonumber(sheet.forMultiplicador) or 0)/100)) * sheet.forBase) +
                            (tonumber(sheet.forExtra) or 0 ))
        end);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.dexBase = (tonumber(sheet.dexNivel) or 0) +
                            (tonumber(sheet.dexClasse) or 0 ) +
                            (tonumber(sheet.dexRaca) or 0) +
                            (tonumber(sheet.dexTreino) or 0) +
                            (tonumber(sheet.dexOutro) or 0);
            
                            sheet.dexTotal = math.floor((tonumber(sheet.dexBase) or 0) + 
                            ((((tonumber(sheet.dexMultiplicador) or 0)/100)) * sheet.dexBase) +
                            (tonumber(sheet.dexExtra) or 0 ))
        end);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.intBase = (tonumber(sheet.intNivel) or 0) +
                            (tonumber(sheet.intClasse) or 0 ) +
                            (tonumber(sheet.intRaca) or 0) +
                            (tonumber(sheet.intTreino) or 0) +
                            (tonumber(sheet.intOutro) or 0);
            
                            sheet.intTotal = math.floor((tonumber(sheet.intBase) or 0) + 
                            ((((tonumber(sheet.intMultiplicador) or 0)/100)) * sheet.intBase) +
                            (tonumber(sheet.intExtra) or 0 ))
        end);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.carBase = (tonumber(sheet.carNivel) or 0) +
                            (tonumber(sheet.carClasse) or 0 ) +
                            (tonumber(sheet.carRaca) or 0) +
                            (tonumber(sheet.carTreino) or 0) +
                            (tonumber(sheet.carOutro) or 0);
            
                            sheet.carTotal = math.floor((tonumber(sheet.carBase) or 0) + 
                            ((((tonumber(sheet.carMultiplicador) or 0)/100)) * sheet.carBase) +
                            (tonumber(sheet.carExtra) or 0 ))
        end);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.sabBase = (tonumber(sheet.sabNivel) or 0) +
                            (tonumber(sheet.sabClasse) or 0 ) +
                            (tonumber(sheet.sabRaca) or 0) +
                            (tonumber(sheet.sabTreino) or 0) +
                            (tonumber(sheet.sabOutro) or 0);
            
                            sheet.sabTotal = math.floor((tonumber(sheet.sabBase) or 0) + 
                            ((((tonumber(sheet.sabMultiplicador) or 0)/100)) * sheet.sabBase) +
                            (tonumber(sheet.sabExtra) or 0 ))
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
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

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
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
    cacheMode = "none", 
    title = "Ficha Automatizada Gaia", 
    description=""};

frmFichaDePersonagem = _frmFichaDePersonagem;
Firecast.registrarForm(_frmFichaDePersonagem);
Firecast.registrarDataType(_frmFichaDePersonagem);

return _frmFichaDePersonagem;
