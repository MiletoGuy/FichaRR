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

    obj.fraFrenteLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraFrenteLayout:setParent(obj.scrollBox1);
    obj.fraFrenteLayout:setAlign("top");
    obj.fraFrenteLayout:setHeight(500);
    obj.fraFrenteLayout:setMargins({left=10, right=10, top=10});
    obj.fraFrenteLayout:setAutoHeight(true);
    obj.fraFrenteLayout:setHorzAlign("center");
    obj.fraFrenteLayout:setLineSpacing(2);
    obj.fraFrenteLayout:setName("fraFrenteLayout");
    obj.fraFrenteLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraFrenteLayout:setMinScaledWidth(300);

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.fraFrenteLayout);
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
    obj.flowLineBreak1:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak1:setLineSpacing(10);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.fraFrenteLayout);
    obj.flowPart1:setAdjustHeightToLine(true);
    obj.flowPart1:setHeight(1);
    obj.flowPart1:setMinScaledWidth(200);
    obj.flowPart1:setMaxScaledWidth(1600);
    obj.flowPart1:setName("flowPart1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart1);
    obj.horzLine1:setStrokeColor("#FFFFFF50");
    obj.horzLine1:setStrokeSize(7);
    obj.horzLine1:setStrokeCap("round");
    obj.horzLine1:setName("horzLine1");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.fraFrenteLayout);
    obj.flowLineBreak2:setLineSpacing(10);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.tabelaAtributos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tabelaAtributos:setParent(obj.fraFrenteLayout);
    obj.tabelaAtributos:setMinWidth(320);
    obj.tabelaAtributos:setMaxWidth(1600);
    obj.tabelaAtributos:setName("tabelaAtributos");
    obj.tabelaAtributos:setAvoidScale(true);
    obj.tabelaAtributos:setAutoHeight(true);
    obj.tabelaAtributos:setVertAlign("trailing");
    obj.tabelaAtributos:setMaxControlsPerLine(15);

    obj.GridCampoSolido1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido1:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido1:setHeight(50);
    obj.GridCampoSolido1:setMinScaledWidth(50);
    obj.GridCampoSolido1:setMinWidth(50);
    obj.GridCampoSolido1:setMaxWidth(100);
    obj.GridCampoSolido1:setMaxScaledWidth(100);
    obj.GridCampoSolido1:setAvoidScale(true);
    obj.GridCampoSolido1:setName("GridCampoSolido1");

    obj.edtGridCampoSolido1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.edtGridCampoSolido1:setName("edtGridCampoSolido1");
    obj.edtGridCampoSolido1:setAlign("top");
    obj.edtGridCampoSolido1:setField("");
    obj.edtGridCampoSolido1:setFontSize(13);
    obj.edtGridCampoSolido1:setTransparent(false);
    obj.edtGridCampoSolido1:setVertTextAlign("center");
    obj.edtGridCampoSolido1:setHeight(30);
    obj.edtGridCampoSolido1:setWidth(195);

    obj.labGridCampoSolido1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido1:setParent(obj.GridCampoSolido1);
    obj.labGridCampoSolido1:setName("labGridCampoSolido1");
    obj.labGridCampoSolido1:setAlign("top");
    obj.labGridCampoSolido1:setText("Constituição");
    obj.labGridCampoSolido1:setVertTextAlign("leading");
    obj.labGridCampoSolido1:setWordWrap(true);
    obj.labGridCampoSolido1:setTextTrimming("none");
    obj.labGridCampoSolido1:setFontSize(12);
    obj.labGridCampoSolido1:setFontColor("#D0D0D0");

    self.GridCampoSolido1:setHeight(self.edtGridCampoSolido1:getHeight() + self.labGridCampoSolido1:getHeight());


    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.tabelaAtributos);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setHeight(50);
    obj.flowPart2:setMinScaledWidth(15);
    obj.flowPart2:setMaxScaledWidth(50);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart2);
    obj.label1:setText("+");
    obj.label1:setFontSize(30);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setAlign("client");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setVertTextAlign("leading");
    obj.label1:setName("label1");

    obj.GridCampoSolido2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido2:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido2:setHeight(50);
    obj.GridCampoSolido2:setMinScaledWidth(50);
    obj.GridCampoSolido2:setMinWidth(50);
    obj.GridCampoSolido2:setMaxWidth(100);
    obj.GridCampoSolido2:setMaxScaledWidth(100);
    obj.GridCampoSolido2:setAvoidScale(true);
    obj.GridCampoSolido2:setName("GridCampoSolido2");

    obj.edtGridCampoSolido2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.edtGridCampoSolido2:setName("edtGridCampoSolido2");
    obj.edtGridCampoSolido2:setAlign("top");
    obj.edtGridCampoSolido2:setField("");
    obj.edtGridCampoSolido2:setFontSize(13);
    obj.edtGridCampoSolido2:setTransparent(false);
    obj.edtGridCampoSolido2:setVertTextAlign("center");
    obj.edtGridCampoSolido2:setHeight(30);
    obj.edtGridCampoSolido2:setWidth(195);

    obj.labGridCampoSolido2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido2:setParent(obj.GridCampoSolido2);
    obj.labGridCampoSolido2:setName("labGridCampoSolido2");
    obj.labGridCampoSolido2:setAlign("top");
    obj.labGridCampoSolido2:setText("");
    obj.labGridCampoSolido2:setVertTextAlign("leading");
    obj.labGridCampoSolido2:setWordWrap(true);
    obj.labGridCampoSolido2:setTextTrimming("none");
    obj.labGridCampoSolido2:setFontSize(12);
    obj.labGridCampoSolido2:setFontColor("#D0D0D0");

    self.GridCampoSolido2:setHeight(self.edtGridCampoSolido2:getHeight() + self.labGridCampoSolido2:getHeight());


    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.tabelaAtributos);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setHeight(50);
    obj.flowPart3:setMinScaledWidth(15);
    obj.flowPart3:setMaxScaledWidth(50);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart3);
    obj.label2:setText("+");
    obj.label2:setFontSize(30);
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setAlign("client");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setVertTextAlign("leading");
    obj.label2:setName("label2");

    obj.GridCampoSolido3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido3:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido3:setHeight(50);
    obj.GridCampoSolido3:setMinScaledWidth(50);
    obj.GridCampoSolido3:setMinWidth(50);
    obj.GridCampoSolido3:setMaxWidth(100);
    obj.GridCampoSolido3:setMaxScaledWidth(100);
    obj.GridCampoSolido3:setAvoidScale(true);
    obj.GridCampoSolido3:setName("GridCampoSolido3");

    obj.edtGridCampoSolido3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.edtGridCampoSolido3:setName("edtGridCampoSolido3");
    obj.edtGridCampoSolido3:setAlign("top");
    obj.edtGridCampoSolido3:setField("");
    obj.edtGridCampoSolido3:setFontSize(13);
    obj.edtGridCampoSolido3:setTransparent(false);
    obj.edtGridCampoSolido3:setVertTextAlign("center");
    obj.edtGridCampoSolido3:setHeight(30);
    obj.edtGridCampoSolido3:setWidth(195);

    obj.labGridCampoSolido3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido3:setParent(obj.GridCampoSolido3);
    obj.labGridCampoSolido3:setName("labGridCampoSolido3");
    obj.labGridCampoSolido3:setAlign("top");
    obj.labGridCampoSolido3:setText("");
    obj.labGridCampoSolido3:setVertTextAlign("leading");
    obj.labGridCampoSolido3:setWordWrap(true);
    obj.labGridCampoSolido3:setTextTrimming("none");
    obj.labGridCampoSolido3:setFontSize(12);
    obj.labGridCampoSolido3:setFontColor("#D0D0D0");

    self.GridCampoSolido3:setHeight(self.edtGridCampoSolido3:getHeight() + self.labGridCampoSolido3:getHeight());


    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.tabelaAtributos);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setHeight(50);
    obj.flowPart4:setMinScaledWidth(15);
    obj.flowPart4:setMaxScaledWidth(50);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart4);
    obj.label3:setText("+");
    obj.label3:setFontSize(30);
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setAlign("client");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setVertTextAlign("leading");
    obj.label3:setName("label3");

    obj.GridCampoSolido4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido4:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido4:setHeight(50);
    obj.GridCampoSolido4:setMinScaledWidth(50);
    obj.GridCampoSolido4:setMinWidth(50);
    obj.GridCampoSolido4:setMaxWidth(100);
    obj.GridCampoSolido4:setMaxScaledWidth(100);
    obj.GridCampoSolido4:setAvoidScale(true);
    obj.GridCampoSolido4:setName("GridCampoSolido4");

    obj.edtGridCampoSolido4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.edtGridCampoSolido4:setName("edtGridCampoSolido4");
    obj.edtGridCampoSolido4:setAlign("top");
    obj.edtGridCampoSolido4:setField("");
    obj.edtGridCampoSolido4:setFontSize(13);
    obj.edtGridCampoSolido4:setTransparent(false);
    obj.edtGridCampoSolido4:setVertTextAlign("center");
    obj.edtGridCampoSolido4:setHeight(30);
    obj.edtGridCampoSolido4:setWidth(195);

    obj.labGridCampoSolido4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido4:setParent(obj.GridCampoSolido4);
    obj.labGridCampoSolido4:setName("labGridCampoSolido4");
    obj.labGridCampoSolido4:setAlign("top");
    obj.labGridCampoSolido4:setText("");
    obj.labGridCampoSolido4:setVertTextAlign("leading");
    obj.labGridCampoSolido4:setWordWrap(true);
    obj.labGridCampoSolido4:setTextTrimming("none");
    obj.labGridCampoSolido4:setFontSize(12);
    obj.labGridCampoSolido4:setFontColor("#D0D0D0");

    self.GridCampoSolido4:setHeight(self.edtGridCampoSolido4:getHeight() + self.labGridCampoSolido4:getHeight());


    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.tabelaAtributos);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setHeight(50);
    obj.flowPart5:setMinScaledWidth(15);
    obj.flowPart5:setMaxScaledWidth(50);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart5);
    obj.label4:setText("+");
    obj.label4:setFontSize(30);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setAlign("client");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setVertTextAlign("leading");
    obj.label4:setName("label4");

    obj.GridCampoSolido5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido5:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido5:setHeight(50);
    obj.GridCampoSolido5:setMinScaledWidth(50);
    obj.GridCampoSolido5:setMinWidth(50);
    obj.GridCampoSolido5:setMaxWidth(100);
    obj.GridCampoSolido5:setMaxScaledWidth(100);
    obj.GridCampoSolido5:setAvoidScale(true);
    obj.GridCampoSolido5:setName("GridCampoSolido5");

    obj.edtGridCampoSolido5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.edtGridCampoSolido5:setName("edtGridCampoSolido5");
    obj.edtGridCampoSolido5:setAlign("top");
    obj.edtGridCampoSolido5:setField("");
    obj.edtGridCampoSolido5:setFontSize(13);
    obj.edtGridCampoSolido5:setTransparent(false);
    obj.edtGridCampoSolido5:setVertTextAlign("center");
    obj.edtGridCampoSolido5:setHeight(30);
    obj.edtGridCampoSolido5:setWidth(195);

    obj.labGridCampoSolido5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido5:setParent(obj.GridCampoSolido5);
    obj.labGridCampoSolido5:setName("labGridCampoSolido5");
    obj.labGridCampoSolido5:setAlign("top");
    obj.labGridCampoSolido5:setText("");
    obj.labGridCampoSolido5:setVertTextAlign("leading");
    obj.labGridCampoSolido5:setWordWrap(true);
    obj.labGridCampoSolido5:setTextTrimming("none");
    obj.labGridCampoSolido5:setFontSize(12);
    obj.labGridCampoSolido5:setFontColor("#D0D0D0");

    self.GridCampoSolido5:setHeight(self.edtGridCampoSolido5:getHeight() + self.labGridCampoSolido5:getHeight());


    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.tabelaAtributos);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setHeight(50);
    obj.flowPart6:setMinScaledWidth(15);
    obj.flowPart6:setMaxScaledWidth(50);

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart6);
    obj.label5:setText("=");
    obj.label5:setFontSize(30);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setAlign("client");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setVertTextAlign("leading");
    obj.label5:setName("label5");

    obj.GridCampoSolido6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido6:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido6:setHeight(50);
    obj.GridCampoSolido6:setMinScaledWidth(50);
    obj.GridCampoSolido6:setMinWidth(50);
    obj.GridCampoSolido6:setMaxWidth(100);
    obj.GridCampoSolido6:setMaxScaledWidth(100);
    obj.GridCampoSolido6:setAvoidScale(true);
    obj.GridCampoSolido6:setName("GridCampoSolido6");

    obj.edtGridCampoSolido6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.edtGridCampoSolido6:setName("edtGridCampoSolido6");
    obj.edtGridCampoSolido6:setAlign("top");
    obj.edtGridCampoSolido6:setField("");
    obj.edtGridCampoSolido6:setFontSize(13);
    obj.edtGridCampoSolido6:setTransparent(false);
    obj.edtGridCampoSolido6:setVertTextAlign("center");
    obj.edtGridCampoSolido6:setHeight(30);
    obj.edtGridCampoSolido6:setWidth(195);

    obj.labGridCampoSolido6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido6:setParent(obj.GridCampoSolido6);
    obj.labGridCampoSolido6:setName("labGridCampoSolido6");
    obj.labGridCampoSolido6:setAlign("top");
    obj.labGridCampoSolido6:setText("");
    obj.labGridCampoSolido6:setVertTextAlign("leading");
    obj.labGridCampoSolido6:setWordWrap(true);
    obj.labGridCampoSolido6:setTextTrimming("none");
    obj.labGridCampoSolido6:setFontSize(12);
    obj.labGridCampoSolido6:setFontColor("#D0D0D0");

    self.GridCampoSolido6:setHeight(self.edtGridCampoSolido6:getHeight() + self.labGridCampoSolido6:getHeight());


    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.tabelaAtributos);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setHeight(50);
    obj.flowPart7:setMinScaledWidth(15);
    obj.flowPart7:setMaxScaledWidth(50);

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart7);
    obj.label6:setText("+");
    obj.label6:setFontSize(30);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setAlign("client");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setVertTextAlign("leading");
    obj.label6:setName("label6");

    obj.GridCampoSolido7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido7:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido7:setHeight(50);
    obj.GridCampoSolido7:setMinScaledWidth(50);
    obj.GridCampoSolido7:setMinWidth(50);
    obj.GridCampoSolido7:setMaxWidth(100);
    obj.GridCampoSolido7:setMaxScaledWidth(100);
    obj.GridCampoSolido7:setAvoidScale(true);
    obj.GridCampoSolido7:setName("GridCampoSolido7");

    obj.edtGridCampoSolido7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido7:setParent(obj.GridCampoSolido7);
    obj.edtGridCampoSolido7:setName("edtGridCampoSolido7");
    obj.edtGridCampoSolido7:setAlign("top");
    obj.edtGridCampoSolido7:setField("");
    obj.edtGridCampoSolido7:setFontSize(13);
    obj.edtGridCampoSolido7:setTransparent(false);
    obj.edtGridCampoSolido7:setVertTextAlign("center");
    obj.edtGridCampoSolido7:setHeight(30);
    obj.edtGridCampoSolido7:setWidth(195);

    obj.labGridCampoSolido7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido7:setParent(obj.GridCampoSolido7);
    obj.labGridCampoSolido7:setName("labGridCampoSolido7");
    obj.labGridCampoSolido7:setAlign("top");
    obj.labGridCampoSolido7:setText("");
    obj.labGridCampoSolido7:setVertTextAlign("leading");
    obj.labGridCampoSolido7:setWordWrap(true);
    obj.labGridCampoSolido7:setTextTrimming("none");
    obj.labGridCampoSolido7:setFontSize(12);
    obj.labGridCampoSolido7:setFontColor("#D0D0D0");

    self.GridCampoSolido7:setHeight(self.edtGridCampoSolido7:getHeight() + self.labGridCampoSolido7:getHeight());


    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.tabelaAtributos);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setHeight(50);
    obj.flowPart8:setMinScaledWidth(15);
    obj.flowPart8:setMaxScaledWidth(50);

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart8);
    obj.label7:setText("=");
    obj.label7:setFontSize(30);
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setAlign("client");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setVertTextAlign("leading");
    obj.label7:setName("label7");

    obj.GridCampoSolido8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido8:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido8:setHeight(50);
    obj.GridCampoSolido8:setMinScaledWidth(50);
    obj.GridCampoSolido8:setMinWidth(50);
    obj.GridCampoSolido8:setMaxWidth(100);
    obj.GridCampoSolido8:setMaxScaledWidth(100);
    obj.GridCampoSolido8:setAvoidScale(true);
    obj.GridCampoSolido8:setName("GridCampoSolido8");

    obj.edtGridCampoSolido8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido8:setParent(obj.GridCampoSolido8);
    obj.edtGridCampoSolido8:setName("edtGridCampoSolido8");
    obj.edtGridCampoSolido8:setAlign("top");
    obj.edtGridCampoSolido8:setField("");
    obj.edtGridCampoSolido8:setFontSize(13);
    obj.edtGridCampoSolido8:setTransparent(false);
    obj.edtGridCampoSolido8:setVertTextAlign("center");
    obj.edtGridCampoSolido8:setHeight(30);
    obj.edtGridCampoSolido8:setWidth(195);

    obj.labGridCampoSolido8 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido8:setParent(obj.GridCampoSolido8);
    obj.labGridCampoSolido8:setName("labGridCampoSolido8");
    obj.labGridCampoSolido8:setAlign("top");
    obj.labGridCampoSolido8:setText("");
    obj.labGridCampoSolido8:setVertTextAlign("leading");
    obj.labGridCampoSolido8:setWordWrap(true);
    obj.labGridCampoSolido8:setTextTrimming("none");
    obj.labGridCampoSolido8:setFontSize(12);
    obj.labGridCampoSolido8:setFontColor("#D0D0D0");

    self.GridCampoSolido8:setHeight(self.edtGridCampoSolido8:getHeight() + self.labGridCampoSolido8:getHeight());


    obj.GridCampoSolido9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido9:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido9:setHeight(50);
    obj.GridCampoSolido9:setMinScaledWidth(50);
    obj.GridCampoSolido9:setMinWidth(50);
    obj.GridCampoSolido9:setMaxWidth(100);
    obj.GridCampoSolido9:setMaxScaledWidth(100);
    obj.GridCampoSolido9:setAvoidScale(true);
    obj.GridCampoSolido9:setName("GridCampoSolido9");

    obj.edtGridCampoSolido9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido9:setParent(obj.GridCampoSolido9);
    obj.edtGridCampoSolido9:setName("edtGridCampoSolido9");
    obj.edtGridCampoSolido9:setAlign("top");
    obj.edtGridCampoSolido9:setField("");
    obj.edtGridCampoSolido9:setFontSize(13);
    obj.edtGridCampoSolido9:setTransparent(false);
    obj.edtGridCampoSolido9:setVertTextAlign("center");
    obj.edtGridCampoSolido9:setHeight(30);
    obj.edtGridCampoSolido9:setWidth(195);

    obj.labGridCampoSolido9 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido9:setParent(obj.GridCampoSolido9);
    obj.labGridCampoSolido9:setName("labGridCampoSolido9");
    obj.labGridCampoSolido9:setAlign("top");
    obj.labGridCampoSolido9:setText("Força");
    obj.labGridCampoSolido9:setVertTextAlign("leading");
    obj.labGridCampoSolido9:setWordWrap(true);
    obj.labGridCampoSolido9:setTextTrimming("none");
    obj.labGridCampoSolido9:setFontSize(12);
    obj.labGridCampoSolido9:setFontColor("#D0D0D0");

    self.GridCampoSolido9:setHeight(self.edtGridCampoSolido9:getHeight() + self.labGridCampoSolido9:getHeight());


    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.tabelaAtributos);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setHeight(50);
    obj.flowPart9:setMinScaledWidth(15);
    obj.flowPart9:setMaxScaledWidth(50);

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart9);
    obj.label8:setText("+");
    obj.label8:setFontSize(30);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setAlign("client");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setVertTextAlign("leading");
    obj.label8:setName("label8");

    obj.GridCampoSolido10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido10:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido10:setHeight(50);
    obj.GridCampoSolido10:setMinScaledWidth(50);
    obj.GridCampoSolido10:setMinWidth(50);
    obj.GridCampoSolido10:setMaxWidth(100);
    obj.GridCampoSolido10:setMaxScaledWidth(100);
    obj.GridCampoSolido10:setAvoidScale(true);
    obj.GridCampoSolido10:setName("GridCampoSolido10");

    obj.edtGridCampoSolido10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido10:setParent(obj.GridCampoSolido10);
    obj.edtGridCampoSolido10:setName("edtGridCampoSolido10");
    obj.edtGridCampoSolido10:setAlign("top");
    obj.edtGridCampoSolido10:setField("");
    obj.edtGridCampoSolido10:setFontSize(13);
    obj.edtGridCampoSolido10:setTransparent(false);
    obj.edtGridCampoSolido10:setVertTextAlign("center");
    obj.edtGridCampoSolido10:setHeight(30);
    obj.edtGridCampoSolido10:setWidth(195);

    obj.labGridCampoSolido10 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido10:setParent(obj.GridCampoSolido10);
    obj.labGridCampoSolido10:setName("labGridCampoSolido10");
    obj.labGridCampoSolido10:setAlign("top");
    obj.labGridCampoSolido10:setText("");
    obj.labGridCampoSolido10:setVertTextAlign("leading");
    obj.labGridCampoSolido10:setWordWrap(true);
    obj.labGridCampoSolido10:setTextTrimming("none");
    obj.labGridCampoSolido10:setFontSize(12);
    obj.labGridCampoSolido10:setFontColor("#D0D0D0");

    self.GridCampoSolido10:setHeight(self.edtGridCampoSolido10:getHeight() + self.labGridCampoSolido10:getHeight());


    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.tabelaAtributos);
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setHeight(50);
    obj.flowPart10:setMinScaledWidth(15);
    obj.flowPart10:setMaxScaledWidth(50);

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart10);
    obj.label9:setText("+");
    obj.label9:setFontSize(30);
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setAlign("client");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setVertTextAlign("leading");
    obj.label9:setName("label9");

    obj.GridCampoSolido11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido11:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido11:setHeight(50);
    obj.GridCampoSolido11:setMinScaledWidth(50);
    obj.GridCampoSolido11:setMinWidth(50);
    obj.GridCampoSolido11:setMaxWidth(100);
    obj.GridCampoSolido11:setMaxScaledWidth(100);
    obj.GridCampoSolido11:setAvoidScale(true);
    obj.GridCampoSolido11:setName("GridCampoSolido11");

    obj.edtGridCampoSolido11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido11:setParent(obj.GridCampoSolido11);
    obj.edtGridCampoSolido11:setName("edtGridCampoSolido11");
    obj.edtGridCampoSolido11:setAlign("top");
    obj.edtGridCampoSolido11:setField("");
    obj.edtGridCampoSolido11:setFontSize(13);
    obj.edtGridCampoSolido11:setTransparent(false);
    obj.edtGridCampoSolido11:setVertTextAlign("center");
    obj.edtGridCampoSolido11:setHeight(30);
    obj.edtGridCampoSolido11:setWidth(195);

    obj.labGridCampoSolido11 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido11:setParent(obj.GridCampoSolido11);
    obj.labGridCampoSolido11:setName("labGridCampoSolido11");
    obj.labGridCampoSolido11:setAlign("top");
    obj.labGridCampoSolido11:setText("");
    obj.labGridCampoSolido11:setVertTextAlign("leading");
    obj.labGridCampoSolido11:setWordWrap(true);
    obj.labGridCampoSolido11:setTextTrimming("none");
    obj.labGridCampoSolido11:setFontSize(12);
    obj.labGridCampoSolido11:setFontColor("#D0D0D0");

    self.GridCampoSolido11:setHeight(self.edtGridCampoSolido11:getHeight() + self.labGridCampoSolido11:getHeight());


    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.tabelaAtributos);
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setHeight(50);
    obj.flowPart11:setMinScaledWidth(15);
    obj.flowPart11:setMaxScaledWidth(50);

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart11);
    obj.label10:setText("+");
    obj.label10:setFontSize(30);
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setAlign("client");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setVertTextAlign("leading");
    obj.label10:setName("label10");

    obj.GridCampoSolido12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido12:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido12:setHeight(50);
    obj.GridCampoSolido12:setMinScaledWidth(50);
    obj.GridCampoSolido12:setMinWidth(50);
    obj.GridCampoSolido12:setMaxWidth(100);
    obj.GridCampoSolido12:setMaxScaledWidth(100);
    obj.GridCampoSolido12:setAvoidScale(true);
    obj.GridCampoSolido12:setName("GridCampoSolido12");

    obj.edtGridCampoSolido12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido12:setParent(obj.GridCampoSolido12);
    obj.edtGridCampoSolido12:setName("edtGridCampoSolido12");
    obj.edtGridCampoSolido12:setAlign("top");
    obj.edtGridCampoSolido12:setField("");
    obj.edtGridCampoSolido12:setFontSize(13);
    obj.edtGridCampoSolido12:setTransparent(false);
    obj.edtGridCampoSolido12:setVertTextAlign("center");
    obj.edtGridCampoSolido12:setHeight(30);
    obj.edtGridCampoSolido12:setWidth(195);

    obj.labGridCampoSolido12 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido12:setParent(obj.GridCampoSolido12);
    obj.labGridCampoSolido12:setName("labGridCampoSolido12");
    obj.labGridCampoSolido12:setAlign("top");
    obj.labGridCampoSolido12:setText("");
    obj.labGridCampoSolido12:setVertTextAlign("leading");
    obj.labGridCampoSolido12:setWordWrap(true);
    obj.labGridCampoSolido12:setTextTrimming("none");
    obj.labGridCampoSolido12:setFontSize(12);
    obj.labGridCampoSolido12:setFontColor("#D0D0D0");

    self.GridCampoSolido12:setHeight(self.edtGridCampoSolido12:getHeight() + self.labGridCampoSolido12:getHeight());


    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.tabelaAtributos);
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setHeight(50);
    obj.flowPart12:setMinScaledWidth(15);
    obj.flowPart12:setMaxScaledWidth(50);

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart12);
    obj.label11:setText("+");
    obj.label11:setFontSize(30);
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setAlign("client");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setVertTextAlign("leading");
    obj.label11:setName("label11");

    obj.GridCampoSolido13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido13:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido13:setHeight(50);
    obj.GridCampoSolido13:setMinScaledWidth(50);
    obj.GridCampoSolido13:setMinWidth(50);
    obj.GridCampoSolido13:setMaxWidth(100);
    obj.GridCampoSolido13:setMaxScaledWidth(100);
    obj.GridCampoSolido13:setAvoidScale(true);
    obj.GridCampoSolido13:setName("GridCampoSolido13");

    obj.edtGridCampoSolido13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido13:setParent(obj.GridCampoSolido13);
    obj.edtGridCampoSolido13:setName("edtGridCampoSolido13");
    obj.edtGridCampoSolido13:setAlign("top");
    obj.edtGridCampoSolido13:setField("");
    obj.edtGridCampoSolido13:setFontSize(13);
    obj.edtGridCampoSolido13:setTransparent(false);
    obj.edtGridCampoSolido13:setVertTextAlign("center");
    obj.edtGridCampoSolido13:setHeight(30);
    obj.edtGridCampoSolido13:setWidth(195);

    obj.labGridCampoSolido13 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido13:setParent(obj.GridCampoSolido13);
    obj.labGridCampoSolido13:setName("labGridCampoSolido13");
    obj.labGridCampoSolido13:setAlign("top");
    obj.labGridCampoSolido13:setText("");
    obj.labGridCampoSolido13:setVertTextAlign("leading");
    obj.labGridCampoSolido13:setWordWrap(true);
    obj.labGridCampoSolido13:setTextTrimming("none");
    obj.labGridCampoSolido13:setFontSize(12);
    obj.labGridCampoSolido13:setFontColor("#D0D0D0");

    self.GridCampoSolido13:setHeight(self.edtGridCampoSolido13:getHeight() + self.labGridCampoSolido13:getHeight());


    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.tabelaAtributos);
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setHeight(50);
    obj.flowPart13:setMinScaledWidth(15);
    obj.flowPart13:setMaxScaledWidth(50);

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart13);
    obj.label12:setText("=");
    obj.label12:setFontSize(30);
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setAlign("client");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setVertTextAlign("leading");
    obj.label12:setName("label12");

    obj.GridCampoSolido14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido14:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido14:setHeight(50);
    obj.GridCampoSolido14:setMinScaledWidth(50);
    obj.GridCampoSolido14:setMinWidth(50);
    obj.GridCampoSolido14:setMaxWidth(100);
    obj.GridCampoSolido14:setMaxScaledWidth(100);
    obj.GridCampoSolido14:setAvoidScale(true);
    obj.GridCampoSolido14:setName("GridCampoSolido14");

    obj.edtGridCampoSolido14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido14:setParent(obj.GridCampoSolido14);
    obj.edtGridCampoSolido14:setName("edtGridCampoSolido14");
    obj.edtGridCampoSolido14:setAlign("top");
    obj.edtGridCampoSolido14:setField("");
    obj.edtGridCampoSolido14:setFontSize(13);
    obj.edtGridCampoSolido14:setTransparent(false);
    obj.edtGridCampoSolido14:setVertTextAlign("center");
    obj.edtGridCampoSolido14:setHeight(30);
    obj.edtGridCampoSolido14:setWidth(195);

    obj.labGridCampoSolido14 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido14:setParent(obj.GridCampoSolido14);
    obj.labGridCampoSolido14:setName("labGridCampoSolido14");
    obj.labGridCampoSolido14:setAlign("top");
    obj.labGridCampoSolido14:setText("");
    obj.labGridCampoSolido14:setVertTextAlign("leading");
    obj.labGridCampoSolido14:setWordWrap(true);
    obj.labGridCampoSolido14:setTextTrimming("none");
    obj.labGridCampoSolido14:setFontSize(12);
    obj.labGridCampoSolido14:setFontColor("#D0D0D0");

    self.GridCampoSolido14:setHeight(self.edtGridCampoSolido14:getHeight() + self.labGridCampoSolido14:getHeight());


    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.tabelaAtributos);
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setHeight(50);
    obj.flowPart14:setMinScaledWidth(15);
    obj.flowPart14:setMaxScaledWidth(50);

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart14);
    obj.label13:setText("+");
    obj.label13:setFontSize(30);
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setAlign("client");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setVertTextAlign("leading");
    obj.label13:setName("label13");

    obj.GridCampoSolido15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido15:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido15:setHeight(50);
    obj.GridCampoSolido15:setMinScaledWidth(50);
    obj.GridCampoSolido15:setMinWidth(50);
    obj.GridCampoSolido15:setMaxWidth(100);
    obj.GridCampoSolido15:setMaxScaledWidth(100);
    obj.GridCampoSolido15:setAvoidScale(true);
    obj.GridCampoSolido15:setName("GridCampoSolido15");

    obj.edtGridCampoSolido15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido15:setParent(obj.GridCampoSolido15);
    obj.edtGridCampoSolido15:setName("edtGridCampoSolido15");
    obj.edtGridCampoSolido15:setAlign("top");
    obj.edtGridCampoSolido15:setField("");
    obj.edtGridCampoSolido15:setFontSize(13);
    obj.edtGridCampoSolido15:setTransparent(false);
    obj.edtGridCampoSolido15:setVertTextAlign("center");
    obj.edtGridCampoSolido15:setHeight(30);
    obj.edtGridCampoSolido15:setWidth(195);

    obj.labGridCampoSolido15 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido15:setParent(obj.GridCampoSolido15);
    obj.labGridCampoSolido15:setName("labGridCampoSolido15");
    obj.labGridCampoSolido15:setAlign("top");
    obj.labGridCampoSolido15:setText("");
    obj.labGridCampoSolido15:setVertTextAlign("leading");
    obj.labGridCampoSolido15:setWordWrap(true);
    obj.labGridCampoSolido15:setTextTrimming("none");
    obj.labGridCampoSolido15:setFontSize(12);
    obj.labGridCampoSolido15:setFontColor("#D0D0D0");

    self.GridCampoSolido15:setHeight(self.edtGridCampoSolido15:getHeight() + self.labGridCampoSolido15:getHeight());


    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.tabelaAtributos);
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setHeight(50);
    obj.flowPart15:setMinScaledWidth(15);
    obj.flowPart15:setMaxScaledWidth(50);

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart15);
    obj.label14:setText("=");
    obj.label14:setFontSize(30);
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setAlign("client");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setVertTextAlign("leading");
    obj.label14:setName("label14");

    obj.GridCampoSolido16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.GridCampoSolido16:setParent(obj.tabelaAtributos);
    obj.GridCampoSolido16:setHeight(50);
    obj.GridCampoSolido16:setMinScaledWidth(50);
    obj.GridCampoSolido16:setMinWidth(50);
    obj.GridCampoSolido16:setMaxWidth(100);
    obj.GridCampoSolido16:setMaxScaledWidth(100);
    obj.GridCampoSolido16:setAvoidScale(true);
    obj.GridCampoSolido16:setName("GridCampoSolido16");

    obj.edtGridCampoSolido16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtGridCampoSolido16:setParent(obj.GridCampoSolido16);
    obj.edtGridCampoSolido16:setName("edtGridCampoSolido16");
    obj.edtGridCampoSolido16:setAlign("top");
    obj.edtGridCampoSolido16:setField("");
    obj.edtGridCampoSolido16:setFontSize(13);
    obj.edtGridCampoSolido16:setTransparent(false);
    obj.edtGridCampoSolido16:setVertTextAlign("center");
    obj.edtGridCampoSolido16:setHeight(30);
    obj.edtGridCampoSolido16:setWidth(195);

    obj.labGridCampoSolido16 = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridCampoSolido16:setParent(obj.GridCampoSolido16);
    obj.labGridCampoSolido16:setName("labGridCampoSolido16");
    obj.labGridCampoSolido16:setAlign("top");
    obj.labGridCampoSolido16:setText("");
    obj.labGridCampoSolido16:setVertTextAlign("leading");
    obj.labGridCampoSolido16:setWordWrap(true);
    obj.labGridCampoSolido16:setTextTrimming("none");
    obj.labGridCampoSolido16:setFontSize(12);
    obj.labGridCampoSolido16:setFontColor("#D0D0D0");

    self.GridCampoSolido16:setHeight(self.edtGridCampoSolido16:getHeight() + self.labGridCampoSolido16:getHeight());


    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Habilidades");
    obj.tab2:setName("tab2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab2);
    obj.layout1:setWidth(700);
    obj.layout1:setHeight(400);
    obj.layout1:setName("layout1");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout1);
    obj.label15:setText("Habilidades");
    obj.label15:setName("label15");
    obj.label15:setAlign("client");
    obj.label15:setHorzTextAlign("trailing");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.linUpperGridCampo1 ~= nil then self.linUpperGridCampo1:destroy(); self.linUpperGridCampo1 = nil; end;
        if self.edtGridCampoSolido4 ~= nil then self.edtGridCampoSolido4:destroy(); self.edtGridCampoSolido4 = nil; end;
        if self.UpperGridCampo10 ~= nil then self.UpperGridCampo10:destroy(); self.UpperGridCampo10 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.labUpperGridCampo2 ~= nil then self.labUpperGridCampo2:destroy(); self.labUpperGridCampo2 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.labGridCampoSolido9 ~= nil then self.labGridCampoSolido9:destroy(); self.labGridCampoSolido9 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.edtGridCampoSolido13 ~= nil then self.edtGridCampoSolido13:destroy(); self.edtGridCampoSolido13 = nil; end;
        if self.UpperGridCampo11 ~= nil then self.UpperGridCampo11:destroy(); self.UpperGridCampo11 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.GridCampoSolido16 ~= nil then self.GridCampoSolido16:destroy(); self.GridCampoSolido16 = nil; end;
        if self.edtGridCampoSolido16 ~= nil then self.edtGridCampoSolido16:destroy(); self.edtGridCampoSolido16 = nil; end;
        if self.labGridCampoSolido13 ~= nil then self.labGridCampoSolido13:destroy(); self.labGridCampoSolido13 = nil; end;
        if self.GridCampoSolido14 ~= nil then self.GridCampoSolido14:destroy(); self.GridCampoSolido14 = nil; end;
        if self.fraFrenteLayout ~= nil then self.fraFrenteLayout:destroy(); self.fraFrenteLayout = nil; end;
        if self.UpperGridCampo1 ~= nil then self.UpperGridCampo1:destroy(); self.UpperGridCampo1 = nil; end;
        if self.GridCampoSolido9 ~= nil then self.GridCampoSolido9:destroy(); self.GridCampoSolido9 = nil; end;
        if self.labUpperGridCampo12 ~= nil then self.labUpperGridCampo12:destroy(); self.labUpperGridCampo12 = nil; end;
        if self.labUpperGridCampo1 ~= nil then self.labUpperGridCampo1:destroy(); self.labUpperGridCampo1 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.GridCampoSolido2 ~= nil then self.GridCampoSolido2:destroy(); self.GridCampoSolido2 = nil; end;
        if self.linUpperGridCampo8 ~= nil then self.linUpperGridCampo8:destroy(); self.linUpperGridCampo8 = nil; end;
        if self.labGridCampoSolido10 ~= nil then self.labGridCampoSolido10:destroy(); self.labGridCampoSolido10 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.UpperGridCampo4 ~= nil then self.UpperGridCampo4:destroy(); self.UpperGridCampo4 = nil; end;
        if self.edtGridCampoSolido11 ~= nil then self.edtGridCampoSolido11:destroy(); self.edtGridCampoSolido11 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.tabelaPerfil ~= nil then self.tabelaPerfil:destroy(); self.tabelaPerfil = nil; end;
        if self.edtUpperGridCampo8 ~= nil then self.edtUpperGridCampo8:destroy(); self.edtUpperGridCampo8 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.labGridCampoSolido12 ~= nil then self.labGridCampoSolido12:destroy(); self.labGridCampoSolido12 = nil; end;
        if self.edtUpperGridCampo2 ~= nil then self.edtUpperGridCampo2:destroy(); self.edtUpperGridCampo2 = nil; end;
        if self.edtGridCampoSolido1 ~= nil then self.edtGridCampoSolido1:destroy(); self.edtGridCampoSolido1 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.edtGridCampoSolido3 ~= nil then self.edtGridCampoSolido3:destroy(); self.edtGridCampoSolido3 = nil; end;
        if self.edtGridCampoSolido9 ~= nil then self.edtGridCampoSolido9:destroy(); self.edtGridCampoSolido9 = nil; end;
        if self.linUpperGridCampo9 ~= nil then self.linUpperGridCampo9:destroy(); self.linUpperGridCampo9 = nil; end;
        if self.GridCampoSolido7 ~= nil then self.GridCampoSolido7:destroy(); self.GridCampoSolido7 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.GridCampoSolido13 ~= nil then self.GridCampoSolido13:destroy(); self.GridCampoSolido13 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edtUpperGridCampo5 ~= nil then self.edtUpperGridCampo5:destroy(); self.edtUpperGridCampo5 = nil; end;
        if self.GridCampoSolido6 ~= nil then self.GridCampoSolido6:destroy(); self.GridCampoSolido6 = nil; end;
        if self.UpperGridCampo8 ~= nil then self.UpperGridCampo8:destroy(); self.UpperGridCampo8 = nil; end;
        if self.GridCampoSolido5 ~= nil then self.GridCampoSolido5:destroy(); self.GridCampoSolido5 = nil; end;
        if self.linUpperGridCampo7 ~= nil then self.linUpperGridCampo7:destroy(); self.linUpperGridCampo7 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.labUpperGridCampo8 ~= nil then self.labUpperGridCampo8:destroy(); self.labUpperGridCampo8 = nil; end;
        if self.labGridCampoSolido8 ~= nil then self.labGridCampoSolido8:destroy(); self.labGridCampoSolido8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.linUpperGridCampo12 ~= nil then self.linUpperGridCampo12:destroy(); self.linUpperGridCampo12 = nil; end;
        if self.UpperGridCampo7 ~= nil then self.UpperGridCampo7:destroy(); self.UpperGridCampo7 = nil; end;
        if self.labUpperGridCampo11 ~= nil then self.labUpperGridCampo11:destroy(); self.labUpperGridCampo11 = nil; end;
        if self.GridCampoSolido11 ~= nil then self.GridCampoSolido11:destroy(); self.GridCampoSolido11 = nil; end;
        if self.GridCampoSolido8 ~= nil then self.GridCampoSolido8:destroy(); self.GridCampoSolido8 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.tabelaAtributos ~= nil then self.tabelaAtributos:destroy(); self.tabelaAtributos = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.labUpperGridCampo5 ~= nil then self.labUpperGridCampo5:destroy(); self.labUpperGridCampo5 = nil; end;
        if self.linUpperGridCampo5 ~= nil then self.linUpperGridCampo5:destroy(); self.linUpperGridCampo5 = nil; end;
        if self.edtUpperGridCampo11 ~= nil then self.edtUpperGridCampo11:destroy(); self.edtUpperGridCampo11 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.labGridCampoSolido16 ~= nil then self.labGridCampoSolido16:destroy(); self.labGridCampoSolido16 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.GridCampoSolido4 ~= nil then self.GridCampoSolido4:destroy(); self.GridCampoSolido4 = nil; end;
        if self.labGridCampoSolido3 ~= nil then self.labGridCampoSolido3:destroy(); self.labGridCampoSolido3 = nil; end;
        if self.edtGridCampoSolido7 ~= nil then self.edtGridCampoSolido7:destroy(); self.edtGridCampoSolido7 = nil; end;
        if self.labUpperGridCampo7 ~= nil then self.labUpperGridCampo7:destroy(); self.labUpperGridCampo7 = nil; end;
        if self.labUpperGridCampo9 ~= nil then self.labUpperGridCampo9:destroy(); self.labUpperGridCampo9 = nil; end;
        if self.labGridCampoSolido5 ~= nil then self.labGridCampoSolido5:destroy(); self.labGridCampoSolido5 = nil; end;
        if self.labGridCampoSolido15 ~= nil then self.labGridCampoSolido15:destroy(); self.labGridCampoSolido15 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.labUpperGridCampo4 ~= nil then self.labUpperGridCampo4:destroy(); self.labUpperGridCampo4 = nil; end;
        if self.labUpperGridCampo3 ~= nil then self.labUpperGridCampo3:destroy(); self.labUpperGridCampo3 = nil; end;
        if self.labGridCampoSolido4 ~= nil then self.labGridCampoSolido4:destroy(); self.labGridCampoSolido4 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.GridCampoSolido3 ~= nil then self.GridCampoSolido3:destroy(); self.GridCampoSolido3 = nil; end;
        if self.edtUpperGridCampo9 ~= nil then self.edtUpperGridCampo9:destroy(); self.edtUpperGridCampo9 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.edtUpperGridCampo3 ~= nil then self.edtUpperGridCampo3:destroy(); self.edtUpperGridCampo3 = nil; end;
        if self.edtUpperGridCampo10 ~= nil then self.edtUpperGridCampo10:destroy(); self.edtUpperGridCampo10 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.labGridCampoSolido14 ~= nil then self.labGridCampoSolido14:destroy(); self.labGridCampoSolido14 = nil; end;
        if self.edtUpperGridCampo7 ~= nil then self.edtUpperGridCampo7:destroy(); self.edtUpperGridCampo7 = nil; end;
        if self.labGridCampoSolido7 ~= nil then self.labGridCampoSolido7:destroy(); self.labGridCampoSolido7 = nil; end;
        if self.edtGridCampoSolido15 ~= nil then self.edtGridCampoSolido15:destroy(); self.edtGridCampoSolido15 = nil; end;
        if self.UpperGridCampo3 ~= nil then self.UpperGridCampo3:destroy(); self.UpperGridCampo3 = nil; end;
        if self.GridCampoSolido12 ~= nil then self.GridCampoSolido12:destroy(); self.GridCampoSolido12 = nil; end;
        if self.edtUpperGridCampo6 ~= nil then self.edtUpperGridCampo6:destroy(); self.edtUpperGridCampo6 = nil; end;
        if self.linUpperGridCampo2 ~= nil then self.linUpperGridCampo2:destroy(); self.linUpperGridCampo2 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.edtGridCampoSolido8 ~= nil then self.edtGridCampoSolido8:destroy(); self.edtGridCampoSolido8 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edtGridCampoSolido2 ~= nil then self.edtGridCampoSolido2:destroy(); self.edtGridCampoSolido2 = nil; end;
        if self.GridCampoSolido1 ~= nil then self.GridCampoSolido1:destroy(); self.GridCampoSolido1 = nil; end;
        if self.labGridCampoSolido11 ~= nil then self.labGridCampoSolido11:destroy(); self.labGridCampoSolido11 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.linUpperGridCampo10 ~= nil then self.linUpperGridCampo10:destroy(); self.linUpperGridCampo10 = nil; end;
        if self.labUpperGridCampo6 ~= nil then self.labUpperGridCampo6:destroy(); self.labUpperGridCampo6 = nil; end;
        if self.linUpperGridCampo6 ~= nil then self.linUpperGridCampo6:destroy(); self.linUpperGridCampo6 = nil; end;
        if self.GridCampoSolido15 ~= nil then self.GridCampoSolido15:destroy(); self.GridCampoSolido15 = nil; end;
        if self.UpperGridCampo12 ~= nil then self.UpperGridCampo12:destroy(); self.UpperGridCampo12 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.labGridCampoSolido2 ~= nil then self.labGridCampoSolido2:destroy(); self.labGridCampoSolido2 = nil; end;
        if self.labUpperGridCampo10 ~= nil then self.labUpperGridCampo10:destroy(); self.labUpperGridCampo10 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.labGridCampoSolido1 ~= nil then self.labGridCampoSolido1:destroy(); self.labGridCampoSolido1 = nil; end;
        if self.edtGridCampoSolido10 ~= nil then self.edtGridCampoSolido10:destroy(); self.edtGridCampoSolido10 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.UpperGridCampo2 ~= nil then self.UpperGridCampo2:destroy(); self.UpperGridCampo2 = nil; end;
        if self.edtGridCampoSolido6 ~= nil then self.edtGridCampoSolido6:destroy(); self.edtGridCampoSolido6 = nil; end;
        if self.linUpperGridCampo4 ~= nil then self.linUpperGridCampo4:destroy(); self.linUpperGridCampo4 = nil; end;
        if self.UpperGridCampo9 ~= nil then self.UpperGridCampo9:destroy(); self.UpperGridCampo9 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.linUpperGridCampo3 ~= nil then self.linUpperGridCampo3:destroy(); self.linUpperGridCampo3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.labGridCampoSolido6 ~= nil then self.labGridCampoSolido6:destroy(); self.labGridCampoSolido6 = nil; end;
        if self.edtGridCampoSolido5 ~= nil then self.edtGridCampoSolido5:destroy(); self.edtGridCampoSolido5 = nil; end;
        if self.linUpperGridCampo11 ~= nil then self.linUpperGridCampo11:destroy(); self.linUpperGridCampo11 = nil; end;
        if self.GridCampoSolido10 ~= nil then self.GridCampoSolido10:destroy(); self.GridCampoSolido10 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.UpperGridCampo6 ~= nil then self.UpperGridCampo6:destroy(); self.UpperGridCampo6 = nil; end;
        if self.edtUpperGridCampo12 ~= nil then self.edtUpperGridCampo12:destroy(); self.edtUpperGridCampo12 = nil; end;
        if self.edtGridCampoSolido12 ~= nil then self.edtGridCampoSolido12:destroy(); self.edtGridCampoSolido12 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.edtGridCampoSolido14 ~= nil then self.edtGridCampoSolido14:destroy(); self.edtGridCampoSolido14 = nil; end;
        if self.edtUpperGridCampo1 ~= nil then self.edtUpperGridCampo1:destroy(); self.edtUpperGridCampo1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.UpperGridCampo5 ~= nil then self.UpperGridCampo5:destroy(); self.UpperGridCampo5 = nil; end;
        if self.edtUpperGridCampo4 ~= nil then self.edtUpperGridCampo4:destroy(); self.edtUpperGridCampo4 = nil; end;
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
