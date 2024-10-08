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
    obj.tab1:setTitle("Perfil");
    obj.tab1:setName("tab1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1.grid.role = "container";
    obj.scrollBox1.grid["cnt-horz-align"] = "center";
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1.grid.role = "container";
    obj.layout1.grid["cnt-vert-align"] = "center";
    obj.layout1:setMargins({top=5, bottom=5});
    obj.layout1.grid["min-height"] = 40;
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2.grid.role = "col";
    obj.layout2.grid.width = 1;
    obj.layout2.grid["cnt-gutter"] = 5;
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1.grid.role = "col";
    obj.label1.grid.width = 6;
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nível:");
    lfm_setPropAsString(obj.label1, "fontStyle", "bold");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 6;
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setField("Nivel");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3.grid.role = "col";
    obj.layout3.grid.width = 3;
    obj.layout3.grid["cnt-gutter"] = 5;
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2.grid.role = "col";
    obj.label2.grid.width = 2;
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Nome:");
    lfm_setPropAsString(obj.label2, "fontStyle", "bold");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 10;
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("Nome");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4.grid.role = "col";
    obj.layout4.grid.width = 3;
    obj.layout4.grid["cnt-gutter"] = 5;
    obj.layout4:setName("layout4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3.grid.role = "col";
    obj.label3.grid.width = 2;
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Classe:");
    lfm_setPropAsString(obj.label3, "fontStyle", "bold");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 10;
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setField("Classe");
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5.grid.role = "col";
    obj.layout5.grid.width = 3;
    obj.layout5.grid["cnt-gutter"] = 5;
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4.grid.role = "col";
    obj.label4.grid.width = 2;
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("Raça:");
    lfm_setPropAsString(obj.label4, "fontStyle", "bold");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 10;
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setField("Raca");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6.grid.role = "col";
    obj.layout6.grid.width = 2;
    obj.layout6.grid["cnt-gutter"] = 5;
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5.grid.role = "col";
    obj.label5.grid.width = 7;
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Pontos de Destino:");
    lfm_setPropAsString(obj.label5, "fontStyle", "bold");
    obj.label5:setWordWrap(true);
    obj.label5.grid["min-height"] = 40;
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5.grid.role = "col";
    obj.edit5.grid.width = 5;
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setField("PontosDeDestino");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7.grid.role = "col";
    obj.layout7.grid.width = 2;
    obj.layout7.grid["min-height"] = 60;
    obj.layout7.grid["break-line-after"] = true;
    obj.layout7:setName("layout7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6.grid.role = "row";
    obj.label6.grid["min-height"] = 40;
    obj.label6:setField("vida");
    obj.label6:setFontSize(30);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontColor("red");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7.grid.role = "row";
    obj.label7.grid["min-height"] = 20;
    obj.label7:setText("Vida");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontColor("red");
    obj.label7:setName("label7");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("vidaTotal");
    obj.dataLink1:setName("dataLink1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8.grid.role = "col";
    obj.layout8.grid.width = 2;
    obj.layout8.grid["min-height"] = 60;
    obj.layout8.grid["break-line-after"] = false;
    obj.layout8:setName("layout8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8.grid.role = "row";
    obj.label8.grid["min-height"] = 40;
    obj.label8:setField("modcon");
    obj.label8:setFontSize(30);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontColor("white");
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout8);
    obj.label9.grid.role = "row";
    obj.label9.grid["min-height"] = 20;
    obj.label9:setText("Constituição");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setFontColor("white");
    obj.label9:setName("label9");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scrollBox1);
    obj.dataLink2:setField("conTotal");
    obj.dataLink2:setName("dataLink2");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox1);
    obj.layout9.grid.role = "col";
    obj.layout9.grid.width = 2;
    obj.layout9.grid["min-height"] = 60;
    obj.layout9.grid["break-line-after"] = false;
    obj.layout9:setName("layout9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10.grid.role = "row";
    obj.label10.grid["min-height"] = 40;
    obj.label10:setField("modfor");
    obj.label10:setFontSize(30);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontColor("white");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout9);
    obj.label11.grid.role = "row";
    obj.label11.grid["min-height"] = 20;
    obj.label11:setText("Força");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontColor("white");
    obj.label11:setName("label11");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.scrollBox1);
    obj.dataLink3:setField("forTotal");
    obj.dataLink3:setName("dataLink3");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10.grid.role = "col";
    obj.layout10.grid.width = 2;
    obj.layout10.grid["min-height"] = 60;
    obj.layout10.grid["break-line-after"] = true;
    obj.layout10:setName("layout10");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout10);
    obj.label12.grid.role = "row";
    obj.label12.grid["min-height"] = 40;
    obj.label12:setField("moddex");
    obj.label12:setFontSize(30);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontColor("white");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout10);
    obj.label13.grid.role = "row";
    obj.label13.grid["min-height"] = 20;
    obj.label13:setText("Destreza");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setFontColor("white");
    obj.label13:setName("label13");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.scrollBox1);
    obj.dataLink4:setField("dexTotal");
    obj.dataLink4:setName("dataLink4");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11.grid.role = "col";
    obj.layout11.grid.width = 2;
    obj.layout11.grid["min-height"] = 60;
    obj.layout11.grid["break-line-after"] = false;
    obj.layout11:setName("layout11");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14.grid.role = "row";
    obj.label14.grid["min-height"] = 40;
    obj.label14:setField("modcar");
    obj.label14:setFontSize(30);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontColor("white");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout11);
    obj.label15.grid.role = "row";
    obj.label15.grid["min-height"] = 20;
    obj.label15:setText("Carisma");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontColor("white");
    obj.label15:setName("label15");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.scrollBox1);
    obj.dataLink5:setField("carTotal");
    obj.dataLink5:setName("dataLink5");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox1);
    obj.layout12.grid.role = "col";
    obj.layout12.grid.width = 2;
    obj.layout12.grid["min-height"] = 60;
    obj.layout12.grid["break-line-after"] = false;
    obj.layout12:setName("layout12");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout12);
    obj.label16.grid.role = "row";
    obj.label16.grid["min-height"] = 40;
    obj.label16:setField("modint");
    obj.label16:setFontSize(30);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontColor("white");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout12);
    obj.label17.grid.role = "row";
    obj.label17.grid["min-height"] = 20;
    obj.label17:setText("Inteligência");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontColor("white");
    obj.label17:setName("label17");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.scrollBox1);
    obj.dataLink6:setField("intTotal");
    obj.dataLink6:setName("dataLink6");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox1);
    obj.layout13.grid.role = "col";
    obj.layout13.grid.width = 2;
    obj.layout13.grid["min-height"] = 60;
    obj.layout13.grid["break-line-after"] = true;
    obj.layout13:setName("layout13");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout13);
    obj.label18.grid.role = "row";
    obj.label18.grid["min-height"] = 40;
    obj.label18:setField("modsab");
    obj.label18:setFontSize(30);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setFontColor("white");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout13);
    obj.label19.grid.role = "row";
    obj.label19.grid["min-height"] = 20;
    obj.label19:setText("Sabedoria");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setFontColor("white");
    obj.label19:setName("label19");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.scrollBox1);
    obj.dataLink7:setField("sabTotal");
    obj.dataLink7:setName("dataLink7");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox1);
    obj.layout14.grid.role = "col";
    obj.layout14.grid.width = 2;
    obj.layout14.grid["min-height"] = 60;
    obj.layout14.grid["break-line-after"] = false;
    obj.layout14:setName("layout14");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout14);
    obj.label20.grid.role = "row";
    obj.label20.grid["min-height"] = 40;
    obj.label20:setField("modacerto");
    obj.label20:setFontSize(30);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setFontColor("white");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout14);
    obj.label21.grid.role = "row";
    obj.label21.grid["min-height"] = 20;
    obj.label21:setText("Acerto");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontColor("white");
    obj.label21:setName("label21");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.scrollBox1);
    obj.dataLink8:setField("acertoTotal");
    obj.dataLink8:setName("dataLink8");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.scrollBox1);
    obj.layout15.grid.role = "col";
    obj.layout15.grid.width = 2;
    obj.layout15.grid["min-height"] = 60;
    obj.layout15.grid["break-line-after"] = true;
    obj.layout15:setName("layout15");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout15);
    obj.label22.grid.role = "row";
    obj.label22.grid["min-height"] = 40;
    obj.label22:setField("modmira");
    obj.label22:setFontSize(30);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontColor("white");
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout15);
    obj.label23.grid.role = "row";
    obj.label23.grid["min-height"] = 20;
    obj.label23:setText("Mira");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontColor("white");
    obj.label23:setName("label23");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.scrollBox1);
    obj.dataLink9:setField("miraTotal");
    obj.dataLink9:setName("dataLink9");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox1);
    obj.layout16.grid.role = "col";
    obj.layout16.grid.width = 2;
    obj.layout16.grid["min-height"] = 60;
    obj.layout16.grid["break-line-after"] = false;
    obj.layout16:setName("layout16");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout16);
    obj.label24.grid.role = "row";
    obj.label24.grid["min-height"] = 40;
    obj.label24:setField("modbloqueio");
    obj.label24:setFontSize(30);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontColor("white");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout16);
    obj.label25.grid.role = "row";
    obj.label25.grid["min-height"] = 20;
    obj.label25:setText("Bloqueio");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontColor("white");
    obj.label25:setName("label25");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.scrollBox1);
    obj.dataLink10:setField("bloqueioTotal");
    obj.dataLink10:setName("dataLink10");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox1);
    obj.layout17.grid.role = "col";
    obj.layout17.grid.width = 2;
    obj.layout17.grid["min-height"] = 60;
    obj.layout17.grid["break-line-after"] = false;
    obj.layout17:setName("layout17");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout17);
    obj.label26.grid.role = "row";
    obj.label26.grid["min-height"] = 40;
    obj.label26:setField("modesquiva");
    obj.label26:setFontSize(30);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setFontColor("white");
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout17);
    obj.label27.grid.role = "row";
    obj.label27.grid["min-height"] = 20;
    obj.label27:setText("Esquiva");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontColor("white");
    obj.label27:setName("label27");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.scrollBox1);
    obj.dataLink11:setField("esquivaTotal");
    obj.dataLink11:setName("dataLink11");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.scrollBox1);
    obj.label28:setText("Pontos Bônus");
    obj.label28:setFontSize(40);
    lfm_setPropAsString(obj.label28, "fontStyle", "bold italic");
    obj.label28.grid.role = "row";
    obj.label28.grid["min-height"] = 40;
    obj.label28:setHorzTextAlign("center");
    obj.label28:setMargins({top=10, bottom=10});
    obj.label28:setName("label28");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox1);
    obj.layout18.grid.role = "container";
    obj.layout18.grid["cnt-horz-align"] = "center";
    obj.layout18.grid["cnt-vert-align"] = "center";
    obj.layout18:setMargins({top=10});
    obj.layout18:setName("layout18");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout18);
    obj.label29.grid.role = "col";
    obj.label29.grid.width = 1;
    obj.label29:setText("Adestramento");
    obj.label29:setName("label29");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout18);
    obj.edit6.grid.role = "col";
    obj.edit6.grid.width = 1;
    obj.edit6:setField("Adestramento");
    obj.edit6.grid["break-line-after"] = true;
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setReadOnly(false);
    obj.edit6:setCanFocus(true);
    obj.edit6:setCursor("IBeam");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout18);
    obj.label30.grid.role = "col";
    obj.label30.grid.width = 1;
    obj.label30:setText("Artesanato");
    obj.label30:setName("label30");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout18);
    obj.edit7.grid.role = "col";
    obj.edit7.grid.width = 1;
    obj.edit7:setField("Artesanato");
    obj.edit7.grid["break-line-after"] = true;
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setReadOnly(false);
    obj.edit7:setCanFocus(true);
    obj.edit7:setCursor("IBeam");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout18);
    obj.label31.grid.role = "col";
    obj.label31.grid.width = 1;
    obj.label31:setText("Furtividade");
    obj.label31:setName("label31");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout18);
    obj.edit8.grid.role = "col";
    obj.edit8.grid.width = 1;
    obj.edit8:setField("Furtividade");
    obj.edit8.grid["break-line-after"] = true;
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setReadOnly(false);
    obj.edit8:setCanFocus(true);
    obj.edit8:setCursor("IBeam");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout18);
    obj.label32.grid.role = "col";
    obj.label32.grid.width = 1;
    obj.label32:setText("Intimidação");
    obj.label32:setName("label32");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout18);
    obj.edit9.grid.role = "col";
    obj.edit9.grid.width = 1;
    obj.edit9:setField("Intimidacao");
    obj.edit9.grid["break-line-after"] = true;
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setReadOnly(false);
    obj.edit9:setCanFocus(true);
    obj.edit9:setCursor("IBeam");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout18);
    obj.label33.grid.role = "col";
    obj.label33.grid.width = 1;
    obj.label33:setText("Intuição");
    obj.label33:setName("label33");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout18);
    obj.edit10.grid.role = "col";
    obj.edit10.grid.width = 1;
    obj.edit10:setField("Intuicao");
    obj.edit10.grid["break-line-after"] = true;
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setReadOnly(false);
    obj.edit10:setCanFocus(true);
    obj.edit10:setCursor("IBeam");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout18);
    obj.label34.grid.role = "col";
    obj.label34.grid.width = 1;
    obj.label34:setText("Percepção");
    obj.label34:setName("label34");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout18);
    obj.edit11.grid.role = "col";
    obj.edit11.grid.width = 1;
    obj.edit11:setField("Percepcao");
    obj.edit11.grid["break-line-after"] = true;
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setReadOnly(false);
    obj.edit11:setCanFocus(true);
    obj.edit11:setCursor("IBeam");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout18);
    obj.label35.grid.role = "col";
    obj.label35.grid.width = 1;
    obj.label35:setText("Persuasão");
    obj.label35:setName("label35");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout18);
    obj.edit12.grid.role = "col";
    obj.edit12.grid.width = 1;
    obj.edit12:setField("Persuasao");
    obj.edit12.grid["break-line-after"] = true;
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setReadOnly(false);
    obj.edit12:setCanFocus(true);
    obj.edit12:setCursor("IBeam");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout18);
    obj.label36.grid.role = "col";
    obj.label36.grid.width = 1;
    obj.label36:setText("Didática");
    obj.label36:setName("label36");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout18);
    obj.edit13.grid.role = "col";
    obj.edit13.grid.width = 1;
    obj.edit13:setField("Didatica");
    obj.edit13.grid["break-line-after"] = true;
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setReadOnly(true);
    obj.edit13:setCanFocus(false);
    obj.edit13:setCursor("default");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.scrollBox1);
    obj.dataLink12:setFields({'sabTotal', 'Nivel'});
    obj.dataLink12:setName("dataLink12");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.scrollBox1);
    obj.label37:setText("Conhecimentos Específicos");
    obj.label37:setFontSize(40);
    lfm_setPropAsString(obj.label37, "fontStyle", "bold italic");
    obj.label37.grid.role = "row";
    obj.label37.grid["min-height"] = 40;
    obj.label37:setHorzTextAlign("center");
    obj.label37:setMargins({top=10, bottom=10});
    obj.label37:setName("label37");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox1);
    obj.layout19.grid.role = "container";
    obj.layout19.grid["cnt-horz-align"] = "center";
    obj.layout19.grid["cnt-vert-align"] = "center";
    obj.layout19:setMargins({top=10});
    obj.layout19:setName("layout19");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout19);
    obj.label38.grid.role = "col";
    obj.label38.grid.width = 1;
    obj.label38:setText("Alquimia");
    obj.label38:setName("label38");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout19);
    obj.edit14.grid.role = "col";
    obj.edit14.grid.width = 1;
    obj.edit14:setField("Alquimia");
    obj.edit14.grid["break-line-after"] = true;
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setReadOnly(false);
    obj.edit14:setCanFocus(true);
    obj.edit14:setCursor("IBeam");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout19);
    obj.label39.grid.role = "col";
    obj.label39.grid.width = 1;
    obj.label39:setText("Biologia");
    obj.label39:setName("label39");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout19);
    obj.edit15.grid.role = "col";
    obj.edit15.grid.width = 1;
    obj.edit15:setField("Biologia");
    obj.edit15.grid["break-line-after"] = true;
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setReadOnly(false);
    obj.edit15:setCanFocus(true);
    obj.edit15:setCursor("IBeam");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout19);
    obj.label40.grid.role = "col";
    obj.label40.grid.width = 1;
    obj.label40:setText("Geografia");
    obj.label40:setName("label40");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout19);
    obj.edit16.grid.role = "col";
    obj.edit16.grid.width = 1;
    obj.edit16:setField("Geografia");
    obj.edit16.grid["break-line-after"] = true;
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setReadOnly(false);
    obj.edit16:setCanFocus(true);
    obj.edit16:setCursor("IBeam");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout19);
    obj.label41.grid.role = "col";
    obj.label41.grid.width = 1;
    obj.label41:setText("História");
    obj.label41:setName("label41");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout19);
    obj.edit17.grid.role = "col";
    obj.edit17.grid.width = 1;
    obj.edit17:setField("Historia");
    obj.edit17.grid["break-line-after"] = true;
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setReadOnly(false);
    obj.edit17:setCanFocus(true);
    obj.edit17:setCursor("IBeam");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout19);
    obj.label42.grid.role = "col";
    obj.label42.grid.width = 1;
    obj.label42:setText("Magia");
    obj.label42:setName("label42");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout19);
    obj.edit18.grid.role = "col";
    obj.edit18.grid.width = 1;
    obj.edit18:setField("Magia");
    obj.edit18.grid["break-line-after"] = true;
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setReadOnly(false);
    obj.edit18:setCanFocus(true);
    obj.edit18:setCursor("IBeam");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout19);
    obj.label43.grid.role = "col";
    obj.label43.grid.width = 1;
    obj.label43:setText("Religião");
    obj.label43:setName("label43");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout19);
    obj.edit19.grid.role = "col";
    obj.edit19.grid.width = 1;
    obj.edit19:setField("Religiao");
    obj.edit19.grid["break-line-after"] = true;
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setReadOnly(false);
    obj.edit19:setCanFocus(true);
    obj.edit19:setCursor("IBeam");
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout19);
    obj.label44.grid.role = "col";
    obj.label44.grid.width = 1;
    obj.label44:setText("Sobrevivência");
    obj.label44:setName("label44");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout19);
    obj.edit20.grid.role = "col";
    obj.edit20.grid.width = 1;
    obj.edit20:setField("Sobrevivencia");
    obj.edit20.grid["break-line-after"] = true;
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setReadOnly(false);
    obj.edit20:setCanFocus(true);
    obj.edit20:setCursor("IBeam");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout19);
    obj.label45.grid.role = "col";
    obj.label45.grid.width = 1;
    obj.label45:setText("L. Comum");
    obj.label45:setName("label45");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout19);
    obj.edit21.grid.role = "col";
    obj.edit21.grid.width = 1;
    obj.edit21:setField("Comum");
    obj.edit21.grid["break-line-after"] = true;
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setReadOnly(false);
    obj.edit21:setCanFocus(true);
    obj.edit21:setCursor("IBeam");
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout19);
    obj.label46.grid.role = "col";
    obj.label46.grid.width = 1;
    obj.label46:setText("L. Oriental");
    obj.label46:setName("label46");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout19);
    obj.edit22.grid.role = "col";
    obj.edit22.grid.width = 1;
    obj.edit22:setField("Oriental");
    obj.edit22.grid["break-line-after"] = true;
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setReadOnly(false);
    obj.edit22:setCanFocus(true);
    obj.edit22:setCursor("IBeam");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout19);
    obj.label47.grid.role = "col";
    obj.label47.grid.width = 1;
    obj.label47:setText("L. Élfica");
    obj.label47:setName("label47");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout19);
    obj.edit23.grid.role = "col";
    obj.edit23.grid.width = 1;
    obj.edit23:setField("Elfica");
    obj.edit23.grid["break-line-after"] = true;
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setReadOnly(false);
    obj.edit23:setCanFocus(true);
    obj.edit23:setCursor("IBeam");
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout19);
    obj.label48.grid.role = "col";
    obj.label48.grid.width = 1;
    obj.label48:setText("L. Anã");
    obj.label48:setName("label48");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout19);
    obj.edit24.grid.role = "col";
    obj.edit24.grid.width = 1;
    obj.edit24:setField("Ana");
    obj.edit24.grid["break-line-after"] = true;
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setReadOnly(false);
    obj.edit24:setCanFocus(true);
    obj.edit24:setCursor("IBeam");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout19);
    obj.label49.grid.role = "col";
    obj.label49.grid.width = 1;
    obj.label49:setText("L. Dracônica");
    obj.label49:setName("label49");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout19);
    obj.edit25.grid.role = "col";
    obj.edit25.grid.width = 1;
    obj.edit25:setField("Draconica");
    obj.edit25.grid["break-line-after"] = true;
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setReadOnly(false);
    obj.edit25:setCanFocus(true);
    obj.edit25:setCursor("IBeam");
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout19);
    obj.label50.grid.role = "col";
    obj.label50.grid.width = 1;
    obj.label50:setText("L. Espiritual");
    obj.label50:setName("label50");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout19);
    obj.edit26.grid.role = "col";
    obj.edit26.grid.width = 1;
    obj.edit26:setField("Espiritual");
    obj.edit26.grid["break-line-after"] = true;
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setReadOnly(false);
    obj.edit26:setCanFocus(true);
    obj.edit26:setCursor("IBeam");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout19);
    obj.label51.grid.role = "col";
    obj.label51.grid.width = 1;
    obj.label51:setText("L. Abissal");
    obj.label51:setName("label51");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout19);
    obj.edit27.grid.role = "col";
    obj.edit27.grid.width = 1;
    obj.edit27:setField("Abissal");
    obj.edit27.grid["break-line-after"] = true;
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setReadOnly(false);
    obj.edit27:setCanFocus(true);
    obj.edit27:setCursor("IBeam");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout19);
    obj.label52.grid.role = "col";
    obj.label52.grid.width = 1;
    obj.label52:setText("L. Divina");
    obj.label52:setName("label52");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout19);
    obj.edit28.grid.role = "col";
    obj.edit28.grid.width = 1;
    obj.edit28:setField("Divina");
    obj.edit28.grid["break-line-after"] = true;
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setReadOnly(false);
    obj.edit28:setCanFocus(true);
    obj.edit28:setCursor("IBeam");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout19);
    obj.label53.grid.role = "col";
    obj.label53.grid.width = 1;
    obj.label53:setText("L. Demoníaca");
    obj.label53:setName("label53");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout19);
    obj.edit29.grid.role = "col";
    obj.edit29.grid.width = 1;
    obj.edit29:setField("Demoniaca");
    obj.edit29.grid["break-line-after"] = true;
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setReadOnly(false);
    obj.edit29:setCanFocus(true);
    obj.edit29:setCursor("IBeam");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout19);
    obj.label54.grid.role = "col";
    obj.label54.grid.width = 1;
    obj.label54:setText("L. Antiga");
    obj.label54:setName("label54");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout19);
    obj.edit30.grid.role = "col";
    obj.edit30.grid.width = 1;
    obj.edit30:setField("Antiga");
    obj.edit30.grid["break-line-after"] = true;
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setReadOnly(true);
    obj.edit30:setCanFocus(false);
    obj.edit30:setCursor("default");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.scrollBox1);
    obj.dataLink13:setFields({'Elfica', 'Draconica'});
    obj.dataLink13:setName("dataLink13");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Equipamentos");
    obj.tab2:setName("tab2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab2);
    obj.scrollBox2.grid.role = "container";
    obj.scrollBox2.grid["cnt-horz-align"] = "center";
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");



        function atualizaAtributos()
        local vida         = 0
        local con          = 0
        local forc         = 0
        local dex          = 0
        local car          = 0
        local int          = 0
        local sab          = 0
        local acerto       = 0
        local mira         = 0
        local esquiva      = 0
        local bloqueio     = 0
        local equipamentos = NDB.getChildNodes(sheet.equipamentos)
    
        for i, item in ipairs(equipamentos) do
            local atributos = NDB.getChildNodes(item.atributosEquipamento)
            for r, atributo in ipairs(atributos) do
                if atributo.tipoDeCalculo == "Fixo" then
                    if atributo.nomeAtributo == "vida" then
                        vida = vida + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "con" then
                        con = con + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "for" then
                        forc = forc + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "dex" then
                        dex = dex + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "car" then
                        car = car + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "int" then
                        int = int + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "sab" then
                        sab = sab + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "acerto" then
                        acerto = acerto + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "mira" then
                        mira = mira + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "esquiva" then
                        esquiva = esquiva + (atributo.valorAtributo or 0)
                    elseif atributo.nomeAtributo == "bloqueio" then
                        bloqueio = bloqueio + (atributo.valorAtributo or 0)
                    end
                elseif atributo.tipoDeCalculo == "Porcentagem" then
                    if atributo.nomeAtributo == "vida" then
                        vida = vida + math.floor((atributo.valorAtributo or 0) / 100 * sheet.conBase)
                    elseif atributo.nomeAtributo == "con" then
                        con = con + math.floor((atributo.valorAtributo or 0) / 100 * sheet.conBase)
                    elseif atributo.nomeAtributo == "for" then
                        forc = forc + math.floor((atributo.valorAtributo or 0) / 100 * sheet.forBase)
                    elseif atributo.nomeAtributo == "dex" then
                        dex = dex + math.floor((atributo.valorAtributo or 0) / 100 * sheet.dexBase)
                    elseif atributo.nomeAtributo == "car" then
                        car = car + math.floor((atributo.valorAtributo or 0) / 100 * sheet.carBase)
                    elseif atributo.nomeAtributo == "int" then
                        int = int + math.floor((atributo.valorAtributo or 0) / 100 * sheet.intBase)
                    elseif atributo.nomeAtributo == "sab" then
                        sab = sab + math.floor((atributo.valorAtributo or 0) / 100 * sheet.sabBase)
                    elseif atributo.nomeAtributo == "acerto" then
                        acerto = acerto + math.floor((atributo.valorAtributo or 0) / 100 * sheet.acertoBase)
                    elseif atributo.nomeAtributo == "mira" then
                        mira = mira + math.floor((atributo.valorAtributo or 0) / 100 * sheet.miraBase)
                    elseif atributo.nomeAtributo == "esquiva" then
                        esquiva = esquiva + math.floor((atributo.valorAtributo or 0) / 100 * sheet.esquivaBase)
                    elseif atributo.nomeAtributo == "bloqueio" then
                        bloqueio = bloqueio + math.floor((atributo.valorAtributo or 0) / 100 * sheet.bloqueioBase)
                    end
                elseif atributo.tipoDeCalculo == "Incremento" then
                    if atributo.nomeAtributo == "vida" then
                        vida = vida +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "con" then
                        con = con +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "for" then
                        forc = forc +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "dex" then
                        dex = dex +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "car" then
                        car = car +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "int" then
                        int = int +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "sab" then
                        sab = sab +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "acerto" then
                        acerto = acerto +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "mira" then
                        mira = mira +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "esquiva" then
                        esquiva = esquiva +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "bloqueio" then
                        bloqueio = bloqueio +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    end
                elseif atributo.tipoDeCalculo == "FixoXNivel" then
                    if atributo.nomeAtributo == "vida" then
                        vida = vida + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "con" then
                        con = con + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "for" then
                        forc = forc + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "dex" then
                        dex = dex + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "car" then
                        car = car + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "int" then
                        int = int + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "sab" then
                        sab = sab + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "acerto" then
                        acerto = acerto + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "mira" then
                        mira = mira + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "esquiva" then
                        esquiva = esquiva + atributo.valorAtributo * (sheet.Nivel or 0)
                    elseif atributo.nomeAtributo == "bloqueio" then
                        bloqueio = bloqueio + atributo.valorAtributo * (sheet.Nivel or 0)
                    end
                elseif atributo.tipoDeCalculo == "PorcentagemXNivel" then
                    if atributo.nomeAtributo == "vida" then
                        vida = vida + math.floor((atributo.valorAtributo or 0) / 100 * sheet.conBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "con" then
                        con = con + math.floor((atributo.valorAtributo or 0) / 100 * sheet.conBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "for" then
                        forc = forc + math.floor((atributo.valorAtributo or 0) / 100 * sheet.forBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "dex" then
                        dex = dex + math.floor((atributo.valorAtributo or 0) / 100 * sheet.dexBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "car" then
                        car = car + math.floor((atributo.valorAtributo or 0) / 100 * sheet.carBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "int" then
                        int = int + math.floor((atributo.valorAtributo or 0) / 100 * sheet.intBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "sab" then
                        sab = sab + math.floor((atributo.valorAtributo or 0) / 100 * sheet.sabBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "acerto" then
                        acerto = acerto +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet.acertoBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "mira" then
                        mira = mira + math.floor((atributo.valorAtributo or 0) / 100 * sheet.miraBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "esquiva" then
                        esquiva = esquiva +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet.esquivaBase * (sheet.Nivel or 0))
                    elseif atributo.nomeAtributo == "bloqueio" then
                        bloqueio = bloqueio +
                            math.floor((atributo.valorAtributo or 0) / 100 * sheet.bloqueioBase * (sheet.Nivel or 0))
                    end
                elseif atributo.tipoDeCalculo == "IncrementoXNivel" then
                    if atributo.nomeAtributo == "vida" then
                        vida = vida +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "con" then
                        con = con +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "for" then
                        forc = forc +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "dex" then
                        dex = dex +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "car" then
                        car = car +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "int" then
                        int = int +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "sab" then
                        sab = sab +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "acerto" then
                        acerto = acerto +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "mira" then
                        mira = mira +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "esquiva" then
                        esquiva = esquiva +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    elseif atributo.nomeAtributo == "bloqueio" then
                        bloqueio = bloqueio +
                            math.floor(((atributo.valorAtributo or 0) / 100 * (sheet.Nivel or 0)) * sheet
                                [tostring(atributo.nomeAtributoOrigem .. "Base")])
                    end
                end
            end
        end
    
        sheet.conEquipTotal = con
        sheet.forEquipTotal = forc
        sheet.dexEquipTotal = dex
        sheet.carEquipTotal = car
        sheet.intEquipTotal = int
        sheet.sabEquipTotal = sab
        sheet.acertoEquipTotal = acerto
        sheet.miraEquipTotal = mira
        sheet.esquivaEquipTotal = esquiva
        sheet.bloqueioEquipTotal = bloqueio
    
        sheet.vidaEquipamentos = vida
        sheet.acertoEquipamentos = acerto
        sheet.miraEquipamentos = mira
        sheet.esquivaEquipamentos = esquiva
        sheet.bloqueioEquipamentos = bloqueio
        sheet.conEquipamentos = con
        sheet.forEquipamentos = forc
        sheet.dexEquipamentos = dex
        sheet.carEquipamentos = car
        sheet.intEquipamentos = int
        sheet.sabEquipamentos = sab
    end
    


    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.scrollBox2);
    obj.label55:setText("Atributos totais recebidos de equipamentos");
    obj.label55.grid.role = "row";
    obj.label55.grid["min-height"] = 20;
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.scrollBox2);
    obj.label56:setText("Constituição");
    obj.label56.grid.role = "col";
    obj.label56.grid.width = 1;
    obj.label56:setName("label56");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.scrollBox2);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31.grid.role = "col";
    obj.edit31.grid.width = 1;
    obj.edit31:setReadOnly(true);
    obj.edit31:setCanFocus(false);
    obj.edit31:setField("conEquipTotal");
    obj.edit31:setCursor("default");
    obj.edit31.grid["break-line-after"] = false;
    obj.edit31:setName("edit31");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.scrollBox2);
    obj.label57:setText("Força");
    obj.label57.grid.role = "col";
    obj.label57.grid.width = 1;
    obj.label57:setName("label57");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.scrollBox2);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32.grid.role = "col";
    obj.edit32.grid.width = 1;
    obj.edit32:setReadOnly(true);
    obj.edit32:setCanFocus(false);
    obj.edit32:setField("forEquipTotal");
    obj.edit32:setCursor("default");
    obj.edit32.grid["break-line-after"] = false;
    obj.edit32:setName("edit32");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.scrollBox2);
    obj.label58:setText("Destreza");
    obj.label58.grid.role = "col";
    obj.label58.grid.width = 1;
    obj.label58:setName("label58");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.scrollBox2);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33.grid.role = "col";
    obj.edit33.grid.width = 1;
    obj.edit33:setReadOnly(true);
    obj.edit33:setCanFocus(false);
    obj.edit33:setField("dexEquipTotal");
    obj.edit33:setCursor("default");
    obj.edit33.grid["break-line-after"] = false;
    obj.edit33:setName("edit33");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.scrollBox2);
    obj.label59:setText("Acerto");
    obj.label59.grid.role = "col";
    obj.label59.grid.width = 1;
    obj.label59:setName("label59");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.scrollBox2);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34.grid.role = "col";
    obj.edit34.grid.width = 1;
    obj.edit34:setReadOnly(true);
    obj.edit34:setCanFocus(false);
    obj.edit34:setField("acertoEquipTotal");
    obj.edit34:setCursor("default");
    obj.edit34.grid["break-line-after"] = false;
    obj.edit34:setName("edit34");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.scrollBox2);
    obj.label60:setText("Mira");
    obj.label60.grid.role = "col";
    obj.label60.grid.width = 1;
    obj.label60:setName("label60");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.scrollBox2);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35.grid.role = "col";
    obj.edit35.grid.width = 1;
    obj.edit35:setReadOnly(true);
    obj.edit35:setCanFocus(false);
    obj.edit35:setField("miraEquipTotal");
    obj.edit35:setCursor("default");
    obj.edit35.grid["break-line-after"] = true;
    obj.edit35:setName("edit35");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.scrollBox2);
    obj.label61:setText("Carisma");
    obj.label61.grid.role = "col";
    obj.label61.grid.width = 1;
    obj.label61:setName("label61");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.scrollBox2);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36.grid.role = "col";
    obj.edit36.grid.width = 1;
    obj.edit36:setReadOnly(true);
    obj.edit36:setCanFocus(false);
    obj.edit36:setField("carEquipTotal");
    obj.edit36:setCursor("default");
    obj.edit36.grid["break-line-after"] = false;
    obj.edit36:setName("edit36");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.scrollBox2);
    obj.label62:setText("Inteligência");
    obj.label62.grid.role = "col";
    obj.label62.grid.width = 1;
    obj.label62:setName("label62");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.scrollBox2);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37.grid.role = "col";
    obj.edit37.grid.width = 1;
    obj.edit37:setReadOnly(true);
    obj.edit37:setCanFocus(false);
    obj.edit37:setField("intEquipTotal");
    obj.edit37:setCursor("default");
    obj.edit37.grid["break-line-after"] = false;
    obj.edit37:setName("edit37");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.scrollBox2);
    obj.label63:setText("Sabedoria");
    obj.label63.grid.role = "col";
    obj.label63.grid.width = 1;
    obj.label63:setName("label63");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.scrollBox2);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38.grid.role = "col";
    obj.edit38.grid.width = 1;
    obj.edit38:setReadOnly(true);
    obj.edit38:setCanFocus(false);
    obj.edit38:setField("sabEquipTotal");
    obj.edit38:setCursor("default");
    obj.edit38.grid["break-line-after"] = false;
    obj.edit38:setName("edit38");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.scrollBox2);
    obj.label64:setText("Esquiva");
    obj.label64.grid.role = "col";
    obj.label64.grid.width = 1;
    obj.label64:setName("label64");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.scrollBox2);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39.grid.role = "col";
    obj.edit39.grid.width = 1;
    obj.edit39:setReadOnly(true);
    obj.edit39:setCanFocus(false);
    obj.edit39:setField("esquivaEquipTotal");
    obj.edit39:setCursor("default");
    obj.edit39.grid["break-line-after"] = false;
    obj.edit39:setName("edit39");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.scrollBox2);
    obj.label65:setText("Bloqueio");
    obj.label65.grid.role = "col";
    obj.label65.grid.width = 1;
    obj.label65:setName("label65");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.scrollBox2);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40.grid.role = "col";
    obj.edit40.grid.width = 1;
    obj.edit40:setReadOnly(true);
    obj.edit40:setCanFocus(false);
    obj.edit40:setField("bloqueioEquipTotal");
    obj.edit40:setCursor("default");
    obj.edit40.grid["break-line-after"] = true;
    obj.edit40:setName("edit40");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox2);
    obj.button1.grid.role = "col";
    obj.button1.grid.width = 3;
    obj.button1.grid["min-height"] = 30;
    obj.button1:setText("Adiciona Item");
    obj.button1.grid["break-line-after"] = true;
    obj.button1:setName("button1");

    obj.rclEquipamentos = GUI.fromHandle(_obj_newObject("gridRecordList"));
    obj.rclEquipamentos:setParent(obj.scrollBox2);
    obj.rclEquipamentos:setName("rclEquipamentos");
    obj.rclEquipamentos.field = "equipamentos";
    obj.rclEquipamentos.templateForm = "frmEquipamentos";
    obj.rclEquipamentos.grid.role = "container";
    obj.rclEquipamentos.grid.width = 10;

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox2);
    obj.button2:setText("Atualiza");
    obj.button2:setName("button2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Atributos");
    obj.tab3:setName("tab3");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab3);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3.grid.role = "container";
    obj.scrollBox3:setName("scrollBox3");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox3);
    obj.layout20.grid.role = "row";
    obj.layout20.grid["min-height"] = 20;
    obj.layout20.grid["cnt-horz-align"] = "center";
    obj.layout20:setName("layout20");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout20);
    obj.label66:setText("");
    obj.label66.grid.role = "col";
    obj.label66.grid.width = 1;
    obj.label66.grid["min-height"] = 20;
    obj.label66:setHorzTextAlign("center");
    obj.label66:setFontColor("red");
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout20);
    obj.label67:setText("Constituição");
    obj.label67.grid.role = "col";
    obj.label67.grid.width = 1;
    obj.label67.grid["min-height"] = 20;
    obj.label67:setHorzTextAlign("center");
    obj.label67:setFontColor("red");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout20);
    obj.label68:setText("Multiplicador");
    obj.label68.grid.role = "col";
    obj.label68.grid.width = 1;
    obj.label68.grid["min-height"] = 20;
    obj.label68:setHorzTextAlign("center");
    obj.label68:setFontColor("red");
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout20);
    obj.label69:setText("Equipamento");
    obj.label69.grid.role = "col";
    obj.label69.grid.width = 1;
    obj.label69.grid["min-height"] = 20;
    obj.label69:setHorzTextAlign("center");
    obj.label69:setFontColor("red");
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout20);
    obj.label70:setText("Extra");
    obj.label70.grid.role = "col";
    obj.label70.grid.width = 1;
    obj.label70.grid["min-height"] = 20;
    obj.label70:setHorzTextAlign("center");
    obj.label70:setFontColor("red");
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout20);
    obj.label71:setText("Total");
    obj.label71.grid.role = "col";
    obj.label71.grid.width = 1;
    obj.label71.grid["min-height"] = 20;
    obj.label71:setHorzTextAlign("center");
    obj.label71:setFontColor("red");
    obj.label71:setName("label71");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox3);
    obj.layout21.grid.role = "row";
    obj.layout21.grid["min-height"] = 20;
    obj.layout21.grid["cnt-horz-align"] = "center";
    obj.layout21:setName("layout21");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout21);
    obj.label72.grid.role = "col";
    obj.label72.grid.width = 1;
    obj.label72:setText("Vida");
    obj.label72:setFontColor("red");
    obj.label72:setName("label72");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout21);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41.grid.role = "col";
    obj.edit41.grid.width = 1;
    obj.edit41:setFontColor("red");
    obj.edit41:setReadOnly(false);
    obj.edit41:setCanFocus(true);
    obj.edit41:setCursor("IBeam");
    obj.edit41:setField("vidaCon");
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout21);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42.grid.role = "col";
    obj.edit42.grid.width = 1;
    obj.edit42:setFontColor("red");
    obj.edit42:setReadOnly(false);
    obj.edit42:setCanFocus(true);
    obj.edit42:setCursor("IBeam");
    obj.edit42:setField("vidaMultiplicador");
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout21);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43.grid.role = "col";
    obj.edit43.grid.width = 1;
    obj.edit43:setFontColor("red");
    obj.edit43:setReadOnly(true);
    obj.edit43:setCanFocus(false);
    obj.edit43:setCursor("default");
    obj.edit43:setField("vidaEquipamentos");
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout21);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44.grid.role = "col";
    obj.edit44.grid.width = 1;
    obj.edit44:setFontColor("red");
    obj.edit44:setReadOnly(false);
    obj.edit44:setCanFocus(true);
    obj.edit44:setCursor("IBeam");
    obj.edit44:setField("vidaExtra");
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout21);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45.grid.role = "col";
    obj.edit45.grid.width = 1;
    obj.edit45:setFontColor("red");
    obj.edit45:setReadOnly(true);
    obj.edit45:setCanFocus(false);
    obj.edit45:setCursor("default");
    obj.edit45:setField("vidaTotal");
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.scrollBox3);
    obj.dataLink14:setFields({'conBase', 'vidaCon', 'vidaMultiplicador', 'vidaEquipamentos', 'vidaExtra', 'vidaTotal'});
    obj.dataLink14:setName("dataLink14");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox3);
    obj.layout22.grid.role = "row";
    obj.layout22.grid["min-height"] = 20;
    obj.layout22.grid["cnt-horz-align"] = "center";
    obj.layout22:setName("layout22");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout22);
    obj.label73:setText("");
    obj.label73.grid.role = "col";
    obj.label73.grid.width = 1;
    obj.label73.grid["min-height"] = 20;
    obj.label73:setHorzTextAlign("center");
    obj.label73:setFontColor("white");
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout22);
    obj.label74:setText("Nível");
    obj.label74.grid.role = "col";
    obj.label74.grid.width = 1;
    obj.label74.grid["min-height"] = 20;
    obj.label74:setHorzTextAlign("center");
    obj.label74:setFontColor("white");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout22);
    obj.label75:setText("Classe");
    obj.label75.grid.role = "col";
    obj.label75.grid.width = 1;
    obj.label75.grid["min-height"] = 20;
    obj.label75:setHorzTextAlign("center");
    obj.label75:setFontColor("white");
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout22);
    obj.label76:setText("Raça");
    obj.label76.grid.role = "col";
    obj.label76.grid.width = 1;
    obj.label76.grid["min-height"] = 20;
    obj.label76:setHorzTextAlign("center");
    obj.label76:setFontColor("white");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout22);
    obj.label77:setText("Treino");
    obj.label77.grid.role = "col";
    obj.label77.grid.width = 1;
    obj.label77.grid["min-height"] = 20;
    obj.label77:setHorzTextAlign("center");
    obj.label77:setFontColor("white");
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout22);
    obj.label78:setText("Outro");
    obj.label78.grid.role = "col";
    obj.label78.grid.width = 1;
    obj.label78.grid["min-height"] = 20;
    obj.label78:setHorzTextAlign("center");
    obj.label78:setFontColor("white");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout22);
    obj.label79:setText("Base");
    obj.label79.grid.role = "col";
    obj.label79.grid.width = 1;
    obj.label79.grid["min-height"] = 20;
    obj.label79:setHorzTextAlign("center");
    obj.label79:setFontColor("white");
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout22);
    obj.label80:setText("Multiplicador");
    obj.label80.grid.role = "col";
    obj.label80.grid.width = 1;
    obj.label80.grid["min-height"] = 20;
    obj.label80:setHorzTextAlign("center");
    obj.label80:setFontColor("white");
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout22);
    obj.label81:setText("Equipamentos");
    obj.label81.grid.role = "col";
    obj.label81.grid.width = 1;
    obj.label81.grid["min-height"] = 20;
    obj.label81:setHorzTextAlign("center");
    obj.label81:setFontColor("white");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout22);
    obj.label82:setText("Extra");
    obj.label82.grid.role = "col";
    obj.label82.grid.width = 1;
    obj.label82.grid["min-height"] = 20;
    obj.label82:setHorzTextAlign("center");
    obj.label82:setFontColor("white");
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout22);
    obj.label83:setText("Total");
    obj.label83.grid.role = "col";
    obj.label83.grid.width = 1;
    obj.label83.grid["min-height"] = 20;
    obj.label83:setHorzTextAlign("center");
    obj.label83:setFontColor("white");
    obj.label83:setName("label83");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox3);
    obj.layout23.grid.role = "row";
    obj.layout23.grid["min-height"] = 20;
    obj.layout23.grid["cnt-horz-align"] = "center";
    obj.layout23:setName("layout23");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout23);
    obj.label84.grid.role = "col";
    obj.label84.grid.width = 1;
    obj.label84:setText("Constituição");
    obj.label84:setName("label84");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout23);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46.grid.role = "col";
    obj.edit46.grid.width = 1;
    obj.edit46:setFontColor("white");
    obj.edit46:setReadOnly(true);
    obj.edit46:setCanFocus(false);
    obj.edit46:setCursor("default");
    obj.edit46:setField("conNivel");
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout23);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47.grid.role = "col";
    obj.edit47.grid.width = 1;
    obj.edit47:setFontColor("white");
    obj.edit47:setReadOnly(false);
    obj.edit47:setCanFocus(true);
    obj.edit47:setCursor("IBeam");
    obj.edit47:setField("conClasse");
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout23);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48.grid.role = "col";
    obj.edit48.grid.width = 1;
    obj.edit48:setFontColor("white");
    obj.edit48:setReadOnly(false);
    obj.edit48:setCanFocus(true);
    obj.edit48:setCursor("IBeam");
    obj.edit48:setField("conRaca");
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout23);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49.grid.role = "col";
    obj.edit49.grid.width = 1;
    obj.edit49:setFontColor("white");
    obj.edit49:setReadOnly(false);
    obj.edit49:setCanFocus(true);
    obj.edit49:setCursor("IBeam");
    obj.edit49:setField("conTreino");
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout23);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50.grid.role = "col";
    obj.edit50.grid.width = 1;
    obj.edit50:setFontColor("white");
    obj.edit50:setReadOnly(false);
    obj.edit50:setCanFocus(true);
    obj.edit50:setCursor("IBeam");
    obj.edit50:setField("conOutro");
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout23);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51.grid.role = "col";
    obj.edit51.grid.width = 1;
    obj.edit51:setFontColor("white");
    obj.edit51:setReadOnly(true);
    obj.edit51:setCanFocus(false);
    obj.edit51:setCursor("default");
    obj.edit51:setField("conBase");
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout23);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52.grid.role = "col";
    obj.edit52.grid.width = 1;
    obj.edit52:setFontColor("white");
    obj.edit52:setReadOnly(false);
    obj.edit52:setCanFocus(true);
    obj.edit52:setCursor("IBeam");
    obj.edit52:setField("conMultiplicador");
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout23);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53.grid.role = "col";
    obj.edit53.grid.width = 1;
    obj.edit53:setFontColor("white");
    obj.edit53:setReadOnly(true);
    obj.edit53:setCanFocus(false);
    obj.edit53:setCursor("default");
    obj.edit53:setField("conEquipamentos");
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout23);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54.grid.role = "col";
    obj.edit54.grid.width = 1;
    obj.edit54:setFontColor("white");
    obj.edit54:setReadOnly(false);
    obj.edit54:setCanFocus(true);
    obj.edit54:setCursor("IBeam");
    obj.edit54:setField("conExtra");
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout23);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55.grid.role = "col";
    obj.edit55.grid.width = 1;
    obj.edit55:setFontColor("white");
    obj.edit55:setReadOnly(true);
    obj.edit55:setCanFocus(false);
    obj.edit55:setCursor("default");
    obj.edit55:setField("conTotal");
    obj.edit55:setType("number");
    obj.edit55:setName("edit55");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.scrollBox3);
    obj.dataLink15:setFields({'conNivel', 'conClasse', 'conRaca', 'conTreino', 'conOutro', 'conMultiplicador', 'conExtra'});
    obj.dataLink15:setName("dataLink15");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox3);
    obj.layout24.grid.role = "row";
    obj.layout24.grid["min-height"] = 20;
    obj.layout24.grid["cnt-horz-align"] = "center";
    obj.layout24:setName("layout24");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout24);
    obj.label85.grid.role = "col";
    obj.label85.grid.width = 1;
    obj.label85:setText("Força");
    obj.label85:setName("label85");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout24);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56.grid.role = "col";
    obj.edit56.grid.width = 1;
    obj.edit56:setFontColor("white");
    obj.edit56:setReadOnly(true);
    obj.edit56:setCanFocus(false);
    obj.edit56:setCursor("default");
    obj.edit56:setField("forNivel");
    obj.edit56:setType("number");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout24);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57.grid.role = "col";
    obj.edit57.grid.width = 1;
    obj.edit57:setFontColor("white");
    obj.edit57:setReadOnly(false);
    obj.edit57:setCanFocus(true);
    obj.edit57:setCursor("IBeam");
    obj.edit57:setField("forClasse");
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout24);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58.grid.role = "col";
    obj.edit58.grid.width = 1;
    obj.edit58:setFontColor("white");
    obj.edit58:setReadOnly(false);
    obj.edit58:setCanFocus(true);
    obj.edit58:setCursor("IBeam");
    obj.edit58:setField("forRaca");
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout24);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59.grid.role = "col";
    obj.edit59.grid.width = 1;
    obj.edit59:setFontColor("white");
    obj.edit59:setReadOnly(false);
    obj.edit59:setCanFocus(true);
    obj.edit59:setCursor("IBeam");
    obj.edit59:setField("forTreino");
    obj.edit59:setType("number");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout24);
    obj.edit60:setHorzTextAlign("center");
    obj.edit60.grid.role = "col";
    obj.edit60.grid.width = 1;
    obj.edit60:setFontColor("white");
    obj.edit60:setReadOnly(false);
    obj.edit60:setCanFocus(true);
    obj.edit60:setCursor("IBeam");
    obj.edit60:setField("forOutro");
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout24);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61.grid.role = "col";
    obj.edit61.grid.width = 1;
    obj.edit61:setFontColor("white");
    obj.edit61:setReadOnly(true);
    obj.edit61:setCanFocus(false);
    obj.edit61:setCursor("default");
    obj.edit61:setField("forBase");
    obj.edit61:setType("number");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout24);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62.grid.role = "col";
    obj.edit62.grid.width = 1;
    obj.edit62:setFontColor("white");
    obj.edit62:setReadOnly(false);
    obj.edit62:setCanFocus(true);
    obj.edit62:setCursor("IBeam");
    obj.edit62:setField("forMultiplicador");
    obj.edit62:setType("number");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout24);
    obj.edit63:setHorzTextAlign("center");
    obj.edit63.grid.role = "col";
    obj.edit63.grid.width = 1;
    obj.edit63:setFontColor("white");
    obj.edit63:setReadOnly(true);
    obj.edit63:setCanFocus(false);
    obj.edit63:setCursor("default");
    obj.edit63:setField("forEquipamentos");
    obj.edit63:setType("number");
    obj.edit63:setName("edit63");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout24);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64.grid.role = "col";
    obj.edit64.grid.width = 1;
    obj.edit64:setFontColor("white");
    obj.edit64:setReadOnly(false);
    obj.edit64:setCanFocus(true);
    obj.edit64:setCursor("IBeam");
    obj.edit64:setField("forExtra");
    obj.edit64:setType("number");
    obj.edit64:setName("edit64");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout24);
    obj.edit65:setHorzTextAlign("center");
    obj.edit65.grid.role = "col";
    obj.edit65.grid.width = 1;
    obj.edit65:setFontColor("white");
    obj.edit65:setReadOnly(true);
    obj.edit65:setCanFocus(false);
    obj.edit65:setCursor("default");
    obj.edit65:setField("forTotal");
    obj.edit65:setType("number");
    obj.edit65:setName("edit65");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.scrollBox3);
    obj.dataLink16:setFields({'forNivel', 'forClasse', 'forRaca', 'forTreino', 'forOutro', 'forMultiplicador', 'forExtra'});
    obj.dataLink16:setName("dataLink16");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox3);
    obj.layout25.grid.role = "row";
    obj.layout25.grid["min-height"] = 20;
    obj.layout25.grid["cnt-horz-align"] = "center";
    obj.layout25:setName("layout25");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout25);
    obj.label86.grid.role = "col";
    obj.label86.grid.width = 1;
    obj.label86:setText("Destreza");
    obj.label86:setName("label86");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout25);
    obj.edit66:setHorzTextAlign("center");
    obj.edit66.grid.role = "col";
    obj.edit66.grid.width = 1;
    obj.edit66:setFontColor("white");
    obj.edit66:setReadOnly(true);
    obj.edit66:setCanFocus(false);
    obj.edit66:setCursor("default");
    obj.edit66:setField("dexNivel");
    obj.edit66:setType("number");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout25);
    obj.edit67:setHorzTextAlign("center");
    obj.edit67.grid.role = "col";
    obj.edit67.grid.width = 1;
    obj.edit67:setFontColor("white");
    obj.edit67:setReadOnly(false);
    obj.edit67:setCanFocus(true);
    obj.edit67:setCursor("IBeam");
    obj.edit67:setField("dexClasse");
    obj.edit67:setType("number");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout25);
    obj.edit68:setHorzTextAlign("center");
    obj.edit68.grid.role = "col";
    obj.edit68.grid.width = 1;
    obj.edit68:setFontColor("white");
    obj.edit68:setReadOnly(false);
    obj.edit68:setCanFocus(true);
    obj.edit68:setCursor("IBeam");
    obj.edit68:setField("dexRaca");
    obj.edit68:setType("number");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout25);
    obj.edit69:setHorzTextAlign("center");
    obj.edit69.grid.role = "col";
    obj.edit69.grid.width = 1;
    obj.edit69:setFontColor("white");
    obj.edit69:setReadOnly(false);
    obj.edit69:setCanFocus(true);
    obj.edit69:setCursor("IBeam");
    obj.edit69:setField("dexTreino");
    obj.edit69:setType("number");
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout25);
    obj.edit70:setHorzTextAlign("center");
    obj.edit70.grid.role = "col";
    obj.edit70.grid.width = 1;
    obj.edit70:setFontColor("white");
    obj.edit70:setReadOnly(false);
    obj.edit70:setCanFocus(true);
    obj.edit70:setCursor("IBeam");
    obj.edit70:setField("dexOutro");
    obj.edit70:setType("number");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout25);
    obj.edit71:setHorzTextAlign("center");
    obj.edit71.grid.role = "col";
    obj.edit71.grid.width = 1;
    obj.edit71:setFontColor("white");
    obj.edit71:setReadOnly(true);
    obj.edit71:setCanFocus(false);
    obj.edit71:setCursor("default");
    obj.edit71:setField("dexBase");
    obj.edit71:setType("number");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout25);
    obj.edit72:setHorzTextAlign("center");
    obj.edit72.grid.role = "col";
    obj.edit72.grid.width = 1;
    obj.edit72:setFontColor("white");
    obj.edit72:setReadOnly(false);
    obj.edit72:setCanFocus(true);
    obj.edit72:setCursor("IBeam");
    obj.edit72:setField("dexMultiplicador");
    obj.edit72:setType("number");
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout25);
    obj.edit73:setHorzTextAlign("center");
    obj.edit73.grid.role = "col";
    obj.edit73.grid.width = 1;
    obj.edit73:setFontColor("white");
    obj.edit73:setReadOnly(true);
    obj.edit73:setCanFocus(false);
    obj.edit73:setCursor("default");
    obj.edit73:setField("dexEquipamentos");
    obj.edit73:setType("number");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout25);
    obj.edit74:setHorzTextAlign("center");
    obj.edit74.grid.role = "col";
    obj.edit74.grid.width = 1;
    obj.edit74:setFontColor("white");
    obj.edit74:setReadOnly(false);
    obj.edit74:setCanFocus(true);
    obj.edit74:setCursor("IBeam");
    obj.edit74:setField("dexExtra");
    obj.edit74:setType("number");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout25);
    obj.edit75:setHorzTextAlign("center");
    obj.edit75.grid.role = "col";
    obj.edit75.grid.width = 1;
    obj.edit75:setFontColor("white");
    obj.edit75:setReadOnly(true);
    obj.edit75:setCanFocus(false);
    obj.edit75:setCursor("default");
    obj.edit75:setField("dexTotal");
    obj.edit75:setType("number");
    obj.edit75:setName("edit75");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.scrollBox3);
    obj.dataLink17:setFields({'dexNivel', 'dexClasse', 'dexRaca', 'dexTreino', 'dexOutro', 'dexMultiplicador', 'dexExtra'});
    obj.dataLink17:setName("dataLink17");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox3);
    obj.layout26.grid.role = "row";
    obj.layout26.grid["min-height"] = 20;
    obj.layout26.grid["cnt-horz-align"] = "center";
    obj.layout26:setName("layout26");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout26);
    obj.label87.grid.role = "col";
    obj.label87.grid.width = 1;
    obj.label87:setText("Carisma");
    obj.label87:setName("label87");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout26);
    obj.edit76:setHorzTextAlign("center");
    obj.edit76.grid.role = "col";
    obj.edit76.grid.width = 1;
    obj.edit76:setFontColor("white");
    obj.edit76:setReadOnly(true);
    obj.edit76:setCanFocus(false);
    obj.edit76:setCursor("default");
    obj.edit76:setField("carNivel");
    obj.edit76:setType("number");
    obj.edit76:setName("edit76");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout26);
    obj.edit77:setHorzTextAlign("center");
    obj.edit77.grid.role = "col";
    obj.edit77.grid.width = 1;
    obj.edit77:setFontColor("white");
    obj.edit77:setReadOnly(false);
    obj.edit77:setCanFocus(true);
    obj.edit77:setCursor("IBeam");
    obj.edit77:setField("carClasse");
    obj.edit77:setType("number");
    obj.edit77:setName("edit77");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout26);
    obj.edit78:setHorzTextAlign("center");
    obj.edit78.grid.role = "col";
    obj.edit78.grid.width = 1;
    obj.edit78:setFontColor("white");
    obj.edit78:setReadOnly(false);
    obj.edit78:setCanFocus(true);
    obj.edit78:setCursor("IBeam");
    obj.edit78:setField("carRaca");
    obj.edit78:setType("number");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout26);
    obj.edit79:setHorzTextAlign("center");
    obj.edit79.grid.role = "col";
    obj.edit79.grid.width = 1;
    obj.edit79:setFontColor("white");
    obj.edit79:setReadOnly(false);
    obj.edit79:setCanFocus(true);
    obj.edit79:setCursor("IBeam");
    obj.edit79:setField("carTreino");
    obj.edit79:setType("number");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout26);
    obj.edit80:setHorzTextAlign("center");
    obj.edit80.grid.role = "col";
    obj.edit80.grid.width = 1;
    obj.edit80:setFontColor("white");
    obj.edit80:setReadOnly(false);
    obj.edit80:setCanFocus(true);
    obj.edit80:setCursor("IBeam");
    obj.edit80:setField("carOutro");
    obj.edit80:setType("number");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout26);
    obj.edit81:setHorzTextAlign("center");
    obj.edit81.grid.role = "col";
    obj.edit81.grid.width = 1;
    obj.edit81:setFontColor("white");
    obj.edit81:setReadOnly(true);
    obj.edit81:setCanFocus(false);
    obj.edit81:setCursor("default");
    obj.edit81:setField("carBase");
    obj.edit81:setType("number");
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout26);
    obj.edit82:setHorzTextAlign("center");
    obj.edit82.grid.role = "col";
    obj.edit82.grid.width = 1;
    obj.edit82:setFontColor("white");
    obj.edit82:setReadOnly(false);
    obj.edit82:setCanFocus(true);
    obj.edit82:setCursor("IBeam");
    obj.edit82:setField("carMultiplicador");
    obj.edit82:setType("number");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout26);
    obj.edit83:setHorzTextAlign("center");
    obj.edit83.grid.role = "col";
    obj.edit83.grid.width = 1;
    obj.edit83:setFontColor("white");
    obj.edit83:setReadOnly(true);
    obj.edit83:setCanFocus(false);
    obj.edit83:setCursor("default");
    obj.edit83:setField("carEquipamentos");
    obj.edit83:setType("number");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout26);
    obj.edit84:setHorzTextAlign("center");
    obj.edit84.grid.role = "col";
    obj.edit84.grid.width = 1;
    obj.edit84:setFontColor("white");
    obj.edit84:setReadOnly(false);
    obj.edit84:setCanFocus(true);
    obj.edit84:setCursor("IBeam");
    obj.edit84:setField("carExtra");
    obj.edit84:setType("number");
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout26);
    obj.edit85:setHorzTextAlign("center");
    obj.edit85.grid.role = "col";
    obj.edit85.grid.width = 1;
    obj.edit85:setFontColor("white");
    obj.edit85:setReadOnly(true);
    obj.edit85:setCanFocus(false);
    obj.edit85:setCursor("default");
    obj.edit85:setField("carTotal");
    obj.edit85:setType("number");
    obj.edit85:setName("edit85");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.scrollBox3);
    obj.dataLink18:setFields({'carNivel', 'carClasse', 'carRaca', 'carTreino', 'carOutro', 'carMultiplicador', 'carExtra'});
    obj.dataLink18:setName("dataLink18");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox3);
    obj.layout27.grid.role = "row";
    obj.layout27.grid["min-height"] = 20;
    obj.layout27.grid["cnt-horz-align"] = "center";
    obj.layout27:setName("layout27");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout27);
    obj.label88.grid.role = "col";
    obj.label88.grid.width = 1;
    obj.label88:setText("Inteligência");
    obj.label88:setName("label88");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout27);
    obj.edit86:setHorzTextAlign("center");
    obj.edit86.grid.role = "col";
    obj.edit86.grid.width = 1;
    obj.edit86:setFontColor("white");
    obj.edit86:setReadOnly(true);
    obj.edit86:setCanFocus(false);
    obj.edit86:setCursor("default");
    obj.edit86:setField("intNivel");
    obj.edit86:setType("number");
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout27);
    obj.edit87:setHorzTextAlign("center");
    obj.edit87.grid.role = "col";
    obj.edit87.grid.width = 1;
    obj.edit87:setFontColor("white");
    obj.edit87:setReadOnly(false);
    obj.edit87:setCanFocus(true);
    obj.edit87:setCursor("IBeam");
    obj.edit87:setField("intClasse");
    obj.edit87:setType("number");
    obj.edit87:setName("edit87");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout27);
    obj.edit88:setHorzTextAlign("center");
    obj.edit88.grid.role = "col";
    obj.edit88.grid.width = 1;
    obj.edit88:setFontColor("white");
    obj.edit88:setReadOnly(false);
    obj.edit88:setCanFocus(true);
    obj.edit88:setCursor("IBeam");
    obj.edit88:setField("intRaca");
    obj.edit88:setType("number");
    obj.edit88:setName("edit88");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout27);
    obj.edit89:setHorzTextAlign("center");
    obj.edit89.grid.role = "col";
    obj.edit89.grid.width = 1;
    obj.edit89:setFontColor("white");
    obj.edit89:setReadOnly(false);
    obj.edit89:setCanFocus(true);
    obj.edit89:setCursor("IBeam");
    obj.edit89:setField("intTreino");
    obj.edit89:setType("number");
    obj.edit89:setName("edit89");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout27);
    obj.edit90:setHorzTextAlign("center");
    obj.edit90.grid.role = "col";
    obj.edit90.grid.width = 1;
    obj.edit90:setFontColor("white");
    obj.edit90:setReadOnly(false);
    obj.edit90:setCanFocus(true);
    obj.edit90:setCursor("IBeam");
    obj.edit90:setField("intOutro");
    obj.edit90:setType("number");
    obj.edit90:setName("edit90");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout27);
    obj.edit91:setHorzTextAlign("center");
    obj.edit91.grid.role = "col";
    obj.edit91.grid.width = 1;
    obj.edit91:setFontColor("white");
    obj.edit91:setReadOnly(true);
    obj.edit91:setCanFocus(false);
    obj.edit91:setCursor("default");
    obj.edit91:setField("intBase");
    obj.edit91:setType("number");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout27);
    obj.edit92:setHorzTextAlign("center");
    obj.edit92.grid.role = "col";
    obj.edit92.grid.width = 1;
    obj.edit92:setFontColor("white");
    obj.edit92:setReadOnly(false);
    obj.edit92:setCanFocus(true);
    obj.edit92:setCursor("IBeam");
    obj.edit92:setField("intMultiplicador");
    obj.edit92:setType("number");
    obj.edit92:setName("edit92");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout27);
    obj.edit93:setHorzTextAlign("center");
    obj.edit93.grid.role = "col";
    obj.edit93.grid.width = 1;
    obj.edit93:setFontColor("white");
    obj.edit93:setReadOnly(true);
    obj.edit93:setCanFocus(false);
    obj.edit93:setCursor("default");
    obj.edit93:setField("intEquipamentos");
    obj.edit93:setType("number");
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout27);
    obj.edit94:setHorzTextAlign("center");
    obj.edit94.grid.role = "col";
    obj.edit94.grid.width = 1;
    obj.edit94:setFontColor("white");
    obj.edit94:setReadOnly(false);
    obj.edit94:setCanFocus(true);
    obj.edit94:setCursor("IBeam");
    obj.edit94:setField("intExtra");
    obj.edit94:setType("number");
    obj.edit94:setName("edit94");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout27);
    obj.edit95:setHorzTextAlign("center");
    obj.edit95.grid.role = "col";
    obj.edit95.grid.width = 1;
    obj.edit95:setFontColor("white");
    obj.edit95:setReadOnly(true);
    obj.edit95:setCanFocus(false);
    obj.edit95:setCursor("default");
    obj.edit95:setField("intTotal");
    obj.edit95:setType("number");
    obj.edit95:setName("edit95");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.scrollBox3);
    obj.dataLink19:setFields({'intNivel', 'intClasse', 'intRaca', 'intTreino', 'intOutro', 'intMultiplicador', 'intExtra'});
    obj.dataLink19:setName("dataLink19");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox3);
    obj.layout28.grid.role = "row";
    obj.layout28.grid["min-height"] = 20;
    obj.layout28.grid["cnt-horz-align"] = "center";
    obj.layout28:setName("layout28");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout28);
    obj.label89.grid.role = "col";
    obj.label89.grid.width = 1;
    obj.label89:setText("Sabedoria");
    obj.label89:setName("label89");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout28);
    obj.edit96:setHorzTextAlign("center");
    obj.edit96.grid.role = "col";
    obj.edit96.grid.width = 1;
    obj.edit96:setFontColor("white");
    obj.edit96:setReadOnly(true);
    obj.edit96:setCanFocus(false);
    obj.edit96:setCursor("default");
    obj.edit96:setField("sabNivel");
    obj.edit96:setType("number");
    obj.edit96:setName("edit96");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout28);
    obj.edit97:setHorzTextAlign("center");
    obj.edit97.grid.role = "col";
    obj.edit97.grid.width = 1;
    obj.edit97:setFontColor("white");
    obj.edit97:setReadOnly(false);
    obj.edit97:setCanFocus(true);
    obj.edit97:setCursor("IBeam");
    obj.edit97:setField("sabClasse");
    obj.edit97:setType("number");
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout28);
    obj.edit98:setHorzTextAlign("center");
    obj.edit98.grid.role = "col";
    obj.edit98.grid.width = 1;
    obj.edit98:setFontColor("white");
    obj.edit98:setReadOnly(false);
    obj.edit98:setCanFocus(true);
    obj.edit98:setCursor("IBeam");
    obj.edit98:setField("sabRaca");
    obj.edit98:setType("number");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout28);
    obj.edit99:setHorzTextAlign("center");
    obj.edit99.grid.role = "col";
    obj.edit99.grid.width = 1;
    obj.edit99:setFontColor("white");
    obj.edit99:setReadOnly(false);
    obj.edit99:setCanFocus(true);
    obj.edit99:setCursor("IBeam");
    obj.edit99:setField("sabTreino");
    obj.edit99:setType("number");
    obj.edit99:setName("edit99");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout28);
    obj.edit100:setHorzTextAlign("center");
    obj.edit100.grid.role = "col";
    obj.edit100.grid.width = 1;
    obj.edit100:setFontColor("white");
    obj.edit100:setReadOnly(false);
    obj.edit100:setCanFocus(true);
    obj.edit100:setCursor("IBeam");
    obj.edit100:setField("sabOutro");
    obj.edit100:setType("number");
    obj.edit100:setName("edit100");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout28);
    obj.edit101:setHorzTextAlign("center");
    obj.edit101.grid.role = "col";
    obj.edit101.grid.width = 1;
    obj.edit101:setFontColor("white");
    obj.edit101:setReadOnly(true);
    obj.edit101:setCanFocus(false);
    obj.edit101:setCursor("default");
    obj.edit101:setField("sabBase");
    obj.edit101:setType("number");
    obj.edit101:setName("edit101");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout28);
    obj.edit102:setHorzTextAlign("center");
    obj.edit102.grid.role = "col";
    obj.edit102.grid.width = 1;
    obj.edit102:setFontColor("white");
    obj.edit102:setReadOnly(false);
    obj.edit102:setCanFocus(true);
    obj.edit102:setCursor("IBeam");
    obj.edit102:setField("sabMultiplicador");
    obj.edit102:setType("number");
    obj.edit102:setName("edit102");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout28);
    obj.edit103:setHorzTextAlign("center");
    obj.edit103.grid.role = "col";
    obj.edit103.grid.width = 1;
    obj.edit103:setFontColor("white");
    obj.edit103:setReadOnly(true);
    obj.edit103:setCanFocus(false);
    obj.edit103:setCursor("default");
    obj.edit103:setField("sabEquipamentos");
    obj.edit103:setType("number");
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout28);
    obj.edit104:setHorzTextAlign("center");
    obj.edit104.grid.role = "col";
    obj.edit104.grid.width = 1;
    obj.edit104:setFontColor("white");
    obj.edit104:setReadOnly(false);
    obj.edit104:setCanFocus(true);
    obj.edit104:setCursor("IBeam");
    obj.edit104:setField("sabExtra");
    obj.edit104:setType("number");
    obj.edit104:setName("edit104");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout28);
    obj.edit105:setHorzTextAlign("center");
    obj.edit105.grid.role = "col";
    obj.edit105.grid.width = 1;
    obj.edit105:setFontColor("white");
    obj.edit105:setReadOnly(true);
    obj.edit105:setCanFocus(false);
    obj.edit105:setCursor("default");
    obj.edit105:setField("sabTotal");
    obj.edit105:setType("number");
    obj.edit105:setName("edit105");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.scrollBox3);
    obj.dataLink20:setFields({'sabNivel', 'sabClasse', 'sabRaca', 'sabTreino', 'sabOutro', 'sabMultiplicador', 'sabExtra'});
    obj.dataLink20:setName("dataLink20");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox3);
    obj.layout29.grid.role = "row";
    obj.layout29.grid["cnt-horz-align"] = "center";
    obj.layout29.grid["min-height"] = 30;
    obj.layout29:setName("layout29");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout29);
    obj.label90:setText("Sanidade:");
    obj.label90.grid.role = "col";
    obj.label90.grid.width = 1;
    obj.label90.grid["vert-align"] = "center";
    obj.label90:setName("label90");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout29);
    obj.edit106:setField("Sanidade");
    obj.edit106.grid.role = "col";
    obj.edit106.grid.width = 1;
    obj.edit106:setReadOnly(true);
    obj.edit106:setCanFocus(false);
    obj.edit106:setCursor("default");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.scrollBox3);
    obj.dataLink21:setFields({'Nivel', 'sabTotal'});
    obj.dataLink21:setName("dataLink21");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox3);
    obj.layout30.grid.role = "row";
    obj.layout30.grid["min-height"] = 20;
    obj.layout30.grid["cnt-horz-align"] = "center";
    obj.layout30:setName("layout30");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout30);
    obj.label91:setText("");
    obj.label91.grid.role = "col";
    obj.label91.grid.width = 1;
    obj.label91.grid["min-height"] = 20;
    obj.label91:setHorzTextAlign("center");
    obj.label91:setFontColor("white");
    obj.label91:setName("label91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout30);
    obj.label92:setText("Destreza");
    obj.label92.grid.role = "col";
    obj.label92.grid.width = 1;
    obj.label92.grid["min-height"] = 20;
    obj.label92:setHorzTextAlign("center");
    obj.label92:setFontColor("white");
    obj.label92:setName("label92");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout30);
    obj.label93:setText("Classe");
    obj.label93.grid.role = "col";
    obj.label93.grid.width = 1;
    obj.label93.grid["min-height"] = 20;
    obj.label93:setHorzTextAlign("center");
    obj.label93:setFontColor("white");
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout30);
    obj.label94:setText("Base");
    obj.label94.grid.role = "col";
    obj.label94.grid.width = 1;
    obj.label94.grid["min-height"] = 20;
    obj.label94:setHorzTextAlign("center");
    obj.label94:setFontColor("white");
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout30);
    obj.label95:setText("Multiplicador");
    obj.label95.grid.role = "col";
    obj.label95.grid.width = 1;
    obj.label95.grid["min-height"] = 20;
    obj.label95:setHorzTextAlign("center");
    obj.label95:setFontColor("white");
    obj.label95:setName("label95");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout30);
    obj.label96:setText("Equipamentos");
    obj.label96.grid.role = "col";
    obj.label96.grid.width = 1;
    obj.label96.grid["min-height"] = 20;
    obj.label96:setHorzTextAlign("center");
    obj.label96:setFontColor("white");
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout30);
    obj.label97:setText("Extra");
    obj.label97.grid.role = "col";
    obj.label97.grid.width = 1;
    obj.label97.grid["min-height"] = 20;
    obj.label97:setHorzTextAlign("center");
    obj.label97:setFontColor("white");
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout30);
    obj.label98:setText("Total");
    obj.label98.grid.role = "col";
    obj.label98.grid.width = 1;
    obj.label98.grid["min-height"] = 20;
    obj.label98:setHorzTextAlign("center");
    obj.label98:setFontColor("white");
    obj.label98:setName("label98");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox3);
    obj.layout31.grid.role = "row";
    obj.layout31.grid["min-height"] = 20;
    obj.layout31.grid["cnt-horz-align"] = "center";
    obj.layout31:setName("layout31");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout31);
    obj.label99.grid.role = "col";
    obj.label99.grid.width = 1;
    obj.label99:setText("Acerto");
    obj.label99:setName("label99");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout31);
    obj.edit107:setHorzTextAlign("center");
    obj.edit107.grid.role = "col";
    obj.edit107.grid.width = 1;
    obj.edit107:setFontColor("white");
    obj.edit107:setReadOnly(false);
    obj.edit107:setCanFocus(true);
    obj.edit107:setCursor("IBeam");
    obj.edit107:setField("acertoDestreza");
    obj.edit107:setType("number");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout31);
    obj.edit108:setHorzTextAlign("center");
    obj.edit108.grid.role = "col";
    obj.edit108.grid.width = 1;
    obj.edit108:setFontColor("white");
    obj.edit108:setReadOnly(false);
    obj.edit108:setCanFocus(true);
    obj.edit108:setCursor("IBeam");
    obj.edit108:setField("acertoClasse");
    obj.edit108:setType("number");
    obj.edit108:setName("edit108");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout31);
    obj.edit109:setHorzTextAlign("center");
    obj.edit109.grid.role = "col";
    obj.edit109.grid.width = 1;
    obj.edit109:setFontColor("white");
    obj.edit109:setReadOnly(true);
    obj.edit109:setCanFocus(false);
    obj.edit109:setCursor("default");
    obj.edit109:setField("acertoBase");
    obj.edit109:setType("number");
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout31);
    obj.edit110:setHorzTextAlign("center");
    obj.edit110.grid.role = "col";
    obj.edit110.grid.width = 1;
    obj.edit110:setFontColor("white");
    obj.edit110:setReadOnly(false);
    obj.edit110:setCanFocus(true);
    obj.edit110:setCursor("IBeam");
    obj.edit110:setField("acertoMultiplicador");
    obj.edit110:setType("number");
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout31);
    obj.edit111:setHorzTextAlign("center");
    obj.edit111.grid.role = "col";
    obj.edit111.grid.width = 1;
    obj.edit111:setFontColor("white");
    obj.edit111:setReadOnly(true);
    obj.edit111:setCanFocus(false);
    obj.edit111:setCursor("default");
    obj.edit111:setField("acertoEquipamentos");
    obj.edit111:setType("number");
    obj.edit111:setName("edit111");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout31);
    obj.edit112:setHorzTextAlign("center");
    obj.edit112.grid.role = "col";
    obj.edit112.grid.width = 1;
    obj.edit112:setFontColor("white");
    obj.edit112:setReadOnly(false);
    obj.edit112:setCanFocus(true);
    obj.edit112:setCursor("IBeam");
    obj.edit112:setField("acertoExtra");
    obj.edit112:setType("number");
    obj.edit112:setName("edit112");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout31);
    obj.edit113:setHorzTextAlign("center");
    obj.edit113.grid.role = "col";
    obj.edit113.grid.width = 1;
    obj.edit113:setFontColor("white");
    obj.edit113:setReadOnly(true);
    obj.edit113:setCanFocus(false);
    obj.edit113:setCursor("default");
    obj.edit113:setField("acertoTotal");
    obj.edit113:setType("number");
    obj.edit113:setName("edit113");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.scrollBox3);
    obj.dataLink22:setFields({'acertoDestreza', 'acertoClasse', 'acertoMultiplicador', 'acertoEquipamentos', 'acertoExtra'});
    obj.dataLink22:setName("dataLink22");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.scrollBox3);
    obj.layout32.grid.role = "row";
    obj.layout32.grid["min-height"] = 20;
    obj.layout32.grid["cnt-horz-align"] = "center";
    obj.layout32:setName("layout32");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout32);
    obj.label100.grid.role = "col";
    obj.label100.grid.width = 1;
    obj.label100:setText("Mira");
    obj.label100:setName("label100");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout32);
    obj.edit114:setHorzTextAlign("center");
    obj.edit114.grid.role = "col";
    obj.edit114.grid.width = 1;
    obj.edit114:setFontColor("white");
    obj.edit114:setReadOnly(false);
    obj.edit114:setCanFocus(true);
    obj.edit114:setCursor("IBeam");
    obj.edit114:setField("miraDestreza");
    obj.edit114:setType("number");
    obj.edit114:setName("edit114");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout32);
    obj.edit115:setHorzTextAlign("center");
    obj.edit115.grid.role = "col";
    obj.edit115.grid.width = 1;
    obj.edit115:setFontColor("white");
    obj.edit115:setReadOnly(false);
    obj.edit115:setCanFocus(true);
    obj.edit115:setCursor("IBeam");
    obj.edit115:setField("miraClasse");
    obj.edit115:setType("number");
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout32);
    obj.edit116:setHorzTextAlign("center");
    obj.edit116.grid.role = "col";
    obj.edit116.grid.width = 1;
    obj.edit116:setFontColor("white");
    obj.edit116:setReadOnly(true);
    obj.edit116:setCanFocus(false);
    obj.edit116:setCursor("default");
    obj.edit116:setField("miraBase");
    obj.edit116:setType("number");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout32);
    obj.edit117:setHorzTextAlign("center");
    obj.edit117.grid.role = "col";
    obj.edit117.grid.width = 1;
    obj.edit117:setFontColor("white");
    obj.edit117:setReadOnly(false);
    obj.edit117:setCanFocus(true);
    obj.edit117:setCursor("IBeam");
    obj.edit117:setField("miraMultiplicador");
    obj.edit117:setType("number");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout32);
    obj.edit118:setHorzTextAlign("center");
    obj.edit118.grid.role = "col";
    obj.edit118.grid.width = 1;
    obj.edit118:setFontColor("white");
    obj.edit118:setReadOnly(true);
    obj.edit118:setCanFocus(false);
    obj.edit118:setCursor("default");
    obj.edit118:setField("miraEquipamentos");
    obj.edit118:setType("number");
    obj.edit118:setName("edit118");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout32);
    obj.edit119:setHorzTextAlign("center");
    obj.edit119.grid.role = "col";
    obj.edit119.grid.width = 1;
    obj.edit119:setFontColor("white");
    obj.edit119:setReadOnly(false);
    obj.edit119:setCanFocus(true);
    obj.edit119:setCursor("IBeam");
    obj.edit119:setField("miraExtra");
    obj.edit119:setType("number");
    obj.edit119:setName("edit119");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout32);
    obj.edit120:setHorzTextAlign("center");
    obj.edit120.grid.role = "col";
    obj.edit120.grid.width = 1;
    obj.edit120:setFontColor("white");
    obj.edit120:setReadOnly(true);
    obj.edit120:setCanFocus(false);
    obj.edit120:setCursor("default");
    obj.edit120:setField("miraTotal");
    obj.edit120:setType("number");
    obj.edit120:setName("edit120");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.scrollBox3);
    obj.dataLink23:setFields({'miraDestreza', 'miraClasse', 'miraMultiplicador', 'miraEquipamentos', 'miraExtra'});
    obj.dataLink23:setName("dataLink23");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox3);
    obj.layout33.grid.role = "row";
    obj.layout33.grid["min-height"] = 20;
    obj.layout33.grid["cnt-horz-align"] = "center";
    obj.layout33:setName("layout33");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout33);
    obj.label101.grid.role = "col";
    obj.label101.grid.width = 1;
    obj.label101:setText("Bloqueio");
    obj.label101:setName("label101");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout33);
    obj.edit121:setHorzTextAlign("center");
    obj.edit121.grid.role = "col";
    obj.edit121.grid.width = 1;
    obj.edit121:setFontColor("white");
    obj.edit121:setReadOnly(false);
    obj.edit121:setCanFocus(true);
    obj.edit121:setCursor("IBeam");
    obj.edit121:setField("bloqueioDestreza");
    obj.edit121:setType("number");
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout33);
    obj.edit122:setHorzTextAlign("center");
    obj.edit122.grid.role = "col";
    obj.edit122.grid.width = 1;
    obj.edit122:setFontColor("white");
    obj.edit122:setReadOnly(false);
    obj.edit122:setCanFocus(true);
    obj.edit122:setCursor("IBeam");
    obj.edit122:setField("bloqueioClasse");
    obj.edit122:setType("number");
    obj.edit122:setName("edit122");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout33);
    obj.edit123:setHorzTextAlign("center");
    obj.edit123.grid.role = "col";
    obj.edit123.grid.width = 1;
    obj.edit123:setFontColor("white");
    obj.edit123:setReadOnly(true);
    obj.edit123:setCanFocus(false);
    obj.edit123:setCursor("default");
    obj.edit123:setField("bloqueioBase");
    obj.edit123:setType("number");
    obj.edit123:setName("edit123");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout33);
    obj.edit124:setHorzTextAlign("center");
    obj.edit124.grid.role = "col";
    obj.edit124.grid.width = 1;
    obj.edit124:setFontColor("white");
    obj.edit124:setReadOnly(false);
    obj.edit124:setCanFocus(true);
    obj.edit124:setCursor("IBeam");
    obj.edit124:setField("bloqueioMultiplicador");
    obj.edit124:setType("number");
    obj.edit124:setName("edit124");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout33);
    obj.edit125:setHorzTextAlign("center");
    obj.edit125.grid.role = "col";
    obj.edit125.grid.width = 1;
    obj.edit125:setFontColor("white");
    obj.edit125:setReadOnly(true);
    obj.edit125:setCanFocus(false);
    obj.edit125:setCursor("default");
    obj.edit125:setField("bloqueioEquipamentos");
    obj.edit125:setType("number");
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout33);
    obj.edit126:setHorzTextAlign("center");
    obj.edit126.grid.role = "col";
    obj.edit126.grid.width = 1;
    obj.edit126:setFontColor("white");
    obj.edit126:setReadOnly(false);
    obj.edit126:setCanFocus(true);
    obj.edit126:setCursor("IBeam");
    obj.edit126:setField("bloqueioExtra");
    obj.edit126:setType("number");
    obj.edit126:setName("edit126");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout33);
    obj.edit127:setHorzTextAlign("center");
    obj.edit127.grid.role = "col";
    obj.edit127.grid.width = 1;
    obj.edit127:setFontColor("white");
    obj.edit127:setReadOnly(true);
    obj.edit127:setCanFocus(false);
    obj.edit127:setCursor("default");
    obj.edit127:setField("bloqueioTotal");
    obj.edit127:setType("number");
    obj.edit127:setName("edit127");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.scrollBox3);
    obj.dataLink24:setFields({'bloqueioDestreza', 'bloqueioClasse', 'bloqueioMultiplicador', 'bloqueioEquipamentos', 'bloqueioExtra'});
    obj.dataLink24:setName("dataLink24");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox3);
    obj.layout34.grid.role = "row";
    obj.layout34.grid["min-height"] = 20;
    obj.layout34.grid["cnt-horz-align"] = "center";
    obj.layout34:setName("layout34");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout34);
    obj.label102.grid.role = "col";
    obj.label102.grid.width = 1;
    obj.label102:setText("Esquiva");
    obj.label102:setName("label102");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout34);
    obj.edit128:setHorzTextAlign("center");
    obj.edit128.grid.role = "col";
    obj.edit128.grid.width = 1;
    obj.edit128:setFontColor("white");
    obj.edit128:setReadOnly(false);
    obj.edit128:setCanFocus(true);
    obj.edit128:setCursor("IBeam");
    obj.edit128:setField("esquivaDestreza");
    obj.edit128:setType("number");
    obj.edit128:setName("edit128");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout34);
    obj.edit129:setHorzTextAlign("center");
    obj.edit129.grid.role = "col";
    obj.edit129.grid.width = 1;
    obj.edit129:setFontColor("white");
    obj.edit129:setReadOnly(false);
    obj.edit129:setCanFocus(true);
    obj.edit129:setCursor("IBeam");
    obj.edit129:setField("esquivaClasse");
    obj.edit129:setType("number");
    obj.edit129:setName("edit129");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout34);
    obj.edit130:setHorzTextAlign("center");
    obj.edit130.grid.role = "col";
    obj.edit130.grid.width = 1;
    obj.edit130:setFontColor("white");
    obj.edit130:setReadOnly(true);
    obj.edit130:setCanFocus(false);
    obj.edit130:setCursor("default");
    obj.edit130:setField("esquivaBase");
    obj.edit130:setType("number");
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout34);
    obj.edit131:setHorzTextAlign("center");
    obj.edit131.grid.role = "col";
    obj.edit131.grid.width = 1;
    obj.edit131:setFontColor("white");
    obj.edit131:setReadOnly(false);
    obj.edit131:setCanFocus(true);
    obj.edit131:setCursor("IBeam");
    obj.edit131:setField("esquivaMultiplicador");
    obj.edit131:setType("number");
    obj.edit131:setName("edit131");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout34);
    obj.edit132:setHorzTextAlign("center");
    obj.edit132.grid.role = "col";
    obj.edit132.grid.width = 1;
    obj.edit132:setFontColor("white");
    obj.edit132:setReadOnly(true);
    obj.edit132:setCanFocus(false);
    obj.edit132:setCursor("default");
    obj.edit132:setField("esquivaEquipamentos");
    obj.edit132:setType("number");
    obj.edit132:setName("edit132");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout34);
    obj.edit133:setHorzTextAlign("center");
    obj.edit133.grid.role = "col";
    obj.edit133.grid.width = 1;
    obj.edit133:setFontColor("white");
    obj.edit133:setReadOnly(false);
    obj.edit133:setCanFocus(true);
    obj.edit133:setCursor("IBeam");
    obj.edit133:setField("esquivaExtra");
    obj.edit133:setType("number");
    obj.edit133:setName("edit133");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout34);
    obj.edit134:setHorzTextAlign("center");
    obj.edit134.grid.role = "col";
    obj.edit134.grid.width = 1;
    obj.edit134:setFontColor("white");
    obj.edit134:setReadOnly(true);
    obj.edit134:setCanFocus(false);
    obj.edit134:setCursor("default");
    obj.edit134:setField("esquivaTotal");
    obj.edit134:setType("number");
    obj.edit134:setName("edit134");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.scrollBox3);
    obj.dataLink25:setFields({'esquivaDestreza', 'esquivaClasse', 'esquivaMultiplicador', 'esquivaEquipamentos', 'esquivaExtra'});
    obj.dataLink25:setName("dataLink25");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox3);
    obj.layout35.grid.role = "row";
    obj.layout35:setName("layout35");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout35);
    obj.label103:setText("Constituição");
    obj.label103.grid.role = "col";
    obj.label103.grid.width = 1;
    obj.label103.grid["min-height"] = 20;
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout35);
    obj.layout36.grid.role = "col";
    obj.layout36:setHeight(15);
    obj.layout36.grid.width = 1;
    obj.layout36:setName("layout36");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout36);
    obj.label104:setText("2");
    obj.label104.grid.role = "col";
    obj.label104.grid.width = 6;
    obj.label104.grid["min-height"] = 15;
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout36);
    obj.label105:setText("3");
    obj.label105.grid.role = "col";
    obj.label105.grid.width = 6;
    obj.label105.grid["min-height"] = 15;
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout35);
    obj.layout37.grid.role = "col";
    obj.layout37:setHeight(15);
    obj.layout37.grid.width = 1;
    obj.layout37:setName("layout37");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout37);
    obj.label106:setText("4");
    obj.label106.grid.role = "col";
    obj.label106.grid.width = 6;
    obj.label106.grid["min-height"] = 15;
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout37);
    obj.label107:setText("5");
    obj.label107.grid.role = "col";
    obj.label107.grid.width = 6;
    obj.label107.grid["min-height"] = 15;
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout35);
    obj.layout38.grid.role = "col";
    obj.layout38:setHeight(15);
    obj.layout38.grid.width = 1;
    obj.layout38:setName("layout38");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout38);
    obj.label108:setText("6");
    obj.label108.grid.role = "col";
    obj.label108.grid.width = 6;
    obj.label108.grid["min-height"] = 15;
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout38);
    obj.label109:setText("7");
    obj.label109.grid.role = "col";
    obj.label109.grid.width = 6;
    obj.label109.grid["min-height"] = 15;
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout35);
    obj.layout39.grid.role = "col";
    obj.layout39:setHeight(15);
    obj.layout39.grid.width = 1;
    obj.layout39:setName("layout39");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout39);
    obj.label110:setText("8");
    obj.label110.grid.role = "col";
    obj.label110.grid.width = 6;
    obj.label110.grid["min-height"] = 15;
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout39);
    obj.label111:setText("9");
    obj.label111.grid.role = "col";
    obj.label111.grid.width = 6;
    obj.label111.grid["min-height"] = 15;
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout35);
    obj.layout40.grid.role = "col";
    obj.layout40:setHeight(15);
    obj.layout40.grid.width = 1;
    obj.layout40:setName("layout40");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout40);
    obj.label112:setText("10");
    obj.label112.grid.role = "col";
    obj.label112.grid.width = 6;
    obj.label112.grid["min-height"] = 15;
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout40);
    obj.label113:setText("11");
    obj.label113.grid.role = "col";
    obj.label113.grid.width = 6;
    obj.label113.grid["min-height"] = 15;
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout35);
    obj.layout41.grid.role = "col";
    obj.layout41:setHeight(15);
    obj.layout41.grid.width = 1;
    obj.layout41:setName("layout41");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout41);
    obj.label114:setText("12");
    obj.label114.grid.role = "col";
    obj.label114.grid.width = 6;
    obj.label114.grid["min-height"] = 15;
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout41);
    obj.label115:setText("13");
    obj.label115.grid.role = "col";
    obj.label115.grid.width = 6;
    obj.label115.grid["min-height"] = 15;
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout35);
    obj.layout42.grid.role = "col";
    obj.layout42:setHeight(15);
    obj.layout42.grid.width = 1;
    obj.layout42:setName("layout42");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout42);
    obj.label116:setText("14");
    obj.label116.grid.role = "col";
    obj.label116.grid.width = 6;
    obj.label116.grid["min-height"] = 15;
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout42);
    obj.label117:setText("15");
    obj.label117.grid.role = "col";
    obj.label117.grid.width = 6;
    obj.label117.grid["min-height"] = 15;
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout35);
    obj.layout43.grid.role = "col";
    obj.layout43:setHeight(15);
    obj.layout43.grid.width = 1;
    obj.layout43:setName("layout43");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout43);
    obj.label118:setText("16");
    obj.label118.grid.role = "col";
    obj.label118.grid.width = 6;
    obj.label118.grid["min-height"] = 15;
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout43);
    obj.label119:setText("17");
    obj.label119.grid.role = "col";
    obj.label119.grid.width = 6;
    obj.label119.grid["min-height"] = 15;
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout35);
    obj.layout44.grid.role = "col";
    obj.layout44:setHeight(15);
    obj.layout44.grid.width = 1;
    obj.layout44:setName("layout44");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout44);
    obj.label120:setText("18");
    obj.label120.grid.role = "col";
    obj.label120.grid.width = 6;
    obj.label120.grid["min-height"] = 15;
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout44);
    obj.label121:setText("19");
    obj.label121.grid.role = "col";
    obj.label121.grid.width = 6;
    obj.label121.grid["min-height"] = 15;
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout35);
    obj.layout45.grid.role = "col";
    obj.layout45:setHeight(15);
    obj.layout45.grid.width = 1;
    obj.layout45:setName("layout45");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout45);
    obj.label122:setText("20");
    obj.label122.grid.role = "col";
    obj.label122.grid.width = 6;
    obj.label122.grid["min-height"] = 15;
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout45);
    obj.label123:setText("20+");
    obj.label123.grid.role = "col";
    obj.label123.grid.width = 6;
    obj.label123.grid["min-height"] = 15;
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout35);
    obj.label124:setText("Total");
    obj.label124.grid.role = "col";
    obj.label124.grid.width = 1;
    obj.label124.grid["min-height"] = 15;
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout35);
    obj.label125:setText("");
    obj.label125.grid.role = "col";
    obj.label125.grid.width = 1;
    obj.label125.grid["min-height"] = 15;
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout35);
    obj.layout46.grid.role = "col";
    obj.layout46:setHeight(30);
    obj.layout46.grid.width = 1;
    obj.layout46:setName("layout46");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout46);
    obj.edit135.grid.role = "col";
    obj.edit135.grid.width = 6;
    obj.edit135.grid["min-height"] = 30;
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setField("conNivel1");
    obj.edit135:setType("number");
    obj.edit135:setName("edit135");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout46);
    obj.edit136.grid.role = "col";
    obj.edit136.grid.width = 6;
    obj.edit136.grid["min-height"] = 30;
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setField("conNivel2");
    obj.edit136:setType("number");
    obj.edit136:setName("edit136");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout35);
    obj.layout47.grid.role = "col";
    obj.layout47:setHeight(30);
    obj.layout47.grid.width = 1;
    obj.layout47:setName("layout47");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout47);
    obj.edit137.grid.role = "col";
    obj.edit137.grid.width = 6;
    obj.edit137.grid["min-height"] = 30;
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setField("conNivel3");
    obj.edit137:setType("number");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout47);
    obj.edit138.grid.role = "col";
    obj.edit138.grid.width = 6;
    obj.edit138.grid["min-height"] = 30;
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setField("conNivel4");
    obj.edit138:setType("number");
    obj.edit138:setName("edit138");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout35);
    obj.layout48.grid.role = "col";
    obj.layout48:setHeight(30);
    obj.layout48.grid.width = 1;
    obj.layout48:setName("layout48");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout48);
    obj.edit139.grid.role = "col";
    obj.edit139.grid.width = 6;
    obj.edit139.grid["min-height"] = 30;
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setField("conNivel5");
    obj.edit139:setType("number");
    obj.edit139:setName("edit139");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout48);
    obj.edit140.grid.role = "col";
    obj.edit140.grid.width = 6;
    obj.edit140.grid["min-height"] = 30;
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setField("conNivel6");
    obj.edit140:setType("number");
    obj.edit140:setName("edit140");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout35);
    obj.layout49.grid.role = "col";
    obj.layout49:setHeight(30);
    obj.layout49.grid.width = 1;
    obj.layout49:setName("layout49");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout49);
    obj.edit141.grid.role = "col";
    obj.edit141.grid.width = 6;
    obj.edit141.grid["min-height"] = 30;
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setField("conNivel7");
    obj.edit141:setType("number");
    obj.edit141:setName("edit141");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout49);
    obj.edit142.grid.role = "col";
    obj.edit142.grid.width = 6;
    obj.edit142.grid["min-height"] = 30;
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setField("conNivel8");
    obj.edit142:setType("number");
    obj.edit142:setName("edit142");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout35);
    obj.layout50.grid.role = "col";
    obj.layout50:setHeight(30);
    obj.layout50.grid.width = 1;
    obj.layout50:setName("layout50");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout50);
    obj.edit143.grid.role = "col";
    obj.edit143.grid.width = 6;
    obj.edit143.grid["min-height"] = 30;
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setField("conNivel9");
    obj.edit143:setType("number");
    obj.edit143:setName("edit143");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout50);
    obj.edit144.grid.role = "col";
    obj.edit144.grid.width = 6;
    obj.edit144.grid["min-height"] = 30;
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setField("conNivel10");
    obj.edit144:setType("number");
    obj.edit144:setName("edit144");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout35);
    obj.layout51.grid.role = "col";
    obj.layout51:setHeight(30);
    obj.layout51.grid.width = 1;
    obj.layout51:setName("layout51");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout51);
    obj.edit145.grid.role = "col";
    obj.edit145.grid.width = 6;
    obj.edit145.grid["min-height"] = 30;
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setField("conNivel11");
    obj.edit145:setType("number");
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout51);
    obj.edit146.grid.role = "col";
    obj.edit146.grid.width = 6;
    obj.edit146.grid["min-height"] = 30;
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setField("conNivel12");
    obj.edit146:setType("number");
    obj.edit146:setName("edit146");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout35);
    obj.layout52.grid.role = "col";
    obj.layout52:setHeight(30);
    obj.layout52.grid.width = 1;
    obj.layout52:setName("layout52");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout52);
    obj.edit147.grid.role = "col";
    obj.edit147.grid.width = 6;
    obj.edit147.grid["min-height"] = 30;
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setField("conNivel13");
    obj.edit147:setType("number");
    obj.edit147:setName("edit147");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout52);
    obj.edit148.grid.role = "col";
    obj.edit148.grid.width = 6;
    obj.edit148.grid["min-height"] = 30;
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setField("conNivel14");
    obj.edit148:setType("number");
    obj.edit148:setName("edit148");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout35);
    obj.layout53.grid.role = "col";
    obj.layout53:setHeight(30);
    obj.layout53.grid.width = 1;
    obj.layout53:setName("layout53");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout53);
    obj.edit149.grid.role = "col";
    obj.edit149.grid.width = 6;
    obj.edit149.grid["min-height"] = 30;
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setField("conNivel15");
    obj.edit149:setType("number");
    obj.edit149:setName("edit149");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout53);
    obj.edit150.grid.role = "col";
    obj.edit150.grid.width = 6;
    obj.edit150.grid["min-height"] = 30;
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setField("conNivel16");
    obj.edit150:setType("number");
    obj.edit150:setName("edit150");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout35);
    obj.layout54.grid.role = "col";
    obj.layout54:setHeight(30);
    obj.layout54.grid.width = 1;
    obj.layout54:setName("layout54");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout54);
    obj.edit151.grid.role = "col";
    obj.edit151.grid.width = 6;
    obj.edit151.grid["min-height"] = 30;
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setField("conNivel17");
    obj.edit151:setType("number");
    obj.edit151:setName("edit151");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout54);
    obj.edit152.grid.role = "col";
    obj.edit152.grid.width = 6;
    obj.edit152.grid["min-height"] = 30;
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setField("conNivel18");
    obj.edit152:setType("number");
    obj.edit152:setName("edit152");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout35);
    obj.layout55.grid.role = "col";
    obj.layout55:setHeight(30);
    obj.layout55.grid.width = 1;
    obj.layout55:setName("layout55");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout55);
    obj.edit153.grid.role = "col";
    obj.edit153.grid.width = 6;
    obj.edit153.grid["min-height"] = 30;
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setField("conNivel19");
    obj.edit153:setType("number");
    obj.edit153:setName("edit153");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout55);
    obj.edit154.grid.role = "col";
    obj.edit154.grid.width = 6;
    obj.edit154.grid["min-height"] = 30;
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setField("conNivel20");
    obj.edit154:setType("number");
    obj.edit154:setName("edit154");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout35);
    obj.edit155:setField("conNivelTotal");
    obj.edit155.grid.role = "col";
    obj.edit155.grid.width = 1;
    obj.edit155.grid["min-height"] = 15;
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setReadOnly(true);
    obj.edit155:setCanFocus(false);
    obj.edit155:setCursor("default");
    obj.edit155:setName("edit155");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.scrollBox3);
    obj.dataLink26:setFields({'conNivel1','conNivel2','conNivel3','conNivel4','conNivel5',
            'conNivel6','conNivel7','conNivel8','conNivel9','conNivel10',
            'conNivel11','conNivel12','conNivel13','conNivel14','conNivel15',
            'conNivel16','conNivel17','conNivel18','conNivel19','conNivel20',});
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.scrollBox3);
    obj.dataLink27:setField("conNivelTotal");
    obj.dataLink27:setName("dataLink27");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox3);
    obj.layout56.grid.role = "row";
    obj.layout56:setName("layout56");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout56);
    obj.label126:setText("Força");
    obj.label126.grid.role = "col";
    obj.label126.grid.width = 1;
    obj.label126.grid["min-height"] = 20;
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57.grid.role = "col";
    obj.layout57:setHeight(15);
    obj.layout57.grid.width = 1;
    obj.layout57:setName("layout57");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout57);
    obj.label127:setText("2");
    obj.label127.grid.role = "col";
    obj.label127.grid.width = 6;
    obj.label127.grid["min-height"] = 15;
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout57);
    obj.label128:setText("3");
    obj.label128.grid.role = "col";
    obj.label128.grid.width = 6;
    obj.label128.grid["min-height"] = 15;
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout56);
    obj.layout58.grid.role = "col";
    obj.layout58:setHeight(15);
    obj.layout58.grid.width = 1;
    obj.layout58:setName("layout58");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout58);
    obj.label129:setText("4");
    obj.label129.grid.role = "col";
    obj.label129.grid.width = 6;
    obj.label129.grid["min-height"] = 15;
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout58);
    obj.label130:setText("5");
    obj.label130.grid.role = "col";
    obj.label130.grid.width = 6;
    obj.label130.grid["min-height"] = 15;
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout56);
    obj.layout59.grid.role = "col";
    obj.layout59:setHeight(15);
    obj.layout59.grid.width = 1;
    obj.layout59:setName("layout59");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout59);
    obj.label131:setText("6");
    obj.label131.grid.role = "col";
    obj.label131.grid.width = 6;
    obj.label131.grid["min-height"] = 15;
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout59);
    obj.label132:setText("7");
    obj.label132.grid.role = "col";
    obj.label132.grid.width = 6;
    obj.label132.grid["min-height"] = 15;
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout56);
    obj.layout60.grid.role = "col";
    obj.layout60:setHeight(15);
    obj.layout60.grid.width = 1;
    obj.layout60:setName("layout60");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout60);
    obj.label133:setText("8");
    obj.label133.grid.role = "col";
    obj.label133.grid.width = 6;
    obj.label133.grid["min-height"] = 15;
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout60);
    obj.label134:setText("9");
    obj.label134.grid.role = "col";
    obj.label134.grid.width = 6;
    obj.label134.grid["min-height"] = 15;
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout56);
    obj.layout61.grid.role = "col";
    obj.layout61:setHeight(15);
    obj.layout61.grid.width = 1;
    obj.layout61:setName("layout61");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout61);
    obj.label135:setText("10");
    obj.label135.grid.role = "col";
    obj.label135.grid.width = 6;
    obj.label135.grid["min-height"] = 15;
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout61);
    obj.label136:setText("11");
    obj.label136.grid.role = "col";
    obj.label136.grid.width = 6;
    obj.label136.grid["min-height"] = 15;
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout56);
    obj.layout62.grid.role = "col";
    obj.layout62:setHeight(15);
    obj.layout62.grid.width = 1;
    obj.layout62:setName("layout62");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout62);
    obj.label137:setText("12");
    obj.label137.grid.role = "col";
    obj.label137.grid.width = 6;
    obj.label137.grid["min-height"] = 15;
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout62);
    obj.label138:setText("13");
    obj.label138.grid.role = "col";
    obj.label138.grid.width = 6;
    obj.label138.grid["min-height"] = 15;
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout56);
    obj.layout63.grid.role = "col";
    obj.layout63:setHeight(15);
    obj.layout63.grid.width = 1;
    obj.layout63:setName("layout63");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout63);
    obj.label139:setText("14");
    obj.label139.grid.role = "col";
    obj.label139.grid.width = 6;
    obj.label139.grid["min-height"] = 15;
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout63);
    obj.label140:setText("15");
    obj.label140.grid.role = "col";
    obj.label140.grid.width = 6;
    obj.label140.grid["min-height"] = 15;
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout56);
    obj.layout64.grid.role = "col";
    obj.layout64:setHeight(15);
    obj.layout64.grid.width = 1;
    obj.layout64:setName("layout64");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout64);
    obj.label141:setText("16");
    obj.label141.grid.role = "col";
    obj.label141.grid.width = 6;
    obj.label141.grid["min-height"] = 15;
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout64);
    obj.label142:setText("17");
    obj.label142.grid.role = "col";
    obj.label142.grid.width = 6;
    obj.label142.grid["min-height"] = 15;
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout56);
    obj.layout65.grid.role = "col";
    obj.layout65:setHeight(15);
    obj.layout65.grid.width = 1;
    obj.layout65:setName("layout65");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout65);
    obj.label143:setText("18");
    obj.label143.grid.role = "col";
    obj.label143.grid.width = 6;
    obj.label143.grid["min-height"] = 15;
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout65);
    obj.label144:setText("19");
    obj.label144.grid.role = "col";
    obj.label144.grid.width = 6;
    obj.label144.grid["min-height"] = 15;
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout56);
    obj.layout66.grid.role = "col";
    obj.layout66:setHeight(15);
    obj.layout66.grid.width = 1;
    obj.layout66:setName("layout66");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout66);
    obj.label145:setText("20");
    obj.label145.grid.role = "col";
    obj.label145.grid.width = 6;
    obj.label145.grid["min-height"] = 15;
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout66);
    obj.label146:setText("20+");
    obj.label146.grid.role = "col";
    obj.label146.grid.width = 6;
    obj.label146.grid["min-height"] = 15;
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout56);
    obj.label147:setText("Total");
    obj.label147.grid.role = "col";
    obj.label147.grid.width = 1;
    obj.label147.grid["min-height"] = 15;
    obj.label147:setHorzTextAlign("center");
    obj.label147:setName("label147");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout56);
    obj.label148:setText("");
    obj.label148.grid.role = "col";
    obj.label148.grid.width = 1;
    obj.label148.grid["min-height"] = 15;
    obj.label148:setHorzTextAlign("center");
    obj.label148:setName("label148");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout56);
    obj.layout67.grid.role = "col";
    obj.layout67:setHeight(30);
    obj.layout67.grid.width = 1;
    obj.layout67:setName("layout67");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout67);
    obj.edit156.grid.role = "col";
    obj.edit156.grid.width = 6;
    obj.edit156.grid["min-height"] = 30;
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setField("forNivel1");
    obj.edit156:setType("number");
    obj.edit156:setName("edit156");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout67);
    obj.edit157.grid.role = "col";
    obj.edit157.grid.width = 6;
    obj.edit157.grid["min-height"] = 30;
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setField("forNivel2");
    obj.edit157:setType("number");
    obj.edit157:setName("edit157");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout56);
    obj.layout68.grid.role = "col";
    obj.layout68:setHeight(30);
    obj.layout68.grid.width = 1;
    obj.layout68:setName("layout68");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout68);
    obj.edit158.grid.role = "col";
    obj.edit158.grid.width = 6;
    obj.edit158.grid["min-height"] = 30;
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setField("forNivel3");
    obj.edit158:setType("number");
    obj.edit158:setName("edit158");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout68);
    obj.edit159.grid.role = "col";
    obj.edit159.grid.width = 6;
    obj.edit159.grid["min-height"] = 30;
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setField("forNivel4");
    obj.edit159:setType("number");
    obj.edit159:setName("edit159");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout56);
    obj.layout69.grid.role = "col";
    obj.layout69:setHeight(30);
    obj.layout69.grid.width = 1;
    obj.layout69:setName("layout69");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout69);
    obj.edit160.grid.role = "col";
    obj.edit160.grid.width = 6;
    obj.edit160.grid["min-height"] = 30;
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setField("forNivel5");
    obj.edit160:setType("number");
    obj.edit160:setName("edit160");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout69);
    obj.edit161.grid.role = "col";
    obj.edit161.grid.width = 6;
    obj.edit161.grid["min-height"] = 30;
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setField("forNivel6");
    obj.edit161:setType("number");
    obj.edit161:setName("edit161");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout56);
    obj.layout70.grid.role = "col";
    obj.layout70:setHeight(30);
    obj.layout70.grid.width = 1;
    obj.layout70:setName("layout70");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout70);
    obj.edit162.grid.role = "col";
    obj.edit162.grid.width = 6;
    obj.edit162.grid["min-height"] = 30;
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setField("forNivel7");
    obj.edit162:setType("number");
    obj.edit162:setName("edit162");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout70);
    obj.edit163.grid.role = "col";
    obj.edit163.grid.width = 6;
    obj.edit163.grid["min-height"] = 30;
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setField("forNivel8");
    obj.edit163:setType("number");
    obj.edit163:setName("edit163");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout56);
    obj.layout71.grid.role = "col";
    obj.layout71:setHeight(30);
    obj.layout71.grid.width = 1;
    obj.layout71:setName("layout71");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout71);
    obj.edit164.grid.role = "col";
    obj.edit164.grid.width = 6;
    obj.edit164.grid["min-height"] = 30;
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setField("forNivel9");
    obj.edit164:setType("number");
    obj.edit164:setName("edit164");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout71);
    obj.edit165.grid.role = "col";
    obj.edit165.grid.width = 6;
    obj.edit165.grid["min-height"] = 30;
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setField("forNivel10");
    obj.edit165:setType("number");
    obj.edit165:setName("edit165");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout56);
    obj.layout72.grid.role = "col";
    obj.layout72:setHeight(30);
    obj.layout72.grid.width = 1;
    obj.layout72:setName("layout72");

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout72);
    obj.edit166.grid.role = "col";
    obj.edit166.grid.width = 6;
    obj.edit166.grid["min-height"] = 30;
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setField("forNivel11");
    obj.edit166:setType("number");
    obj.edit166:setName("edit166");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout72);
    obj.edit167.grid.role = "col";
    obj.edit167.grid.width = 6;
    obj.edit167.grid["min-height"] = 30;
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setField("forNivel12");
    obj.edit167:setType("number");
    obj.edit167:setName("edit167");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout56);
    obj.layout73.grid.role = "col";
    obj.layout73:setHeight(30);
    obj.layout73.grid.width = 1;
    obj.layout73:setName("layout73");

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout73);
    obj.edit168.grid.role = "col";
    obj.edit168.grid.width = 6;
    obj.edit168.grid["min-height"] = 30;
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setField("forNivel13");
    obj.edit168:setType("number");
    obj.edit168:setName("edit168");

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout73);
    obj.edit169.grid.role = "col";
    obj.edit169.grid.width = 6;
    obj.edit169.grid["min-height"] = 30;
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setField("forNivel14");
    obj.edit169:setType("number");
    obj.edit169:setName("edit169");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout56);
    obj.layout74.grid.role = "col";
    obj.layout74:setHeight(30);
    obj.layout74.grid.width = 1;
    obj.layout74:setName("layout74");

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout74);
    obj.edit170.grid.role = "col";
    obj.edit170.grid.width = 6;
    obj.edit170.grid["min-height"] = 30;
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setField("forNivel15");
    obj.edit170:setType("number");
    obj.edit170:setName("edit170");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout74);
    obj.edit171.grid.role = "col";
    obj.edit171.grid.width = 6;
    obj.edit171.grid["min-height"] = 30;
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setField("forNivel16");
    obj.edit171:setType("number");
    obj.edit171:setName("edit171");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout56);
    obj.layout75.grid.role = "col";
    obj.layout75:setHeight(30);
    obj.layout75.grid.width = 1;
    obj.layout75:setName("layout75");

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout75);
    obj.edit172.grid.role = "col";
    obj.edit172.grid.width = 6;
    obj.edit172.grid["min-height"] = 30;
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setField("forNivel17");
    obj.edit172:setType("number");
    obj.edit172:setName("edit172");

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout75);
    obj.edit173.grid.role = "col";
    obj.edit173.grid.width = 6;
    obj.edit173.grid["min-height"] = 30;
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setField("forNivel18");
    obj.edit173:setType("number");
    obj.edit173:setName("edit173");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout56);
    obj.layout76.grid.role = "col";
    obj.layout76:setHeight(30);
    obj.layout76.grid.width = 1;
    obj.layout76:setName("layout76");

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout76);
    obj.edit174.grid.role = "col";
    obj.edit174.grid.width = 6;
    obj.edit174.grid["min-height"] = 30;
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setField("forNivel19");
    obj.edit174:setType("number");
    obj.edit174:setName("edit174");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout76);
    obj.edit175.grid.role = "col";
    obj.edit175.grid.width = 6;
    obj.edit175.grid["min-height"] = 30;
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setField("forNivel20");
    obj.edit175:setType("number");
    obj.edit175:setName("edit175");

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout56);
    obj.edit176:setField("forNivelTotal");
    obj.edit176.grid.role = "col";
    obj.edit176.grid.width = 1;
    obj.edit176.grid["min-height"] = 15;
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setReadOnly(true);
    obj.edit176:setCanFocus(false);
    obj.edit176:setCursor("default");
    obj.edit176:setName("edit176");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.scrollBox3);
    obj.dataLink28:setFields({'forNivel1','forNivel2','forNivel3','forNivel4','forNivel5',
            'forNivel6','forNivel7','forNivel8','forNivel9','forNivel10',
            'forNivel11','forNivel12','forNivel13','forNivel14','forNivel15',
            'forNivel16','forNivel17','forNivel18','forNivel19','forNivel20',});
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.scrollBox3);
    obj.dataLink29:setField("forNivelTotal");
    obj.dataLink29:setName("dataLink29");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.scrollBox3);
    obj.layout77.grid.role = "row";
    obj.layout77:setName("layout77");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout77);
    obj.label149:setText("Destreza");
    obj.label149.grid.role = "col";
    obj.label149.grid.width = 1;
    obj.label149.grid["min-height"] = 20;
    obj.label149:setHorzTextAlign("center");
    obj.label149:setName("label149");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout77);
    obj.layout78.grid.role = "col";
    obj.layout78:setHeight(15);
    obj.layout78.grid.width = 1;
    obj.layout78:setName("layout78");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout78);
    obj.label150:setText("2");
    obj.label150.grid.role = "col";
    obj.label150.grid.width = 6;
    obj.label150.grid["min-height"] = 15;
    obj.label150:setHorzTextAlign("center");
    obj.label150:setName("label150");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout78);
    obj.label151:setText("3");
    obj.label151.grid.role = "col";
    obj.label151.grid.width = 6;
    obj.label151.grid["min-height"] = 15;
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout77);
    obj.layout79.grid.role = "col";
    obj.layout79:setHeight(15);
    obj.layout79.grid.width = 1;
    obj.layout79:setName("layout79");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout79);
    obj.label152:setText("4");
    obj.label152.grid.role = "col";
    obj.label152.grid.width = 6;
    obj.label152.grid["min-height"] = 15;
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout79);
    obj.label153:setText("5");
    obj.label153.grid.role = "col";
    obj.label153.grid.width = 6;
    obj.label153.grid["min-height"] = 15;
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout77);
    obj.layout80.grid.role = "col";
    obj.layout80:setHeight(15);
    obj.layout80.grid.width = 1;
    obj.layout80:setName("layout80");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout80);
    obj.label154:setText("6");
    obj.label154.grid.role = "col";
    obj.label154.grid.width = 6;
    obj.label154.grid["min-height"] = 15;
    obj.label154:setHorzTextAlign("center");
    obj.label154:setName("label154");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout80);
    obj.label155:setText("7");
    obj.label155.grid.role = "col";
    obj.label155.grid.width = 6;
    obj.label155.grid["min-height"] = 15;
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout77);
    obj.layout81.grid.role = "col";
    obj.layout81:setHeight(15);
    obj.layout81.grid.width = 1;
    obj.layout81:setName("layout81");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout81);
    obj.label156:setText("8");
    obj.label156.grid.role = "col";
    obj.label156.grid.width = 6;
    obj.label156.grid["min-height"] = 15;
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout81);
    obj.label157:setText("9");
    obj.label157.grid.role = "col";
    obj.label157.grid.width = 6;
    obj.label157.grid["min-height"] = 15;
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout77);
    obj.layout82.grid.role = "col";
    obj.layout82:setHeight(15);
    obj.layout82.grid.width = 1;
    obj.layout82:setName("layout82");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout82);
    obj.label158:setText("10");
    obj.label158.grid.role = "col";
    obj.label158.grid.width = 6;
    obj.label158.grid["min-height"] = 15;
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout82);
    obj.label159:setText("11");
    obj.label159.grid.role = "col";
    obj.label159.grid.width = 6;
    obj.label159.grid["min-height"] = 15;
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout77);
    obj.layout83.grid.role = "col";
    obj.layout83:setHeight(15);
    obj.layout83.grid.width = 1;
    obj.layout83:setName("layout83");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout83);
    obj.label160:setText("12");
    obj.label160.grid.role = "col";
    obj.label160.grid.width = 6;
    obj.label160.grid["min-height"] = 15;
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout83);
    obj.label161:setText("13");
    obj.label161.grid.role = "col";
    obj.label161.grid.width = 6;
    obj.label161.grid["min-height"] = 15;
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout77);
    obj.layout84.grid.role = "col";
    obj.layout84:setHeight(15);
    obj.layout84.grid.width = 1;
    obj.layout84:setName("layout84");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout84);
    obj.label162:setText("14");
    obj.label162.grid.role = "col";
    obj.label162.grid.width = 6;
    obj.label162.grid["min-height"] = 15;
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout84);
    obj.label163:setText("15");
    obj.label163.grid.role = "col";
    obj.label163.grid.width = 6;
    obj.label163.grid["min-height"] = 15;
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout77);
    obj.layout85.grid.role = "col";
    obj.layout85:setHeight(15);
    obj.layout85.grid.width = 1;
    obj.layout85:setName("layout85");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout85);
    obj.label164:setText("16");
    obj.label164.grid.role = "col";
    obj.label164.grid.width = 6;
    obj.label164.grid["min-height"] = 15;
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout85);
    obj.label165:setText("17");
    obj.label165.grid.role = "col";
    obj.label165.grid.width = 6;
    obj.label165.grid["min-height"] = 15;
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout77);
    obj.layout86.grid.role = "col";
    obj.layout86:setHeight(15);
    obj.layout86.grid.width = 1;
    obj.layout86:setName("layout86");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout86);
    obj.label166:setText("18");
    obj.label166.grid.role = "col";
    obj.label166.grid.width = 6;
    obj.label166.grid["min-height"] = 15;
    obj.label166:setHorzTextAlign("center");
    obj.label166:setName("label166");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout86);
    obj.label167:setText("19");
    obj.label167.grid.role = "col";
    obj.label167.grid.width = 6;
    obj.label167.grid["min-height"] = 15;
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout77);
    obj.layout87.grid.role = "col";
    obj.layout87:setHeight(15);
    obj.layout87.grid.width = 1;
    obj.layout87:setName("layout87");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout87);
    obj.label168:setText("20");
    obj.label168.grid.role = "col";
    obj.label168.grid.width = 6;
    obj.label168.grid["min-height"] = 15;
    obj.label168:setHorzTextAlign("center");
    obj.label168:setName("label168");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout87);
    obj.label169:setText("20+");
    obj.label169.grid.role = "col";
    obj.label169.grid.width = 6;
    obj.label169.grid["min-height"] = 15;
    obj.label169:setHorzTextAlign("center");
    obj.label169:setName("label169");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout77);
    obj.label170:setText("Total");
    obj.label170.grid.role = "col";
    obj.label170.grid.width = 1;
    obj.label170.grid["min-height"] = 15;
    obj.label170:setHorzTextAlign("center");
    obj.label170:setName("label170");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout77);
    obj.label171:setText("");
    obj.label171.grid.role = "col";
    obj.label171.grid.width = 1;
    obj.label171.grid["min-height"] = 15;
    obj.label171:setHorzTextAlign("center");
    obj.label171:setName("label171");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout77);
    obj.layout88.grid.role = "col";
    obj.layout88:setHeight(30);
    obj.layout88.grid.width = 1;
    obj.layout88:setName("layout88");

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout88);
    obj.edit177.grid.role = "col";
    obj.edit177.grid.width = 6;
    obj.edit177.grid["min-height"] = 30;
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setField("dexNivel1");
    obj.edit177:setType("number");
    obj.edit177:setName("edit177");

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout88);
    obj.edit178.grid.role = "col";
    obj.edit178.grid.width = 6;
    obj.edit178.grid["min-height"] = 30;
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setField("dexNivel2");
    obj.edit178:setType("number");
    obj.edit178:setName("edit178");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout77);
    obj.layout89.grid.role = "col";
    obj.layout89:setHeight(30);
    obj.layout89.grid.width = 1;
    obj.layout89:setName("layout89");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout89);
    obj.edit179.grid.role = "col";
    obj.edit179.grid.width = 6;
    obj.edit179.grid["min-height"] = 30;
    obj.edit179:setHorzTextAlign("center");
    obj.edit179:setField("dexNivel3");
    obj.edit179:setType("number");
    obj.edit179:setName("edit179");

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout89);
    obj.edit180.grid.role = "col";
    obj.edit180.grid.width = 6;
    obj.edit180.grid["min-height"] = 30;
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setField("dexNivel4");
    obj.edit180:setType("number");
    obj.edit180:setName("edit180");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout77);
    obj.layout90.grid.role = "col";
    obj.layout90:setHeight(30);
    obj.layout90.grid.width = 1;
    obj.layout90:setName("layout90");

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout90);
    obj.edit181.grid.role = "col";
    obj.edit181.grid.width = 6;
    obj.edit181.grid["min-height"] = 30;
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setField("dexNivel5");
    obj.edit181:setType("number");
    obj.edit181:setName("edit181");

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout90);
    obj.edit182.grid.role = "col";
    obj.edit182.grid.width = 6;
    obj.edit182.grid["min-height"] = 30;
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setField("dexNivel6");
    obj.edit182:setType("number");
    obj.edit182:setName("edit182");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.layout77);
    obj.layout91.grid.role = "col";
    obj.layout91:setHeight(30);
    obj.layout91.grid.width = 1;
    obj.layout91:setName("layout91");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout91);
    obj.edit183.grid.role = "col";
    obj.edit183.grid.width = 6;
    obj.edit183.grid["min-height"] = 30;
    obj.edit183:setHorzTextAlign("center");
    obj.edit183:setField("dexNivel7");
    obj.edit183:setType("number");
    obj.edit183:setName("edit183");

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout91);
    obj.edit184.grid.role = "col";
    obj.edit184.grid.width = 6;
    obj.edit184.grid["min-height"] = 30;
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setField("dexNivel8");
    obj.edit184:setType("number");
    obj.edit184:setName("edit184");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout77);
    obj.layout92.grid.role = "col";
    obj.layout92:setHeight(30);
    obj.layout92.grid.width = 1;
    obj.layout92:setName("layout92");

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout92);
    obj.edit185.grid.role = "col";
    obj.edit185.grid.width = 6;
    obj.edit185.grid["min-height"] = 30;
    obj.edit185:setHorzTextAlign("center");
    obj.edit185:setField("dexNivel9");
    obj.edit185:setType("number");
    obj.edit185:setName("edit185");

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout92);
    obj.edit186.grid.role = "col";
    obj.edit186.grid.width = 6;
    obj.edit186.grid["min-height"] = 30;
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setField("dexNivel10");
    obj.edit186:setType("number");
    obj.edit186:setName("edit186");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout77);
    obj.layout93.grid.role = "col";
    obj.layout93:setHeight(30);
    obj.layout93.grid.width = 1;
    obj.layout93:setName("layout93");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout93);
    obj.edit187.grid.role = "col";
    obj.edit187.grid.width = 6;
    obj.edit187.grid["min-height"] = 30;
    obj.edit187:setHorzTextAlign("center");
    obj.edit187:setField("dexNivel11");
    obj.edit187:setType("number");
    obj.edit187:setName("edit187");

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout93);
    obj.edit188.grid.role = "col";
    obj.edit188.grid.width = 6;
    obj.edit188.grid["min-height"] = 30;
    obj.edit188:setHorzTextAlign("center");
    obj.edit188:setField("dexNivel12");
    obj.edit188:setType("number");
    obj.edit188:setName("edit188");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout77);
    obj.layout94.grid.role = "col";
    obj.layout94:setHeight(30);
    obj.layout94.grid.width = 1;
    obj.layout94:setName("layout94");

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout94);
    obj.edit189.grid.role = "col";
    obj.edit189.grid.width = 6;
    obj.edit189.grid["min-height"] = 30;
    obj.edit189:setHorzTextAlign("center");
    obj.edit189:setField("dexNivel13");
    obj.edit189:setType("number");
    obj.edit189:setName("edit189");

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout94);
    obj.edit190.grid.role = "col";
    obj.edit190.grid.width = 6;
    obj.edit190.grid["min-height"] = 30;
    obj.edit190:setHorzTextAlign("center");
    obj.edit190:setField("dexNivel14");
    obj.edit190:setType("number");
    obj.edit190:setName("edit190");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout77);
    obj.layout95.grid.role = "col";
    obj.layout95:setHeight(30);
    obj.layout95.grid.width = 1;
    obj.layout95:setName("layout95");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout95);
    obj.edit191.grid.role = "col";
    obj.edit191.grid.width = 6;
    obj.edit191.grid["min-height"] = 30;
    obj.edit191:setHorzTextAlign("center");
    obj.edit191:setField("dexNivel15");
    obj.edit191:setType("number");
    obj.edit191:setName("edit191");

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout95);
    obj.edit192.grid.role = "col";
    obj.edit192.grid.width = 6;
    obj.edit192.grid["min-height"] = 30;
    obj.edit192:setHorzTextAlign("center");
    obj.edit192:setField("dexNivel16");
    obj.edit192:setType("number");
    obj.edit192:setName("edit192");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout77);
    obj.layout96.grid.role = "col";
    obj.layout96:setHeight(30);
    obj.layout96.grid.width = 1;
    obj.layout96:setName("layout96");

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout96);
    obj.edit193.grid.role = "col";
    obj.edit193.grid.width = 6;
    obj.edit193.grid["min-height"] = 30;
    obj.edit193:setHorzTextAlign("center");
    obj.edit193:setField("dexNivel17");
    obj.edit193:setType("number");
    obj.edit193:setName("edit193");

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout96);
    obj.edit194.grid.role = "col";
    obj.edit194.grid.width = 6;
    obj.edit194.grid["min-height"] = 30;
    obj.edit194:setHorzTextAlign("center");
    obj.edit194:setField("dexNivel18");
    obj.edit194:setType("number");
    obj.edit194:setName("edit194");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout77);
    obj.layout97.grid.role = "col";
    obj.layout97:setHeight(30);
    obj.layout97.grid.width = 1;
    obj.layout97:setName("layout97");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout97);
    obj.edit195.grid.role = "col";
    obj.edit195.grid.width = 6;
    obj.edit195.grid["min-height"] = 30;
    obj.edit195:setHorzTextAlign("center");
    obj.edit195:setField("dexNivel19");
    obj.edit195:setType("number");
    obj.edit195:setName("edit195");

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout97);
    obj.edit196.grid.role = "col";
    obj.edit196.grid.width = 6;
    obj.edit196.grid["min-height"] = 30;
    obj.edit196:setHorzTextAlign("center");
    obj.edit196:setField("dexNivel20");
    obj.edit196:setType("number");
    obj.edit196:setName("edit196");

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout77);
    obj.edit197:setField("dexNivelTotal");
    obj.edit197.grid.role = "col";
    obj.edit197.grid.width = 1;
    obj.edit197.grid["min-height"] = 15;
    obj.edit197:setHorzTextAlign("center");
    obj.edit197:setReadOnly(true);
    obj.edit197:setCanFocus(false);
    obj.edit197:setCursor("default");
    obj.edit197:setName("edit197");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.scrollBox3);
    obj.dataLink30:setFields({'dexNivel1','dexNivel2','dexNivel3','dexNivel4','dexNivel5',
            'dexNivel6','dexNivel7','dexNivel8','dexNivel9','dexNivel10',
            'dexNivel11','dexNivel12','dexNivel13','dexNivel14','dexNivel15',
            'dexNivel16','dexNivel17','dexNivel18','dexNivel19','dexNivel20',});
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.scrollBox3);
    obj.dataLink31:setField("dexNivelTotal");
    obj.dataLink31:setName("dataLink31");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.scrollBox3);
    obj.layout98.grid.role = "row";
    obj.layout98:setName("layout98");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout98);
    obj.label172:setText("Carisma");
    obj.label172.grid.role = "col";
    obj.label172.grid.width = 1;
    obj.label172.grid["min-height"] = 20;
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout98);
    obj.layout99.grid.role = "col";
    obj.layout99:setHeight(15);
    obj.layout99.grid.width = 1;
    obj.layout99:setName("layout99");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout99);
    obj.label173:setText("2");
    obj.label173.grid.role = "col";
    obj.label173.grid.width = 6;
    obj.label173.grid["min-height"] = 15;
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout99);
    obj.label174:setText("3");
    obj.label174.grid.role = "col";
    obj.label174.grid.width = 6;
    obj.label174.grid["min-height"] = 15;
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout98);
    obj.layout100.grid.role = "col";
    obj.layout100:setHeight(15);
    obj.layout100.grid.width = 1;
    obj.layout100:setName("layout100");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout100);
    obj.label175:setText("4");
    obj.label175.grid.role = "col";
    obj.label175.grid.width = 6;
    obj.label175.grid["min-height"] = 15;
    obj.label175:setHorzTextAlign("center");
    obj.label175:setName("label175");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout100);
    obj.label176:setText("5");
    obj.label176.grid.role = "col";
    obj.label176.grid.width = 6;
    obj.label176.grid["min-height"] = 15;
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout98);
    obj.layout101.grid.role = "col";
    obj.layout101:setHeight(15);
    obj.layout101.grid.width = 1;
    obj.layout101:setName("layout101");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout101);
    obj.label177:setText("6");
    obj.label177.grid.role = "col";
    obj.label177.grid.width = 6;
    obj.label177.grid["min-height"] = 15;
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout101);
    obj.label178:setText("7");
    obj.label178.grid.role = "col";
    obj.label178.grid.width = 6;
    obj.label178.grid["min-height"] = 15;
    obj.label178:setHorzTextAlign("center");
    obj.label178:setName("label178");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout98);
    obj.layout102.grid.role = "col";
    obj.layout102:setHeight(15);
    obj.layout102.grid.width = 1;
    obj.layout102:setName("layout102");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout102);
    obj.label179:setText("8");
    obj.label179.grid.role = "col";
    obj.label179.grid.width = 6;
    obj.label179.grid["min-height"] = 15;
    obj.label179:setHorzTextAlign("center");
    obj.label179:setName("label179");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.layout102);
    obj.label180:setText("9");
    obj.label180.grid.role = "col";
    obj.label180.grid.width = 6;
    obj.label180.grid["min-height"] = 15;
    obj.label180:setHorzTextAlign("center");
    obj.label180:setName("label180");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout98);
    obj.layout103.grid.role = "col";
    obj.layout103:setHeight(15);
    obj.layout103.grid.width = 1;
    obj.layout103:setName("layout103");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout103);
    obj.label181:setText("10");
    obj.label181.grid.role = "col";
    obj.label181.grid.width = 6;
    obj.label181.grid["min-height"] = 15;
    obj.label181:setHorzTextAlign("center");
    obj.label181:setName("label181");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout103);
    obj.label182:setText("11");
    obj.label182.grid.role = "col";
    obj.label182.grid.width = 6;
    obj.label182.grid["min-height"] = 15;
    obj.label182:setHorzTextAlign("center");
    obj.label182:setName("label182");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout98);
    obj.layout104.grid.role = "col";
    obj.layout104:setHeight(15);
    obj.layout104.grid.width = 1;
    obj.layout104:setName("layout104");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout104);
    obj.label183:setText("12");
    obj.label183.grid.role = "col";
    obj.label183.grid.width = 6;
    obj.label183.grid["min-height"] = 15;
    obj.label183:setHorzTextAlign("center");
    obj.label183:setName("label183");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout104);
    obj.label184:setText("13");
    obj.label184.grid.role = "col";
    obj.label184.grid.width = 6;
    obj.label184.grid["min-height"] = 15;
    obj.label184:setHorzTextAlign("center");
    obj.label184:setName("label184");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout98);
    obj.layout105.grid.role = "col";
    obj.layout105:setHeight(15);
    obj.layout105.grid.width = 1;
    obj.layout105:setName("layout105");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout105);
    obj.label185:setText("14");
    obj.label185.grid.role = "col";
    obj.label185.grid.width = 6;
    obj.label185.grid["min-height"] = 15;
    obj.label185:setHorzTextAlign("center");
    obj.label185:setName("label185");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout105);
    obj.label186:setText("15");
    obj.label186.grid.role = "col";
    obj.label186.grid.width = 6;
    obj.label186.grid["min-height"] = 15;
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout98);
    obj.layout106.grid.role = "col";
    obj.layout106:setHeight(15);
    obj.layout106.grid.width = 1;
    obj.layout106:setName("layout106");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout106);
    obj.label187:setText("16");
    obj.label187.grid.role = "col";
    obj.label187.grid.width = 6;
    obj.label187.grid["min-height"] = 15;
    obj.label187:setHorzTextAlign("center");
    obj.label187:setName("label187");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout106);
    obj.label188:setText("17");
    obj.label188.grid.role = "col";
    obj.label188.grid.width = 6;
    obj.label188.grid["min-height"] = 15;
    obj.label188:setHorzTextAlign("center");
    obj.label188:setName("label188");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout98);
    obj.layout107.grid.role = "col";
    obj.layout107:setHeight(15);
    obj.layout107.grid.width = 1;
    obj.layout107:setName("layout107");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.layout107);
    obj.label189:setText("18");
    obj.label189.grid.role = "col";
    obj.label189.grid.width = 6;
    obj.label189.grid["min-height"] = 15;
    obj.label189:setHorzTextAlign("center");
    obj.label189:setName("label189");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.layout107);
    obj.label190:setText("19");
    obj.label190.grid.role = "col";
    obj.label190.grid.width = 6;
    obj.label190.grid["min-height"] = 15;
    obj.label190:setHorzTextAlign("center");
    obj.label190:setName("label190");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout98);
    obj.layout108.grid.role = "col";
    obj.layout108:setHeight(15);
    obj.layout108.grid.width = 1;
    obj.layout108:setName("layout108");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.layout108);
    obj.label191:setText("20");
    obj.label191.grid.role = "col";
    obj.label191.grid.width = 6;
    obj.label191.grid["min-height"] = 15;
    obj.label191:setHorzTextAlign("center");
    obj.label191:setName("label191");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.layout108);
    obj.label192:setText("20+");
    obj.label192.grid.role = "col";
    obj.label192.grid.width = 6;
    obj.label192.grid["min-height"] = 15;
    obj.label192:setHorzTextAlign("center");
    obj.label192:setName("label192");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.layout98);
    obj.label193:setText("Total");
    obj.label193.grid.role = "col";
    obj.label193.grid.width = 1;
    obj.label193.grid["min-height"] = 15;
    obj.label193:setHorzTextAlign("center");
    obj.label193:setName("label193");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.layout98);
    obj.label194:setText("");
    obj.label194.grid.role = "col";
    obj.label194.grid.width = 1;
    obj.label194.grid["min-height"] = 15;
    obj.label194:setHorzTextAlign("center");
    obj.label194:setName("label194");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout98);
    obj.layout109.grid.role = "col";
    obj.layout109:setHeight(30);
    obj.layout109.grid.width = 1;
    obj.layout109:setName("layout109");

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout109);
    obj.edit198.grid.role = "col";
    obj.edit198.grid.width = 6;
    obj.edit198.grid["min-height"] = 30;
    obj.edit198:setHorzTextAlign("center");
    obj.edit198:setField("carNivel1");
    obj.edit198:setType("number");
    obj.edit198:setName("edit198");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout109);
    obj.edit199.grid.role = "col";
    obj.edit199.grid.width = 6;
    obj.edit199.grid["min-height"] = 30;
    obj.edit199:setHorzTextAlign("center");
    obj.edit199:setField("carNivel2");
    obj.edit199:setType("number");
    obj.edit199:setName("edit199");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout98);
    obj.layout110.grid.role = "col";
    obj.layout110:setHeight(30);
    obj.layout110.grid.width = 1;
    obj.layout110:setName("layout110");

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout110);
    obj.edit200.grid.role = "col";
    obj.edit200.grid.width = 6;
    obj.edit200.grid["min-height"] = 30;
    obj.edit200:setHorzTextAlign("center");
    obj.edit200:setField("carNivel3");
    obj.edit200:setType("number");
    obj.edit200:setName("edit200");

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout110);
    obj.edit201.grid.role = "col";
    obj.edit201.grid.width = 6;
    obj.edit201.grid["min-height"] = 30;
    obj.edit201:setHorzTextAlign("center");
    obj.edit201:setField("carNivel4");
    obj.edit201:setType("number");
    obj.edit201:setName("edit201");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout98);
    obj.layout111.grid.role = "col";
    obj.layout111:setHeight(30);
    obj.layout111.grid.width = 1;
    obj.layout111:setName("layout111");

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout111);
    obj.edit202.grid.role = "col";
    obj.edit202.grid.width = 6;
    obj.edit202.grid["min-height"] = 30;
    obj.edit202:setHorzTextAlign("center");
    obj.edit202:setField("carNivel5");
    obj.edit202:setType("number");
    obj.edit202:setName("edit202");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout111);
    obj.edit203.grid.role = "col";
    obj.edit203.grid.width = 6;
    obj.edit203.grid["min-height"] = 30;
    obj.edit203:setHorzTextAlign("center");
    obj.edit203:setField("carNivel6");
    obj.edit203:setType("number");
    obj.edit203:setName("edit203");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout98);
    obj.layout112.grid.role = "col";
    obj.layout112:setHeight(30);
    obj.layout112.grid.width = 1;
    obj.layout112:setName("layout112");

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout112);
    obj.edit204.grid.role = "col";
    obj.edit204.grid.width = 6;
    obj.edit204.grid["min-height"] = 30;
    obj.edit204:setHorzTextAlign("center");
    obj.edit204:setField("carNivel7");
    obj.edit204:setType("number");
    obj.edit204:setName("edit204");

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout112);
    obj.edit205.grid.role = "col";
    obj.edit205.grid.width = 6;
    obj.edit205.grid["min-height"] = 30;
    obj.edit205:setHorzTextAlign("center");
    obj.edit205:setField("carNivel8");
    obj.edit205:setType("number");
    obj.edit205:setName("edit205");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout98);
    obj.layout113.grid.role = "col";
    obj.layout113:setHeight(30);
    obj.layout113.grid.width = 1;
    obj.layout113:setName("layout113");

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout113);
    obj.edit206.grid.role = "col";
    obj.edit206.grid.width = 6;
    obj.edit206.grid["min-height"] = 30;
    obj.edit206:setHorzTextAlign("center");
    obj.edit206:setField("carNivel9");
    obj.edit206:setType("number");
    obj.edit206:setName("edit206");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout113);
    obj.edit207.grid.role = "col";
    obj.edit207.grid.width = 6;
    obj.edit207.grid["min-height"] = 30;
    obj.edit207:setHorzTextAlign("center");
    obj.edit207:setField("carNivel10");
    obj.edit207:setType("number");
    obj.edit207:setName("edit207");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout98);
    obj.layout114.grid.role = "col";
    obj.layout114:setHeight(30);
    obj.layout114.grid.width = 1;
    obj.layout114:setName("layout114");

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout114);
    obj.edit208.grid.role = "col";
    obj.edit208.grid.width = 6;
    obj.edit208.grid["min-height"] = 30;
    obj.edit208:setHorzTextAlign("center");
    obj.edit208:setField("carNivel11");
    obj.edit208:setType("number");
    obj.edit208:setName("edit208");

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout114);
    obj.edit209.grid.role = "col";
    obj.edit209.grid.width = 6;
    obj.edit209.grid["min-height"] = 30;
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setField("carNivel12");
    obj.edit209:setType("number");
    obj.edit209:setName("edit209");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout98);
    obj.layout115.grid.role = "col";
    obj.layout115:setHeight(30);
    obj.layout115.grid.width = 1;
    obj.layout115:setName("layout115");

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout115);
    obj.edit210.grid.role = "col";
    obj.edit210.grid.width = 6;
    obj.edit210.grid["min-height"] = 30;
    obj.edit210:setHorzTextAlign("center");
    obj.edit210:setField("carNivel13");
    obj.edit210:setType("number");
    obj.edit210:setName("edit210");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout115);
    obj.edit211.grid.role = "col";
    obj.edit211.grid.width = 6;
    obj.edit211.grid["min-height"] = 30;
    obj.edit211:setHorzTextAlign("center");
    obj.edit211:setField("carNivel14");
    obj.edit211:setType("number");
    obj.edit211:setName("edit211");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout98);
    obj.layout116.grid.role = "col";
    obj.layout116:setHeight(30);
    obj.layout116.grid.width = 1;
    obj.layout116:setName("layout116");

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout116);
    obj.edit212.grid.role = "col";
    obj.edit212.grid.width = 6;
    obj.edit212.grid["min-height"] = 30;
    obj.edit212:setHorzTextAlign("center");
    obj.edit212:setField("carNivel15");
    obj.edit212:setType("number");
    obj.edit212:setName("edit212");

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout116);
    obj.edit213.grid.role = "col";
    obj.edit213.grid.width = 6;
    obj.edit213.grid["min-height"] = 30;
    obj.edit213:setHorzTextAlign("center");
    obj.edit213:setField("carNivel16");
    obj.edit213:setType("number");
    obj.edit213:setName("edit213");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout98);
    obj.layout117.grid.role = "col";
    obj.layout117:setHeight(30);
    obj.layout117.grid.width = 1;
    obj.layout117:setName("layout117");

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout117);
    obj.edit214.grid.role = "col";
    obj.edit214.grid.width = 6;
    obj.edit214.grid["min-height"] = 30;
    obj.edit214:setHorzTextAlign("center");
    obj.edit214:setField("carNivel17");
    obj.edit214:setType("number");
    obj.edit214:setName("edit214");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout117);
    obj.edit215.grid.role = "col";
    obj.edit215.grid.width = 6;
    obj.edit215.grid["min-height"] = 30;
    obj.edit215:setHorzTextAlign("center");
    obj.edit215:setField("carNivel18");
    obj.edit215:setType("number");
    obj.edit215:setName("edit215");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout98);
    obj.layout118.grid.role = "col";
    obj.layout118:setHeight(30);
    obj.layout118.grid.width = 1;
    obj.layout118:setName("layout118");

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout118);
    obj.edit216.grid.role = "col";
    obj.edit216.grid.width = 6;
    obj.edit216.grid["min-height"] = 30;
    obj.edit216:setHorzTextAlign("center");
    obj.edit216:setField("carNivel19");
    obj.edit216:setType("number");
    obj.edit216:setName("edit216");

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout118);
    obj.edit217.grid.role = "col";
    obj.edit217.grid.width = 6;
    obj.edit217.grid["min-height"] = 30;
    obj.edit217:setHorzTextAlign("center");
    obj.edit217:setField("carNivel20");
    obj.edit217:setType("number");
    obj.edit217:setName("edit217");

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout98);
    obj.edit218:setField("carNivelTotal");
    obj.edit218.grid.role = "col";
    obj.edit218.grid.width = 1;
    obj.edit218.grid["min-height"] = 15;
    obj.edit218:setHorzTextAlign("center");
    obj.edit218:setReadOnly(true);
    obj.edit218:setCanFocus(false);
    obj.edit218:setCursor("default");
    obj.edit218:setName("edit218");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.scrollBox3);
    obj.dataLink32:setFields({'carNivel1','carNivel2','carNivel3','carNivel4','carNivel5',
            'carNivel6','carNivel7','carNivel8','carNivel9','carNivel10',
            'carNivel11','carNivel12','carNivel13','carNivel14','carNivel15',
            'carNivel16','carNivel17','carNivel18','carNivel19','carNivel20',});
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.scrollBox3);
    obj.dataLink33:setField("carNivelTotal");
    obj.dataLink33:setName("dataLink33");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.scrollBox3);
    obj.layout119.grid.role = "row";
    obj.layout119:setName("layout119");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.layout119);
    obj.label195:setText("Inteligência");
    obj.label195.grid.role = "col";
    obj.label195.grid.width = 1;
    obj.label195.grid["min-height"] = 20;
    obj.label195:setHorzTextAlign("center");
    obj.label195:setName("label195");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout119);
    obj.layout120.grid.role = "col";
    obj.layout120:setHeight(15);
    obj.layout120.grid.width = 1;
    obj.layout120:setName("layout120");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.layout120);
    obj.label196:setText("2");
    obj.label196.grid.role = "col";
    obj.label196.grid.width = 6;
    obj.label196.grid["min-height"] = 15;
    obj.label196:setHorzTextAlign("center");
    obj.label196:setName("label196");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.layout120);
    obj.label197:setText("3");
    obj.label197.grid.role = "col";
    obj.label197.grid.width = 6;
    obj.label197.grid["min-height"] = 15;
    obj.label197:setHorzTextAlign("center");
    obj.label197:setName("label197");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout119);
    obj.layout121.grid.role = "col";
    obj.layout121:setHeight(15);
    obj.layout121.grid.width = 1;
    obj.layout121:setName("layout121");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.layout121);
    obj.label198:setText("4");
    obj.label198.grid.role = "col";
    obj.label198.grid.width = 6;
    obj.label198.grid["min-height"] = 15;
    obj.label198:setHorzTextAlign("center");
    obj.label198:setName("label198");

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.layout121);
    obj.label199:setText("5");
    obj.label199.grid.role = "col";
    obj.label199.grid.width = 6;
    obj.label199.grid["min-height"] = 15;
    obj.label199:setHorzTextAlign("center");
    obj.label199:setName("label199");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout119);
    obj.layout122.grid.role = "col";
    obj.layout122:setHeight(15);
    obj.layout122.grid.width = 1;
    obj.layout122:setName("layout122");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.layout122);
    obj.label200:setText("6");
    obj.label200.grid.role = "col";
    obj.label200.grid.width = 6;
    obj.label200.grid["min-height"] = 15;
    obj.label200:setHorzTextAlign("center");
    obj.label200:setName("label200");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.layout122);
    obj.label201:setText("7");
    obj.label201.grid.role = "col";
    obj.label201.grid.width = 6;
    obj.label201.grid["min-height"] = 15;
    obj.label201:setHorzTextAlign("center");
    obj.label201:setName("label201");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layout119);
    obj.layout123.grid.role = "col";
    obj.layout123:setHeight(15);
    obj.layout123.grid.width = 1;
    obj.layout123:setName("layout123");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.layout123);
    obj.label202:setText("8");
    obj.label202.grid.role = "col";
    obj.label202.grid.width = 6;
    obj.label202.grid["min-height"] = 15;
    obj.label202:setHorzTextAlign("center");
    obj.label202:setName("label202");

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.layout123);
    obj.label203:setText("9");
    obj.label203.grid.role = "col";
    obj.label203.grid.width = 6;
    obj.label203.grid["min-height"] = 15;
    obj.label203:setHorzTextAlign("center");
    obj.label203:setName("label203");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layout119);
    obj.layout124.grid.role = "col";
    obj.layout124:setHeight(15);
    obj.layout124.grid.width = 1;
    obj.layout124:setName("layout124");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.layout124);
    obj.label204:setText("10");
    obj.label204.grid.role = "col";
    obj.label204.grid.width = 6;
    obj.label204.grid["min-height"] = 15;
    obj.label204:setHorzTextAlign("center");
    obj.label204:setName("label204");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.layout124);
    obj.label205:setText("11");
    obj.label205.grid.role = "col";
    obj.label205.grid.width = 6;
    obj.label205.grid["min-height"] = 15;
    obj.label205:setHorzTextAlign("center");
    obj.label205:setName("label205");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout119);
    obj.layout125.grid.role = "col";
    obj.layout125:setHeight(15);
    obj.layout125.grid.width = 1;
    obj.layout125:setName("layout125");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.layout125);
    obj.label206:setText("12");
    obj.label206.grid.role = "col";
    obj.label206.grid.width = 6;
    obj.label206.grid["min-height"] = 15;
    obj.label206:setHorzTextAlign("center");
    obj.label206:setName("label206");

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.layout125);
    obj.label207:setText("13");
    obj.label207.grid.role = "col";
    obj.label207.grid.width = 6;
    obj.label207.grid["min-height"] = 15;
    obj.label207:setHorzTextAlign("center");
    obj.label207:setName("label207");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.layout119);
    obj.layout126.grid.role = "col";
    obj.layout126:setHeight(15);
    obj.layout126.grid.width = 1;
    obj.layout126:setName("layout126");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.layout126);
    obj.label208:setText("14");
    obj.label208.grid.role = "col";
    obj.label208.grid.width = 6;
    obj.label208.grid["min-height"] = 15;
    obj.label208:setHorzTextAlign("center");
    obj.label208:setName("label208");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.layout126);
    obj.label209:setText("15");
    obj.label209.grid.role = "col";
    obj.label209.grid.width = 6;
    obj.label209.grid["min-height"] = 15;
    obj.label209:setHorzTextAlign("center");
    obj.label209:setName("label209");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.layout119);
    obj.layout127.grid.role = "col";
    obj.layout127:setHeight(15);
    obj.layout127.grid.width = 1;
    obj.layout127:setName("layout127");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.layout127);
    obj.label210:setText("16");
    obj.label210.grid.role = "col";
    obj.label210.grid.width = 6;
    obj.label210.grid["min-height"] = 15;
    obj.label210:setHorzTextAlign("center");
    obj.label210:setName("label210");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.layout127);
    obj.label211:setText("17");
    obj.label211.grid.role = "col";
    obj.label211.grid.width = 6;
    obj.label211.grid["min-height"] = 15;
    obj.label211:setHorzTextAlign("center");
    obj.label211:setName("label211");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout119);
    obj.layout128.grid.role = "col";
    obj.layout128:setHeight(15);
    obj.layout128.grid.width = 1;
    obj.layout128:setName("layout128");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.layout128);
    obj.label212:setText("18");
    obj.label212.grid.role = "col";
    obj.label212.grid.width = 6;
    obj.label212.grid["min-height"] = 15;
    obj.label212:setHorzTextAlign("center");
    obj.label212:setName("label212");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.layout128);
    obj.label213:setText("19");
    obj.label213.grid.role = "col";
    obj.label213.grid.width = 6;
    obj.label213.grid["min-height"] = 15;
    obj.label213:setHorzTextAlign("center");
    obj.label213:setName("label213");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout119);
    obj.layout129.grid.role = "col";
    obj.layout129:setHeight(15);
    obj.layout129.grid.width = 1;
    obj.layout129:setName("layout129");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.layout129);
    obj.label214:setText("20");
    obj.label214.grid.role = "col";
    obj.label214.grid.width = 6;
    obj.label214.grid["min-height"] = 15;
    obj.label214:setHorzTextAlign("center");
    obj.label214:setName("label214");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.layout129);
    obj.label215:setText("20+");
    obj.label215.grid.role = "col";
    obj.label215.grid.width = 6;
    obj.label215.grid["min-height"] = 15;
    obj.label215:setHorzTextAlign("center");
    obj.label215:setName("label215");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.layout119);
    obj.label216:setText("Total");
    obj.label216.grid.role = "col";
    obj.label216.grid.width = 1;
    obj.label216.grid["min-height"] = 15;
    obj.label216:setHorzTextAlign("center");
    obj.label216:setName("label216");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.layout119);
    obj.label217:setText("");
    obj.label217.grid.role = "col";
    obj.label217.grid.width = 1;
    obj.label217.grid["min-height"] = 15;
    obj.label217:setHorzTextAlign("center");
    obj.label217:setName("label217");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout119);
    obj.layout130.grid.role = "col";
    obj.layout130:setHeight(30);
    obj.layout130.grid.width = 1;
    obj.layout130:setName("layout130");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout130);
    obj.edit219.grid.role = "col";
    obj.edit219.grid.width = 6;
    obj.edit219.grid["min-height"] = 30;
    obj.edit219:setHorzTextAlign("center");
    obj.edit219:setField("intNivel1");
    obj.edit219:setType("number");
    obj.edit219:setName("edit219");

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout130);
    obj.edit220.grid.role = "col";
    obj.edit220.grid.width = 6;
    obj.edit220.grid["min-height"] = 30;
    obj.edit220:setHorzTextAlign("center");
    obj.edit220:setField("intNivel2");
    obj.edit220:setType("number");
    obj.edit220:setName("edit220");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout119);
    obj.layout131.grid.role = "col";
    obj.layout131:setHeight(30);
    obj.layout131.grid.width = 1;
    obj.layout131:setName("layout131");

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout131);
    obj.edit221.grid.role = "col";
    obj.edit221.grid.width = 6;
    obj.edit221.grid["min-height"] = 30;
    obj.edit221:setHorzTextAlign("center");
    obj.edit221:setField("intNivel3");
    obj.edit221:setType("number");
    obj.edit221:setName("edit221");

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout131);
    obj.edit222.grid.role = "col";
    obj.edit222.grid.width = 6;
    obj.edit222.grid["min-height"] = 30;
    obj.edit222:setHorzTextAlign("center");
    obj.edit222:setField("intNivel4");
    obj.edit222:setType("number");
    obj.edit222:setName("edit222");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout119);
    obj.layout132.grid.role = "col";
    obj.layout132:setHeight(30);
    obj.layout132.grid.width = 1;
    obj.layout132:setName("layout132");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout132);
    obj.edit223.grid.role = "col";
    obj.edit223.grid.width = 6;
    obj.edit223.grid["min-height"] = 30;
    obj.edit223:setHorzTextAlign("center");
    obj.edit223:setField("intNivel5");
    obj.edit223:setType("number");
    obj.edit223:setName("edit223");

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout132);
    obj.edit224.grid.role = "col";
    obj.edit224.grid.width = 6;
    obj.edit224.grid["min-height"] = 30;
    obj.edit224:setHorzTextAlign("center");
    obj.edit224:setField("intNivel6");
    obj.edit224:setType("number");
    obj.edit224:setName("edit224");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.layout119);
    obj.layout133.grid.role = "col";
    obj.layout133:setHeight(30);
    obj.layout133.grid.width = 1;
    obj.layout133:setName("layout133");

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout133);
    obj.edit225.grid.role = "col";
    obj.edit225.grid.width = 6;
    obj.edit225.grid["min-height"] = 30;
    obj.edit225:setHorzTextAlign("center");
    obj.edit225:setField("intNivel7");
    obj.edit225:setType("number");
    obj.edit225:setName("edit225");

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout133);
    obj.edit226.grid.role = "col";
    obj.edit226.grid.width = 6;
    obj.edit226.grid["min-height"] = 30;
    obj.edit226:setHorzTextAlign("center");
    obj.edit226:setField("intNivel8");
    obj.edit226:setType("number");
    obj.edit226:setName("edit226");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout119);
    obj.layout134.grid.role = "col";
    obj.layout134:setHeight(30);
    obj.layout134.grid.width = 1;
    obj.layout134:setName("layout134");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout134);
    obj.edit227.grid.role = "col";
    obj.edit227.grid.width = 6;
    obj.edit227.grid["min-height"] = 30;
    obj.edit227:setHorzTextAlign("center");
    obj.edit227:setField("intNivel9");
    obj.edit227:setType("number");
    obj.edit227:setName("edit227");

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout134);
    obj.edit228.grid.role = "col";
    obj.edit228.grid.width = 6;
    obj.edit228.grid["min-height"] = 30;
    obj.edit228:setHorzTextAlign("center");
    obj.edit228:setField("intNivel10");
    obj.edit228:setType("number");
    obj.edit228:setName("edit228");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout119);
    obj.layout135.grid.role = "col";
    obj.layout135:setHeight(30);
    obj.layout135.grid.width = 1;
    obj.layout135:setName("layout135");

    obj.edit229 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout135);
    obj.edit229.grid.role = "col";
    obj.edit229.grid.width = 6;
    obj.edit229.grid["min-height"] = 30;
    obj.edit229:setHorzTextAlign("center");
    obj.edit229:setField("intNivel11");
    obj.edit229:setType("number");
    obj.edit229:setName("edit229");

    obj.edit230 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout135);
    obj.edit230.grid.role = "col";
    obj.edit230.grid.width = 6;
    obj.edit230.grid["min-height"] = 30;
    obj.edit230:setHorzTextAlign("center");
    obj.edit230:setField("intNivel12");
    obj.edit230:setType("number");
    obj.edit230:setName("edit230");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout119);
    obj.layout136.grid.role = "col";
    obj.layout136:setHeight(30);
    obj.layout136.grid.width = 1;
    obj.layout136:setName("layout136");

    obj.edit231 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout136);
    obj.edit231.grid.role = "col";
    obj.edit231.grid.width = 6;
    obj.edit231.grid["min-height"] = 30;
    obj.edit231:setHorzTextAlign("center");
    obj.edit231:setField("intNivel13");
    obj.edit231:setType("number");
    obj.edit231:setName("edit231");

    obj.edit232 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout136);
    obj.edit232.grid.role = "col";
    obj.edit232.grid.width = 6;
    obj.edit232.grid["min-height"] = 30;
    obj.edit232:setHorzTextAlign("center");
    obj.edit232:setField("intNivel14");
    obj.edit232:setType("number");
    obj.edit232:setName("edit232");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout119);
    obj.layout137.grid.role = "col";
    obj.layout137:setHeight(30);
    obj.layout137.grid.width = 1;
    obj.layout137:setName("layout137");

    obj.edit233 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout137);
    obj.edit233.grid.role = "col";
    obj.edit233.grid.width = 6;
    obj.edit233.grid["min-height"] = 30;
    obj.edit233:setHorzTextAlign("center");
    obj.edit233:setField("intNivel15");
    obj.edit233:setType("number");
    obj.edit233:setName("edit233");

    obj.edit234 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout137);
    obj.edit234.grid.role = "col";
    obj.edit234.grid.width = 6;
    obj.edit234.grid["min-height"] = 30;
    obj.edit234:setHorzTextAlign("center");
    obj.edit234:setField("intNivel16");
    obj.edit234:setType("number");
    obj.edit234:setName("edit234");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout119);
    obj.layout138.grid.role = "col";
    obj.layout138:setHeight(30);
    obj.layout138.grid.width = 1;
    obj.layout138:setName("layout138");

    obj.edit235 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout138);
    obj.edit235.grid.role = "col";
    obj.edit235.grid.width = 6;
    obj.edit235.grid["min-height"] = 30;
    obj.edit235:setHorzTextAlign("center");
    obj.edit235:setField("intNivel17");
    obj.edit235:setType("number");
    obj.edit235:setName("edit235");

    obj.edit236 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout138);
    obj.edit236.grid.role = "col";
    obj.edit236.grid.width = 6;
    obj.edit236.grid["min-height"] = 30;
    obj.edit236:setHorzTextAlign("center");
    obj.edit236:setField("intNivel18");
    obj.edit236:setType("number");
    obj.edit236:setName("edit236");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout119);
    obj.layout139.grid.role = "col";
    obj.layout139:setHeight(30);
    obj.layout139.grid.width = 1;
    obj.layout139:setName("layout139");

    obj.edit237 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout139);
    obj.edit237.grid.role = "col";
    obj.edit237.grid.width = 6;
    obj.edit237.grid["min-height"] = 30;
    obj.edit237:setHorzTextAlign("center");
    obj.edit237:setField("intNivel19");
    obj.edit237:setType("number");
    obj.edit237:setName("edit237");

    obj.edit238 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout139);
    obj.edit238.grid.role = "col";
    obj.edit238.grid.width = 6;
    obj.edit238.grid["min-height"] = 30;
    obj.edit238:setHorzTextAlign("center");
    obj.edit238:setField("intNivel20");
    obj.edit238:setType("number");
    obj.edit238:setName("edit238");

    obj.edit239 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout119);
    obj.edit239:setField("intNivelTotal");
    obj.edit239.grid.role = "col";
    obj.edit239.grid.width = 1;
    obj.edit239.grid["min-height"] = 15;
    obj.edit239:setHorzTextAlign("center");
    obj.edit239:setReadOnly(true);
    obj.edit239:setCanFocus(false);
    obj.edit239:setCursor("default");
    obj.edit239:setName("edit239");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.scrollBox3);
    obj.dataLink34:setFields({'intNivel1','intNivel2','intNivel3','intNivel4','intNivel5',
            'intNivel6','intNivel7','intNivel8','intNivel9','intNivel10',
            'intNivel11','intNivel12','intNivel13','intNivel14','intNivel15',
            'intNivel16','intNivel17','intNivel18','intNivel19','intNivel20',});
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.scrollBox3);
    obj.dataLink35:setField("intNivelTotal");
    obj.dataLink35:setName("dataLink35");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.scrollBox3);
    obj.layout140.grid.role = "row";
    obj.layout140:setName("layout140");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.layout140);
    obj.label218:setText("Sabedoria");
    obj.label218.grid.role = "col";
    obj.label218.grid.width = 1;
    obj.label218.grid["min-height"] = 20;
    obj.label218:setHorzTextAlign("center");
    obj.label218:setName("label218");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.layout140);
    obj.layout141.grid.role = "col";
    obj.layout141:setHeight(15);
    obj.layout141.grid.width = 1;
    obj.layout141:setName("layout141");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.layout141);
    obj.label219:setText("2");
    obj.label219.grid.role = "col";
    obj.label219.grid.width = 6;
    obj.label219.grid["min-height"] = 15;
    obj.label219:setHorzTextAlign("center");
    obj.label219:setName("label219");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.layout141);
    obj.label220:setText("3");
    obj.label220.grid.role = "col";
    obj.label220.grid.width = 6;
    obj.label220.grid["min-height"] = 15;
    obj.label220:setHorzTextAlign("center");
    obj.label220:setName("label220");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout140);
    obj.layout142.grid.role = "col";
    obj.layout142:setHeight(15);
    obj.layout142.grid.width = 1;
    obj.layout142:setName("layout142");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.layout142);
    obj.label221:setText("4");
    obj.label221.grid.role = "col";
    obj.label221.grid.width = 6;
    obj.label221.grid["min-height"] = 15;
    obj.label221:setHorzTextAlign("center");
    obj.label221:setName("label221");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.layout142);
    obj.label222:setText("5");
    obj.label222.grid.role = "col";
    obj.label222.grid.width = 6;
    obj.label222.grid["min-height"] = 15;
    obj.label222:setHorzTextAlign("center");
    obj.label222:setName("label222");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout140);
    obj.layout143.grid.role = "col";
    obj.layout143:setHeight(15);
    obj.layout143.grid.width = 1;
    obj.layout143:setName("layout143");

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.layout143);
    obj.label223:setText("6");
    obj.label223.grid.role = "col";
    obj.label223.grid.width = 6;
    obj.label223.grid["min-height"] = 15;
    obj.label223:setHorzTextAlign("center");
    obj.label223:setName("label223");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.layout143);
    obj.label224:setText("7");
    obj.label224.grid.role = "col";
    obj.label224.grid.width = 6;
    obj.label224.grid["min-height"] = 15;
    obj.label224:setHorzTextAlign("center");
    obj.label224:setName("label224");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.layout140);
    obj.layout144.grid.role = "col";
    obj.layout144:setHeight(15);
    obj.layout144.grid.width = 1;
    obj.layout144:setName("layout144");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.layout144);
    obj.label225:setText("8");
    obj.label225.grid.role = "col";
    obj.label225.grid.width = 6;
    obj.label225.grid["min-height"] = 15;
    obj.label225:setHorzTextAlign("center");
    obj.label225:setName("label225");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.layout144);
    obj.label226:setText("9");
    obj.label226.grid.role = "col";
    obj.label226.grid.width = 6;
    obj.label226.grid["min-height"] = 15;
    obj.label226:setHorzTextAlign("center");
    obj.label226:setName("label226");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout140);
    obj.layout145.grid.role = "col";
    obj.layout145:setHeight(15);
    obj.layout145.grid.width = 1;
    obj.layout145:setName("layout145");

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.layout145);
    obj.label227:setText("10");
    obj.label227.grid.role = "col";
    obj.label227.grid.width = 6;
    obj.label227.grid["min-height"] = 15;
    obj.label227:setHorzTextAlign("center");
    obj.label227:setName("label227");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.layout145);
    obj.label228:setText("11");
    obj.label228.grid.role = "col";
    obj.label228.grid.width = 6;
    obj.label228.grid["min-height"] = 15;
    obj.label228:setHorzTextAlign("center");
    obj.label228:setName("label228");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout140);
    obj.layout146.grid.role = "col";
    obj.layout146:setHeight(15);
    obj.layout146.grid.width = 1;
    obj.layout146:setName("layout146");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.layout146);
    obj.label229:setText("12");
    obj.label229.grid.role = "col";
    obj.label229.grid.width = 6;
    obj.label229.grid["min-height"] = 15;
    obj.label229:setHorzTextAlign("center");
    obj.label229:setName("label229");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.layout146);
    obj.label230:setText("13");
    obj.label230.grid.role = "col";
    obj.label230.grid.width = 6;
    obj.label230.grid["min-height"] = 15;
    obj.label230:setHorzTextAlign("center");
    obj.label230:setName("label230");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout140);
    obj.layout147.grid.role = "col";
    obj.layout147:setHeight(15);
    obj.layout147.grid.width = 1;
    obj.layout147:setName("layout147");

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.layout147);
    obj.label231:setText("14");
    obj.label231.grid.role = "col";
    obj.label231.grid.width = 6;
    obj.label231.grid["min-height"] = 15;
    obj.label231:setHorzTextAlign("center");
    obj.label231:setName("label231");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.layout147);
    obj.label232:setText("15");
    obj.label232.grid.role = "col";
    obj.label232.grid.width = 6;
    obj.label232.grid["min-height"] = 15;
    obj.label232:setHorzTextAlign("center");
    obj.label232:setName("label232");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.layout140);
    obj.layout148.grid.role = "col";
    obj.layout148:setHeight(15);
    obj.layout148.grid.width = 1;
    obj.layout148:setName("layout148");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.layout148);
    obj.label233:setText("16");
    obj.label233.grid.role = "col";
    obj.label233.grid.width = 6;
    obj.label233.grid["min-height"] = 15;
    obj.label233:setHorzTextAlign("center");
    obj.label233:setName("label233");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.layout148);
    obj.label234:setText("17");
    obj.label234.grid.role = "col";
    obj.label234.grid.width = 6;
    obj.label234.grid["min-height"] = 15;
    obj.label234:setHorzTextAlign("center");
    obj.label234:setName("label234");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.layout140);
    obj.layout149.grid.role = "col";
    obj.layout149:setHeight(15);
    obj.layout149.grid.width = 1;
    obj.layout149:setName("layout149");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.layout149);
    obj.label235:setText("18");
    obj.label235.grid.role = "col";
    obj.label235.grid.width = 6;
    obj.label235.grid["min-height"] = 15;
    obj.label235:setHorzTextAlign("center");
    obj.label235:setName("label235");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.layout149);
    obj.label236:setText("19");
    obj.label236.grid.role = "col";
    obj.label236.grid.width = 6;
    obj.label236.grid["min-height"] = 15;
    obj.label236:setHorzTextAlign("center");
    obj.label236:setName("label236");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.layout140);
    obj.layout150.grid.role = "col";
    obj.layout150:setHeight(15);
    obj.layout150.grid.width = 1;
    obj.layout150:setName("layout150");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.layout150);
    obj.label237:setText("20");
    obj.label237.grid.role = "col";
    obj.label237.grid.width = 6;
    obj.label237.grid["min-height"] = 15;
    obj.label237:setHorzTextAlign("center");
    obj.label237:setName("label237");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.layout150);
    obj.label238:setText("20+");
    obj.label238.grid.role = "col";
    obj.label238.grid.width = 6;
    obj.label238.grid["min-height"] = 15;
    obj.label238:setHorzTextAlign("center");
    obj.label238:setName("label238");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.layout140);
    obj.label239:setText("Total");
    obj.label239.grid.role = "col";
    obj.label239.grid.width = 1;
    obj.label239.grid["min-height"] = 15;
    obj.label239:setHorzTextAlign("center");
    obj.label239:setName("label239");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.layout140);
    obj.label240:setText("");
    obj.label240.grid.role = "col";
    obj.label240.grid.width = 1;
    obj.label240.grid["min-height"] = 15;
    obj.label240:setHorzTextAlign("center");
    obj.label240:setName("label240");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.layout140);
    obj.layout151.grid.role = "col";
    obj.layout151:setHeight(30);
    obj.layout151.grid.width = 1;
    obj.layout151:setName("layout151");

    obj.edit240 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout151);
    obj.edit240.grid.role = "col";
    obj.edit240.grid.width = 6;
    obj.edit240.grid["min-height"] = 30;
    obj.edit240:setHorzTextAlign("center");
    obj.edit240:setField("sabNivel1");
    obj.edit240:setType("number");
    obj.edit240:setName("edit240");

    obj.edit241 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout151);
    obj.edit241.grid.role = "col";
    obj.edit241.grid.width = 6;
    obj.edit241.grid["min-height"] = 30;
    obj.edit241:setHorzTextAlign("center");
    obj.edit241:setField("sabNivel2");
    obj.edit241:setType("number");
    obj.edit241:setName("edit241");

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout140);
    obj.layout152.grid.role = "col";
    obj.layout152:setHeight(30);
    obj.layout152.grid.width = 1;
    obj.layout152:setName("layout152");

    obj.edit242 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout152);
    obj.edit242.grid.role = "col";
    obj.edit242.grid.width = 6;
    obj.edit242.grid["min-height"] = 30;
    obj.edit242:setHorzTextAlign("center");
    obj.edit242:setField("sabNivel3");
    obj.edit242:setType("number");
    obj.edit242:setName("edit242");

    obj.edit243 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout152);
    obj.edit243.grid.role = "col";
    obj.edit243.grid.width = 6;
    obj.edit243.grid["min-height"] = 30;
    obj.edit243:setHorzTextAlign("center");
    obj.edit243:setField("sabNivel4");
    obj.edit243:setType("number");
    obj.edit243:setName("edit243");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.layout140);
    obj.layout153.grid.role = "col";
    obj.layout153:setHeight(30);
    obj.layout153.grid.width = 1;
    obj.layout153:setName("layout153");

    obj.edit244 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout153);
    obj.edit244.grid.role = "col";
    obj.edit244.grid.width = 6;
    obj.edit244.grid["min-height"] = 30;
    obj.edit244:setHorzTextAlign("center");
    obj.edit244:setField("sabNivel5");
    obj.edit244:setType("number");
    obj.edit244:setName("edit244");

    obj.edit245 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout153);
    obj.edit245.grid.role = "col";
    obj.edit245.grid.width = 6;
    obj.edit245.grid["min-height"] = 30;
    obj.edit245:setHorzTextAlign("center");
    obj.edit245:setField("sabNivel6");
    obj.edit245:setType("number");
    obj.edit245:setName("edit245");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout140);
    obj.layout154.grid.role = "col";
    obj.layout154:setHeight(30);
    obj.layout154.grid.width = 1;
    obj.layout154:setName("layout154");

    obj.edit246 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout154);
    obj.edit246.grid.role = "col";
    obj.edit246.grid.width = 6;
    obj.edit246.grid["min-height"] = 30;
    obj.edit246:setHorzTextAlign("center");
    obj.edit246:setField("sabNivel7");
    obj.edit246:setType("number");
    obj.edit246:setName("edit246");

    obj.edit247 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout154);
    obj.edit247.grid.role = "col";
    obj.edit247.grid.width = 6;
    obj.edit247.grid["min-height"] = 30;
    obj.edit247:setHorzTextAlign("center");
    obj.edit247:setField("sabNivel8");
    obj.edit247:setType("number");
    obj.edit247:setName("edit247");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.layout140);
    obj.layout155.grid.role = "col";
    obj.layout155:setHeight(30);
    obj.layout155.grid.width = 1;
    obj.layout155:setName("layout155");

    obj.edit248 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout155);
    obj.edit248.grid.role = "col";
    obj.edit248.grid.width = 6;
    obj.edit248.grid["min-height"] = 30;
    obj.edit248:setHorzTextAlign("center");
    obj.edit248:setField("sabNivel9");
    obj.edit248:setType("number");
    obj.edit248:setName("edit248");

    obj.edit249 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout155);
    obj.edit249.grid.role = "col";
    obj.edit249.grid.width = 6;
    obj.edit249.grid["min-height"] = 30;
    obj.edit249:setHorzTextAlign("center");
    obj.edit249:setField("sabNivel10");
    obj.edit249:setType("number");
    obj.edit249:setName("edit249");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.layout140);
    obj.layout156.grid.role = "col";
    obj.layout156:setHeight(30);
    obj.layout156.grid.width = 1;
    obj.layout156:setName("layout156");

    obj.edit250 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout156);
    obj.edit250.grid.role = "col";
    obj.edit250.grid.width = 6;
    obj.edit250.grid["min-height"] = 30;
    obj.edit250:setHorzTextAlign("center");
    obj.edit250:setField("sabNivel11");
    obj.edit250:setType("number");
    obj.edit250:setName("edit250");

    obj.edit251 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout156);
    obj.edit251.grid.role = "col";
    obj.edit251.grid.width = 6;
    obj.edit251.grid["min-height"] = 30;
    obj.edit251:setHorzTextAlign("center");
    obj.edit251:setField("sabNivel12");
    obj.edit251:setType("number");
    obj.edit251:setName("edit251");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.layout140);
    obj.layout157.grid.role = "col";
    obj.layout157:setHeight(30);
    obj.layout157.grid.width = 1;
    obj.layout157:setName("layout157");

    obj.edit252 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout157);
    obj.edit252.grid.role = "col";
    obj.edit252.grid.width = 6;
    obj.edit252.grid["min-height"] = 30;
    obj.edit252:setHorzTextAlign("center");
    obj.edit252:setField("sabNivel13");
    obj.edit252:setType("number");
    obj.edit252:setName("edit252");

    obj.edit253 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout157);
    obj.edit253.grid.role = "col";
    obj.edit253.grid.width = 6;
    obj.edit253.grid["min-height"] = 30;
    obj.edit253:setHorzTextAlign("center");
    obj.edit253:setField("sabNivel14");
    obj.edit253:setType("number");
    obj.edit253:setName("edit253");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.layout140);
    obj.layout158.grid.role = "col";
    obj.layout158:setHeight(30);
    obj.layout158.grid.width = 1;
    obj.layout158:setName("layout158");

    obj.edit254 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout158);
    obj.edit254.grid.role = "col";
    obj.edit254.grid.width = 6;
    obj.edit254.grid["min-height"] = 30;
    obj.edit254:setHorzTextAlign("center");
    obj.edit254:setField("sabNivel15");
    obj.edit254:setType("number");
    obj.edit254:setName("edit254");

    obj.edit255 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout158);
    obj.edit255.grid.role = "col";
    obj.edit255.grid.width = 6;
    obj.edit255.grid["min-height"] = 30;
    obj.edit255:setHorzTextAlign("center");
    obj.edit255:setField("sabNivel16");
    obj.edit255:setType("number");
    obj.edit255:setName("edit255");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout140);
    obj.layout159.grid.role = "col";
    obj.layout159:setHeight(30);
    obj.layout159.grid.width = 1;
    obj.layout159:setName("layout159");

    obj.edit256 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout159);
    obj.edit256.grid.role = "col";
    obj.edit256.grid.width = 6;
    obj.edit256.grid["min-height"] = 30;
    obj.edit256:setHorzTextAlign("center");
    obj.edit256:setField("sabNivel17");
    obj.edit256:setType("number");
    obj.edit256:setName("edit256");

    obj.edit257 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout159);
    obj.edit257.grid.role = "col";
    obj.edit257.grid.width = 6;
    obj.edit257.grid["min-height"] = 30;
    obj.edit257:setHorzTextAlign("center");
    obj.edit257:setField("sabNivel18");
    obj.edit257:setType("number");
    obj.edit257:setName("edit257");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.layout140);
    obj.layout160.grid.role = "col";
    obj.layout160:setHeight(30);
    obj.layout160.grid.width = 1;
    obj.layout160:setName("layout160");

    obj.edit258 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout160);
    obj.edit258.grid.role = "col";
    obj.edit258.grid.width = 6;
    obj.edit258.grid["min-height"] = 30;
    obj.edit258:setHorzTextAlign("center");
    obj.edit258:setField("sabNivel19");
    obj.edit258:setType("number");
    obj.edit258:setName("edit258");

    obj.edit259 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout160);
    obj.edit259.grid.role = "col";
    obj.edit259.grid.width = 6;
    obj.edit259.grid["min-height"] = 30;
    obj.edit259:setHorzTextAlign("center");
    obj.edit259:setField("sabNivel20");
    obj.edit259:setType("number");
    obj.edit259:setName("edit259");

    obj.edit260 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout140);
    obj.edit260:setField("sabNivelTotal");
    obj.edit260.grid.role = "col";
    obj.edit260.grid.width = 1;
    obj.edit260.grid["min-height"] = 15;
    obj.edit260:setHorzTextAlign("center");
    obj.edit260:setReadOnly(true);
    obj.edit260:setCanFocus(false);
    obj.edit260:setCursor("default");
    obj.edit260:setName("edit260");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.scrollBox3);
    obj.dataLink36:setFields({'sabNivel1','sabNivel2','sabNivel3','sabNivel4','sabNivel5',
            'sabNivel6','sabNivel7','sabNivel8','sabNivel9','sabNivel10',
            'sabNivel11','sabNivel12','sabNivel13','sabNivel14','sabNivel15',
            'sabNivel16','sabNivel17','sabNivel18','sabNivel19','sabNivel20',});
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.scrollBox3);
    obj.dataLink37:setField("sabNivelTotal");
    obj.dataLink37:setName("dataLink37");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.vida = tostring(sheet.vidaTotal);
        end);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.modcon = '+' .. tostring(math.floor(tonumber(sheet.conTotal)/10));
        end);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.modfor = '+' .. tostring(math.floor(tonumber(sheet.forTotal)/10));
        end);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.moddex = '+' .. tostring(math.floor(tonumber(sheet.dexTotal)/10));
        end);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.modcar = '+' .. tostring(math.floor(tonumber(sheet.carTotal)/10));
        end);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.modint = '+' .. tostring(math.floor(tonumber(sheet.intTotal)/10));
        end);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.modsab = '+' .. tostring(math.floor(tonumber(sheet.sabTotal)/10));
        end);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.modacerto = '+' .. tostring(math.floor(tonumber(sheet.acertoTotal)/10));
        end);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.modmira = '+' .. tostring(math.floor(tonumber(sheet.miraTotal)/10));
        end);

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.modbloqueio = '+' .. tostring(math.floor(tonumber(sheet.bloqueioTotal)/10));
        end);

    obj._e_event10 = obj.dataLink11:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.modesquiva = '+' .. tostring(math.floor(tonumber(sheet.esquivaTotal)/10));
        end);

    obj._e_event11 = obj.dataLink12:addEventListener("onChange",
        function (field, oldValue, newValue)
            local sab = tonumber(sheet.sabTotal or 0)
                                local nivel = tonumber(sheet.Nivel or 0)
                                local didatica = math.floor(sab/10) + math.floor(nivel/2)
            
                                if (didatica > 20) then
                                    sheet.Didatica = 20
                                else
                                    sheet.Didatica = didatica
                                end
        end);

    obj._e_event12 = obj.dataLink13:addEventListener("onChange",
        function (field, oldValue, newValue)
            local elfica = tonumber(sheet.Elfica or 0)
                            local draconica = tonumber(sheet.Draconica or 0)
            
                            if (elfica < draconica) then
                                sheet.Antiga = elfica
                            else
                                sheet.Antiga = draconica
                            end
        end);

    obj._e_event13 = obj.button1:addEventListener("onClick",
        function (event)
            self.rclEquipamentos:append();
        end);

    obj._e_event14 = obj.button2:addEventListener("onClick",
        function (event)
            atualizaAtributos()
        end);

    obj._e_event15 = obj.dataLink14:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.vidaCon = tonumber(sheet.conBase or 0)
                            sheet.vidaTotal = math.floor(
                                (tonumber(sheet.vidaCon) or 0 ) +
                                ((((tonumber(sheet.vidaMultiplicador) or 0)/100)) * sheet.vidaCon) +
                                (tonumber(sheet.vidaEquipamentos) or 0 ) + 
                                (tonumber(sheet.vidaExtra) or 0)
                            )
        end);

    obj._e_event16 = obj.dataLink15:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.conBase = (tonumber(sheet.conNivel) or 0) +
                            (tonumber(sheet.conClasse) or 0 ) +
                            (tonumber(sheet.conRaca) or 0) +
                            (tonumber(sheet.conTreino) or 0) +
                            (tonumber(sheet.conOutro) or 0);
            
                            sheet.conTotal = math.floor((tonumber(sheet.conBase) or 0) +
                            ((((tonumber(sheet.conMultiplicador) or 0)/100)) * sheet.conBase) +
                            (tonumber(sheet.conExtra) or 0 ) + 
                            (tonumber(sheet.conEquipamentos) or 0))
        end);

    obj._e_event17 = obj.dataLink16:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.forBase = (tonumber(sheet.forNivel) or 0) +
                            (tonumber(sheet.forClasse) or 0 ) +
                            (tonumber(sheet.forRaca) or 0) +
                            (tonumber(sheet.forTreino) or 0) +
                            (tonumber(sheet.forOutro) or 0);
            
                            sheet.forTotal = math.floor((tonumber(sheet.forBase) or 0) +
                            ((((tonumber(sheet.forMultiplicador) or 0)/100)) * sheet.forBase) +
                            (tonumber(sheet.forExtra) or 0 ) + 
                            (tonumber(sheet.forEquipamentos) or 0))
        end);

    obj._e_event18 = obj.dataLink17:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.dexBase = (tonumber(sheet.dexNivel) or 0) +
                            (tonumber(sheet.dexClasse) or 0 ) +
                            (tonumber(sheet.dexRaca) or 0) +
                            (tonumber(sheet.dexTreino) or 0) +
                            (tonumber(sheet.dexOutro) or 0);
            
                            sheet.dexTotal = math.floor((tonumber(sheet.dexBase) or 0) +
                            ((((tonumber(sheet.dexMultiplicador) or 0)/100)) * sheet.dexBase) +
                            (tonumber(sheet.dexExtra) or 0 ) + 
                            (tonumber(sheet.dexEquipamentos) or 0))
        end);

    obj._e_event19 = obj.dataLink18:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.carBase = (tonumber(sheet.carNivel) or 0) +
                            (tonumber(sheet.carClasse) or 0 ) +
                            (tonumber(sheet.carRaca) or 0) +
                            (tonumber(sheet.carTreino) or 0) +
                            (tonumber(sheet.carOutro) or 0);
            
                            sheet.carTotal = math.floor((tonumber(sheet.carBase) or 0) +
                            ((((tonumber(sheet.carMultiplicador) or 0)/100)) * sheet.carBase) +
                            (tonumber(sheet.carExtra) or 0 ) + 
                            (tonumber(sheet.carEquipamentos) or 0))
        end);

    obj._e_event20 = obj.dataLink19:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.intBase = (tonumber(sheet.intNivel) or 0) +
                            (tonumber(sheet.intClasse) or 0 ) +
                            (tonumber(sheet.intRaca) or 0) +
                            (tonumber(sheet.intTreino) or 0) +
                            (tonumber(sheet.intOutro) or 0);
            
                            sheet.intTotal = math.floor((tonumber(sheet.intBase) or 0) +
                            ((((tonumber(sheet.intMultiplicador) or 0)/100)) * sheet.intBase) +
                            (tonumber(sheet.intExtra) or 0 ) + 
                            (tonumber(sheet.intEquipamentos) or 0))
        end);

    obj._e_event21 = obj.dataLink20:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.sabBase = (tonumber(sheet.sabNivel) or 0) +
                            (tonumber(sheet.sabClasse) or 0 ) +
                            (tonumber(sheet.sabRaca) or 0) +
                            (tonumber(sheet.sabTreino) or 0) +
                            (tonumber(sheet.sabOutro) or 0);
            
                            sheet.sabTotal = math.floor((tonumber(sheet.sabBase) or 0) +
                            ((((tonumber(sheet.sabMultiplicador) or 0)/100)) * sheet.sabBase) +
                            (tonumber(sheet.sabExtra) or 0 ) + 
                            (tonumber(sheet.sabEquipamentos) or 0))
        end);

    obj._e_event22 = obj.dataLink21:addEventListener("onChange",
        function (field, oldValue, newValue)
            local modSab = math.floor((tonumber(sheet.sabTotal) or 0)/25) * 0.25
            
                        sheet.Sanidade = math.floor(((tonumber(sheet.Nivel) or 0) * 10) * (1 + modSab))
        end);

    obj._e_event23 = obj.dataLink22:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.acertoBase = (tonumber(sheet.acertoDestreza) or 0) + (tonumber(sheet.acertoClasse) or 0 );
            
                            sheet.acertoTotal = math.floor((tonumber(sheet.acertoBase) or 0) +
                            ((((tonumber(sheet.acertoMultiplicador) or 0)/100)) * sheet.acertoBase) +
                            (tonumber(sheet.acertoExtra) or 0 ) + 
                            (tonumber(sheet.acertoEquipamentos) or 0))
        end);

    obj._e_event24 = obj.dataLink23:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.miraBase = (tonumber(sheet.miraDestreza) or 0) + (tonumber(sheet.miraClasse) or 0 );
            
                            sheet.miraTotal = math.floor((tonumber(sheet.miraBase) or 0) +
                            ((((tonumber(sheet.miraMultiplicador) or 0)/100)) * sheet.miraBase) +
                            (tonumber(sheet.miraExtra) or 0 ) + 
                            (tonumber(sheet.miraEquipamentos) or 0))
        end);

    obj._e_event25 = obj.dataLink24:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.bloqueioBase = (tonumber(sheet.bloqueioDestreza) or 0) + (tonumber(sheet.bloqueioClasse) or 0 );
            
                            sheet.bloqueioTotal = math.floor((tonumber(sheet.bloqueioBase) or 0) +
                            ((((tonumber(sheet.bloqueioMultiplicador) or 0)/100)) * sheet.bloqueioBase) +
                            (tonumber(sheet.bloqueioExtra) or 0 ) + 
                            (tonumber(sheet.bloqueioEquipamentos) or 0))
        end);

    obj._e_event26 = obj.dataLink25:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.esquivaBase = (tonumber(sheet.esquivaDestreza) or 0) + (tonumber(sheet.esquivaClasse) or 0 );
            
                            sheet.esquivaTotal = math.floor((tonumber(sheet.esquivaBase) or 0) +
                            ((((tonumber(sheet.esquivaMultiplicador) or 0)/100)) * sheet.esquivaBase) +
                            (tonumber(sheet.esquivaExtra) or 0 ) + 
                            (tonumber(sheet.esquivaEquipamentos) or 0))
        end);

    obj._e_event27 = obj.dataLink26:addEventListener("onChange",
        function (field, oldValue, newValue)
            local total = 0
            
                            for i = 1, 20 do
                            local nivel = tonumber(sheet["conNivel" .. i]) or 0
                            total = total + nivel
                            end
            
                            sheet.conNivelTotal = total
        end);

    obj._e_event28 = obj.dataLink27:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.conNivel = sheet.conNivelTotal;
        end);

    obj._e_event29 = obj.dataLink28:addEventListener("onChange",
        function (field, oldValue, newValue)
            local total = 0
            
                            for i = 1, 20 do
                            local nivel = tonumber(sheet["forNivel" .. i]) or 0
                            total = total + nivel
                            end
            
                            sheet.forNivelTotal = total
        end);

    obj._e_event30 = obj.dataLink29:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.forNivel = sheet.forNivelTotal;
        end);

    obj._e_event31 = obj.dataLink30:addEventListener("onChange",
        function (field, oldValue, newValue)
            local total = 0
            
                            for i = 1, 20 do
                            local nivel = tonumber(sheet["dexNivel" .. i]) or 0
                            total = total + nivel
                            end
            
                            sheet.dexNivelTotal = total
        end);

    obj._e_event32 = obj.dataLink31:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.dexNivel = sheet.dexNivelTotal;
        end);

    obj._e_event33 = obj.dataLink32:addEventListener("onChange",
        function (field, oldValue, newValue)
            local total = 0
            
                            for i = 1, 20 do
                            local nivel = tonumber(sheet["carNivel" .. i]) or 0
                            total = total + nivel
                            end
            
                            sheet.carNivelTotal = total
        end);

    obj._e_event34 = obj.dataLink33:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.carNivel = sheet.carNivelTotal;
        end);

    obj._e_event35 = obj.dataLink34:addEventListener("onChange",
        function (field, oldValue, newValue)
            local total = 0
            
                            for i = 1, 20 do
                            local nivel = tonumber(sheet["intNivel" .. i]) or 0
                            total = total + nivel
                            end
            
                            sheet.intNivelTotal = total
        end);

    obj._e_event36 = obj.dataLink35:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.intNivel = sheet.intNivelTotal;
        end);

    obj._e_event37 = obj.dataLink36:addEventListener("onChange",
        function (field, oldValue, newValue)
            local total = 0
            
                            for i = 1, 20 do
                            local nivel = tonumber(sheet["sabNivel" .. i]) or 0
                            total = total + nivel
                            end
            
                            sheet.sabNivelTotal = total
        end);

    obj._e_event38 = obj.dataLink37:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.sabNivel = sheet.sabNivelTotal;
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
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

        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.rclEquipamentos ~= nil then self.rclEquipamentos:destroy(); self.rclEquipamentos = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
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
