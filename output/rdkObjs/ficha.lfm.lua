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

    obj.perfilLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.perfilLayout:setParent(obj.scrollBox1);
    obj.perfilLayout:setAlign("top");
    obj.perfilLayout:setHeight(800);
    obj.perfilLayout:setMargins({left=10, right=10, top=10});
    obj.perfilLayout:setAutoHeight(true);
    obj.perfilLayout:setHorzAlign("center");
    obj.perfilLayout:setLineSpacing(2);
    obj.perfilLayout:setName("perfilLayout");
    obj.perfilLayout:setMaxWidth(1600);
    obj.perfilLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.perfilLayout:setMinScaledWidth(300);

    obj.tabelaDadosImagem = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tabelaDadosImagem:setParent(obj.perfilLayout);
    obj.tabelaDadosImagem:setMinWidth(320);
    obj.tabelaDadosImagem:setMaxWidth(1600);
    obj.tabelaDadosImagem:setName("tabelaDadosImagem");
    obj.tabelaDadosImagem:setAvoidScale(true);
    obj.tabelaDadosImagem:setAutoHeight(true);
    obj.tabelaDadosImagem:setVertAlign("trailing");
    obj.tabelaDadosImagem:setMaxControlsPerLine(3);
    obj.tabelaDadosImagem:setHorzAlign("center");

    obj.imagemDoPersonagem = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.imagemDoPersonagem:setParent(obj.tabelaDadosImagem);
    obj.imagemDoPersonagem:setMinWidth(260);
    obj.imagemDoPersonagem:setMaxWidth(400);
    obj.imagemDoPersonagem:setName("imagemDoPersonagem");
    obj.imagemDoPersonagem:setAvoidScale(true);
    obj.imagemDoPersonagem:setAutoHeight(true);
    obj.imagemDoPersonagem:setVertAlign("trailing");
    obj.imagemDoPersonagem:setHorzAlign("center");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.imagemDoPersonagem);
    obj.rectangle2:setCornerType("innerLine");
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setHeight(260);
    obj.rectangle2:setWidth(260);
    obj.rectangle2:setName("rectangle2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle2);
    obj.image1:setSRC("");
    obj.image1:setStyle("autoFit");
    obj.image1:setOptimize(true);
    obj.image1:setEditable(true);
    obj.image1:setHeight(230);
    obj.image1:setWidth(230);
    obj.image1:setLeft(15);
    obj.image1:setTop(15);
    obj.image1:setName("image1");

    obj.dadosDoPersonagem = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.dadosDoPersonagem:setParent(obj.tabelaDadosImagem);
    obj.dadosDoPersonagem:setMinWidth(320);
    obj.dadosDoPersonagem:setMaxWidth(400);
    obj.dadosDoPersonagem:setName("dadosDoPersonagem");
    obj.dadosDoPersonagem:setAvoidScale(true);
    obj.dadosDoPersonagem:setAutoHeight(true);
    obj.dadosDoPersonagem:setVertAlign("trailing");
    obj.dadosDoPersonagem:setMaxControlsPerLine(2);
    obj.dadosDoPersonagem:setHorzAlign("center");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.dadosDoPersonagem);
    obj.flowPart1:setHeight(50);
    obj.flowPart1:setMinScaledWidth(100);
    obj.flowPart1:setMinWidth(100);
    obj.flowPart1:setMaxWidth(233);
    obj.flowPart1:setMaxScaledWidth(233);
    obj.flowPart1:setAvoidScale(true);
    obj.flowPart1:setName("flowPart1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("top");
    obj.edit1:setField("nome");
    obj.edit1:setFontSize(13);
    obj.edit1:setName("edit1");
    obj.edit1:setHeight(30);
    obj.edit1:setTransparent(true);
    obj.edit1:setVertTextAlign("trailing");
    obj.edit1:setWidth(195);

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart1);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setStrokeColor("#FFFFFF50");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setName("horzLine1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setAlign("top");
    obj.label1:setText("Nome");
    obj.label1:setVertTextAlign("leading");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setName("label1");
    obj.label1:setFontSize(12);
    obj.label1:setFontColor("#D0D0D0");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.dadosDoPersonagem);
    obj.flowPart2:setHeight(50);
    obj.flowPart2:setMinScaledWidth(100);
    obj.flowPart2:setMinWidth(100);
    obj.flowPart2:setMaxWidth(233);
    obj.flowPart2:setMaxScaledWidth(233);
    obj.flowPart2:setAvoidScale(true);
    obj.flowPart2:setName("flowPart2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart2);
    obj.edit2:setAlign("top");
    obj.edit2:setField("raca");
    obj.edit2:setFontSize(13);
    obj.edit2:setName("edit2");
    obj.edit2:setHeight(30);
    obj.edit2:setTransparent(true);
    obj.edit2:setVertTextAlign("trailing");
    obj.edit2:setWidth(195);

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart2);
    obj.horzLine2:setAlign("top");
    obj.horzLine2:setStrokeColor("#FFFFFF50");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setName("horzLine2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setAlign("top");
    obj.label2:setText("Raça");
    obj.label2:setVertTextAlign("leading");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setName("label2");
    obj.label2:setFontSize(12);
    obj.label2:setFontColor("#D0D0D0");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.dadosDoPersonagem);
    obj.flowPart3:setHeight(50);
    obj.flowPart3:setMinScaledWidth(100);
    obj.flowPart3:setMinWidth(100);
    obj.flowPart3:setMaxWidth(233);
    obj.flowPart3:setMaxScaledWidth(233);
    obj.flowPart3:setAvoidScale(true);
    obj.flowPart3:setName("flowPart3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("top");
    obj.edit3:setField("peso");
    obj.edit3:setFontSize(13);
    obj.edit3:setName("edit3");
    obj.edit3:setHeight(30);
    obj.edit3:setTransparent(true);
    obj.edit3:setVertTextAlign("trailing");
    obj.edit3:setWidth(195);

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.flowPart3);
    obj.horzLine3:setAlign("top");
    obj.horzLine3:setStrokeColor("#FFFFFF50");
    obj.horzLine3:setStrokeSize(1);
    obj.horzLine3:setName("horzLine3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setText("Peso");
    obj.label3:setVertTextAlign("leading");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setName("label3");
    obj.label3:setFontSize(12);
    obj.label3:setFontColor("#D0D0D0");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.dadosDoPersonagem);
    obj.flowPart4:setHeight(50);
    obj.flowPart4:setMinScaledWidth(100);
    obj.flowPart4:setMinWidth(100);
    obj.flowPart4:setMaxWidth(233);
    obj.flowPart4:setMaxScaledWidth(233);
    obj.flowPart4:setAvoidScale(true);
    obj.flowPart4:setName("flowPart4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("top");
    obj.edit4:setField("classe");
    obj.edit4:setFontSize(13);
    obj.edit4:setName("edit4");
    obj.edit4:setHeight(30);
    obj.edit4:setTransparent(true);
    obj.edit4:setVertTextAlign("trailing");
    obj.edit4:setWidth(195);

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.flowPart4);
    obj.horzLine4:setAlign("top");
    obj.horzLine4:setStrokeColor("#FFFFFF50");
    obj.horzLine4:setStrokeSize(1);
    obj.horzLine4:setName("horzLine4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setText("Classe");
    obj.label4:setVertTextAlign("leading");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setName("label4");
    obj.label4:setFontSize(12);
    obj.label4:setFontColor("#D0D0D0");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.dadosDoPersonagem);
    obj.flowPart5:setHeight(50);
    obj.flowPart5:setMinScaledWidth(100);
    obj.flowPart5:setMinWidth(100);
    obj.flowPart5:setMaxWidth(233);
    obj.flowPart5:setMaxScaledWidth(233);
    obj.flowPart5:setAvoidScale(true);
    obj.flowPart5:setName("flowPart5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart5);
    obj.edit5:setAlign("top");
    obj.edit5:setField("altura");
    obj.edit5:setFontSize(13);
    obj.edit5:setName("edit5");
    obj.edit5:setHeight(30);
    obj.edit5:setTransparent(true);
    obj.edit5:setVertTextAlign("trailing");
    obj.edit5:setWidth(195);

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.flowPart5);
    obj.horzLine5:setAlign("top");
    obj.horzLine5:setStrokeColor("#FFFFFF50");
    obj.horzLine5:setStrokeSize(1);
    obj.horzLine5:setName("horzLine5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart5);
    obj.label5:setAlign("top");
    obj.label5:setText("Altura");
    obj.label5:setVertTextAlign("leading");
    obj.label5:setWordWrap(true);
    obj.label5:setTextTrimming("none");
    obj.label5:setName("label5");
    obj.label5:setFontSize(12);
    obj.label5:setFontColor("#D0D0D0");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.dadosDoPersonagem);
    obj.flowPart6:setHeight(50);
    obj.flowPart6:setMinScaledWidth(100);
    obj.flowPart6:setMinWidth(100);
    obj.flowPart6:setMaxWidth(233);
    obj.flowPart6:setMaxScaledWidth(233);
    obj.flowPart6:setAvoidScale(true);
    obj.flowPart6:setName("flowPart6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart6);
    obj.edit6:setAlign("top");
    obj.edit6:setField("idade");
    obj.edit6:setFontSize(13);
    obj.edit6:setName("edit6");
    obj.edit6:setHeight(30);
    obj.edit6:setTransparent(true);
    obj.edit6:setVertTextAlign("trailing");
    obj.edit6:setWidth(195);

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.flowPart6);
    obj.horzLine6:setAlign("top");
    obj.horzLine6:setStrokeColor("#FFFFFF50");
    obj.horzLine6:setStrokeSize(1);
    obj.horzLine6:setName("horzLine6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart6);
    obj.label6:setAlign("top");
    obj.label6:setText("Idade");
    obj.label6:setVertTextAlign("leading");
    obj.label6:setWordWrap(true);
    obj.label6:setTextTrimming("none");
    obj.label6:setName("label6");
    obj.label6:setFontSize(12);
    obj.label6:setFontColor("#D0D0D0");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.dadosDoPersonagem);
    obj.flowPart7:setHeight(50);
    obj.flowPart7:setMinScaledWidth(100);
    obj.flowPart7:setMinWidth(100);
    obj.flowPart7:setMaxWidth(233);
    obj.flowPart7:setMaxScaledWidth(233);
    obj.flowPart7:setAvoidScale(true);
    obj.flowPart7:setName("flowPart7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart7);
    obj.edit7:setAlign("top");
    obj.edit7:setField("nivelClasse");
    obj.edit7:setFontSize(13);
    obj.edit7:setType("number");
    obj.edit7:setReadOnly(true);
    obj.edit7:setName("edit7");
    obj.edit7:setHeight(30);
    obj.edit7:setTransparent(true);
    obj.edit7:setVertTextAlign("trailing");
    obj.edit7:setWidth(195);

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.flowPart7);
    obj.horzLine7:setAlign("top");
    obj.horzLine7:setStrokeColor("#FFFFFF50");
    obj.horzLine7:setStrokeSize(1);
    obj.horzLine7:setName("horzLine7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart7);
    obj.label7:setAlign("top");
    obj.label7:setText("Nivel de Classe");
    obj.label7:setVertTextAlign("leading");
    obj.label7:setWordWrap(true);
    obj.label7:setTextTrimming("none");
    obj.label7:setName("label7");
    obj.label7:setFontSize(12);
    obj.label7:setFontColor("#D0D0D0");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.dadosDoPersonagem);
    obj.flowPart8:setHeight(50);
    obj.flowPart8:setMinScaledWidth(100);
    obj.flowPart8:setMinWidth(100);
    obj.flowPart8:setMaxWidth(233);
    obj.flowPart8:setMaxScaledWidth(233);
    obj.flowPart8:setAvoidScale(true);
    obj.flowPart8:setName("flowPart8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart8);
    obj.edit8:setAlign("top");
    obj.edit8:setField("sexo");
    obj.edit8:setFontSize(13);
    obj.edit8:setName("edit8");
    obj.edit8:setHeight(30);
    obj.edit8:setTransparent(true);
    obj.edit8:setVertTextAlign("trailing");
    obj.edit8:setWidth(195);

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.flowPart8);
    obj.horzLine8:setAlign("top");
    obj.horzLine8:setStrokeColor("#FFFFFF50");
    obj.horzLine8:setStrokeSize(1);
    obj.horzLine8:setName("horzLine8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart8);
    obj.label8:setAlign("top");
    obj.label8:setText("Sexo");
    obj.label8:setVertTextAlign("leading");
    obj.label8:setWordWrap(true);
    obj.label8:setTextTrimming("none");
    obj.label8:setName("label8");
    obj.label8:setFontSize(12);
    obj.label8:setFontColor("#D0D0D0");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.dadosDoPersonagem);
    obj.flowPart9:setHeight(50);
    obj.flowPart9:setMinScaledWidth(100);
    obj.flowPart9:setMinWidth(100);
    obj.flowPart9:setMaxWidth(233);
    obj.flowPart9:setMaxScaledWidth(233);
    obj.flowPart9:setAvoidScale(true);
    obj.flowPart9:setName("flowPart9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart9);
    obj.edit9:setAlign("top");
    obj.edit9:setField("nivelProfissao");
    obj.edit9:setFontSize(13);
    obj.edit9:setType("number");
    obj.edit9:setReadOnly(true);
    obj.edit9:setName("edit9");
    obj.edit9:setHeight(30);
    obj.edit9:setTransparent(true);
    obj.edit9:setVertTextAlign("trailing");
    obj.edit9:setWidth(195);

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.flowPart9);
    obj.horzLine9:setAlign("top");
    obj.horzLine9:setStrokeColor("#FFFFFF50");
    obj.horzLine9:setStrokeSize(1);
    obj.horzLine9:setName("horzLine9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart9);
    obj.label9:setAlign("top");
    obj.label9:setText("Nivel de Profissão");
    obj.label9:setVertTextAlign("leading");
    obj.label9:setWordWrap(true);
    obj.label9:setTextTrimming("none");
    obj.label9:setName("label9");
    obj.label9:setFontSize(12);
    obj.label9:setFontColor("#D0D0D0");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.dadosDoPersonagem);
    obj.flowPart10:setHeight(50);
    obj.flowPart10:setMinScaledWidth(100);
    obj.flowPart10:setMinWidth(100);
    obj.flowPart10:setMaxWidth(233);
    obj.flowPart10:setMaxScaledWidth(233);
    obj.flowPart10:setAvoidScale(true);
    obj.flowPart10:setName("flowPart10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart10);
    obj.edit10:setAlign("top");
    obj.edit10:setField("nacionalidade");
    obj.edit10:setFontSize(13);
    obj.edit10:setName("edit10");
    obj.edit10:setHeight(30);
    obj.edit10:setTransparent(true);
    obj.edit10:setVertTextAlign("trailing");
    obj.edit10:setWidth(195);

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.flowPart10);
    obj.horzLine10:setAlign("top");
    obj.horzLine10:setStrokeColor("#FFFFFF50");
    obj.horzLine10:setStrokeSize(1);
    obj.horzLine10:setName("horzLine10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart10);
    obj.label10:setAlign("top");
    obj.label10:setText("Nacionalidade");
    obj.label10:setVertTextAlign("leading");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setName("label10");
    obj.label10:setFontSize(12);
    obj.label10:setFontColor("#D0D0D0");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.dadosDoPersonagem);
    obj.flowPart11:setHeight(50);
    obj.flowPart11:setMinScaledWidth(100);
    obj.flowPart11:setMinWidth(100);
    obj.flowPart11:setMaxWidth(233);
    obj.flowPart11:setMaxScaledWidth(233);
    obj.flowPart11:setAvoidScale(true);
    obj.flowPart11:setName("flowPart11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart11);
    obj.edit11:setAlign("top");
    obj.edit11:setField("divindade");
    obj.edit11:setFontSize(13);
    obj.edit11:setName("edit11");
    obj.edit11:setHeight(30);
    obj.edit11:setTransparent(true);
    obj.edit11:setVertTextAlign("trailing");
    obj.edit11:setWidth(195);

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.flowPart11);
    obj.horzLine11:setAlign("top");
    obj.horzLine11:setStrokeColor("#FFFFFF50");
    obj.horzLine11:setStrokeSize(1);
    obj.horzLine11:setName("horzLine11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart11);
    obj.label11:setAlign("top");
    obj.label11:setText("Divindade");
    obj.label11:setVertTextAlign("leading");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setName("label11");
    obj.label11:setFontSize(12);
    obj.label11:setFontColor("#D0D0D0");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.dadosDoPersonagem);
    obj.flowPart12:setHeight(50);
    obj.flowPart12:setMinScaledWidth(100);
    obj.flowPart12:setMinWidth(100);
    obj.flowPart12:setMaxWidth(233);
    obj.flowPart12:setMaxScaledWidth(233);
    obj.flowPart12:setAvoidScale(true);
    obj.flowPart12:setName("flowPart12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart12);
    obj.edit12:setAlign("top");
    obj.edit12:setField("pDestino");
    obj.edit12:setFontSize(13);
    obj.edit12:setName("edit12");
    obj.edit12:setHeight(30);
    obj.edit12:setTransparent(true);
    obj.edit12:setVertTextAlign("trailing");
    obj.edit12:setWidth(195);

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.flowPart12);
    obj.horzLine12:setAlign("top");
    obj.horzLine12:setStrokeColor("#FFFFFF50");
    obj.horzLine12:setStrokeSize(1);
    obj.horzLine12:setName("horzLine12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart12);
    obj.label12:setAlign("top");
    obj.label12:setText("Pontos de Destino");
    obj.label12:setVertTextAlign("leading");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setName("label12");
    obj.label12:setFontSize(12);
    obj.label12:setFontColor("#D0D0D0");

    obj.atributosDestreza = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.atributosDestreza:setParent(obj.tabelaDadosImagem);
    obj.atributosDestreza:setMinWidth(320);
    obj.atributosDestreza:setMaxWidth(400);
    obj.atributosDestreza:setName("atributosDestreza");
    obj.atributosDestreza:setAutoHeight(true);
    obj.atributosDestreza:setVertAlign("trailing");
    obj.atributosDestreza:setHorzAlign("center");
    obj.atributosDestreza:setMaxControlsPerLine(3);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.atributosDestreza);
    obj.rectangle3:setCornerType("innerLine");
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setHeight(100);
    obj.rectangle3:setWidth(100);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setMargins({top=2, bottom=2, left=2, right=2});
    obj.rectangle3:setName("rectangle3");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle3);
    obj.edit13:setAlign("top");
    obj.edit13:setField("atributoAcerto");
    obj.edit13:setHeight(20);
    obj.edit13:setType("number");
    obj.edit13:setMin(0);
    obj.edit13:setWidth(20);
    obj.edit13:setName("edit13");
    obj.edit13:setTransparent(true);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setHorzTextAlign("center");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle3);
    obj.label13:setAlign("client");
    obj.label13:setField("modAcerto");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setVertTextAlign("center");
    obj.label13:setFontSize(30);
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setWidth(60);
    obj.label13:setHeight(20);
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle3);
    obj.label14:setText("Acerto");
    obj.label14:setVertTextAlign("trailing");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setAlign("bottom");
    obj.label14:setName("label14");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.atributosDestreza);
    obj.dataLink1:setFields({'modAcerto', 'atributoAcerto'});
    obj.dataLink1:setName("dataLink1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.atributosDestreza);
    obj.layout1:setAlign("client");
    obj.layout1:setHeight(0);
    obj.layout1:setWidth(0);
    obj.layout1:setName("layout1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.atributosDestreza);
    obj.rectangle4:setCornerType("innerLine");
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setHeight(100);
    obj.rectangle4:setWidth(100);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setMargins({top=2, bottom=2, left=2, right=2});
    obj.rectangle4:setName("rectangle4");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle4);
    obj.edit14:setAlign("top");
    obj.edit14:setField("atributoMira");
    obj.edit14:setHeight(20);
    obj.edit14:setType("number");
    obj.edit14:setMin(0);
    obj.edit14:setWidth(20);
    obj.edit14:setName("edit14");
    obj.edit14:setTransparent(true);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setHorzTextAlign("center");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle4);
    obj.label15:setAlign("client");
    obj.label15:setField("modMira");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setVertTextAlign("center");
    obj.label15:setFontSize(30);
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setWidth(60);
    obj.label15:setHeight(20);
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle4);
    obj.label16:setText("Mira");
    obj.label16:setVertTextAlign("trailing");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setAlign("bottom");
    obj.label16:setName("label16");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.atributosDestreza);
    obj.dataLink2:setFields({'modMira', 'atributoMira'});
    obj.dataLink2:setName("dataLink2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.atributosDestreza);
    obj.layout2:setAlign("client");
    obj.layout2:setHeight(0);
    obj.layout2:setWidth(0);
    obj.layout2:setName("layout2");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.atributosDestreza);
    obj.rectangle5:setCornerType("innerLine");
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setXradius(7);
    obj.rectangle5:setYradius(7);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setMargins({left=2.5});
    obj.rectangle5:setName("rectangle5");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle5);
    obj.label17:setField("destrezaDisponivel");
    obj.label17:setWidth(30);
    obj.label17:setAlign("client");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setVertTextAlign("center");
    obj.label17:setFontSize(14);
    obj.label17:setName("label17");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.atributosDestreza);
    obj.layout3:setAlign("client");
    obj.layout3:setHeight(0);
    obj.layout3:setWidth(0);
    obj.layout3:setName("layout3");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.atributosDestreza);
    obj.rectangle6:setCornerType("innerLine");
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setHeight(100);
    obj.rectangle6:setWidth(100);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setMargins({top=2, bottom=2, left=2, right=2});
    obj.rectangle6:setName("rectangle6");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle6);
    obj.edit15:setAlign("top");
    obj.edit15:setField("atributoEsquiva");
    obj.edit15:setHeight(20);
    obj.edit15:setType("number");
    obj.edit15:setMin(0);
    obj.edit15:setWidth(20);
    obj.edit15:setName("edit15");
    obj.edit15:setTransparent(true);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setHorzTextAlign("center");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle6);
    obj.label18:setAlign("client");
    obj.label18:setField("modEsquiva");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setVertTextAlign("center");
    obj.label18:setFontSize(30);
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setWidth(60);
    obj.label18:setHeight(20);
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle6);
    obj.label19:setText("Esquiva");
    obj.label19:setVertTextAlign("trailing");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setAlign("bottom");
    obj.label19:setName("label19");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.atributosDestreza);
    obj.dataLink3:setFields({'modEsquiva', 'atributoEsquiva'});
    obj.dataLink3:setName("dataLink3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.atributosDestreza);
    obj.layout4:setAlign("client");
    obj.layout4:setHeight(0);
    obj.layout4:setWidth(0);
    obj.layout4:setName("layout4");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.atributosDestreza);
    obj.rectangle7:setCornerType("innerLine");
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setHeight(100);
    obj.rectangle7:setWidth(100);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setMargins({top=2, bottom=2, left=2, right=2});
    obj.rectangle7:setName("rectangle7");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle7);
    obj.edit16:setAlign("top");
    obj.edit16:setField("atributoBloqueio");
    obj.edit16:setHeight(20);
    obj.edit16:setType("number");
    obj.edit16:setMin(0);
    obj.edit16:setWidth(20);
    obj.edit16:setName("edit16");
    obj.edit16:setTransparent(true);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setHorzTextAlign("center");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle7);
    obj.label20:setAlign("client");
    obj.label20:setField("modBloqueio");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setVertTextAlign("center");
    obj.label20:setFontSize(30);
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setWidth(60);
    obj.label20:setHeight(20);
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle7);
    obj.label21:setText("Bloqueio");
    obj.label21:setVertTextAlign("trailing");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setAlign("bottom");
    obj.label21:setName("label21");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.atributosDestreza);
    obj.dataLink4:setFields({'modBloqueio', 'atributoBloqueio'});
    obj.dataLink4:setName("dataLink4");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.perfilLayout);
    obj.flowLineBreak1:setLineSpacing(10);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.perfilLayout);
    obj.flowPart13:setHeight(2);
    obj.flowPart13:setMinScaledWidth(100);
    obj.flowPart13:setMaxScaledWidth(1600);
    obj.flowPart13:setName("flowPart13");

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.flowPart13);
    obj.horzLine13:setStrokeColor("#FFFFFF50");
    obj.horzLine13:setStrokeSize(0.6);
    obj.horzLine13:setStrokeCap("round");
    obj.horzLine13:setScaleY(0.1);
    obj.horzLine13:setTop(1);
    obj.horzLine13:setName("horzLine13");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.perfilLayout);
    obj.flowLineBreak2:setLineSpacing(10);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.perfilLayout);
    obj.flowPart14:setWidth(140);
    obj.flowPart14:setName("flowPart14");

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

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.topoAtributos);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setMinScaledWidth(60);
    obj.flowPart15:setMaxScaledWidth(85);
    obj.flowPart15:setName("flowPart15");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart15);
    obj.label22:setText("Nível");
    obj.label22:setAlign("client");
    obj.label22:setField("");
    obj.label22:setFontSize(8);
    obj.label22:setVertTextAlign("center");
    obj.label22:setHorzTextAlign("leading");
    obj.label22:setName("label22");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.topoAtributos);
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setMinScaledWidth(60);
    obj.flowPart16:setMaxScaledWidth(85);
    obj.flowPart16:setName("flowPart16");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart16);
    obj.label23:setText("Classe");
    obj.label23:setAlign("client");
    obj.label23:setField("");
    obj.label23:setFontSize(8);
    obj.label23:setVertTextAlign("center");
    obj.label23:setHorzTextAlign("leading");
    obj.label23:setName("label23");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.topoAtributos);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setMinScaledWidth(60);
    obj.flowPart17:setMaxScaledWidth(85);
    obj.flowPart17:setName("flowPart17");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart17);
    obj.label24:setText("Raça");
    obj.label24:setAlign("client");
    obj.label24:setField("");
    obj.label24:setFontSize(8);
    obj.label24:setVertTextAlign("center");
    obj.label24:setHorzTextAlign("leading");
    obj.label24:setName("label24");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.topoAtributos);
    obj.flowPart18:setHeight(20);
    obj.flowPart18:setMinScaledWidth(60);
    obj.flowPart18:setMaxScaledWidth(85);
    obj.flowPart18:setName("flowPart18");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart18);
    obj.label25:setText("Treino");
    obj.label25:setAlign("client");
    obj.label25:setField("");
    obj.label25:setFontSize(8);
    obj.label25:setVertTextAlign("center");
    obj.label25:setHorzTextAlign("leading");
    obj.label25:setName("label25");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.topoAtributos);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setMinScaledWidth(60);
    obj.flowPart19:setMaxScaledWidth(85);
    obj.flowPart19:setName("flowPart19");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart19);
    obj.label26:setText("Outros");
    obj.label26:setAlign("client");
    obj.label26:setField("");
    obj.label26:setFontSize(8);
    obj.label26:setVertTextAlign("center");
    obj.label26:setHorzTextAlign("leading");
    obj.label26:setName("label26");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.topoAtributos);
    obj.flowPart20:setHeight(20);
    obj.flowPart20:setMinScaledWidth(60);
    obj.flowPart20:setMaxScaledWidth(85);
    obj.flowPart20:setName("flowPart20");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart20);
    obj.label27:setText("Base");
    obj.label27:setAlign("client");
    obj.label27:setField("");
    obj.label27:setFontSize(8);
    obj.label27:setVertTextAlign("center");
    obj.label27:setHorzTextAlign("leading");
    obj.label27:setName("label27");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.topoAtributos);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setMinScaledWidth(60);
    obj.flowPart21:setMaxScaledWidth(85);
    obj.flowPart21:setName("flowPart21");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart21);
    obj.label28:setText("Equip.");
    obj.label28:setAlign("client");
    obj.label28:setField("");
    obj.label28:setFontSize(8);
    obj.label28:setVertTextAlign("center");
    obj.label28:setHorzTextAlign("leading");
    obj.label28:setName("label28");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.topoAtributos);
    obj.flowPart22:setHeight(20);
    obj.flowPart22:setMinScaledWidth(60);
    obj.flowPart22:setMaxScaledWidth(85);
    obj.flowPart22:setName("flowPart22");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart22);
    obj.label29:setText("Total");
    obj.label29:setAlign("client");
    obj.label29:setField("");
    obj.label29:setFontSize(8);
    obj.label29:setVertTextAlign("center");
    obj.label29:setHorzTextAlign("leading");
    obj.label29:setName("label29");

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

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.tabelaDeAtributos);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setMinScaledWidth(60);
    obj.flowPart23:setMaxScaledWidth(85);
    obj.flowPart23:setName("flowPart23");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart23);
    obj.label30:setText("Constituição");
    obj.label30:setAlign("client");
    obj.label30:setField("");
    obj.label30:setFontSize(8);
    obj.label30:setVertTextAlign("center");
    obj.label30:setHorzTextAlign("leading");
    obj.label30:setName("label30");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.tabelaDeAtributos);
    obj.flowPart24:setHeight(50);
    obj.flowPart24:setMinScaledWidth(30);
    obj.flowPart24:setMinWidth(30);
    obj.flowPart24:setMaxWidth(35);
    obj.flowPart24:setMaxScaledWidth(35);
    obj.flowPart24:setAvoidScale(true);
    obj.flowPart24:setName("flowPart24");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart24);
    obj.edit17:setAlign("top");
    obj.edit17:setField("conNivel");
    obj.edit17:setFontSize(15);
    obj.edit17:setTransparent(true);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setReadOnly(false);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");
    obj.edit17:setHeight(30);
    obj.edit17:setWidth(195);

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.flowPart24);
    obj.horzLine14:setAlign("top");
    obj.horzLine14:setStrokeColor("#FFFFFF50");
    obj.horzLine14:setStrokeSize(1);
    obj.horzLine14:setName("horzLine14");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.tabelaDeAtributos);
    obj.dataLink5:setField("conNivel");
    obj.dataLink5:setName("dataLink5");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.tabelaDeAtributos);
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setHeight(50);
    obj.flowPart25:setMinScaledWidth(30);
    obj.flowPart25:setMaxScaledWidth(50);

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flowPart25);
    obj.image2:setSRC("/imagens/plus.png");
    obj.image2:setHeight(15);
    obj.image2:setWidth(15);
    obj.image2:setLeft(15);
    obj.image2:setTop(5);
    obj.image2:setName("image2");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.tabelaDeAtributos);
    obj.flowPart26:setHeight(50);
    obj.flowPart26:setMinScaledWidth(30);
    obj.flowPart26:setMinWidth(30);
    obj.flowPart26:setMaxWidth(35);
    obj.flowPart26:setMaxScaledWidth(35);
    obj.flowPart26:setAvoidScale(true);
    obj.flowPart26:setName("flowPart26");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart26);
    obj.edit18:setAlign("top");
    obj.edit18:setField("conClasse");
    obj.edit18:setFontSize(15);
    obj.edit18:setTransparent(true);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setReadOnly(true);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");
    obj.edit18:setHeight(30);
    obj.edit18:setWidth(195);

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.flowPart26);
    obj.horzLine15:setAlign("top");
    obj.horzLine15:setStrokeColor("#FFFFFF50");
    obj.horzLine15:setStrokeSize(1);
    obj.horzLine15:setName("horzLine15");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.tabelaDeAtributos);
    obj.dataLink6:setField("conClasse");
    obj.dataLink6:setName("dataLink6");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.tabelaDeAtributos);
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setHeight(50);
    obj.flowPart27:setMinScaledWidth(30);
    obj.flowPart27:setMaxScaledWidth(50);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.flowPart27);
    obj.image3:setSRC("/imagens/plus.png");
    obj.image3:setHeight(15);
    obj.image3:setWidth(15);
    obj.image3:setLeft(15);
    obj.image3:setTop(5);
    obj.image3:setName("image3");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.tabelaDeAtributos);
    obj.flowPart28:setHeight(50);
    obj.flowPart28:setMinScaledWidth(30);
    obj.flowPart28:setMinWidth(30);
    obj.flowPart28:setMaxWidth(35);
    obj.flowPart28:setMaxScaledWidth(35);
    obj.flowPart28:setAvoidScale(true);
    obj.flowPart28:setName("flowPart28");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart28);
    obj.edit19:setAlign("top");
    obj.edit19:setField("conRaca");
    obj.edit19:setFontSize(15);
    obj.edit19:setTransparent(true);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setType("number");
    obj.edit19:setReadOnly(true);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");
    obj.edit19:setHeight(30);
    obj.edit19:setWidth(195);

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.flowPart28);
    obj.horzLine16:setAlign("top");
    obj.horzLine16:setStrokeColor("#FFFFFF50");
    obj.horzLine16:setStrokeSize(1);
    obj.horzLine16:setName("horzLine16");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.tabelaDeAtributos);
    obj.dataLink7:setField("conRaca");
    obj.dataLink7:setName("dataLink7");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.tabelaDeAtributos);
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setHeight(50);
    obj.flowPart29:setMinScaledWidth(30);
    obj.flowPart29:setMaxScaledWidth(50);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.flowPart29);
    obj.image4:setSRC("/imagens/plus.png");
    obj.image4:setHeight(15);
    obj.image4:setWidth(15);
    obj.image4:setLeft(15);
    obj.image4:setTop(5);
    obj.image4:setName("image4");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.tabelaDeAtributos);
    obj.flowPart30:setHeight(50);
    obj.flowPart30:setMinScaledWidth(30);
    obj.flowPart30:setMinWidth(30);
    obj.flowPart30:setMaxWidth(35);
    obj.flowPart30:setMaxScaledWidth(35);
    obj.flowPart30:setAvoidScale(true);
    obj.flowPart30:setName("flowPart30");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart30);
    obj.edit20:setAlign("top");
    obj.edit20:setField("conTreino");
    obj.edit20:setFontSize(15);
    obj.edit20:setTransparent(true);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setReadOnly(false);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");
    obj.edit20:setHeight(30);
    obj.edit20:setWidth(195);

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.flowPart30);
    obj.horzLine17:setAlign("top");
    obj.horzLine17:setStrokeColor("#FFFFFF50");
    obj.horzLine17:setStrokeSize(1);
    obj.horzLine17:setName("horzLine17");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.tabelaDeAtributos);
    obj.dataLink8:setField("conTreino");
    obj.dataLink8:setName("dataLink8");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.tabelaDeAtributos);
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setHeight(50);
    obj.flowPart31:setMinScaledWidth(30);
    obj.flowPart31:setMaxScaledWidth(50);

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.flowPart31);
    obj.image5:setSRC("/imagens/plus.png");
    obj.image5:setHeight(15);
    obj.image5:setWidth(15);
    obj.image5:setLeft(15);
    obj.image5:setTop(5);
    obj.image5:setName("image5");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.tabelaDeAtributos);
    obj.flowPart32:setHeight(50);
    obj.flowPart32:setMinScaledWidth(30);
    obj.flowPart32:setMinWidth(30);
    obj.flowPart32:setMaxWidth(35);
    obj.flowPart32:setMaxScaledWidth(35);
    obj.flowPart32:setAvoidScale(true);
    obj.flowPart32:setName("flowPart32");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart32);
    obj.edit21:setAlign("top");
    obj.edit21:setField("conOutros");
    obj.edit21:setFontSize(15);
    obj.edit21:setTransparent(true);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setReadOnly(false);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");
    obj.edit21:setHeight(30);
    obj.edit21:setWidth(195);

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.flowPart32);
    obj.horzLine18:setAlign("top");
    obj.horzLine18:setStrokeColor("#FFFFFF50");
    obj.horzLine18:setStrokeSize(1);
    obj.horzLine18:setName("horzLine18");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.tabelaDeAtributos);
    obj.dataLink9:setField("conOutros");
    obj.dataLink9:setName("dataLink9");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.tabelaDeAtributos);
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setHeight(50);
    obj.flowPart33:setMinScaledWidth(30);
    obj.flowPart33:setMaxScaledWidth(50);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.flowPart33);
    obj.image6:setSRC("/imagens/equals.png");
    obj.image6:setHeight(15);
    obj.image6:setWidth(15);
    obj.image6:setLeft(15);
    obj.image6:setTop(5);
    obj.image6:setName("image6");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.tabelaDeAtributos);
    obj.flowPart34:setHeight(50);
    obj.flowPart34:setMinScaledWidth(30);
    obj.flowPart34:setMinWidth(30);
    obj.flowPart34:setMaxWidth(35);
    obj.flowPart34:setMaxScaledWidth(35);
    obj.flowPart34:setAvoidScale(true);
    obj.flowPart34:setName("flowPart34");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart34);
    obj.edit22:setAlign("top");
    obj.edit22:setField("conBase");
    obj.edit22:setFontSize(15);
    obj.edit22:setTransparent(true);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setType("number");
    obj.edit22:setReadOnly(true);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");
    obj.edit22:setHeight(30);
    obj.edit22:setWidth(195);

    obj.horzLine19 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine19:setParent(obj.flowPart34);
    obj.horzLine19:setAlign("top");
    obj.horzLine19:setStrokeColor("#FFFFFF50");
    obj.horzLine19:setStrokeSize(1);
    obj.horzLine19:setName("horzLine19");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.tabelaDeAtributos);
    obj.dataLink10:setField("conBase");
    obj.dataLink10:setName("dataLink10");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.tabelaDeAtributos);
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setHeight(50);
    obj.flowPart35:setMinScaledWidth(30);
    obj.flowPart35:setMaxScaledWidth(50);

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.flowPart35);
    obj.image7:setSRC("/imagens/plus.png");
    obj.image7:setHeight(15);
    obj.image7:setWidth(15);
    obj.image7:setLeft(15);
    obj.image7:setTop(5);
    obj.image7:setName("image7");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.tabelaDeAtributos);
    obj.flowPart36:setHeight(50);
    obj.flowPart36:setMinScaledWidth(30);
    obj.flowPart36:setMinWidth(30);
    obj.flowPart36:setMaxWidth(35);
    obj.flowPart36:setMaxScaledWidth(35);
    obj.flowPart36:setAvoidScale(true);
    obj.flowPart36:setName("flowPart36");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart36);
    obj.edit23:setAlign("top");
    obj.edit23:setField("conEquip");
    obj.edit23:setFontSize(15);
    obj.edit23:setTransparent(true);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setType("number");
    obj.edit23:setReadOnly(false);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");
    obj.edit23:setHeight(30);
    obj.edit23:setWidth(195);

    obj.horzLine20 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine20:setParent(obj.flowPart36);
    obj.horzLine20:setAlign("top");
    obj.horzLine20:setStrokeColor("#FFFFFF50");
    obj.horzLine20:setStrokeSize(1);
    obj.horzLine20:setName("horzLine20");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.tabelaDeAtributos);
    obj.dataLink11:setField("conEquip");
    obj.dataLink11:setName("dataLink11");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.tabelaDeAtributos);
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setHeight(50);
    obj.flowPart37:setMinScaledWidth(30);
    obj.flowPart37:setMaxScaledWidth(50);

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.flowPart37);
    obj.image8:setSRC("/imagens/equals.png");
    obj.image8:setHeight(15);
    obj.image8:setWidth(15);
    obj.image8:setLeft(15);
    obj.image8:setTop(5);
    obj.image8:setName("image8");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.tabelaDeAtributos);
    obj.flowPart38:setHeight(50);
    obj.flowPart38:setMinScaledWidth(30);
    obj.flowPart38:setMinWidth(30);
    obj.flowPart38:setMaxWidth(35);
    obj.flowPart38:setMaxScaledWidth(35);
    obj.flowPart38:setAvoidScale(true);
    obj.flowPart38:setName("flowPart38");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart38);
    obj.edit24:setAlign("top");
    obj.edit24:setField("conTotal");
    obj.edit24:setFontSize(15);
    obj.edit24:setTransparent(true);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setType("number");
    obj.edit24:setReadOnly(true);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");
    obj.edit24:setHeight(30);
    obj.edit24:setWidth(195);

    obj.horzLine21 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine21:setParent(obj.flowPart38);
    obj.horzLine21:setAlign("top");
    obj.horzLine21:setStrokeColor("#FFFFFF50");
    obj.horzLine21:setStrokeSize(1);
    obj.horzLine21:setName("horzLine21");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.tabelaDeAtributos);
    obj.dataLink12:setField("conTotal");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.tabelaDeAtributos);
    obj.dataLink13:setFields({'conNivel', 'conClasse', 'conRaca', 'conTreino',
                           'conOutros', 'conBase', 'conEquip', 'conTotal'});
    obj.dataLink13:setName("dataLink13");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.tabelaDeAtributos);
    obj.flowPart39:setHeight(20);
    obj.flowPart39:setMinScaledWidth(60);
    obj.flowPart39:setMaxScaledWidth(85);
    obj.flowPart39:setName("flowPart39");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart39);
    obj.label31:setText("Força");
    obj.label31:setAlign("client");
    obj.label31:setField("");
    obj.label31:setFontSize(8);
    obj.label31:setVertTextAlign("center");
    obj.label31:setHorzTextAlign("leading");
    obj.label31:setName("label31");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.tabelaDeAtributos);
    obj.flowPart40:setHeight(50);
    obj.flowPart40:setMinScaledWidth(30);
    obj.flowPart40:setMinWidth(30);
    obj.flowPart40:setMaxWidth(35);
    obj.flowPart40:setMaxScaledWidth(35);
    obj.flowPart40:setAvoidScale(true);
    obj.flowPart40:setName("flowPart40");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart40);
    obj.edit25:setAlign("top");
    obj.edit25:setField("forNivel");
    obj.edit25:setFontSize(15);
    obj.edit25:setTransparent(true);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setType("number");
    obj.edit25:setReadOnly(false);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");
    obj.edit25:setHeight(30);
    obj.edit25:setWidth(195);

    obj.horzLine22 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine22:setParent(obj.flowPart40);
    obj.horzLine22:setAlign("top");
    obj.horzLine22:setStrokeColor("#FFFFFF50");
    obj.horzLine22:setStrokeSize(1);
    obj.horzLine22:setName("horzLine22");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.tabelaDeAtributos);
    obj.dataLink14:setField("forNivel");
    obj.dataLink14:setName("dataLink14");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.tabelaDeAtributos);
    obj.flowPart41:setName("flowPart41");
    obj.flowPart41:setHeight(50);
    obj.flowPart41:setMinScaledWidth(30);
    obj.flowPart41:setMaxScaledWidth(50);

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.flowPart41);
    obj.image9:setSRC("/imagens/plus.png");
    obj.image9:setHeight(15);
    obj.image9:setWidth(15);
    obj.image9:setLeft(15);
    obj.image9:setTop(5);
    obj.image9:setName("image9");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.tabelaDeAtributos);
    obj.flowPart42:setHeight(50);
    obj.flowPart42:setMinScaledWidth(30);
    obj.flowPart42:setMinWidth(30);
    obj.flowPart42:setMaxWidth(35);
    obj.flowPart42:setMaxScaledWidth(35);
    obj.flowPart42:setAvoidScale(true);
    obj.flowPart42:setName("flowPart42");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart42);
    obj.edit26:setAlign("top");
    obj.edit26:setField("forClasse");
    obj.edit26:setFontSize(15);
    obj.edit26:setTransparent(true);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setReadOnly(true);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");
    obj.edit26:setHeight(30);
    obj.edit26:setWidth(195);

    obj.horzLine23 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine23:setParent(obj.flowPart42);
    obj.horzLine23:setAlign("top");
    obj.horzLine23:setStrokeColor("#FFFFFF50");
    obj.horzLine23:setStrokeSize(1);
    obj.horzLine23:setName("horzLine23");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.tabelaDeAtributos);
    obj.dataLink15:setField("forClasse");
    obj.dataLink15:setName("dataLink15");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.tabelaDeAtributos);
    obj.flowPart43:setName("flowPart43");
    obj.flowPart43:setHeight(50);
    obj.flowPart43:setMinScaledWidth(30);
    obj.flowPart43:setMaxScaledWidth(50);

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.flowPart43);
    obj.image10:setSRC("/imagens/plus.png");
    obj.image10:setHeight(15);
    obj.image10:setWidth(15);
    obj.image10:setLeft(15);
    obj.image10:setTop(5);
    obj.image10:setName("image10");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.tabelaDeAtributos);
    obj.flowPart44:setHeight(50);
    obj.flowPart44:setMinScaledWidth(30);
    obj.flowPart44:setMinWidth(30);
    obj.flowPart44:setMaxWidth(35);
    obj.flowPart44:setMaxScaledWidth(35);
    obj.flowPart44:setAvoidScale(true);
    obj.flowPart44:setName("flowPart44");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart44);
    obj.edit27:setAlign("top");
    obj.edit27:setField("forRaca");
    obj.edit27:setFontSize(15);
    obj.edit27:setTransparent(true);
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setReadOnly(true);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");
    obj.edit27:setHeight(30);
    obj.edit27:setWidth(195);

    obj.horzLine24 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine24:setParent(obj.flowPart44);
    obj.horzLine24:setAlign("top");
    obj.horzLine24:setStrokeColor("#FFFFFF50");
    obj.horzLine24:setStrokeSize(1);
    obj.horzLine24:setName("horzLine24");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.tabelaDeAtributos);
    obj.dataLink16:setField("forRaca");
    obj.dataLink16:setName("dataLink16");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.tabelaDeAtributos);
    obj.flowPart45:setName("flowPart45");
    obj.flowPart45:setHeight(50);
    obj.flowPart45:setMinScaledWidth(30);
    obj.flowPart45:setMaxScaledWidth(50);

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.flowPart45);
    obj.image11:setSRC("/imagens/plus.png");
    obj.image11:setHeight(15);
    obj.image11:setWidth(15);
    obj.image11:setLeft(15);
    obj.image11:setTop(5);
    obj.image11:setName("image11");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.tabelaDeAtributos);
    obj.flowPart46:setHeight(50);
    obj.flowPart46:setMinScaledWidth(30);
    obj.flowPart46:setMinWidth(30);
    obj.flowPart46:setMaxWidth(35);
    obj.flowPart46:setMaxScaledWidth(35);
    obj.flowPart46:setAvoidScale(true);
    obj.flowPart46:setName("flowPart46");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart46);
    obj.edit28:setAlign("top");
    obj.edit28:setField("forTreino");
    obj.edit28:setFontSize(15);
    obj.edit28:setTransparent(true);
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setReadOnly(false);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");
    obj.edit28:setHeight(30);
    obj.edit28:setWidth(195);

    obj.horzLine25 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine25:setParent(obj.flowPart46);
    obj.horzLine25:setAlign("top");
    obj.horzLine25:setStrokeColor("#FFFFFF50");
    obj.horzLine25:setStrokeSize(1);
    obj.horzLine25:setName("horzLine25");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.tabelaDeAtributos);
    obj.dataLink17:setField("forTreino");
    obj.dataLink17:setName("dataLink17");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.tabelaDeAtributos);
    obj.flowPart47:setName("flowPart47");
    obj.flowPart47:setHeight(50);
    obj.flowPart47:setMinScaledWidth(30);
    obj.flowPart47:setMaxScaledWidth(50);

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.flowPart47);
    obj.image12:setSRC("/imagens/plus.png");
    obj.image12:setHeight(15);
    obj.image12:setWidth(15);
    obj.image12:setLeft(15);
    obj.image12:setTop(5);
    obj.image12:setName("image12");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.tabelaDeAtributos);
    obj.flowPart48:setHeight(50);
    obj.flowPart48:setMinScaledWidth(30);
    obj.flowPart48:setMinWidth(30);
    obj.flowPart48:setMaxWidth(35);
    obj.flowPart48:setMaxScaledWidth(35);
    obj.flowPart48:setAvoidScale(true);
    obj.flowPart48:setName("flowPart48");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart48);
    obj.edit29:setAlign("top");
    obj.edit29:setField("forOutros");
    obj.edit29:setFontSize(15);
    obj.edit29:setTransparent(true);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setReadOnly(false);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");
    obj.edit29:setHeight(30);
    obj.edit29:setWidth(195);

    obj.horzLine26 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine26:setParent(obj.flowPart48);
    obj.horzLine26:setAlign("top");
    obj.horzLine26:setStrokeColor("#FFFFFF50");
    obj.horzLine26:setStrokeSize(1);
    obj.horzLine26:setName("horzLine26");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.tabelaDeAtributos);
    obj.dataLink18:setField("forOutros");
    obj.dataLink18:setName("dataLink18");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.tabelaDeAtributos);
    obj.flowPart49:setName("flowPart49");
    obj.flowPart49:setHeight(50);
    obj.flowPart49:setMinScaledWidth(30);
    obj.flowPart49:setMaxScaledWidth(50);

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.flowPart49);
    obj.image13:setSRC("/imagens/equals.png");
    obj.image13:setHeight(15);
    obj.image13:setWidth(15);
    obj.image13:setLeft(15);
    obj.image13:setTop(5);
    obj.image13:setName("image13");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.tabelaDeAtributos);
    obj.flowPart50:setHeight(50);
    obj.flowPart50:setMinScaledWidth(30);
    obj.flowPart50:setMinWidth(30);
    obj.flowPart50:setMaxWidth(35);
    obj.flowPart50:setMaxScaledWidth(35);
    obj.flowPart50:setAvoidScale(true);
    obj.flowPart50:setName("flowPart50");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart50);
    obj.edit30:setAlign("top");
    obj.edit30:setField("forBase");
    obj.edit30:setFontSize(15);
    obj.edit30:setTransparent(true);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setReadOnly(true);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");
    obj.edit30:setHeight(30);
    obj.edit30:setWidth(195);

    obj.horzLine27 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine27:setParent(obj.flowPart50);
    obj.horzLine27:setAlign("top");
    obj.horzLine27:setStrokeColor("#FFFFFF50");
    obj.horzLine27:setStrokeSize(1);
    obj.horzLine27:setName("horzLine27");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.tabelaDeAtributos);
    obj.dataLink19:setField("forBase");
    obj.dataLink19:setName("dataLink19");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.tabelaDeAtributos);
    obj.flowPart51:setName("flowPart51");
    obj.flowPart51:setHeight(50);
    obj.flowPart51:setMinScaledWidth(30);
    obj.flowPart51:setMaxScaledWidth(50);

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.flowPart51);
    obj.image14:setSRC("/imagens/plus.png");
    obj.image14:setHeight(15);
    obj.image14:setWidth(15);
    obj.image14:setLeft(15);
    obj.image14:setTop(5);
    obj.image14:setName("image14");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.tabelaDeAtributos);
    obj.flowPart52:setHeight(50);
    obj.flowPart52:setMinScaledWidth(30);
    obj.flowPart52:setMinWidth(30);
    obj.flowPart52:setMaxWidth(35);
    obj.flowPart52:setMaxScaledWidth(35);
    obj.flowPart52:setAvoidScale(true);
    obj.flowPart52:setName("flowPart52");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart52);
    obj.edit31:setAlign("top");
    obj.edit31:setField("forEquip");
    obj.edit31:setFontSize(15);
    obj.edit31:setTransparent(true);
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setReadOnly(false);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");
    obj.edit31:setHeight(30);
    obj.edit31:setWidth(195);

    obj.horzLine28 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine28:setParent(obj.flowPart52);
    obj.horzLine28:setAlign("top");
    obj.horzLine28:setStrokeColor("#FFFFFF50");
    obj.horzLine28:setStrokeSize(1);
    obj.horzLine28:setName("horzLine28");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.tabelaDeAtributos);
    obj.dataLink20:setField("forEquip");
    obj.dataLink20:setName("dataLink20");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.tabelaDeAtributos);
    obj.flowPart53:setName("flowPart53");
    obj.flowPart53:setHeight(50);
    obj.flowPart53:setMinScaledWidth(30);
    obj.flowPart53:setMaxScaledWidth(50);

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.flowPart53);
    obj.image15:setSRC("/imagens/equals.png");
    obj.image15:setHeight(15);
    obj.image15:setWidth(15);
    obj.image15:setLeft(15);
    obj.image15:setTop(5);
    obj.image15:setName("image15");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.tabelaDeAtributos);
    obj.flowPart54:setHeight(50);
    obj.flowPart54:setMinScaledWidth(30);
    obj.flowPart54:setMinWidth(30);
    obj.flowPart54:setMaxWidth(35);
    obj.flowPart54:setMaxScaledWidth(35);
    obj.flowPart54:setAvoidScale(true);
    obj.flowPart54:setName("flowPart54");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart54);
    obj.edit32:setAlign("top");
    obj.edit32:setField("forTotal");
    obj.edit32:setFontSize(15);
    obj.edit32:setTransparent(true);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setReadOnly(true);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");
    obj.edit32:setHeight(30);
    obj.edit32:setWidth(195);

    obj.horzLine29 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine29:setParent(obj.flowPart54);
    obj.horzLine29:setAlign("top");
    obj.horzLine29:setStrokeColor("#FFFFFF50");
    obj.horzLine29:setStrokeSize(1);
    obj.horzLine29:setName("horzLine29");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.tabelaDeAtributos);
    obj.dataLink21:setField("forTotal");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.tabelaDeAtributos);
    obj.dataLink22:setFields({'forNivel', 'forClasse', 'forRaca', 'forTreino',
                           'forOutros', 'forBase', 'forEquip', 'forTotal'});
    obj.dataLink22:setName("dataLink22");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.tabelaDeAtributos);
    obj.flowPart55:setHeight(20);
    obj.flowPart55:setMinScaledWidth(60);
    obj.flowPart55:setMaxScaledWidth(85);
    obj.flowPart55:setName("flowPart55");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart55);
    obj.label32:setText("Destreza");
    obj.label32:setAlign("client");
    obj.label32:setField("");
    obj.label32:setFontSize(8);
    obj.label32:setVertTextAlign("center");
    obj.label32:setHorzTextAlign("leading");
    obj.label32:setName("label32");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.tabelaDeAtributos);
    obj.flowPart56:setHeight(50);
    obj.flowPart56:setMinScaledWidth(30);
    obj.flowPart56:setMinWidth(30);
    obj.flowPart56:setMaxWidth(35);
    obj.flowPart56:setMaxScaledWidth(35);
    obj.flowPart56:setAvoidScale(true);
    obj.flowPart56:setName("flowPart56");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart56);
    obj.edit33:setAlign("top");
    obj.edit33:setField("dexNivel");
    obj.edit33:setFontSize(15);
    obj.edit33:setTransparent(true);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setReadOnly(false);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");
    obj.edit33:setHeight(30);
    obj.edit33:setWidth(195);

    obj.horzLine30 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine30:setParent(obj.flowPart56);
    obj.horzLine30:setAlign("top");
    obj.horzLine30:setStrokeColor("#FFFFFF50");
    obj.horzLine30:setStrokeSize(1);
    obj.horzLine30:setName("horzLine30");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.tabelaDeAtributos);
    obj.dataLink23:setField("dexNivel");
    obj.dataLink23:setName("dataLink23");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.tabelaDeAtributos);
    obj.flowPart57:setName("flowPart57");
    obj.flowPart57:setHeight(50);
    obj.flowPart57:setMinScaledWidth(30);
    obj.flowPart57:setMaxScaledWidth(50);

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.flowPart57);
    obj.image16:setSRC("/imagens/plus.png");
    obj.image16:setHeight(15);
    obj.image16:setWidth(15);
    obj.image16:setLeft(15);
    obj.image16:setTop(5);
    obj.image16:setName("image16");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.tabelaDeAtributos);
    obj.flowPart58:setHeight(50);
    obj.flowPart58:setMinScaledWidth(30);
    obj.flowPart58:setMinWidth(30);
    obj.flowPart58:setMaxWidth(35);
    obj.flowPart58:setMaxScaledWidth(35);
    obj.flowPart58:setAvoidScale(true);
    obj.flowPart58:setName("flowPart58");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart58);
    obj.edit34:setAlign("top");
    obj.edit34:setField("dexClasse");
    obj.edit34:setFontSize(15);
    obj.edit34:setTransparent(true);
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setType("number");
    obj.edit34:setReadOnly(true);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");
    obj.edit34:setHeight(30);
    obj.edit34:setWidth(195);

    obj.horzLine31 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine31:setParent(obj.flowPart58);
    obj.horzLine31:setAlign("top");
    obj.horzLine31:setStrokeColor("#FFFFFF50");
    obj.horzLine31:setStrokeSize(1);
    obj.horzLine31:setName("horzLine31");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.tabelaDeAtributos);
    obj.dataLink24:setField("dexClasse");
    obj.dataLink24:setName("dataLink24");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.tabelaDeAtributos);
    obj.flowPart59:setName("flowPart59");
    obj.flowPart59:setHeight(50);
    obj.flowPart59:setMinScaledWidth(30);
    obj.flowPart59:setMaxScaledWidth(50);

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.flowPart59);
    obj.image17:setSRC("/imagens/plus.png");
    obj.image17:setHeight(15);
    obj.image17:setWidth(15);
    obj.image17:setLeft(15);
    obj.image17:setTop(5);
    obj.image17:setName("image17");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.tabelaDeAtributos);
    obj.flowPart60:setHeight(50);
    obj.flowPart60:setMinScaledWidth(30);
    obj.flowPart60:setMinWidth(30);
    obj.flowPart60:setMaxWidth(35);
    obj.flowPart60:setMaxScaledWidth(35);
    obj.flowPart60:setAvoidScale(true);
    obj.flowPart60:setName("flowPart60");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart60);
    obj.edit35:setAlign("top");
    obj.edit35:setField("dexRaca");
    obj.edit35:setFontSize(15);
    obj.edit35:setTransparent(true);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setType("number");
    obj.edit35:setReadOnly(true);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");
    obj.edit35:setHeight(30);
    obj.edit35:setWidth(195);

    obj.horzLine32 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine32:setParent(obj.flowPart60);
    obj.horzLine32:setAlign("top");
    obj.horzLine32:setStrokeColor("#FFFFFF50");
    obj.horzLine32:setStrokeSize(1);
    obj.horzLine32:setName("horzLine32");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.tabelaDeAtributos);
    obj.dataLink25:setField("dexRaca");
    obj.dataLink25:setName("dataLink25");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.tabelaDeAtributos);
    obj.flowPart61:setName("flowPart61");
    obj.flowPart61:setHeight(50);
    obj.flowPart61:setMinScaledWidth(30);
    obj.flowPart61:setMaxScaledWidth(50);

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.flowPart61);
    obj.image18:setSRC("/imagens/plus.png");
    obj.image18:setHeight(15);
    obj.image18:setWidth(15);
    obj.image18:setLeft(15);
    obj.image18:setTop(5);
    obj.image18:setName("image18");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.tabelaDeAtributos);
    obj.flowPart62:setHeight(50);
    obj.flowPart62:setMinScaledWidth(30);
    obj.flowPart62:setMinWidth(30);
    obj.flowPart62:setMaxWidth(35);
    obj.flowPart62:setMaxScaledWidth(35);
    obj.flowPart62:setAvoidScale(true);
    obj.flowPart62:setName("flowPart62");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart62);
    obj.edit36:setAlign("top");
    obj.edit36:setField("dexTreino");
    obj.edit36:setFontSize(15);
    obj.edit36:setTransparent(true);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setReadOnly(false);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");
    obj.edit36:setHeight(30);
    obj.edit36:setWidth(195);

    obj.horzLine33 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine33:setParent(obj.flowPart62);
    obj.horzLine33:setAlign("top");
    obj.horzLine33:setStrokeColor("#FFFFFF50");
    obj.horzLine33:setStrokeSize(1);
    obj.horzLine33:setName("horzLine33");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.tabelaDeAtributos);
    obj.dataLink26:setField("dexTreino");
    obj.dataLink26:setName("dataLink26");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.tabelaDeAtributos);
    obj.flowPart63:setName("flowPart63");
    obj.flowPart63:setHeight(50);
    obj.flowPart63:setMinScaledWidth(30);
    obj.flowPart63:setMaxScaledWidth(50);

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.flowPart63);
    obj.image19:setSRC("/imagens/plus.png");
    obj.image19:setHeight(15);
    obj.image19:setWidth(15);
    obj.image19:setLeft(15);
    obj.image19:setTop(5);
    obj.image19:setName("image19");

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.tabelaDeAtributos);
    obj.flowPart64:setHeight(50);
    obj.flowPart64:setMinScaledWidth(30);
    obj.flowPart64:setMinWidth(30);
    obj.flowPart64:setMaxWidth(35);
    obj.flowPart64:setMaxScaledWidth(35);
    obj.flowPart64:setAvoidScale(true);
    obj.flowPart64:setName("flowPart64");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart64);
    obj.edit37:setAlign("top");
    obj.edit37:setField("dexOutros");
    obj.edit37:setFontSize(15);
    obj.edit37:setTransparent(true);
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setType("number");
    obj.edit37:setReadOnly(false);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");
    obj.edit37:setHeight(30);
    obj.edit37:setWidth(195);

    obj.horzLine34 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine34:setParent(obj.flowPart64);
    obj.horzLine34:setAlign("top");
    obj.horzLine34:setStrokeColor("#FFFFFF50");
    obj.horzLine34:setStrokeSize(1);
    obj.horzLine34:setName("horzLine34");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.tabelaDeAtributos);
    obj.dataLink27:setField("dexOutros");
    obj.dataLink27:setName("dataLink27");

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.tabelaDeAtributos);
    obj.flowPart65:setName("flowPart65");
    obj.flowPart65:setHeight(50);
    obj.flowPart65:setMinScaledWidth(30);
    obj.flowPart65:setMaxScaledWidth(50);

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.flowPart65);
    obj.image20:setSRC("/imagens/equals.png");
    obj.image20:setHeight(15);
    obj.image20:setWidth(15);
    obj.image20:setLeft(15);
    obj.image20:setTop(5);
    obj.image20:setName("image20");

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.tabelaDeAtributos);
    obj.flowPart66:setHeight(50);
    obj.flowPart66:setMinScaledWidth(30);
    obj.flowPart66:setMinWidth(30);
    obj.flowPart66:setMaxWidth(35);
    obj.flowPart66:setMaxScaledWidth(35);
    obj.flowPart66:setAvoidScale(true);
    obj.flowPart66:setName("flowPart66");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart66);
    obj.edit38:setAlign("top");
    obj.edit38:setField("dexBase");
    obj.edit38:setFontSize(15);
    obj.edit38:setTransparent(true);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setType("number");
    obj.edit38:setReadOnly(true);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");
    obj.edit38:setHeight(30);
    obj.edit38:setWidth(195);

    obj.horzLine35 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine35:setParent(obj.flowPart66);
    obj.horzLine35:setAlign("top");
    obj.horzLine35:setStrokeColor("#FFFFFF50");
    obj.horzLine35:setStrokeSize(1);
    obj.horzLine35:setName("horzLine35");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.tabelaDeAtributos);
    obj.dataLink28:setField("dexBase");
    obj.dataLink28:setName("dataLink28");

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.tabelaDeAtributos);
    obj.flowPart67:setName("flowPart67");
    obj.flowPart67:setHeight(50);
    obj.flowPart67:setMinScaledWidth(30);
    obj.flowPart67:setMaxScaledWidth(50);

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.flowPart67);
    obj.image21:setSRC("/imagens/plus.png");
    obj.image21:setHeight(15);
    obj.image21:setWidth(15);
    obj.image21:setLeft(15);
    obj.image21:setTop(5);
    obj.image21:setName("image21");

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.tabelaDeAtributos);
    obj.flowPart68:setHeight(50);
    obj.flowPart68:setMinScaledWidth(30);
    obj.flowPart68:setMinWidth(30);
    obj.flowPart68:setMaxWidth(35);
    obj.flowPart68:setMaxScaledWidth(35);
    obj.flowPart68:setAvoidScale(true);
    obj.flowPart68:setName("flowPart68");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart68);
    obj.edit39:setAlign("top");
    obj.edit39:setField("dexEquip");
    obj.edit39:setFontSize(15);
    obj.edit39:setTransparent(true);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setType("number");
    obj.edit39:setReadOnly(false);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");
    obj.edit39:setHeight(30);
    obj.edit39:setWidth(195);

    obj.horzLine36 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine36:setParent(obj.flowPart68);
    obj.horzLine36:setAlign("top");
    obj.horzLine36:setStrokeColor("#FFFFFF50");
    obj.horzLine36:setStrokeSize(1);
    obj.horzLine36:setName("horzLine36");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.tabelaDeAtributos);
    obj.dataLink29:setField("dexEquip");
    obj.dataLink29:setName("dataLink29");

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.tabelaDeAtributos);
    obj.flowPart69:setName("flowPart69");
    obj.flowPart69:setHeight(50);
    obj.flowPart69:setMinScaledWidth(30);
    obj.flowPart69:setMaxScaledWidth(50);

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.flowPart69);
    obj.image22:setSRC("/imagens/equals.png");
    obj.image22:setHeight(15);
    obj.image22:setWidth(15);
    obj.image22:setLeft(15);
    obj.image22:setTop(5);
    obj.image22:setName("image22");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.tabelaDeAtributos);
    obj.flowPart70:setHeight(50);
    obj.flowPart70:setMinScaledWidth(30);
    obj.flowPart70:setMinWidth(30);
    obj.flowPart70:setMaxWidth(35);
    obj.flowPart70:setMaxScaledWidth(35);
    obj.flowPart70:setAvoidScale(true);
    obj.flowPart70:setName("flowPart70");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart70);
    obj.edit40:setAlign("top");
    obj.edit40:setField("dexTotal");
    obj.edit40:setFontSize(15);
    obj.edit40:setTransparent(true);
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setReadOnly(true);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");
    obj.edit40:setHeight(30);
    obj.edit40:setWidth(195);

    obj.horzLine37 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine37:setParent(obj.flowPart70);
    obj.horzLine37:setAlign("top");
    obj.horzLine37:setStrokeColor("#FFFFFF50");
    obj.horzLine37:setStrokeSize(1);
    obj.horzLine37:setName("horzLine37");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.tabelaDeAtributos);
    obj.dataLink30:setField("dexTotal");
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.tabelaDeAtributos);
    obj.dataLink31:setFields({'dexNivel', 'dexClasse', 'dexRaca', 'dexTreino',
                           'dexOutros', 'dexBase', 'dexEquip', 'dexTotal'});
    obj.dataLink31:setName("dataLink31");

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.tabelaDeAtributos);
    obj.flowPart71:setHeight(20);
    obj.flowPart71:setMinScaledWidth(60);
    obj.flowPart71:setMaxScaledWidth(85);
    obj.flowPart71:setName("flowPart71");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart71);
    obj.label33:setText("Carisma");
    obj.label33:setAlign("client");
    obj.label33:setField("");
    obj.label33:setFontSize(8);
    obj.label33:setVertTextAlign("center");
    obj.label33:setHorzTextAlign("leading");
    obj.label33:setName("label33");

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.tabelaDeAtributos);
    obj.flowPart72:setHeight(50);
    obj.flowPart72:setMinScaledWidth(30);
    obj.flowPart72:setMinWidth(30);
    obj.flowPart72:setMaxWidth(35);
    obj.flowPart72:setMaxScaledWidth(35);
    obj.flowPart72:setAvoidScale(true);
    obj.flowPart72:setName("flowPart72");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart72);
    obj.edit41:setAlign("top");
    obj.edit41:setField("carNivel");
    obj.edit41:setFontSize(15);
    obj.edit41:setTransparent(true);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setReadOnly(false);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");
    obj.edit41:setHeight(30);
    obj.edit41:setWidth(195);

    obj.horzLine38 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine38:setParent(obj.flowPart72);
    obj.horzLine38:setAlign("top");
    obj.horzLine38:setStrokeColor("#FFFFFF50");
    obj.horzLine38:setStrokeSize(1);
    obj.horzLine38:setName("horzLine38");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.tabelaDeAtributos);
    obj.dataLink32:setField("carNivel");
    obj.dataLink32:setName("dataLink32");

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.tabelaDeAtributos);
    obj.flowPart73:setName("flowPart73");
    obj.flowPart73:setHeight(50);
    obj.flowPart73:setMinScaledWidth(30);
    obj.flowPart73:setMaxScaledWidth(50);

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.flowPart73);
    obj.image23:setSRC("/imagens/plus.png");
    obj.image23:setHeight(15);
    obj.image23:setWidth(15);
    obj.image23:setLeft(15);
    obj.image23:setTop(5);
    obj.image23:setName("image23");

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.tabelaDeAtributos);
    obj.flowPart74:setHeight(50);
    obj.flowPart74:setMinScaledWidth(30);
    obj.flowPart74:setMinWidth(30);
    obj.flowPart74:setMaxWidth(35);
    obj.flowPart74:setMaxScaledWidth(35);
    obj.flowPart74:setAvoidScale(true);
    obj.flowPart74:setName("flowPart74");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart74);
    obj.edit42:setAlign("top");
    obj.edit42:setField("carClasse");
    obj.edit42:setFontSize(15);
    obj.edit42:setTransparent(true);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setType("number");
    obj.edit42:setReadOnly(true);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");
    obj.edit42:setHeight(30);
    obj.edit42:setWidth(195);

    obj.horzLine39 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine39:setParent(obj.flowPart74);
    obj.horzLine39:setAlign("top");
    obj.horzLine39:setStrokeColor("#FFFFFF50");
    obj.horzLine39:setStrokeSize(1);
    obj.horzLine39:setName("horzLine39");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.tabelaDeAtributos);
    obj.dataLink33:setField("carClasse");
    obj.dataLink33:setName("dataLink33");

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.tabelaDeAtributos);
    obj.flowPart75:setName("flowPart75");
    obj.flowPart75:setHeight(50);
    obj.flowPart75:setMinScaledWidth(30);
    obj.flowPart75:setMaxScaledWidth(50);

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.flowPart75);
    obj.image24:setSRC("/imagens/plus.png");
    obj.image24:setHeight(15);
    obj.image24:setWidth(15);
    obj.image24:setLeft(15);
    obj.image24:setTop(5);
    obj.image24:setName("image24");

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.tabelaDeAtributos);
    obj.flowPart76:setHeight(50);
    obj.flowPart76:setMinScaledWidth(30);
    obj.flowPart76:setMinWidth(30);
    obj.flowPart76:setMaxWidth(35);
    obj.flowPart76:setMaxScaledWidth(35);
    obj.flowPart76:setAvoidScale(true);
    obj.flowPart76:setName("flowPart76");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart76);
    obj.edit43:setAlign("top");
    obj.edit43:setField("carRaca");
    obj.edit43:setFontSize(15);
    obj.edit43:setTransparent(true);
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setType("number");
    obj.edit43:setReadOnly(true);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");
    obj.edit43:setHeight(30);
    obj.edit43:setWidth(195);

    obj.horzLine40 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine40:setParent(obj.flowPart76);
    obj.horzLine40:setAlign("top");
    obj.horzLine40:setStrokeColor("#FFFFFF50");
    obj.horzLine40:setStrokeSize(1);
    obj.horzLine40:setName("horzLine40");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.tabelaDeAtributos);
    obj.dataLink34:setField("carRaca");
    obj.dataLink34:setName("dataLink34");

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.tabelaDeAtributos);
    obj.flowPart77:setName("flowPart77");
    obj.flowPart77:setHeight(50);
    obj.flowPart77:setMinScaledWidth(30);
    obj.flowPart77:setMaxScaledWidth(50);

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.flowPart77);
    obj.image25:setSRC("/imagens/plus.png");
    obj.image25:setHeight(15);
    obj.image25:setWidth(15);
    obj.image25:setLeft(15);
    obj.image25:setTop(5);
    obj.image25:setName("image25");

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.tabelaDeAtributos);
    obj.flowPart78:setHeight(50);
    obj.flowPart78:setMinScaledWidth(30);
    obj.flowPart78:setMinWidth(30);
    obj.flowPart78:setMaxWidth(35);
    obj.flowPart78:setMaxScaledWidth(35);
    obj.flowPart78:setAvoidScale(true);
    obj.flowPart78:setName("flowPart78");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart78);
    obj.edit44:setAlign("top");
    obj.edit44:setField("carTreino");
    obj.edit44:setFontSize(15);
    obj.edit44:setTransparent(true);
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setType("number");
    obj.edit44:setReadOnly(false);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");
    obj.edit44:setHeight(30);
    obj.edit44:setWidth(195);

    obj.horzLine41 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine41:setParent(obj.flowPart78);
    obj.horzLine41:setAlign("top");
    obj.horzLine41:setStrokeColor("#FFFFFF50");
    obj.horzLine41:setStrokeSize(1);
    obj.horzLine41:setName("horzLine41");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.tabelaDeAtributos);
    obj.dataLink35:setField("carTreino");
    obj.dataLink35:setName("dataLink35");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.tabelaDeAtributos);
    obj.flowPart79:setName("flowPart79");
    obj.flowPart79:setHeight(50);
    obj.flowPart79:setMinScaledWidth(30);
    obj.flowPart79:setMaxScaledWidth(50);

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.flowPart79);
    obj.image26:setSRC("/imagens/plus.png");
    obj.image26:setHeight(15);
    obj.image26:setWidth(15);
    obj.image26:setLeft(15);
    obj.image26:setTop(5);
    obj.image26:setName("image26");

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.tabelaDeAtributos);
    obj.flowPart80:setHeight(50);
    obj.flowPart80:setMinScaledWidth(30);
    obj.flowPart80:setMinWidth(30);
    obj.flowPart80:setMaxWidth(35);
    obj.flowPart80:setMaxScaledWidth(35);
    obj.flowPart80:setAvoidScale(true);
    obj.flowPart80:setName("flowPart80");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart80);
    obj.edit45:setAlign("top");
    obj.edit45:setField("carOutros");
    obj.edit45:setFontSize(15);
    obj.edit45:setTransparent(true);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setType("number");
    obj.edit45:setReadOnly(false);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");
    obj.edit45:setHeight(30);
    obj.edit45:setWidth(195);

    obj.horzLine42 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine42:setParent(obj.flowPart80);
    obj.horzLine42:setAlign("top");
    obj.horzLine42:setStrokeColor("#FFFFFF50");
    obj.horzLine42:setStrokeSize(1);
    obj.horzLine42:setName("horzLine42");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.tabelaDeAtributos);
    obj.dataLink36:setField("carOutros");
    obj.dataLink36:setName("dataLink36");

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.tabelaDeAtributos);
    obj.flowPart81:setName("flowPart81");
    obj.flowPart81:setHeight(50);
    obj.flowPart81:setMinScaledWidth(30);
    obj.flowPart81:setMaxScaledWidth(50);

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.flowPart81);
    obj.image27:setSRC("/imagens/equals.png");
    obj.image27:setHeight(15);
    obj.image27:setWidth(15);
    obj.image27:setLeft(15);
    obj.image27:setTop(5);
    obj.image27:setName("image27");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.tabelaDeAtributos);
    obj.flowPart82:setHeight(50);
    obj.flowPart82:setMinScaledWidth(30);
    obj.flowPart82:setMinWidth(30);
    obj.flowPart82:setMaxWidth(35);
    obj.flowPart82:setMaxScaledWidth(35);
    obj.flowPart82:setAvoidScale(true);
    obj.flowPart82:setName("flowPart82");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart82);
    obj.edit46:setAlign("top");
    obj.edit46:setField("carBase");
    obj.edit46:setFontSize(15);
    obj.edit46:setTransparent(true);
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setType("number");
    obj.edit46:setReadOnly(true);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");
    obj.edit46:setHeight(30);
    obj.edit46:setWidth(195);

    obj.horzLine43 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine43:setParent(obj.flowPart82);
    obj.horzLine43:setAlign("top");
    obj.horzLine43:setStrokeColor("#FFFFFF50");
    obj.horzLine43:setStrokeSize(1);
    obj.horzLine43:setName("horzLine43");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.tabelaDeAtributos);
    obj.dataLink37:setField("carBase");
    obj.dataLink37:setName("dataLink37");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.tabelaDeAtributos);
    obj.flowPart83:setName("flowPart83");
    obj.flowPart83:setHeight(50);
    obj.flowPart83:setMinScaledWidth(30);
    obj.flowPart83:setMaxScaledWidth(50);

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.flowPart83);
    obj.image28:setSRC("/imagens/plus.png");
    obj.image28:setHeight(15);
    obj.image28:setWidth(15);
    obj.image28:setLeft(15);
    obj.image28:setTop(5);
    obj.image28:setName("image28");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.tabelaDeAtributos);
    obj.flowPart84:setHeight(50);
    obj.flowPart84:setMinScaledWidth(30);
    obj.flowPart84:setMinWidth(30);
    obj.flowPart84:setMaxWidth(35);
    obj.flowPart84:setMaxScaledWidth(35);
    obj.flowPart84:setAvoidScale(true);
    obj.flowPart84:setName("flowPart84");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart84);
    obj.edit47:setAlign("top");
    obj.edit47:setField("carEquip");
    obj.edit47:setFontSize(15);
    obj.edit47:setTransparent(true);
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setType("number");
    obj.edit47:setReadOnly(false);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");
    obj.edit47:setHeight(30);
    obj.edit47:setWidth(195);

    obj.horzLine44 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine44:setParent(obj.flowPart84);
    obj.horzLine44:setAlign("top");
    obj.horzLine44:setStrokeColor("#FFFFFF50");
    obj.horzLine44:setStrokeSize(1);
    obj.horzLine44:setName("horzLine44");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.tabelaDeAtributos);
    obj.dataLink38:setField("carEquip");
    obj.dataLink38:setName("dataLink38");

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.tabelaDeAtributos);
    obj.flowPart85:setName("flowPart85");
    obj.flowPart85:setHeight(50);
    obj.flowPart85:setMinScaledWidth(30);
    obj.flowPart85:setMaxScaledWidth(50);

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.flowPart85);
    obj.image29:setSRC("/imagens/equals.png");
    obj.image29:setHeight(15);
    obj.image29:setWidth(15);
    obj.image29:setLeft(15);
    obj.image29:setTop(5);
    obj.image29:setName("image29");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.tabelaDeAtributos);
    obj.flowPart86:setHeight(50);
    obj.flowPart86:setMinScaledWidth(30);
    obj.flowPart86:setMinWidth(30);
    obj.flowPart86:setMaxWidth(35);
    obj.flowPart86:setMaxScaledWidth(35);
    obj.flowPart86:setAvoidScale(true);
    obj.flowPart86:setName("flowPart86");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart86);
    obj.edit48:setAlign("top");
    obj.edit48:setField("carTotal");
    obj.edit48:setFontSize(15);
    obj.edit48:setTransparent(true);
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setType("number");
    obj.edit48:setReadOnly(true);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");
    obj.edit48:setHeight(30);
    obj.edit48:setWidth(195);

    obj.horzLine45 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine45:setParent(obj.flowPart86);
    obj.horzLine45:setAlign("top");
    obj.horzLine45:setStrokeColor("#FFFFFF50");
    obj.horzLine45:setStrokeSize(1);
    obj.horzLine45:setName("horzLine45");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.tabelaDeAtributos);
    obj.dataLink39:setField("carTotal");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.tabelaDeAtributos);
    obj.dataLink40:setFields({'carNivel', 'carClasse', 'carRaca', 'carTreino',
                           'carOutros', 'carBase', 'carEquip', 'carTotal'});
    obj.dataLink40:setName("dataLink40");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.tabelaDeAtributos);
    obj.flowPart87:setHeight(20);
    obj.flowPart87:setMinScaledWidth(60);
    obj.flowPart87:setMaxScaledWidth(85);
    obj.flowPart87:setName("flowPart87");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart87);
    obj.label34:setText("Inteligência");
    obj.label34:setAlign("client");
    obj.label34:setField("");
    obj.label34:setFontSize(8);
    obj.label34:setVertTextAlign("center");
    obj.label34:setHorzTextAlign("leading");
    obj.label34:setName("label34");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.tabelaDeAtributos);
    obj.flowPart88:setHeight(50);
    obj.flowPart88:setMinScaledWidth(30);
    obj.flowPart88:setMinWidth(30);
    obj.flowPart88:setMaxWidth(35);
    obj.flowPart88:setMaxScaledWidth(35);
    obj.flowPart88:setAvoidScale(true);
    obj.flowPart88:setName("flowPart88");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart88);
    obj.edit49:setAlign("top");
    obj.edit49:setField("intNivel");
    obj.edit49:setFontSize(15);
    obj.edit49:setTransparent(true);
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setType("number");
    obj.edit49:setReadOnly(false);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");
    obj.edit49:setHeight(30);
    obj.edit49:setWidth(195);

    obj.horzLine46 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine46:setParent(obj.flowPart88);
    obj.horzLine46:setAlign("top");
    obj.horzLine46:setStrokeColor("#FFFFFF50");
    obj.horzLine46:setStrokeSize(1);
    obj.horzLine46:setName("horzLine46");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.tabelaDeAtributos);
    obj.dataLink41:setField("intNivel");
    obj.dataLink41:setName("dataLink41");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.tabelaDeAtributos);
    obj.flowPart89:setName("flowPart89");
    obj.flowPart89:setHeight(50);
    obj.flowPart89:setMinScaledWidth(30);
    obj.flowPart89:setMaxScaledWidth(50);

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.flowPart89);
    obj.image30:setSRC("/imagens/plus.png");
    obj.image30:setHeight(15);
    obj.image30:setWidth(15);
    obj.image30:setLeft(15);
    obj.image30:setTop(5);
    obj.image30:setName("image30");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.tabelaDeAtributos);
    obj.flowPart90:setHeight(50);
    obj.flowPart90:setMinScaledWidth(30);
    obj.flowPart90:setMinWidth(30);
    obj.flowPart90:setMaxWidth(35);
    obj.flowPart90:setMaxScaledWidth(35);
    obj.flowPart90:setAvoidScale(true);
    obj.flowPart90:setName("flowPart90");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart90);
    obj.edit50:setAlign("top");
    obj.edit50:setField("intClasse");
    obj.edit50:setFontSize(15);
    obj.edit50:setTransparent(true);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setType("number");
    obj.edit50:setReadOnly(true);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");
    obj.edit50:setHeight(30);
    obj.edit50:setWidth(195);

    obj.horzLine47 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine47:setParent(obj.flowPart90);
    obj.horzLine47:setAlign("top");
    obj.horzLine47:setStrokeColor("#FFFFFF50");
    obj.horzLine47:setStrokeSize(1);
    obj.horzLine47:setName("horzLine47");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.tabelaDeAtributos);
    obj.dataLink42:setField("intClasse");
    obj.dataLink42:setName("dataLink42");

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.tabelaDeAtributos);
    obj.flowPart91:setName("flowPart91");
    obj.flowPart91:setHeight(50);
    obj.flowPart91:setMinScaledWidth(30);
    obj.flowPart91:setMaxScaledWidth(50);

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.flowPart91);
    obj.image31:setSRC("/imagens/plus.png");
    obj.image31:setHeight(15);
    obj.image31:setWidth(15);
    obj.image31:setLeft(15);
    obj.image31:setTop(5);
    obj.image31:setName("image31");

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.tabelaDeAtributos);
    obj.flowPart92:setHeight(50);
    obj.flowPart92:setMinScaledWidth(30);
    obj.flowPart92:setMinWidth(30);
    obj.flowPart92:setMaxWidth(35);
    obj.flowPart92:setMaxScaledWidth(35);
    obj.flowPart92:setAvoidScale(true);
    obj.flowPart92:setName("flowPart92");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart92);
    obj.edit51:setAlign("top");
    obj.edit51:setField("intRaca");
    obj.edit51:setFontSize(15);
    obj.edit51:setTransparent(true);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setType("number");
    obj.edit51:setReadOnly(true);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");
    obj.edit51:setHeight(30);
    obj.edit51:setWidth(195);

    obj.horzLine48 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine48:setParent(obj.flowPart92);
    obj.horzLine48:setAlign("top");
    obj.horzLine48:setStrokeColor("#FFFFFF50");
    obj.horzLine48:setStrokeSize(1);
    obj.horzLine48:setName("horzLine48");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.tabelaDeAtributos);
    obj.dataLink43:setField("intRaca");
    obj.dataLink43:setName("dataLink43");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.tabelaDeAtributos);
    obj.flowPart93:setName("flowPart93");
    obj.flowPart93:setHeight(50);
    obj.flowPart93:setMinScaledWidth(30);
    obj.flowPart93:setMaxScaledWidth(50);

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.flowPart93);
    obj.image32:setSRC("/imagens/plus.png");
    obj.image32:setHeight(15);
    obj.image32:setWidth(15);
    obj.image32:setLeft(15);
    obj.image32:setTop(5);
    obj.image32:setName("image32");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.tabelaDeAtributos);
    obj.flowPart94:setHeight(50);
    obj.flowPart94:setMinScaledWidth(30);
    obj.flowPart94:setMinWidth(30);
    obj.flowPart94:setMaxWidth(35);
    obj.flowPart94:setMaxScaledWidth(35);
    obj.flowPart94:setAvoidScale(true);
    obj.flowPart94:setName("flowPart94");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart94);
    obj.edit52:setAlign("top");
    obj.edit52:setField("intTreino");
    obj.edit52:setFontSize(15);
    obj.edit52:setTransparent(true);
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setType("number");
    obj.edit52:setReadOnly(false);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");
    obj.edit52:setHeight(30);
    obj.edit52:setWidth(195);

    obj.horzLine49 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine49:setParent(obj.flowPart94);
    obj.horzLine49:setAlign("top");
    obj.horzLine49:setStrokeColor("#FFFFFF50");
    obj.horzLine49:setStrokeSize(1);
    obj.horzLine49:setName("horzLine49");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.tabelaDeAtributos);
    obj.dataLink44:setField("intTreino");
    obj.dataLink44:setName("dataLink44");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.tabelaDeAtributos);
    obj.flowPart95:setName("flowPart95");
    obj.flowPart95:setHeight(50);
    obj.flowPart95:setMinScaledWidth(30);
    obj.flowPart95:setMaxScaledWidth(50);

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.flowPart95);
    obj.image33:setSRC("/imagens/plus.png");
    obj.image33:setHeight(15);
    obj.image33:setWidth(15);
    obj.image33:setLeft(15);
    obj.image33:setTop(5);
    obj.image33:setName("image33");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.tabelaDeAtributos);
    obj.flowPart96:setHeight(50);
    obj.flowPart96:setMinScaledWidth(30);
    obj.flowPart96:setMinWidth(30);
    obj.flowPart96:setMaxWidth(35);
    obj.flowPart96:setMaxScaledWidth(35);
    obj.flowPart96:setAvoidScale(true);
    obj.flowPart96:setName("flowPart96");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart96);
    obj.edit53:setAlign("top");
    obj.edit53:setField("intOutros");
    obj.edit53:setFontSize(15);
    obj.edit53:setTransparent(true);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setType("number");
    obj.edit53:setReadOnly(false);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");
    obj.edit53:setHeight(30);
    obj.edit53:setWidth(195);

    obj.horzLine50 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine50:setParent(obj.flowPart96);
    obj.horzLine50:setAlign("top");
    obj.horzLine50:setStrokeColor("#FFFFFF50");
    obj.horzLine50:setStrokeSize(1);
    obj.horzLine50:setName("horzLine50");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.tabelaDeAtributos);
    obj.dataLink45:setField("intOutros");
    obj.dataLink45:setName("dataLink45");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.tabelaDeAtributos);
    obj.flowPart97:setName("flowPart97");
    obj.flowPart97:setHeight(50);
    obj.flowPart97:setMinScaledWidth(30);
    obj.flowPart97:setMaxScaledWidth(50);

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.flowPart97);
    obj.image34:setSRC("/imagens/equals.png");
    obj.image34:setHeight(15);
    obj.image34:setWidth(15);
    obj.image34:setLeft(15);
    obj.image34:setTop(5);
    obj.image34:setName("image34");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.tabelaDeAtributos);
    obj.flowPart98:setHeight(50);
    obj.flowPart98:setMinScaledWidth(30);
    obj.flowPart98:setMinWidth(30);
    obj.flowPart98:setMaxWidth(35);
    obj.flowPart98:setMaxScaledWidth(35);
    obj.flowPart98:setAvoidScale(true);
    obj.flowPart98:setName("flowPart98");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart98);
    obj.edit54:setAlign("top");
    obj.edit54:setField("intBase");
    obj.edit54:setFontSize(15);
    obj.edit54:setTransparent(true);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setType("number");
    obj.edit54:setReadOnly(true);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");
    obj.edit54:setHeight(30);
    obj.edit54:setWidth(195);

    obj.horzLine51 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine51:setParent(obj.flowPart98);
    obj.horzLine51:setAlign("top");
    obj.horzLine51:setStrokeColor("#FFFFFF50");
    obj.horzLine51:setStrokeSize(1);
    obj.horzLine51:setName("horzLine51");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.tabelaDeAtributos);
    obj.dataLink46:setField("intBase");
    obj.dataLink46:setName("dataLink46");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.tabelaDeAtributos);
    obj.flowPart99:setName("flowPart99");
    obj.flowPart99:setHeight(50);
    obj.flowPart99:setMinScaledWidth(30);
    obj.flowPart99:setMaxScaledWidth(50);

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.flowPart99);
    obj.image35:setSRC("/imagens/plus.png");
    obj.image35:setHeight(15);
    obj.image35:setWidth(15);
    obj.image35:setLeft(15);
    obj.image35:setTop(5);
    obj.image35:setName("image35");

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.tabelaDeAtributos);
    obj.flowPart100:setHeight(50);
    obj.flowPart100:setMinScaledWidth(30);
    obj.flowPart100:setMinWidth(30);
    obj.flowPart100:setMaxWidth(35);
    obj.flowPart100:setMaxScaledWidth(35);
    obj.flowPart100:setAvoidScale(true);
    obj.flowPart100:setName("flowPart100");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart100);
    obj.edit55:setAlign("top");
    obj.edit55:setField("intEquip");
    obj.edit55:setFontSize(15);
    obj.edit55:setTransparent(true);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setType("number");
    obj.edit55:setReadOnly(false);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");
    obj.edit55:setHeight(30);
    obj.edit55:setWidth(195);

    obj.horzLine52 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine52:setParent(obj.flowPart100);
    obj.horzLine52:setAlign("top");
    obj.horzLine52:setStrokeColor("#FFFFFF50");
    obj.horzLine52:setStrokeSize(1);
    obj.horzLine52:setName("horzLine52");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.tabelaDeAtributos);
    obj.dataLink47:setField("intEquip");
    obj.dataLink47:setName("dataLink47");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.tabelaDeAtributos);
    obj.flowPart101:setName("flowPart101");
    obj.flowPart101:setHeight(50);
    obj.flowPart101:setMinScaledWidth(30);
    obj.flowPart101:setMaxScaledWidth(50);

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.flowPart101);
    obj.image36:setSRC("/imagens/equals.png");
    obj.image36:setHeight(15);
    obj.image36:setWidth(15);
    obj.image36:setLeft(15);
    obj.image36:setTop(5);
    obj.image36:setName("image36");

    obj.flowPart102 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.tabelaDeAtributos);
    obj.flowPart102:setHeight(50);
    obj.flowPart102:setMinScaledWidth(30);
    obj.flowPart102:setMinWidth(30);
    obj.flowPart102:setMaxWidth(35);
    obj.flowPart102:setMaxScaledWidth(35);
    obj.flowPart102:setAvoidScale(true);
    obj.flowPart102:setName("flowPart102");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart102);
    obj.edit56:setAlign("top");
    obj.edit56:setField("intTotal");
    obj.edit56:setFontSize(15);
    obj.edit56:setTransparent(true);
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setType("number");
    obj.edit56:setReadOnly(true);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");
    obj.edit56:setHeight(30);
    obj.edit56:setWidth(195);

    obj.horzLine53 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine53:setParent(obj.flowPart102);
    obj.horzLine53:setAlign("top");
    obj.horzLine53:setStrokeColor("#FFFFFF50");
    obj.horzLine53:setStrokeSize(1);
    obj.horzLine53:setName("horzLine53");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.tabelaDeAtributos);
    obj.dataLink48:setField("intTotal");
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.tabelaDeAtributos);
    obj.dataLink49:setFields({'intNivel', 'intClasse', 'intRaca', 'intTreino',
                           'intOutros', 'intBase', 'intEquip', 'intTotal'});
    obj.dataLink49:setName("dataLink49");

    obj.flowPart103 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.tabelaDeAtributos);
    obj.flowPart103:setHeight(20);
    obj.flowPart103:setMinScaledWidth(60);
    obj.flowPart103:setMaxScaledWidth(85);
    obj.flowPart103:setName("flowPart103");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart103);
    obj.label35:setText("Sabedoria");
    obj.label35:setAlign("client");
    obj.label35:setField("");
    obj.label35:setFontSize(8);
    obj.label35:setVertTextAlign("center");
    obj.label35:setHorzTextAlign("leading");
    obj.label35:setName("label35");

    obj.flowPart104 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.tabelaDeAtributos);
    obj.flowPart104:setHeight(50);
    obj.flowPart104:setMinScaledWidth(30);
    obj.flowPart104:setMinWidth(30);
    obj.flowPart104:setMaxWidth(35);
    obj.flowPart104:setMaxScaledWidth(35);
    obj.flowPart104:setAvoidScale(true);
    obj.flowPart104:setName("flowPart104");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart104);
    obj.edit57:setAlign("top");
    obj.edit57:setField("sabNivel");
    obj.edit57:setFontSize(15);
    obj.edit57:setTransparent(true);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setType("number");
    obj.edit57:setReadOnly(false);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");
    obj.edit57:setHeight(30);
    obj.edit57:setWidth(195);

    obj.horzLine54 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine54:setParent(obj.flowPart104);
    obj.horzLine54:setAlign("top");
    obj.horzLine54:setStrokeColor("#FFFFFF50");
    obj.horzLine54:setStrokeSize(1);
    obj.horzLine54:setName("horzLine54");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.tabelaDeAtributos);
    obj.dataLink50:setField("sabNivel");
    obj.dataLink50:setName("dataLink50");

    obj.flowPart105 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.tabelaDeAtributos);
    obj.flowPart105:setName("flowPart105");
    obj.flowPart105:setHeight(50);
    obj.flowPart105:setMinScaledWidth(30);
    obj.flowPart105:setMaxScaledWidth(50);

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.flowPart105);
    obj.image37:setSRC("/imagens/plus.png");
    obj.image37:setHeight(15);
    obj.image37:setWidth(15);
    obj.image37:setLeft(15);
    obj.image37:setTop(5);
    obj.image37:setName("image37");

    obj.flowPart106 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.tabelaDeAtributos);
    obj.flowPart106:setHeight(50);
    obj.flowPart106:setMinScaledWidth(30);
    obj.flowPart106:setMinWidth(30);
    obj.flowPart106:setMaxWidth(35);
    obj.flowPart106:setMaxScaledWidth(35);
    obj.flowPart106:setAvoidScale(true);
    obj.flowPart106:setName("flowPart106");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart106);
    obj.edit58:setAlign("top");
    obj.edit58:setField("sabClasse");
    obj.edit58:setFontSize(15);
    obj.edit58:setTransparent(true);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setType("number");
    obj.edit58:setReadOnly(true);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");
    obj.edit58:setHeight(30);
    obj.edit58:setWidth(195);

    obj.horzLine55 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine55:setParent(obj.flowPart106);
    obj.horzLine55:setAlign("top");
    obj.horzLine55:setStrokeColor("#FFFFFF50");
    obj.horzLine55:setStrokeSize(1);
    obj.horzLine55:setName("horzLine55");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.tabelaDeAtributos);
    obj.dataLink51:setField("sabClasse");
    obj.dataLink51:setName("dataLink51");

    obj.flowPart107 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.tabelaDeAtributos);
    obj.flowPart107:setName("flowPart107");
    obj.flowPart107:setHeight(50);
    obj.flowPart107:setMinScaledWidth(30);
    obj.flowPart107:setMaxScaledWidth(50);

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.flowPart107);
    obj.image38:setSRC("/imagens/plus.png");
    obj.image38:setHeight(15);
    obj.image38:setWidth(15);
    obj.image38:setLeft(15);
    obj.image38:setTop(5);
    obj.image38:setName("image38");

    obj.flowPart108 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.tabelaDeAtributos);
    obj.flowPart108:setHeight(50);
    obj.flowPart108:setMinScaledWidth(30);
    obj.flowPart108:setMinWidth(30);
    obj.flowPart108:setMaxWidth(35);
    obj.flowPart108:setMaxScaledWidth(35);
    obj.flowPart108:setAvoidScale(true);
    obj.flowPart108:setName("flowPart108");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart108);
    obj.edit59:setAlign("top");
    obj.edit59:setField("sabRaca");
    obj.edit59:setFontSize(15);
    obj.edit59:setTransparent(true);
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setType("number");
    obj.edit59:setReadOnly(true);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");
    obj.edit59:setHeight(30);
    obj.edit59:setWidth(195);

    obj.horzLine56 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine56:setParent(obj.flowPart108);
    obj.horzLine56:setAlign("top");
    obj.horzLine56:setStrokeColor("#FFFFFF50");
    obj.horzLine56:setStrokeSize(1);
    obj.horzLine56:setName("horzLine56");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.tabelaDeAtributos);
    obj.dataLink52:setField("sabRaca");
    obj.dataLink52:setName("dataLink52");

    obj.flowPart109 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.tabelaDeAtributos);
    obj.flowPart109:setName("flowPart109");
    obj.flowPart109:setHeight(50);
    obj.flowPart109:setMinScaledWidth(30);
    obj.flowPart109:setMaxScaledWidth(50);

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.flowPart109);
    obj.image39:setSRC("/imagens/plus.png");
    obj.image39:setHeight(15);
    obj.image39:setWidth(15);
    obj.image39:setLeft(15);
    obj.image39:setTop(5);
    obj.image39:setName("image39");

    obj.flowPart110 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.tabelaDeAtributos);
    obj.flowPart110:setHeight(50);
    obj.flowPart110:setMinScaledWidth(30);
    obj.flowPart110:setMinWidth(30);
    obj.flowPart110:setMaxWidth(35);
    obj.flowPart110:setMaxScaledWidth(35);
    obj.flowPart110:setAvoidScale(true);
    obj.flowPart110:setName("flowPart110");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart110);
    obj.edit60:setAlign("top");
    obj.edit60:setField("sabTreino");
    obj.edit60:setFontSize(15);
    obj.edit60:setTransparent(true);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setType("number");
    obj.edit60:setReadOnly(false);
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");
    obj.edit60:setHeight(30);
    obj.edit60:setWidth(195);

    obj.horzLine57 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine57:setParent(obj.flowPart110);
    obj.horzLine57:setAlign("top");
    obj.horzLine57:setStrokeColor("#FFFFFF50");
    obj.horzLine57:setStrokeSize(1);
    obj.horzLine57:setName("horzLine57");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.tabelaDeAtributos);
    obj.dataLink53:setField("sabTreino");
    obj.dataLink53:setName("dataLink53");

    obj.flowPart111 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.tabelaDeAtributos);
    obj.flowPart111:setName("flowPart111");
    obj.flowPart111:setHeight(50);
    obj.flowPart111:setMinScaledWidth(30);
    obj.flowPart111:setMaxScaledWidth(50);

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.flowPart111);
    obj.image40:setSRC("/imagens/plus.png");
    obj.image40:setHeight(15);
    obj.image40:setWidth(15);
    obj.image40:setLeft(15);
    obj.image40:setTop(5);
    obj.image40:setName("image40");

    obj.flowPart112 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.tabelaDeAtributos);
    obj.flowPart112:setHeight(50);
    obj.flowPart112:setMinScaledWidth(30);
    obj.flowPart112:setMinWidth(30);
    obj.flowPart112:setMaxWidth(35);
    obj.flowPart112:setMaxScaledWidth(35);
    obj.flowPart112:setAvoidScale(true);
    obj.flowPart112:setName("flowPart112");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart112);
    obj.edit61:setAlign("top");
    obj.edit61:setField("sabOutros");
    obj.edit61:setFontSize(15);
    obj.edit61:setTransparent(true);
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setType("number");
    obj.edit61:setReadOnly(false);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");
    obj.edit61:setHeight(30);
    obj.edit61:setWidth(195);

    obj.horzLine58 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine58:setParent(obj.flowPart112);
    obj.horzLine58:setAlign("top");
    obj.horzLine58:setStrokeColor("#FFFFFF50");
    obj.horzLine58:setStrokeSize(1);
    obj.horzLine58:setName("horzLine58");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.tabelaDeAtributos);
    obj.dataLink54:setField("sabOutros");
    obj.dataLink54:setName("dataLink54");

    obj.flowPart113 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.tabelaDeAtributos);
    obj.flowPart113:setName("flowPart113");
    obj.flowPart113:setHeight(50);
    obj.flowPart113:setMinScaledWidth(30);
    obj.flowPart113:setMaxScaledWidth(50);

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.flowPart113);
    obj.image41:setSRC("/imagens/equals.png");
    obj.image41:setHeight(15);
    obj.image41:setWidth(15);
    obj.image41:setLeft(15);
    obj.image41:setTop(5);
    obj.image41:setName("image41");

    obj.flowPart114 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.tabelaDeAtributos);
    obj.flowPart114:setHeight(50);
    obj.flowPart114:setMinScaledWidth(30);
    obj.flowPart114:setMinWidth(30);
    obj.flowPart114:setMaxWidth(35);
    obj.flowPart114:setMaxScaledWidth(35);
    obj.flowPart114:setAvoidScale(true);
    obj.flowPart114:setName("flowPart114");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart114);
    obj.edit62:setAlign("top");
    obj.edit62:setField("sabBase");
    obj.edit62:setFontSize(15);
    obj.edit62:setTransparent(true);
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setType("number");
    obj.edit62:setReadOnly(true);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");
    obj.edit62:setHeight(30);
    obj.edit62:setWidth(195);

    obj.horzLine59 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine59:setParent(obj.flowPart114);
    obj.horzLine59:setAlign("top");
    obj.horzLine59:setStrokeColor("#FFFFFF50");
    obj.horzLine59:setStrokeSize(1);
    obj.horzLine59:setName("horzLine59");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.tabelaDeAtributos);
    obj.dataLink55:setField("sabBase");
    obj.dataLink55:setName("dataLink55");

    obj.flowPart115 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.tabelaDeAtributos);
    obj.flowPart115:setName("flowPart115");
    obj.flowPart115:setHeight(50);
    obj.flowPart115:setMinScaledWidth(30);
    obj.flowPart115:setMaxScaledWidth(50);

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.flowPart115);
    obj.image42:setSRC("/imagens/plus.png");
    obj.image42:setHeight(15);
    obj.image42:setWidth(15);
    obj.image42:setLeft(15);
    obj.image42:setTop(5);
    obj.image42:setName("image42");

    obj.flowPart116 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.tabelaDeAtributos);
    obj.flowPart116:setHeight(50);
    obj.flowPart116:setMinScaledWidth(30);
    obj.flowPart116:setMinWidth(30);
    obj.flowPart116:setMaxWidth(35);
    obj.flowPart116:setMaxScaledWidth(35);
    obj.flowPart116:setAvoidScale(true);
    obj.flowPart116:setName("flowPart116");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart116);
    obj.edit63:setAlign("top");
    obj.edit63:setField("sabEquip");
    obj.edit63:setFontSize(15);
    obj.edit63:setTransparent(true);
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setType("number");
    obj.edit63:setReadOnly(false);
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");
    obj.edit63:setHeight(30);
    obj.edit63:setWidth(195);

    obj.horzLine60 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine60:setParent(obj.flowPart116);
    obj.horzLine60:setAlign("top");
    obj.horzLine60:setStrokeColor("#FFFFFF50");
    obj.horzLine60:setStrokeSize(1);
    obj.horzLine60:setName("horzLine60");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.tabelaDeAtributos);
    obj.dataLink56:setField("sabEquip");
    obj.dataLink56:setName("dataLink56");

    obj.flowPart117 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.tabelaDeAtributos);
    obj.flowPart117:setName("flowPart117");
    obj.flowPart117:setHeight(50);
    obj.flowPart117:setMinScaledWidth(30);
    obj.flowPart117:setMaxScaledWidth(50);

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.flowPart117);
    obj.image43:setSRC("/imagens/equals.png");
    obj.image43:setHeight(15);
    obj.image43:setWidth(15);
    obj.image43:setLeft(15);
    obj.image43:setTop(5);
    obj.image43:setName("image43");

    obj.flowPart118 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.tabelaDeAtributos);
    obj.flowPart118:setHeight(50);
    obj.flowPart118:setMinScaledWidth(30);
    obj.flowPart118:setMinWidth(30);
    obj.flowPart118:setMaxWidth(35);
    obj.flowPart118:setMaxScaledWidth(35);
    obj.flowPart118:setAvoidScale(true);
    obj.flowPart118:setName("flowPart118");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart118);
    obj.edit64:setAlign("top");
    obj.edit64:setField("sabTotal");
    obj.edit64:setFontSize(15);
    obj.edit64:setTransparent(true);
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setType("number");
    obj.edit64:setReadOnly(true);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");
    obj.edit64:setHeight(30);
    obj.edit64:setWidth(195);

    obj.horzLine61 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine61:setParent(obj.flowPart118);
    obj.horzLine61:setAlign("top");
    obj.horzLine61:setStrokeColor("#FFFFFF50");
    obj.horzLine61:setStrokeSize(1);
    obj.horzLine61:setName("horzLine61");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.tabelaDeAtributos);
    obj.dataLink57:setField("sabTotal");
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.tabelaDeAtributos);
    obj.dataLink58:setFields({'sabNivel', 'sabClasse', 'sabRaca', 'sabTreino',
                           'sabOutros', 'sabBase', 'sabEquip', 'sabTotal'});
    obj.dataLink58:setName("dataLink58");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.perfilLayout);
    obj.flowLineBreak4:setLineSpacing(10);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart119 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.perfilLayout);
    obj.flowPart119:setHeight(2);
    obj.flowPart119:setMinScaledWidth(100);
    obj.flowPart119:setMaxScaledWidth(1600);
    obj.flowPart119:setName("flowPart119");

    obj.horzLine62 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine62:setParent(obj.flowPart119);
    obj.horzLine62:setStrokeColor("#FFFFFF50");
    obj.horzLine62:setStrokeSize(0.6);
    obj.horzLine62:setStrokeCap("round");
    obj.horzLine62:setScaleY(0.1);
    obj.horzLine62:setTop(1);
    obj.horzLine62:setName("horzLine62");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.perfilLayout);
    obj.flowLineBreak5:setLineSpacing(10);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.layoutPtBonusEConhecimentos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.layoutPtBonusEConhecimentos:setParent(obj.perfilLayout);
    obj.layoutPtBonusEConhecimentos:setMinWidth(320);
    obj.layoutPtBonusEConhecimentos:setMaxWidth(1600);
    obj.layoutPtBonusEConhecimentos:setName("layoutPtBonusEConhecimentos");
    obj.layoutPtBonusEConhecimentos:setAvoidScale(true);
    obj.layoutPtBonusEConhecimentos:setAutoHeight(true);
    obj.layoutPtBonusEConhecimentos:setVertAlign("leading");
    obj.layoutPtBonusEConhecimentos:setMaxControlsPerLine(1);
    obj.layoutPtBonusEConhecimentos:setHorzAlign("center");
    obj.layoutPtBonusEConhecimentos:setMargins({bottom=15});

    obj.topoPtBonusEConhecimentos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.topoPtBonusEConhecimentos:setParent(obj.layoutPtBonusEConhecimentos);
    obj.topoPtBonusEConhecimentos:setMinWidth(320);
    obj.topoPtBonusEConhecimentos:setMaxWidth(1600);
    obj.topoPtBonusEConhecimentos:setName("topoPtBonusEConhecimentos");
    obj.topoPtBonusEConhecimentos:setAvoidScale(true);
    obj.topoPtBonusEConhecimentos:setAutoHeight(true);
    obj.topoPtBonusEConhecimentos:setVertAlign("leading");
    obj.topoPtBonusEConhecimentos:setMaxControlsPerLine(8);
    obj.topoPtBonusEConhecimentos:setHorzAlign("center");
    obj.topoPtBonusEConhecimentos:setMargins({bottom=15});

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.topoPtBonusEConhecimentos);
    obj.label36:setText("Pontos Restantes: ");
    obj.label36:setWidth(150);
    obj.label36:setName("label36");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.topoPtBonusEConhecimentos);
    obj.edit65:setAlign("client");
    obj.edit65:setField("pontosRestantes");
    obj.edit65:setFontSize(12);
    obj.edit65:setTransparent(true);
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setType("number");
    obj.edit65:setReadOnly(true);
    obj.edit65:setMin(0);
    obj.edit65:setName("edit65");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.topoPtBonusEConhecimentos);
    obj.label37:setText("Pontos Treinados: ");
    obj.label37:setWidth(150);
    obj.label37:setName("label37");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.topoPtBonusEConhecimentos);
    obj.edit66:setAlign("client");
    obj.edit66:setField("pontosTreinados");
    obj.edit66:setFontSize(12);
    obj.edit66:setTransparent(true);
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setType("number");
    obj.edit66:setReadOnly(true);
    obj.edit66:setMin(0);
    obj.edit66:setName("edit66");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.topoPtBonusEConhecimentos);
    obj.label38:setText("Pontos de Conhecimento: ");
    obj.label38:setWidth(150);
    obj.label38:setName("label38");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.topoPtBonusEConhecimentos);
    obj.edit67:setAlign("client");
    obj.edit67:setField("pontosDeConhecimento");
    obj.edit67:setFontSize(12);
    obj.edit67:setTransparent(true);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setType("number");
    obj.edit67:setReadOnly(true);
    obj.edit67:setMin(0);
    obj.edit67:setName("edit67");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.topoPtBonusEConhecimentos);
    obj.label39:setText("Pontos Con. Distribuidos: ");
    obj.label39:setWidth(150);
    obj.label39:setName("label39");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.topoPtBonusEConhecimentos);
    obj.edit68:setAlign("client");
    obj.edit68:setField("pontosDeConhecimentoDistribuidos");
    obj.edit68:setFontSize(12);
    obj.edit68:setTransparent(true);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setType("number");
    obj.edit68:setReadOnly(true);
    obj.edit68:setMin(0);
    obj.edit68:setName("edit68");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.topoPtBonusEConhecimentos);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.topoPtBonusEConhecimentos);
    obj.button2:setText("Zera");
    obj.button2:setName("button2");

    obj.tabelaPtBonusEConhecimentos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tabelaPtBonusEConhecimentos:setParent(obj.layoutPtBonusEConhecimentos);
    obj.tabelaPtBonusEConhecimentos:setMinWidth(320);
    obj.tabelaPtBonusEConhecimentos:setMaxWidth(1600);
    obj.tabelaPtBonusEConhecimentos:setName("tabelaPtBonusEConhecimentos");
    obj.tabelaPtBonusEConhecimentos:setAvoidScale(true);
    obj.tabelaPtBonusEConhecimentos:setAutoHeight(true);
    obj.tabelaPtBonusEConhecimentos:setVertAlign("leading");
    obj.tabelaPtBonusEConhecimentos:setMaxControlsPerLine(2);
    obj.tabelaPtBonusEConhecimentos:setHorzAlign("center");
    obj.tabelaPtBonusEConhecimentos:setMargins({bottom=15});

    obj.tabelaPontosBonus = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tabelaPontosBonus:setParent(obj.tabelaPtBonusEConhecimentos);
    obj.tabelaPontosBonus:setMinWidth(200);
    obj.tabelaPontosBonus:setMaxWidth(450);
    obj.tabelaPontosBonus:setName("tabelaPontosBonus");
    obj.tabelaPontosBonus:setAvoidScale(true);
    obj.tabelaPontosBonus:setAutoHeight(true);
    obj.tabelaPontosBonus:setVertAlign("leading");
    obj.tabelaPontosBonus:setMaxControlsPerLine(2);
    obj.tabelaPontosBonus:setHorzAlign("center");

    obj.flowPart120 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.tabelaPontosBonus);
    obj.flowPart120:setHeight(20);
    obj.flowPart120:setMinWidth(180);
    obj.flowPart120:setMaxWidth(180);
    obj.flowPart120:setName("flowPart120");
    obj.flowPart120:setMargins({top=5, bottom=5,right=10});

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart120);
    obj.label40:setText("Percepção");
    obj.label40:setAlign("left");
    obj.label40:setFontSize(18);
    obj.label40:setVertTextAlign("center");
    obj.label40:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label40, "fontStyle",  "italic");
    obj.label40:setWidth(200);
    obj.label40:setName("label40");

    obj.horzLine63 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine63:setParent(obj.flowPart120);
    obj.horzLine63:setAlign("bottom");
    obj.horzLine63:setStrokeColor("#FFFFFF50");
    obj.horzLine63:setStrokeSize(1);
    obj.horzLine63:setName("horzLine63");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.tabelaPontosBonus);
    obj.flowLayout1:setHeight(20);
    obj.flowLayout1:setMinWidth(150);
    obj.flowLayout1:setMaxWidth(200);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setName("flowLayout1");

    obj.percepcaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.percepcaoMinus:setParent(obj.flowLayout1);
    obj.percepcaoMinus:setName("percepcaoMinus");
    obj.percepcaoMinus:setText("-");
    obj.percepcaoMinus:setWidth(20);
    obj.percepcaoMinus:setHeight(20);

    obj.flowPart121 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.flowLayout1);
    obj.flowPart121:setHeight(20);
    obj.flowPart121:setMinWidth(20);
    obj.flowPart121:setMaxWidth(20);
    obj.flowPart121:setName("flowPart121");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart121);
    obj.edit69:setAlign("client");
    obj.edit69:setField("percepcao");
    obj.edit69:setFontSize(12);
    obj.edit69:setTransparent(true);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setType("number");
    obj.edit69:setReadOnly(true);
    obj.edit69:setMin(0);
    obj.edit69:setName("edit69");

    obj.percepcaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.percepcaoPlus:setParent(obj.flowLayout1);
    obj.percepcaoPlus:setName("percepcaoPlus");
    obj.percepcaoPlus:setText("+");
    obj.percepcaoPlus:setWidth(20);
    obj.percepcaoPlus:setHeight(20);

    obj.flowPart122 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.tabelaPontosBonus);
    obj.flowPart122:setHeight(20);
    obj.flowPart122:setMinWidth(180);
    obj.flowPart122:setMaxWidth(180);
    obj.flowPart122:setName("flowPart122");
    obj.flowPart122:setMargins({top=5, bottom=5,right=10});

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart122);
    obj.label41:setText("Intimidação");
    obj.label41:setAlign("left");
    obj.label41:setFontSize(18);
    obj.label41:setVertTextAlign("center");
    obj.label41:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label41, "fontStyle",  "italic");
    obj.label41:setWidth(200);
    obj.label41:setName("label41");

    obj.horzLine64 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine64:setParent(obj.flowPart122);
    obj.horzLine64:setAlign("bottom");
    obj.horzLine64:setStrokeColor("#FFFFFF50");
    obj.horzLine64:setStrokeSize(1);
    obj.horzLine64:setName("horzLine64");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.tabelaPontosBonus);
    obj.flowLayout2:setHeight(20);
    obj.flowLayout2:setMinWidth(150);
    obj.flowLayout2:setMaxWidth(200);
    obj.flowLayout2:setMaxControlsPerLine(3);
    obj.flowLayout2:setName("flowLayout2");

    obj.intimidacaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.intimidacaoMinus:setParent(obj.flowLayout2);
    obj.intimidacaoMinus:setName("intimidacaoMinus");
    obj.intimidacaoMinus:setText("-");
    obj.intimidacaoMinus:setWidth(20);
    obj.intimidacaoMinus:setHeight(20);

    obj.flowPart123 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart123:setParent(obj.flowLayout2);
    obj.flowPart123:setHeight(20);
    obj.flowPart123:setMinWidth(20);
    obj.flowPart123:setMaxWidth(20);
    obj.flowPart123:setName("flowPart123");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart123);
    obj.edit70:setAlign("client");
    obj.edit70:setField("intimidacao");
    obj.edit70:setFontSize(12);
    obj.edit70:setTransparent(true);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setType("number");
    obj.edit70:setReadOnly(true);
    obj.edit70:setMin(0);
    obj.edit70:setName("edit70");

    obj.intimidacaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.intimidacaoPlus:setParent(obj.flowLayout2);
    obj.intimidacaoPlus:setName("intimidacaoPlus");
    obj.intimidacaoPlus:setText("+");
    obj.intimidacaoPlus:setWidth(20);
    obj.intimidacaoPlus:setHeight(20);

    obj.flowPart124 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart124:setParent(obj.tabelaPontosBonus);
    obj.flowPart124:setHeight(20);
    obj.flowPart124:setMinWidth(180);
    obj.flowPart124:setMaxWidth(180);
    obj.flowPart124:setName("flowPart124");
    obj.flowPart124:setMargins({top=5, bottom=5,right=10});

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart124);
    obj.label42:setText("Persuasão");
    obj.label42:setAlign("left");
    obj.label42:setFontSize(18);
    obj.label42:setVertTextAlign("center");
    obj.label42:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label42, "fontStyle",  "italic");
    obj.label42:setWidth(200);
    obj.label42:setName("label42");

    obj.horzLine65 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine65:setParent(obj.flowPart124);
    obj.horzLine65:setAlign("bottom");
    obj.horzLine65:setStrokeColor("#FFFFFF50");
    obj.horzLine65:setStrokeSize(1);
    obj.horzLine65:setName("horzLine65");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.tabelaPontosBonus);
    obj.flowLayout3:setHeight(20);
    obj.flowLayout3:setMinWidth(150);
    obj.flowLayout3:setMaxWidth(200);
    obj.flowLayout3:setMaxControlsPerLine(3);
    obj.flowLayout3:setName("flowLayout3");

    obj.persuasaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.persuasaoMinus:setParent(obj.flowLayout3);
    obj.persuasaoMinus:setName("persuasaoMinus");
    obj.persuasaoMinus:setText("-");
    obj.persuasaoMinus:setWidth(20);
    obj.persuasaoMinus:setHeight(20);

    obj.flowPart125 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart125:setParent(obj.flowLayout3);
    obj.flowPart125:setHeight(20);
    obj.flowPart125:setMinWidth(20);
    obj.flowPart125:setMaxWidth(20);
    obj.flowPart125:setName("flowPart125");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart125);
    obj.edit71:setAlign("client");
    obj.edit71:setField("persuasao");
    obj.edit71:setFontSize(12);
    obj.edit71:setTransparent(true);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setType("number");
    obj.edit71:setReadOnly(true);
    obj.edit71:setMin(0);
    obj.edit71:setName("edit71");

    obj.persuasaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.persuasaoPlus:setParent(obj.flowLayout3);
    obj.persuasaoPlus:setName("persuasaoPlus");
    obj.persuasaoPlus:setText("+");
    obj.persuasaoPlus:setWidth(20);
    obj.persuasaoPlus:setHeight(20);

    obj.flowPart126 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart126:setParent(obj.tabelaPontosBonus);
    obj.flowPart126:setHeight(20);
    obj.flowPart126:setMinWidth(180);
    obj.flowPart126:setMaxWidth(180);
    obj.flowPart126:setName("flowPart126");
    obj.flowPart126:setMargins({top=5, bottom=5,right=10});

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart126);
    obj.label43:setText("Adestrar Animais");
    obj.label43:setAlign("left");
    obj.label43:setFontSize(18);
    obj.label43:setVertTextAlign("center");
    obj.label43:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label43, "fontStyle",  "italic");
    obj.label43:setWidth(200);
    obj.label43:setName("label43");

    obj.horzLine66 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine66:setParent(obj.flowPart126);
    obj.horzLine66:setAlign("bottom");
    obj.horzLine66:setStrokeColor("#FFFFFF50");
    obj.horzLine66:setStrokeSize(1);
    obj.horzLine66:setName("horzLine66");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.tabelaPontosBonus);
    obj.flowLayout4:setHeight(20);
    obj.flowLayout4:setMinWidth(150);
    obj.flowLayout4:setMaxWidth(200);
    obj.flowLayout4:setMaxControlsPerLine(3);
    obj.flowLayout4:setName("flowLayout4");

    obj.adestrarAnimaisMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.adestrarAnimaisMinus:setParent(obj.flowLayout4);
    obj.adestrarAnimaisMinus:setName("adestrarAnimaisMinus");
    obj.adestrarAnimaisMinus:setText("-");
    obj.adestrarAnimaisMinus:setWidth(20);
    obj.adestrarAnimaisMinus:setHeight(20);

    obj.flowPart127 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart127:setParent(obj.flowLayout4);
    obj.flowPart127:setHeight(20);
    obj.flowPart127:setMinWidth(20);
    obj.flowPart127:setMaxWidth(20);
    obj.flowPart127:setName("flowPart127");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.flowPart127);
    obj.edit72:setAlign("client");
    obj.edit72:setField("adestrarAnimais");
    obj.edit72:setFontSize(12);
    obj.edit72:setTransparent(true);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setType("number");
    obj.edit72:setReadOnly(true);
    obj.edit72:setMin(0);
    obj.edit72:setName("edit72");

    obj.adestrarAnimaisPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.adestrarAnimaisPlus:setParent(obj.flowLayout4);
    obj.adestrarAnimaisPlus:setName("adestrarAnimaisPlus");
    obj.adestrarAnimaisPlus:setText("+");
    obj.adestrarAnimaisPlus:setWidth(20);
    obj.adestrarAnimaisPlus:setHeight(20);

    obj.flowPart128 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart128:setParent(obj.tabelaPontosBonus);
    obj.flowPart128:setHeight(20);
    obj.flowPart128:setMinWidth(180);
    obj.flowPart128:setMaxWidth(180);
    obj.flowPart128:setName("flowPart128");
    obj.flowPart128:setMargins({top=5, bottom=5,right=10});

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart128);
    obj.label44:setText("Furtividade");
    obj.label44:setAlign("left");
    obj.label44:setFontSize(18);
    obj.label44:setVertTextAlign("center");
    obj.label44:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label44, "fontStyle",  "italic");
    obj.label44:setWidth(200);
    obj.label44:setName("label44");

    obj.horzLine67 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine67:setParent(obj.flowPart128);
    obj.horzLine67:setAlign("bottom");
    obj.horzLine67:setStrokeColor("#FFFFFF50");
    obj.horzLine67:setStrokeSize(1);
    obj.horzLine67:setName("horzLine67");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.tabelaPontosBonus);
    obj.flowLayout5:setHeight(20);
    obj.flowLayout5:setMinWidth(150);
    obj.flowLayout5:setMaxWidth(200);
    obj.flowLayout5:setMaxControlsPerLine(3);
    obj.flowLayout5:setName("flowLayout5");

    obj.furtividadeMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.furtividadeMinus:setParent(obj.flowLayout5);
    obj.furtividadeMinus:setName("furtividadeMinus");
    obj.furtividadeMinus:setText("-");
    obj.furtividadeMinus:setWidth(20);
    obj.furtividadeMinus:setHeight(20);

    obj.flowPart129 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart129:setParent(obj.flowLayout5);
    obj.flowPart129:setHeight(20);
    obj.flowPart129:setMinWidth(20);
    obj.flowPart129:setMaxWidth(20);
    obj.flowPart129:setName("flowPart129");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.flowPart129);
    obj.edit73:setAlign("client");
    obj.edit73:setField("furtividade");
    obj.edit73:setFontSize(12);
    obj.edit73:setTransparent(true);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setType("number");
    obj.edit73:setReadOnly(true);
    obj.edit73:setMin(0);
    obj.edit73:setName("edit73");

    obj.furtividadePlus = GUI.fromHandle(_obj_newObject("button"));
    obj.furtividadePlus:setParent(obj.flowLayout5);
    obj.furtividadePlus:setName("furtividadePlus");
    obj.furtividadePlus:setText("+");
    obj.furtividadePlus:setWidth(20);
    obj.furtividadePlus:setHeight(20);

    obj.flowPart130 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart130:setParent(obj.tabelaPontosBonus);
    obj.flowPart130:setHeight(20);
    obj.flowPart130:setMinWidth(180);
    obj.flowPart130:setMaxWidth(180);
    obj.flowPart130:setName("flowPart130");
    obj.flowPart130:setMargins({top=5, bottom=5,right=10});

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart130);
    obj.label45:setText("Intuição");
    obj.label45:setAlign("left");
    obj.label45:setFontSize(18);
    obj.label45:setVertTextAlign("center");
    obj.label45:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label45, "fontStyle",  "italic");
    obj.label45:setWidth(200);
    obj.label45:setName("label45");

    obj.horzLine68 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine68:setParent(obj.flowPart130);
    obj.horzLine68:setAlign("bottom");
    obj.horzLine68:setStrokeColor("#FFFFFF50");
    obj.horzLine68:setStrokeSize(1);
    obj.horzLine68:setName("horzLine68");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.tabelaPontosBonus);
    obj.flowLayout6:setHeight(20);
    obj.flowLayout6:setMinWidth(150);
    obj.flowLayout6:setMaxWidth(200);
    obj.flowLayout6:setMaxControlsPerLine(3);
    obj.flowLayout6:setName("flowLayout6");

    obj.intuicaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.intuicaoMinus:setParent(obj.flowLayout6);
    obj.intuicaoMinus:setName("intuicaoMinus");
    obj.intuicaoMinus:setText("-");
    obj.intuicaoMinus:setWidth(20);
    obj.intuicaoMinus:setHeight(20);

    obj.flowPart131 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart131:setParent(obj.flowLayout6);
    obj.flowPart131:setHeight(20);
    obj.flowPart131:setMinWidth(20);
    obj.flowPart131:setMaxWidth(20);
    obj.flowPart131:setName("flowPart131");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.flowPart131);
    obj.edit74:setAlign("client");
    obj.edit74:setField("intuicao");
    obj.edit74:setFontSize(12);
    obj.edit74:setTransparent(true);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setType("number");
    obj.edit74:setReadOnly(true);
    obj.edit74:setMin(0);
    obj.edit74:setName("edit74");

    obj.intuicaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.intuicaoPlus:setParent(obj.flowLayout6);
    obj.intuicaoPlus:setName("intuicaoPlus");
    obj.intuicaoPlus:setText("+");
    obj.intuicaoPlus:setWidth(20);
    obj.intuicaoPlus:setHeight(20);

    obj.flowPart132 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart132:setParent(obj.tabelaPontosBonus);
    obj.flowPart132:setHeight(20);
    obj.flowPart132:setMinWidth(180);
    obj.flowPart132:setMaxWidth(180);
    obj.flowPart132:setName("flowPart132");
    obj.flowPart132:setMargins({top=5, bottom=5,right=10});

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart132);
    obj.label46:setText("Didática");
    obj.label46:setAlign("left");
    obj.label46:setFontSize(18);
    obj.label46:setVertTextAlign("center");
    obj.label46:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label46, "fontStyle",  "italic");
    obj.label46:setWidth(200);
    obj.label46:setName("label46");

    obj.horzLine69 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine69:setParent(obj.flowPart132);
    obj.horzLine69:setAlign("bottom");
    obj.horzLine69:setStrokeColor("#FFFFFF50");
    obj.horzLine69:setStrokeSize(1);
    obj.horzLine69:setName("horzLine69");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.tabelaPontosBonus);
    obj.flowLayout7:setHeight(20);
    obj.flowLayout7:setMinWidth(150);
    obj.flowLayout7:setMaxWidth(200);
    obj.flowLayout7:setMaxControlsPerLine(3);
    obj.flowLayout7:setName("flowLayout7");

    obj.didaticaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.didaticaMinus:setParent(obj.flowLayout7);
    obj.didaticaMinus:setName("didaticaMinus");
    obj.didaticaMinus:setText("-");
    obj.didaticaMinus:setWidth(20);
    obj.didaticaMinus:setHeight(20);

    obj.flowPart133 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart133:setParent(obj.flowLayout7);
    obj.flowPart133:setHeight(20);
    obj.flowPart133:setMinWidth(20);
    obj.flowPart133:setMaxWidth(20);
    obj.flowPart133:setName("flowPart133");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.flowPart133);
    obj.edit75:setAlign("client");
    obj.edit75:setField("didatica");
    obj.edit75:setFontSize(12);
    obj.edit75:setTransparent(true);
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setType("number");
    obj.edit75:setReadOnly(true);
    obj.edit75:setMin(0);
    obj.edit75:setName("edit75");

    obj.didaticaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.didaticaPlus:setParent(obj.flowLayout7);
    obj.didaticaPlus:setName("didaticaPlus");
    obj.didaticaPlus:setText("+");
    obj.didaticaPlus:setWidth(20);
    obj.didaticaPlus:setHeight(20);

    obj.tabelaConhecimentosEspecificos = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tabelaConhecimentosEspecificos:setParent(obj.tabelaPtBonusEConhecimentos);
    obj.tabelaConhecimentosEspecificos:setMinWidth(200);
    obj.tabelaConhecimentosEspecificos:setMaxWidth(450);
    obj.tabelaConhecimentosEspecificos:setName("tabelaConhecimentosEspecificos");
    obj.tabelaConhecimentosEspecificos:setAvoidScale(true);
    obj.tabelaConhecimentosEspecificos:setAutoHeight(true);
    obj.tabelaConhecimentosEspecificos:setVertAlign("leading");
    obj.tabelaConhecimentosEspecificos:setMaxControlsPerLine(2);
    obj.tabelaConhecimentosEspecificos:setHorzAlign("center");

    obj.flowPart134 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart134:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart134:setHeight(20);
    obj.flowPart134:setMinWidth(180);
    obj.flowPart134:setMaxWidth(180);
    obj.flowPart134:setName("flowPart134");
    obj.flowPart134:setMargins({top=5, bottom=5,right=10});

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart134);
    obj.label47:setText("Geografia");
    obj.label47:setAlign("left");
    obj.label47:setFontSize(18);
    obj.label47:setVertTextAlign("center");
    obj.label47:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label47, "fontStyle",  "italic");
    obj.label47:setWidth(200);
    obj.label47:setName("label47");

    obj.horzLine70 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine70:setParent(obj.flowPart134);
    obj.horzLine70:setAlign("bottom");
    obj.horzLine70:setStrokeColor("#FFFFFF50");
    obj.horzLine70:setStrokeSize(1);
    obj.horzLine70:setName("horzLine70");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout8:setHeight(20);
    obj.flowLayout8:setMinWidth(150);
    obj.flowLayout8:setMaxWidth(200);
    obj.flowLayout8:setMaxControlsPerLine(3);
    obj.flowLayout8:setName("flowLayout8");

    obj.geografiaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.geografiaMinus:setParent(obj.flowLayout8);
    obj.geografiaMinus:setName("geografiaMinus");
    obj.geografiaMinus:setText("-");
    obj.geografiaMinus:setWidth(20);
    obj.geografiaMinus:setHeight(20);

    obj.flowPart135 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart135:setParent(obj.flowLayout8);
    obj.flowPart135:setHeight(20);
    obj.flowPart135:setMinWidth(20);
    obj.flowPart135:setMaxWidth(20);
    obj.flowPart135:setName("flowPart135");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.flowPart135);
    obj.edit76:setAlign("client");
    obj.edit76:setField("geografia");
    obj.edit76:setFontSize(12);
    obj.edit76:setTransparent(true);
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setType("number");
    obj.edit76:setReadOnly(true);
    obj.edit76:setMin(0);
    obj.edit76:setName("edit76");

    obj.geografiaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.geografiaPlus:setParent(obj.flowLayout8);
    obj.geografiaPlus:setName("geografiaPlus");
    obj.geografiaPlus:setText("+");
    obj.geografiaPlus:setWidth(20);
    obj.geografiaPlus:setHeight(20);

    obj.flowPart136 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart136:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart136:setHeight(20);
    obj.flowPart136:setMinWidth(180);
    obj.flowPart136:setMaxWidth(180);
    obj.flowPart136:setName("flowPart136");
    obj.flowPart136:setMargins({top=5, bottom=5,right=10});

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart136);
    obj.label48:setText("História");
    obj.label48:setAlign("left");
    obj.label48:setFontSize(18);
    obj.label48:setVertTextAlign("center");
    obj.label48:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label48, "fontStyle",  "italic");
    obj.label48:setWidth(200);
    obj.label48:setName("label48");

    obj.horzLine71 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine71:setParent(obj.flowPart136);
    obj.horzLine71:setAlign("bottom");
    obj.horzLine71:setStrokeColor("#FFFFFF50");
    obj.horzLine71:setStrokeSize(1);
    obj.horzLine71:setName("horzLine71");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout9:setHeight(20);
    obj.flowLayout9:setMinWidth(150);
    obj.flowLayout9:setMaxWidth(200);
    obj.flowLayout9:setMaxControlsPerLine(3);
    obj.flowLayout9:setName("flowLayout9");

    obj.historiaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.historiaMinus:setParent(obj.flowLayout9);
    obj.historiaMinus:setName("historiaMinus");
    obj.historiaMinus:setText("-");
    obj.historiaMinus:setWidth(20);
    obj.historiaMinus:setHeight(20);

    obj.flowPart137 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart137:setParent(obj.flowLayout9);
    obj.flowPart137:setHeight(20);
    obj.flowPart137:setMinWidth(20);
    obj.flowPart137:setMaxWidth(20);
    obj.flowPart137:setName("flowPart137");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.flowPart137);
    obj.edit77:setAlign("client");
    obj.edit77:setField("historia");
    obj.edit77:setFontSize(12);
    obj.edit77:setTransparent(true);
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setType("number");
    obj.edit77:setReadOnly(true);
    obj.edit77:setMin(0);
    obj.edit77:setName("edit77");

    obj.historiaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.historiaPlus:setParent(obj.flowLayout9);
    obj.historiaPlus:setName("historiaPlus");
    obj.historiaPlus:setText("+");
    obj.historiaPlus:setWidth(20);
    obj.historiaPlus:setHeight(20);

    obj.flowPart138 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart138:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart138:setHeight(20);
    obj.flowPart138:setMinWidth(180);
    obj.flowPart138:setMaxWidth(180);
    obj.flowPart138:setName("flowPart138");
    obj.flowPart138:setMargins({top=5, bottom=5,right=10});

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart138);
    obj.label49:setText("Religião");
    obj.label49:setAlign("left");
    obj.label49:setFontSize(18);
    obj.label49:setVertTextAlign("center");
    obj.label49:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label49, "fontStyle",  "italic");
    obj.label49:setWidth(200);
    obj.label49:setName("label49");

    obj.horzLine72 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine72:setParent(obj.flowPart138);
    obj.horzLine72:setAlign("bottom");
    obj.horzLine72:setStrokeColor("#FFFFFF50");
    obj.horzLine72:setStrokeSize(1);
    obj.horzLine72:setName("horzLine72");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout10:setHeight(20);
    obj.flowLayout10:setMinWidth(150);
    obj.flowLayout10:setMaxWidth(200);
    obj.flowLayout10:setMaxControlsPerLine(3);
    obj.flowLayout10:setName("flowLayout10");

    obj.religiaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.religiaoMinus:setParent(obj.flowLayout10);
    obj.religiaoMinus:setName("religiaoMinus");
    obj.religiaoMinus:setText("-");
    obj.religiaoMinus:setWidth(20);
    obj.religiaoMinus:setHeight(20);

    obj.flowPart139 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart139:setParent(obj.flowLayout10);
    obj.flowPart139:setHeight(20);
    obj.flowPart139:setMinWidth(20);
    obj.flowPart139:setMaxWidth(20);
    obj.flowPart139:setName("flowPart139");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.flowPart139);
    obj.edit78:setAlign("client");
    obj.edit78:setField("religiao");
    obj.edit78:setFontSize(12);
    obj.edit78:setTransparent(true);
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setType("number");
    obj.edit78:setReadOnly(true);
    obj.edit78:setMin(0);
    obj.edit78:setName("edit78");

    obj.religiaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.religiaoPlus:setParent(obj.flowLayout10);
    obj.religiaoPlus:setName("religiaoPlus");
    obj.religiaoPlus:setText("+");
    obj.religiaoPlus:setWidth(20);
    obj.religiaoPlus:setHeight(20);

    obj.flowPart140 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart140:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart140:setHeight(20);
    obj.flowPart140:setMinWidth(180);
    obj.flowPart140:setMaxWidth(180);
    obj.flowPart140:setName("flowPart140");
    obj.flowPart140:setMargins({top=5, bottom=5,right=10});

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart140);
    obj.label50:setText("Fauna/Flora");
    obj.label50:setAlign("left");
    obj.label50:setFontSize(18);
    obj.label50:setVertTextAlign("center");
    obj.label50:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label50, "fontStyle",  "italic");
    obj.label50:setWidth(200);
    obj.label50:setName("label50");

    obj.horzLine73 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine73:setParent(obj.flowPart140);
    obj.horzLine73:setAlign("bottom");
    obj.horzLine73:setStrokeColor("#FFFFFF50");
    obj.horzLine73:setStrokeSize(1);
    obj.horzLine73:setName("horzLine73");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout11:setHeight(20);
    obj.flowLayout11:setMinWidth(150);
    obj.flowLayout11:setMaxWidth(200);
    obj.flowLayout11:setMaxControlsPerLine(3);
    obj.flowLayout11:setName("flowLayout11");

    obj.faunafloraMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.faunafloraMinus:setParent(obj.flowLayout11);
    obj.faunafloraMinus:setName("faunafloraMinus");
    obj.faunafloraMinus:setText("-");
    obj.faunafloraMinus:setWidth(20);
    obj.faunafloraMinus:setHeight(20);

    obj.flowPart141 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart141:setParent(obj.flowLayout11);
    obj.flowPart141:setHeight(20);
    obj.flowPart141:setMinWidth(20);
    obj.flowPart141:setMaxWidth(20);
    obj.flowPart141:setName("flowPart141");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.flowPart141);
    obj.edit79:setAlign("client");
    obj.edit79:setField("faunaflora");
    obj.edit79:setFontSize(12);
    obj.edit79:setTransparent(true);
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setType("number");
    obj.edit79:setReadOnly(true);
    obj.edit79:setMin(0);
    obj.edit79:setName("edit79");

    obj.faunafloraPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.faunafloraPlus:setParent(obj.flowLayout11);
    obj.faunafloraPlus:setName("faunafloraPlus");
    obj.faunafloraPlus:setText("+");
    obj.faunafloraPlus:setWidth(20);
    obj.faunafloraPlus:setHeight(20);

    obj.flowPart142 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart142:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart142:setHeight(20);
    obj.flowPart142:setMinWidth(180);
    obj.flowPart142:setMaxWidth(180);
    obj.flowPart142:setName("flowPart142");
    obj.flowPart142:setMargins({top=5, bottom=5,right=10});

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart142);
    obj.label51:setText("Linguagem Comum");
    obj.label51:setAlign("left");
    obj.label51:setFontSize(18);
    obj.label51:setVertTextAlign("center");
    obj.label51:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label51, "fontStyle",  "italic");
    obj.label51:setWidth(200);
    obj.label51:setName("label51");

    obj.horzLine74 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine74:setParent(obj.flowPart142);
    obj.horzLine74:setAlign("bottom");
    obj.horzLine74:setStrokeColor("#FFFFFF50");
    obj.horzLine74:setStrokeSize(1);
    obj.horzLine74:setName("horzLine74");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout12:setHeight(20);
    obj.flowLayout12:setMinWidth(150);
    obj.flowLayout12:setMaxWidth(200);
    obj.flowLayout12:setMaxControlsPerLine(3);
    obj.flowLayout12:setName("flowLayout12");

    obj.linguagemComumMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemComumMinus:setParent(obj.flowLayout12);
    obj.linguagemComumMinus:setName("linguagemComumMinus");
    obj.linguagemComumMinus:setText("-");
    obj.linguagemComumMinus:setWidth(20);
    obj.linguagemComumMinus:setHeight(20);

    obj.flowPart143 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart143:setParent(obj.flowLayout12);
    obj.flowPart143:setHeight(20);
    obj.flowPart143:setMinWidth(20);
    obj.flowPart143:setMaxWidth(20);
    obj.flowPart143:setName("flowPart143");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.flowPart143);
    obj.edit80:setAlign("client");
    obj.edit80:setField("linguagemComum");
    obj.edit80:setFontSize(12);
    obj.edit80:setTransparent(true);
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setType("number");
    obj.edit80:setReadOnly(true);
    obj.edit80:setMin(0);
    obj.edit80:setName("edit80");

    obj.linguagemComumPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemComumPlus:setParent(obj.flowLayout12);
    obj.linguagemComumPlus:setName("linguagemComumPlus");
    obj.linguagemComumPlus:setText("+");
    obj.linguagemComumPlus:setWidth(20);
    obj.linguagemComumPlus:setHeight(20);

    obj.flowPart144 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart144:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart144:setHeight(20);
    obj.flowPart144:setMinWidth(180);
    obj.flowPart144:setMaxWidth(180);
    obj.flowPart144:setName("flowPart144");
    obj.flowPart144:setMargins({top=5, bottom=5,right=10});

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart144);
    obj.label52:setText("Linguagem Oriental");
    obj.label52:setAlign("left");
    obj.label52:setFontSize(18);
    obj.label52:setVertTextAlign("center");
    obj.label52:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label52, "fontStyle",  "italic");
    obj.label52:setWidth(200);
    obj.label52:setName("label52");

    obj.horzLine75 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine75:setParent(obj.flowPart144);
    obj.horzLine75:setAlign("bottom");
    obj.horzLine75:setStrokeColor("#FFFFFF50");
    obj.horzLine75:setStrokeSize(1);
    obj.horzLine75:setName("horzLine75");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout13:setHeight(20);
    obj.flowLayout13:setMinWidth(150);
    obj.flowLayout13:setMaxWidth(200);
    obj.flowLayout13:setMaxControlsPerLine(3);
    obj.flowLayout13:setName("flowLayout13");

    obj.linguagemOrientalMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemOrientalMinus:setParent(obj.flowLayout13);
    obj.linguagemOrientalMinus:setName("linguagemOrientalMinus");
    obj.linguagemOrientalMinus:setText("-");
    obj.linguagemOrientalMinus:setWidth(20);
    obj.linguagemOrientalMinus:setHeight(20);

    obj.flowPart145 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart145:setParent(obj.flowLayout13);
    obj.flowPart145:setHeight(20);
    obj.flowPart145:setMinWidth(20);
    obj.flowPart145:setMaxWidth(20);
    obj.flowPart145:setName("flowPart145");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.flowPart145);
    obj.edit81:setAlign("client");
    obj.edit81:setField("linguagemOriental");
    obj.edit81:setFontSize(12);
    obj.edit81:setTransparent(true);
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setType("number");
    obj.edit81:setReadOnly(true);
    obj.edit81:setMin(0);
    obj.edit81:setName("edit81");

    obj.linguagemOrientalPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemOrientalPlus:setParent(obj.flowLayout13);
    obj.linguagemOrientalPlus:setName("linguagemOrientalPlus");
    obj.linguagemOrientalPlus:setText("+");
    obj.linguagemOrientalPlus:setWidth(20);
    obj.linguagemOrientalPlus:setHeight(20);

    obj.flowPart146 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart146:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart146:setHeight(20);
    obj.flowPart146:setMinWidth(180);
    obj.flowPart146:setMaxWidth(180);
    obj.flowPart146:setName("flowPart146");
    obj.flowPart146:setMargins({top=5, bottom=5,right=10});

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart146);
    obj.label53:setText("Linguagem Élfica");
    obj.label53:setAlign("left");
    obj.label53:setFontSize(18);
    obj.label53:setVertTextAlign("center");
    obj.label53:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label53, "fontStyle",  "italic");
    obj.label53:setWidth(200);
    obj.label53:setName("label53");

    obj.horzLine76 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine76:setParent(obj.flowPart146);
    obj.horzLine76:setAlign("bottom");
    obj.horzLine76:setStrokeColor("#FFFFFF50");
    obj.horzLine76:setStrokeSize(1);
    obj.horzLine76:setName("horzLine76");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout14:setHeight(20);
    obj.flowLayout14:setMinWidth(150);
    obj.flowLayout14:setMaxWidth(200);
    obj.flowLayout14:setMaxControlsPerLine(3);
    obj.flowLayout14:setName("flowLayout14");

    obj.linguagemElficaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemElficaMinus:setParent(obj.flowLayout14);
    obj.linguagemElficaMinus:setName("linguagemElficaMinus");
    obj.linguagemElficaMinus:setText("-");
    obj.linguagemElficaMinus:setWidth(20);
    obj.linguagemElficaMinus:setHeight(20);

    obj.flowPart147 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart147:setParent(obj.flowLayout14);
    obj.flowPart147:setHeight(20);
    obj.flowPart147:setMinWidth(20);
    obj.flowPart147:setMaxWidth(20);
    obj.flowPart147:setName("flowPart147");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.flowPart147);
    obj.edit82:setAlign("client");
    obj.edit82:setField("linguagemElfica");
    obj.edit82:setFontSize(12);
    obj.edit82:setTransparent(true);
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setType("number");
    obj.edit82:setReadOnly(true);
    obj.edit82:setMin(0);
    obj.edit82:setName("edit82");

    obj.linguagemElficaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemElficaPlus:setParent(obj.flowLayout14);
    obj.linguagemElficaPlus:setName("linguagemElficaPlus");
    obj.linguagemElficaPlus:setText("+");
    obj.linguagemElficaPlus:setWidth(20);
    obj.linguagemElficaPlus:setHeight(20);

    obj.flowPart148 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart148:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart148:setHeight(20);
    obj.flowPart148:setMinWidth(180);
    obj.flowPart148:setMaxWidth(180);
    obj.flowPart148:setName("flowPart148");
    obj.flowPart148:setMargins({top=5, bottom=5,right=10});

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart148);
    obj.label54:setText("Linguagem Anã");
    obj.label54:setAlign("left");
    obj.label54:setFontSize(18);
    obj.label54:setVertTextAlign("center");
    obj.label54:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label54, "fontStyle",  "italic");
    obj.label54:setWidth(200);
    obj.label54:setName("label54");

    obj.horzLine77 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine77:setParent(obj.flowPart148);
    obj.horzLine77:setAlign("bottom");
    obj.horzLine77:setStrokeColor("#FFFFFF50");
    obj.horzLine77:setStrokeSize(1);
    obj.horzLine77:setName("horzLine77");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout15:setHeight(20);
    obj.flowLayout15:setMinWidth(150);
    obj.flowLayout15:setMaxWidth(200);
    obj.flowLayout15:setMaxControlsPerLine(3);
    obj.flowLayout15:setName("flowLayout15");

    obj.linguagemAnaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemAnaMinus:setParent(obj.flowLayout15);
    obj.linguagemAnaMinus:setName("linguagemAnaMinus");
    obj.linguagemAnaMinus:setText("-");
    obj.linguagemAnaMinus:setWidth(20);
    obj.linguagemAnaMinus:setHeight(20);

    obj.flowPart149 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart149:setParent(obj.flowLayout15);
    obj.flowPart149:setHeight(20);
    obj.flowPart149:setMinWidth(20);
    obj.flowPart149:setMaxWidth(20);
    obj.flowPart149:setName("flowPart149");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.flowPart149);
    obj.edit83:setAlign("client");
    obj.edit83:setField("linguagemAna");
    obj.edit83:setFontSize(12);
    obj.edit83:setTransparent(true);
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setType("number");
    obj.edit83:setReadOnly(true);
    obj.edit83:setMin(0);
    obj.edit83:setName("edit83");

    obj.linguagemAnaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemAnaPlus:setParent(obj.flowLayout15);
    obj.linguagemAnaPlus:setName("linguagemAnaPlus");
    obj.linguagemAnaPlus:setText("+");
    obj.linguagemAnaPlus:setWidth(20);
    obj.linguagemAnaPlus:setHeight(20);

    obj.flowPart150 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart150:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart150:setHeight(20);
    obj.flowPart150:setMinWidth(180);
    obj.flowPart150:setMaxWidth(180);
    obj.flowPart150:setName("flowPart150");
    obj.flowPart150:setMargins({top=5, bottom=5,right=10});

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart150);
    obj.label55:setText("Linguagem Dracônica");
    obj.label55:setAlign("left");
    obj.label55:setFontSize(18);
    obj.label55:setVertTextAlign("center");
    obj.label55:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label55, "fontStyle",  "italic");
    obj.label55:setWidth(200);
    obj.label55:setName("label55");

    obj.horzLine78 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine78:setParent(obj.flowPart150);
    obj.horzLine78:setAlign("bottom");
    obj.horzLine78:setStrokeColor("#FFFFFF50");
    obj.horzLine78:setStrokeSize(1);
    obj.horzLine78:setName("horzLine78");

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout16:setHeight(20);
    obj.flowLayout16:setMinWidth(150);
    obj.flowLayout16:setMaxWidth(200);
    obj.flowLayout16:setMaxControlsPerLine(3);
    obj.flowLayout16:setName("flowLayout16");

    obj.linguagemDraconicaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemDraconicaMinus:setParent(obj.flowLayout16);
    obj.linguagemDraconicaMinus:setName("linguagemDraconicaMinus");
    obj.linguagemDraconicaMinus:setText("-");
    obj.linguagemDraconicaMinus:setWidth(20);
    obj.linguagemDraconicaMinus:setHeight(20);

    obj.flowPart151 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart151:setParent(obj.flowLayout16);
    obj.flowPart151:setHeight(20);
    obj.flowPart151:setMinWidth(20);
    obj.flowPart151:setMaxWidth(20);
    obj.flowPart151:setName("flowPart151");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.flowPart151);
    obj.edit84:setAlign("client");
    obj.edit84:setField("linguagemDraconica");
    obj.edit84:setFontSize(12);
    obj.edit84:setTransparent(true);
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setType("number");
    obj.edit84:setReadOnly(true);
    obj.edit84:setMin(0);
    obj.edit84:setName("edit84");

    obj.linguagemDraconicaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemDraconicaPlus:setParent(obj.flowLayout16);
    obj.linguagemDraconicaPlus:setName("linguagemDraconicaPlus");
    obj.linguagemDraconicaPlus:setText("+");
    obj.linguagemDraconicaPlus:setWidth(20);
    obj.linguagemDraconicaPlus:setHeight(20);

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.rectangle1);
    obj.dataLink59:setFields({'percepcao', 'intimidacao', 'persuasao', 'adestrarAnimais', 'furtividade', 'intuicao', 'didatica',
                       'geografia', 'historia', 'religiao', 'faunaflora', 'linguagemComum', 'linguagemOriental', 'linguagemElfica',
                       'linguagemAna', 'linguagemDraconica', 'pontosRestantes', 'pontosTreinados', 'pontosDeConhecimento',
                       'pontosDeConhecimentoDistribuidos', 'destrezaDisponivel', 'dexTotal', 'atributoAcerto', 'atributoMira',
                       'atributoEsquiva', 'atributoBloqueio'});
    obj.dataLink59:setName("dataLink59");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Habilidades");
    obj.tab2:setName("tab2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.tab2);
    obj.layout5:setWidth(700);
    obj.layout5:setHeight(400);
    obj.layout5:setName("layout5");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout5);
    obj.label56:setText("Habilidades");
    obj.label56:setName("label56");
    obj.label56:setAlign("client");
    obj.label56:setHorzTextAlign("trailing");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (
                                (tonumber(sheet.atributoAcerto) or 0) +
                                (tonumber(sheet.atributoMira) or 0) +
                                (tonumber(sheet.atributoEsquiva) or 0) +
                                (tonumber(sheet.atributoBloqueio) or 0)
                                ) > sheet.dexTotal
                            then
                            showMessage(sheet.dexTotal)
                            end
            
                            sheet.modAcerto =tostring("+"..math.floor(tonumber(sheet.atributoAcerto)/10))
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (
                                (tonumber(sheet.atributoAcerto) or 0) +
                                (tonumber(sheet.atributoMira) or 0) +
                                (tonumber(sheet.atributoEsquiva) or 0) +
                                (tonumber(sheet.atributoBloqueio) or 0)
                                ) > sheet.dexTotal
                            then
                            showMessage(sheet.dexTotal)
                            end
            
                            sheet.modMira =tostring("+"..math.floor(tonumber(sheet.atributoMira)/10))
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (
                                (tonumber(sheet.atributoAcerto) or 0) +
                                (tonumber(sheet.atributoMira) or 0) +
                                (tonumber(sheet.atributoEsquiva) or 0) +
                                (tonumber(sheet.atributoBloqueio) or 0)
                                ) > sheet.dexTotal
                            then
                            showMessage(sheet.dexTotal)
                            end
            
                            sheet.modEsquiva =tostring("+"..math.floor(tonumber(sheet.atributoEsquiva)/10))
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (
                                (tonumber(sheet.atributoAcerto) or 0) +
                                (tonumber(sheet.atributoMira) or 0) +
                                (tonumber(sheet.atributoEsquiva) or 0) +
                                (tonumber(sheet.atributoBloqueio) or 0)
                                ) > sheet.dexTotal
                            then
                            showMessage(sheet.dexTotal)
                            end
            
                            sheet.modBloqueio =tostring("+"..math.floor(tonumber(sheet.atributoBloqueio)/10))
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.conNivel == nil then sheet.conNivel = 0 end;
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.conClasse == nil then sheet.conClasse = 0 end;
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.conRaca == nil then sheet.conRaca = 0 end;
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.conTreino == nil then sheet.conTreino = 0 end;
        end, obj);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.conOutros == nil then sheet.conOutros = 0 end;
        end, obj);

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.conBase == nil then sheet.conBase = 0 end;
        end, obj);

    obj._e_event10 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.conEquip == nil then sheet.conEquip = 0 end;
        end, obj);

    obj._e_event11 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.conTotal == nil then sheet.conTotal = 0 end;
        end, obj);

    obj._e_event12 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.conBase = (tonumber(sheet.conNivel) or 0) +
                            (tonumber(sheet.conClasse) or 0) +
                            (tonumber(sheet.conRaca) or 0) +
                            (tonumber(sheet.conTreino) or 0) +
                            (tonumber(sheet.conOutros) or 0);
            
                            sheet.conTotal = (tonumber(sheet.conBase) or 0) +
                            (tonumber(sheet.conEquip) or 0);
        end, obj);

    obj._e_event13 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.forNivel == nil then sheet.forNivel = 0 end;
        end, obj);

    obj._e_event14 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.forClasse == nil then sheet.forClasse = 0 end;
        end, obj);

    obj._e_event15 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.forRaca == nil then sheet.forRaca = 0 end;
        end, obj);

    obj._e_event16 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.forTreino == nil then sheet.forTreino = 0 end;
        end, obj);

    obj._e_event17 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.forOutros == nil then sheet.forOutros = 0 end;
        end, obj);

    obj._e_event18 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.forBase == nil then sheet.forBase = 0 end;
        end, obj);

    obj._e_event19 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.forEquip == nil then sheet.forEquip = 0 end;
        end, obj);

    obj._e_event20 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.forTotal == nil then sheet.forTotal = 0 end;
        end, obj);

    obj._e_event21 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.forBase = (tonumber(sheet.forNivel) or 0) +
                            (tonumber(sheet.forClasse) or 0) +
                            (tonumber(sheet.forRaca) or 0) +
                            (tonumber(sheet.forTreino) or 0) +
                            (tonumber(sheet.forOutros) or 0);
            
                            sheet.forTotal = (tonumber(sheet.forBase) or 0) +
                            (tonumber(sheet.forEquip) or 0);
        end, obj);

    obj._e_event22 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.dexNivel == nil then sheet.dexNivel = 0 end;
        end, obj);

    obj._e_event23 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.dexClasse == nil then sheet.dexClasse = 0 end;
        end, obj);

    obj._e_event24 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.dexRaca == nil then sheet.dexRaca = 0 end;
        end, obj);

    obj._e_event25 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.dexTreino == nil then sheet.dexTreino = 0 end;
        end, obj);

    obj._e_event26 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.dexOutros == nil then sheet.dexOutros = 0 end;
        end, obj);

    obj._e_event27 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.dexBase == nil then sheet.dexBase = 0 end;
        end, obj);

    obj._e_event28 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.dexEquip == nil then sheet.dexEquip = 0 end;
        end, obj);

    obj._e_event29 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.dexTotal == nil then sheet.dexTotal = 0 end;
        end, obj);

    obj._e_event30 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.dexBase = (tonumber(sheet.dexNivel) or 0) +
                            (tonumber(sheet.dexClasse) or 0) +
                            (tonumber(sheet.dexRaca) or 0) +
                            (tonumber(sheet.dexTreino) or 0) +
                            (tonumber(sheet.dexOutros) or 0);
            
                            sheet.dexTotal = (tonumber(sheet.dexBase) or 0) +
                            (tonumber(sheet.dexEquip) or 0);
        end, obj);

    obj._e_event31 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.carNivel == nil then sheet.carNivel = 0 end;
        end, obj);

    obj._e_event32 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.carClasse == nil then sheet.carClasse = 0 end;
        end, obj);

    obj._e_event33 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.carRaca == nil then sheet.carRaca = 0 end;
        end, obj);

    obj._e_event34 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.carTreino == nil then sheet.carTreino = 0 end;
        end, obj);

    obj._e_event35 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.carOutros == nil then sheet.carOutros = 0 end;
        end, obj);

    obj._e_event36 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.carBase == nil then sheet.carBase = 0 end;
        end, obj);

    obj._e_event37 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.carEquip == nil then sheet.carEquip = 0 end;
        end, obj);

    obj._e_event38 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.carTotal == nil then sheet.carTotal = 0 end;
        end, obj);

    obj._e_event39 = obj.dataLink40:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.carBase = (tonumber(sheet.carNivel) or 0) +
                            (tonumber(sheet.carClasse) or 0) +
                            (tonumber(sheet.carRaca) or 0) +
                            (tonumber(sheet.carTreino) or 0) +
                            (tonumber(sheet.carOutros) or 0);
            
                            sheet.carTotal = (tonumber(sheet.carBase) or 0) +
                            (tonumber(sheet.carEquip) or 0);
        end, obj);

    obj._e_event40 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.intNivel == nil then sheet.intNivel = 0 end;
        end, obj);

    obj._e_event41 = obj.dataLink42:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.intClasse == nil then sheet.intClasse = 0 end;
        end, obj);

    obj._e_event42 = obj.dataLink43:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.intRaca == nil then sheet.intRaca = 0 end;
        end, obj);

    obj._e_event43 = obj.dataLink44:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.intTreino == nil then sheet.intTreino = 0 end;
        end, obj);

    obj._e_event44 = obj.dataLink45:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.intOutros == nil then sheet.intOutros = 0 end;
        end, obj);

    obj._e_event45 = obj.dataLink46:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.intBase == nil then sheet.intBase = 0 end;
        end, obj);

    obj._e_event46 = obj.dataLink47:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.intEquip == nil then sheet.intEquip = 0 end;
        end, obj);

    obj._e_event47 = obj.dataLink48:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.intTotal == nil then sheet.intTotal = 0 end;
        end, obj);

    obj._e_event48 = obj.dataLink49:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.intBase = (tonumber(sheet.intNivel) or 0) +
                            (tonumber(sheet.intClasse) or 0) +
                            (tonumber(sheet.intRaca) or 0) +
                            (tonumber(sheet.intTreino) or 0) +
                            (tonumber(sheet.intOutros) or 0);
            
                            sheet.intTotal = (tonumber(sheet.intBase) or 0) +
                            (tonumber(sheet.intEquip) or 0);
        end, obj);

    obj._e_event49 = obj.dataLink50:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.sabNivel == nil then sheet.sabNivel = 0 end;
        end, obj);

    obj._e_event50 = obj.dataLink51:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.sabClasse == nil then sheet.sabClasse = 0 end;
        end, obj);

    obj._e_event51 = obj.dataLink52:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.sabRaca == nil then sheet.sabRaca = 0 end;
        end, obj);

    obj._e_event52 = obj.dataLink53:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.sabTreino == nil then sheet.sabTreino = 0 end;
        end, obj);

    obj._e_event53 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.sabOutros == nil then sheet.sabOutros = 0 end;
        end, obj);

    obj._e_event54 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.sabBase == nil then sheet.sabBase = 0 end;
        end, obj);

    obj._e_event55 = obj.dataLink56:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.sabEquip == nil then sheet.sabEquip = 0 end;
        end, obj);

    obj._e_event56 = obj.dataLink57:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.sabTotal == nil then sheet.sabTotal = 0 end;
        end, obj);

    obj._e_event57 = obj.dataLink58:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.sabBase = (tonumber(sheet.sabNivel) or 0) +
                            (tonumber(sheet.sabClasse) or 0) +
                            (tonumber(sheet.sabRaca) or 0) +
                            (tonumber(sheet.sabTreino) or 0) +
                            (tonumber(sheet.sabOutros) or 0);
            
                            sheet.sabTotal = (tonumber(sheet.sabBase) or 0) +
                            (tonumber(sheet.sabEquip) or 0);
        end, obj);

    obj._e_event58 = obj.button1:addEventListener("onClick",
        function (_)
            sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
        end, obj);

    obj._e_event59 = obj.button2:addEventListener("onClick",
        function (_)
            sheet.pontosRestantes = 0
                                                 sheet.pontosTreinados = 0
        end, obj);

    obj._e_event60 = obj.percepcaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.percepcao > 0 then
                                       sheet.percepcao = (tonumber(sheet.percepcao) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event61 = obj.percepcaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.percepcao = (tonumber(sheet.percepcao) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.percepcao = (tonumber(sheet.percepcao) or 0) + 1
                                    end
        end, obj);

    obj._e_event62 = obj.intimidacaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.intimidacao > 0 then
                                       sheet.intimidacao = (tonumber(sheet.intimidacao) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event63 = obj.intimidacaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.intimidacao = (tonumber(sheet.intimidacao) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.intimidacao = (tonumber(sheet.intimidacao) or 0) + 1
                                    end
        end, obj);

    obj._e_event64 = obj.persuasaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.persuasao > 0 then
                                       sheet.persuasao = (tonumber(sheet.persuasao) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event65 = obj.persuasaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.persuasao = (tonumber(sheet.persuasao) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.persuasao = (tonumber(sheet.persuasao) or 0) + 1
                                    end
        end, obj);

    obj._e_event66 = obj.adestrarAnimaisMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.adestrarAnimais > 0 then
                                       sheet.adestrarAnimais = (tonumber(sheet.adestrarAnimais) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event67 = obj.adestrarAnimaisPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.adestrarAnimais = (tonumber(sheet.adestrarAnimais) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.adestrarAnimais = (tonumber(sheet.adestrarAnimais) or 0) + 1
                                    end
        end, obj);

    obj._e_event68 = obj.furtividadeMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.furtividade > 0 then
                                       sheet.furtividade = (tonumber(sheet.furtividade) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event69 = obj.furtividadePlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.furtividade = (tonumber(sheet.furtividade) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.furtividade = (tonumber(sheet.furtividade) or 0) + 1
                                    end
        end, obj);

    obj._e_event70 = obj.intuicaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.intuicao > 0 then
                                       sheet.intuicao = (tonumber(sheet.intuicao) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event71 = obj.intuicaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.intuicao = (tonumber(sheet.intuicao) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.intuicao = (tonumber(sheet.intuicao) or 0) + 1
                                    end
        end, obj);

    obj._e_event72 = obj.didaticaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.didatica > 0 then
                                       sheet.didatica = (tonumber(sheet.didatica) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event73 = obj.didaticaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.didatica = (tonumber(sheet.didatica) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.didatica = (tonumber(sheet.didatica) or 0) + 1
                                    end
        end, obj);

    obj._e_event74 = obj.geografiaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.geografia > 0 then
                                       sheet.geografia = (tonumber(sheet.geografia) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event75 = obj.geografiaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.geografia = (tonumber(sheet.geografia) or 0) + 1
                                    end
        end, obj);

    obj._e_event76 = obj.historiaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.historia > 0 then
                                       sheet.historia = (tonumber(sheet.historia) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event77 = obj.historiaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.historia = (tonumber(sheet.historia) or 0) + 1
                                    end
        end, obj);

    obj._e_event78 = obj.religiaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.religiao > 0 then
                                       sheet.religiao = (tonumber(sheet.religiao) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event79 = obj.religiaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.religiao = (tonumber(sheet.religiao) or 0) + 1
                                    end
        end, obj);

    obj._e_event80 = obj.faunafloraMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.faunaflora > 0 then
                                       sheet.faunaflora = (tonumber(sheet.faunaflora) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event81 = obj.faunafloraPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.faunaflora = (tonumber(sheet.faunaflora) or 0) + 1
                                    end
        end, obj);

    obj._e_event82 = obj.linguagemComumMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemComum > 0 then
                                       sheet.linguagemComum = (tonumber(sheet.linguagemComum) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event83 = obj.linguagemComumPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemComum = (tonumber(sheet.linguagemComum) or 0) + 1
                                    end
        end, obj);

    obj._e_event84 = obj.linguagemOrientalMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemOriental > 0 then
                                       sheet.linguagemOriental = (tonumber(sheet.linguagemOriental) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event85 = obj.linguagemOrientalPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemOriental = (tonumber(sheet.linguagemOriental) or 0) + 1
                                    end
        end, obj);

    obj._e_event86 = obj.linguagemElficaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemElfica > 0 then
                                       sheet.linguagemElfica = (tonumber(sheet.linguagemElfica) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event87 = obj.linguagemElficaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemElfica = (tonumber(sheet.linguagemElfica) or 0) + 1
                                    end
        end, obj);

    obj._e_event88 = obj.linguagemAnaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemAna > 0 then
                                       sheet.linguagemAna = (tonumber(sheet.linguagemAna) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event89 = obj.linguagemAnaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemAna = (tonumber(sheet.linguagemAna) or 0) + 1
                                    end
        end, obj);

    obj._e_event90 = obj.linguagemDraconicaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemDraconica > 0 then
                                       sheet.linguagemDraconica = (tonumber(sheet.linguagemDraconica) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event91 = obj.linguagemDraconicaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemDraconica = (tonumber(sheet.linguagemDraconica) or 0) + 1
                                    end
        end, obj);

    obj._e_event92 = obj.dataLink59:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- ###### REMOVE VALORES NULOS ######
            
                        if sheet.percepcao == nil then sheet.percepcao = 0 end;
                        if sheet.intimidacao == nil then sheet.intimidacao = 0 end;
                        if sheet.persuasao == nil then sheet.persuasao = 0 end;
                        if sheet.adestrarAnimais == nil then sheet.adestrarAnimais = 0 end;
                        if sheet.furtividade == nil then sheet.furtividade = 0 end;
                        if sheet.intuicao == nil then sheet.intuicao = 0 end;
                        if sheet.didatica == nil then sheet.didatica = 0 end;
                        if sheet.geografia == nil then sheet.geografia = 0 end;
                        if sheet.historia == nil then sheet.historia = 0 end;
                        if sheet.religiao == nil then sheet.religiao = 0 end;
                        if sheet.faunaflora == nil then sheet.faunaflora = 0 end;
                        if sheet.linguagemComum == nil then sheet.linguagemComum = 0 end;
                        if sheet.linguagemOriental == nil then sheet.linguagemOriental = 0 end;
                        if sheet.linguagemElfica == nil then sheet.linguagemElfica = 0 end;
                        if sheet.linguagemAna == nil then sheet.linguagemAna = 0 end;
                        if sheet.linguagemDraconica == nil then sheet.linguagemDraconica = 0 end;
                        if sheet.pontosRestantes == nil then sheet.pontosRestantes = 0 end;
                        if sheet.pontosTreinados == nil then sheet.pontosTreinados = 0 end;
                        if sheet.pontosDeConhecimento == nil then sheet.pontosDeConhecimento = 0 end;
                        if sheet.pontosDeConhecimentoDistribuidos == nill then sheet.pontosDeConhecimentoDistribuidos = 0 end;
                        if sheet.nivelProfissao == nill then sheet.nivelProfissao = 0 end;
                        if sheet.nivelClasse == nill then sheet.nivelClasse = 0 end;
            
                        -- ###### PONTOS DE CONHECIMENTOS ESPECÍFICOS ######
                        sheet.pontosDeConhecimento = tonumber(math.floor(tonumber(sheet.intTotal)/5)) -
                        tonumber(sheet.pontosDeConhecimentoDistribuidos)
            
                        sheet.destrezaDisponivel = sheet.dexTotal - (
                        (tonumber(sheet.atributoAcerto) or 0) +
                        (tonumber(sheet.atributoMira) or 0) +
                        (tonumber(sheet.atributoEsquiva) or 0) +
                        (tonumber(sheet.atributoBloqueio) or 0)
                        )
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
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

        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.horzLine48 ~= nil then self.horzLine48:destroy(); self.horzLine48 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.linguagemElficaMinus ~= nil then self.linguagemElficaMinus:destroy(); self.linguagemElficaMinus = nil; end;
        if self.horzLine35 ~= nil then self.horzLine35:destroy(); self.horzLine35 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.imagemDoPersonagem ~= nil then self.imagemDoPersonagem:destroy(); self.imagemDoPersonagem = nil; end;
        if self.flowPart129 ~= nil then self.flowPart129:destroy(); self.flowPart129 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.horzLine47 ~= nil then self.horzLine47:destroy(); self.horzLine47 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.horzLine69 ~= nil then self.horzLine69:destroy(); self.horzLine69 = nil; end;
        if self.linguagemElficaPlus ~= nil then self.linguagemElficaPlus:destroy(); self.linguagemElficaPlus = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.horzLine70 ~= nil then self.horzLine70:destroy(); self.horzLine70 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.linguagemOrientalMinus ~= nil then self.linguagemOrientalMinus:destroy(); self.linguagemOrientalMinus = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.horzLine19 ~= nil then self.horzLine19:destroy(); self.horzLine19 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.linguagemComumMinus ~= nil then self.linguagemComumMinus:destroy(); self.linguagemComumMinus = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.topoAtributos ~= nil then self.topoAtributos:destroy(); self.topoAtributos = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.didaticaMinus ~= nil then self.didaticaMinus:destroy(); self.didaticaMinus = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.horzLine67 ~= nil then self.horzLine67:destroy(); self.horzLine67 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.horzLine30 ~= nil then self.horzLine30:destroy(); self.horzLine30 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.horzLine37 ~= nil then self.horzLine37:destroy(); self.horzLine37 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.furtividadePlus ~= nil then self.furtividadePlus:destroy(); self.furtividadePlus = nil; end;
        if self.flowPart150 ~= nil then self.flowPart150:destroy(); self.flowPart150 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.flowPart140 ~= nil then self.flowPart140:destroy(); self.flowPart140 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.horzLine41 ~= nil then self.horzLine41:destroy(); self.horzLine41 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.flowPart128 ~= nil then self.flowPart128:destroy(); self.flowPart128 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.horzLine56 ~= nil then self.horzLine56:destroy(); self.horzLine56 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dadosDoPersonagem ~= nil then self.dadosDoPersonagem:destroy(); self.dadosDoPersonagem = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.horzLine66 ~= nil then self.horzLine66:destroy(); self.horzLine66 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.horzLine54 ~= nil then self.horzLine54:destroy(); self.horzLine54 = nil; end;
        if self.horzLine76 ~= nil then self.horzLine76:destroy(); self.horzLine76 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.horzLine62 ~= nil then self.horzLine62:destroy(); self.horzLine62 = nil; end;
        if self.linguagemAnaPlus ~= nil then self.linguagemAnaPlus:destroy(); self.linguagemAnaPlus = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.flowPart145 ~= nil then self.flowPart145:destroy(); self.flowPart145 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.flowPart125 ~= nil then self.flowPart125:destroy(); self.flowPart125 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.flowPart142 ~= nil then self.flowPart142:destroy(); self.flowPart142 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.tabelaConhecimentosEspecificos ~= nil then self.tabelaConhecimentosEspecificos:destroy(); self.tabelaConhecimentosEspecificos = nil; end;
        if self.historiaPlus ~= nil then self.historiaPlus:destroy(); self.historiaPlus = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.flowPart113 ~= nil then self.flowPart113:destroy(); self.flowPart113 = nil; end;
        if self.percepcaoPlus ~= nil then self.percepcaoPlus:destroy(); self.percepcaoPlus = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.tabelaDeAtributos ~= nil then self.tabelaDeAtributos:destroy(); self.tabelaDeAtributos = nil; end;
        if self.perfilLayout ~= nil then self.perfilLayout:destroy(); self.perfilLayout = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.horzLine29 ~= nil then self.horzLine29:destroy(); self.horzLine29 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.flowPart132 ~= nil then self.flowPart132:destroy(); self.flowPart132 = nil; end;
        if self.flowPart122 ~= nil then self.flowPart122:destroy(); self.flowPart122 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.horzLine63 ~= nil then self.horzLine63:destroy(); self.horzLine63 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.horzLine71 ~= nil then self.horzLine71:destroy(); self.horzLine71 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.horzLine39 ~= nil then self.horzLine39:destroy(); self.horzLine39 = nil; end;
        if self.flowPart144 ~= nil then self.flowPart144:destroy(); self.flowPart144 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.horzLine38 ~= nil then self.horzLine38:destroy(); self.horzLine38 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.horzLine23 ~= nil then self.horzLine23:destroy(); self.horzLine23 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.flowPart118 ~= nil then self.flowPart118:destroy(); self.flowPart118 = nil; end;
        if self.geografiaPlus ~= nil then self.geografiaPlus:destroy(); self.geografiaPlus = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.horzLine22 ~= nil then self.horzLine22:destroy(); self.horzLine22 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.horzLine53 ~= nil then self.horzLine53:destroy(); self.horzLine53 = nil; end;
        if self.horzLine72 ~= nil then self.horzLine72:destroy(); self.horzLine72 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.linguagemDraconicaPlus ~= nil then self.linguagemDraconicaPlus:destroy(); self.linguagemDraconicaPlus = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.faunafloraMinus ~= nil then self.faunafloraMinus:destroy(); self.faunafloraMinus = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.flowPart127 ~= nil then self.flowPart127:destroy(); self.flowPart127 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart147 ~= nil then self.flowPart147:destroy(); self.flowPart147 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.horzLine60 ~= nil then self.horzLine60:destroy(); self.horzLine60 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tabelaPontosBonus ~= nil then self.tabelaPontosBonus:destroy(); self.tabelaPontosBonus = nil; end;
        if self.horzLine64 ~= nil then self.horzLine64:destroy(); self.horzLine64 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.flowPart126 ~= nil then self.flowPart126:destroy(); self.flowPart126 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.horzLine58 ~= nil then self.horzLine58:destroy(); self.horzLine58 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.horzLine20 ~= nil then self.horzLine20:destroy(); self.horzLine20 = nil; end;
        if self.horzLine31 ~= nil then self.horzLine31:destroy(); self.horzLine31 = nil; end;
        if self.adestrarAnimaisPlus ~= nil then self.adestrarAnimaisPlus:destroy(); self.adestrarAnimaisPlus = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.topoPtBonusEConhecimentos ~= nil then self.topoPtBonusEConhecimentos:destroy(); self.topoPtBonusEConhecimentos = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flowPart149 ~= nil then self.flowPart149:destroy(); self.flowPart149 = nil; end;
        if self.horzLine26 ~= nil then self.horzLine26:destroy(); self.horzLine26 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.flowPart124 ~= nil then self.flowPart124:destroy(); self.flowPart124 = nil; end;
        if self.flowPart141 ~= nil then self.flowPart141:destroy(); self.flowPart141 = nil; end;
        if self.religiaoMinus ~= nil then self.religiaoMinus:destroy(); self.religiaoMinus = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.didaticaPlus ~= nil then self.didaticaPlus:destroy(); self.didaticaPlus = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.religiaoPlus ~= nil then self.religiaoPlus:destroy(); self.religiaoPlus = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.linguagemAnaMinus ~= nil then self.linguagemAnaMinus:destroy(); self.linguagemAnaMinus = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.flowPart133 ~= nil then self.flowPart133:destroy(); self.flowPart133 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.horzLine75 ~= nil then self.horzLine75:destroy(); self.horzLine75 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.intuicaoPlus ~= nil then self.intuicaoPlus:destroy(); self.intuicaoPlus = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.horzLine45 ~= nil then self.horzLine45:destroy(); self.horzLine45 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.horzLine59 ~= nil then self.horzLine59:destroy(); self.horzLine59 = nil; end;
        if self.flowPart135 ~= nil then self.flowPart135:destroy(); self.flowPart135 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.horzLine36 ~= nil then self.horzLine36:destroy(); self.horzLine36 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.intuicaoMinus ~= nil then self.intuicaoMinus:destroy(); self.intuicaoMinus = nil; end;
        if self.linguagemOrientalPlus ~= nil then self.linguagemOrientalPlus:destroy(); self.linguagemOrientalPlus = nil; end;
        if self.horzLine40 ~= nil then self.horzLine40:destroy(); self.horzLine40 = nil; end;
        if self.flowPart131 ~= nil then self.flowPart131:destroy(); self.flowPart131 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.flowPart143 ~= nil then self.flowPart143:destroy(); self.flowPart143 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.horzLine44 ~= nil then self.horzLine44:destroy(); self.horzLine44 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.horzLine28 ~= nil then self.horzLine28:destroy(); self.horzLine28 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.horzLine34 ~= nil then self.horzLine34:destroy(); self.horzLine34 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.horzLine57 ~= nil then self.horzLine57:destroy(); self.horzLine57 = nil; end;
        if self.persuasaoPlus ~= nil then self.persuasaoPlus:destroy(); self.persuasaoPlus = nil; end;
        if self.horzLine33 ~= nil then self.horzLine33:destroy(); self.horzLine33 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine50 ~= nil then self.horzLine50:destroy(); self.horzLine50 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.flowPart136 ~= nil then self.flowPart136:destroy(); self.flowPart136 = nil; end;
        if self.atributosDestreza ~= nil then self.atributosDestreza:destroy(); self.atributosDestreza = nil; end;
        if self.horzLine25 ~= nil then self.horzLine25:destroy(); self.horzLine25 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.geografiaMinus ~= nil then self.geografiaMinus:destroy(); self.geografiaMinus = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.horzLine49 ~= nil then self.horzLine49:destroy(); self.horzLine49 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.intimidacaoMinus ~= nil then self.intimidacaoMinus:destroy(); self.intimidacaoMinus = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.tabelaDadosImagem ~= nil then self.tabelaDadosImagem:destroy(); self.tabelaDadosImagem = nil; end;
        if self.horzLine52 ~= nil then self.horzLine52:destroy(); self.horzLine52 = nil; end;
        if self.flowPart139 ~= nil then self.flowPart139:destroy(); self.flowPart139 = nil; end;
        if self.flowPart138 ~= nil then self.flowPart138:destroy(); self.flowPart138 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.flowPart123 ~= nil then self.flowPart123:destroy(); self.flowPart123 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.horzLine42 ~= nil then self.horzLine42:destroy(); self.horzLine42 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.horzLine74 ~= nil then self.horzLine74:destroy(); self.horzLine74 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.horzLine61 ~= nil then self.horzLine61:destroy(); self.horzLine61 = nil; end;
        if self.horzLine43 ~= nil then self.horzLine43:destroy(); self.horzLine43 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.flowPart130 ~= nil then self.flowPart130:destroy(); self.flowPart130 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.horzLine21 ~= nil then self.horzLine21:destroy(); self.horzLine21 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.horzLine27 ~= nil then self.horzLine27:destroy(); self.horzLine27 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.horzLine46 ~= nil then self.horzLine46:destroy(); self.horzLine46 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.horzLine51 ~= nil then self.horzLine51:destroy(); self.horzLine51 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.layoutPtBonusEConhecimentos ~= nil then self.layoutPtBonusEConhecimentos:destroy(); self.layoutPtBonusEConhecimentos = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.flowPart148 ~= nil then self.flowPart148:destroy(); self.flowPart148 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.adestrarAnimaisMinus ~= nil then self.adestrarAnimaisMinus:destroy(); self.adestrarAnimaisMinus = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.linguagemComumPlus ~= nil then self.linguagemComumPlus:destroy(); self.linguagemComumPlus = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.tabelaPtBonusEConhecimentos ~= nil then self.tabelaPtBonusEConhecimentos:destroy(); self.tabelaPtBonusEConhecimentos = nil; end;
        if self.horzLine73 ~= nil then self.horzLine73:destroy(); self.horzLine73 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.flowPart134 ~= nil then self.flowPart134:destroy(); self.flowPart134 = nil; end;
        if self.horzLine32 ~= nil then self.horzLine32:destroy(); self.horzLine32 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.historiaMinus ~= nil then self.historiaMinus:destroy(); self.historiaMinus = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.flowPart137 ~= nil then self.flowPart137:destroy(); self.flowPart137 = nil; end;
        if self.horzLine68 ~= nil then self.horzLine68:destroy(); self.horzLine68 = nil; end;
        if self.horzLine78 ~= nil then self.horzLine78:destroy(); self.horzLine78 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.linguagemDraconicaMinus ~= nil then self.linguagemDraconicaMinus:destroy(); self.linguagemDraconicaMinus = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.flowPart151 ~= nil then self.flowPart151:destroy(); self.flowPart151 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.flowPart146 ~= nil then self.flowPart146:destroy(); self.flowPart146 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.percepcaoMinus ~= nil then self.percepcaoMinus:destroy(); self.percepcaoMinus = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.persuasaoMinus ~= nil then self.persuasaoMinus:destroy(); self.persuasaoMinus = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.furtividadeMinus ~= nil then self.furtividadeMinus:destroy(); self.furtividadeMinus = nil; end;
        if self.faunafloraPlus ~= nil then self.faunafloraPlus:destroy(); self.faunafloraPlus = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.horzLine55 ~= nil then self.horzLine55:destroy(); self.horzLine55 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.intimidacaoPlus ~= nil then self.intimidacaoPlus:destroy(); self.intimidacaoPlus = nil; end;
        if self.horzLine24 ~= nil then self.horzLine24:destroy(); self.horzLine24 = nil; end;
        if self.horzLine65 ~= nil then self.horzLine65:destroy(); self.horzLine65 = nil; end;
        if self.horzLine77 ~= nil then self.horzLine77:destroy(); self.horzLine77 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
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
