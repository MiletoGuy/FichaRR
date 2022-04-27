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
    local sheet;

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
    obj:setTheme("dark");

    obj.pgcPrincipal = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.pgcPrincipal:setParent(obj);
    obj.pgcPrincipal:setAlign("client");
    obj.pgcPrincipal:setName("pgcPrincipal");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pgcPrincipal);
    obj.tab1:setTitle("Perfil e Atributos");
    obj.tab1:setName("tab1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.tab1);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.perfilLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.perfilLayout:setParent(obj.scrollBox1);
    obj.perfilLayout:setAlign("top");
    obj.perfilLayout:setHeight(500);
    obj.perfilLayout:setMargins({left=10, right=10, top=10});
    obj.perfilLayout:setAutoHeight(true);
    obj.perfilLayout:setHorzAlign("center");
    obj.perfilLayout:setLineSpacing(2);
    obj.perfilLayout:setName("perfilLayout");
    obj.perfilLayout:setMaxWidth(1600);
    obj.perfilLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.perfilLayout:setMinScaledWidth(300);

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.perfilLayout);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMinScaledWidth(290);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setStepSizes({310, 420, 640, 760, 1150});

    obj.tabelaPerfil = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tabelaPerfil:setParent(obj.flowLayout1);
    obj.tabelaPerfil:setMinWidth(320);
    obj.tabelaPerfil:setMaxWidth(1600);
    obj.tabelaPerfil:setName("tabelaPerfil");
    obj.tabelaPerfil:setAvoidScale(true);
    obj.tabelaPerfil:setAutoHeight(true);
    obj.tabelaPerfil:setVertAlign("trailing");
    obj.tabelaPerfil:setMaxControlsPerLine(2);
    obj.tabelaPerfil:setHorzAlign("center");

    obj.UpperGridCampo1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo1:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo1:setHeight(50);
    obj.UpperGridCampo1:setMinScaledWidth(100);
    obj.UpperGridCampo1:setMinWidth(100);
    obj.UpperGridCampo1:setMaxWidth(233);
    obj.UpperGridCampo1:setMaxScaledWidth(233);
    obj.UpperGridCampo1:setAvoidScale(true);
    obj.UpperGridCampo1:setName("UpperGridCampo1");

    obj.edtUpperGridCampo1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.edtUpperGridCampo1:setName("edtUpperGridCampo1");
    obj.edtUpperGridCampo1:setAlign("top");
    obj.edtUpperGridCampo1:setField("nome");
    obj.edtUpperGridCampo1:setFontSize(13);
    obj.edtUpperGridCampo1:setHeight(30);
    obj.edtUpperGridCampo1:setTransparent(true);
    obj.edtUpperGridCampo1:setVertTextAlign("trailing");
    obj.edtUpperGridCampo1:setWidth(195);

    obj.linUpperGridCampo1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.linUpperGridCampo1:setName("linUpperGridCampo1");
    obj.linUpperGridCampo1:setAlign("top");
    obj.linUpperGridCampo1:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo1:setStrokeSize(1);

    obj.labUpperGridCampo1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo1:setParent(obj.UpperGridCampo1);
    obj.labUpperGridCampo1:setName("labUpperGridCampo1");
    obj.labUpperGridCampo1:setAlign("top");
    obj.labUpperGridCampo1:setText("Nome");
    obj.labUpperGridCampo1:setVertTextAlign("leading");
    obj.labUpperGridCampo1:setWordWrap(true);
    obj.labUpperGridCampo1:setTextTrimming("none");
    obj.labUpperGridCampo1:setFontSize(12);
    obj.labUpperGridCampo1:setFontColor("#D0D0D0");

    self.UpperGridCampo1:setHeight(self.edtUpperGridCampo1:getHeight() + self.labUpperGridCampo1:getHeight() + self.linUpperGridCampo1:getHeight());


    obj.UpperGridCampo2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo2:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo2:setHeight(50);
    obj.UpperGridCampo2:setMinScaledWidth(100);
    obj.UpperGridCampo2:setMinWidth(100);
    obj.UpperGridCampo2:setMaxWidth(233);
    obj.UpperGridCampo2:setMaxScaledWidth(233);
    obj.UpperGridCampo2:setAvoidScale(true);
    obj.UpperGridCampo2:setName("UpperGridCampo2");

    obj.edtUpperGridCampo2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.edtUpperGridCampo2:setName("edtUpperGridCampo2");
    obj.edtUpperGridCampo2:setAlign("top");
    obj.edtUpperGridCampo2:setField("raca");
    obj.edtUpperGridCampo2:setFontSize(13);
    obj.edtUpperGridCampo2:setHeight(30);
    obj.edtUpperGridCampo2:setTransparent(true);
    obj.edtUpperGridCampo2:setVertTextAlign("trailing");
    obj.edtUpperGridCampo2:setWidth(195);

    obj.linUpperGridCampo2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.linUpperGridCampo2:setName("linUpperGridCampo2");
    obj.linUpperGridCampo2:setAlign("top");
    obj.linUpperGridCampo2:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo2:setStrokeSize(1);

    obj.labUpperGridCampo2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo2:setParent(obj.UpperGridCampo2);
    obj.labUpperGridCampo2:setName("labUpperGridCampo2");
    obj.labUpperGridCampo2:setAlign("top");
    obj.labUpperGridCampo2:setText("Raça");
    obj.labUpperGridCampo2:setVertTextAlign("leading");
    obj.labUpperGridCampo2:setWordWrap(true);
    obj.labUpperGridCampo2:setTextTrimming("none");
    obj.labUpperGridCampo2:setFontSize(12);
    obj.labUpperGridCampo2:setFontColor("#D0D0D0");

    self.UpperGridCampo2:setHeight(self.edtUpperGridCampo2:getHeight() + self.labUpperGridCampo2:getHeight() + self.linUpperGridCampo2:getHeight());


    obj.UpperGridCampo3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo3:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo3:setHeight(50);
    obj.UpperGridCampo3:setMinScaledWidth(100);
    obj.UpperGridCampo3:setMinWidth(100);
    obj.UpperGridCampo3:setMaxWidth(233);
    obj.UpperGridCampo3:setMaxScaledWidth(233);
    obj.UpperGridCampo3:setAvoidScale(true);
    obj.UpperGridCampo3:setName("UpperGridCampo3");

    obj.edtUpperGridCampo3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.edtUpperGridCampo3:setName("edtUpperGridCampo3");
    obj.edtUpperGridCampo3:setAlign("top");
    obj.edtUpperGridCampo3:setField("peso");
    obj.edtUpperGridCampo3:setFontSize(13);
    obj.edtUpperGridCampo3:setHeight(30);
    obj.edtUpperGridCampo3:setTransparent(true);
    obj.edtUpperGridCampo3:setVertTextAlign("trailing");
    obj.edtUpperGridCampo3:setWidth(195);

    obj.linUpperGridCampo3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.linUpperGridCampo3:setName("linUpperGridCampo3");
    obj.linUpperGridCampo3:setAlign("top");
    obj.linUpperGridCampo3:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo3:setStrokeSize(1);

    obj.labUpperGridCampo3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo3:setParent(obj.UpperGridCampo3);
    obj.labUpperGridCampo3:setName("labUpperGridCampo3");
    obj.labUpperGridCampo3:setAlign("top");
    obj.labUpperGridCampo3:setText("Peso");
    obj.labUpperGridCampo3:setVertTextAlign("leading");
    obj.labUpperGridCampo3:setWordWrap(true);
    obj.labUpperGridCampo3:setTextTrimming("none");
    obj.labUpperGridCampo3:setFontSize(12);
    obj.labUpperGridCampo3:setFontColor("#D0D0D0");

    self.UpperGridCampo3:setHeight(self.edtUpperGridCampo3:getHeight() + self.labUpperGridCampo3:getHeight() + self.linUpperGridCampo3:getHeight());


    obj.UpperGridCampo4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo4:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo4:setHeight(50);
    obj.UpperGridCampo4:setMinScaledWidth(100);
    obj.UpperGridCampo4:setMinWidth(100);
    obj.UpperGridCampo4:setMaxWidth(233);
    obj.UpperGridCampo4:setMaxScaledWidth(233);
    obj.UpperGridCampo4:setAvoidScale(true);
    obj.UpperGridCampo4:setName("UpperGridCampo4");

    obj.edtUpperGridCampo4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.edtUpperGridCampo4:setName("edtUpperGridCampo4");
    obj.edtUpperGridCampo4:setAlign("top");
    obj.edtUpperGridCampo4:setField("classe");
    obj.edtUpperGridCampo4:setFontSize(13);
    obj.edtUpperGridCampo4:setHeight(30);
    obj.edtUpperGridCampo4:setTransparent(true);
    obj.edtUpperGridCampo4:setVertTextAlign("trailing");
    obj.edtUpperGridCampo4:setWidth(195);

    obj.linUpperGridCampo4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.linUpperGridCampo4:setName("linUpperGridCampo4");
    obj.linUpperGridCampo4:setAlign("top");
    obj.linUpperGridCampo4:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo4:setStrokeSize(1);

    obj.labUpperGridCampo4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo4:setParent(obj.UpperGridCampo4);
    obj.labUpperGridCampo4:setName("labUpperGridCampo4");
    obj.labUpperGridCampo4:setAlign("top");
    obj.labUpperGridCampo4:setText("Classe");
    obj.labUpperGridCampo4:setVertTextAlign("leading");
    obj.labUpperGridCampo4:setWordWrap(true);
    obj.labUpperGridCampo4:setTextTrimming("none");
    obj.labUpperGridCampo4:setFontSize(12);
    obj.labUpperGridCampo4:setFontColor("#D0D0D0");

    self.UpperGridCampo4:setHeight(self.edtUpperGridCampo4:getHeight() + self.labUpperGridCampo4:getHeight() + self.linUpperGridCampo4:getHeight());


    obj.UpperGridCampo5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo5:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo5:setHeight(50);
    obj.UpperGridCampo5:setMinScaledWidth(100);
    obj.UpperGridCampo5:setMinWidth(100);
    obj.UpperGridCampo5:setMaxWidth(233);
    obj.UpperGridCampo5:setMaxScaledWidth(233);
    obj.UpperGridCampo5:setAvoidScale(true);
    obj.UpperGridCampo5:setName("UpperGridCampo5");

    obj.edtUpperGridCampo5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.edtUpperGridCampo5:setName("edtUpperGridCampo5");
    obj.edtUpperGridCampo5:setAlign("top");
    obj.edtUpperGridCampo5:setField("altura");
    obj.edtUpperGridCampo5:setFontSize(13);
    obj.edtUpperGridCampo5:setHeight(30);
    obj.edtUpperGridCampo5:setTransparent(true);
    obj.edtUpperGridCampo5:setVertTextAlign("trailing");
    obj.edtUpperGridCampo5:setWidth(195);

    obj.linUpperGridCampo5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.linUpperGridCampo5:setName("linUpperGridCampo5");
    obj.linUpperGridCampo5:setAlign("top");
    obj.linUpperGridCampo5:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo5:setStrokeSize(1);

    obj.labUpperGridCampo5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo5:setParent(obj.UpperGridCampo5);
    obj.labUpperGridCampo5:setName("labUpperGridCampo5");
    obj.labUpperGridCampo5:setAlign("top");
    obj.labUpperGridCampo5:setText("Altura");
    obj.labUpperGridCampo5:setVertTextAlign("leading");
    obj.labUpperGridCampo5:setWordWrap(true);
    obj.labUpperGridCampo5:setTextTrimming("none");
    obj.labUpperGridCampo5:setFontSize(12);
    obj.labUpperGridCampo5:setFontColor("#D0D0D0");

    self.UpperGridCampo5:setHeight(self.edtUpperGridCampo5:getHeight() + self.labUpperGridCampo5:getHeight() + self.linUpperGridCampo5:getHeight());


    obj.UpperGridCampo6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo6:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo6:setHeight(50);
    obj.UpperGridCampo6:setMinScaledWidth(100);
    obj.UpperGridCampo6:setMinWidth(100);
    obj.UpperGridCampo6:setMaxWidth(233);
    obj.UpperGridCampo6:setMaxScaledWidth(233);
    obj.UpperGridCampo6:setAvoidScale(true);
    obj.UpperGridCampo6:setName("UpperGridCampo6");

    obj.edtUpperGridCampo6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.edtUpperGridCampo6:setName("edtUpperGridCampo6");
    obj.edtUpperGridCampo6:setAlign("top");
    obj.edtUpperGridCampo6:setField("idade");
    obj.edtUpperGridCampo6:setFontSize(13);
    obj.edtUpperGridCampo6:setHeight(30);
    obj.edtUpperGridCampo6:setTransparent(true);
    obj.edtUpperGridCampo6:setVertTextAlign("trailing");
    obj.edtUpperGridCampo6:setWidth(195);

    obj.linUpperGridCampo6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.linUpperGridCampo6:setName("linUpperGridCampo6");
    obj.linUpperGridCampo6:setAlign("top");
    obj.linUpperGridCampo6:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo6:setStrokeSize(1);

    obj.labUpperGridCampo6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo6:setParent(obj.UpperGridCampo6);
    obj.labUpperGridCampo6:setName("labUpperGridCampo6");
    obj.labUpperGridCampo6:setAlign("top");
    obj.labUpperGridCampo6:setText("Idade");
    obj.labUpperGridCampo6:setVertTextAlign("leading");
    obj.labUpperGridCampo6:setWordWrap(true);
    obj.labUpperGridCampo6:setTextTrimming("none");
    obj.labUpperGridCampo6:setFontSize(12);
    obj.labUpperGridCampo6:setFontColor("#D0D0D0");

    self.UpperGridCampo6:setHeight(self.edtUpperGridCampo6:getHeight() + self.labUpperGridCampo6:getHeight() + self.linUpperGridCampo6:getHeight());


    obj.UpperGridCampo7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo7:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo7:setHeight(50);
    obj.UpperGridCampo7:setMinScaledWidth(100);
    obj.UpperGridCampo7:setMinWidth(100);
    obj.UpperGridCampo7:setMaxWidth(233);
    obj.UpperGridCampo7:setMaxScaledWidth(233);
    obj.UpperGridCampo7:setAvoidScale(true);
    obj.UpperGridCampo7:setName("UpperGridCampo7");

    obj.edtUpperGridCampo7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo7:setParent(obj.UpperGridCampo7);
    obj.edtUpperGridCampo7:setName("edtUpperGridCampo7");
    obj.edtUpperGridCampo7:setAlign("top");
    obj.edtUpperGridCampo7:setField("nivelClasse");
    obj.edtUpperGridCampo7:setFontSize(13);
    obj.edtUpperGridCampo7:setHeight(30);
    obj.edtUpperGridCampo7:setTransparent(true);
    obj.edtUpperGridCampo7:setVertTextAlign("trailing");
    obj.edtUpperGridCampo7:setWidth(195);

    obj.linUpperGridCampo7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo7:setParent(obj.UpperGridCampo7);
    obj.linUpperGridCampo7:setName("linUpperGridCampo7");
    obj.linUpperGridCampo7:setAlign("top");
    obj.linUpperGridCampo7:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo7:setStrokeSize(1);

    obj.labUpperGridCampo7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo7:setParent(obj.UpperGridCampo7);
    obj.labUpperGridCampo7:setName("labUpperGridCampo7");
    obj.labUpperGridCampo7:setAlign("top");
    obj.labUpperGridCampo7:setText("Nivel de Classe");
    obj.labUpperGridCampo7:setVertTextAlign("leading");
    obj.labUpperGridCampo7:setWordWrap(true);
    obj.labUpperGridCampo7:setTextTrimming("none");
    obj.labUpperGridCampo7:setFontSize(12);
    obj.labUpperGridCampo7:setFontColor("#D0D0D0");

    self.UpperGridCampo7:setHeight(self.edtUpperGridCampo7:getHeight() + self.labUpperGridCampo7:getHeight() + self.linUpperGridCampo7:getHeight());


    obj.UpperGridCampo8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo8:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo8:setHeight(50);
    obj.UpperGridCampo8:setMinScaledWidth(100);
    obj.UpperGridCampo8:setMinWidth(100);
    obj.UpperGridCampo8:setMaxWidth(233);
    obj.UpperGridCampo8:setMaxScaledWidth(233);
    obj.UpperGridCampo8:setAvoidScale(true);
    obj.UpperGridCampo8:setName("UpperGridCampo8");

    obj.edtUpperGridCampo8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo8:setParent(obj.UpperGridCampo8);
    obj.edtUpperGridCampo8:setName("edtUpperGridCampo8");
    obj.edtUpperGridCampo8:setAlign("top");
    obj.edtUpperGridCampo8:setField("sexo");
    obj.edtUpperGridCampo8:setFontSize(13);
    obj.edtUpperGridCampo8:setHeight(30);
    obj.edtUpperGridCampo8:setTransparent(true);
    obj.edtUpperGridCampo8:setVertTextAlign("trailing");
    obj.edtUpperGridCampo8:setWidth(195);

    obj.linUpperGridCampo8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo8:setParent(obj.UpperGridCampo8);
    obj.linUpperGridCampo8:setName("linUpperGridCampo8");
    obj.linUpperGridCampo8:setAlign("top");
    obj.linUpperGridCampo8:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo8:setStrokeSize(1);

    obj.labUpperGridCampo8 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo8:setParent(obj.UpperGridCampo8);
    obj.labUpperGridCampo8:setName("labUpperGridCampo8");
    obj.labUpperGridCampo8:setAlign("top");
    obj.labUpperGridCampo8:setText("Sexo");
    obj.labUpperGridCampo8:setVertTextAlign("leading");
    obj.labUpperGridCampo8:setWordWrap(true);
    obj.labUpperGridCampo8:setTextTrimming("none");
    obj.labUpperGridCampo8:setFontSize(12);
    obj.labUpperGridCampo8:setFontColor("#D0D0D0");

    self.UpperGridCampo8:setHeight(self.edtUpperGridCampo8:getHeight() + self.labUpperGridCampo8:getHeight() + self.linUpperGridCampo8:getHeight());


    obj.UpperGridCampo9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo9:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo9:setHeight(50);
    obj.UpperGridCampo9:setMinScaledWidth(100);
    obj.UpperGridCampo9:setMinWidth(100);
    obj.UpperGridCampo9:setMaxWidth(233);
    obj.UpperGridCampo9:setMaxScaledWidth(233);
    obj.UpperGridCampo9:setAvoidScale(true);
    obj.UpperGridCampo9:setName("UpperGridCampo9");

    obj.edtUpperGridCampo9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo9:setParent(obj.UpperGridCampo9);
    obj.edtUpperGridCampo9:setName("edtUpperGridCampo9");
    obj.edtUpperGridCampo9:setAlign("top");
    obj.edtUpperGridCampo9:setField("divelProf");
    obj.edtUpperGridCampo9:setFontSize(13);
    obj.edtUpperGridCampo9:setHeight(30);
    obj.edtUpperGridCampo9:setTransparent(true);
    obj.edtUpperGridCampo9:setVertTextAlign("trailing");
    obj.edtUpperGridCampo9:setWidth(195);

    obj.linUpperGridCampo9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo9:setParent(obj.UpperGridCampo9);
    obj.linUpperGridCampo9:setName("linUpperGridCampo9");
    obj.linUpperGridCampo9:setAlign("top");
    obj.linUpperGridCampo9:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo9:setStrokeSize(1);

    obj.labUpperGridCampo9 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo9:setParent(obj.UpperGridCampo9);
    obj.labUpperGridCampo9:setName("labUpperGridCampo9");
    obj.labUpperGridCampo9:setAlign("top");
    obj.labUpperGridCampo9:setText("Nivel de Profissão");
    obj.labUpperGridCampo9:setVertTextAlign("leading");
    obj.labUpperGridCampo9:setWordWrap(true);
    obj.labUpperGridCampo9:setTextTrimming("none");
    obj.labUpperGridCampo9:setFontSize(12);
    obj.labUpperGridCampo9:setFontColor("#D0D0D0");

    self.UpperGridCampo9:setHeight(self.edtUpperGridCampo9:getHeight() + self.labUpperGridCampo9:getHeight() + self.linUpperGridCampo9:getHeight());


    obj.UpperGridCampo10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo10:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo10:setHeight(50);
    obj.UpperGridCampo10:setMinScaledWidth(100);
    obj.UpperGridCampo10:setMinWidth(100);
    obj.UpperGridCampo10:setMaxWidth(233);
    obj.UpperGridCampo10:setMaxScaledWidth(233);
    obj.UpperGridCampo10:setAvoidScale(true);
    obj.UpperGridCampo10:setName("UpperGridCampo10");

    obj.edtUpperGridCampo10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo10:setParent(obj.UpperGridCampo10);
    obj.edtUpperGridCampo10:setName("edtUpperGridCampo10");
    obj.edtUpperGridCampo10:setAlign("top");
    obj.edtUpperGridCampo10:setField("nacionalidade");
    obj.edtUpperGridCampo10:setFontSize(13);
    obj.edtUpperGridCampo10:setHeight(30);
    obj.edtUpperGridCampo10:setTransparent(true);
    obj.edtUpperGridCampo10:setVertTextAlign("trailing");
    obj.edtUpperGridCampo10:setWidth(195);

    obj.linUpperGridCampo10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo10:setParent(obj.UpperGridCampo10);
    obj.linUpperGridCampo10:setName("linUpperGridCampo10");
    obj.linUpperGridCampo10:setAlign("top");
    obj.linUpperGridCampo10:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo10:setStrokeSize(1);

    obj.labUpperGridCampo10 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo10:setParent(obj.UpperGridCampo10);
    obj.labUpperGridCampo10:setName("labUpperGridCampo10");
    obj.labUpperGridCampo10:setAlign("top");
    obj.labUpperGridCampo10:setText("Nacionalidade");
    obj.labUpperGridCampo10:setVertTextAlign("leading");
    obj.labUpperGridCampo10:setWordWrap(true);
    obj.labUpperGridCampo10:setTextTrimming("none");
    obj.labUpperGridCampo10:setFontSize(12);
    obj.labUpperGridCampo10:setFontColor("#D0D0D0");

    self.UpperGridCampo10:setHeight(self.edtUpperGridCampo10:getHeight() + self.labUpperGridCampo10:getHeight() + self.linUpperGridCampo10:getHeight());


    obj.UpperGridCampo11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo11:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo11:setHeight(50);
    obj.UpperGridCampo11:setMinScaledWidth(100);
    obj.UpperGridCampo11:setMinWidth(100);
    obj.UpperGridCampo11:setMaxWidth(233);
    obj.UpperGridCampo11:setMaxScaledWidth(233);
    obj.UpperGridCampo11:setAvoidScale(true);
    obj.UpperGridCampo11:setName("UpperGridCampo11");

    obj.edtUpperGridCampo11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo11:setParent(obj.UpperGridCampo11);
    obj.edtUpperGridCampo11:setName("edtUpperGridCampo11");
    obj.edtUpperGridCampo11:setAlign("top");
    obj.edtUpperGridCampo11:setField("divindade");
    obj.edtUpperGridCampo11:setFontSize(13);
    obj.edtUpperGridCampo11:setHeight(30);
    obj.edtUpperGridCampo11:setTransparent(true);
    obj.edtUpperGridCampo11:setVertTextAlign("trailing");
    obj.edtUpperGridCampo11:setWidth(195);

    obj.linUpperGridCampo11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo11:setParent(obj.UpperGridCampo11);
    obj.linUpperGridCampo11:setName("linUpperGridCampo11");
    obj.linUpperGridCampo11:setAlign("top");
    obj.linUpperGridCampo11:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo11:setStrokeSize(1);

    obj.labUpperGridCampo11 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo11:setParent(obj.UpperGridCampo11);
    obj.labUpperGridCampo11:setName("labUpperGridCampo11");
    obj.labUpperGridCampo11:setAlign("top");
    obj.labUpperGridCampo11:setText("Divindade");
    obj.labUpperGridCampo11:setVertTextAlign("leading");
    obj.labUpperGridCampo11:setWordWrap(true);
    obj.labUpperGridCampo11:setTextTrimming("none");
    obj.labUpperGridCampo11:setFontSize(12);
    obj.labUpperGridCampo11:setFontColor("#D0D0D0");

    self.UpperGridCampo11:setHeight(self.edtUpperGridCampo11:getHeight() + self.labUpperGridCampo11:getHeight() + self.linUpperGridCampo11:getHeight());


    obj.UpperGridCampo12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.UpperGridCampo12:setParent(obj.tabelaPerfil);
    obj.UpperGridCampo12:setHeight(50);
    obj.UpperGridCampo12:setMinScaledWidth(100);
    obj.UpperGridCampo12:setMinWidth(100);
    obj.UpperGridCampo12:setMaxWidth(233);
    obj.UpperGridCampo12:setMaxScaledWidth(233);
    obj.UpperGridCampo12:setAvoidScale(true);
    obj.UpperGridCampo12:setName("UpperGridCampo12");

    obj.edtUpperGridCampo12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtUpperGridCampo12:setParent(obj.UpperGridCampo12);
    obj.edtUpperGridCampo12:setName("edtUpperGridCampo12");
    obj.edtUpperGridCampo12:setAlign("top");
    obj.edtUpperGridCampo12:setField("pDestino");
    obj.edtUpperGridCampo12:setFontSize(13);
    obj.edtUpperGridCampo12:setHeight(30);
    obj.edtUpperGridCampo12:setTransparent(true);
    obj.edtUpperGridCampo12:setVertTextAlign("trailing");
    obj.edtUpperGridCampo12:setWidth(195);

    obj.linUpperGridCampo12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linUpperGridCampo12:setParent(obj.UpperGridCampo12);
    obj.linUpperGridCampo12:setName("linUpperGridCampo12");
    obj.linUpperGridCampo12:setAlign("top");
    obj.linUpperGridCampo12:setStrokeColor("#FFFFFF50");
    obj.linUpperGridCampo12:setStrokeSize(1);

    obj.labUpperGridCampo12 = GUI.fromHandle(_obj_newObject("label"));
    obj.labUpperGridCampo12:setParent(obj.UpperGridCampo12);
    obj.labUpperGridCampo12:setName("labUpperGridCampo12");
    obj.labUpperGridCampo12:setAlign("top");
    obj.labUpperGridCampo12:setText("Pontos de Destino");
    obj.labUpperGridCampo12:setVertTextAlign("leading");
    obj.labUpperGridCampo12:setWordWrap(true);
    obj.labUpperGridCampo12:setTextTrimming("none");
    obj.labUpperGridCampo12:setFontSize(12);
    obj.labUpperGridCampo12:setFontColor("#D0D0D0");

    self.UpperGridCampo12:setHeight(self.edtUpperGridCampo12:getHeight() + self.labUpperGridCampo12:getHeight() + self.linUpperGridCampo12:getHeight());


    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.perfilLayout);
    obj.flowLineBreak1:setLineSpacing(10);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.perfilLayout);
    obj.flowPart1:setHeight(2);
    obj.flowPart1:setMinScaledWidth(100);
    obj.flowPart1:setMaxScaledWidth(1600);
    obj.flowPart1:setName("flowPart1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart1);
    obj.horzLine1:setStrokeColor("#FFFFFF50");
    obj.horzLine1:setStrokeSize(0.6);
    obj.horzLine1:setStrokeCap("round");
    obj.horzLine1:setScaleY(0.1);
    obj.horzLine1:setTop(1);
    obj.horzLine1:setName("horzLine1");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.perfilLayout);
    obj.flowLineBreak2:setLineSpacing(10);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.perfilLayout);
    obj.flowPart2:setWidth(140);
    obj.flowPart2:setName("flowPart2");

    obj.topoAtributos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.topoAtributos:setParent(obj.perfilLayout);
    obj.topoAtributos:setMinWidth(320);
    obj.topoAtributos:setMaxWidth(1600);
    obj.topoAtributos:setName("topoAtributos");
    obj.topoAtributos:setAvoidScale(true);
    obj.topoAtributos:setAutoHeight(true);
    obj.topoAtributos:setVertAlign("leading");
    obj.topoAtributos:setMaxControlsPerLine(9);
    obj.topoAtributos:setHorzAlign("center");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.topoAtributos);
    obj.flowPart3:setHeight(20);
    obj.flowPart3:setMinScaledWidth(60);
    obj.flowPart3:setMaxScaledWidth(85);
    obj.flowPart3:setName("flowPart3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart3);
    obj.label1:setText("Nível");
    obj.label1:setAlign("client");
    obj.label1:setField("");
    obj.label1:setFontSize(8);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setName("label1");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.topoAtributos);
    obj.flowPart4:setHeight(20);
    obj.flowPart4:setMinScaledWidth(60);
    obj.flowPart4:setMaxScaledWidth(85);
    obj.flowPart4:setName("flowPart4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart4);
    obj.label2:setText("Classe");
    obj.label2:setAlign("client");
    obj.label2:setField("");
    obj.label2:setFontSize(8);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setName("label2");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.topoAtributos);
    obj.flowPart5:setHeight(20);
    obj.flowPart5:setMinScaledWidth(60);
    obj.flowPart5:setMaxScaledWidth(85);
    obj.flowPart5:setName("flowPart5");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart5);
    obj.label3:setText("Raça");
    obj.label3:setAlign("client");
    obj.label3:setField("");
    obj.label3:setFontSize(8);
    obj.label3:setVertTextAlign("center");
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setName("label3");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.topoAtributos);
    obj.flowPart6:setHeight(20);
    obj.flowPart6:setMinScaledWidth(60);
    obj.flowPart6:setMaxScaledWidth(85);
    obj.flowPart6:setName("flowPart6");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart6);
    obj.label4:setText("Treino");
    obj.label4:setAlign("client");
    obj.label4:setField("");
    obj.label4:setFontSize(8);
    obj.label4:setVertTextAlign("center");
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setName("label4");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.topoAtributos);
    obj.flowPart7:setHeight(20);
    obj.flowPart7:setMinScaledWidth(60);
    obj.flowPart7:setMaxScaledWidth(85);
    obj.flowPart7:setName("flowPart7");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart7);
    obj.label5:setText("Outros");
    obj.label5:setAlign("client");
    obj.label5:setField("");
    obj.label5:setFontSize(8);
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setName("label5");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.topoAtributos);
    obj.flowPart8:setHeight(20);
    obj.flowPart8:setMinScaledWidth(60);
    obj.flowPart8:setMaxScaledWidth(85);
    obj.flowPart8:setName("flowPart8");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart8);
    obj.label6:setText("Base");
    obj.label6:setAlign("client");
    obj.label6:setField("");
    obj.label6:setFontSize(8);
    obj.label6:setVertTextAlign("center");
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setName("label6");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.topoAtributos);
    obj.flowPart9:setHeight(20);
    obj.flowPart9:setMinScaledWidth(60);
    obj.flowPart9:setMaxScaledWidth(85);
    obj.flowPart9:setName("flowPart9");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart9);
    obj.label7:setText("Equip.");
    obj.label7:setAlign("client");
    obj.label7:setField("");
    obj.label7:setFontSize(8);
    obj.label7:setVertTextAlign("center");
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setName("label7");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.topoAtributos);
    obj.flowPart10:setHeight(20);
    obj.flowPart10:setMinScaledWidth(60);
    obj.flowPart10:setMaxScaledWidth(85);
    obj.flowPart10:setName("flowPart10");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart10);
    obj.label8:setText("Total");
    obj.label8:setAlign("client");
    obj.label8:setField("");
    obj.label8:setFontSize(8);
    obj.label8:setVertTextAlign("center");
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setName("label8");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.perfilLayout);
    obj.flowLineBreak3:setLineSpacing(5);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.tabelaDeAtributos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tabelaDeAtributos:setParent(obj.perfilLayout);
    obj.tabelaDeAtributos:setMinWidth(320);
    obj.tabelaDeAtributos:setMaxWidth(1600);
    obj.tabelaDeAtributos:setName("tabelaDeAtributos");
    obj.tabelaDeAtributos:setAvoidScale(true);
    obj.tabelaDeAtributos:setAutoHeight(true);
    obj.tabelaDeAtributos:setVertAlign("leading");
    obj.tabelaDeAtributos:setMaxControlsPerLine(16);
    obj.tabelaDeAtributos:setHorzAlign("center");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.tabelaDeAtributos);
    obj.flowPart11:setHeight(20);
    obj.flowPart11:setMinScaledWidth(60);
    obj.flowPart11:setMaxScaledWidth(85);
    obj.flowPart11:setName("flowPart11");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart11);
    obj.label9:setText("Constituição");
    obj.label9:setAlign("client");
    obj.label9:setField("");
    obj.label9:setFontSize(8);
    obj.label9:setVertTextAlign("center");
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setName("label9");

    obj.GridCampoSolido1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido1:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido1:setHeight(50);
    obj.GridCampoSolido1:setMinScaledWidth(30);
    obj.GridCampoSolido1:setMinWidth(30);
    obj.GridCampoSolido1:setMaxWidth(35);
    obj.GridCampoSolido1:setMaxScaledWidth(35);
    obj.GridCampoSolido1:setAvoidScale(true);
    obj.GridCampoSolido1:setName("GridCampoSolido1");

    obj.edtGridCampoSolido1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.edtGridCampoSolido1:setName("edtGridCampoSolido1");
    obj.edtGridCampoSolido1:setAlign("top");
    obj.edtGridCampoSolido1:setField("conNivel");
    obj.edtGridCampoSolido1:setFontSize(15);
    obj.edtGridCampoSolido1:setTransparent(true);
    obj.edtGridCampoSolido1:setVertTextAlign("center");
    obj.edtGridCampoSolido1:setType("number");
    obj.edtGridCampoSolido1:setReadOnly(false);
    obj.edtGridCampoSolido1:setHeight(30);
    obj.edtGridCampoSolido1:setWidth(195);

    obj.linGridCampoSolido1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.linGridCampoSolido1:setName("linGridCampoSolido1");
    obj.linGridCampoSolido1:setAlign("top");
    obj.linGridCampoSolido1:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido1:setStrokeSize(1);

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.tabelaDeAtributos);
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setHeight(50);
    obj.flowPart12:setMinScaledWidth(30);
    obj.flowPart12:setMaxScaledWidth(50);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.flowPart12);
    obj.image1:setSRC("/imagens/plus.png");
    obj.image1:setHeight(15);
    obj.image1:setWidth(15);
    obj.image1:setLeft(15);
    obj.image1:setTop(5);
    obj.image1:setName("image1");

    obj.GridCampoSolido2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido2:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido2:setHeight(50);
    obj.GridCampoSolido2:setMinScaledWidth(30);
    obj.GridCampoSolido2:setMinWidth(30);
    obj.GridCampoSolido2:setMaxWidth(35);
    obj.GridCampoSolido2:setMaxScaledWidth(35);
    obj.GridCampoSolido2:setAvoidScale(true);
    obj.GridCampoSolido2:setName("GridCampoSolido2");

    obj.edtGridCampoSolido2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.edtGridCampoSolido2:setName("edtGridCampoSolido2");
    obj.edtGridCampoSolido2:setAlign("top");
    obj.edtGridCampoSolido2:setField("conClasse");
    obj.edtGridCampoSolido2:setFontSize(15);
    obj.edtGridCampoSolido2:setTransparent(true);
    obj.edtGridCampoSolido2:setVertTextAlign("center");
    obj.edtGridCampoSolido2:setType("number");
    obj.edtGridCampoSolido2:setReadOnly(true);
    obj.edtGridCampoSolido2:setHeight(30);
    obj.edtGridCampoSolido2:setWidth(195);

    obj.linGridCampoSolido2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.linGridCampoSolido2:setName("linGridCampoSolido2");
    obj.linGridCampoSolido2:setAlign("top");
    obj.linGridCampoSolido2:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido2:setStrokeSize(1);

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.tabelaDeAtributos);
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setHeight(50);
    obj.flowPart13:setMinScaledWidth(30);
    obj.flowPart13:setMaxScaledWidth(50);

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flowPart13);
    obj.image2:setSRC("/imagens/plus.png");
    obj.image2:setHeight(15);
    obj.image2:setWidth(15);
    obj.image2:setLeft(15);
    obj.image2:setTop(5);
    obj.image2:setName("image2");

    obj.GridCampoSolido3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido3:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido3:setHeight(50);
    obj.GridCampoSolido3:setMinScaledWidth(30);
    obj.GridCampoSolido3:setMinWidth(30);
    obj.GridCampoSolido3:setMaxWidth(35);
    obj.GridCampoSolido3:setMaxScaledWidth(35);
    obj.GridCampoSolido3:setAvoidScale(true);
    obj.GridCampoSolido3:setName("GridCampoSolido3");

    obj.edtGridCampoSolido3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.edtGridCampoSolido3:setName("edtGridCampoSolido3");
    obj.edtGridCampoSolido3:setAlign("top");
    obj.edtGridCampoSolido3:setField("conRaca");
    obj.edtGridCampoSolido3:setFontSize(15);
    obj.edtGridCampoSolido3:setTransparent(true);
    obj.edtGridCampoSolido3:setVertTextAlign("center");
    obj.edtGridCampoSolido3:setType("number");
    obj.edtGridCampoSolido3:setReadOnly(true);
    obj.edtGridCampoSolido3:setHeight(30);
    obj.edtGridCampoSolido3:setWidth(195);

    obj.linGridCampoSolido3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.linGridCampoSolido3:setName("linGridCampoSolido3");
    obj.linGridCampoSolido3:setAlign("top");
    obj.linGridCampoSolido3:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido3:setStrokeSize(1);

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.tabelaDeAtributos);
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setHeight(50);
    obj.flowPart14:setMinScaledWidth(30);
    obj.flowPart14:setMaxScaledWidth(50);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.flowPart14);
    obj.image3:setSRC("/imagens/plus.png");
    obj.image3:setHeight(15);
    obj.image3:setWidth(15);
    obj.image3:setLeft(15);
    obj.image3:setTop(5);
    obj.image3:setName("image3");

    obj.GridCampoSolido4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido4:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido4:setHeight(50);
    obj.GridCampoSolido4:setMinScaledWidth(30);
    obj.GridCampoSolido4:setMinWidth(30);
    obj.GridCampoSolido4:setMaxWidth(35);
    obj.GridCampoSolido4:setMaxScaledWidth(35);
    obj.GridCampoSolido4:setAvoidScale(true);
    obj.GridCampoSolido4:setName("GridCampoSolido4");

    obj.edtGridCampoSolido4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.edtGridCampoSolido4:setName("edtGridCampoSolido4");
    obj.edtGridCampoSolido4:setAlign("top");
    obj.edtGridCampoSolido4:setField("conTreino");
    obj.edtGridCampoSolido4:setFontSize(15);
    obj.edtGridCampoSolido4:setTransparent(true);
    obj.edtGridCampoSolido4:setVertTextAlign("center");
    obj.edtGridCampoSolido4:setType("number");
    obj.edtGridCampoSolido4:setReadOnly(false);
    obj.edtGridCampoSolido4:setHeight(30);
    obj.edtGridCampoSolido4:setWidth(195);

    obj.linGridCampoSolido4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.linGridCampoSolido4:setName("linGridCampoSolido4");
    obj.linGridCampoSolido4:setAlign("top");
    obj.linGridCampoSolido4:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido4:setStrokeSize(1);

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.tabelaDeAtributos);
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setHeight(50);
    obj.flowPart15:setMinScaledWidth(30);
    obj.flowPart15:setMaxScaledWidth(50);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.flowPart15);
    obj.image4:setSRC("/imagens/plus.png");
    obj.image4:setHeight(15);
    obj.image4:setWidth(15);
    obj.image4:setLeft(15);
    obj.image4:setTop(5);
    obj.image4:setName("image4");

    obj.GridCampoSolido5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido5:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido5:setHeight(50);
    obj.GridCampoSolido5:setMinScaledWidth(30);
    obj.GridCampoSolido5:setMinWidth(30);
    obj.GridCampoSolido5:setMaxWidth(35);
    obj.GridCampoSolido5:setMaxScaledWidth(35);
    obj.GridCampoSolido5:setAvoidScale(true);
    obj.GridCampoSolido5:setName("GridCampoSolido5");

    obj.edtGridCampoSolido5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.edtGridCampoSolido5:setName("edtGridCampoSolido5");
    obj.edtGridCampoSolido5:setAlign("top");
    obj.edtGridCampoSolido5:setField("conOutros");
    obj.edtGridCampoSolido5:setFontSize(15);
    obj.edtGridCampoSolido5:setTransparent(true);
    obj.edtGridCampoSolido5:setVertTextAlign("center");
    obj.edtGridCampoSolido5:setType("number");
    obj.edtGridCampoSolido5:setReadOnly(false);
    obj.edtGridCampoSolido5:setHeight(30);
    obj.edtGridCampoSolido5:setWidth(195);

    obj.linGridCampoSolido5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.linGridCampoSolido5:setName("linGridCampoSolido5");
    obj.linGridCampoSolido5:setAlign("top");
    obj.linGridCampoSolido5:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido5:setStrokeSize(1);

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.tabelaDeAtributos);
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setHeight(50);
    obj.flowPart16:setMinScaledWidth(30);
    obj.flowPart16:setMaxScaledWidth(50);

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.flowPart16);
    obj.image5:setSRC("/imagens/equals.png");
    obj.image5:setHeight(15);
    obj.image5:setWidth(15);
    obj.image5:setLeft(15);
    obj.image5:setTop(5);
    obj.image5:setName("image5");

    obj.GridCampoSolido6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido6:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido6:setHeight(50);
    obj.GridCampoSolido6:setMinScaledWidth(30);
    obj.GridCampoSolido6:setMinWidth(30);
    obj.GridCampoSolido6:setMaxWidth(35);
    obj.GridCampoSolido6:setMaxScaledWidth(35);
    obj.GridCampoSolido6:setAvoidScale(true);
    obj.GridCampoSolido6:setName("GridCampoSolido6");

    obj.edtGridCampoSolido6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.edtGridCampoSolido6:setName("edtGridCampoSolido6");
    obj.edtGridCampoSolido6:setAlign("top");
    obj.edtGridCampoSolido6:setField("conBase");
    obj.edtGridCampoSolido6:setFontSize(15);
    obj.edtGridCampoSolido6:setTransparent(true);
    obj.edtGridCampoSolido6:setVertTextAlign("center");
    obj.edtGridCampoSolido6:setType("number");
    obj.edtGridCampoSolido6:setReadOnly(true);
    obj.edtGridCampoSolido6:setHeight(30);
    obj.edtGridCampoSolido6:setWidth(195);

    obj.linGridCampoSolido6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.linGridCampoSolido6:setName("linGridCampoSolido6");
    obj.linGridCampoSolido6:setAlign("top");
    obj.linGridCampoSolido6:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido6:setStrokeSize(1);

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.tabelaDeAtributos);
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setHeight(50);
    obj.flowPart17:setMinScaledWidth(30);
    obj.flowPart17:setMaxScaledWidth(50);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.flowPart17);
    obj.image6:setSRC("/imagens/plus.png");
    obj.image6:setHeight(15);
    obj.image6:setWidth(15);
    obj.image6:setLeft(15);
    obj.image6:setTop(5);
    obj.image6:setName("image6");

    obj.GridCampoSolido7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido7:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido7:setHeight(50);
    obj.GridCampoSolido7:setMinScaledWidth(30);
    obj.GridCampoSolido7:setMinWidth(30);
    obj.GridCampoSolido7:setMaxWidth(35);
    obj.GridCampoSolido7:setMaxScaledWidth(35);
    obj.GridCampoSolido7:setAvoidScale(true);
    obj.GridCampoSolido7:setName("GridCampoSolido7");

    obj.edtGridCampoSolido7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido7:setParent(obj.GridCampoSolido7);
    obj.edtGridCampoSolido7:setName("edtGridCampoSolido7");
    obj.edtGridCampoSolido7:setAlign("top");
    obj.edtGridCampoSolido7:setField("conEquip");
    obj.edtGridCampoSolido7:setFontSize(15);
    obj.edtGridCampoSolido7:setTransparent(true);
    obj.edtGridCampoSolido7:setVertTextAlign("center");
    obj.edtGridCampoSolido7:setType("number");
    obj.edtGridCampoSolido7:setReadOnly(false);
    obj.edtGridCampoSolido7:setHeight(30);
    obj.edtGridCampoSolido7:setWidth(195);

    obj.linGridCampoSolido7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido7:setParent(obj.GridCampoSolido7);
    obj.linGridCampoSolido7:setName("linGridCampoSolido7");
    obj.linGridCampoSolido7:setAlign("top");
    obj.linGridCampoSolido7:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido7:setStrokeSize(1);

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.tabelaDeAtributos);
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setHeight(50);
    obj.flowPart18:setMinScaledWidth(30);
    obj.flowPart18:setMaxScaledWidth(50);

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.flowPart18);
    obj.image7:setSRC("/imagens/equals.png");
    obj.image7:setHeight(15);
    obj.image7:setWidth(15);
    obj.image7:setLeft(15);
    obj.image7:setTop(5);
    obj.image7:setName("image7");

    obj.GridCampoSolido8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido8:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido8:setHeight(50);
    obj.GridCampoSolido8:setMinScaledWidth(30);
    obj.GridCampoSolido8:setMinWidth(30);
    obj.GridCampoSolido8:setMaxWidth(35);
    obj.GridCampoSolido8:setMaxScaledWidth(35);
    obj.GridCampoSolido8:setAvoidScale(true);
    obj.GridCampoSolido8:setName("GridCampoSolido8");

    obj.edtGridCampoSolido8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido8:setParent(obj.GridCampoSolido8);
    obj.edtGridCampoSolido8:setName("edtGridCampoSolido8");
    obj.edtGridCampoSolido8:setAlign("top");
    obj.edtGridCampoSolido8:setField("conTotal");
    obj.edtGridCampoSolido8:setFontSize(15);
    obj.edtGridCampoSolido8:setTransparent(true);
    obj.edtGridCampoSolido8:setVertTextAlign("center");
    obj.edtGridCampoSolido8:setType("number");
    obj.edtGridCampoSolido8:setReadOnly(true);
    obj.edtGridCampoSolido8:setHeight(30);
    obj.edtGridCampoSolido8:setWidth(195);

    obj.linGridCampoSolido8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido8:setParent(obj.GridCampoSolido8);
    obj.linGridCampoSolido8:setName("linGridCampoSolido8");
    obj.linGridCampoSolido8:setAlign("top");
    obj.linGridCampoSolido8:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido8:setStrokeSize(1);

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.tabelaDeAtributos);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setMinScaledWidth(60);
    obj.flowPart19:setMaxScaledWidth(85);
    obj.flowPart19:setName("flowPart19");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart19);
    obj.label10:setText("Força");
    obj.label10:setAlign("client");
    obj.label10:setField("");
    obj.label10:setFontSize(8);
    obj.label10:setVertTextAlign("center");
    obj.label10:setHorzTextAlign("leading");
    obj.label10:setName("label10");

    obj.GridCampoSolido9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido9:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido9:setHeight(50);
    obj.GridCampoSolido9:setMinScaledWidth(30);
    obj.GridCampoSolido9:setMinWidth(30);
    obj.GridCampoSolido9:setMaxWidth(35);
    obj.GridCampoSolido9:setMaxScaledWidth(35);
    obj.GridCampoSolido9:setAvoidScale(true);
    obj.GridCampoSolido9:setName("GridCampoSolido9");

    obj.edtGridCampoSolido9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido9:setParent(obj.GridCampoSolido9);
    obj.edtGridCampoSolido9:setName("edtGridCampoSolido9");
    obj.edtGridCampoSolido9:setAlign("top");
    obj.edtGridCampoSolido9:setField("forNivel");
    obj.edtGridCampoSolido9:setFontSize(15);
    obj.edtGridCampoSolido9:setTransparent(true);
    obj.edtGridCampoSolido9:setVertTextAlign("center");
    obj.edtGridCampoSolido9:setType("number");
    obj.edtGridCampoSolido9:setReadOnly(false);
    obj.edtGridCampoSolido9:setHeight(30);
    obj.edtGridCampoSolido9:setWidth(195);

    obj.linGridCampoSolido9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido9:setParent(obj.GridCampoSolido9);
    obj.linGridCampoSolido9:setName("linGridCampoSolido9");
    obj.linGridCampoSolido9:setAlign("top");
    obj.linGridCampoSolido9:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido9:setStrokeSize(1);

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.tabelaDeAtributos);
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setHeight(50);
    obj.flowPart20:setMinScaledWidth(30);
    obj.flowPart20:setMaxScaledWidth(50);

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.flowPart20);
    obj.image8:setSRC("/imagens/plus.png");
    obj.image8:setHeight(15);
    obj.image8:setWidth(15);
    obj.image8:setLeft(15);
    obj.image8:setTop(5);
    obj.image8:setName("image8");

    obj.GridCampoSolido10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido10:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido10:setHeight(50);
    obj.GridCampoSolido10:setMinScaledWidth(30);
    obj.GridCampoSolido10:setMinWidth(30);
    obj.GridCampoSolido10:setMaxWidth(35);
    obj.GridCampoSolido10:setMaxScaledWidth(35);
    obj.GridCampoSolido10:setAvoidScale(true);
    obj.GridCampoSolido10:setName("GridCampoSolido10");

    obj.edtGridCampoSolido10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido10:setParent(obj.GridCampoSolido10);
    obj.edtGridCampoSolido10:setName("edtGridCampoSolido10");
    obj.edtGridCampoSolido10:setAlign("top");
    obj.edtGridCampoSolido10:setField("forClasse");
    obj.edtGridCampoSolido10:setFontSize(15);
    obj.edtGridCampoSolido10:setTransparent(true);
    obj.edtGridCampoSolido10:setVertTextAlign("center");
    obj.edtGridCampoSolido10:setType("number");
    obj.edtGridCampoSolido10:setReadOnly(true);
    obj.edtGridCampoSolido10:setHeight(30);
    obj.edtGridCampoSolido10:setWidth(195);

    obj.linGridCampoSolido10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido10:setParent(obj.GridCampoSolido10);
    obj.linGridCampoSolido10:setName("linGridCampoSolido10");
    obj.linGridCampoSolido10:setAlign("top");
    obj.linGridCampoSolido10:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido10:setStrokeSize(1);

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.tabelaDeAtributos);
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setHeight(50);
    obj.flowPart21:setMinScaledWidth(30);
    obj.flowPart21:setMaxScaledWidth(50);

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.flowPart21);
    obj.image9:setSRC("/imagens/plus.png");
    obj.image9:setHeight(15);
    obj.image9:setWidth(15);
    obj.image9:setLeft(15);
    obj.image9:setTop(5);
    obj.image9:setName("image9");

    obj.GridCampoSolido11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido11:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido11:setHeight(50);
    obj.GridCampoSolido11:setMinScaledWidth(30);
    obj.GridCampoSolido11:setMinWidth(30);
    obj.GridCampoSolido11:setMaxWidth(35);
    obj.GridCampoSolido11:setMaxScaledWidth(35);
    obj.GridCampoSolido11:setAvoidScale(true);
    obj.GridCampoSolido11:setName("GridCampoSolido11");

    obj.edtGridCampoSolido11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido11:setParent(obj.GridCampoSolido11);
    obj.edtGridCampoSolido11:setName("edtGridCampoSolido11");
    obj.edtGridCampoSolido11:setAlign("top");
    obj.edtGridCampoSolido11:setField("forRaca");
    obj.edtGridCampoSolido11:setFontSize(15);
    obj.edtGridCampoSolido11:setTransparent(true);
    obj.edtGridCampoSolido11:setVertTextAlign("center");
    obj.edtGridCampoSolido11:setType("number");
    obj.edtGridCampoSolido11:setReadOnly(true);
    obj.edtGridCampoSolido11:setHeight(30);
    obj.edtGridCampoSolido11:setWidth(195);

    obj.linGridCampoSolido11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido11:setParent(obj.GridCampoSolido11);
    obj.linGridCampoSolido11:setName("linGridCampoSolido11");
    obj.linGridCampoSolido11:setAlign("top");
    obj.linGridCampoSolido11:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido11:setStrokeSize(1);

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.tabelaDeAtributos);
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setHeight(50);
    obj.flowPart22:setMinScaledWidth(30);
    obj.flowPart22:setMaxScaledWidth(50);

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.flowPart22);
    obj.image10:setSRC("/imagens/plus.png");
    obj.image10:setHeight(15);
    obj.image10:setWidth(15);
    obj.image10:setLeft(15);
    obj.image10:setTop(5);
    obj.image10:setName("image10");

    obj.GridCampoSolido12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido12:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido12:setHeight(50);
    obj.GridCampoSolido12:setMinScaledWidth(30);
    obj.GridCampoSolido12:setMinWidth(30);
    obj.GridCampoSolido12:setMaxWidth(35);
    obj.GridCampoSolido12:setMaxScaledWidth(35);
    obj.GridCampoSolido12:setAvoidScale(true);
    obj.GridCampoSolido12:setName("GridCampoSolido12");

    obj.edtGridCampoSolido12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido12:setParent(obj.GridCampoSolido12);
    obj.edtGridCampoSolido12:setName("edtGridCampoSolido12");
    obj.edtGridCampoSolido12:setAlign("top");
    obj.edtGridCampoSolido12:setField("forTreino");
    obj.edtGridCampoSolido12:setFontSize(15);
    obj.edtGridCampoSolido12:setTransparent(true);
    obj.edtGridCampoSolido12:setVertTextAlign("center");
    obj.edtGridCampoSolido12:setType("number");
    obj.edtGridCampoSolido12:setReadOnly(false);
    obj.edtGridCampoSolido12:setHeight(30);
    obj.edtGridCampoSolido12:setWidth(195);

    obj.linGridCampoSolido12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido12:setParent(obj.GridCampoSolido12);
    obj.linGridCampoSolido12:setName("linGridCampoSolido12");
    obj.linGridCampoSolido12:setAlign("top");
    obj.linGridCampoSolido12:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido12:setStrokeSize(1);

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.tabelaDeAtributos);
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setHeight(50);
    obj.flowPart23:setMinScaledWidth(30);
    obj.flowPart23:setMaxScaledWidth(50);

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.flowPart23);
    obj.image11:setSRC("/imagens/plus.png");
    obj.image11:setHeight(15);
    obj.image11:setWidth(15);
    obj.image11:setLeft(15);
    obj.image11:setTop(5);
    obj.image11:setName("image11");

    obj.GridCampoSolido13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido13:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido13:setHeight(50);
    obj.GridCampoSolido13:setMinScaledWidth(30);
    obj.GridCampoSolido13:setMinWidth(30);
    obj.GridCampoSolido13:setMaxWidth(35);
    obj.GridCampoSolido13:setMaxScaledWidth(35);
    obj.GridCampoSolido13:setAvoidScale(true);
    obj.GridCampoSolido13:setName("GridCampoSolido13");

    obj.edtGridCampoSolido13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido13:setParent(obj.GridCampoSolido13);
    obj.edtGridCampoSolido13:setName("edtGridCampoSolido13");
    obj.edtGridCampoSolido13:setAlign("top");
    obj.edtGridCampoSolido13:setField("forOutros");
    obj.edtGridCampoSolido13:setFontSize(15);
    obj.edtGridCampoSolido13:setTransparent(true);
    obj.edtGridCampoSolido13:setVertTextAlign("center");
    obj.edtGridCampoSolido13:setType("number");
    obj.edtGridCampoSolido13:setReadOnly(false);
    obj.edtGridCampoSolido13:setHeight(30);
    obj.edtGridCampoSolido13:setWidth(195);

    obj.linGridCampoSolido13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido13:setParent(obj.GridCampoSolido13);
    obj.linGridCampoSolido13:setName("linGridCampoSolido13");
    obj.linGridCampoSolido13:setAlign("top");
    obj.linGridCampoSolido13:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido13:setStrokeSize(1);

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.tabelaDeAtributos);
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setHeight(50);
    obj.flowPart24:setMinScaledWidth(30);
    obj.flowPart24:setMaxScaledWidth(50);

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.flowPart24);
    obj.image12:setSRC("/imagens/equals.png");
    obj.image12:setHeight(15);
    obj.image12:setWidth(15);
    obj.image12:setLeft(15);
    obj.image12:setTop(5);
    obj.image12:setName("image12");

    obj.GridCampoSolido14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido14:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido14:setHeight(50);
    obj.GridCampoSolido14:setMinScaledWidth(30);
    obj.GridCampoSolido14:setMinWidth(30);
    obj.GridCampoSolido14:setMaxWidth(35);
    obj.GridCampoSolido14:setMaxScaledWidth(35);
    obj.GridCampoSolido14:setAvoidScale(true);
    obj.GridCampoSolido14:setName("GridCampoSolido14");

    obj.edtGridCampoSolido14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido14:setParent(obj.GridCampoSolido14);
    obj.edtGridCampoSolido14:setName("edtGridCampoSolido14");
    obj.edtGridCampoSolido14:setAlign("top");
    obj.edtGridCampoSolido14:setField("forBase");
    obj.edtGridCampoSolido14:setFontSize(15);
    obj.edtGridCampoSolido14:setTransparent(true);
    obj.edtGridCampoSolido14:setVertTextAlign("center");
    obj.edtGridCampoSolido14:setType("number");
    obj.edtGridCampoSolido14:setReadOnly(true);
    obj.edtGridCampoSolido14:setHeight(30);
    obj.edtGridCampoSolido14:setWidth(195);

    obj.linGridCampoSolido14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido14:setParent(obj.GridCampoSolido14);
    obj.linGridCampoSolido14:setName("linGridCampoSolido14");
    obj.linGridCampoSolido14:setAlign("top");
    obj.linGridCampoSolido14:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido14:setStrokeSize(1);

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.tabelaDeAtributos);
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setHeight(50);
    obj.flowPart25:setMinScaledWidth(30);
    obj.flowPart25:setMaxScaledWidth(50);

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.flowPart25);
    obj.image13:setSRC("/imagens/plus.png");
    obj.image13:setHeight(15);
    obj.image13:setWidth(15);
    obj.image13:setLeft(15);
    obj.image13:setTop(5);
    obj.image13:setName("image13");

    obj.GridCampoSolido15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido15:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido15:setHeight(50);
    obj.GridCampoSolido15:setMinScaledWidth(30);
    obj.GridCampoSolido15:setMinWidth(30);
    obj.GridCampoSolido15:setMaxWidth(35);
    obj.GridCampoSolido15:setMaxScaledWidth(35);
    obj.GridCampoSolido15:setAvoidScale(true);
    obj.GridCampoSolido15:setName("GridCampoSolido15");

    obj.edtGridCampoSolido15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido15:setParent(obj.GridCampoSolido15);
    obj.edtGridCampoSolido15:setName("edtGridCampoSolido15");
    obj.edtGridCampoSolido15:setAlign("top");
    obj.edtGridCampoSolido15:setField("forEquip");
    obj.edtGridCampoSolido15:setFontSize(15);
    obj.edtGridCampoSolido15:setTransparent(true);
    obj.edtGridCampoSolido15:setVertTextAlign("center");
    obj.edtGridCampoSolido15:setType("number");
    obj.edtGridCampoSolido15:setReadOnly(false);
    obj.edtGridCampoSolido15:setHeight(30);
    obj.edtGridCampoSolido15:setWidth(195);

    obj.linGridCampoSolido15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido15:setParent(obj.GridCampoSolido15);
    obj.linGridCampoSolido15:setName("linGridCampoSolido15");
    obj.linGridCampoSolido15:setAlign("top");
    obj.linGridCampoSolido15:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido15:setStrokeSize(1);

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.tabelaDeAtributos);
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setHeight(50);
    obj.flowPart26:setMinScaledWidth(30);
    obj.flowPart26:setMaxScaledWidth(50);

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.flowPart26);
    obj.image14:setSRC("/imagens/equals.png");
    obj.image14:setHeight(15);
    obj.image14:setWidth(15);
    obj.image14:setLeft(15);
    obj.image14:setTop(5);
    obj.image14:setName("image14");

    obj.GridCampoSolido16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido16:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido16:setHeight(50);
    obj.GridCampoSolido16:setMinScaledWidth(30);
    obj.GridCampoSolido16:setMinWidth(30);
    obj.GridCampoSolido16:setMaxWidth(35);
    obj.GridCampoSolido16:setMaxScaledWidth(35);
    obj.GridCampoSolido16:setAvoidScale(true);
    obj.GridCampoSolido16:setName("GridCampoSolido16");

    obj.edtGridCampoSolido16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido16:setParent(obj.GridCampoSolido16);
    obj.edtGridCampoSolido16:setName("edtGridCampoSolido16");
    obj.edtGridCampoSolido16:setAlign("top");
    obj.edtGridCampoSolido16:setField("forTotal");
    obj.edtGridCampoSolido16:setFontSize(15);
    obj.edtGridCampoSolido16:setTransparent(true);
    obj.edtGridCampoSolido16:setVertTextAlign("center");
    obj.edtGridCampoSolido16:setType("number");
    obj.edtGridCampoSolido16:setReadOnly(true);
    obj.edtGridCampoSolido16:setHeight(30);
    obj.edtGridCampoSolido16:setWidth(195);

    obj.linGridCampoSolido16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido16:setParent(obj.GridCampoSolido16);
    obj.linGridCampoSolido16:setName("linGridCampoSolido16");
    obj.linGridCampoSolido16:setAlign("top");
    obj.linGridCampoSolido16:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido16:setStrokeSize(1);

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.tabelaDeAtributos);
    obj.flowPart27:setHeight(20);
    obj.flowPart27:setMinScaledWidth(60);
    obj.flowPart27:setMaxScaledWidth(85);
    obj.flowPart27:setName("flowPart27");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart27);
    obj.label11:setText("Destreza");
    obj.label11:setAlign("client");
    obj.label11:setField("");
    obj.label11:setFontSize(8);
    obj.label11:setVertTextAlign("center");
    obj.label11:setHorzTextAlign("leading");
    obj.label11:setName("label11");

    obj.GridCampoSolido17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido17:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido17:setHeight(50);
    obj.GridCampoSolido17:setMinScaledWidth(30);
    obj.GridCampoSolido17:setMinWidth(30);
    obj.GridCampoSolido17:setMaxWidth(35);
    obj.GridCampoSolido17:setMaxScaledWidth(35);
    obj.GridCampoSolido17:setAvoidScale(true);
    obj.GridCampoSolido17:setName("GridCampoSolido17");

    obj.edtGridCampoSolido17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido17:setParent(obj.GridCampoSolido17);
    obj.edtGridCampoSolido17:setName("edtGridCampoSolido17");
    obj.edtGridCampoSolido17:setAlign("top");
    obj.edtGridCampoSolido17:setField("dexNivel");
    obj.edtGridCampoSolido17:setFontSize(15);
    obj.edtGridCampoSolido17:setTransparent(true);
    obj.edtGridCampoSolido17:setVertTextAlign("center");
    obj.edtGridCampoSolido17:setType("number");
    obj.edtGridCampoSolido17:setReadOnly(false);
    obj.edtGridCampoSolido17:setHeight(30);
    obj.edtGridCampoSolido17:setWidth(195);

    obj.linGridCampoSolido17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido17:setParent(obj.GridCampoSolido17);
    obj.linGridCampoSolido17:setName("linGridCampoSolido17");
    obj.linGridCampoSolido17:setAlign("top");
    obj.linGridCampoSolido17:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido17:setStrokeSize(1);

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.tabelaDeAtributos);
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setHeight(50);
    obj.flowPart28:setMinScaledWidth(30);
    obj.flowPart28:setMaxScaledWidth(50);

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.flowPart28);
    obj.image15:setSRC("/imagens/plus.png");
    obj.image15:setHeight(15);
    obj.image15:setWidth(15);
    obj.image15:setLeft(15);
    obj.image15:setTop(5);
    obj.image15:setName("image15");

    obj.GridCampoSolido18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido18:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido18:setHeight(50);
    obj.GridCampoSolido18:setMinScaledWidth(30);
    obj.GridCampoSolido18:setMinWidth(30);
    obj.GridCampoSolido18:setMaxWidth(35);
    obj.GridCampoSolido18:setMaxScaledWidth(35);
    obj.GridCampoSolido18:setAvoidScale(true);
    obj.GridCampoSolido18:setName("GridCampoSolido18");

    obj.edtGridCampoSolido18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido18:setParent(obj.GridCampoSolido18);
    obj.edtGridCampoSolido18:setName("edtGridCampoSolido18");
    obj.edtGridCampoSolido18:setAlign("top");
    obj.edtGridCampoSolido18:setField("dexClasse");
    obj.edtGridCampoSolido18:setFontSize(15);
    obj.edtGridCampoSolido18:setTransparent(true);
    obj.edtGridCampoSolido18:setVertTextAlign("center");
    obj.edtGridCampoSolido18:setType("number");
    obj.edtGridCampoSolido18:setReadOnly(true);
    obj.edtGridCampoSolido18:setHeight(30);
    obj.edtGridCampoSolido18:setWidth(195);

    obj.linGridCampoSolido18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido18:setParent(obj.GridCampoSolido18);
    obj.linGridCampoSolido18:setName("linGridCampoSolido18");
    obj.linGridCampoSolido18:setAlign("top");
    obj.linGridCampoSolido18:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido18:setStrokeSize(1);

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.tabelaDeAtributos);
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setHeight(50);
    obj.flowPart29:setMinScaledWidth(30);
    obj.flowPart29:setMaxScaledWidth(50);

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.flowPart29);
    obj.image16:setSRC("/imagens/plus.png");
    obj.image16:setHeight(15);
    obj.image16:setWidth(15);
    obj.image16:setLeft(15);
    obj.image16:setTop(5);
    obj.image16:setName("image16");

    obj.GridCampoSolido19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido19:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido19:setHeight(50);
    obj.GridCampoSolido19:setMinScaledWidth(30);
    obj.GridCampoSolido19:setMinWidth(30);
    obj.GridCampoSolido19:setMaxWidth(35);
    obj.GridCampoSolido19:setMaxScaledWidth(35);
    obj.GridCampoSolido19:setAvoidScale(true);
    obj.GridCampoSolido19:setName("GridCampoSolido19");

    obj.edtGridCampoSolido19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido19:setParent(obj.GridCampoSolido19);
    obj.edtGridCampoSolido19:setName("edtGridCampoSolido19");
    obj.edtGridCampoSolido19:setAlign("top");
    obj.edtGridCampoSolido19:setField("dexRaca");
    obj.edtGridCampoSolido19:setFontSize(15);
    obj.edtGridCampoSolido19:setTransparent(true);
    obj.edtGridCampoSolido19:setVertTextAlign("center");
    obj.edtGridCampoSolido19:setType("number");
    obj.edtGridCampoSolido19:setReadOnly(true);
    obj.edtGridCampoSolido19:setHeight(30);
    obj.edtGridCampoSolido19:setWidth(195);

    obj.linGridCampoSolido19 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido19:setParent(obj.GridCampoSolido19);
    obj.linGridCampoSolido19:setName("linGridCampoSolido19");
    obj.linGridCampoSolido19:setAlign("top");
    obj.linGridCampoSolido19:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido19:setStrokeSize(1);

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.tabelaDeAtributos);
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setHeight(50);
    obj.flowPart30:setMinScaledWidth(30);
    obj.flowPart30:setMaxScaledWidth(50);

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.flowPart30);
    obj.image17:setSRC("/imagens/plus.png");
    obj.image17:setHeight(15);
    obj.image17:setWidth(15);
    obj.image17:setLeft(15);
    obj.image17:setTop(5);
    obj.image17:setName("image17");

    obj.GridCampoSolido20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido20:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido20:setHeight(50);
    obj.GridCampoSolido20:setMinScaledWidth(30);
    obj.GridCampoSolido20:setMinWidth(30);
    obj.GridCampoSolido20:setMaxWidth(35);
    obj.GridCampoSolido20:setMaxScaledWidth(35);
    obj.GridCampoSolido20:setAvoidScale(true);
    obj.GridCampoSolido20:setName("GridCampoSolido20");

    obj.edtGridCampoSolido20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido20:setParent(obj.GridCampoSolido20);
    obj.edtGridCampoSolido20:setName("edtGridCampoSolido20");
    obj.edtGridCampoSolido20:setAlign("top");
    obj.edtGridCampoSolido20:setField("dexTreino");
    obj.edtGridCampoSolido20:setFontSize(15);
    obj.edtGridCampoSolido20:setTransparent(true);
    obj.edtGridCampoSolido20:setVertTextAlign("center");
    obj.edtGridCampoSolido20:setType("number");
    obj.edtGridCampoSolido20:setReadOnly(false);
    obj.edtGridCampoSolido20:setHeight(30);
    obj.edtGridCampoSolido20:setWidth(195);

    obj.linGridCampoSolido20 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido20:setParent(obj.GridCampoSolido20);
    obj.linGridCampoSolido20:setName("linGridCampoSolido20");
    obj.linGridCampoSolido20:setAlign("top");
    obj.linGridCampoSolido20:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido20:setStrokeSize(1);

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.tabelaDeAtributos);
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setHeight(50);
    obj.flowPart31:setMinScaledWidth(30);
    obj.flowPart31:setMaxScaledWidth(50);

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.flowPart31);
    obj.image18:setSRC("/imagens/plus.png");
    obj.image18:setHeight(15);
    obj.image18:setWidth(15);
    obj.image18:setLeft(15);
    obj.image18:setTop(5);
    obj.image18:setName("image18");

    obj.GridCampoSolido21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido21:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido21:setHeight(50);
    obj.GridCampoSolido21:setMinScaledWidth(30);
    obj.GridCampoSolido21:setMinWidth(30);
    obj.GridCampoSolido21:setMaxWidth(35);
    obj.GridCampoSolido21:setMaxScaledWidth(35);
    obj.GridCampoSolido21:setAvoidScale(true);
    obj.GridCampoSolido21:setName("GridCampoSolido21");

    obj.edtGridCampoSolido21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido21:setParent(obj.GridCampoSolido21);
    obj.edtGridCampoSolido21:setName("edtGridCampoSolido21");
    obj.edtGridCampoSolido21:setAlign("top");
    obj.edtGridCampoSolido21:setField("dexOutros");
    obj.edtGridCampoSolido21:setFontSize(15);
    obj.edtGridCampoSolido21:setTransparent(true);
    obj.edtGridCampoSolido21:setVertTextAlign("center");
    obj.edtGridCampoSolido21:setType("number");
    obj.edtGridCampoSolido21:setReadOnly(false);
    obj.edtGridCampoSolido21:setHeight(30);
    obj.edtGridCampoSolido21:setWidth(195);

    obj.linGridCampoSolido21 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido21:setParent(obj.GridCampoSolido21);
    obj.linGridCampoSolido21:setName("linGridCampoSolido21");
    obj.linGridCampoSolido21:setAlign("top");
    obj.linGridCampoSolido21:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido21:setStrokeSize(1);

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.tabelaDeAtributos);
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setHeight(50);
    obj.flowPart32:setMinScaledWidth(30);
    obj.flowPart32:setMaxScaledWidth(50);

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.flowPart32);
    obj.image19:setSRC("/imagens/equals.png");
    obj.image19:setHeight(15);
    obj.image19:setWidth(15);
    obj.image19:setLeft(15);
    obj.image19:setTop(5);
    obj.image19:setName("image19");

    obj.GridCampoSolido22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido22:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido22:setHeight(50);
    obj.GridCampoSolido22:setMinScaledWidth(30);
    obj.GridCampoSolido22:setMinWidth(30);
    obj.GridCampoSolido22:setMaxWidth(35);
    obj.GridCampoSolido22:setMaxScaledWidth(35);
    obj.GridCampoSolido22:setAvoidScale(true);
    obj.GridCampoSolido22:setName("GridCampoSolido22");

    obj.edtGridCampoSolido22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido22:setParent(obj.GridCampoSolido22);
    obj.edtGridCampoSolido22:setName("edtGridCampoSolido22");
    obj.edtGridCampoSolido22:setAlign("top");
    obj.edtGridCampoSolido22:setField("dexBase");
    obj.edtGridCampoSolido22:setFontSize(15);
    obj.edtGridCampoSolido22:setTransparent(true);
    obj.edtGridCampoSolido22:setVertTextAlign("center");
    obj.edtGridCampoSolido22:setType("number");
    obj.edtGridCampoSolido22:setReadOnly(true);
    obj.edtGridCampoSolido22:setHeight(30);
    obj.edtGridCampoSolido22:setWidth(195);

    obj.linGridCampoSolido22 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido22:setParent(obj.GridCampoSolido22);
    obj.linGridCampoSolido22:setName("linGridCampoSolido22");
    obj.linGridCampoSolido22:setAlign("top");
    obj.linGridCampoSolido22:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido22:setStrokeSize(1);

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.tabelaDeAtributos);
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setHeight(50);
    obj.flowPart33:setMinScaledWidth(30);
    obj.flowPart33:setMaxScaledWidth(50);

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.flowPart33);
    obj.image20:setSRC("/imagens/plus.png");
    obj.image20:setHeight(15);
    obj.image20:setWidth(15);
    obj.image20:setLeft(15);
    obj.image20:setTop(5);
    obj.image20:setName("image20");

    obj.GridCampoSolido23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido23:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido23:setHeight(50);
    obj.GridCampoSolido23:setMinScaledWidth(30);
    obj.GridCampoSolido23:setMinWidth(30);
    obj.GridCampoSolido23:setMaxWidth(35);
    obj.GridCampoSolido23:setMaxScaledWidth(35);
    obj.GridCampoSolido23:setAvoidScale(true);
    obj.GridCampoSolido23:setName("GridCampoSolido23");

    obj.edtGridCampoSolido23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido23:setParent(obj.GridCampoSolido23);
    obj.edtGridCampoSolido23:setName("edtGridCampoSolido23");
    obj.edtGridCampoSolido23:setAlign("top");
    obj.edtGridCampoSolido23:setField("dexEquip");
    obj.edtGridCampoSolido23:setFontSize(15);
    obj.edtGridCampoSolido23:setTransparent(true);
    obj.edtGridCampoSolido23:setVertTextAlign("center");
    obj.edtGridCampoSolido23:setType("number");
    obj.edtGridCampoSolido23:setReadOnly(false);
    obj.edtGridCampoSolido23:setHeight(30);
    obj.edtGridCampoSolido23:setWidth(195);

    obj.linGridCampoSolido23 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido23:setParent(obj.GridCampoSolido23);
    obj.linGridCampoSolido23:setName("linGridCampoSolido23");
    obj.linGridCampoSolido23:setAlign("top");
    obj.linGridCampoSolido23:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido23:setStrokeSize(1);

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.tabelaDeAtributos);
    obj.flowPart34:setName("flowPart34");
    obj.flowPart34:setHeight(50);
    obj.flowPart34:setMinScaledWidth(30);
    obj.flowPart34:setMaxScaledWidth(50);

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.flowPart34);
    obj.image21:setSRC("/imagens/equals.png");
    obj.image21:setHeight(15);
    obj.image21:setWidth(15);
    obj.image21:setLeft(15);
    obj.image21:setTop(5);
    obj.image21:setName("image21");

    obj.GridCampoSolido24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido24:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido24:setHeight(50);
    obj.GridCampoSolido24:setMinScaledWidth(30);
    obj.GridCampoSolido24:setMinWidth(30);
    obj.GridCampoSolido24:setMaxWidth(35);
    obj.GridCampoSolido24:setMaxScaledWidth(35);
    obj.GridCampoSolido24:setAvoidScale(true);
    obj.GridCampoSolido24:setName("GridCampoSolido24");

    obj.edtGridCampoSolido24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido24:setParent(obj.GridCampoSolido24);
    obj.edtGridCampoSolido24:setName("edtGridCampoSolido24");
    obj.edtGridCampoSolido24:setAlign("top");
    obj.edtGridCampoSolido24:setField("dexTotal");
    obj.edtGridCampoSolido24:setFontSize(15);
    obj.edtGridCampoSolido24:setTransparent(true);
    obj.edtGridCampoSolido24:setVertTextAlign("center");
    obj.edtGridCampoSolido24:setType("number");
    obj.edtGridCampoSolido24:setReadOnly(true);
    obj.edtGridCampoSolido24:setHeight(30);
    obj.edtGridCampoSolido24:setWidth(195);

    obj.linGridCampoSolido24 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido24:setParent(obj.GridCampoSolido24);
    obj.linGridCampoSolido24:setName("linGridCampoSolido24");
    obj.linGridCampoSolido24:setAlign("top");
    obj.linGridCampoSolido24:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido24:setStrokeSize(1);

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.tabelaDeAtributos);
    obj.flowPart35:setHeight(20);
    obj.flowPart35:setMinScaledWidth(60);
    obj.flowPart35:setMaxScaledWidth(85);
    obj.flowPart35:setName("flowPart35");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart35);
    obj.label12:setText("Carisma");
    obj.label12:setAlign("client");
    obj.label12:setField("");
    obj.label12:setFontSize(8);
    obj.label12:setVertTextAlign("center");
    obj.label12:setHorzTextAlign("leading");
    obj.label12:setName("label12");

    obj.GridCampoSolido25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido25:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido25:setHeight(50);
    obj.GridCampoSolido25:setMinScaledWidth(30);
    obj.GridCampoSolido25:setMinWidth(30);
    obj.GridCampoSolido25:setMaxWidth(35);
    obj.GridCampoSolido25:setMaxScaledWidth(35);
    obj.GridCampoSolido25:setAvoidScale(true);
    obj.GridCampoSolido25:setName("GridCampoSolido25");

    obj.edtGridCampoSolido25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido25:setParent(obj.GridCampoSolido25);
    obj.edtGridCampoSolido25:setName("edtGridCampoSolido25");
    obj.edtGridCampoSolido25:setAlign("top");
    obj.edtGridCampoSolido25:setField("carNivel");
    obj.edtGridCampoSolido25:setFontSize(15);
    obj.edtGridCampoSolido25:setTransparent(true);
    obj.edtGridCampoSolido25:setVertTextAlign("center");
    obj.edtGridCampoSolido25:setType("number");
    obj.edtGridCampoSolido25:setReadOnly(false);
    obj.edtGridCampoSolido25:setHeight(30);
    obj.edtGridCampoSolido25:setWidth(195);

    obj.linGridCampoSolido25 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido25:setParent(obj.GridCampoSolido25);
    obj.linGridCampoSolido25:setName("linGridCampoSolido25");
    obj.linGridCampoSolido25:setAlign("top");
    obj.linGridCampoSolido25:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido25:setStrokeSize(1);

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.tabelaDeAtributos);
    obj.flowPart36:setName("flowPart36");
    obj.flowPart36:setHeight(50);
    obj.flowPart36:setMinScaledWidth(30);
    obj.flowPart36:setMaxScaledWidth(50);

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.flowPart36);
    obj.image22:setSRC("/imagens/plus.png");
    obj.image22:setHeight(15);
    obj.image22:setWidth(15);
    obj.image22:setLeft(15);
    obj.image22:setTop(5);
    obj.image22:setName("image22");

    obj.GridCampoSolido26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido26:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido26:setHeight(50);
    obj.GridCampoSolido26:setMinScaledWidth(30);
    obj.GridCampoSolido26:setMinWidth(30);
    obj.GridCampoSolido26:setMaxWidth(35);
    obj.GridCampoSolido26:setMaxScaledWidth(35);
    obj.GridCampoSolido26:setAvoidScale(true);
    obj.GridCampoSolido26:setName("GridCampoSolido26");

    obj.edtGridCampoSolido26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido26:setParent(obj.GridCampoSolido26);
    obj.edtGridCampoSolido26:setName("edtGridCampoSolido26");
    obj.edtGridCampoSolido26:setAlign("top");
    obj.edtGridCampoSolido26:setField("carClasse");
    obj.edtGridCampoSolido26:setFontSize(15);
    obj.edtGridCampoSolido26:setTransparent(true);
    obj.edtGridCampoSolido26:setVertTextAlign("center");
    obj.edtGridCampoSolido26:setType("number");
    obj.edtGridCampoSolido26:setReadOnly(true);
    obj.edtGridCampoSolido26:setHeight(30);
    obj.edtGridCampoSolido26:setWidth(195);

    obj.linGridCampoSolido26 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido26:setParent(obj.GridCampoSolido26);
    obj.linGridCampoSolido26:setName("linGridCampoSolido26");
    obj.linGridCampoSolido26:setAlign("top");
    obj.linGridCampoSolido26:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido26:setStrokeSize(1);

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.tabelaDeAtributos);
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setHeight(50);
    obj.flowPart37:setMinScaledWidth(30);
    obj.flowPart37:setMaxScaledWidth(50);

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.flowPart37);
    obj.image23:setSRC("/imagens/plus.png");
    obj.image23:setHeight(15);
    obj.image23:setWidth(15);
    obj.image23:setLeft(15);
    obj.image23:setTop(5);
    obj.image23:setName("image23");

    obj.GridCampoSolido27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido27:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido27:setHeight(50);
    obj.GridCampoSolido27:setMinScaledWidth(30);
    obj.GridCampoSolido27:setMinWidth(30);
    obj.GridCampoSolido27:setMaxWidth(35);
    obj.GridCampoSolido27:setMaxScaledWidth(35);
    obj.GridCampoSolido27:setAvoidScale(true);
    obj.GridCampoSolido27:setName("GridCampoSolido27");

    obj.edtGridCampoSolido27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido27:setParent(obj.GridCampoSolido27);
    obj.edtGridCampoSolido27:setName("edtGridCampoSolido27");
    obj.edtGridCampoSolido27:setAlign("top");
    obj.edtGridCampoSolido27:setField("carRaca");
    obj.edtGridCampoSolido27:setFontSize(15);
    obj.edtGridCampoSolido27:setTransparent(true);
    obj.edtGridCampoSolido27:setVertTextAlign("center");
    obj.edtGridCampoSolido27:setType("number");
    obj.edtGridCampoSolido27:setReadOnly(true);
    obj.edtGridCampoSolido27:setHeight(30);
    obj.edtGridCampoSolido27:setWidth(195);

    obj.linGridCampoSolido27 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido27:setParent(obj.GridCampoSolido27);
    obj.linGridCampoSolido27:setName("linGridCampoSolido27");
    obj.linGridCampoSolido27:setAlign("top");
    obj.linGridCampoSolido27:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido27:setStrokeSize(1);

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.tabelaDeAtributos);
    obj.flowPart38:setName("flowPart38");
    obj.flowPart38:setHeight(50);
    obj.flowPart38:setMinScaledWidth(30);
    obj.flowPart38:setMaxScaledWidth(50);

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.flowPart38);
    obj.image24:setSRC("/imagens/plus.png");
    obj.image24:setHeight(15);
    obj.image24:setWidth(15);
    obj.image24:setLeft(15);
    obj.image24:setTop(5);
    obj.image24:setName("image24");

    obj.GridCampoSolido28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido28:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido28:setHeight(50);
    obj.GridCampoSolido28:setMinScaledWidth(30);
    obj.GridCampoSolido28:setMinWidth(30);
    obj.GridCampoSolido28:setMaxWidth(35);
    obj.GridCampoSolido28:setMaxScaledWidth(35);
    obj.GridCampoSolido28:setAvoidScale(true);
    obj.GridCampoSolido28:setName("GridCampoSolido28");

    obj.edtGridCampoSolido28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido28:setParent(obj.GridCampoSolido28);
    obj.edtGridCampoSolido28:setName("edtGridCampoSolido28");
    obj.edtGridCampoSolido28:setAlign("top");
    obj.edtGridCampoSolido28:setField("carTreino");
    obj.edtGridCampoSolido28:setFontSize(15);
    obj.edtGridCampoSolido28:setTransparent(true);
    obj.edtGridCampoSolido28:setVertTextAlign("center");
    obj.edtGridCampoSolido28:setType("number");
    obj.edtGridCampoSolido28:setReadOnly(false);
    obj.edtGridCampoSolido28:setHeight(30);
    obj.edtGridCampoSolido28:setWidth(195);

    obj.linGridCampoSolido28 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido28:setParent(obj.GridCampoSolido28);
    obj.linGridCampoSolido28:setName("linGridCampoSolido28");
    obj.linGridCampoSolido28:setAlign("top");
    obj.linGridCampoSolido28:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido28:setStrokeSize(1);

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.tabelaDeAtributos);
    obj.flowPart39:setName("flowPart39");
    obj.flowPart39:setHeight(50);
    obj.flowPart39:setMinScaledWidth(30);
    obj.flowPart39:setMaxScaledWidth(50);

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.flowPart39);
    obj.image25:setSRC("/imagens/plus.png");
    obj.image25:setHeight(15);
    obj.image25:setWidth(15);
    obj.image25:setLeft(15);
    obj.image25:setTop(5);
    obj.image25:setName("image25");

    obj.GridCampoSolido29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido29:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido29:setHeight(50);
    obj.GridCampoSolido29:setMinScaledWidth(30);
    obj.GridCampoSolido29:setMinWidth(30);
    obj.GridCampoSolido29:setMaxWidth(35);
    obj.GridCampoSolido29:setMaxScaledWidth(35);
    obj.GridCampoSolido29:setAvoidScale(true);
    obj.GridCampoSolido29:setName("GridCampoSolido29");

    obj.edtGridCampoSolido29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido29:setParent(obj.GridCampoSolido29);
    obj.edtGridCampoSolido29:setName("edtGridCampoSolido29");
    obj.edtGridCampoSolido29:setAlign("top");
    obj.edtGridCampoSolido29:setField("carOutros");
    obj.edtGridCampoSolido29:setFontSize(15);
    obj.edtGridCampoSolido29:setTransparent(true);
    obj.edtGridCampoSolido29:setVertTextAlign("center");
    obj.edtGridCampoSolido29:setType("number");
    obj.edtGridCampoSolido29:setReadOnly(false);
    obj.edtGridCampoSolido29:setHeight(30);
    obj.edtGridCampoSolido29:setWidth(195);

    obj.linGridCampoSolido29 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido29:setParent(obj.GridCampoSolido29);
    obj.linGridCampoSolido29:setName("linGridCampoSolido29");
    obj.linGridCampoSolido29:setAlign("top");
    obj.linGridCampoSolido29:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido29:setStrokeSize(1);

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.tabelaDeAtributos);
    obj.flowPart40:setName("flowPart40");
    obj.flowPart40:setHeight(50);
    obj.flowPart40:setMinScaledWidth(30);
    obj.flowPart40:setMaxScaledWidth(50);

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.flowPart40);
    obj.image26:setSRC("/imagens/equals.png");
    obj.image26:setHeight(15);
    obj.image26:setWidth(15);
    obj.image26:setLeft(15);
    obj.image26:setTop(5);
    obj.image26:setName("image26");

    obj.GridCampoSolido30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido30:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido30:setHeight(50);
    obj.GridCampoSolido30:setMinScaledWidth(30);
    obj.GridCampoSolido30:setMinWidth(30);
    obj.GridCampoSolido30:setMaxWidth(35);
    obj.GridCampoSolido30:setMaxScaledWidth(35);
    obj.GridCampoSolido30:setAvoidScale(true);
    obj.GridCampoSolido30:setName("GridCampoSolido30");

    obj.edtGridCampoSolido30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido30:setParent(obj.GridCampoSolido30);
    obj.edtGridCampoSolido30:setName("edtGridCampoSolido30");
    obj.edtGridCampoSolido30:setAlign("top");
    obj.edtGridCampoSolido30:setField("carBase");
    obj.edtGridCampoSolido30:setFontSize(15);
    obj.edtGridCampoSolido30:setTransparent(true);
    obj.edtGridCampoSolido30:setVertTextAlign("center");
    obj.edtGridCampoSolido30:setType("number");
    obj.edtGridCampoSolido30:setReadOnly(true);
    obj.edtGridCampoSolido30:setHeight(30);
    obj.edtGridCampoSolido30:setWidth(195);

    obj.linGridCampoSolido30 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido30:setParent(obj.GridCampoSolido30);
    obj.linGridCampoSolido30:setName("linGridCampoSolido30");
    obj.linGridCampoSolido30:setAlign("top");
    obj.linGridCampoSolido30:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido30:setStrokeSize(1);

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.tabelaDeAtributos);
    obj.flowPart41:setName("flowPart41");
    obj.flowPart41:setHeight(50);
    obj.flowPart41:setMinScaledWidth(30);
    obj.flowPart41:setMaxScaledWidth(50);

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.flowPart41);
    obj.image27:setSRC("/imagens/plus.png");
    obj.image27:setHeight(15);
    obj.image27:setWidth(15);
    obj.image27:setLeft(15);
    obj.image27:setTop(5);
    obj.image27:setName("image27");

    obj.GridCampoSolido31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido31:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido31:setHeight(50);
    obj.GridCampoSolido31:setMinScaledWidth(30);
    obj.GridCampoSolido31:setMinWidth(30);
    obj.GridCampoSolido31:setMaxWidth(35);
    obj.GridCampoSolido31:setMaxScaledWidth(35);
    obj.GridCampoSolido31:setAvoidScale(true);
    obj.GridCampoSolido31:setName("GridCampoSolido31");

    obj.edtGridCampoSolido31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido31:setParent(obj.GridCampoSolido31);
    obj.edtGridCampoSolido31:setName("edtGridCampoSolido31");
    obj.edtGridCampoSolido31:setAlign("top");
    obj.edtGridCampoSolido31:setField("carEquip");
    obj.edtGridCampoSolido31:setFontSize(15);
    obj.edtGridCampoSolido31:setTransparent(true);
    obj.edtGridCampoSolido31:setVertTextAlign("center");
    obj.edtGridCampoSolido31:setType("number");
    obj.edtGridCampoSolido31:setReadOnly(false);
    obj.edtGridCampoSolido31:setHeight(30);
    obj.edtGridCampoSolido31:setWidth(195);

    obj.linGridCampoSolido31 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido31:setParent(obj.GridCampoSolido31);
    obj.linGridCampoSolido31:setName("linGridCampoSolido31");
    obj.linGridCampoSolido31:setAlign("top");
    obj.linGridCampoSolido31:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido31:setStrokeSize(1);

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.tabelaDeAtributos);
    obj.flowPart42:setName("flowPart42");
    obj.flowPart42:setHeight(50);
    obj.flowPart42:setMinScaledWidth(30);
    obj.flowPart42:setMaxScaledWidth(50);

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.flowPart42);
    obj.image28:setSRC("/imagens/equals.png");
    obj.image28:setHeight(15);
    obj.image28:setWidth(15);
    obj.image28:setLeft(15);
    obj.image28:setTop(5);
    obj.image28:setName("image28");

    obj.GridCampoSolido32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido32:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido32:setHeight(50);
    obj.GridCampoSolido32:setMinScaledWidth(30);
    obj.GridCampoSolido32:setMinWidth(30);
    obj.GridCampoSolido32:setMaxWidth(35);
    obj.GridCampoSolido32:setMaxScaledWidth(35);
    obj.GridCampoSolido32:setAvoidScale(true);
    obj.GridCampoSolido32:setName("GridCampoSolido32");

    obj.edtGridCampoSolido32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido32:setParent(obj.GridCampoSolido32);
    obj.edtGridCampoSolido32:setName("edtGridCampoSolido32");
    obj.edtGridCampoSolido32:setAlign("top");
    obj.edtGridCampoSolido32:setField("carTotal");
    obj.edtGridCampoSolido32:setFontSize(15);
    obj.edtGridCampoSolido32:setTransparent(true);
    obj.edtGridCampoSolido32:setVertTextAlign("center");
    obj.edtGridCampoSolido32:setType("number");
    obj.edtGridCampoSolido32:setReadOnly(true);
    obj.edtGridCampoSolido32:setHeight(30);
    obj.edtGridCampoSolido32:setWidth(195);

    obj.linGridCampoSolido32 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido32:setParent(obj.GridCampoSolido32);
    obj.linGridCampoSolido32:setName("linGridCampoSolido32");
    obj.linGridCampoSolido32:setAlign("top");
    obj.linGridCampoSolido32:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido32:setStrokeSize(1);

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.tabelaDeAtributos);
    obj.flowPart43:setHeight(20);
    obj.flowPart43:setMinScaledWidth(60);
    obj.flowPart43:setMaxScaledWidth(85);
    obj.flowPart43:setName("flowPart43");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart43);
    obj.label13:setText("Inteligência");
    obj.label13:setAlign("client");
    obj.label13:setField("");
    obj.label13:setFontSize(8);
    obj.label13:setVertTextAlign("center");
    obj.label13:setHorzTextAlign("leading");
    obj.label13:setName("label13");

    obj.GridCampoSolido33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido33:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido33:setHeight(50);
    obj.GridCampoSolido33:setMinScaledWidth(30);
    obj.GridCampoSolido33:setMinWidth(30);
    obj.GridCampoSolido33:setMaxWidth(35);
    obj.GridCampoSolido33:setMaxScaledWidth(35);
    obj.GridCampoSolido33:setAvoidScale(true);
    obj.GridCampoSolido33:setName("GridCampoSolido33");

    obj.edtGridCampoSolido33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido33:setParent(obj.GridCampoSolido33);
    obj.edtGridCampoSolido33:setName("edtGridCampoSolido33");
    obj.edtGridCampoSolido33:setAlign("top");
    obj.edtGridCampoSolido33:setField("intNivel");
    obj.edtGridCampoSolido33:setFontSize(15);
    obj.edtGridCampoSolido33:setTransparent(true);
    obj.edtGridCampoSolido33:setVertTextAlign("center");
    obj.edtGridCampoSolido33:setType("number");
    obj.edtGridCampoSolido33:setReadOnly(false);
    obj.edtGridCampoSolido33:setHeight(30);
    obj.edtGridCampoSolido33:setWidth(195);

    obj.linGridCampoSolido33 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido33:setParent(obj.GridCampoSolido33);
    obj.linGridCampoSolido33:setName("linGridCampoSolido33");
    obj.linGridCampoSolido33:setAlign("top");
    obj.linGridCampoSolido33:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido33:setStrokeSize(1);

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.tabelaDeAtributos);
    obj.flowPart44:setName("flowPart44");
    obj.flowPart44:setHeight(50);
    obj.flowPart44:setMinScaledWidth(30);
    obj.flowPart44:setMaxScaledWidth(50);

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.flowPart44);
    obj.image29:setSRC("/imagens/plus.png");
    obj.image29:setHeight(15);
    obj.image29:setWidth(15);
    obj.image29:setLeft(15);
    obj.image29:setTop(5);
    obj.image29:setName("image29");

    obj.GridCampoSolido34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido34:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido34:setHeight(50);
    obj.GridCampoSolido34:setMinScaledWidth(30);
    obj.GridCampoSolido34:setMinWidth(30);
    obj.GridCampoSolido34:setMaxWidth(35);
    obj.GridCampoSolido34:setMaxScaledWidth(35);
    obj.GridCampoSolido34:setAvoidScale(true);
    obj.GridCampoSolido34:setName("GridCampoSolido34");

    obj.edtGridCampoSolido34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido34:setParent(obj.GridCampoSolido34);
    obj.edtGridCampoSolido34:setName("edtGridCampoSolido34");
    obj.edtGridCampoSolido34:setAlign("top");
    obj.edtGridCampoSolido34:setField("intClasse");
    obj.edtGridCampoSolido34:setFontSize(15);
    obj.edtGridCampoSolido34:setTransparent(true);
    obj.edtGridCampoSolido34:setVertTextAlign("center");
    obj.edtGridCampoSolido34:setType("number");
    obj.edtGridCampoSolido34:setReadOnly(true);
    obj.edtGridCampoSolido34:setHeight(30);
    obj.edtGridCampoSolido34:setWidth(195);

    obj.linGridCampoSolido34 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido34:setParent(obj.GridCampoSolido34);
    obj.linGridCampoSolido34:setName("linGridCampoSolido34");
    obj.linGridCampoSolido34:setAlign("top");
    obj.linGridCampoSolido34:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido34:setStrokeSize(1);

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.tabelaDeAtributos);
    obj.flowPart45:setName("flowPart45");
    obj.flowPart45:setHeight(50);
    obj.flowPart45:setMinScaledWidth(30);
    obj.flowPart45:setMaxScaledWidth(50);

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.flowPart45);
    obj.image30:setSRC("/imagens/plus.png");
    obj.image30:setHeight(15);
    obj.image30:setWidth(15);
    obj.image30:setLeft(15);
    obj.image30:setTop(5);
    obj.image30:setName("image30");

    obj.GridCampoSolido35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido35:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido35:setHeight(50);
    obj.GridCampoSolido35:setMinScaledWidth(30);
    obj.GridCampoSolido35:setMinWidth(30);
    obj.GridCampoSolido35:setMaxWidth(35);
    obj.GridCampoSolido35:setMaxScaledWidth(35);
    obj.GridCampoSolido35:setAvoidScale(true);
    obj.GridCampoSolido35:setName("GridCampoSolido35");

    obj.edtGridCampoSolido35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido35:setParent(obj.GridCampoSolido35);
    obj.edtGridCampoSolido35:setName("edtGridCampoSolido35");
    obj.edtGridCampoSolido35:setAlign("top");
    obj.edtGridCampoSolido35:setField("intRaca");
    obj.edtGridCampoSolido35:setFontSize(15);
    obj.edtGridCampoSolido35:setTransparent(true);
    obj.edtGridCampoSolido35:setVertTextAlign("center");
    obj.edtGridCampoSolido35:setType("number");
    obj.edtGridCampoSolido35:setReadOnly(true);
    obj.edtGridCampoSolido35:setHeight(30);
    obj.edtGridCampoSolido35:setWidth(195);

    obj.linGridCampoSolido35 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido35:setParent(obj.GridCampoSolido35);
    obj.linGridCampoSolido35:setName("linGridCampoSolido35");
    obj.linGridCampoSolido35:setAlign("top");
    obj.linGridCampoSolido35:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido35:setStrokeSize(1);

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.tabelaDeAtributos);
    obj.flowPart46:setName("flowPart46");
    obj.flowPart46:setHeight(50);
    obj.flowPart46:setMinScaledWidth(30);
    obj.flowPart46:setMaxScaledWidth(50);

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.flowPart46);
    obj.image31:setSRC("/imagens/plus.png");
    obj.image31:setHeight(15);
    obj.image31:setWidth(15);
    obj.image31:setLeft(15);
    obj.image31:setTop(5);
    obj.image31:setName("image31");

    obj.GridCampoSolido36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido36:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido36:setHeight(50);
    obj.GridCampoSolido36:setMinScaledWidth(30);
    obj.GridCampoSolido36:setMinWidth(30);
    obj.GridCampoSolido36:setMaxWidth(35);
    obj.GridCampoSolido36:setMaxScaledWidth(35);
    obj.GridCampoSolido36:setAvoidScale(true);
    obj.GridCampoSolido36:setName("GridCampoSolido36");

    obj.edtGridCampoSolido36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido36:setParent(obj.GridCampoSolido36);
    obj.edtGridCampoSolido36:setName("edtGridCampoSolido36");
    obj.edtGridCampoSolido36:setAlign("top");
    obj.edtGridCampoSolido36:setField("intTreino");
    obj.edtGridCampoSolido36:setFontSize(15);
    obj.edtGridCampoSolido36:setTransparent(true);
    obj.edtGridCampoSolido36:setVertTextAlign("center");
    obj.edtGridCampoSolido36:setType("number");
    obj.edtGridCampoSolido36:setReadOnly(false);
    obj.edtGridCampoSolido36:setHeight(30);
    obj.edtGridCampoSolido36:setWidth(195);

    obj.linGridCampoSolido36 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido36:setParent(obj.GridCampoSolido36);
    obj.linGridCampoSolido36:setName("linGridCampoSolido36");
    obj.linGridCampoSolido36:setAlign("top");
    obj.linGridCampoSolido36:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido36:setStrokeSize(1);

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.tabelaDeAtributos);
    obj.flowPart47:setName("flowPart47");
    obj.flowPart47:setHeight(50);
    obj.flowPart47:setMinScaledWidth(30);
    obj.flowPart47:setMaxScaledWidth(50);

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.flowPart47);
    obj.image32:setSRC("/imagens/plus.png");
    obj.image32:setHeight(15);
    obj.image32:setWidth(15);
    obj.image32:setLeft(15);
    obj.image32:setTop(5);
    obj.image32:setName("image32");

    obj.GridCampoSolido37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido37:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido37:setHeight(50);
    obj.GridCampoSolido37:setMinScaledWidth(30);
    obj.GridCampoSolido37:setMinWidth(30);
    obj.GridCampoSolido37:setMaxWidth(35);
    obj.GridCampoSolido37:setMaxScaledWidth(35);
    obj.GridCampoSolido37:setAvoidScale(true);
    obj.GridCampoSolido37:setName("GridCampoSolido37");

    obj.edtGridCampoSolido37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido37:setParent(obj.GridCampoSolido37);
    obj.edtGridCampoSolido37:setName("edtGridCampoSolido37");
    obj.edtGridCampoSolido37:setAlign("top");
    obj.edtGridCampoSolido37:setField("intOutros");
    obj.edtGridCampoSolido37:setFontSize(15);
    obj.edtGridCampoSolido37:setTransparent(true);
    obj.edtGridCampoSolido37:setVertTextAlign("center");
    obj.edtGridCampoSolido37:setType("number");
    obj.edtGridCampoSolido37:setReadOnly(false);
    obj.edtGridCampoSolido37:setHeight(30);
    obj.edtGridCampoSolido37:setWidth(195);

    obj.linGridCampoSolido37 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido37:setParent(obj.GridCampoSolido37);
    obj.linGridCampoSolido37:setName("linGridCampoSolido37");
    obj.linGridCampoSolido37:setAlign("top");
    obj.linGridCampoSolido37:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido37:setStrokeSize(1);

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.tabelaDeAtributos);
    obj.flowPart48:setName("flowPart48");
    obj.flowPart48:setHeight(50);
    obj.flowPart48:setMinScaledWidth(30);
    obj.flowPart48:setMaxScaledWidth(50);

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.flowPart48);
    obj.image33:setSRC("/imagens/equals.png");
    obj.image33:setHeight(15);
    obj.image33:setWidth(15);
    obj.image33:setLeft(15);
    obj.image33:setTop(5);
    obj.image33:setName("image33");

    obj.GridCampoSolido38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido38:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido38:setHeight(50);
    obj.GridCampoSolido38:setMinScaledWidth(30);
    obj.GridCampoSolido38:setMinWidth(30);
    obj.GridCampoSolido38:setMaxWidth(35);
    obj.GridCampoSolido38:setMaxScaledWidth(35);
    obj.GridCampoSolido38:setAvoidScale(true);
    obj.GridCampoSolido38:setName("GridCampoSolido38");

    obj.edtGridCampoSolido38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido38:setParent(obj.GridCampoSolido38);
    obj.edtGridCampoSolido38:setName("edtGridCampoSolido38");
    obj.edtGridCampoSolido38:setAlign("top");
    obj.edtGridCampoSolido38:setField("intBase");
    obj.edtGridCampoSolido38:setFontSize(15);
    obj.edtGridCampoSolido38:setTransparent(true);
    obj.edtGridCampoSolido38:setVertTextAlign("center");
    obj.edtGridCampoSolido38:setType("number");
    obj.edtGridCampoSolido38:setReadOnly(true);
    obj.edtGridCampoSolido38:setHeight(30);
    obj.edtGridCampoSolido38:setWidth(195);

    obj.linGridCampoSolido38 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido38:setParent(obj.GridCampoSolido38);
    obj.linGridCampoSolido38:setName("linGridCampoSolido38");
    obj.linGridCampoSolido38:setAlign("top");
    obj.linGridCampoSolido38:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido38:setStrokeSize(1);

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.tabelaDeAtributos);
    obj.flowPart49:setName("flowPart49");
    obj.flowPart49:setHeight(50);
    obj.flowPart49:setMinScaledWidth(30);
    obj.flowPart49:setMaxScaledWidth(50);

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.flowPart49);
    obj.image34:setSRC("/imagens/plus.png");
    obj.image34:setHeight(15);
    obj.image34:setWidth(15);
    obj.image34:setLeft(15);
    obj.image34:setTop(5);
    obj.image34:setName("image34");

    obj.GridCampoSolido39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido39:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido39:setHeight(50);
    obj.GridCampoSolido39:setMinScaledWidth(30);
    obj.GridCampoSolido39:setMinWidth(30);
    obj.GridCampoSolido39:setMaxWidth(35);
    obj.GridCampoSolido39:setMaxScaledWidth(35);
    obj.GridCampoSolido39:setAvoidScale(true);
    obj.GridCampoSolido39:setName("GridCampoSolido39");

    obj.edtGridCampoSolido39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido39:setParent(obj.GridCampoSolido39);
    obj.edtGridCampoSolido39:setName("edtGridCampoSolido39");
    obj.edtGridCampoSolido39:setAlign("top");
    obj.edtGridCampoSolido39:setField("intEquip");
    obj.edtGridCampoSolido39:setFontSize(15);
    obj.edtGridCampoSolido39:setTransparent(true);
    obj.edtGridCampoSolido39:setVertTextAlign("center");
    obj.edtGridCampoSolido39:setType("number");
    obj.edtGridCampoSolido39:setReadOnly(false);
    obj.edtGridCampoSolido39:setHeight(30);
    obj.edtGridCampoSolido39:setWidth(195);

    obj.linGridCampoSolido39 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido39:setParent(obj.GridCampoSolido39);
    obj.linGridCampoSolido39:setName("linGridCampoSolido39");
    obj.linGridCampoSolido39:setAlign("top");
    obj.linGridCampoSolido39:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido39:setStrokeSize(1);

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.tabelaDeAtributos);
    obj.flowPart50:setName("flowPart50");
    obj.flowPart50:setHeight(50);
    obj.flowPart50:setMinScaledWidth(30);
    obj.flowPart50:setMaxScaledWidth(50);

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.flowPart50);
    obj.image35:setSRC("/imagens/equals.png");
    obj.image35:setHeight(15);
    obj.image35:setWidth(15);
    obj.image35:setLeft(15);
    obj.image35:setTop(5);
    obj.image35:setName("image35");

    obj.GridCampoSolido40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido40:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido40:setHeight(50);
    obj.GridCampoSolido40:setMinScaledWidth(30);
    obj.GridCampoSolido40:setMinWidth(30);
    obj.GridCampoSolido40:setMaxWidth(35);
    obj.GridCampoSolido40:setMaxScaledWidth(35);
    obj.GridCampoSolido40:setAvoidScale(true);
    obj.GridCampoSolido40:setName("GridCampoSolido40");

    obj.edtGridCampoSolido40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido40:setParent(obj.GridCampoSolido40);
    obj.edtGridCampoSolido40:setName("edtGridCampoSolido40");
    obj.edtGridCampoSolido40:setAlign("top");
    obj.edtGridCampoSolido40:setField("intTotal");
    obj.edtGridCampoSolido40:setFontSize(15);
    obj.edtGridCampoSolido40:setTransparent(true);
    obj.edtGridCampoSolido40:setVertTextAlign("center");
    obj.edtGridCampoSolido40:setType("number");
    obj.edtGridCampoSolido40:setReadOnly(true);
    obj.edtGridCampoSolido40:setHeight(30);
    obj.edtGridCampoSolido40:setWidth(195);

    obj.linGridCampoSolido40 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido40:setParent(obj.GridCampoSolido40);
    obj.linGridCampoSolido40:setName("linGridCampoSolido40");
    obj.linGridCampoSolido40:setAlign("top");
    obj.linGridCampoSolido40:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido40:setStrokeSize(1);

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.tabelaDeAtributos);
    obj.flowPart51:setHeight(20);
    obj.flowPart51:setMinScaledWidth(60);
    obj.flowPart51:setMaxScaledWidth(85);
    obj.flowPart51:setName("flowPart51");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart51);
    obj.label14:setText("Sabedoria");
    obj.label14:setAlign("client");
    obj.label14:setField("");
    obj.label14:setFontSize(8);
    obj.label14:setVertTextAlign("center");
    obj.label14:setHorzTextAlign("leading");
    obj.label14:setName("label14");

    obj.GridCampoSolido41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido41:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido41:setHeight(50);
    obj.GridCampoSolido41:setMinScaledWidth(30);
    obj.GridCampoSolido41:setMinWidth(30);
    obj.GridCampoSolido41:setMaxWidth(35);
    obj.GridCampoSolido41:setMaxScaledWidth(35);
    obj.GridCampoSolido41:setAvoidScale(true);
    obj.GridCampoSolido41:setName("GridCampoSolido41");

    obj.edtGridCampoSolido41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido41:setParent(obj.GridCampoSolido41);
    obj.edtGridCampoSolido41:setName("edtGridCampoSolido41");
    obj.edtGridCampoSolido41:setAlign("top");
    obj.edtGridCampoSolido41:setField("sabNivel");
    obj.edtGridCampoSolido41:setFontSize(15);
    obj.edtGridCampoSolido41:setTransparent(true);
    obj.edtGridCampoSolido41:setVertTextAlign("center");
    obj.edtGridCampoSolido41:setType("number");
    obj.edtGridCampoSolido41:setReadOnly(false);
    obj.edtGridCampoSolido41:setHeight(30);
    obj.edtGridCampoSolido41:setWidth(195);

    obj.linGridCampoSolido41 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido41:setParent(obj.GridCampoSolido41);
    obj.linGridCampoSolido41:setName("linGridCampoSolido41");
    obj.linGridCampoSolido41:setAlign("top");
    obj.linGridCampoSolido41:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido41:setStrokeSize(1);

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.tabelaDeAtributos);
    obj.flowPart52:setName("flowPart52");
    obj.flowPart52:setHeight(50);
    obj.flowPart52:setMinScaledWidth(30);
    obj.flowPart52:setMaxScaledWidth(50);

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.flowPart52);
    obj.image36:setSRC("/imagens/plus.png");
    obj.image36:setHeight(15);
    obj.image36:setWidth(15);
    obj.image36:setLeft(15);
    obj.image36:setTop(5);
    obj.image36:setName("image36");

    obj.GridCampoSolido42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido42:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido42:setHeight(50);
    obj.GridCampoSolido42:setMinScaledWidth(30);
    obj.GridCampoSolido42:setMinWidth(30);
    obj.GridCampoSolido42:setMaxWidth(35);
    obj.GridCampoSolido42:setMaxScaledWidth(35);
    obj.GridCampoSolido42:setAvoidScale(true);
    obj.GridCampoSolido42:setName("GridCampoSolido42");

    obj.edtGridCampoSolido42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido42:setParent(obj.GridCampoSolido42);
    obj.edtGridCampoSolido42:setName("edtGridCampoSolido42");
    obj.edtGridCampoSolido42:setAlign("top");
    obj.edtGridCampoSolido42:setField("sabClasse");
    obj.edtGridCampoSolido42:setFontSize(15);
    obj.edtGridCampoSolido42:setTransparent(true);
    obj.edtGridCampoSolido42:setVertTextAlign("center");
    obj.edtGridCampoSolido42:setType("number");
    obj.edtGridCampoSolido42:setReadOnly(true);
    obj.edtGridCampoSolido42:setHeight(30);
    obj.edtGridCampoSolido42:setWidth(195);

    obj.linGridCampoSolido42 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido42:setParent(obj.GridCampoSolido42);
    obj.linGridCampoSolido42:setName("linGridCampoSolido42");
    obj.linGridCampoSolido42:setAlign("top");
    obj.linGridCampoSolido42:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido42:setStrokeSize(1);

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.tabelaDeAtributos);
    obj.flowPart53:setName("flowPart53");
    obj.flowPart53:setHeight(50);
    obj.flowPart53:setMinScaledWidth(30);
    obj.flowPart53:setMaxScaledWidth(50);

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.flowPart53);
    obj.image37:setSRC("/imagens/plus.png");
    obj.image37:setHeight(15);
    obj.image37:setWidth(15);
    obj.image37:setLeft(15);
    obj.image37:setTop(5);
    obj.image37:setName("image37");

    obj.GridCampoSolido43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido43:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido43:setHeight(50);
    obj.GridCampoSolido43:setMinScaledWidth(30);
    obj.GridCampoSolido43:setMinWidth(30);
    obj.GridCampoSolido43:setMaxWidth(35);
    obj.GridCampoSolido43:setMaxScaledWidth(35);
    obj.GridCampoSolido43:setAvoidScale(true);
    obj.GridCampoSolido43:setName("GridCampoSolido43");

    obj.edtGridCampoSolido43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido43:setParent(obj.GridCampoSolido43);
    obj.edtGridCampoSolido43:setName("edtGridCampoSolido43");
    obj.edtGridCampoSolido43:setAlign("top");
    obj.edtGridCampoSolido43:setField("sabRaca");
    obj.edtGridCampoSolido43:setFontSize(15);
    obj.edtGridCampoSolido43:setTransparent(true);
    obj.edtGridCampoSolido43:setVertTextAlign("center");
    obj.edtGridCampoSolido43:setType("number");
    obj.edtGridCampoSolido43:setReadOnly(true);
    obj.edtGridCampoSolido43:setHeight(30);
    obj.edtGridCampoSolido43:setWidth(195);

    obj.linGridCampoSolido43 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido43:setParent(obj.GridCampoSolido43);
    obj.linGridCampoSolido43:setName("linGridCampoSolido43");
    obj.linGridCampoSolido43:setAlign("top");
    obj.linGridCampoSolido43:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido43:setStrokeSize(1);

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.tabelaDeAtributos);
    obj.flowPart54:setName("flowPart54");
    obj.flowPart54:setHeight(50);
    obj.flowPart54:setMinScaledWidth(30);
    obj.flowPart54:setMaxScaledWidth(50);

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.flowPart54);
    obj.image38:setSRC("/imagens/plus.png");
    obj.image38:setHeight(15);
    obj.image38:setWidth(15);
    obj.image38:setLeft(15);
    obj.image38:setTop(5);
    obj.image38:setName("image38");

    obj.GridCampoSolido44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido44:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido44:setHeight(50);
    obj.GridCampoSolido44:setMinScaledWidth(30);
    obj.GridCampoSolido44:setMinWidth(30);
    obj.GridCampoSolido44:setMaxWidth(35);
    obj.GridCampoSolido44:setMaxScaledWidth(35);
    obj.GridCampoSolido44:setAvoidScale(true);
    obj.GridCampoSolido44:setName("GridCampoSolido44");

    obj.edtGridCampoSolido44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido44:setParent(obj.GridCampoSolido44);
    obj.edtGridCampoSolido44:setName("edtGridCampoSolido44");
    obj.edtGridCampoSolido44:setAlign("top");
    obj.edtGridCampoSolido44:setField("sabTreino");
    obj.edtGridCampoSolido44:setFontSize(15);
    obj.edtGridCampoSolido44:setTransparent(true);
    obj.edtGridCampoSolido44:setVertTextAlign("center");
    obj.edtGridCampoSolido44:setType("number");
    obj.edtGridCampoSolido44:setReadOnly(false);
    obj.edtGridCampoSolido44:setHeight(30);
    obj.edtGridCampoSolido44:setWidth(195);

    obj.linGridCampoSolido44 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido44:setParent(obj.GridCampoSolido44);
    obj.linGridCampoSolido44:setName("linGridCampoSolido44");
    obj.linGridCampoSolido44:setAlign("top");
    obj.linGridCampoSolido44:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido44:setStrokeSize(1);

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.tabelaDeAtributos);
    obj.flowPart55:setName("flowPart55");
    obj.flowPart55:setHeight(50);
    obj.flowPart55:setMinScaledWidth(30);
    obj.flowPart55:setMaxScaledWidth(50);

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.flowPart55);
    obj.image39:setSRC("/imagens/plus.png");
    obj.image39:setHeight(15);
    obj.image39:setWidth(15);
    obj.image39:setLeft(15);
    obj.image39:setTop(5);
    obj.image39:setName("image39");

    obj.GridCampoSolido45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido45:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido45:setHeight(50);
    obj.GridCampoSolido45:setMinScaledWidth(30);
    obj.GridCampoSolido45:setMinWidth(30);
    obj.GridCampoSolido45:setMaxWidth(35);
    obj.GridCampoSolido45:setMaxScaledWidth(35);
    obj.GridCampoSolido45:setAvoidScale(true);
    obj.GridCampoSolido45:setName("GridCampoSolido45");

    obj.edtGridCampoSolido45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido45:setParent(obj.GridCampoSolido45);
    obj.edtGridCampoSolido45:setName("edtGridCampoSolido45");
    obj.edtGridCampoSolido45:setAlign("top");
    obj.edtGridCampoSolido45:setField("sabOutros");
    obj.edtGridCampoSolido45:setFontSize(15);
    obj.edtGridCampoSolido45:setTransparent(true);
    obj.edtGridCampoSolido45:setVertTextAlign("center");
    obj.edtGridCampoSolido45:setType("number");
    obj.edtGridCampoSolido45:setReadOnly(false);
    obj.edtGridCampoSolido45:setHeight(30);
    obj.edtGridCampoSolido45:setWidth(195);

    obj.linGridCampoSolido45 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido45:setParent(obj.GridCampoSolido45);
    obj.linGridCampoSolido45:setName("linGridCampoSolido45");
    obj.linGridCampoSolido45:setAlign("top");
    obj.linGridCampoSolido45:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido45:setStrokeSize(1);

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.tabelaDeAtributos);
    obj.flowPart56:setName("flowPart56");
    obj.flowPart56:setHeight(50);
    obj.flowPart56:setMinScaledWidth(30);
    obj.flowPart56:setMaxScaledWidth(50);

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.flowPart56);
    obj.image40:setSRC("/imagens/equals.png");
    obj.image40:setHeight(15);
    obj.image40:setWidth(15);
    obj.image40:setLeft(15);
    obj.image40:setTop(5);
    obj.image40:setName("image40");

    obj.GridCampoSolido46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido46:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido46:setHeight(50);
    obj.GridCampoSolido46:setMinScaledWidth(30);
    obj.GridCampoSolido46:setMinWidth(30);
    obj.GridCampoSolido46:setMaxWidth(35);
    obj.GridCampoSolido46:setMaxScaledWidth(35);
    obj.GridCampoSolido46:setAvoidScale(true);
    obj.GridCampoSolido46:setName("GridCampoSolido46");

    obj.edtGridCampoSolido46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido46:setParent(obj.GridCampoSolido46);
    obj.edtGridCampoSolido46:setName("edtGridCampoSolido46");
    obj.edtGridCampoSolido46:setAlign("top");
    obj.edtGridCampoSolido46:setField("sabBase");
    obj.edtGridCampoSolido46:setFontSize(15);
    obj.edtGridCampoSolido46:setTransparent(true);
    obj.edtGridCampoSolido46:setVertTextAlign("center");
    obj.edtGridCampoSolido46:setType("number");
    obj.edtGridCampoSolido46:setReadOnly(true);
    obj.edtGridCampoSolido46:setHeight(30);
    obj.edtGridCampoSolido46:setWidth(195);

    obj.linGridCampoSolido46 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido46:setParent(obj.GridCampoSolido46);
    obj.linGridCampoSolido46:setName("linGridCampoSolido46");
    obj.linGridCampoSolido46:setAlign("top");
    obj.linGridCampoSolido46:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido46:setStrokeSize(1);

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.tabelaDeAtributos);
    obj.flowPart57:setName("flowPart57");
    obj.flowPart57:setHeight(50);
    obj.flowPart57:setMinScaledWidth(30);
    obj.flowPart57:setMaxScaledWidth(50);

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.flowPart57);
    obj.image41:setSRC("/imagens/plus.png");
    obj.image41:setHeight(15);
    obj.image41:setWidth(15);
    obj.image41:setLeft(15);
    obj.image41:setTop(5);
    obj.image41:setName("image41");

    obj.GridCampoSolido47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido47:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido47:setHeight(50);
    obj.GridCampoSolido47:setMinScaledWidth(30);
    obj.GridCampoSolido47:setMinWidth(30);
    obj.GridCampoSolido47:setMaxWidth(35);
    obj.GridCampoSolido47:setMaxScaledWidth(35);
    obj.GridCampoSolido47:setAvoidScale(true);
    obj.GridCampoSolido47:setName("GridCampoSolido47");

    obj.edtGridCampoSolido47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido47:setParent(obj.GridCampoSolido47);
    obj.edtGridCampoSolido47:setName("edtGridCampoSolido47");
    obj.edtGridCampoSolido47:setAlign("top");
    obj.edtGridCampoSolido47:setField("sabEquip");
    obj.edtGridCampoSolido47:setFontSize(15);
    obj.edtGridCampoSolido47:setTransparent(true);
    obj.edtGridCampoSolido47:setVertTextAlign("center");
    obj.edtGridCampoSolido47:setType("number");
    obj.edtGridCampoSolido47:setReadOnly(false);
    obj.edtGridCampoSolido47:setHeight(30);
    obj.edtGridCampoSolido47:setWidth(195);

    obj.linGridCampoSolido47 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido47:setParent(obj.GridCampoSolido47);
    obj.linGridCampoSolido47:setName("linGridCampoSolido47");
    obj.linGridCampoSolido47:setAlign("top");
    obj.linGridCampoSolido47:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido47:setStrokeSize(1);

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.tabelaDeAtributos);
    obj.flowPart58:setName("flowPart58");
    obj.flowPart58:setHeight(50);
    obj.flowPart58:setMinScaledWidth(30);
    obj.flowPart58:setMaxScaledWidth(50);

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.flowPart58);
    obj.image42:setSRC("/imagens/equals.png");
    obj.image42:setHeight(15);
    obj.image42:setWidth(15);
    obj.image42:setLeft(15);
    obj.image42:setTop(5);
    obj.image42:setName("image42");

    obj.GridCampoSolido48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido48:setParent(obj.tabelaDeAtributos);
    obj.GridCampoSolido48:setHeight(50);
    obj.GridCampoSolido48:setMinScaledWidth(30);
    obj.GridCampoSolido48:setMinWidth(30);
    obj.GridCampoSolido48:setMaxWidth(35);
    obj.GridCampoSolido48:setMaxScaledWidth(35);
    obj.GridCampoSolido48:setAvoidScale(true);
    obj.GridCampoSolido48:setName("GridCampoSolido48");

    obj.edtGridCampoSolido48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido48:setParent(obj.GridCampoSolido48);
    obj.edtGridCampoSolido48:setName("edtGridCampoSolido48");
    obj.edtGridCampoSolido48:setAlign("top");
    obj.edtGridCampoSolido48:setField("sabTotal");
    obj.edtGridCampoSolido48:setFontSize(15);
    obj.edtGridCampoSolido48:setTransparent(true);
    obj.edtGridCampoSolido48:setVertTextAlign("center");
    obj.edtGridCampoSolido48:setType("number");
    obj.edtGridCampoSolido48:setReadOnly(true);
    obj.edtGridCampoSolido48:setHeight(30);
    obj.edtGridCampoSolido48:setWidth(195);

    obj.linGridCampoSolido48 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linGridCampoSolido48:setParent(obj.GridCampoSolido48);
    obj.linGridCampoSolido48:setName("linGridCampoSolido48");
    obj.linGridCampoSolido48:setAlign("top");
    obj.linGridCampoSolido48:setStrokeColor("#FFFFFF50");
    obj.linGridCampoSolido48:setStrokeSize(1);

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.perfilLayout);
    obj.flowLineBreak4:setLineSpacing(10);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.perfilLayout);
    obj.flowPart59:setHeight(2);
    obj.flowPart59:setMinScaledWidth(100);
    obj.flowPart59:setMaxScaledWidth(1600);
    obj.flowPart59:setName("flowPart59");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart59);
    obj.horzLine2:setStrokeColor("#FFFFFF50");
    obj.horzLine2:setStrokeSize(0.6);
    obj.horzLine2:setStrokeCap("round");
    obj.horzLine2:setScaleY(0.1);
    obj.horzLine2:setTop(1);
    obj.horzLine2:setName("horzLine2");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.perfilLayout);
    obj.flowLineBreak5:setLineSpacing(10);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.tabelaPontosBonus = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tabelaPontosBonus:setParent(obj.perfilLayout);
    obj.tabelaPontosBonus:setMinWidth(320);
    obj.tabelaPontosBonus:setMaxWidth(1600);
    obj.tabelaPontosBonus:setName("tabelaPontosBonus");
    obj.tabelaPontosBonus:setAvoidScale(true);
    obj.tabelaPontosBonus:setAutoHeight(true);
    obj.tabelaPontosBonus:setVertAlign("leading");
    obj.tabelaPontosBonus:setMaxControlsPerLine(2);
    obj.tabelaPontosBonus:setHorzAlign("center");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.tabelaPontosBonus);
    obj.flowPart60:setHeight(20);
    obj.flowPart60:setMinWidth(60);
    obj.flowPart60:setMaxWidth(120);
    obj.flowPart60:setName("flowPart60");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart60);
    obj.label15:setText("Percepção");
    obj.label15:setAlign("left");
    obj.label15:setField("");
    obj.label15:setFontSize(18);
    obj.label15:setVertTextAlign("center");
    obj.label15:setHorzTextAlign("leading");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setName("label15");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.tabelaPontosBonus);
    obj.flowPart61:setHeight(10);
    obj.flowPart61:setMinWidth(60);
    obj.flowPart61:setMaxWidth(85);
    obj.flowPart61:setName("flowPart61");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart61);
    obj.label16:setText("TOTAL");
    obj.label16:setAlign("left");
    obj.label16:setField("");
    obj.label16:setFontSize(12);
    obj.label16:setVertTextAlign("center");
    obj.label16:setHorzTextAlign("leading");
    obj.label16:setName("label16");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.tabelaPontosBonus);
    obj.flowPart62:setHeight(20);
    obj.flowPart62:setMinWidth(60);
    obj.flowPart62:setMaxWidth(120);
    obj.flowPart62:setName("flowPart62");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart62);
    obj.label17:setText("Intimidação");
    obj.label17:setAlign("left");
    obj.label17:setField("");
    obj.label17:setFontSize(18);
    obj.label17:setVertTextAlign("center");
    obj.label17:setHorzTextAlign("leading");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setName("label17");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.tabelaPontosBonus);
    obj.flowPart63:setHeight(10);
    obj.flowPart63:setMinWidth(60);
    obj.flowPart63:setMaxWidth(85);
    obj.flowPart63:setName("flowPart63");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart63);
    obj.label18:setText("TOTAL");
    obj.label18:setAlign("left");
    obj.label18:setField("");
    obj.label18:setFontSize(12);
    obj.label18:setVertTextAlign("center");
    obj.label18:setHorzTextAlign("leading");
    obj.label18:setName("label18");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setFields({'conNivel', 'conClasse', 'conRaca', 'conTreino','conOutros', 'conBase', 'conEquip', 'conTotal',
                       'forNivel', 'forClasse', 'forRaca', 'forTreino','forOutros', 'forBase', 'forEquip', 'forTotal',
                       'dexNivel', 'dexClasse', 'dexRaca', 'dexTreino','dexOutros', 'dexBase', 'dexEquip', 'dexTotal',
                       'carNivel', 'carClasse', 'carRaca', 'carTreino','carOutros', 'carBase', 'carEquip', 'carTotal',
                       'intNivel', 'intClasse', 'intRaca', 'intTreino','intOutros', 'intBase', 'intEquip', 'intTotal',
                       'sabNivel', 'sabClasse', 'sabRaca', 'sabTreino','sabOutros', 'sabBase', 'sabEquip', 'sabTotal'});
    obj.dataLink1:setName("dataLink1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Habilidades");
    obj.tab2:setName("tab2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab2);
    obj.layout1:setWidth(700);
    obj.layout1:setHeight(400);
    obj.layout1:setName("layout1");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout1);
    obj.label19:setText("Habilidades");
    obj.label19:setName("label19");
    obj.label19:setAlign("client");
    obj.label19:setHorzTextAlign("trailing");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, _, _, _)
            -- ###### SOMA CONSTITUIÇÃO ######
            
                        sheet.conBase = (tonumber(sheet.conNivel) or 0) +
                        (tonumber(sheet.conClasse) or 0) +
                        (tonumber(sheet.conRaca) or 0) +
                        (tonumber(sheet.conTreino) or 0) +
                        (tonumber(sheet.conOutros) or 0);
            
                        sheet.conTotal = (tonumber(sheet.conBase) or 0) +
                        (tonumber(sheet.conEquip) or 0);
            
            
                        -- ###### SOMA FORÇA ######
            
                        sheet.forBase = (tonumber(sheet.forNivel) or 0) +
                        (tonumber(sheet.forClasse) or 0) +
                        (tonumber(sheet.forRaca) or 0) +
                        (tonumber(sheet.forTreino) or 0) +
                        (tonumber(sheet.forOutros) or 0);
            
                        sheet.forTotal = (tonumber(sheet.forBase) or 0) +
                        (tonumber(sheet.forEquip) or 0);
            
                        -- ###### SOMA DESTREZA ######
            
                        sheet.dexBase = (tonumber(sheet.dexNivel) or 0) +
                        (tonumber(sheet.dexClasse) or 0) +
                        (tonumber(sheet.dexRaca) or 0) +
                        (tonumber(sheet.dexTreino) or 0) +
                        (tonumber(sheet.dexOutros) or 0);
            
                        sheet.dexTotal = (tonumber(sheet.dexBase) or 0) +
                        (tonumber(sheet.dexEquip) or 0);
            
                        -- ###### SOMA CARISMA ######
            
                        sheet.carBase = (tonumber(sheet.carNivel) or 0) +
                        (tonumber(sheet.carClasse) or 0) +
                        (tonumber(sheet.carRaca) or 0) +
                        (tonumber(sheet.carTreino) or 0) +
                        (tonumber(sheet.carOutros) or 0);
            
                        sheet.carTotal = (tonumber(sheet.carBase) or 0) +
                        (tonumber(sheet.carEquip) or 0);
            
                        -- ###### SOMA INTELIGÊNCIA ######
            
                        sheet.intBase = (tonumber(sheet.intNivel) or 0) +
                        (tonumber(sheet.intClasse) or 0) +
                        (tonumber(sheet.intRaca) or 0) +
                        (tonumber(sheet.intTreino) or 0) +
                        (tonumber(sheet.intOutros) or 0);
            
                        sheet.intTotal = (tonumber(sheet.intBase) or 0) +
                        (tonumber(sheet.intEquip) or 0);
            
                        -- ###### SOMA SABEDORIA ######
            
                        sheet.sabBase = (tonumber(sheet.sabNivel) or 0) +
                        (tonumber(sheet.sabClasse) or 0) +
                        (tonumber(sheet.sabRaca) or 0) +
                        (tonumber(sheet.sabTreino) or 0) +
                        (tonumber(sheet.sabOutros) or 0);
            
                        sheet.sabTotal = (tonumber(sheet.sabBase) or 0) +
                        (tonumber(sheet.sabEquip) or 0);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.linUpperGridCampo1 ~= nil then self.linUpperGridCampo1:destroy(); self.linUpperGridCampo1 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.GridCampoSolido16 ~= nil then self.GridCampoSolido16:destroy(); self.GridCampoSolido16 = nil; end;
        if self.edtGridCampoSolido13 ~= nil then self.edtGridCampoSolido13:destroy(); self.edtGridCampoSolido13 = nil; end;
        if self.GridCampoSolido14 ~= nil then self.GridCampoSolido14:destroy(); self.GridCampoSolido14 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.linGridCampoSolido21 ~= nil then self.linGridCampoSolido21:destroy(); self.linGridCampoSolido21 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.linGridCampoSolido7 ~= nil then self.linGridCampoSolido7:destroy(); self.linGridCampoSolido7 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.GridCampoSolido30 ~= nil then self.GridCampoSolido30:destroy(); self.GridCampoSolido30 = nil; end;
        if self.linUpperGridCampo8 ~= nil then self.linUpperGridCampo8:destroy(); self.linUpperGridCampo8 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.linGridCampoSolido18 ~= nil then self.linGridCampoSolido18:destroy(); self.linGridCampoSolido18 = nil; end;
        if self.edtGridCampoSolido21 ~= nil then self.edtGridCampoSolido21:destroy(); self.edtGridCampoSolido21 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.linGridCampoSolido13 ~= nil then self.linGridCampoSolido13:destroy(); self.linGridCampoSolido13 = nil; end;
        if self.edtGridCampoSolido9 ~= nil then self.edtGridCampoSolido9:destroy(); self.edtGridCampoSolido9 = nil; end;
        if self.linGridCampoSolido24 ~= nil then self.linGridCampoSolido24:destroy(); self.linGridCampoSolido24 = nil; end;
        if self.linGridCampoSolido48 ~= nil then self.linGridCampoSolido48:destroy(); self.linGridCampoSolido48 = nil; end;
        if self.linUpperGridCampo9 ~= nil then self.linUpperGridCampo9:destroy(); self.linUpperGridCampo9 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.GridCampoSolido13 ~= nil then self.GridCampoSolido13:destroy(); self.GridCampoSolido13 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.GridCampoSolido37 ~= nil then self.GridCampoSolido37:destroy(); self.GridCampoSolido37 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.GridCampoSolido47 ~= nil then self.GridCampoSolido47:destroy(); self.GridCampoSolido47 = nil; end;
        if self.GridCampoSolido5 ~= nil then self.GridCampoSolido5:destroy(); self.GridCampoSolido5 = nil; end;
        if self.edtGridCampoSolido20 ~= nil then self.edtGridCampoSolido20:destroy(); self.edtGridCampoSolido20 = nil; end;
        if self.linUpperGridCampo7 ~= nil then self.linUpperGridCampo7:destroy(); self.linUpperGridCampo7 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.GridCampoSolido22 ~= nil then self.GridCampoSolido22:destroy(); self.GridCampoSolido22 = nil; end;
        if self.topoAtributos ~= nil then self.topoAtributos:destroy(); self.topoAtributos = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edtGridCampoSolido38 ~= nil then self.edtGridCampoSolido38:destroy(); self.edtGridCampoSolido38 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.labUpperGridCampo11 ~= nil then self.labUpperGridCampo11:destroy(); self.labUpperGridCampo11 = nil; end;
        if self.GridCampoSolido11 ~= nil then self.GridCampoSolido11:destroy(); self.GridCampoSolido11 = nil; end;
        if self.GridCampoSolido33 ~= nil then self.GridCampoSolido33:destroy(); self.GridCampoSolido33 = nil; end;
        if self.linGridCampoSolido28 ~= nil then self.linGridCampoSolido28:destroy(); self.linGridCampoSolido28 = nil; end;
        if self.GridCampoSolido44 ~= nil then self.GridCampoSolido44:destroy(); self.GridCampoSolido44 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.GridCampoSolido26 ~= nil then self.GridCampoSolido26:destroy(); self.GridCampoSolido26 = nil; end;
        if self.linGridCampoSolido31 ~= nil then self.linGridCampoSolido31:destroy(); self.linGridCampoSolido31 = nil; end;
        if self.edtGridCampoSolido33 ~= nil then self.edtGridCampoSolido33:destroy(); self.edtGridCampoSolido33 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.linGridCampoSolido17 ~= nil then self.linGridCampoSolido17:destroy(); self.linGridCampoSolido17 = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.linGridCampoSolido30 ~= nil then self.linGridCampoSolido30:destroy(); self.linGridCampoSolido30 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.linGridCampoSolido25 ~= nil then self.linGridCampoSolido25:destroy(); self.linGridCampoSolido25 = nil; end;
        if self.linGridCampoSolido41 ~= nil then self.linGridCampoSolido41:destroy(); self.linGridCampoSolido41 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.edtGridCampoSolido31 ~= nil then self.edtGridCampoSolido31:destroy(); self.edtGridCampoSolido31 = nil; end;
        if self.labUpperGridCampo9 ~= nil then self.labUpperGridCampo9:destroy(); self.labUpperGridCampo9 = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.linGridCampoSolido8 ~= nil then self.linGridCampoSolido8:destroy(); self.linGridCampoSolido8 = nil; end;
        if self.edtGridCampoSolido29 ~= nil then self.edtGridCampoSolido29:destroy(); self.edtGridCampoSolido29 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.linGridCampoSolido2 ~= nil then self.linGridCampoSolido2:destroy(); self.linGridCampoSolido2 = nil; end;
        if self.linGridCampoSolido16 ~= nil then self.linGridCampoSolido16:destroy(); self.linGridCampoSolido16 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.GridCampoSolido45 ~= nil then self.GridCampoSolido45:destroy(); self.GridCampoSolido45 = nil; end;
        if self.linGridCampoSolido43 ~= nil then self.linGridCampoSolido43:destroy(); self.linGridCampoSolido43 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.edtGridCampoSolido45 ~= nil then self.edtGridCampoSolido45:destroy(); self.edtGridCampoSolido45 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.GridCampoSolido36 ~= nil then self.GridCampoSolido36:destroy(); self.GridCampoSolido36 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.edtUpperGridCampo9 ~= nil then self.edtUpperGridCampo9:destroy(); self.edtUpperGridCampo9 = nil; end;
        if self.edtGridCampoSolido47 ~= nil then self.edtGridCampoSolido47:destroy(); self.edtGridCampoSolido47 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.GridCampoSolido21 ~= nil then self.GridCampoSolido21:destroy(); self.GridCampoSolido21 = nil; end;
        if self.linGridCampoSolido5 ~= nil then self.linGridCampoSolido5:destroy(); self.linGridCampoSolido5 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.GridCampoSolido32 ~= nil then self.GridCampoSolido32:destroy(); self.GridCampoSolido32 = nil; end;
        if self.GridCampoSolido28 ~= nil then self.GridCampoSolido28:destroy(); self.GridCampoSolido28 = nil; end;
        if self.edtGridCampoSolido27 ~= nil then self.edtGridCampoSolido27:destroy(); self.edtGridCampoSolido27 = nil; end;
        if self.edtGridCampoSolido24 ~= nil then self.edtGridCampoSolido24:destroy(); self.edtGridCampoSolido24 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.linGridCampoSolido1 ~= nil then self.linGridCampoSolido1:destroy(); self.linGridCampoSolido1 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.GridCampoSolido1 ~= nil then self.GridCampoSolido1:destroy(); self.GridCampoSolido1 = nil; end;
        if self.edtGridCampoSolido25 ~= nil then self.edtGridCampoSolido25:destroy(); self.edtGridCampoSolido25 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.linGridCampoSolido46 ~= nil then self.linGridCampoSolido46:destroy(); self.linGridCampoSolido46 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.GridCampoSolido19 ~= nil then self.GridCampoSolido19:destroy(); self.GridCampoSolido19 = nil; end;
        if self.linGridCampoSolido11 ~= nil then self.linGridCampoSolido11:destroy(); self.linGridCampoSolido11 = nil; end;
        if self.linGridCampoSolido4 ~= nil then self.linGridCampoSolido4:destroy(); self.linGridCampoSolido4 = nil; end;
        if self.labUpperGridCampo10 ~= nil then self.labUpperGridCampo10:destroy(); self.labUpperGridCampo10 = nil; end;
        if self.edtGridCampoSolido46 ~= nil then self.edtGridCampoSolido46:destroy(); self.edtGridCampoSolido46 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.GridCampoSolido23 ~= nil then self.GridCampoSolido23:destroy(); self.GridCampoSolido23 = nil; end;
        if self.GridCampoSolido27 ~= nil then self.GridCampoSolido27:destroy(); self.GridCampoSolido27 = nil; end;
        if self.edtGridCampoSolido10 ~= nil then self.edtGridCampoSolido10:destroy(); self.edtGridCampoSolido10 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.GridCampoSolido35 ~= nil then self.GridCampoSolido35:destroy(); self.GridCampoSolido35 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.edtGridCampoSolido48 ~= nil then self.edtGridCampoSolido48:destroy(); self.edtGridCampoSolido48 = nil; end;
        if self.linGridCampoSolido22 ~= nil then self.linGridCampoSolido22:destroy(); self.linGridCampoSolido22 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.GridCampoSolido18 ~= nil then self.GridCampoSolido18:destroy(); self.GridCampoSolido18 = nil; end;
        if self.linGridCampoSolido20 ~= nil then self.linGridCampoSolido20:destroy(); self.linGridCampoSolido20 = nil; end;
        if self.GridCampoSolido17 ~= nil then self.GridCampoSolido17:destroy(); self.GridCampoSolido17 = nil; end;
        if self.GridCampoSolido34 ~= nil then self.GridCampoSolido34:destroy(); self.GridCampoSolido34 = nil; end;
        if self.edtGridCampoSolido5 ~= nil then self.edtGridCampoSolido5:destroy(); self.edtGridCampoSolido5 = nil; end;
        if self.linUpperGridCampo11 ~= nil then self.linUpperGridCampo11:destroy(); self.linUpperGridCampo11 = nil; end;
        if self.linGridCampoSolido34 ~= nil then self.linGridCampoSolido34:destroy(); self.linGridCampoSolido34 = nil; end;
        if self.edtGridCampoSolido19 ~= nil then self.edtGridCampoSolido19:destroy(); self.edtGridCampoSolido19 = nil; end;
        if self.GridCampoSolido10 ~= nil then self.GridCampoSolido10:destroy(); self.GridCampoSolido10 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.edtGridCampoSolido12 ~= nil then self.edtGridCampoSolido12:destroy(); self.edtGridCampoSolido12 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.GridCampoSolido29 ~= nil then self.GridCampoSolido29:destroy(); self.GridCampoSolido29 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.GridCampoSolido41 ~= nil then self.GridCampoSolido41:destroy(); self.GridCampoSolido41 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.linGridCampoSolido3 ~= nil then self.linGridCampoSolido3:destroy(); self.linGridCampoSolido3 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.edtGridCampoSolido4 ~= nil then self.edtGridCampoSolido4:destroy(); self.edtGridCampoSolido4 = nil; end;
        if self.UpperGridCampo10 ~= nil then self.UpperGridCampo10:destroy(); self.UpperGridCampo10 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.edtGridCampoSolido16 ~= nil then self.edtGridCampoSolido16:destroy(); self.edtGridCampoSolido16 = nil; end;
        if self.tabelaDeAtributos ~= nil then self.tabelaDeAtributos:destroy(); self.tabelaDeAtributos = nil; end;
        if self.perfilLayout ~= nil then self.perfilLayout:destroy(); self.perfilLayout = nil; end;
        if self.UpperGridCampo11 ~= nil then self.UpperGridCampo11:destroy(); self.UpperGridCampo11 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.GridCampoSolido24 ~= nil then self.GridCampoSolido24:destroy(); self.GridCampoSolido24 = nil; end;
        if self.linGridCampoSolido15 ~= nil then self.linGridCampoSolido15:destroy(); self.linGridCampoSolido15 = nil; end;
        if self.linGridCampoSolido14 ~= nil then self.linGridCampoSolido14:destroy(); self.linGridCampoSolido14 = nil; end;
        if self.GridCampoSolido9 ~= nil then self.GridCampoSolido9:destroy(); self.GridCampoSolido9 = nil; end;
        if self.labUpperGridCampo12 ~= nil then self.labUpperGridCampo12:destroy(); self.labUpperGridCampo12 = nil; end;
        if self.linGridCampoSolido29 ~= nil then self.linGridCampoSolido29:destroy(); self.linGridCampoSolido29 = nil; end;
        if self.edtGridCampoSolido34 ~= nil then self.edtGridCampoSolido34:destroy(); self.edtGridCampoSolido34 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.GridCampoSolido2 ~= nil then self.GridCampoSolido2:destroy(); self.GridCampoSolido2 = nil; end;
        if self.edtGridCampoSolido17 ~= nil then self.edtGridCampoSolido17:destroy(); self.edtGridCampoSolido17 = nil; end;
        if self.linGridCampoSolido6 ~= nil then self.linGridCampoSolido6:destroy(); self.linGridCampoSolido6 = nil; end;
        if self.GridCampoSolido40 ~= nil then self.GridCampoSolido40:destroy(); self.GridCampoSolido40 = nil; end;
        if self.edtGridCampoSolido11 ~= nil then self.edtGridCampoSolido11:destroy(); self.edtGridCampoSolido11 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.GridCampoSolido43 ~= nil then self.GridCampoSolido43:destroy(); self.GridCampoSolido43 = nil; end;
        if self.tabelaPerfil ~= nil then self.tabelaPerfil:destroy(); self.tabelaPerfil = nil; end;
        if self.edtUpperGridCampo8 ~= nil then self.edtUpperGridCampo8:destroy(); self.edtUpperGridCampo8 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.edtGridCampoSolido22 ~= nil then self.edtGridCampoSolido22:destroy(); self.edtGridCampoSolido22 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.edtGridCampoSolido1 ~= nil then self.edtGridCampoSolido1:destroy(); self.edtGridCampoSolido1 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edtGridCampoSolido3 ~= nil then self.edtGridCampoSolido3:destroy(); self.edtGridCampoSolido3 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.linGridCampoSolido32 ~= nil then self.linGridCampoSolido32:destroy(); self.linGridCampoSolido32 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.GridCampoSolido7 ~= nil then self.GridCampoSolido7:destroy(); self.GridCampoSolido7 = nil; end;
        if self.linGridCampoSolido26 ~= nil then self.linGridCampoSolido26:destroy(); self.linGridCampoSolido26 = nil; end;
        if self.GridCampoSolido38 ~= nil then self.GridCampoSolido38:destroy(); self.GridCampoSolido38 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.GridCampoSolido42 ~= nil then self.GridCampoSolido42:destroy(); self.GridCampoSolido42 = nil; end;
        if self.linGridCampoSolido27 ~= nil then self.linGridCampoSolido27:destroy(); self.linGridCampoSolido27 = nil; end;
        if self.GridCampoSolido6 ~= nil then self.GridCampoSolido6:destroy(); self.GridCampoSolido6 = nil; end;
        if self.linGridCampoSolido23 ~= nil then self.linGridCampoSolido23:destroy(); self.linGridCampoSolido23 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.GridCampoSolido20 ~= nil then self.GridCampoSolido20:destroy(); self.GridCampoSolido20 = nil; end;
        if self.linGridCampoSolido44 ~= nil then self.linGridCampoSolido44:destroy(); self.linGridCampoSolido44 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.UpperGridCampo8 ~= nil then self.UpperGridCampo8:destroy(); self.UpperGridCampo8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.labUpperGridCampo8 ~= nil then self.labUpperGridCampo8:destroy(); self.labUpperGridCampo8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.linUpperGridCampo12 ~= nil then self.linUpperGridCampo12:destroy(); self.linUpperGridCampo12 = nil; end;
        if self.UpperGridCampo7 ~= nil then self.UpperGridCampo7:destroy(); self.UpperGridCampo7 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.edtGridCampoSolido42 ~= nil then self.edtGridCampoSolido42:destroy(); self.edtGridCampoSolido42 = nil; end;
        if self.edtGridCampoSolido35 ~= nil then self.edtGridCampoSolido35:destroy(); self.edtGridCampoSolido35 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.GridCampoSolido46 ~= nil then self.GridCampoSolido46:destroy(); self.GridCampoSolido46 = nil; end;
        if self.GridCampoSolido8 ~= nil then self.GridCampoSolido8:destroy(); self.GridCampoSolido8 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.linGridCampoSolido40 ~= nil then self.linGridCampoSolido40:destroy(); self.linGridCampoSolido40 = nil; end;
        if self.edtGridCampoSolido43 ~= nil then self.edtGridCampoSolido43:destroy(); self.edtGridCampoSolido43 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.GridCampoSolido31 ~= nil then self.GridCampoSolido31:destroy(); self.GridCampoSolido31 = nil; end;
        if self.edtUpperGridCampo11 ~= nil then self.edtUpperGridCampo11:destroy(); self.edtUpperGridCampo11 = nil; end;
        if self.edtGridCampoSolido18 ~= nil then self.edtGridCampoSolido18:destroy(); self.edtGridCampoSolido18 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.linGridCampoSolido47 ~= nil then self.linGridCampoSolido47:destroy(); self.linGridCampoSolido47 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edtGridCampoSolido40 ~= nil then self.edtGridCampoSolido40:destroy(); self.edtGridCampoSolido40 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.GridCampoSolido4 ~= nil then self.GridCampoSolido4:destroy(); self.GridCampoSolido4 = nil; end;
        if self.edtGridCampoSolido7 ~= nil then self.edtGridCampoSolido7:destroy(); self.edtGridCampoSolido7 = nil; end;
        if self.labUpperGridCampo7 ~= nil then self.labUpperGridCampo7:destroy(); self.labUpperGridCampo7 = nil; end;
        if self.tabelaPontosBonus ~= nil then self.tabelaPontosBonus:destroy(); self.tabelaPontosBonus = nil; end;
        if self.edtGridCampoSolido23 ~= nil then self.edtGridCampoSolido23:destroy(); self.edtGridCampoSolido23 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.linGridCampoSolido10 ~= nil then self.linGridCampoSolido10:destroy(); self.linGridCampoSolido10 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.linGridCampoSolido33 ~= nil then self.linGridCampoSolido33:destroy(); self.linGridCampoSolido33 = nil; end;
        if self.edtGridCampoSolido41 ~= nil then self.edtGridCampoSolido41:destroy(); self.edtGridCampoSolido41 = nil; end;
        if self.edtGridCampoSolido39 ~= nil then self.edtGridCampoSolido39:destroy(); self.edtGridCampoSolido39 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.GridCampoSolido3 ~= nil then self.GridCampoSolido3:destroy(); self.GridCampoSolido3 = nil; end;
        if self.linGridCampoSolido19 ~= nil then self.linGridCampoSolido19:destroy(); self.linGridCampoSolido19 = nil; end;
        if self.linGridCampoSolido45 ~= nil then self.linGridCampoSolido45:destroy(); self.linGridCampoSolido45 = nil; end;
        if self.edtUpperGridCampo10 ~= nil then self.edtUpperGridCampo10:destroy(); self.edtUpperGridCampo10 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.linGridCampoSolido42 ~= nil then self.linGridCampoSolido42:destroy(); self.linGridCampoSolido42 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edtUpperGridCampo7 ~= nil then self.edtUpperGridCampo7:destroy(); self.edtUpperGridCampo7 = nil; end;
        if self.edtGridCampoSolido26 ~= nil then self.edtGridCampoSolido26:destroy(); self.edtGridCampoSolido26 = nil; end;
        if self.GridCampoSolido48 ~= nil then self.GridCampoSolido48:destroy(); self.GridCampoSolido48 = nil; end;
        if self.edtGridCampoSolido15 ~= nil then self.edtGridCampoSolido15:destroy(); self.edtGridCampoSolido15 = nil; end;
        if self.linGridCampoSolido9 ~= nil then self.linGridCampoSolido9:destroy(); self.linGridCampoSolido9 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.GridCampoSolido12 ~= nil then self.GridCampoSolido12:destroy(); self.GridCampoSolido12 = nil; end;
        if self.linGridCampoSolido12 ~= nil then self.linGridCampoSolido12:destroy(); self.linGridCampoSolido12 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.edtGridCampoSolido8 ~= nil then self.edtGridCampoSolido8:destroy(); self.edtGridCampoSolido8 = nil; end;
        if self.edtGridCampoSolido2 ~= nil then self.edtGridCampoSolido2:destroy(); self.edtGridCampoSolido2 = nil; end;
        if self.linGridCampoSolido39 ~= nil then self.linGridCampoSolido39:destroy(); self.linGridCampoSolido39 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.linUpperGridCampo10 ~= nil then self.linUpperGridCampo10:destroy(); self.linUpperGridCampo10 = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.GridCampoSolido15 ~= nil then self.GridCampoSolido15:destroy(); self.GridCampoSolido15 = nil; end;
        if self.linGridCampoSolido35 ~= nil then self.linGridCampoSolido35:destroy(); self.linGridCampoSolido35 = nil; end;
        if self.UpperGridCampo12 ~= nil then self.UpperGridCampo12:destroy(); self.UpperGridCampo12 = nil; end;
        if self.linGridCampoSolido36 ~= nil then self.linGridCampoSolido36:destroy(); self.linGridCampoSolido36 = nil; end;
        if self.edtGridCampoSolido32 ~= nil then self.edtGridCampoSolido32:destroy(); self.edtGridCampoSolido32 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.edtGridCampoSolido28 ~= nil then self.edtGridCampoSolido28:destroy(); self.edtGridCampoSolido28 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.edtGridCampoSolido44 ~= nil then self.edtGridCampoSolido44:destroy(); self.edtGridCampoSolido44 = nil; end;
        if self.GridCampoSolido39 ~= nil then self.GridCampoSolido39:destroy(); self.GridCampoSolido39 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.edtGridCampoSolido6 ~= nil then self.edtGridCampoSolido6:destroy(); self.edtGridCampoSolido6 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.UpperGridCampo9 ~= nil then self.UpperGridCampo9:destroy(); self.UpperGridCampo9 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.GridCampoSolido25 ~= nil then self.GridCampoSolido25:destroy(); self.GridCampoSolido25 = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.edtGridCampoSolido37 ~= nil then self.edtGridCampoSolido37:destroy(); self.edtGridCampoSolido37 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edtGridCampoSolido30 ~= nil then self.edtGridCampoSolido30:destroy(); self.edtGridCampoSolido30 = nil; end;
        if self.edtGridCampoSolido36 ~= nil then self.edtGridCampoSolido36:destroy(); self.edtGridCampoSolido36 = nil; end;
        if self.linGridCampoSolido37 ~= nil then self.linGridCampoSolido37:destroy(); self.linGridCampoSolido37 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.linGridCampoSolido38 ~= nil then self.linGridCampoSolido38:destroy(); self.linGridCampoSolido38 = nil; end;
        if self.edtUpperGridCampo12 ~= nil then self.edtUpperGridCampo12:destroy(); self.edtUpperGridCampo12 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.edtGridCampoSolido14 ~= nil then self.edtGridCampoSolido14:destroy(); self.edtGridCampoSolido14 = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaDePersonagem()
    local retObj;
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
