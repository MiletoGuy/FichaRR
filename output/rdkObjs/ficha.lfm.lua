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
    obj:setTitle("Ficha de Gaia");
    obj:setName("frmFichaDePersonagem");
    obj:setTheme("dark");


                local function possui(campo, valor)
			        if string.find(campo, valor) ~= nil then
			            return true
			        else
			            return false
			        end
			    end

			    local function valorBase(campo)
                    local classe = sheet.classe
                    local raca = sheet.raca

                    if campo == 'magia' then
                        if possui(classe,'Arcanista') then return 2
                        end

                    elseif campo == 'linguagemComum' then
                        if possui(raca,'Elfo') then return 8
                        end

                    elseif campo == 'linguagemElfica' then
                        if possui(raca,'Elfo') then return 8
                        end

                    elseif campo == 'linguagemAna' then
                        if possui(classe,'Arcanista') then return 2
                        end

                    elseif campo == 'percepcao' then
                        if possui(raca,'Elfo') then return 4
                        end

                    else return 0
                    end
			    end

                local function sobeNivel(campo)
                    if campo == 'classe' then
                        sheet.nivelClasse = sheet.nivelClasse + 1
                        sheet.pontosRestantes = sheet.pontosRestantes + 2
                    elseif campo == 'profissao' then
                        sheet.nivelProfissao = sheet.nivelProfissao + 1
                    end
                end
			


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

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setText("Inicia");
    obj.button1:setName("button1");

    obj.perfilLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.perfilLayout:setParent(obj.scrollBox1);
    obj.perfilLayout:setName("perfilLayout");
    obj.perfilLayout:setAlign("top");
    obj.perfilLayout:setHeight(800);
    obj.perfilLayout:setMargins({left=10, right=10, top=10});
    obj.perfilLayout:setAutoHeight(true);
    obj.perfilLayout:setHorzAlign("center");
    obj.perfilLayout:setLineSpacing(2);
    obj.perfilLayout:setMaxWidth(1600);
    obj.perfilLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.perfilLayout:setMinScaledWidth(300);

    obj.tabelaDadosImagem = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.tabelaDadosImagem:setParent(obj.perfilLayout);
    obj.tabelaDadosImagem:setName("tabelaDadosImagem");
    obj.tabelaDadosImagem:setMinWidth(320);
    obj.tabelaDadosImagem:setMaxWidth(1600);
    obj.tabelaDadosImagem:setAvoidScale(true);
    obj.tabelaDadosImagem:setAutoHeight(true);
    obj.tabelaDadosImagem:setVertAlign("trailing");
    obj.tabelaDadosImagem:setMaxControlsPerLine(3);
    obj.tabelaDadosImagem:setHorzAlign("center");

    obj.imagemDoPersonagem = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.imagemDoPersonagem:setParent(obj.tabelaDadosImagem);
    obj.imagemDoPersonagem:setName("imagemDoPersonagem");
    obj.imagemDoPersonagem:setMinWidth(250);
    obj.imagemDoPersonagem:setMaxWidth(400);
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
    obj.rectangle2:setHeight(250);
    obj.rectangle2:setWidth(250);
    obj.rectangle2:setName("rectangle2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle2);
    obj.image1:setSRC("");
    obj.image1:setStyle("autoFit");
    obj.image1:setOptimize(true);
    obj.image1:setEditable(true);
    obj.image1:setAlign("client");
    obj.image1:setField("imagem");
    obj.image1:setMargins({left=5,right=5,top=5,bottom=5});
    obj.image1:setName("image1");

    obj.dadosDoPersonagem = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.dadosDoPersonagem:setParent(obj.tabelaDadosImagem);
    obj.dadosDoPersonagem:setName("dadosDoPersonagem");
    obj.dadosDoPersonagem:setMinWidth(500);
    obj.dadosDoPersonagem:setMaxWidth(800);
    obj.dadosDoPersonagem:setAvoidScale(true);
    obj.dadosDoPersonagem:setAutoHeight(true);
    obj.dadosDoPersonagem:setVertAlign("trailing");
    obj.dadosDoPersonagem:setMaxControlsPerLine(1);
    obj.dadosDoPersonagem:setHorzAlign("center");

    obj.dadosDestaque = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.dadosDestaque:setParent(obj.dadosDoPersonagem);
    obj.dadosDestaque:setName("dadosDestaque");
    obj.dadosDestaque:setMinWidth(250);
    obj.dadosDestaque:setMaxWidth(800);
    obj.dadosDestaque:setAvoidScale(true);
    obj.dadosDestaque:setAutoHeight(true);
    obj.dadosDestaque:setVertAlign("trailing");
    obj.dadosDestaque:setMaxControlsPerLine(2);
    obj.dadosDestaque:setHorzAlign("center");

    obj.dadosNomeNivel = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.dadosNomeNivel:setParent(obj.dadosDestaque);
    obj.dadosNomeNivel:setName("dadosNomeNivel");
    obj.dadosNomeNivel:setMinWidth(200);
    obj.dadosNomeNivel:setMaxWidth(400);
    obj.dadosNomeNivel:setAvoidScale(true);
    obj.dadosNomeNivel:setAutoHeight(true);
    obj.dadosNomeNivel:setVertAlign("trailing");
    obj.dadosNomeNivel:setMaxControlsPerLine(2);
    obj.dadosNomeNivel:setHorzAlign("center");

    obj.nome = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.nome:setParent(obj.dadosNomeNivel);
    obj.nome:setHeight(50);
    obj.nome:setMinScaledWidth(100);
    obj.nome:setMinWidth(100);
    obj.nome:setMaxWidth(233);
    obj.nome:setMaxScaledWidth(233);
    obj.nome:setAvoidScale(true);
    obj.nome:setName("nome");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.nome);
    obj.edit1:setAlign("top");
    obj.edit1:setField("nome");
    obj.edit1:setFontSize(13);
    obj.edit1:setName("edit1");
    obj.edit1:setHeight(30);
    obj.edit1:setTransparent(true);
    obj.edit1:setVertTextAlign("trailing");
    obj.edit1:setWidth(195);

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.nome);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setStrokeColor("#FFFFFF50");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setMargins({right=5});
    obj.horzLine1:setName("horzLine1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.nome);
    obj.label1:setAlign("top");
    obj.label1:setText("Nome");
    obj.label1:setVertTextAlign("leading");
    obj.label1:setWordWrap(true);
    obj.label1:setTextTrimming("none");
    obj.label1:setName("label1");
    obj.label1:setFontSize(12);
    obj.label1:setFontColor("#D0D0D0");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.dadosNomeNivel);
    obj.flowPart1:setHeight(50);
    obj.flowPart1:setMinScaledWidth(100);
    obj.flowPart1:setMinWidth(100);
    obj.flowPart1:setMaxWidth(233);
    obj.flowPart1:setMaxScaledWidth(233);
    obj.flowPart1:setAvoidScale(true);
    obj.flowPart1:setName("flowPart1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart1);
    obj.edit2:setAlign("top");
    obj.edit2:setField("raca");
    obj.edit2:setFontSize(13);
    obj.edit2:setName("edit2");
    obj.edit2:setHeight(30);
    obj.edit2:setTransparent(true);
    obj.edit2:setVertTextAlign("trailing");
    obj.edit2:setWidth(195);

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart1);
    obj.horzLine2:setAlign("top");
    obj.horzLine2:setStrokeColor("#FFFFFF50");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setMargins({right=5});
    obj.horzLine2:setName("horzLine2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart1);
    obj.label2:setAlign("top");
    obj.label2:setText("Raça");
    obj.label2:setVertTextAlign("leading");
    obj.label2:setWordWrap(true);
    obj.label2:setTextTrimming("none");
    obj.label2:setName("label2");
    obj.label2:setFontSize(12);
    obj.label2:setFontColor("#D0D0D0");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.dadosNomeNivel);
    obj.flowPart2:setHeight(50);
    obj.flowPart2:setMinScaledWidth(100);
    obj.flowPart2:setMinWidth(100);
    obj.flowPart2:setMaxWidth(400);
    obj.flowPart2:setMaxScaledWidth(400);
    obj.flowPart2:setAvoidScale(true);
    obj.flowPart2:setName("flowPart2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart2);
    obj.edit3:setAlign("top");
    obj.edit3:setField("classe");
    obj.edit3:setFontSize(13);
    obj.edit3:setName("edit3");
    obj.edit3:setHeight(30);
    obj.edit3:setTransparent(true);
    obj.edit3:setVertTextAlign("trailing");
    obj.edit3:setWidth(195);

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.flowPart2);
    obj.horzLine3:setAlign("top");
    obj.horzLine3:setStrokeColor("#FFFFFF50");
    obj.horzLine3:setStrokeSize(1);
    obj.horzLine3:setMargins({right=5});
    obj.horzLine3:setName("horzLine3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart2);
    obj.label3:setAlign("top");
    obj.label3:setText("Classe");
    obj.label3:setVertTextAlign("leading");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setName("label3");
    obj.label3:setFontSize(12);
    obj.label3:setFontColor("#D0D0D0");

    obj.dadosDeNivel = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.dadosDeNivel:setParent(obj.dadosDestaque);
    obj.dadosDeNivel:setName("dadosDeNivel");
    obj.dadosDeNivel:setMinWidth(200);
    obj.dadosDeNivel:setMaxWidth(400);
    obj.dadosDeNivel:setAvoidScale(true);
    obj.dadosDeNivel:setAutoHeight(true);
    obj.dadosDeNivel:setVertAlign("trailing");
    obj.dadosDeNivel:setMaxControlsPerLine(3);
    obj.dadosDeNivel:setHorzAlign("center");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.dadosDeNivel);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setYradius(100);
    obj.rectangle3:setXradius(20);
    obj.rectangle3:setStrokeColor("silver");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setHeight(75);
    obj.rectangle3:setWidth(100);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setMargins({top=2, bottom=2, left=2, right=2});
    obj.rectangle3:setName("rectangle3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle3);
    obj.label4:setAlign("client");
    obj.label4:setField("nivelClasse");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setVertTextAlign("center");
    obj.label4:setFontSize(25);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setWidth(60);
    obj.label4:setHeight(20);
    obj.label4:setMargins({top=10});
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle3);
    obj.label5:setText("Classe");
    obj.label5:setVertTextAlign("trailing");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setAlign("bottom");
    obj.label5:setMargins({bottom=5});
    obj.label5:setFontSize(14);
    obj.label5:setName("label5");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.dadosDeNivel);
    obj.layout1:setAlign("client");
    obj.layout1:setHeight(0);
    obj.layout1:setWidth(0);
    obj.layout1:setName("layout1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.dadosDeNivel);
    obj.rectangle4:setCornerType("bevel");
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setYradius(100);
    obj.rectangle4:setXradius(20);
    obj.rectangle4:setStrokeColor("silver");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setHeight(75);
    obj.rectangle4:setWidth(100);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setMargins({top=2, bottom=2, left=2, right=2});
    obj.rectangle4:setName("rectangle4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle4);
    obj.label6:setAlign("client");
    obj.label6:setField("nivelProfissao");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setVertTextAlign("center");
    obj.label6:setFontSize(25);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setWidth(60);
    obj.label6:setHeight(20);
    obj.label6:setMargins({top=10});
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle4);
    obj.label7:setText("Profissão");
    obj.label7:setVertTextAlign("trailing");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setAlign("bottom");
    obj.label7:setMargins({bottom=5});
    obj.label7:setFontSize(14);
    obj.label7:setName("label7");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.dadosDeNivel);
    obj.button2:setText("-");
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setName("button2");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.dadosDeNivel);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setYradius(100);
    obj.rectangle5:setXradius(20);
    obj.rectangle5:setStrokeColor("silver");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setHeight(75);
    obj.rectangle5:setWidth(100);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setMargins({top=2, bottom=2, left=2, right=2});
    obj.rectangle5:setName("rectangle5");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle5);
    obj.label8:setAlign("client");
    obj.label8:setField("pDestino");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setVertTextAlign("center");
    obj.label8:setFontSize(25);
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setWidth(60);
    obj.label8:setHeight(20);
    obj.label8:setMargins({top=10});
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle5);
    obj.label9:setText("P.Destino");
    obj.label9:setVertTextAlign("trailing");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setAlign("bottom");
    obj.label9:setMargins({bottom=5});
    obj.label9:setFontSize(14);
    obj.label9:setName("label9");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.dadosDeNivel);
    obj.button3:setText("+");
    obj.button3:setWidth(20);
    obj.button3:setHeight(20);
    obj.button3:setName("button3");

    obj.dadosGerais = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.dadosGerais:setParent(obj.dadosDoPersonagem);
    obj.dadosGerais:setName("dadosGerais");
    obj.dadosGerais:setMinWidth(500);
    obj.dadosGerais:setMaxWidth(800);
    obj.dadosGerais:setAvoidScale(true);
    obj.dadosGerais:setAutoHeight(true);
    obj.dadosGerais:setVertAlign("trailing");
    obj.dadosGerais:setMaxControlsPerLine(3);
    obj.dadosGerais:setHorzAlign("center");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.dadosGerais);
    obj.flowPart3:setHeight(50);
    obj.flowPart3:setMinScaledWidth(100);
    obj.flowPart3:setMinWidth(100);
    obj.flowPart3:setMaxWidth(233);
    obj.flowPart3:setMaxScaledWidth(233);
    obj.flowPart3:setAvoidScale(true);
    obj.flowPart3:setName("flowPart3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart3);
    obj.edit4:setAlign("top");
    obj.edit4:setField("peso");
    obj.edit4:setFontSize(13);
    obj.edit4:setName("edit4");
    obj.edit4:setHeight(30);
    obj.edit4:setTransparent(true);
    obj.edit4:setVertTextAlign("trailing");
    obj.edit4:setWidth(195);

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.flowPart3);
    obj.horzLine4:setAlign("top");
    obj.horzLine4:setStrokeColor("#FFFFFF50");
    obj.horzLine4:setStrokeSize(1);
    obj.horzLine4:setMargins({right=5});
    obj.horzLine4:setName("horzLine4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart3);
    obj.label10:setAlign("top");
    obj.label10:setText("Peso");
    obj.label10:setVertTextAlign("leading");
    obj.label10:setWordWrap(true);
    obj.label10:setTextTrimming("none");
    obj.label10:setName("label10");
    obj.label10:setFontSize(12);
    obj.label10:setFontColor("#D0D0D0");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.dadosGerais);
    obj.flowPart4:setHeight(50);
    obj.flowPart4:setMinScaledWidth(100);
    obj.flowPart4:setMinWidth(100);
    obj.flowPart4:setMaxWidth(233);
    obj.flowPart4:setMaxScaledWidth(233);
    obj.flowPart4:setAvoidScale(true);
    obj.flowPart4:setName("flowPart4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart4);
    obj.edit5:setAlign("top");
    obj.edit5:setField("altura");
    obj.edit5:setFontSize(13);
    obj.edit5:setName("edit5");
    obj.edit5:setHeight(30);
    obj.edit5:setTransparent(true);
    obj.edit5:setVertTextAlign("trailing");
    obj.edit5:setWidth(195);

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.flowPart4);
    obj.horzLine5:setAlign("top");
    obj.horzLine5:setStrokeColor("#FFFFFF50");
    obj.horzLine5:setStrokeSize(1);
    obj.horzLine5:setMargins({right=5});
    obj.horzLine5:setName("horzLine5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart4);
    obj.label11:setAlign("top");
    obj.label11:setText("Altura");
    obj.label11:setVertTextAlign("leading");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setName("label11");
    obj.label11:setFontSize(12);
    obj.label11:setFontColor("#D0D0D0");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.dadosGerais);
    obj.flowPart5:setHeight(50);
    obj.flowPart5:setMinScaledWidth(100);
    obj.flowPart5:setMinWidth(100);
    obj.flowPart5:setMaxWidth(233);
    obj.flowPart5:setMaxScaledWidth(233);
    obj.flowPart5:setAvoidScale(true);
    obj.flowPart5:setName("flowPart5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart5);
    obj.edit6:setAlign("top");
    obj.edit6:setField("idade");
    obj.edit6:setFontSize(13);
    obj.edit6:setName("edit6");
    obj.edit6:setHeight(30);
    obj.edit6:setTransparent(true);
    obj.edit6:setVertTextAlign("trailing");
    obj.edit6:setWidth(195);

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.flowPart5);
    obj.horzLine6:setAlign("top");
    obj.horzLine6:setStrokeColor("#FFFFFF50");
    obj.horzLine6:setStrokeSize(1);
    obj.horzLine6:setMargins({right=5});
    obj.horzLine6:setName("horzLine6");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart5);
    obj.label12:setAlign("top");
    obj.label12:setText("Idade");
    obj.label12:setVertTextAlign("leading");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setName("label12");
    obj.label12:setFontSize(12);
    obj.label12:setFontColor("#D0D0D0");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.dadosGerais);
    obj.flowPart6:setHeight(50);
    obj.flowPart6:setMinScaledWidth(100);
    obj.flowPart6:setMinWidth(100);
    obj.flowPart6:setMaxWidth(233);
    obj.flowPart6:setMaxScaledWidth(233);
    obj.flowPart6:setAvoidScale(true);
    obj.flowPart6:setName("flowPart6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart6);
    obj.edit7:setAlign("top");
    obj.edit7:setField("sexo");
    obj.edit7:setFontSize(13);
    obj.edit7:setName("edit7");
    obj.edit7:setHeight(30);
    obj.edit7:setTransparent(true);
    obj.edit7:setVertTextAlign("trailing");
    obj.edit7:setWidth(195);

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.flowPart6);
    obj.horzLine7:setAlign("top");
    obj.horzLine7:setStrokeColor("#FFFFFF50");
    obj.horzLine7:setStrokeSize(1);
    obj.horzLine7:setMargins({right=5});
    obj.horzLine7:setName("horzLine7");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart6);
    obj.label13:setAlign("top");
    obj.label13:setText("Sexo");
    obj.label13:setVertTextAlign("leading");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setName("label13");
    obj.label13:setFontSize(12);
    obj.label13:setFontColor("#D0D0D0");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.dadosGerais);
    obj.flowPart7:setHeight(50);
    obj.flowPart7:setMinScaledWidth(100);
    obj.flowPart7:setMinWidth(100);
    obj.flowPart7:setMaxWidth(233);
    obj.flowPart7:setMaxScaledWidth(233);
    obj.flowPart7:setAvoidScale(true);
    obj.flowPart7:setName("flowPart7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart7);
    obj.edit8:setAlign("top");
    obj.edit8:setField("nacionalidade");
    obj.edit8:setFontSize(13);
    obj.edit8:setName("edit8");
    obj.edit8:setHeight(30);
    obj.edit8:setTransparent(true);
    obj.edit8:setVertTextAlign("trailing");
    obj.edit8:setWidth(195);

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.flowPart7);
    obj.horzLine8:setAlign("top");
    obj.horzLine8:setStrokeColor("#FFFFFF50");
    obj.horzLine8:setStrokeSize(1);
    obj.horzLine8:setMargins({right=5});
    obj.horzLine8:setName("horzLine8");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart7);
    obj.label14:setAlign("top");
    obj.label14:setText("Nacionalidade");
    obj.label14:setVertTextAlign("leading");
    obj.label14:setWordWrap(true);
    obj.label14:setTextTrimming("none");
    obj.label14:setName("label14");
    obj.label14:setFontSize(12);
    obj.label14:setFontColor("#D0D0D0");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.dadosGerais);
    obj.flowPart8:setHeight(50);
    obj.flowPart8:setMinScaledWidth(100);
    obj.flowPart8:setMinWidth(100);
    obj.flowPart8:setMaxWidth(233);
    obj.flowPart8:setMaxScaledWidth(233);
    obj.flowPart8:setAvoidScale(true);
    obj.flowPart8:setName("flowPart8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart8);
    obj.edit9:setAlign("top");
    obj.edit9:setField("divindade");
    obj.edit9:setFontSize(13);
    obj.edit9:setName("edit9");
    obj.edit9:setHeight(30);
    obj.edit9:setTransparent(true);
    obj.edit9:setVertTextAlign("trailing");
    obj.edit9:setWidth(195);

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.flowPart8);
    obj.horzLine9:setAlign("top");
    obj.horzLine9:setStrokeColor("#FFFFFF50");
    obj.horzLine9:setStrokeSize(1);
    obj.horzLine9:setMargins({right=5});
    obj.horzLine9:setName("horzLine9");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart8);
    obj.label15:setAlign("top");
    obj.label15:setText("Divindade");
    obj.label15:setVertTextAlign("leading");
    obj.label15:setWordWrap(true);
    obj.label15:setTextTrimming("none");
    obj.label15:setName("label15");
    obj.label15:setFontSize(12);
    obj.label15:setFontColor("#D0D0D0");

    obj.dadosAdicionais = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.dadosAdicionais:setParent(obj.tabelaDadosImagem);
    obj.dadosAdicionais:setName("dadosAdicionais");
    obj.dadosAdicionais:setMinWidth(250);
    obj.dadosAdicionais:setMaxWidth(400);
    obj.dadosAdicionais:setAutoHeight(true);
    obj.dadosAdicionais:setVertAlign("trailing");
    obj.dadosAdicionais:setHorzAlign("center");
    obj.dadosAdicionais:setMaxControlsPerLine(1);

    obj.vidaEDefesa = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.vidaEDefesa:setParent(obj.dadosAdicionais);
    obj.vidaEDefesa:setName("vidaEDefesa");
    obj.vidaEDefesa:setMinWidth(250);
    obj.vidaEDefesa:setMaxWidth(400);
    obj.vidaEDefesa:setAutoHeight(true);
    obj.vidaEDefesa:setVertAlign("trailing");
    obj.vidaEDefesa:setHorzAlign("center");
    obj.vidaEDefesa:setMaxControlsPerLine(2);

    obj.rectangleVida = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangleVida:setParent(obj.vidaEDefesa);
    obj.rectangleVida:setCornerType("innerLine");
    obj.rectangleVida:setAlign("client");
    obj.rectangleVida:setName("rectangleVida");
    obj.rectangleVida:setXradius(5);
    obj.rectangleVida:setYradius(5);
    obj.rectangleVida:setHeight(30);
    obj.rectangleVida:setWidth(100);
    obj.rectangleVida:setColor("black");
    obj.rectangleVida:setMargins({top=2, bottom=2, left=2, right=2});

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangleVida);
    obj.label16:setAlign("client");
    obj.label16:setHorzTextAlign("leading");
    obj.label16:setText("Vida:");
    obj.label16:setMargins({left=5, top=5});
    obj.label16:setVertTextAlign("center");
    obj.label16:setFontSize(16);
    lfm_setPropAsString(obj.label16, "fontStyle",  "italic bold");
    obj.label16:setWidth(60);
    obj.label16:setHeight(20);
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangleVida);
    obj.label17:setAlign("client");
    obj.label17:setField("Vida");
    obj.label17:setHorzTextAlign("trailing");
    obj.label17:setMargins({right=8, top=5});
    obj.label17:setVertTextAlign("center");
    obj.label17:setFontSize(17);
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setWidth(60);
    obj.label17:setHeight(20);
    obj.label17:setName("label17");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.rectangleVida);
    obj.horzLine10:setAlign("bottom");
    obj.horzLine10:setStrokeColor("#FFFFFF50");
    obj.horzLine10:setStrokeSize(1);
    obj.horzLine10:setMargins({left=10, right=10,bottom=5});
    obj.horzLine10:setName("horzLine10");

    obj.rectangleDefesa = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangleDefesa:setParent(obj.vidaEDefesa);
    obj.rectangleDefesa:setCornerType("innerLine");
    obj.rectangleDefesa:setAlign("client");
    obj.rectangleDefesa:setName("rectangleDefesa");
    obj.rectangleDefesa:setXradius(5);
    obj.rectangleDefesa:setYradius(5);
    obj.rectangleDefesa:setHeight(30);
    obj.rectangleDefesa:setWidth(100);
    obj.rectangleDefesa:setColor("black");
    obj.rectangleDefesa:setMargins({top=2, bottom=2, left=2, right=2});

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangleDefesa);
    obj.label18:setAlign("client");
    obj.label18:setHorzTextAlign("leading");
    obj.label18:setText("Defesa:");
    obj.label18:setMargins({left=5, top=5});
    obj.label18:setVertTextAlign("center");
    obj.label18:setFontSize(16);
    lfm_setPropAsString(obj.label18, "fontStyle",  "italic bold");
    obj.label18:setWidth(60);
    obj.label18:setHeight(20);
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangleDefesa);
    obj.label19:setAlign("client");
    obj.label19:setField("Defesa");
    obj.label19:setHorzTextAlign("trailing");
    obj.label19:setMargins({right=8, top=5});
    obj.label19:setVertTextAlign("center");
    obj.label19:setFontSize(17);
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setWidth(60);
    obj.label19:setHeight(20);
    obj.label19:setName("label19");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.rectangleDefesa);
    obj.horzLine11:setAlign("bottom");
    obj.horzLine11:setStrokeColor("#FFFFFF50");
    obj.horzLine11:setStrokeSize(1);
    obj.horzLine11:setMargins({left=10, right=10,bottom=5});
    obj.horzLine11:setName("horzLine11");

    obj.popupVida = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupVida:setParent(obj.vidaEDefesa);
    obj.popupVida:setName("popupVida");
    obj.popupVida:setWidth(126);
    obj.popupVida:setHeight(130);
    obj.popupVida:setBackOpacity(0);
    obj.popupVida:setLeft(600);

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popupVida);
    obj.flowLayout1:setWidth(126);
    obj.flowLayout1:setHeight(150);
    obj.flowLayout1:setPadding({top=5,bottom=5,left=5,right=5});
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout1);
    obj.flowPart9:setHeight(20);
    obj.flowPart9:setWidth(58);
    obj.flowPart9:setName("flowPart9");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart9);
    obj.label20:setText("Const.");
    obj.label20:setAlign("client");
    obj.label20:setHorzTextAlign("leading");
    obj.label20:setFontColor("white");
    obj.label20:setField("");
    obj.label20:setName("label20");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setHeight(20);
    obj.flowPart10:setWidth(58);
    obj.flowPart10:setName("flowPart10");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart10);
    obj.label21:setText("");
    obj.label21:setAlign("client");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontColor("white");
    obj.label21:setField("conVida");
    obj.label21:setName("label21");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout1);
    obj.flowPart11:setHeight(20);
    obj.flowPart11:setWidth(58);
    obj.flowPart11:setName("flowPart11");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart11);
    obj.label22:setText("Arma");
    obj.label22:setAlign("client");
    obj.label22:setHorzTextAlign("leading");
    obj.label22:setFontColor("white");
    obj.label22:setField("");
    obj.label22:setName("label22");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout1);
    obj.flowPart12:setHeight(20);
    obj.flowPart12:setWidth(58);
    obj.flowPart12:setName("flowPart12");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart12);
    obj.edit10:setAlign("client");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setTransparent(true);
    obj.edit10:setFontColor("white");
    obj.edit10:setField("armaVida");
    obj.edit10:setName("edit10");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout1);
    obj.flowPart13:setHeight(20);
    obj.flowPart13:setWidth(58);
    obj.flowPart13:setName("flowPart13");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart13);
    obj.label23:setText("Armadura");
    obj.label23:setAlign("client");
    obj.label23:setHorzTextAlign("leading");
    obj.label23:setFontColor("white");
    obj.label23:setField("");
    obj.label23:setName("label23");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout1);
    obj.flowPart14:setHeight(20);
    obj.flowPart14:setWidth(58);
    obj.flowPart14:setName("flowPart14");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart14);
    obj.edit11:setAlign("client");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setTransparent(true);
    obj.edit11:setFontColor("white");
    obj.edit11:setField("armaduraVida");
    obj.edit11:setName("edit11");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout1);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setWidth(58);
    obj.flowPart15:setName("flowPart15");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart15);
    obj.label24:setText("Outro");
    obj.label24:setAlign("client");
    obj.label24:setHorzTextAlign("leading");
    obj.label24:setFontColor("white");
    obj.label24:setField("");
    obj.label24:setName("label24");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout1);
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setWidth(58);
    obj.flowPart16:setName("flowPart16");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart16);
    obj.edit12:setAlign("client");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setTransparent(true);
    obj.edit12:setFontColor("white");
    obj.edit12:setField("outroVida");
    obj.edit12:setName("edit12");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout1);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setWidth(58);
    obj.flowPart17:setName("flowPart17");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart17);
    obj.label25:setText("Extra");
    obj.label25:setAlign("client");
    obj.label25:setHorzTextAlign("leading");
    obj.label25:setFontColor("white");
    obj.label25:setField("");
    obj.label25:setName("label25");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout1);
    obj.flowPart18:setHeight(20);
    obj.flowPart18:setWidth(58);
    obj.flowPart18:setName("flowPart18");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart18);
    obj.edit13:setAlign("client");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setTransparent(true);
    obj.edit13:setFontColor("white");
    obj.edit13:setField("extraVida");
    obj.edit13:setName("edit13");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout1);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setWidth(58);
    obj.flowPart19:setName("flowPart19");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart19);
    obj.label26:setText("Total");
    obj.label26:setAlign("client");
    obj.label26:setHorzTextAlign("leading");
    obj.label26:setFontColor("#808000d9");
    obj.label26:setField("");
    obj.label26:setName("label26");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout1);
    obj.flowPart20:setHeight(20);
    obj.flowPart20:setWidth(58);
    obj.flowPart20:setName("flowPart20");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart20);
    obj.label27:setText("");
    obj.label27:setAlign("client");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setFontColor("#808000d9");
    obj.label27:setField("totalVida");
    obj.label27:setName("label27");

    obj.popupDefesa = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupDefesa:setParent(obj.vidaEDefesa);
    obj.popupDefesa:setName("popupDefesa");
    obj.popupDefesa:setWidth(126);
    obj.popupDefesa:setHeight(30);
    obj.popupDefesa:setBackOpacity(0);
    obj.popupDefesa:setLeft(600);

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popupDefesa);
    obj.flowLayout2:setWidth(126);
    obj.flowLayout2:setHeight(150);
    obj.flowLayout2:setPadding({top=5,bottom=5,left=5,right=5});
    obj.flowLayout2:setMaxControlsPerLine(2);
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout2);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setWidth(58);
    obj.flowPart21:setName("flowPart21");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart21);
    obj.label28:setText("Total");
    obj.label28:setAlign("client");
    obj.label28:setHorzTextAlign("leading");
    obj.label28:setFontColor("#808000d9");
    obj.label28:setField("");
    obj.label28:setName("label28");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout2);
    obj.flowPart22:setHeight(20);
    obj.flowPart22:setWidth(58);
    obj.flowPart22:setName("flowPart22");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart22);
    obj.edit14:setAlign("client");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setTransparent(true);
    obj.edit14:setFontColor("#808000d9");
    obj.edit14:setField("totalDefesa");
    obj.edit14:setName("edit14");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.vidaEDefesa);
    obj.dataLink1:setFields({'conVida','armaVida', 'armaduraVida',
                          'outroVida','extraVida', 'totalVida', 'conBase','Defesa','Vida','totalDefesa'});
    obj.dataLink1:setName("dataLink1");

    obj.atributosDestreza = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.atributosDestreza:setParent(obj.dadosAdicionais);
    obj.atributosDestreza:setName("atributosDestreza");
    obj.atributosDestreza:setMinWidth(250);
    obj.atributosDestreza:setMaxWidth(400);
    obj.atributosDestreza:setAutoHeight(true);
    obj.atributosDestreza:setVertAlign("trailing");
    obj.atributosDestreza:setHorzAlign("center");
    obj.atributosDestreza:setMaxControlsPerLine(3);

    obj.rectangleAcerto = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangleAcerto:setParent(obj.atributosDestreza);
    obj.rectangleAcerto:setCornerType("innerLine");
    obj.rectangleAcerto:setAlign("client");
    obj.rectangleAcerto:setHitTest(true);
    obj.rectangleAcerto:setName("rectangleAcerto");
    obj.rectangleAcerto:setXradius(10);
    obj.rectangleAcerto:setYradius(10);
    obj.rectangleAcerto:setHeight(100);
    obj.rectangleAcerto:setWidth(100);
    obj.rectangleAcerto:setColor("black");
    obj.rectangleAcerto:setMargins({top=2, bottom=2, left=2, right=2});

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangleAcerto);
    obj.edit15:setAlign("top");
    obj.edit15:setField("atributoAcerto");
    obj.edit15:setHeight(20);
    obj.edit15:setType("number");
    obj.edit15:setMin(0);
    obj.edit15:setWidth(20);
    obj.edit15:setName("edit15");
    obj.edit15:setTransparent(true);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setHorzTextAlign("center");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangleAcerto);
    obj.label29:setAlign("client");
    obj.label29:setField("modAcerto");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setVertTextAlign("center");
    obj.label29:setFontSize(30);
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setWidth(60);
    obj.label29:setHeight(20);
    obj.label29:setMargins({bottom=8});
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangleAcerto);
    obj.label30:setText("Acerto");
    obj.label30:setVertTextAlign("trailing");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setAlign("bottom");
    obj.label30:setName("label30");

    obj.popupAcerto = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupAcerto:setParent(obj.atributosDestreza);
    obj.popupAcerto:setName("popupAcerto");
    obj.popupAcerto:setWidth(126);
    obj.popupAcerto:setHeight(150);
    obj.popupAcerto:setBackOpacity(0);
    obj.popupAcerto:setLeft(600);

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.popupAcerto);
    obj.flowLayout3:setWidth(126);
    obj.flowLayout3:setHeight(150);
    obj.flowLayout3:setPadding({top=5,bottom=5,left=5,right=5});
    obj.flowLayout3:setMaxControlsPerLine(2);
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout3);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setWidth(58);
    obj.flowPart23:setName("flowPart23");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart23);
    obj.label31:setText("Destreza");
    obj.label31:setAlign("client");
    obj.label31:setHorzTextAlign("leading");
    obj.label31:setFontColor("white");
    obj.label31:setField("");
    obj.label31:setName("label31");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout3);
    obj.flowPart24:setHeight(20);
    obj.flowPart24:setWidth(58);
    obj.flowPart24:setName("flowPart24");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart24);
    obj.label32:setText("");
    obj.label32:setAlign("client");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setFontColor("white");
    obj.label32:setField("destrezaAcerto");
    obj.label32:setName("label32");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout3);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setWidth(58);
    obj.flowPart25:setName("flowPart25");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart25);
    obj.label33:setText("Classe");
    obj.label33:setAlign("client");
    obj.label33:setHorzTextAlign("leading");
    obj.label33:setFontColor("white");
    obj.label33:setField("");
    obj.label33:setName("label33");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout3);
    obj.flowPart26:setHeight(20);
    obj.flowPart26:setWidth(58);
    obj.flowPart26:setName("flowPart26");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart26);
    obj.edit16:setAlign("client");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setTransparent(true);
    obj.edit16:setFontColor("white");
    obj.edit16:setField("classeAcerto");
    obj.edit16:setName("edit16");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout3);
    obj.flowPart27:setHeight(20);
    obj.flowPart27:setWidth(58);
    obj.flowPart27:setName("flowPart27");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart27);
    obj.label34:setText("Base");
    obj.label34:setAlign("client");
    obj.label34:setHorzTextAlign("leading");
    obj.label34:setFontColor("#808000d9");
    obj.label34:setField("");
    obj.label34:setName("label34");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout3);
    obj.flowPart28:setHeight(20);
    obj.flowPart28:setWidth(58);
    obj.flowPart28:setName("flowPart28");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart28);
    obj.label35:setText("");
    obj.label35:setAlign("client");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setFontColor("#808000d9");
    obj.label35:setField("baseAcerto");
    obj.label35:setName("label35");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout3);
    obj.flowPart29:setHeight(20);
    obj.flowPart29:setWidth(58);
    obj.flowPart29:setName("flowPart29");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart29);
    obj.label36:setText("Arma");
    obj.label36:setAlign("client");
    obj.label36:setHorzTextAlign("leading");
    obj.label36:setFontColor("white");
    obj.label36:setField("");
    obj.label36:setName("label36");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout3);
    obj.flowPart30:setHeight(20);
    obj.flowPart30:setWidth(58);
    obj.flowPart30:setName("flowPart30");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart30);
    obj.edit17:setAlign("client");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setTransparent(true);
    obj.edit17:setFontColor("white");
    obj.edit17:setField("armaAcerto");
    obj.edit17:setName("edit17");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout3);
    obj.flowPart31:setHeight(20);
    obj.flowPart31:setWidth(58);
    obj.flowPart31:setName("flowPart31");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart31);
    obj.label37:setText("Armadura");
    obj.label37:setAlign("client");
    obj.label37:setHorzTextAlign("leading");
    obj.label37:setFontColor("white");
    obj.label37:setField("");
    obj.label37:setName("label37");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout3);
    obj.flowPart32:setHeight(20);
    obj.flowPart32:setWidth(58);
    obj.flowPart32:setName("flowPart32");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart32);
    obj.edit18:setAlign("client");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setTransparent(true);
    obj.edit18:setFontColor("white");
    obj.edit18:setField("armaduraAcerto");
    obj.edit18:setName("edit18");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout3);
    obj.flowPart33:setHeight(20);
    obj.flowPart33:setWidth(58);
    obj.flowPart33:setName("flowPart33");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart33);
    obj.label38:setText("Extra");
    obj.label38:setAlign("client");
    obj.label38:setHorzTextAlign("leading");
    obj.label38:setFontColor("white");
    obj.label38:setField("");
    obj.label38:setName("label38");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout3);
    obj.flowPart34:setHeight(20);
    obj.flowPart34:setWidth(58);
    obj.flowPart34:setName("flowPart34");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart34);
    obj.edit19:setAlign("client");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setTransparent(true);
    obj.edit19:setFontColor("white");
    obj.edit19:setField("extraAcerto");
    obj.edit19:setName("edit19");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout3);
    obj.flowPart35:setHeight(20);
    obj.flowPart35:setWidth(58);
    obj.flowPart35:setName("flowPart35");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart35);
    obj.label39:setText("Total");
    obj.label39:setAlign("client");
    obj.label39:setHorzTextAlign("leading");
    obj.label39:setFontColor("#808000d9");
    obj.label39:setField("");
    obj.label39:setName("label39");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout3);
    obj.flowPart36:setHeight(20);
    obj.flowPart36:setWidth(58);
    obj.flowPart36:setName("flowPart36");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart36);
    obj.label40:setText("");
    obj.label40:setAlign("client");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setFontColor("#808000d9");
    obj.label40:setField("totalAcerto");
    obj.label40:setName("label40");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.atributosDestreza);
    obj.dataLink2:setFields({'modAcerto', 'atributoAcerto', 'classe', 'destrezaDisponivel', 'dexBase', 'atributoAcerto', 'atributoMira',
                          'atributoEsquiva', 'atributoBloqueio', 'destrezaAcerto', 'classeAcerto', 'baseAcerto', 'armaAcerto', 'armaduraAcerto',
                          'extraAcerto', 'totalAcerto'});
    obj.dataLink2:setName("dataLink2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.atributosDestreza);
    obj.layout2:setAlign("client");
    obj.layout2:setHeight(0);
    obj.layout2:setWidth(0);
    obj.layout2:setName("layout2");

    obj.rectangleMira = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangleMira:setParent(obj.atributosDestreza);
    obj.rectangleMira:setCornerType("innerLine");
    obj.rectangleMira:setAlign("client");
    obj.rectangleMira:setHitTest(true);
    obj.rectangleMira:setName("rectangleMira");
    obj.rectangleMira:setXradius(10);
    obj.rectangleMira:setYradius(10);
    obj.rectangleMira:setHeight(100);
    obj.rectangleMira:setWidth(100);
    obj.rectangleMira:setColor("black");
    obj.rectangleMira:setMargins({top=2, bottom=2, left=2, right=2});

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangleMira);
    obj.edit20:setAlign("top");
    obj.edit20:setField("atributoMira");
    obj.edit20:setHeight(20);
    obj.edit20:setType("number");
    obj.edit20:setMin(0);
    obj.edit20:setWidth(20);
    obj.edit20:setName("edit20");
    obj.edit20:setTransparent(true);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setHorzTextAlign("center");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangleMira);
    obj.label41:setAlign("client");
    obj.label41:setField("modMira");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setVertTextAlign("center");
    obj.label41:setFontSize(30);
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setWidth(60);
    obj.label41:setHeight(20);
    obj.label41:setMargins({bottom=8});
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangleMira);
    obj.label42:setText("Mira");
    obj.label42:setVertTextAlign("trailing");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setAlign("bottom");
    obj.label42:setName("label42");

    obj.popupMira = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupMira:setParent(obj.atributosDestreza);
    obj.popupMira:setName("popupMira");
    obj.popupMira:setWidth(126);
    obj.popupMira:setHeight(150);
    obj.popupMira:setBackOpacity(0);
    obj.popupMira:setLeft(600);

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.popupMira);
    obj.flowLayout4:setWidth(126);
    obj.flowLayout4:setHeight(150);
    obj.flowLayout4:setPadding({top=5,bottom=5,left=5,right=5});
    obj.flowLayout4:setMaxControlsPerLine(2);
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout4);
    obj.flowPart37:setHeight(20);
    obj.flowPart37:setWidth(58);
    obj.flowPart37:setName("flowPart37");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart37);
    obj.label43:setText("Destreza");
    obj.label43:setAlign("client");
    obj.label43:setHorzTextAlign("leading");
    obj.label43:setFontColor("white");
    obj.label43:setField("");
    obj.label43:setName("label43");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout4);
    obj.flowPart38:setHeight(20);
    obj.flowPart38:setWidth(58);
    obj.flowPart38:setName("flowPart38");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart38);
    obj.label44:setText("");
    obj.label44:setAlign("client");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setFontColor("white");
    obj.label44:setField("destrezaMira");
    obj.label44:setName("label44");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout4);
    obj.flowPart39:setHeight(20);
    obj.flowPart39:setWidth(58);
    obj.flowPart39:setName("flowPart39");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart39);
    obj.label45:setText("Classe");
    obj.label45:setAlign("client");
    obj.label45:setHorzTextAlign("leading");
    obj.label45:setFontColor("white");
    obj.label45:setField("");
    obj.label45:setName("label45");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout4);
    obj.flowPart40:setHeight(20);
    obj.flowPart40:setWidth(58);
    obj.flowPart40:setName("flowPart40");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart40);
    obj.edit21:setAlign("client");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setTransparent(true);
    obj.edit21:setFontColor("white");
    obj.edit21:setField("classeMira");
    obj.edit21:setName("edit21");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout4);
    obj.flowPart41:setHeight(20);
    obj.flowPart41:setWidth(58);
    obj.flowPart41:setName("flowPart41");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart41);
    obj.label46:setText("Base");
    obj.label46:setAlign("client");
    obj.label46:setHorzTextAlign("leading");
    obj.label46:setFontColor("#808000d9");
    obj.label46:setField("");
    obj.label46:setName("label46");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout4);
    obj.flowPart42:setHeight(20);
    obj.flowPart42:setWidth(58);
    obj.flowPart42:setName("flowPart42");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart42);
    obj.label47:setText("");
    obj.label47:setAlign("client");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontColor("#808000d9");
    obj.label47:setField("baseMira");
    obj.label47:setName("label47");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout4);
    obj.flowPart43:setHeight(20);
    obj.flowPart43:setWidth(58);
    obj.flowPart43:setName("flowPart43");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart43);
    obj.label48:setText("Arma");
    obj.label48:setAlign("client");
    obj.label48:setHorzTextAlign("leading");
    obj.label48:setFontColor("white");
    obj.label48:setField("");
    obj.label48:setName("label48");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout4);
    obj.flowPart44:setHeight(20);
    obj.flowPart44:setWidth(58);
    obj.flowPart44:setName("flowPart44");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart44);
    obj.edit22:setAlign("client");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setTransparent(true);
    obj.edit22:setFontColor("white");
    obj.edit22:setField("armaMira");
    obj.edit22:setName("edit22");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout4);
    obj.flowPart45:setHeight(20);
    obj.flowPart45:setWidth(58);
    obj.flowPart45:setName("flowPart45");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart45);
    obj.label49:setText("Armadura");
    obj.label49:setAlign("client");
    obj.label49:setHorzTextAlign("leading");
    obj.label49:setFontColor("white");
    obj.label49:setField("");
    obj.label49:setName("label49");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout4);
    obj.flowPart46:setHeight(20);
    obj.flowPart46:setWidth(58);
    obj.flowPart46:setName("flowPart46");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart46);
    obj.edit23:setAlign("client");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setTransparent(true);
    obj.edit23:setFontColor("white");
    obj.edit23:setField("armaduraMira");
    obj.edit23:setName("edit23");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout4);
    obj.flowPart47:setHeight(20);
    obj.flowPart47:setWidth(58);
    obj.flowPart47:setName("flowPart47");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart47);
    obj.label50:setText("Extra");
    obj.label50:setAlign("client");
    obj.label50:setHorzTextAlign("leading");
    obj.label50:setFontColor("white");
    obj.label50:setField("");
    obj.label50:setName("label50");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout4);
    obj.flowPart48:setHeight(20);
    obj.flowPart48:setWidth(58);
    obj.flowPart48:setName("flowPart48");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart48);
    obj.edit24:setAlign("client");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setTransparent(true);
    obj.edit24:setFontColor("white");
    obj.edit24:setField("extraMira");
    obj.edit24:setName("edit24");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout4);
    obj.flowPart49:setHeight(20);
    obj.flowPart49:setWidth(58);
    obj.flowPart49:setName("flowPart49");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart49);
    obj.label51:setText("Total");
    obj.label51:setAlign("client");
    obj.label51:setHorzTextAlign("leading");
    obj.label51:setFontColor("#808000d9");
    obj.label51:setField("");
    obj.label51:setName("label51");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout4);
    obj.flowPart50:setHeight(20);
    obj.flowPart50:setWidth(58);
    obj.flowPart50:setName("flowPart50");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart50);
    obj.label52:setText("");
    obj.label52:setAlign("client");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setFontColor("#808000d9");
    obj.label52:setField("totalMira");
    obj.label52:setName("label52");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.atributosDestreza);
    obj.dataLink3:setFields({'modMira', 'atributoMira', 'classe', 'destrezaDisponivel', 'dexBase', 'atributoAcerto', 'atributoMira',
                          'atributoEsquiva', 'atributoBloqueio', 'destrezaMira', 'classeMira', 'baseMira', 'armaMira', 'armaduraMira',
                          'extraMira', 'totalMira'});
    obj.dataLink3:setName("dataLink3");

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
    obj.rectangle6:setXradius(7);
    obj.rectangle6:setYradius(7);
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setMargins({left=2.5});
    obj.rectangle6:setName("rectangle6");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle6);
    obj.label53:setField("destrezaDisponivel");
    obj.label53:setWidth(30);
    obj.label53:setAlign("client");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("center");
    obj.label53:setFontSize(14);
    obj.label53:setName("label53");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.atributosDestreza);
    obj.layout4:setAlign("client");
    obj.layout4:setHeight(0);
    obj.layout4:setWidth(0);
    obj.layout4:setName("layout4");

    obj.rectangleEsquiva = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangleEsquiva:setParent(obj.atributosDestreza);
    obj.rectangleEsquiva:setCornerType("innerLine");
    obj.rectangleEsquiva:setAlign("client");
    obj.rectangleEsquiva:setHitTest(true);
    obj.rectangleEsquiva:setName("rectangleEsquiva");
    obj.rectangleEsquiva:setXradius(10);
    obj.rectangleEsquiva:setYradius(10);
    obj.rectangleEsquiva:setHeight(100);
    obj.rectangleEsquiva:setWidth(100);
    obj.rectangleEsquiva:setColor("black");
    obj.rectangleEsquiva:setMargins({top=2, bottom=2, left=2, right=2});

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangleEsquiva);
    obj.edit25:setAlign("top");
    obj.edit25:setField("atributoEsquiva");
    obj.edit25:setHeight(20);
    obj.edit25:setType("number");
    obj.edit25:setMin(0);
    obj.edit25:setWidth(20);
    obj.edit25:setName("edit25");
    obj.edit25:setTransparent(true);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setHorzTextAlign("center");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangleEsquiva);
    obj.label54:setAlign("client");
    obj.label54:setField("modEsquiva");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setVertTextAlign("center");
    obj.label54:setFontSize(30);
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setWidth(60);
    obj.label54:setHeight(20);
    obj.label54:setMargins({bottom=8});
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangleEsquiva);
    obj.label55:setText("Esquiva");
    obj.label55:setVertTextAlign("trailing");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setAlign("bottom");
    obj.label55:setName("label55");

    obj.popupEsquiva = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupEsquiva:setParent(obj.atributosDestreza);
    obj.popupEsquiva:setName("popupEsquiva");
    obj.popupEsquiva:setWidth(126);
    obj.popupEsquiva:setHeight(150);
    obj.popupEsquiva:setBackOpacity(0);
    obj.popupEsquiva:setLeft(600);

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.popupEsquiva);
    obj.flowLayout5:setWidth(126);
    obj.flowLayout5:setHeight(150);
    obj.flowLayout5:setPadding({top=5,bottom=5,left=5,right=5});
    obj.flowLayout5:setMaxControlsPerLine(2);
    obj.flowLayout5:setName("flowLayout5");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout5);
    obj.flowPart51:setHeight(20);
    obj.flowPart51:setWidth(58);
    obj.flowPart51:setName("flowPart51");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart51);
    obj.label56:setText("Destreza");
    obj.label56:setAlign("client");
    obj.label56:setHorzTextAlign("leading");
    obj.label56:setFontColor("white");
    obj.label56:setField("");
    obj.label56:setName("label56");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout5);
    obj.flowPart52:setHeight(20);
    obj.flowPart52:setWidth(58);
    obj.flowPart52:setName("flowPart52");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart52);
    obj.label57:setText("");
    obj.label57:setAlign("client");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setFontColor("white");
    obj.label57:setField("destrezaEsquiva");
    obj.label57:setName("label57");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout5);
    obj.flowPart53:setHeight(20);
    obj.flowPart53:setWidth(58);
    obj.flowPart53:setName("flowPart53");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart53);
    obj.label58:setText("Classe");
    obj.label58:setAlign("client");
    obj.label58:setHorzTextAlign("leading");
    obj.label58:setFontColor("white");
    obj.label58:setField("");
    obj.label58:setName("label58");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout5);
    obj.flowPart54:setHeight(20);
    obj.flowPart54:setWidth(58);
    obj.flowPart54:setName("flowPart54");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart54);
    obj.edit26:setAlign("client");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setTransparent(true);
    obj.edit26:setFontColor("white");
    obj.edit26:setField("classeEsquiva");
    obj.edit26:setName("edit26");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout5);
    obj.flowPart55:setHeight(20);
    obj.flowPart55:setWidth(58);
    obj.flowPart55:setName("flowPart55");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart55);
    obj.label59:setText("Base");
    obj.label59:setAlign("client");
    obj.label59:setHorzTextAlign("leading");
    obj.label59:setFontColor("#808000d9");
    obj.label59:setField("");
    obj.label59:setName("label59");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout5);
    obj.flowPart56:setHeight(20);
    obj.flowPart56:setWidth(58);
    obj.flowPart56:setName("flowPart56");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart56);
    obj.label60:setText("");
    obj.label60:setAlign("client");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setFontColor("#808000d9");
    obj.label60:setField("baseEsquiva");
    obj.label60:setName("label60");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout5);
    obj.flowPart57:setHeight(20);
    obj.flowPart57:setWidth(58);
    obj.flowPart57:setName("flowPart57");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart57);
    obj.label61:setText("Arma");
    obj.label61:setAlign("client");
    obj.label61:setHorzTextAlign("leading");
    obj.label61:setFontColor("white");
    obj.label61:setField("");
    obj.label61:setName("label61");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout5);
    obj.flowPart58:setHeight(20);
    obj.flowPart58:setWidth(58);
    obj.flowPart58:setName("flowPart58");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart58);
    obj.edit27:setAlign("client");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setTransparent(true);
    obj.edit27:setFontColor("white");
    obj.edit27:setField("armaEsquiva");
    obj.edit27:setName("edit27");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout5);
    obj.flowPart59:setHeight(20);
    obj.flowPart59:setWidth(58);
    obj.flowPart59:setName("flowPart59");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart59);
    obj.label62:setText("Armadura");
    obj.label62:setAlign("client");
    obj.label62:setHorzTextAlign("leading");
    obj.label62:setFontColor("white");
    obj.label62:setField("");
    obj.label62:setName("label62");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout5);
    obj.flowPart60:setHeight(20);
    obj.flowPart60:setWidth(58);
    obj.flowPart60:setName("flowPart60");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart60);
    obj.edit28:setAlign("client");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setTransparent(true);
    obj.edit28:setFontColor("white");
    obj.edit28:setField("armaduraEsquiva");
    obj.edit28:setName("edit28");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout5);
    obj.flowPart61:setHeight(20);
    obj.flowPart61:setWidth(58);
    obj.flowPart61:setName("flowPart61");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart61);
    obj.label63:setText("Extra");
    obj.label63:setAlign("client");
    obj.label63:setHorzTextAlign("leading");
    obj.label63:setFontColor("white");
    obj.label63:setField("");
    obj.label63:setName("label63");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout5);
    obj.flowPart62:setHeight(20);
    obj.flowPart62:setWidth(58);
    obj.flowPart62:setName("flowPart62");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart62);
    obj.edit29:setAlign("client");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setTransparent(true);
    obj.edit29:setFontColor("white");
    obj.edit29:setField("extraEsquiva");
    obj.edit29:setName("edit29");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout5);
    obj.flowPart63:setHeight(20);
    obj.flowPart63:setWidth(58);
    obj.flowPart63:setName("flowPart63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart63);
    obj.label64:setText("Total");
    obj.label64:setAlign("client");
    obj.label64:setHorzTextAlign("leading");
    obj.label64:setFontColor("#808000d9");
    obj.label64:setField("");
    obj.label64:setName("label64");

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout5);
    obj.flowPart64:setHeight(20);
    obj.flowPart64:setWidth(58);
    obj.flowPart64:setName("flowPart64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart64);
    obj.label65:setText("");
    obj.label65:setAlign("client");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setFontColor("#808000d9");
    obj.label65:setField("totalEsquiva");
    obj.label65:setName("label65");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.atributosDestreza);
    obj.dataLink4:setFields({'modEsquiva', 'atributoEsquiva', 'classe', 'destrezaDisponivel', 'dexBase', 'atributoAcerto', 'atributoMira',
                          'atributoEsquiva', 'atributoBloqueio', 'destrezaEsquiva', 'classeEsquiva', 'baseEsquiva', 'armaEsquiva', 'armaduraEsquiva',
                          'extraEsquiva', 'totalEsquiva'});
    obj.dataLink4:setName("dataLink4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.atributosDestreza);
    obj.layout5:setAlign("client");
    obj.layout5:setHeight(0);
    obj.layout5:setWidth(0);
    obj.layout5:setName("layout5");

    obj.rectangleBloqueio = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangleBloqueio:setParent(obj.atributosDestreza);
    obj.rectangleBloqueio:setCornerType("innerLine");
    obj.rectangleBloqueio:setAlign("client");
    obj.rectangleBloqueio:setHitTest(true);
    obj.rectangleBloqueio:setName("rectangleBloqueio");
    obj.rectangleBloqueio:setXradius(10);
    obj.rectangleBloqueio:setYradius(10);
    obj.rectangleBloqueio:setHeight(100);
    obj.rectangleBloqueio:setWidth(100);
    obj.rectangleBloqueio:setColor("black");
    obj.rectangleBloqueio:setMargins({top=2, bottom=2, left=2, right=2});

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangleBloqueio);
    obj.edit30:setAlign("top");
    obj.edit30:setField("atributoBloqueio");
    obj.edit30:setHeight(20);
    obj.edit30:setType("number");
    obj.edit30:setMin(0);
    obj.edit30:setWidth(20);
    obj.edit30:setName("edit30");
    obj.edit30:setTransparent(true);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setHorzTextAlign("center");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangleBloqueio);
    obj.label66:setAlign("client");
    obj.label66:setField("modBloqueio");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setVertTextAlign("center");
    obj.label66:setFontSize(30);
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setWidth(60);
    obj.label66:setHeight(20);
    obj.label66:setMargins({bottom=8});
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangleBloqueio);
    obj.label67:setText("Bloqueio");
    obj.label67:setVertTextAlign("trailing");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setAlign("bottom");
    obj.label67:setName("label67");

    obj.popupBloqueio = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupBloqueio:setParent(obj.atributosDestreza);
    obj.popupBloqueio:setName("popupBloqueio");
    obj.popupBloqueio:setWidth(126);
    obj.popupBloqueio:setHeight(150);
    obj.popupBloqueio:setBackOpacity(0);
    obj.popupBloqueio:setLeft(600);

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.popupBloqueio);
    obj.flowLayout6:setWidth(126);
    obj.flowLayout6:setHeight(150);
    obj.flowLayout6:setPadding({top=5,bottom=5,left=5,right=5});
    obj.flowLayout6:setMaxControlsPerLine(2);
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout6);
    obj.flowPart65:setHeight(20);
    obj.flowPart65:setWidth(58);
    obj.flowPart65:setName("flowPart65");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart65);
    obj.label68:setText("Destreza");
    obj.label68:setAlign("client");
    obj.label68:setHorzTextAlign("leading");
    obj.label68:setFontColor("white");
    obj.label68:setField("");
    obj.label68:setName("label68");

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout6);
    obj.flowPart66:setHeight(20);
    obj.flowPart66:setWidth(58);
    obj.flowPart66:setName("flowPart66");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart66);
    obj.label69:setText("");
    obj.label69:setAlign("client");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setFontColor("white");
    obj.label69:setField("destrezaBloqueio");
    obj.label69:setName("label69");

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout6);
    obj.flowPart67:setHeight(20);
    obj.flowPart67:setWidth(58);
    obj.flowPart67:setName("flowPart67");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart67);
    obj.label70:setText("Classe");
    obj.label70:setAlign("client");
    obj.label70:setHorzTextAlign("leading");
    obj.label70:setFontColor("white");
    obj.label70:setField("");
    obj.label70:setName("label70");

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout6);
    obj.flowPart68:setHeight(20);
    obj.flowPart68:setWidth(58);
    obj.flowPart68:setName("flowPart68");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart68);
    obj.edit31:setAlign("client");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setTransparent(true);
    obj.edit31:setFontColor("white");
    obj.edit31:setField("classeBloqueio");
    obj.edit31:setName("edit31");

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout6);
    obj.flowPart69:setHeight(20);
    obj.flowPart69:setWidth(58);
    obj.flowPart69:setName("flowPart69");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart69);
    obj.label71:setText("Base");
    obj.label71:setAlign("client");
    obj.label71:setHorzTextAlign("leading");
    obj.label71:setFontColor("#808000d9");
    obj.label71:setField("");
    obj.label71:setName("label71");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout6);
    obj.flowPart70:setHeight(20);
    obj.flowPart70:setWidth(58);
    obj.flowPart70:setName("flowPart70");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowPart70);
    obj.label72:setText("");
    obj.label72:setAlign("client");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setFontColor("#808000d9");
    obj.label72:setField("baseBloqueio");
    obj.label72:setName("label72");

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout6);
    obj.flowPart71:setHeight(20);
    obj.flowPart71:setWidth(58);
    obj.flowPart71:setName("flowPart71");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowPart71);
    obj.label73:setText("Arma");
    obj.label73:setAlign("client");
    obj.label73:setHorzTextAlign("leading");
    obj.label73:setFontColor("white");
    obj.label73:setField("");
    obj.label73:setName("label73");

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout6);
    obj.flowPart72:setHeight(20);
    obj.flowPart72:setWidth(58);
    obj.flowPart72:setName("flowPart72");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart72);
    obj.edit32:setAlign("client");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setTransparent(true);
    obj.edit32:setFontColor("white");
    obj.edit32:setField("armaBloqueio");
    obj.edit32:setName("edit32");

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout6);
    obj.flowPart73:setHeight(20);
    obj.flowPart73:setWidth(58);
    obj.flowPart73:setName("flowPart73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.flowPart73);
    obj.label74:setText("Armadura");
    obj.label74:setAlign("client");
    obj.label74:setHorzTextAlign("leading");
    obj.label74:setFontColor("white");
    obj.label74:setField("");
    obj.label74:setName("label74");

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout6);
    obj.flowPart74:setHeight(20);
    obj.flowPart74:setWidth(58);
    obj.flowPart74:setName("flowPart74");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart74);
    obj.edit33:setAlign("client");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setTransparent(true);
    obj.edit33:setFontColor("white");
    obj.edit33:setField("armaduraBloqueio");
    obj.edit33:setName("edit33");

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout6);
    obj.flowPart75:setHeight(20);
    obj.flowPart75:setWidth(58);
    obj.flowPart75:setName("flowPart75");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowPart75);
    obj.label75:setText("Extra");
    obj.label75:setAlign("client");
    obj.label75:setHorzTextAlign("leading");
    obj.label75:setFontColor("white");
    obj.label75:setField("");
    obj.label75:setName("label75");

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout6);
    obj.flowPart76:setHeight(20);
    obj.flowPart76:setWidth(58);
    obj.flowPart76:setName("flowPart76");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart76);
    obj.edit34:setAlign("client");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setTransparent(true);
    obj.edit34:setFontColor("white");
    obj.edit34:setField("extraBloqueio");
    obj.edit34:setName("edit34");

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout6);
    obj.flowPart77:setHeight(20);
    obj.flowPart77:setWidth(58);
    obj.flowPart77:setName("flowPart77");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowPart77);
    obj.label76:setText("Total");
    obj.label76:setAlign("client");
    obj.label76:setHorzTextAlign("leading");
    obj.label76:setFontColor("#808000d9");
    obj.label76:setField("");
    obj.label76:setName("label76");

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout6);
    obj.flowPart78:setHeight(20);
    obj.flowPart78:setWidth(58);
    obj.flowPart78:setName("flowPart78");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowPart78);
    obj.label77:setText("");
    obj.label77:setAlign("client");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setFontColor("#808000d9");
    obj.label77:setField("totalBloqueio");
    obj.label77:setName("label77");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.atributosDestreza);
    obj.dataLink5:setFields({'modBloqueio', 'atributoBloqueio', 'classe', 'destrezaDisponivel', 'dexBase', 'atributoAcerto', 'atributoMira',
                          'atributoEsquiva', 'atributoBloqueio', 'destrezaBloqueio', 'classeBloqueio', 'baseBloqueio', 'armaBloqueio', 'armaduraBloqueio',
                          'extraBloqueio', 'totalBloqueio'});
    obj.dataLink5:setName("dataLink5");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.dadosAdicionais);
    obj.label78:setWidth(300);
    obj.label78:setHeight(5);
    obj.label78:setFontSize(12);
    obj.label78:setText("Experiência de Classe:");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setVertTextAlign("leading");
    obj.label78:setMargins({top=5,bottom=5});
    obj.label78:setName("label78");

    obj.barraxpClasse = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.barraxpClasse:setParent(obj.dadosAdicionais);
    obj.barraxpClasse:setWidth(250);
    obj.barraxpClasse:setHeight(5);
    obj.barraxpClasse:setMargins({top=5,bottom=5});
    obj.barraxpClasse:setFieldMax("xpMaxClasse");
    obj.barraxpClasse:setField("xpAtualClasse");
    obj.barraxpClasse:setName("barraxpClasse");
    obj.barraxpClasse:setHitTest(true);
    obj.barraxpClasse:setMouseGlow(true);
    obj.barraxpClasse:setColorMode("hl");
    obj.barraxpClasse:setColor("green");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.dadosAdicionais);
    obj.label79:setWidth(250);
    obj.label79:setHeight(5);
    obj.label79:setFontSize(12);
    obj.label79:setHorzTextAlign("trailing");
    obj.label79:setVertTextAlign("trailing");
    obj.label79:setMargins({top=5,bottom=5});
    obj.label79:setField("xpTextoClasse");
    obj.label79:setName("label79");

    obj.popupxpClasse = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupxpClasse:setParent(obj.dadosAdicionais);
    obj.popupxpClasse:setName("popupxpClasse");
    obj.popupxpClasse:setWidth(300);
    obj.popupxpClasse:setHeight(30);
    obj.popupxpClasse:setBackOpacity(0.4);
    obj.popupxpClasse:setLeft(600);

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.popupxpClasse);
    obj.flowLayout7:setWidth(250);
    obj.flowLayout7:setHeight(30);
    obj.flowLayout7:setMaxControlsPerLine(3);
    obj.flowLayout7:setName("flowLayout7");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.flowLayout7);
    obj.label80:setText("Adicionar Experiência: ");
    obj.label80:setWidth(150);
    obj.label80:setHeight(30);
    obj.label80:setMargins({left=10});
    obj.label80:setHorzTextAlign("leading");
    obj.label80:setVertTextAlign("center");
    obj.label80:setAlign("left");
    obj.label80:setName("label80");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout7);
    obj.flowPart79:setHeight(30);
    obj.flowPart79:setWidth(50);
    obj.flowPart79:setName("flowPart79");

    obj.somaxpClasse = GUI.fromHandle(_obj_newObject("edit"));
    obj.somaxpClasse:setParent(obj.flowPart79);
    obj.somaxpClasse:setName("somaxpClasse");
    obj.somaxpClasse:setAlign("top");
    obj.somaxpClasse:setField("somaxpClasse");
    obj.somaxpClasse:setFontSize(15);
    obj.somaxpClasse:setType("number");
    obj.somaxpClasse:setTransparent(true);
    obj.somaxpClasse:setHorzTextAlign("center");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.flowPart79);
    obj.horzLine12:setAlign("bottom");
    obj.horzLine12:setStrokeColor("#FFFFFF50");
    obj.horzLine12:setStrokeSize(1);
    obj.horzLine12:setMargins({bottom=5});
    obj.horzLine12:setName("horzLine12");

    obj.okButtonClasse = GUI.fromHandle(_obj_newObject("button"));
    obj.okButtonClasse:setParent(obj.flowLayout7);
    obj.okButtonClasse:setText("ok");
    obj.okButtonClasse:setHeight(20);
    obj.okButtonClasse:setWidth(25);
    obj.okButtonClasse:setMargins({right=5, left=50});
    obj.okButtonClasse:setName("okButtonClasse");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.dadosAdicionais);
    obj.label81:setWidth(300);
    obj.label81:setHeight(5);
    obj.label81:setFontSize(12);
    obj.label81:setText("Experiência de Profissão:");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setVertTextAlign("leading");
    obj.label81:setMargins({top=5,bottom=5});
    obj.label81:setName("label81");

    obj.barraxpProfissao = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.barraxpProfissao:setParent(obj.dadosAdicionais);
    obj.barraxpProfissao:setWidth(250);
    obj.barraxpProfissao:setHeight(5);
    obj.barraxpProfissao:setMargins({top=5,bottom=5});
    obj.barraxpProfissao:setFieldMax("xpMaxProfissao");
    obj.barraxpProfissao:setField("xpAtualProfissao");
    obj.barraxpProfissao:setName("barraxpProfissao");
    obj.barraxpProfissao:setHitTest(true);
    obj.barraxpProfissao:setMouseGlow(true);
    obj.barraxpProfissao:setColorMode("hl");
    obj.barraxpProfissao:setColor("orange");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.dadosAdicionais);
    obj.label82:setWidth(250);
    obj.label82:setHeight(5);
    obj.label82:setFontSize(12);
    obj.label82:setHorzTextAlign("trailing");
    obj.label82:setVertTextAlign("trailing");
    obj.label82:setMargins({top=5,bottom=5});
    obj.label82:setField("xpTextoProfissao");
    obj.label82:setName("label82");

    obj.popupxpProfissao = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupxpProfissao:setParent(obj.dadosAdicionais);
    obj.popupxpProfissao:setName("popupxpProfissao");
    obj.popupxpProfissao:setWidth(300);
    obj.popupxpProfissao:setHeight(30);
    obj.popupxpProfissao:setBackOpacity(0.4);
    obj.popupxpProfissao:setLeft(600);

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.popupxpProfissao);
    obj.flowLayout8:setWidth(250);
    obj.flowLayout8:setHeight(30);
    obj.flowLayout8:setMaxControlsPerLine(3);
    obj.flowLayout8:setName("flowLayout8");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowLayout8);
    obj.label83:setText("Adicionar Experiência: ");
    obj.label83:setWidth(150);
    obj.label83:setHeight(30);
    obj.label83:setMargins({left=10});
    obj.label83:setHorzTextAlign("leading");
    obj.label83:setVertTextAlign("center");
    obj.label83:setAlign("left");
    obj.label83:setName("label83");

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout8);
    obj.flowPart80:setHeight(30);
    obj.flowPart80:setWidth(50);
    obj.flowPart80:setName("flowPart80");

    obj.somaxpProfissao = GUI.fromHandle(_obj_newObject("edit"));
    obj.somaxpProfissao:setParent(obj.flowPart80);
    obj.somaxpProfissao:setName("somaxpProfissao");
    obj.somaxpProfissao:setAlign("top");
    obj.somaxpProfissao:setField("somaxpProfissao");
    obj.somaxpProfissao:setFontSize(15);
    obj.somaxpProfissao:setType("number");
    obj.somaxpProfissao:setTransparent(true);
    obj.somaxpProfissao:setHorzTextAlign("center");

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.flowPart80);
    obj.horzLine13:setAlign("bottom");
    obj.horzLine13:setStrokeColor("#FFFFFF50");
    obj.horzLine13:setStrokeSize(1);
    obj.horzLine13:setMargins({bottom=5});
    obj.horzLine13:setName("horzLine13");

    obj.okButtonProfissao = GUI.fromHandle(_obj_newObject("button"));
    obj.okButtonProfissao:setParent(obj.flowLayout8);
    obj.okButtonProfissao:setText("ok");
    obj.okButtonProfissao:setHeight(20);
    obj.okButtonProfissao:setWidth(25);
    obj.okButtonProfissao:setMargins({right=5, left=50});
    obj.okButtonProfissao:setName("okButtonProfissao");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.perfilLayout);
    obj.flowLineBreak1:setLineSpacing(10);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.perfilLayout);
    obj.flowPart81:setHeight(2);
    obj.flowPart81:setMinScaledWidth(100);
    obj.flowPart81:setMaxScaledWidth(1600);
    obj.flowPart81:setName("flowPart81");

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.flowPart81);
    obj.horzLine14:setStrokeColor("#FFFFFF50");
    obj.horzLine14:setStrokeSize(0.6);
    obj.horzLine14:setStrokeCap("round");
    obj.horzLine14:setScaleY(0.1);
    obj.horzLine14:setTop(1);
    obj.horzLine14:setName("horzLine14");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.perfilLayout);
    obj.flowLineBreak2:setLineSpacing(10);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.perfilLayout);
    obj.flowPart82:setWidth(140);
    obj.flowPart82:setName("flowPart82");

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

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.topoAtributos);
    obj.flowPart83:setHeight(20);
    obj.flowPart83:setMinScaledWidth(60);
    obj.flowPart83:setMaxScaledWidth(85);
    obj.flowPart83:setName("flowPart83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowPart83);
    obj.label84:setText("Nível");
    obj.label84:setAlign("client");
    obj.label84:setFontSize(8);
    obj.label84:setVertTextAlign("center");
    obj.label84:setHorzTextAlign("leading");
    obj.label84:setName("label84");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.topoAtributos);
    obj.flowPart84:setHeight(20);
    obj.flowPart84:setMinScaledWidth(60);
    obj.flowPart84:setMaxScaledWidth(85);
    obj.flowPart84:setName("flowPart84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart84);
    obj.label85:setText("Classe");
    obj.label85:setAlign("client");
    obj.label85:setFontSize(8);
    obj.label85:setVertTextAlign("center");
    obj.label85:setHorzTextAlign("leading");
    obj.label85:setName("label85");

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.topoAtributos);
    obj.flowPart85:setHeight(20);
    obj.flowPart85:setMinScaledWidth(60);
    obj.flowPart85:setMaxScaledWidth(85);
    obj.flowPart85:setName("flowPart85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowPart85);
    obj.label86:setText("Raça");
    obj.label86:setAlign("client");
    obj.label86:setFontSize(8);
    obj.label86:setVertTextAlign("center");
    obj.label86:setHorzTextAlign("leading");
    obj.label86:setName("label86");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.topoAtributos);
    obj.flowPart86:setHeight(20);
    obj.flowPart86:setMinScaledWidth(60);
    obj.flowPart86:setMaxScaledWidth(85);
    obj.flowPart86:setName("flowPart86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowPart86);
    obj.label87:setText("Treino");
    obj.label87:setAlign("client");
    obj.label87:setFontSize(8);
    obj.label87:setVertTextAlign("center");
    obj.label87:setHorzTextAlign("leading");
    obj.label87:setName("label87");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.topoAtributos);
    obj.flowPart87:setHeight(20);
    obj.flowPart87:setMinScaledWidth(60);
    obj.flowPart87:setMaxScaledWidth(85);
    obj.flowPart87:setName("flowPart87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.flowPart87);
    obj.label88:setText("Outros");
    obj.label88:setAlign("client");
    obj.label88:setFontSize(8);
    obj.label88:setVertTextAlign("center");
    obj.label88:setHorzTextAlign("leading");
    obj.label88:setName("label88");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.topoAtributos);
    obj.flowPart88:setHeight(20);
    obj.flowPart88:setMinScaledWidth(60);
    obj.flowPart88:setMaxScaledWidth(85);
    obj.flowPart88:setName("flowPart88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.flowPart88);
    obj.label89:setText("Base");
    obj.label89:setAlign("client");
    obj.label89:setFontSize(8);
    obj.label89:setVertTextAlign("center");
    obj.label89:setHorzTextAlign("leading");
    obj.label89:setName("label89");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.topoAtributos);
    obj.flowPart89:setHeight(20);
    obj.flowPart89:setMinScaledWidth(60);
    obj.flowPart89:setMaxScaledWidth(85);
    obj.flowPart89:setName("flowPart89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.flowPart89);
    obj.label90:setText("Equip.");
    obj.label90:setAlign("client");
    obj.label90:setFontSize(8);
    obj.label90:setVertTextAlign("center");
    obj.label90:setHorzTextAlign("leading");
    obj.label90:setName("label90");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.topoAtributos);
    obj.flowPart90:setHeight(20);
    obj.flowPart90:setMinScaledWidth(60);
    obj.flowPart90:setMaxScaledWidth(85);
    obj.flowPart90:setName("flowPart90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.flowPart90);
    obj.label91:setText("Total");
    obj.label91:setAlign("client");
    obj.label91:setFontSize(8);
    obj.label91:setVertTextAlign("center");
    obj.label91:setHorzTextAlign("leading");
    obj.label91:setName("label91");

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

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.tabelaDeAtributos);
    obj.flowPart91:setHeight(20);
    obj.flowPart91:setMinScaledWidth(60);
    obj.flowPart91:setMaxScaledWidth(85);
    obj.flowPart91:setName("flowPart91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.flowPart91);
    obj.label92:setText("Constituição");
    obj.label92:setAlign("client");
    obj.label92:setFontSize(8);
    obj.label92:setVertTextAlign("center");
    obj.label92:setHorzTextAlign("leading");
    obj.label92:setName("label92");

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.tabelaDeAtributos);
    obj.flowPart92:setHeight(50);
    obj.flowPart92:setMinScaledWidth(30);
    obj.flowPart92:setMinWidth(30);
    obj.flowPart92:setMaxWidth(35);
    obj.flowPart92:setMaxScaledWidth(35);
    obj.flowPart92:setAvoidScale(true);
    obj.flowPart92:setName("flowPart92");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart92);
    obj.edit35:setAlign("top");
    obj.edit35:setField("conNivel");
    obj.edit35:setFontSize(15);
    obj.edit35:setTransparent(true);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setType("number");
    obj.edit35:setReadOnly(false);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");
    obj.edit35:setHeight(30);
    obj.edit35:setWidth(195);

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.flowPart92);
    obj.horzLine15:setAlign("top");
    obj.horzLine15:setStrokeColor("#FFFFFF50");
    obj.horzLine15:setStrokeSize(1);
    obj.horzLine15:setName("horzLine15");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.tabelaDeAtributos);
    obj.flowPart93:setName("flowPart93");
    obj.flowPart93:setHeight(50);
    obj.flowPart93:setMinScaledWidth(30);
    obj.flowPart93:setMaxScaledWidth(50);

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flowPart93);
    obj.image2:setSRC("/imagens/plus.png");
    obj.image2:setHeight(15);
    obj.image2:setWidth(15);
    obj.image2:setLeft(15);
    obj.image2:setTop(5);
    obj.image2:setName("image2");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.tabelaDeAtributos);
    obj.flowPart94:setHeight(50);
    obj.flowPart94:setMinScaledWidth(30);
    obj.flowPart94:setMinWidth(30);
    obj.flowPart94:setMaxWidth(35);
    obj.flowPart94:setMaxScaledWidth(35);
    obj.flowPart94:setAvoidScale(true);
    obj.flowPart94:setName("flowPart94");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart94);
    obj.edit36:setAlign("top");
    obj.edit36:setField("conClasse");
    obj.edit36:setFontSize(15);
    obj.edit36:setTransparent(true);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setReadOnly(false);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");
    obj.edit36:setHeight(30);
    obj.edit36:setWidth(195);

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.flowPart94);
    obj.horzLine16:setAlign("top");
    obj.horzLine16:setStrokeColor("#FFFFFF50");
    obj.horzLine16:setStrokeSize(1);
    obj.horzLine16:setName("horzLine16");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.tabelaDeAtributos);
    obj.flowPart95:setName("flowPart95");
    obj.flowPart95:setHeight(50);
    obj.flowPart95:setMinScaledWidth(30);
    obj.flowPart95:setMaxScaledWidth(50);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.flowPart95);
    obj.image3:setSRC("/imagens/plus.png");
    obj.image3:setHeight(15);
    obj.image3:setWidth(15);
    obj.image3:setLeft(15);
    obj.image3:setTop(5);
    obj.image3:setName("image3");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.tabelaDeAtributos);
    obj.flowPart96:setHeight(50);
    obj.flowPart96:setMinScaledWidth(30);
    obj.flowPart96:setMinWidth(30);
    obj.flowPart96:setMaxWidth(35);
    obj.flowPart96:setMaxScaledWidth(35);
    obj.flowPart96:setAvoidScale(true);
    obj.flowPart96:setName("flowPart96");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart96);
    obj.edit37:setAlign("top");
    obj.edit37:setField("conRaca");
    obj.edit37:setFontSize(15);
    obj.edit37:setTransparent(true);
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setType("number");
    obj.edit37:setReadOnly(false);
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");
    obj.edit37:setHeight(30);
    obj.edit37:setWidth(195);

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.flowPart96);
    obj.horzLine17:setAlign("top");
    obj.horzLine17:setStrokeColor("#FFFFFF50");
    obj.horzLine17:setStrokeSize(1);
    obj.horzLine17:setName("horzLine17");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.tabelaDeAtributos);
    obj.flowPart97:setName("flowPart97");
    obj.flowPart97:setHeight(50);
    obj.flowPart97:setMinScaledWidth(30);
    obj.flowPart97:setMaxScaledWidth(50);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.flowPart97);
    obj.image4:setSRC("/imagens/plus.png");
    obj.image4:setHeight(15);
    obj.image4:setWidth(15);
    obj.image4:setLeft(15);
    obj.image4:setTop(5);
    obj.image4:setName("image4");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.tabelaDeAtributos);
    obj.flowPart98:setHeight(50);
    obj.flowPart98:setMinScaledWidth(30);
    obj.flowPart98:setMinWidth(30);
    obj.flowPart98:setMaxWidth(35);
    obj.flowPart98:setMaxScaledWidth(35);
    obj.flowPart98:setAvoidScale(true);
    obj.flowPart98:setName("flowPart98");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart98);
    obj.edit38:setAlign("top");
    obj.edit38:setField("conTreino");
    obj.edit38:setFontSize(15);
    obj.edit38:setTransparent(true);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setType("number");
    obj.edit38:setReadOnly(false);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");
    obj.edit38:setHeight(30);
    obj.edit38:setWidth(195);

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.flowPart98);
    obj.horzLine18:setAlign("top");
    obj.horzLine18:setStrokeColor("#FFFFFF50");
    obj.horzLine18:setStrokeSize(1);
    obj.horzLine18:setName("horzLine18");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.tabelaDeAtributos);
    obj.flowPart99:setName("flowPart99");
    obj.flowPart99:setHeight(50);
    obj.flowPart99:setMinScaledWidth(30);
    obj.flowPart99:setMaxScaledWidth(50);

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.flowPart99);
    obj.image5:setSRC("/imagens/plus.png");
    obj.image5:setHeight(15);
    obj.image5:setWidth(15);
    obj.image5:setLeft(15);
    obj.image5:setTop(5);
    obj.image5:setName("image5");

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.tabelaDeAtributos);
    obj.flowPart100:setHeight(50);
    obj.flowPart100:setMinScaledWidth(30);
    obj.flowPart100:setMinWidth(30);
    obj.flowPart100:setMaxWidth(35);
    obj.flowPart100:setMaxScaledWidth(35);
    obj.flowPart100:setAvoidScale(true);
    obj.flowPart100:setName("flowPart100");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart100);
    obj.edit39:setAlign("top");
    obj.edit39:setField("conOutros");
    obj.edit39:setFontSize(15);
    obj.edit39:setTransparent(true);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setType("number");
    obj.edit39:setReadOnly(false);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");
    obj.edit39:setHeight(30);
    obj.edit39:setWidth(195);

    obj.horzLine19 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine19:setParent(obj.flowPart100);
    obj.horzLine19:setAlign("top");
    obj.horzLine19:setStrokeColor("#FFFFFF50");
    obj.horzLine19:setStrokeSize(1);
    obj.horzLine19:setName("horzLine19");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.tabelaDeAtributos);
    obj.flowPart101:setName("flowPart101");
    obj.flowPart101:setHeight(50);
    obj.flowPart101:setMinScaledWidth(30);
    obj.flowPart101:setMaxScaledWidth(50);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.flowPart101);
    obj.image6:setSRC("/imagens/equals.png");
    obj.image6:setHeight(15);
    obj.image6:setWidth(15);
    obj.image6:setLeft(15);
    obj.image6:setTop(5);
    obj.image6:setName("image6");

    obj.flowPart102 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.tabelaDeAtributos);
    obj.flowPart102:setHeight(50);
    obj.flowPart102:setMinScaledWidth(30);
    obj.flowPart102:setMinWidth(30);
    obj.flowPart102:setMaxWidth(35);
    obj.flowPart102:setMaxScaledWidth(35);
    obj.flowPart102:setAvoidScale(true);
    obj.flowPart102:setName("flowPart102");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart102);
    obj.edit40:setAlign("top");
    obj.edit40:setField("conBase");
    obj.edit40:setFontSize(15);
    obj.edit40:setTransparent(true);
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setReadOnly(false);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");
    obj.edit40:setHeight(30);
    obj.edit40:setWidth(195);

    obj.horzLine20 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine20:setParent(obj.flowPart102);
    obj.horzLine20:setAlign("top");
    obj.horzLine20:setStrokeColor("#FFFFFF50");
    obj.horzLine20:setStrokeSize(1);
    obj.horzLine20:setName("horzLine20");

    obj.flowPart103 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.tabelaDeAtributos);
    obj.flowPart103:setName("flowPart103");
    obj.flowPart103:setHeight(50);
    obj.flowPart103:setMinScaledWidth(30);
    obj.flowPart103:setMaxScaledWidth(50);

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.flowPart103);
    obj.image7:setSRC("/imagens/plus.png");
    obj.image7:setHeight(15);
    obj.image7:setWidth(15);
    obj.image7:setLeft(15);
    obj.image7:setTop(5);
    obj.image7:setName("image7");

    obj.flowPart104 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.tabelaDeAtributos);
    obj.flowPart104:setHeight(50);
    obj.flowPart104:setMinScaledWidth(30);
    obj.flowPart104:setMinWidth(30);
    obj.flowPart104:setMaxWidth(35);
    obj.flowPart104:setMaxScaledWidth(35);
    obj.flowPart104:setAvoidScale(true);
    obj.flowPart104:setName("flowPart104");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart104);
    obj.edit41:setAlign("top");
    obj.edit41:setField("conEquip");
    obj.edit41:setFontSize(15);
    obj.edit41:setTransparent(true);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setReadOnly(false);
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");
    obj.edit41:setHeight(30);
    obj.edit41:setWidth(195);

    obj.horzLine21 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine21:setParent(obj.flowPart104);
    obj.horzLine21:setAlign("top");
    obj.horzLine21:setStrokeColor("#FFFFFF50");
    obj.horzLine21:setStrokeSize(1);
    obj.horzLine21:setName("horzLine21");

    obj.flowPart105 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.tabelaDeAtributos);
    obj.flowPart105:setName("flowPart105");
    obj.flowPart105:setHeight(50);
    obj.flowPart105:setMinScaledWidth(30);
    obj.flowPart105:setMaxScaledWidth(50);

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.flowPart105);
    obj.image8:setSRC("/imagens/equals.png");
    obj.image8:setHeight(15);
    obj.image8:setWidth(15);
    obj.image8:setLeft(15);
    obj.image8:setTop(5);
    obj.image8:setName("image8");

    obj.flowPart106 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.tabelaDeAtributos);
    obj.flowPart106:setHeight(50);
    obj.flowPart106:setMinScaledWidth(30);
    obj.flowPart106:setMinWidth(30);
    obj.flowPart106:setMaxWidth(35);
    obj.flowPart106:setMaxScaledWidth(35);
    obj.flowPart106:setAvoidScale(true);
    obj.flowPart106:setName("flowPart106");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart106);
    obj.edit42:setAlign("top");
    obj.edit42:setField("conTotal");
    obj.edit42:setFontSize(15);
    obj.edit42:setTransparent(true);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setType("number");
    obj.edit42:setReadOnly(false);
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");
    obj.edit42:setHeight(30);
    obj.edit42:setWidth(195);

    obj.horzLine22 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine22:setParent(obj.flowPart106);
    obj.horzLine22:setAlign("top");
    obj.horzLine22:setStrokeColor("#FFFFFF50");
    obj.horzLine22:setStrokeSize(1);
    obj.horzLine22:setName("horzLine22");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.tabelaDeAtributos);
    obj.dataLink6:setFields({'conNivel', 'conClasse', 'conRaca', 'conTreino',
                           'conOutros', 'conBase', 'conEquip', 'conTotal'});
    obj.dataLink6:setName("dataLink6");

    obj.flowPart107 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.tabelaDeAtributos);
    obj.flowPart107:setHeight(20);
    obj.flowPart107:setMinScaledWidth(60);
    obj.flowPart107:setMaxScaledWidth(85);
    obj.flowPart107:setName("flowPart107");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.flowPart107);
    obj.label93:setText("Força");
    obj.label93:setAlign("client");
    obj.label93:setFontSize(8);
    obj.label93:setVertTextAlign("center");
    obj.label93:setHorzTextAlign("leading");
    obj.label93:setName("label93");

    obj.flowPart108 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.tabelaDeAtributos);
    obj.flowPart108:setHeight(50);
    obj.flowPart108:setMinScaledWidth(30);
    obj.flowPart108:setMinWidth(30);
    obj.flowPart108:setMaxWidth(35);
    obj.flowPart108:setMaxScaledWidth(35);
    obj.flowPart108:setAvoidScale(true);
    obj.flowPart108:setName("flowPart108");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart108);
    obj.edit43:setAlign("top");
    obj.edit43:setField("forNivel");
    obj.edit43:setFontSize(15);
    obj.edit43:setTransparent(true);
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setType("number");
    obj.edit43:setReadOnly(false);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");
    obj.edit43:setHeight(30);
    obj.edit43:setWidth(195);

    obj.horzLine23 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine23:setParent(obj.flowPart108);
    obj.horzLine23:setAlign("top");
    obj.horzLine23:setStrokeColor("#FFFFFF50");
    obj.horzLine23:setStrokeSize(1);
    obj.horzLine23:setName("horzLine23");

    obj.flowPart109 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.tabelaDeAtributos);
    obj.flowPart109:setName("flowPart109");
    obj.flowPart109:setHeight(50);
    obj.flowPart109:setMinScaledWidth(30);
    obj.flowPart109:setMaxScaledWidth(50);

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.flowPart109);
    obj.image9:setSRC("/imagens/plus.png");
    obj.image9:setHeight(15);
    obj.image9:setWidth(15);
    obj.image9:setLeft(15);
    obj.image9:setTop(5);
    obj.image9:setName("image9");

    obj.flowPart110 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.tabelaDeAtributos);
    obj.flowPart110:setHeight(50);
    obj.flowPart110:setMinScaledWidth(30);
    obj.flowPart110:setMinWidth(30);
    obj.flowPart110:setMaxWidth(35);
    obj.flowPart110:setMaxScaledWidth(35);
    obj.flowPart110:setAvoidScale(true);
    obj.flowPart110:setName("flowPart110");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart110);
    obj.edit44:setAlign("top");
    obj.edit44:setField("forClasse");
    obj.edit44:setFontSize(15);
    obj.edit44:setTransparent(true);
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setType("number");
    obj.edit44:setReadOnly(false);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");
    obj.edit44:setHeight(30);
    obj.edit44:setWidth(195);

    obj.horzLine24 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine24:setParent(obj.flowPart110);
    obj.horzLine24:setAlign("top");
    obj.horzLine24:setStrokeColor("#FFFFFF50");
    obj.horzLine24:setStrokeSize(1);
    obj.horzLine24:setName("horzLine24");

    obj.flowPart111 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.tabelaDeAtributos);
    obj.flowPart111:setName("flowPart111");
    obj.flowPart111:setHeight(50);
    obj.flowPart111:setMinScaledWidth(30);
    obj.flowPart111:setMaxScaledWidth(50);

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.flowPart111);
    obj.image10:setSRC("/imagens/plus.png");
    obj.image10:setHeight(15);
    obj.image10:setWidth(15);
    obj.image10:setLeft(15);
    obj.image10:setTop(5);
    obj.image10:setName("image10");

    obj.flowPart112 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.tabelaDeAtributos);
    obj.flowPart112:setHeight(50);
    obj.flowPart112:setMinScaledWidth(30);
    obj.flowPart112:setMinWidth(30);
    obj.flowPart112:setMaxWidth(35);
    obj.flowPart112:setMaxScaledWidth(35);
    obj.flowPart112:setAvoidScale(true);
    obj.flowPart112:setName("flowPart112");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart112);
    obj.edit45:setAlign("top");
    obj.edit45:setField("forRaca");
    obj.edit45:setFontSize(15);
    obj.edit45:setTransparent(true);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setType("number");
    obj.edit45:setReadOnly(false);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");
    obj.edit45:setHeight(30);
    obj.edit45:setWidth(195);

    obj.horzLine25 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine25:setParent(obj.flowPart112);
    obj.horzLine25:setAlign("top");
    obj.horzLine25:setStrokeColor("#FFFFFF50");
    obj.horzLine25:setStrokeSize(1);
    obj.horzLine25:setName("horzLine25");

    obj.flowPart113 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.tabelaDeAtributos);
    obj.flowPart113:setName("flowPart113");
    obj.flowPart113:setHeight(50);
    obj.flowPart113:setMinScaledWidth(30);
    obj.flowPart113:setMaxScaledWidth(50);

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.flowPart113);
    obj.image11:setSRC("/imagens/plus.png");
    obj.image11:setHeight(15);
    obj.image11:setWidth(15);
    obj.image11:setLeft(15);
    obj.image11:setTop(5);
    obj.image11:setName("image11");

    obj.flowPart114 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.tabelaDeAtributos);
    obj.flowPart114:setHeight(50);
    obj.flowPart114:setMinScaledWidth(30);
    obj.flowPart114:setMinWidth(30);
    obj.flowPart114:setMaxWidth(35);
    obj.flowPart114:setMaxScaledWidth(35);
    obj.flowPart114:setAvoidScale(true);
    obj.flowPart114:setName("flowPart114");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart114);
    obj.edit46:setAlign("top");
    obj.edit46:setField("forTreino");
    obj.edit46:setFontSize(15);
    obj.edit46:setTransparent(true);
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setType("number");
    obj.edit46:setReadOnly(false);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setName("edit46");
    obj.edit46:setHeight(30);
    obj.edit46:setWidth(195);

    obj.horzLine26 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine26:setParent(obj.flowPart114);
    obj.horzLine26:setAlign("top");
    obj.horzLine26:setStrokeColor("#FFFFFF50");
    obj.horzLine26:setStrokeSize(1);
    obj.horzLine26:setName("horzLine26");

    obj.flowPart115 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.tabelaDeAtributos);
    obj.flowPart115:setName("flowPart115");
    obj.flowPart115:setHeight(50);
    obj.flowPart115:setMinScaledWidth(30);
    obj.flowPart115:setMaxScaledWidth(50);

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.flowPart115);
    obj.image12:setSRC("/imagens/plus.png");
    obj.image12:setHeight(15);
    obj.image12:setWidth(15);
    obj.image12:setLeft(15);
    obj.image12:setTop(5);
    obj.image12:setName("image12");

    obj.flowPart116 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.tabelaDeAtributos);
    obj.flowPart116:setHeight(50);
    obj.flowPart116:setMinScaledWidth(30);
    obj.flowPart116:setMinWidth(30);
    obj.flowPart116:setMaxWidth(35);
    obj.flowPart116:setMaxScaledWidth(35);
    obj.flowPart116:setAvoidScale(true);
    obj.flowPart116:setName("flowPart116");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart116);
    obj.edit47:setAlign("top");
    obj.edit47:setField("forOutros");
    obj.edit47:setFontSize(15);
    obj.edit47:setTransparent(true);
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setType("number");
    obj.edit47:setReadOnly(false);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");
    obj.edit47:setHeight(30);
    obj.edit47:setWidth(195);

    obj.horzLine27 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine27:setParent(obj.flowPart116);
    obj.horzLine27:setAlign("top");
    obj.horzLine27:setStrokeColor("#FFFFFF50");
    obj.horzLine27:setStrokeSize(1);
    obj.horzLine27:setName("horzLine27");

    obj.flowPart117 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.tabelaDeAtributos);
    obj.flowPart117:setName("flowPart117");
    obj.flowPart117:setHeight(50);
    obj.flowPart117:setMinScaledWidth(30);
    obj.flowPart117:setMaxScaledWidth(50);

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.flowPart117);
    obj.image13:setSRC("/imagens/equals.png");
    obj.image13:setHeight(15);
    obj.image13:setWidth(15);
    obj.image13:setLeft(15);
    obj.image13:setTop(5);
    obj.image13:setName("image13");

    obj.flowPart118 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.tabelaDeAtributos);
    obj.flowPart118:setHeight(50);
    obj.flowPart118:setMinScaledWidth(30);
    obj.flowPart118:setMinWidth(30);
    obj.flowPart118:setMaxWidth(35);
    obj.flowPart118:setMaxScaledWidth(35);
    obj.flowPart118:setAvoidScale(true);
    obj.flowPart118:setName("flowPart118");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart118);
    obj.edit48:setAlign("top");
    obj.edit48:setField("forBase");
    obj.edit48:setFontSize(15);
    obj.edit48:setTransparent(true);
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setType("number");
    obj.edit48:setReadOnly(false);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");
    obj.edit48:setHeight(30);
    obj.edit48:setWidth(195);

    obj.horzLine28 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine28:setParent(obj.flowPart118);
    obj.horzLine28:setAlign("top");
    obj.horzLine28:setStrokeColor("#FFFFFF50");
    obj.horzLine28:setStrokeSize(1);
    obj.horzLine28:setName("horzLine28");

    obj.flowPart119 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.tabelaDeAtributos);
    obj.flowPart119:setName("flowPart119");
    obj.flowPart119:setHeight(50);
    obj.flowPart119:setMinScaledWidth(30);
    obj.flowPart119:setMaxScaledWidth(50);

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.flowPart119);
    obj.image14:setSRC("/imagens/plus.png");
    obj.image14:setHeight(15);
    obj.image14:setWidth(15);
    obj.image14:setLeft(15);
    obj.image14:setTop(5);
    obj.image14:setName("image14");

    obj.flowPart120 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.tabelaDeAtributos);
    obj.flowPart120:setHeight(50);
    obj.flowPart120:setMinScaledWidth(30);
    obj.flowPart120:setMinWidth(30);
    obj.flowPart120:setMaxWidth(35);
    obj.flowPart120:setMaxScaledWidth(35);
    obj.flowPart120:setAvoidScale(true);
    obj.flowPart120:setName("flowPart120");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart120);
    obj.edit49:setAlign("top");
    obj.edit49:setField("forEquip");
    obj.edit49:setFontSize(15);
    obj.edit49:setTransparent(true);
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setType("number");
    obj.edit49:setReadOnly(false);
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");
    obj.edit49:setHeight(30);
    obj.edit49:setWidth(195);

    obj.horzLine29 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine29:setParent(obj.flowPart120);
    obj.horzLine29:setAlign("top");
    obj.horzLine29:setStrokeColor("#FFFFFF50");
    obj.horzLine29:setStrokeSize(1);
    obj.horzLine29:setName("horzLine29");

    obj.flowPart121 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.tabelaDeAtributos);
    obj.flowPart121:setName("flowPart121");
    obj.flowPart121:setHeight(50);
    obj.flowPart121:setMinScaledWidth(30);
    obj.flowPart121:setMaxScaledWidth(50);

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.flowPart121);
    obj.image15:setSRC("/imagens/equals.png");
    obj.image15:setHeight(15);
    obj.image15:setWidth(15);
    obj.image15:setLeft(15);
    obj.image15:setTop(5);
    obj.image15:setName("image15");

    obj.flowPart122 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.tabelaDeAtributos);
    obj.flowPart122:setHeight(50);
    obj.flowPart122:setMinScaledWidth(30);
    obj.flowPart122:setMinWidth(30);
    obj.flowPart122:setMaxWidth(35);
    obj.flowPart122:setMaxScaledWidth(35);
    obj.flowPart122:setAvoidScale(true);
    obj.flowPart122:setName("flowPart122");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart122);
    obj.edit50:setAlign("top");
    obj.edit50:setField("forTotal");
    obj.edit50:setFontSize(15);
    obj.edit50:setTransparent(true);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setType("number");
    obj.edit50:setReadOnly(false);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");
    obj.edit50:setHeight(30);
    obj.edit50:setWidth(195);

    obj.horzLine30 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine30:setParent(obj.flowPart122);
    obj.horzLine30:setAlign("top");
    obj.horzLine30:setStrokeColor("#FFFFFF50");
    obj.horzLine30:setStrokeSize(1);
    obj.horzLine30:setName("horzLine30");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.tabelaDeAtributos);
    obj.dataLink7:setFields({'forNivel', 'forClasse', 'forRaca', 'forTreino',
                           'forOutros', 'forBase', 'forEquip', 'forTotal'});
    obj.dataLink7:setName("dataLink7");

    obj.flowPart123 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart123:setParent(obj.tabelaDeAtributos);
    obj.flowPart123:setHeight(20);
    obj.flowPart123:setMinScaledWidth(60);
    obj.flowPart123:setMaxScaledWidth(85);
    obj.flowPart123:setName("flowPart123");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.flowPart123);
    obj.label94:setText("Destreza");
    obj.label94:setAlign("client");
    obj.label94:setFontSize(8);
    obj.label94:setVertTextAlign("center");
    obj.label94:setHorzTextAlign("leading");
    obj.label94:setName("label94");

    obj.flowPart124 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart124:setParent(obj.tabelaDeAtributos);
    obj.flowPart124:setHeight(50);
    obj.flowPart124:setMinScaledWidth(30);
    obj.flowPart124:setMinWidth(30);
    obj.flowPart124:setMaxWidth(35);
    obj.flowPart124:setMaxScaledWidth(35);
    obj.flowPart124:setAvoidScale(true);
    obj.flowPart124:setName("flowPart124");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart124);
    obj.edit51:setAlign("top");
    obj.edit51:setField("dexNivel");
    obj.edit51:setFontSize(15);
    obj.edit51:setTransparent(true);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setType("number");
    obj.edit51:setReadOnly(false);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setName("edit51");
    obj.edit51:setHeight(30);
    obj.edit51:setWidth(195);

    obj.horzLine31 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine31:setParent(obj.flowPart124);
    obj.horzLine31:setAlign("top");
    obj.horzLine31:setStrokeColor("#FFFFFF50");
    obj.horzLine31:setStrokeSize(1);
    obj.horzLine31:setName("horzLine31");

    obj.flowPart125 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart125:setParent(obj.tabelaDeAtributos);
    obj.flowPart125:setName("flowPart125");
    obj.flowPart125:setHeight(50);
    obj.flowPart125:setMinScaledWidth(30);
    obj.flowPart125:setMaxScaledWidth(50);

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.flowPart125);
    obj.image16:setSRC("/imagens/plus.png");
    obj.image16:setHeight(15);
    obj.image16:setWidth(15);
    obj.image16:setLeft(15);
    obj.image16:setTop(5);
    obj.image16:setName("image16");

    obj.flowPart126 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart126:setParent(obj.tabelaDeAtributos);
    obj.flowPart126:setHeight(50);
    obj.flowPart126:setMinScaledWidth(30);
    obj.flowPart126:setMinWidth(30);
    obj.flowPart126:setMaxWidth(35);
    obj.flowPart126:setMaxScaledWidth(35);
    obj.flowPart126:setAvoidScale(true);
    obj.flowPart126:setName("flowPart126");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart126);
    obj.edit52:setAlign("top");
    obj.edit52:setField("dexClasse");
    obj.edit52:setFontSize(15);
    obj.edit52:setTransparent(true);
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setType("number");
    obj.edit52:setReadOnly(false);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");
    obj.edit52:setHeight(30);
    obj.edit52:setWidth(195);

    obj.horzLine32 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine32:setParent(obj.flowPart126);
    obj.horzLine32:setAlign("top");
    obj.horzLine32:setStrokeColor("#FFFFFF50");
    obj.horzLine32:setStrokeSize(1);
    obj.horzLine32:setName("horzLine32");

    obj.flowPart127 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart127:setParent(obj.tabelaDeAtributos);
    obj.flowPart127:setName("flowPart127");
    obj.flowPart127:setHeight(50);
    obj.flowPart127:setMinScaledWidth(30);
    obj.flowPart127:setMaxScaledWidth(50);

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.flowPart127);
    obj.image17:setSRC("/imagens/plus.png");
    obj.image17:setHeight(15);
    obj.image17:setWidth(15);
    obj.image17:setLeft(15);
    obj.image17:setTop(5);
    obj.image17:setName("image17");

    obj.flowPart128 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart128:setParent(obj.tabelaDeAtributos);
    obj.flowPart128:setHeight(50);
    obj.flowPart128:setMinScaledWidth(30);
    obj.flowPart128:setMinWidth(30);
    obj.flowPart128:setMaxWidth(35);
    obj.flowPart128:setMaxScaledWidth(35);
    obj.flowPart128:setAvoidScale(true);
    obj.flowPart128:setName("flowPart128");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart128);
    obj.edit53:setAlign("top");
    obj.edit53:setField("dexRaca");
    obj.edit53:setFontSize(15);
    obj.edit53:setTransparent(true);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setType("number");
    obj.edit53:setReadOnly(false);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");
    obj.edit53:setHeight(30);
    obj.edit53:setWidth(195);

    obj.horzLine33 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine33:setParent(obj.flowPart128);
    obj.horzLine33:setAlign("top");
    obj.horzLine33:setStrokeColor("#FFFFFF50");
    obj.horzLine33:setStrokeSize(1);
    obj.horzLine33:setName("horzLine33");

    obj.flowPart129 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart129:setParent(obj.tabelaDeAtributos);
    obj.flowPart129:setName("flowPart129");
    obj.flowPart129:setHeight(50);
    obj.flowPart129:setMinScaledWidth(30);
    obj.flowPart129:setMaxScaledWidth(50);

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.flowPart129);
    obj.image18:setSRC("/imagens/plus.png");
    obj.image18:setHeight(15);
    obj.image18:setWidth(15);
    obj.image18:setLeft(15);
    obj.image18:setTop(5);
    obj.image18:setName("image18");

    obj.flowPart130 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart130:setParent(obj.tabelaDeAtributos);
    obj.flowPart130:setHeight(50);
    obj.flowPart130:setMinScaledWidth(30);
    obj.flowPart130:setMinWidth(30);
    obj.flowPart130:setMaxWidth(35);
    obj.flowPart130:setMaxScaledWidth(35);
    obj.flowPart130:setAvoidScale(true);
    obj.flowPart130:setName("flowPart130");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart130);
    obj.edit54:setAlign("top");
    obj.edit54:setField("dexTreino");
    obj.edit54:setFontSize(15);
    obj.edit54:setTransparent(true);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setType("number");
    obj.edit54:setReadOnly(false);
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");
    obj.edit54:setHeight(30);
    obj.edit54:setWidth(195);

    obj.horzLine34 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine34:setParent(obj.flowPart130);
    obj.horzLine34:setAlign("top");
    obj.horzLine34:setStrokeColor("#FFFFFF50");
    obj.horzLine34:setStrokeSize(1);
    obj.horzLine34:setName("horzLine34");

    obj.flowPart131 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart131:setParent(obj.tabelaDeAtributos);
    obj.flowPart131:setName("flowPart131");
    obj.flowPart131:setHeight(50);
    obj.flowPart131:setMinScaledWidth(30);
    obj.flowPart131:setMaxScaledWidth(50);

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.flowPart131);
    obj.image19:setSRC("/imagens/plus.png");
    obj.image19:setHeight(15);
    obj.image19:setWidth(15);
    obj.image19:setLeft(15);
    obj.image19:setTop(5);
    obj.image19:setName("image19");

    obj.flowPart132 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart132:setParent(obj.tabelaDeAtributos);
    obj.flowPart132:setHeight(50);
    obj.flowPart132:setMinScaledWidth(30);
    obj.flowPart132:setMinWidth(30);
    obj.flowPart132:setMaxWidth(35);
    obj.flowPart132:setMaxScaledWidth(35);
    obj.flowPart132:setAvoidScale(true);
    obj.flowPart132:setName("flowPart132");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart132);
    obj.edit55:setAlign("top");
    obj.edit55:setField("dexOutros");
    obj.edit55:setFontSize(15);
    obj.edit55:setTransparent(true);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setType("number");
    obj.edit55:setReadOnly(false);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");
    obj.edit55:setHeight(30);
    obj.edit55:setWidth(195);

    obj.horzLine35 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine35:setParent(obj.flowPart132);
    obj.horzLine35:setAlign("top");
    obj.horzLine35:setStrokeColor("#FFFFFF50");
    obj.horzLine35:setStrokeSize(1);
    obj.horzLine35:setName("horzLine35");

    obj.flowPart133 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart133:setParent(obj.tabelaDeAtributos);
    obj.flowPart133:setName("flowPart133");
    obj.flowPart133:setHeight(50);
    obj.flowPart133:setMinScaledWidth(30);
    obj.flowPart133:setMaxScaledWidth(50);

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.flowPart133);
    obj.image20:setSRC("/imagens/equals.png");
    obj.image20:setHeight(15);
    obj.image20:setWidth(15);
    obj.image20:setLeft(15);
    obj.image20:setTop(5);
    obj.image20:setName("image20");

    obj.flowPart134 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart134:setParent(obj.tabelaDeAtributos);
    obj.flowPart134:setHeight(50);
    obj.flowPart134:setMinScaledWidth(30);
    obj.flowPart134:setMinWidth(30);
    obj.flowPart134:setMaxWidth(35);
    obj.flowPart134:setMaxScaledWidth(35);
    obj.flowPart134:setAvoidScale(true);
    obj.flowPart134:setName("flowPart134");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart134);
    obj.edit56:setAlign("top");
    obj.edit56:setField("dexBase");
    obj.edit56:setFontSize(15);
    obj.edit56:setTransparent(true);
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setType("number");
    obj.edit56:setReadOnly(false);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setName("edit56");
    obj.edit56:setHeight(30);
    obj.edit56:setWidth(195);

    obj.horzLine36 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine36:setParent(obj.flowPart134);
    obj.horzLine36:setAlign("top");
    obj.horzLine36:setStrokeColor("#FFFFFF50");
    obj.horzLine36:setStrokeSize(1);
    obj.horzLine36:setName("horzLine36");

    obj.flowPart135 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart135:setParent(obj.tabelaDeAtributos);
    obj.flowPart135:setName("flowPart135");
    obj.flowPart135:setHeight(50);
    obj.flowPart135:setMinScaledWidth(30);
    obj.flowPart135:setMaxScaledWidth(50);

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.flowPart135);
    obj.image21:setSRC("/imagens/plus.png");
    obj.image21:setHeight(15);
    obj.image21:setWidth(15);
    obj.image21:setLeft(15);
    obj.image21:setTop(5);
    obj.image21:setName("image21");

    obj.flowPart136 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart136:setParent(obj.tabelaDeAtributos);
    obj.flowPart136:setHeight(50);
    obj.flowPart136:setMinScaledWidth(30);
    obj.flowPart136:setMinWidth(30);
    obj.flowPart136:setMaxWidth(35);
    obj.flowPart136:setMaxScaledWidth(35);
    obj.flowPart136:setAvoidScale(true);
    obj.flowPart136:setName("flowPart136");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart136);
    obj.edit57:setAlign("top");
    obj.edit57:setField("dexEquip");
    obj.edit57:setFontSize(15);
    obj.edit57:setTransparent(true);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setType("number");
    obj.edit57:setReadOnly(false);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");
    obj.edit57:setHeight(30);
    obj.edit57:setWidth(195);

    obj.horzLine37 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine37:setParent(obj.flowPart136);
    obj.horzLine37:setAlign("top");
    obj.horzLine37:setStrokeColor("#FFFFFF50");
    obj.horzLine37:setStrokeSize(1);
    obj.horzLine37:setName("horzLine37");

    obj.flowPart137 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart137:setParent(obj.tabelaDeAtributos);
    obj.flowPart137:setName("flowPart137");
    obj.flowPart137:setHeight(50);
    obj.flowPart137:setMinScaledWidth(30);
    obj.flowPart137:setMaxScaledWidth(50);

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.flowPart137);
    obj.image22:setSRC("/imagens/equals.png");
    obj.image22:setHeight(15);
    obj.image22:setWidth(15);
    obj.image22:setLeft(15);
    obj.image22:setTop(5);
    obj.image22:setName("image22");

    obj.flowPart138 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart138:setParent(obj.tabelaDeAtributos);
    obj.flowPart138:setHeight(50);
    obj.flowPart138:setMinScaledWidth(30);
    obj.flowPart138:setMinWidth(30);
    obj.flowPart138:setMaxWidth(35);
    obj.flowPart138:setMaxScaledWidth(35);
    obj.flowPart138:setAvoidScale(true);
    obj.flowPart138:setName("flowPart138");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart138);
    obj.edit58:setAlign("top");
    obj.edit58:setField("dexTotal");
    obj.edit58:setFontSize(15);
    obj.edit58:setTransparent(true);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setType("number");
    obj.edit58:setReadOnly(false);
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");
    obj.edit58:setHeight(30);
    obj.edit58:setWidth(195);

    obj.horzLine38 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine38:setParent(obj.flowPart138);
    obj.horzLine38:setAlign("top");
    obj.horzLine38:setStrokeColor("#FFFFFF50");
    obj.horzLine38:setStrokeSize(1);
    obj.horzLine38:setName("horzLine38");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.tabelaDeAtributos);
    obj.dataLink8:setFields({'dexNivel', 'dexClasse', 'dexRaca', 'dexTreino',
                           'dexOutros', 'dexBase', 'dexEquip', 'dexTotal'});
    obj.dataLink8:setName("dataLink8");

    obj.flowPart139 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart139:setParent(obj.tabelaDeAtributos);
    obj.flowPart139:setHeight(20);
    obj.flowPart139:setMinScaledWidth(60);
    obj.flowPart139:setMaxScaledWidth(85);
    obj.flowPart139:setName("flowPart139");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.flowPart139);
    obj.label95:setText("Carisma");
    obj.label95:setAlign("client");
    obj.label95:setFontSize(8);
    obj.label95:setVertTextAlign("center");
    obj.label95:setHorzTextAlign("leading");
    obj.label95:setName("label95");

    obj.flowPart140 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart140:setParent(obj.tabelaDeAtributos);
    obj.flowPart140:setHeight(50);
    obj.flowPart140:setMinScaledWidth(30);
    obj.flowPart140:setMinWidth(30);
    obj.flowPart140:setMaxWidth(35);
    obj.flowPart140:setMaxScaledWidth(35);
    obj.flowPart140:setAvoidScale(true);
    obj.flowPart140:setName("flowPart140");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart140);
    obj.edit59:setAlign("top");
    obj.edit59:setField("carNivel");
    obj.edit59:setFontSize(15);
    obj.edit59:setTransparent(true);
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setType("number");
    obj.edit59:setReadOnly(false);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");
    obj.edit59:setHeight(30);
    obj.edit59:setWidth(195);

    obj.horzLine39 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine39:setParent(obj.flowPart140);
    obj.horzLine39:setAlign("top");
    obj.horzLine39:setStrokeColor("#FFFFFF50");
    obj.horzLine39:setStrokeSize(1);
    obj.horzLine39:setName("horzLine39");

    obj.flowPart141 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart141:setParent(obj.tabelaDeAtributos);
    obj.flowPart141:setName("flowPart141");
    obj.flowPart141:setHeight(50);
    obj.flowPart141:setMinScaledWidth(30);
    obj.flowPart141:setMaxScaledWidth(50);

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.flowPart141);
    obj.image23:setSRC("/imagens/plus.png");
    obj.image23:setHeight(15);
    obj.image23:setWidth(15);
    obj.image23:setLeft(15);
    obj.image23:setTop(5);
    obj.image23:setName("image23");

    obj.flowPart142 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart142:setParent(obj.tabelaDeAtributos);
    obj.flowPart142:setHeight(50);
    obj.flowPart142:setMinScaledWidth(30);
    obj.flowPart142:setMinWidth(30);
    obj.flowPart142:setMaxWidth(35);
    obj.flowPart142:setMaxScaledWidth(35);
    obj.flowPart142:setAvoidScale(true);
    obj.flowPart142:setName("flowPart142");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart142);
    obj.edit60:setAlign("top");
    obj.edit60:setField("carClasse");
    obj.edit60:setFontSize(15);
    obj.edit60:setTransparent(true);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setType("number");
    obj.edit60:setReadOnly(false);
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");
    obj.edit60:setHeight(30);
    obj.edit60:setWidth(195);

    obj.horzLine40 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine40:setParent(obj.flowPart142);
    obj.horzLine40:setAlign("top");
    obj.horzLine40:setStrokeColor("#FFFFFF50");
    obj.horzLine40:setStrokeSize(1);
    obj.horzLine40:setName("horzLine40");

    obj.flowPart143 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart143:setParent(obj.tabelaDeAtributos);
    obj.flowPart143:setName("flowPart143");
    obj.flowPart143:setHeight(50);
    obj.flowPart143:setMinScaledWidth(30);
    obj.flowPart143:setMaxScaledWidth(50);

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.flowPart143);
    obj.image24:setSRC("/imagens/plus.png");
    obj.image24:setHeight(15);
    obj.image24:setWidth(15);
    obj.image24:setLeft(15);
    obj.image24:setTop(5);
    obj.image24:setName("image24");

    obj.flowPart144 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart144:setParent(obj.tabelaDeAtributos);
    obj.flowPart144:setHeight(50);
    obj.flowPart144:setMinScaledWidth(30);
    obj.flowPart144:setMinWidth(30);
    obj.flowPart144:setMaxWidth(35);
    obj.flowPart144:setMaxScaledWidth(35);
    obj.flowPart144:setAvoidScale(true);
    obj.flowPart144:setName("flowPart144");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart144);
    obj.edit61:setAlign("top");
    obj.edit61:setField("carRaca");
    obj.edit61:setFontSize(15);
    obj.edit61:setTransparent(true);
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setType("number");
    obj.edit61:setReadOnly(false);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setName("edit61");
    obj.edit61:setHeight(30);
    obj.edit61:setWidth(195);

    obj.horzLine41 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine41:setParent(obj.flowPart144);
    obj.horzLine41:setAlign("top");
    obj.horzLine41:setStrokeColor("#FFFFFF50");
    obj.horzLine41:setStrokeSize(1);
    obj.horzLine41:setName("horzLine41");

    obj.flowPart145 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart145:setParent(obj.tabelaDeAtributos);
    obj.flowPart145:setName("flowPart145");
    obj.flowPart145:setHeight(50);
    obj.flowPart145:setMinScaledWidth(30);
    obj.flowPart145:setMaxScaledWidth(50);

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.flowPart145);
    obj.image25:setSRC("/imagens/plus.png");
    obj.image25:setHeight(15);
    obj.image25:setWidth(15);
    obj.image25:setLeft(15);
    obj.image25:setTop(5);
    obj.image25:setName("image25");

    obj.flowPart146 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart146:setParent(obj.tabelaDeAtributos);
    obj.flowPart146:setHeight(50);
    obj.flowPart146:setMinScaledWidth(30);
    obj.flowPart146:setMinWidth(30);
    obj.flowPart146:setMaxWidth(35);
    obj.flowPart146:setMaxScaledWidth(35);
    obj.flowPart146:setAvoidScale(true);
    obj.flowPart146:setName("flowPart146");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart146);
    obj.edit62:setAlign("top");
    obj.edit62:setField("carTreino");
    obj.edit62:setFontSize(15);
    obj.edit62:setTransparent(true);
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setType("number");
    obj.edit62:setReadOnly(false);
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");
    obj.edit62:setHeight(30);
    obj.edit62:setWidth(195);

    obj.horzLine42 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine42:setParent(obj.flowPart146);
    obj.horzLine42:setAlign("top");
    obj.horzLine42:setStrokeColor("#FFFFFF50");
    obj.horzLine42:setStrokeSize(1);
    obj.horzLine42:setName("horzLine42");

    obj.flowPart147 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart147:setParent(obj.tabelaDeAtributos);
    obj.flowPart147:setName("flowPart147");
    obj.flowPart147:setHeight(50);
    obj.flowPart147:setMinScaledWidth(30);
    obj.flowPart147:setMaxScaledWidth(50);

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.flowPart147);
    obj.image26:setSRC("/imagens/plus.png");
    obj.image26:setHeight(15);
    obj.image26:setWidth(15);
    obj.image26:setLeft(15);
    obj.image26:setTop(5);
    obj.image26:setName("image26");

    obj.flowPart148 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart148:setParent(obj.tabelaDeAtributos);
    obj.flowPart148:setHeight(50);
    obj.flowPart148:setMinScaledWidth(30);
    obj.flowPart148:setMinWidth(30);
    obj.flowPart148:setMaxWidth(35);
    obj.flowPart148:setMaxScaledWidth(35);
    obj.flowPart148:setAvoidScale(true);
    obj.flowPart148:setName("flowPart148");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart148);
    obj.edit63:setAlign("top");
    obj.edit63:setField("carOutros");
    obj.edit63:setFontSize(15);
    obj.edit63:setTransparent(true);
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setType("number");
    obj.edit63:setReadOnly(false);
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");
    obj.edit63:setHeight(30);
    obj.edit63:setWidth(195);

    obj.horzLine43 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine43:setParent(obj.flowPart148);
    obj.horzLine43:setAlign("top");
    obj.horzLine43:setStrokeColor("#FFFFFF50");
    obj.horzLine43:setStrokeSize(1);
    obj.horzLine43:setName("horzLine43");

    obj.flowPart149 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart149:setParent(obj.tabelaDeAtributos);
    obj.flowPart149:setName("flowPart149");
    obj.flowPart149:setHeight(50);
    obj.flowPart149:setMinScaledWidth(30);
    obj.flowPart149:setMaxScaledWidth(50);

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.flowPart149);
    obj.image27:setSRC("/imagens/equals.png");
    obj.image27:setHeight(15);
    obj.image27:setWidth(15);
    obj.image27:setLeft(15);
    obj.image27:setTop(5);
    obj.image27:setName("image27");

    obj.flowPart150 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart150:setParent(obj.tabelaDeAtributos);
    obj.flowPart150:setHeight(50);
    obj.flowPart150:setMinScaledWidth(30);
    obj.flowPart150:setMinWidth(30);
    obj.flowPart150:setMaxWidth(35);
    obj.flowPart150:setMaxScaledWidth(35);
    obj.flowPart150:setAvoidScale(true);
    obj.flowPart150:setName("flowPart150");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart150);
    obj.edit64:setAlign("top");
    obj.edit64:setField("carBase");
    obj.edit64:setFontSize(15);
    obj.edit64:setTransparent(true);
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setType("number");
    obj.edit64:setReadOnly(false);
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");
    obj.edit64:setHeight(30);
    obj.edit64:setWidth(195);

    obj.horzLine44 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine44:setParent(obj.flowPart150);
    obj.horzLine44:setAlign("top");
    obj.horzLine44:setStrokeColor("#FFFFFF50");
    obj.horzLine44:setStrokeSize(1);
    obj.horzLine44:setName("horzLine44");

    obj.flowPart151 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart151:setParent(obj.tabelaDeAtributos);
    obj.flowPart151:setName("flowPart151");
    obj.flowPart151:setHeight(50);
    obj.flowPart151:setMinScaledWidth(30);
    obj.flowPart151:setMaxScaledWidth(50);

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.flowPart151);
    obj.image28:setSRC("/imagens/plus.png");
    obj.image28:setHeight(15);
    obj.image28:setWidth(15);
    obj.image28:setLeft(15);
    obj.image28:setTop(5);
    obj.image28:setName("image28");

    obj.flowPart152 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart152:setParent(obj.tabelaDeAtributos);
    obj.flowPart152:setHeight(50);
    obj.flowPart152:setMinScaledWidth(30);
    obj.flowPart152:setMinWidth(30);
    obj.flowPart152:setMaxWidth(35);
    obj.flowPart152:setMaxScaledWidth(35);
    obj.flowPart152:setAvoidScale(true);
    obj.flowPart152:setName("flowPart152");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.flowPart152);
    obj.edit65:setAlign("top");
    obj.edit65:setField("carEquip");
    obj.edit65:setFontSize(15);
    obj.edit65:setTransparent(true);
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setType("number");
    obj.edit65:setReadOnly(false);
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");
    obj.edit65:setHeight(30);
    obj.edit65:setWidth(195);

    obj.horzLine45 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine45:setParent(obj.flowPart152);
    obj.horzLine45:setAlign("top");
    obj.horzLine45:setStrokeColor("#FFFFFF50");
    obj.horzLine45:setStrokeSize(1);
    obj.horzLine45:setName("horzLine45");

    obj.flowPart153 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart153:setParent(obj.tabelaDeAtributos);
    obj.flowPart153:setName("flowPart153");
    obj.flowPart153:setHeight(50);
    obj.flowPart153:setMinScaledWidth(30);
    obj.flowPart153:setMaxScaledWidth(50);

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.flowPart153);
    obj.image29:setSRC("/imagens/equals.png");
    obj.image29:setHeight(15);
    obj.image29:setWidth(15);
    obj.image29:setLeft(15);
    obj.image29:setTop(5);
    obj.image29:setName("image29");

    obj.flowPart154 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart154:setParent(obj.tabelaDeAtributos);
    obj.flowPart154:setHeight(50);
    obj.flowPart154:setMinScaledWidth(30);
    obj.flowPart154:setMinWidth(30);
    obj.flowPart154:setMaxWidth(35);
    obj.flowPart154:setMaxScaledWidth(35);
    obj.flowPart154:setAvoidScale(true);
    obj.flowPart154:setName("flowPart154");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.flowPart154);
    obj.edit66:setAlign("top");
    obj.edit66:setField("carTotal");
    obj.edit66:setFontSize(15);
    obj.edit66:setTransparent(true);
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setType("number");
    obj.edit66:setReadOnly(false);
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");
    obj.edit66:setHeight(30);
    obj.edit66:setWidth(195);

    obj.horzLine46 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine46:setParent(obj.flowPart154);
    obj.horzLine46:setAlign("top");
    obj.horzLine46:setStrokeColor("#FFFFFF50");
    obj.horzLine46:setStrokeSize(1);
    obj.horzLine46:setName("horzLine46");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.tabelaDeAtributos);
    obj.dataLink9:setFields({'carNivel', 'carClasse', 'carRaca', 'carTreino',
                           'carOutros', 'carBase', 'carEquip', 'carTotal'});
    obj.dataLink9:setName("dataLink9");

    obj.flowPart155 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart155:setParent(obj.tabelaDeAtributos);
    obj.flowPart155:setHeight(20);
    obj.flowPart155:setMinScaledWidth(60);
    obj.flowPart155:setMaxScaledWidth(85);
    obj.flowPart155:setName("flowPart155");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.flowPart155);
    obj.label96:setText("Inteligência");
    obj.label96:setAlign("client");
    obj.label96:setFontSize(8);
    obj.label96:setVertTextAlign("center");
    obj.label96:setHorzTextAlign("leading");
    obj.label96:setName("label96");

    obj.flowPart156 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart156:setParent(obj.tabelaDeAtributos);
    obj.flowPart156:setHeight(50);
    obj.flowPart156:setMinScaledWidth(30);
    obj.flowPart156:setMinWidth(30);
    obj.flowPart156:setMaxWidth(35);
    obj.flowPart156:setMaxScaledWidth(35);
    obj.flowPart156:setAvoidScale(true);
    obj.flowPart156:setName("flowPart156");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.flowPart156);
    obj.edit67:setAlign("top");
    obj.edit67:setField("intNivel");
    obj.edit67:setFontSize(15);
    obj.edit67:setTransparent(true);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setType("number");
    obj.edit67:setReadOnly(false);
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");
    obj.edit67:setHeight(30);
    obj.edit67:setWidth(195);

    obj.horzLine47 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine47:setParent(obj.flowPart156);
    obj.horzLine47:setAlign("top");
    obj.horzLine47:setStrokeColor("#FFFFFF50");
    obj.horzLine47:setStrokeSize(1);
    obj.horzLine47:setName("horzLine47");

    obj.flowPart157 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart157:setParent(obj.tabelaDeAtributos);
    obj.flowPart157:setName("flowPart157");
    obj.flowPart157:setHeight(50);
    obj.flowPart157:setMinScaledWidth(30);
    obj.flowPart157:setMaxScaledWidth(50);

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.flowPart157);
    obj.image30:setSRC("/imagens/plus.png");
    obj.image30:setHeight(15);
    obj.image30:setWidth(15);
    obj.image30:setLeft(15);
    obj.image30:setTop(5);
    obj.image30:setName("image30");

    obj.flowPart158 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart158:setParent(obj.tabelaDeAtributos);
    obj.flowPart158:setHeight(50);
    obj.flowPart158:setMinScaledWidth(30);
    obj.flowPart158:setMinWidth(30);
    obj.flowPart158:setMaxWidth(35);
    obj.flowPart158:setMaxScaledWidth(35);
    obj.flowPart158:setAvoidScale(true);
    obj.flowPart158:setName("flowPart158");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.flowPart158);
    obj.edit68:setAlign("top");
    obj.edit68:setField("intClasse");
    obj.edit68:setFontSize(15);
    obj.edit68:setTransparent(true);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setType("number");
    obj.edit68:setReadOnly(false);
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");
    obj.edit68:setHeight(30);
    obj.edit68:setWidth(195);

    obj.horzLine48 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine48:setParent(obj.flowPart158);
    obj.horzLine48:setAlign("top");
    obj.horzLine48:setStrokeColor("#FFFFFF50");
    obj.horzLine48:setStrokeSize(1);
    obj.horzLine48:setName("horzLine48");

    obj.flowPart159 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart159:setParent(obj.tabelaDeAtributos);
    obj.flowPart159:setName("flowPart159");
    obj.flowPart159:setHeight(50);
    obj.flowPart159:setMinScaledWidth(30);
    obj.flowPart159:setMaxScaledWidth(50);

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.flowPart159);
    obj.image31:setSRC("/imagens/plus.png");
    obj.image31:setHeight(15);
    obj.image31:setWidth(15);
    obj.image31:setLeft(15);
    obj.image31:setTop(5);
    obj.image31:setName("image31");

    obj.flowPart160 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart160:setParent(obj.tabelaDeAtributos);
    obj.flowPart160:setHeight(50);
    obj.flowPart160:setMinScaledWidth(30);
    obj.flowPart160:setMinWidth(30);
    obj.flowPart160:setMaxWidth(35);
    obj.flowPart160:setMaxScaledWidth(35);
    obj.flowPart160:setAvoidScale(true);
    obj.flowPart160:setName("flowPart160");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart160);
    obj.edit69:setAlign("top");
    obj.edit69:setField("intRaca");
    obj.edit69:setFontSize(15);
    obj.edit69:setTransparent(true);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setType("number");
    obj.edit69:setReadOnly(false);
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");
    obj.edit69:setHeight(30);
    obj.edit69:setWidth(195);

    obj.horzLine49 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine49:setParent(obj.flowPart160);
    obj.horzLine49:setAlign("top");
    obj.horzLine49:setStrokeColor("#FFFFFF50");
    obj.horzLine49:setStrokeSize(1);
    obj.horzLine49:setName("horzLine49");

    obj.flowPart161 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart161:setParent(obj.tabelaDeAtributos);
    obj.flowPart161:setName("flowPart161");
    obj.flowPart161:setHeight(50);
    obj.flowPart161:setMinScaledWidth(30);
    obj.flowPart161:setMaxScaledWidth(50);

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.flowPart161);
    obj.image32:setSRC("/imagens/plus.png");
    obj.image32:setHeight(15);
    obj.image32:setWidth(15);
    obj.image32:setLeft(15);
    obj.image32:setTop(5);
    obj.image32:setName("image32");

    obj.flowPart162 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart162:setParent(obj.tabelaDeAtributos);
    obj.flowPart162:setHeight(50);
    obj.flowPart162:setMinScaledWidth(30);
    obj.flowPart162:setMinWidth(30);
    obj.flowPart162:setMaxWidth(35);
    obj.flowPart162:setMaxScaledWidth(35);
    obj.flowPart162:setAvoidScale(true);
    obj.flowPart162:setName("flowPart162");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart162);
    obj.edit70:setAlign("top");
    obj.edit70:setField("intTreino");
    obj.edit70:setFontSize(15);
    obj.edit70:setTransparent(true);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setType("number");
    obj.edit70:setReadOnly(false);
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");
    obj.edit70:setHeight(30);
    obj.edit70:setWidth(195);

    obj.horzLine50 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine50:setParent(obj.flowPart162);
    obj.horzLine50:setAlign("top");
    obj.horzLine50:setStrokeColor("#FFFFFF50");
    obj.horzLine50:setStrokeSize(1);
    obj.horzLine50:setName("horzLine50");

    obj.flowPart163 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart163:setParent(obj.tabelaDeAtributos);
    obj.flowPart163:setName("flowPart163");
    obj.flowPart163:setHeight(50);
    obj.flowPart163:setMinScaledWidth(30);
    obj.flowPart163:setMaxScaledWidth(50);

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.flowPart163);
    obj.image33:setSRC("/imagens/plus.png");
    obj.image33:setHeight(15);
    obj.image33:setWidth(15);
    obj.image33:setLeft(15);
    obj.image33:setTop(5);
    obj.image33:setName("image33");

    obj.flowPart164 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart164:setParent(obj.tabelaDeAtributos);
    obj.flowPart164:setHeight(50);
    obj.flowPart164:setMinScaledWidth(30);
    obj.flowPart164:setMinWidth(30);
    obj.flowPart164:setMaxWidth(35);
    obj.flowPart164:setMaxScaledWidth(35);
    obj.flowPart164:setAvoidScale(true);
    obj.flowPart164:setName("flowPart164");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart164);
    obj.edit71:setAlign("top");
    obj.edit71:setField("intOutros");
    obj.edit71:setFontSize(15);
    obj.edit71:setTransparent(true);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setType("number");
    obj.edit71:setReadOnly(false);
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setName("edit71");
    obj.edit71:setHeight(30);
    obj.edit71:setWidth(195);

    obj.horzLine51 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine51:setParent(obj.flowPart164);
    obj.horzLine51:setAlign("top");
    obj.horzLine51:setStrokeColor("#FFFFFF50");
    obj.horzLine51:setStrokeSize(1);
    obj.horzLine51:setName("horzLine51");

    obj.flowPart165 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart165:setParent(obj.tabelaDeAtributos);
    obj.flowPart165:setName("flowPart165");
    obj.flowPart165:setHeight(50);
    obj.flowPart165:setMinScaledWidth(30);
    obj.flowPart165:setMaxScaledWidth(50);

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.flowPart165);
    obj.image34:setSRC("/imagens/equals.png");
    obj.image34:setHeight(15);
    obj.image34:setWidth(15);
    obj.image34:setLeft(15);
    obj.image34:setTop(5);
    obj.image34:setName("image34");

    obj.flowPart166 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart166:setParent(obj.tabelaDeAtributos);
    obj.flowPart166:setHeight(50);
    obj.flowPart166:setMinScaledWidth(30);
    obj.flowPart166:setMinWidth(30);
    obj.flowPart166:setMaxWidth(35);
    obj.flowPart166:setMaxScaledWidth(35);
    obj.flowPart166:setAvoidScale(true);
    obj.flowPart166:setName("flowPart166");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.flowPart166);
    obj.edit72:setAlign("top");
    obj.edit72:setField("intBase");
    obj.edit72:setFontSize(15);
    obj.edit72:setTransparent(true);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setType("number");
    obj.edit72:setReadOnly(false);
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");
    obj.edit72:setHeight(30);
    obj.edit72:setWidth(195);

    obj.horzLine52 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine52:setParent(obj.flowPart166);
    obj.horzLine52:setAlign("top");
    obj.horzLine52:setStrokeColor("#FFFFFF50");
    obj.horzLine52:setStrokeSize(1);
    obj.horzLine52:setName("horzLine52");

    obj.flowPart167 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart167:setParent(obj.tabelaDeAtributos);
    obj.flowPart167:setName("flowPart167");
    obj.flowPart167:setHeight(50);
    obj.flowPart167:setMinScaledWidth(30);
    obj.flowPart167:setMaxScaledWidth(50);

    obj.image35 = GUI.fromHandle(_obj_newObject("image"));
    obj.image35:setParent(obj.flowPart167);
    obj.image35:setSRC("/imagens/plus.png");
    obj.image35:setHeight(15);
    obj.image35:setWidth(15);
    obj.image35:setLeft(15);
    obj.image35:setTop(5);
    obj.image35:setName("image35");

    obj.flowPart168 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart168:setParent(obj.tabelaDeAtributos);
    obj.flowPart168:setHeight(50);
    obj.flowPart168:setMinScaledWidth(30);
    obj.flowPart168:setMinWidth(30);
    obj.flowPart168:setMaxWidth(35);
    obj.flowPart168:setMaxScaledWidth(35);
    obj.flowPart168:setAvoidScale(true);
    obj.flowPart168:setName("flowPart168");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.flowPart168);
    obj.edit73:setAlign("top");
    obj.edit73:setField("intEquip");
    obj.edit73:setFontSize(15);
    obj.edit73:setTransparent(true);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setType("number");
    obj.edit73:setReadOnly(false);
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");
    obj.edit73:setHeight(30);
    obj.edit73:setWidth(195);

    obj.horzLine53 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine53:setParent(obj.flowPart168);
    obj.horzLine53:setAlign("top");
    obj.horzLine53:setStrokeColor("#FFFFFF50");
    obj.horzLine53:setStrokeSize(1);
    obj.horzLine53:setName("horzLine53");

    obj.flowPart169 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart169:setParent(obj.tabelaDeAtributos);
    obj.flowPart169:setName("flowPart169");
    obj.flowPart169:setHeight(50);
    obj.flowPart169:setMinScaledWidth(30);
    obj.flowPart169:setMaxScaledWidth(50);

    obj.image36 = GUI.fromHandle(_obj_newObject("image"));
    obj.image36:setParent(obj.flowPart169);
    obj.image36:setSRC("/imagens/equals.png");
    obj.image36:setHeight(15);
    obj.image36:setWidth(15);
    obj.image36:setLeft(15);
    obj.image36:setTop(5);
    obj.image36:setName("image36");

    obj.flowPart170 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart170:setParent(obj.tabelaDeAtributos);
    obj.flowPart170:setHeight(50);
    obj.flowPart170:setMinScaledWidth(30);
    obj.flowPart170:setMinWidth(30);
    obj.flowPart170:setMaxWidth(35);
    obj.flowPart170:setMaxScaledWidth(35);
    obj.flowPart170:setAvoidScale(true);
    obj.flowPart170:setName("flowPart170");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.flowPart170);
    obj.edit74:setAlign("top");
    obj.edit74:setField("intTotal");
    obj.edit74:setFontSize(15);
    obj.edit74:setTransparent(true);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setType("number");
    obj.edit74:setReadOnly(false);
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");
    obj.edit74:setHeight(30);
    obj.edit74:setWidth(195);

    obj.horzLine54 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine54:setParent(obj.flowPart170);
    obj.horzLine54:setAlign("top");
    obj.horzLine54:setStrokeColor("#FFFFFF50");
    obj.horzLine54:setStrokeSize(1);
    obj.horzLine54:setName("horzLine54");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.tabelaDeAtributos);
    obj.dataLink10:setFields({'intNivel', 'intClasse', 'intRaca', 'intTreino',
                           'intOutros', 'intBase', 'intEquip', 'intTotal'});
    obj.dataLink10:setName("dataLink10");

    obj.flowPart171 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart171:setParent(obj.tabelaDeAtributos);
    obj.flowPart171:setHeight(20);
    obj.flowPart171:setMinScaledWidth(60);
    obj.flowPart171:setMaxScaledWidth(85);
    obj.flowPart171:setName("flowPart171");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.flowPart171);
    obj.label97:setText("Sabedoria");
    obj.label97:setAlign("client");
    obj.label97:setFontSize(8);
    obj.label97:setVertTextAlign("center");
    obj.label97:setHorzTextAlign("leading");
    obj.label97:setName("label97");

    obj.flowPart172 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart172:setParent(obj.tabelaDeAtributos);
    obj.flowPart172:setHeight(50);
    obj.flowPart172:setMinScaledWidth(30);
    obj.flowPart172:setMinWidth(30);
    obj.flowPart172:setMaxWidth(35);
    obj.flowPart172:setMaxScaledWidth(35);
    obj.flowPart172:setAvoidScale(true);
    obj.flowPart172:setName("flowPart172");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.flowPart172);
    obj.edit75:setAlign("top");
    obj.edit75:setField("sabNivel");
    obj.edit75:setFontSize(15);
    obj.edit75:setTransparent(true);
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setType("number");
    obj.edit75:setReadOnly(false);
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");
    obj.edit75:setHeight(30);
    obj.edit75:setWidth(195);

    obj.horzLine55 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine55:setParent(obj.flowPart172);
    obj.horzLine55:setAlign("top");
    obj.horzLine55:setStrokeColor("#FFFFFF50");
    obj.horzLine55:setStrokeSize(1);
    obj.horzLine55:setName("horzLine55");

    obj.flowPart173 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart173:setParent(obj.tabelaDeAtributos);
    obj.flowPart173:setName("flowPart173");
    obj.flowPart173:setHeight(50);
    obj.flowPart173:setMinScaledWidth(30);
    obj.flowPart173:setMaxScaledWidth(50);

    obj.image37 = GUI.fromHandle(_obj_newObject("image"));
    obj.image37:setParent(obj.flowPart173);
    obj.image37:setSRC("/imagens/plus.png");
    obj.image37:setHeight(15);
    obj.image37:setWidth(15);
    obj.image37:setLeft(15);
    obj.image37:setTop(5);
    obj.image37:setName("image37");

    obj.flowPart174 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart174:setParent(obj.tabelaDeAtributos);
    obj.flowPart174:setHeight(50);
    obj.flowPart174:setMinScaledWidth(30);
    obj.flowPart174:setMinWidth(30);
    obj.flowPart174:setMaxWidth(35);
    obj.flowPart174:setMaxScaledWidth(35);
    obj.flowPart174:setAvoidScale(true);
    obj.flowPart174:setName("flowPart174");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.flowPart174);
    obj.edit76:setAlign("top");
    obj.edit76:setField("sabClasse");
    obj.edit76:setFontSize(15);
    obj.edit76:setTransparent(true);
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setType("number");
    obj.edit76:setReadOnly(false);
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");
    obj.edit76:setHeight(30);
    obj.edit76:setWidth(195);

    obj.horzLine56 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine56:setParent(obj.flowPart174);
    obj.horzLine56:setAlign("top");
    obj.horzLine56:setStrokeColor("#FFFFFF50");
    obj.horzLine56:setStrokeSize(1);
    obj.horzLine56:setName("horzLine56");

    obj.flowPart175 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart175:setParent(obj.tabelaDeAtributos);
    obj.flowPart175:setName("flowPart175");
    obj.flowPart175:setHeight(50);
    obj.flowPart175:setMinScaledWidth(30);
    obj.flowPart175:setMaxScaledWidth(50);

    obj.image38 = GUI.fromHandle(_obj_newObject("image"));
    obj.image38:setParent(obj.flowPart175);
    obj.image38:setSRC("/imagens/plus.png");
    obj.image38:setHeight(15);
    obj.image38:setWidth(15);
    obj.image38:setLeft(15);
    obj.image38:setTop(5);
    obj.image38:setName("image38");

    obj.flowPart176 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart176:setParent(obj.tabelaDeAtributos);
    obj.flowPart176:setHeight(50);
    obj.flowPart176:setMinScaledWidth(30);
    obj.flowPart176:setMinWidth(30);
    obj.flowPart176:setMaxWidth(35);
    obj.flowPart176:setMaxScaledWidth(35);
    obj.flowPart176:setAvoidScale(true);
    obj.flowPart176:setName("flowPart176");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.flowPart176);
    obj.edit77:setAlign("top");
    obj.edit77:setField("sabRaca");
    obj.edit77:setFontSize(15);
    obj.edit77:setTransparent(true);
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setType("number");
    obj.edit77:setReadOnly(false);
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");
    obj.edit77:setHeight(30);
    obj.edit77:setWidth(195);

    obj.horzLine57 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine57:setParent(obj.flowPart176);
    obj.horzLine57:setAlign("top");
    obj.horzLine57:setStrokeColor("#FFFFFF50");
    obj.horzLine57:setStrokeSize(1);
    obj.horzLine57:setName("horzLine57");

    obj.flowPart177 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart177:setParent(obj.tabelaDeAtributos);
    obj.flowPart177:setName("flowPart177");
    obj.flowPart177:setHeight(50);
    obj.flowPart177:setMinScaledWidth(30);
    obj.flowPart177:setMaxScaledWidth(50);

    obj.image39 = GUI.fromHandle(_obj_newObject("image"));
    obj.image39:setParent(obj.flowPart177);
    obj.image39:setSRC("/imagens/plus.png");
    obj.image39:setHeight(15);
    obj.image39:setWidth(15);
    obj.image39:setLeft(15);
    obj.image39:setTop(5);
    obj.image39:setName("image39");

    obj.flowPart178 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart178:setParent(obj.tabelaDeAtributos);
    obj.flowPart178:setHeight(50);
    obj.flowPart178:setMinScaledWidth(30);
    obj.flowPart178:setMinWidth(30);
    obj.flowPart178:setMaxWidth(35);
    obj.flowPart178:setMaxScaledWidth(35);
    obj.flowPart178:setAvoidScale(true);
    obj.flowPart178:setName("flowPart178");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.flowPart178);
    obj.edit78:setAlign("top");
    obj.edit78:setField("sabTreino");
    obj.edit78:setFontSize(15);
    obj.edit78:setTransparent(true);
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setType("number");
    obj.edit78:setReadOnly(false);
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");
    obj.edit78:setHeight(30);
    obj.edit78:setWidth(195);

    obj.horzLine58 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine58:setParent(obj.flowPart178);
    obj.horzLine58:setAlign("top");
    obj.horzLine58:setStrokeColor("#FFFFFF50");
    obj.horzLine58:setStrokeSize(1);
    obj.horzLine58:setName("horzLine58");

    obj.flowPart179 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart179:setParent(obj.tabelaDeAtributos);
    obj.flowPart179:setName("flowPart179");
    obj.flowPart179:setHeight(50);
    obj.flowPart179:setMinScaledWidth(30);
    obj.flowPart179:setMaxScaledWidth(50);

    obj.image40 = GUI.fromHandle(_obj_newObject("image"));
    obj.image40:setParent(obj.flowPart179);
    obj.image40:setSRC("/imagens/plus.png");
    obj.image40:setHeight(15);
    obj.image40:setWidth(15);
    obj.image40:setLeft(15);
    obj.image40:setTop(5);
    obj.image40:setName("image40");

    obj.flowPart180 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart180:setParent(obj.tabelaDeAtributos);
    obj.flowPart180:setHeight(50);
    obj.flowPart180:setMinScaledWidth(30);
    obj.flowPart180:setMinWidth(30);
    obj.flowPart180:setMaxWidth(35);
    obj.flowPart180:setMaxScaledWidth(35);
    obj.flowPart180:setAvoidScale(true);
    obj.flowPart180:setName("flowPart180");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.flowPart180);
    obj.edit79:setAlign("top");
    obj.edit79:setField("sabOutros");
    obj.edit79:setFontSize(15);
    obj.edit79:setTransparent(true);
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setType("number");
    obj.edit79:setReadOnly(false);
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");
    obj.edit79:setHeight(30);
    obj.edit79:setWidth(195);

    obj.horzLine59 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine59:setParent(obj.flowPart180);
    obj.horzLine59:setAlign("top");
    obj.horzLine59:setStrokeColor("#FFFFFF50");
    obj.horzLine59:setStrokeSize(1);
    obj.horzLine59:setName("horzLine59");

    obj.flowPart181 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart181:setParent(obj.tabelaDeAtributos);
    obj.flowPart181:setName("flowPart181");
    obj.flowPart181:setHeight(50);
    obj.flowPart181:setMinScaledWidth(30);
    obj.flowPart181:setMaxScaledWidth(50);

    obj.image41 = GUI.fromHandle(_obj_newObject("image"));
    obj.image41:setParent(obj.flowPart181);
    obj.image41:setSRC("/imagens/equals.png");
    obj.image41:setHeight(15);
    obj.image41:setWidth(15);
    obj.image41:setLeft(15);
    obj.image41:setTop(5);
    obj.image41:setName("image41");

    obj.flowPart182 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart182:setParent(obj.tabelaDeAtributos);
    obj.flowPart182:setHeight(50);
    obj.flowPart182:setMinScaledWidth(30);
    obj.flowPart182:setMinWidth(30);
    obj.flowPart182:setMaxWidth(35);
    obj.flowPart182:setMaxScaledWidth(35);
    obj.flowPart182:setAvoidScale(true);
    obj.flowPart182:setName("flowPart182");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.flowPart182);
    obj.edit80:setAlign("top");
    obj.edit80:setField("sabBase");
    obj.edit80:setFontSize(15);
    obj.edit80:setTransparent(true);
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setType("number");
    obj.edit80:setReadOnly(false);
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");
    obj.edit80:setHeight(30);
    obj.edit80:setWidth(195);

    obj.horzLine60 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine60:setParent(obj.flowPart182);
    obj.horzLine60:setAlign("top");
    obj.horzLine60:setStrokeColor("#FFFFFF50");
    obj.horzLine60:setStrokeSize(1);
    obj.horzLine60:setName("horzLine60");

    obj.flowPart183 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart183:setParent(obj.tabelaDeAtributos);
    obj.flowPart183:setName("flowPart183");
    obj.flowPart183:setHeight(50);
    obj.flowPart183:setMinScaledWidth(30);
    obj.flowPart183:setMaxScaledWidth(50);

    obj.image42 = GUI.fromHandle(_obj_newObject("image"));
    obj.image42:setParent(obj.flowPart183);
    obj.image42:setSRC("/imagens/plus.png");
    obj.image42:setHeight(15);
    obj.image42:setWidth(15);
    obj.image42:setLeft(15);
    obj.image42:setTop(5);
    obj.image42:setName("image42");

    obj.flowPart184 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart184:setParent(obj.tabelaDeAtributos);
    obj.flowPart184:setHeight(50);
    obj.flowPart184:setMinScaledWidth(30);
    obj.flowPart184:setMinWidth(30);
    obj.flowPart184:setMaxWidth(35);
    obj.flowPart184:setMaxScaledWidth(35);
    obj.flowPart184:setAvoidScale(true);
    obj.flowPart184:setName("flowPart184");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.flowPart184);
    obj.edit81:setAlign("top");
    obj.edit81:setField("sabEquip");
    obj.edit81:setFontSize(15);
    obj.edit81:setTransparent(true);
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setType("number");
    obj.edit81:setReadOnly(false);
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setName("edit81");
    obj.edit81:setHeight(30);
    obj.edit81:setWidth(195);

    obj.horzLine61 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine61:setParent(obj.flowPart184);
    obj.horzLine61:setAlign("top");
    obj.horzLine61:setStrokeColor("#FFFFFF50");
    obj.horzLine61:setStrokeSize(1);
    obj.horzLine61:setName("horzLine61");

    obj.flowPart185 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart185:setParent(obj.tabelaDeAtributos);
    obj.flowPart185:setName("flowPart185");
    obj.flowPart185:setHeight(50);
    obj.flowPart185:setMinScaledWidth(30);
    obj.flowPart185:setMaxScaledWidth(50);

    obj.image43 = GUI.fromHandle(_obj_newObject("image"));
    obj.image43:setParent(obj.flowPart185);
    obj.image43:setSRC("/imagens/equals.png");
    obj.image43:setHeight(15);
    obj.image43:setWidth(15);
    obj.image43:setLeft(15);
    obj.image43:setTop(5);
    obj.image43:setName("image43");

    obj.flowPart186 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart186:setParent(obj.tabelaDeAtributos);
    obj.flowPart186:setHeight(50);
    obj.flowPart186:setMinScaledWidth(30);
    obj.flowPart186:setMinWidth(30);
    obj.flowPart186:setMaxWidth(35);
    obj.flowPart186:setMaxScaledWidth(35);
    obj.flowPart186:setAvoidScale(true);
    obj.flowPart186:setName("flowPart186");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.flowPart186);
    obj.edit82:setAlign("top");
    obj.edit82:setField("sabTotal");
    obj.edit82:setFontSize(15);
    obj.edit82:setTransparent(true);
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setType("number");
    obj.edit82:setReadOnly(false);
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");
    obj.edit82:setHeight(30);
    obj.edit82:setWidth(195);

    obj.horzLine62 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine62:setParent(obj.flowPart186);
    obj.horzLine62:setAlign("top");
    obj.horzLine62:setStrokeColor("#FFFFFF50");
    obj.horzLine62:setStrokeSize(1);
    obj.horzLine62:setName("horzLine62");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.tabelaDeAtributos);
    obj.dataLink11:setFields({'sabNivel', 'sabClasse', 'sabRaca', 'sabTreino',
                           'sabOutros', 'sabBase', 'sabEquip', 'sabTotal'});
    obj.dataLink11:setName("dataLink11");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.perfilLayout);
    obj.flowLineBreak4:setLineSpacing(10);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart187 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart187:setParent(obj.perfilLayout);
    obj.flowPart187:setHeight(2);
    obj.flowPart187:setMinScaledWidth(100);
    obj.flowPart187:setMaxScaledWidth(1600);
    obj.flowPart187:setName("flowPart187");

    obj.horzLine63 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine63:setParent(obj.flowPart187);
    obj.horzLine63:setStrokeColor("#FFFFFF50");
    obj.horzLine63:setStrokeSize(0.6);
    obj.horzLine63:setStrokeCap("round");
    obj.horzLine63:setScaleY(0.1);
    obj.horzLine63:setTop(1);
    obj.horzLine63:setName("horzLine63");

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

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.topoPtBonusEConhecimentos);
    obj.label98:setText("Pontos Restantes: ");
    obj.label98:setWidth(150);
    obj.label98:setName("label98");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.topoPtBonusEConhecimentos);
    obj.edit83:setAlign("client");
    obj.edit83:setField("pontosRestantes");
    obj.edit83:setFontSize(12);
    obj.edit83:setTransparent(true);
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setType("number");
    obj.edit83:setReadOnly(true);
    obj.edit83:setMin(0);
    obj.edit83:setName("edit83");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.topoPtBonusEConhecimentos);
    obj.label99:setText("Pontos Treinados: ");
    obj.label99:setWidth(150);
    obj.label99:setName("label99");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.topoPtBonusEConhecimentos);
    obj.edit84:setAlign("client");
    obj.edit84:setField("pontosTreinados");
    obj.edit84:setFontSize(12);
    obj.edit84:setTransparent(true);
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setType("number");
    obj.edit84:setReadOnly(true);
    obj.edit84:setMin(0);
    obj.edit84:setName("edit84");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.topoPtBonusEConhecimentos);
    obj.label100:setText("Pontos de Conhecimento: ");
    obj.label100:setWidth(150);
    obj.label100:setName("label100");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.topoPtBonusEConhecimentos);
    obj.edit85:setAlign("client");
    obj.edit85:setField("pontosDeConhecimento");
    obj.edit85:setFontSize(12);
    obj.edit85:setTransparent(true);
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setType("number");
    obj.edit85:setReadOnly(true);
    obj.edit85:setMin(0);
    obj.edit85:setName("edit85");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.topoPtBonusEConhecimentos);
    obj.label101:setText("Pontos Con. Distribuidos: ");
    obj.label101:setWidth(150);
    obj.label101:setName("label101");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.topoPtBonusEConhecimentos);
    obj.edit86:setAlign("client");
    obj.edit86:setField("pontosDeConhecimentoDistribuidos");
    obj.edit86:setFontSize(12);
    obj.edit86:setTransparent(true);
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setType("number");
    obj.edit86:setReadOnly(true);
    obj.edit86:setMin(0);
    obj.edit86:setName("edit86");

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

    obj.flowPart188 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart188:setParent(obj.tabelaPontosBonus);
    obj.flowPart188:setHeight(20);
    obj.flowPart188:setMinWidth(180);
    obj.flowPart188:setMaxWidth(180);
    obj.flowPart188:setName("flowPart188");
    obj.flowPart188:setMargins({top=5, bottom=5,right=10});

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.flowPart188);
    obj.label102:setText("Percepção");
    obj.label102:setAlign("left");
    obj.label102:setFontSize(18);
    obj.label102:setVertTextAlign("center");
    obj.label102:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label102, "fontStyle",  "italic");
    obj.label102:setWidth(200);
    obj.label102:setName("label102");

    obj.horzLine64 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine64:setParent(obj.flowPart188);
    obj.horzLine64:setAlign("bottom");
    obj.horzLine64:setStrokeColor("#FFFFFF50");
    obj.horzLine64:setStrokeSize(1);
    obj.horzLine64:setName("horzLine64");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.tabelaPontosBonus);
    obj.flowLayout9:setHeight(20);
    obj.flowLayout9:setMinWidth(150);
    obj.flowLayout9:setMaxWidth(200);
    obj.flowLayout9:setMaxControlsPerLine(3);
    obj.flowLayout9:setName("flowLayout9");

    obj.percepcaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.percepcaoMinus:setParent(obj.flowLayout9);
    obj.percepcaoMinus:setName("percepcaoMinus");
    obj.percepcaoMinus:setText("-");
    obj.percepcaoMinus:setWidth(20);
    obj.percepcaoMinus:setHeight(20);

    obj.flowPart189 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart189:setParent(obj.flowLayout9);
    obj.flowPart189:setHeight(20);
    obj.flowPart189:setMinWidth(20);
    obj.flowPart189:setMaxWidth(20);
    obj.flowPart189:setName("flowPart189");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.flowPart189);
    obj.edit87:setAlign("client");
    obj.edit87:setField("percepcao");
    obj.edit87:setFontSize(12);
    obj.edit87:setTransparent(true);
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setType("number");
    obj.edit87:setReadOnly(true);
    obj.edit87:setMin(0);
    obj.edit87:setName("edit87");

    obj.percepcaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.percepcaoPlus:setParent(obj.flowLayout9);
    obj.percepcaoPlus:setName("percepcaoPlus");
    obj.percepcaoPlus:setText("+");
    obj.percepcaoPlus:setWidth(20);
    obj.percepcaoPlus:setHeight(20);

    obj.flowPart190 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart190:setParent(obj.tabelaPontosBonus);
    obj.flowPart190:setHeight(20);
    obj.flowPart190:setMinWidth(180);
    obj.flowPart190:setMaxWidth(180);
    obj.flowPart190:setName("flowPart190");
    obj.flowPart190:setMargins({top=5, bottom=5,right=10});

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.flowPart190);
    obj.label103:setText("Intimidação");
    obj.label103:setAlign("left");
    obj.label103:setFontSize(18);
    obj.label103:setVertTextAlign("center");
    obj.label103:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label103, "fontStyle",  "italic");
    obj.label103:setWidth(200);
    obj.label103:setName("label103");

    obj.horzLine65 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine65:setParent(obj.flowPart190);
    obj.horzLine65:setAlign("bottom");
    obj.horzLine65:setStrokeColor("#FFFFFF50");
    obj.horzLine65:setStrokeSize(1);
    obj.horzLine65:setName("horzLine65");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.tabelaPontosBonus);
    obj.flowLayout10:setHeight(20);
    obj.flowLayout10:setMinWidth(150);
    obj.flowLayout10:setMaxWidth(200);
    obj.flowLayout10:setMaxControlsPerLine(3);
    obj.flowLayout10:setName("flowLayout10");

    obj.intimidacaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.intimidacaoMinus:setParent(obj.flowLayout10);
    obj.intimidacaoMinus:setName("intimidacaoMinus");
    obj.intimidacaoMinus:setText("-");
    obj.intimidacaoMinus:setWidth(20);
    obj.intimidacaoMinus:setHeight(20);

    obj.flowPart191 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart191:setParent(obj.flowLayout10);
    obj.flowPart191:setHeight(20);
    obj.flowPart191:setMinWidth(20);
    obj.flowPart191:setMaxWidth(20);
    obj.flowPart191:setName("flowPart191");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.flowPart191);
    obj.edit88:setAlign("client");
    obj.edit88:setField("intimidacao");
    obj.edit88:setFontSize(12);
    obj.edit88:setTransparent(true);
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setType("number");
    obj.edit88:setReadOnly(true);
    obj.edit88:setMin(0);
    obj.edit88:setName("edit88");

    obj.intimidacaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.intimidacaoPlus:setParent(obj.flowLayout10);
    obj.intimidacaoPlus:setName("intimidacaoPlus");
    obj.intimidacaoPlus:setText("+");
    obj.intimidacaoPlus:setWidth(20);
    obj.intimidacaoPlus:setHeight(20);

    obj.flowPart192 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart192:setParent(obj.tabelaPontosBonus);
    obj.flowPart192:setHeight(20);
    obj.flowPart192:setMinWidth(180);
    obj.flowPart192:setMaxWidth(180);
    obj.flowPart192:setName("flowPart192");
    obj.flowPart192:setMargins({top=5, bottom=5,right=10});

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.flowPart192);
    obj.label104:setText("Persuasão");
    obj.label104:setAlign("left");
    obj.label104:setFontSize(18);
    obj.label104:setVertTextAlign("center");
    obj.label104:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label104, "fontStyle",  "italic");
    obj.label104:setWidth(200);
    obj.label104:setName("label104");

    obj.horzLine66 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine66:setParent(obj.flowPart192);
    obj.horzLine66:setAlign("bottom");
    obj.horzLine66:setStrokeColor("#FFFFFF50");
    obj.horzLine66:setStrokeSize(1);
    obj.horzLine66:setName("horzLine66");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.tabelaPontosBonus);
    obj.flowLayout11:setHeight(20);
    obj.flowLayout11:setMinWidth(150);
    obj.flowLayout11:setMaxWidth(200);
    obj.flowLayout11:setMaxControlsPerLine(3);
    obj.flowLayout11:setName("flowLayout11");

    obj.persuasaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.persuasaoMinus:setParent(obj.flowLayout11);
    obj.persuasaoMinus:setName("persuasaoMinus");
    obj.persuasaoMinus:setText("-");
    obj.persuasaoMinus:setWidth(20);
    obj.persuasaoMinus:setHeight(20);

    obj.flowPart193 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart193:setParent(obj.flowLayout11);
    obj.flowPart193:setHeight(20);
    obj.flowPart193:setMinWidth(20);
    obj.flowPart193:setMaxWidth(20);
    obj.flowPart193:setName("flowPart193");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.flowPart193);
    obj.edit89:setAlign("client");
    obj.edit89:setField("persuasao");
    obj.edit89:setFontSize(12);
    obj.edit89:setTransparent(true);
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setType("number");
    obj.edit89:setReadOnly(true);
    obj.edit89:setMin(0);
    obj.edit89:setName("edit89");

    obj.persuasaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.persuasaoPlus:setParent(obj.flowLayout11);
    obj.persuasaoPlus:setName("persuasaoPlus");
    obj.persuasaoPlus:setText("+");
    obj.persuasaoPlus:setWidth(20);
    obj.persuasaoPlus:setHeight(20);

    obj.flowPart194 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart194:setParent(obj.tabelaPontosBonus);
    obj.flowPart194:setHeight(20);
    obj.flowPart194:setMinWidth(180);
    obj.flowPart194:setMaxWidth(180);
    obj.flowPart194:setName("flowPart194");
    obj.flowPart194:setMargins({top=5, bottom=5,right=10});

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.flowPart194);
    obj.label105:setText("Adestrar Animais");
    obj.label105:setAlign("left");
    obj.label105:setFontSize(18);
    obj.label105:setVertTextAlign("center");
    obj.label105:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label105, "fontStyle",  "italic");
    obj.label105:setWidth(200);
    obj.label105:setName("label105");

    obj.horzLine67 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine67:setParent(obj.flowPart194);
    obj.horzLine67:setAlign("bottom");
    obj.horzLine67:setStrokeColor("#FFFFFF50");
    obj.horzLine67:setStrokeSize(1);
    obj.horzLine67:setName("horzLine67");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.tabelaPontosBonus);
    obj.flowLayout12:setHeight(20);
    obj.flowLayout12:setMinWidth(150);
    obj.flowLayout12:setMaxWidth(200);
    obj.flowLayout12:setMaxControlsPerLine(3);
    obj.flowLayout12:setName("flowLayout12");

    obj.adestrarAnimaisMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.adestrarAnimaisMinus:setParent(obj.flowLayout12);
    obj.adestrarAnimaisMinus:setName("adestrarAnimaisMinus");
    obj.adestrarAnimaisMinus:setText("-");
    obj.adestrarAnimaisMinus:setWidth(20);
    obj.adestrarAnimaisMinus:setHeight(20);

    obj.flowPart195 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart195:setParent(obj.flowLayout12);
    obj.flowPart195:setHeight(20);
    obj.flowPart195:setMinWidth(20);
    obj.flowPart195:setMaxWidth(20);
    obj.flowPart195:setName("flowPart195");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.flowPart195);
    obj.edit90:setAlign("client");
    obj.edit90:setField("adestrarAnimais");
    obj.edit90:setFontSize(12);
    obj.edit90:setTransparent(true);
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setType("number");
    obj.edit90:setReadOnly(true);
    obj.edit90:setMin(0);
    obj.edit90:setName("edit90");

    obj.adestrarAnimaisPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.adestrarAnimaisPlus:setParent(obj.flowLayout12);
    obj.adestrarAnimaisPlus:setName("adestrarAnimaisPlus");
    obj.adestrarAnimaisPlus:setText("+");
    obj.adestrarAnimaisPlus:setWidth(20);
    obj.adestrarAnimaisPlus:setHeight(20);

    obj.flowPart196 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart196:setParent(obj.tabelaPontosBonus);
    obj.flowPart196:setHeight(20);
    obj.flowPart196:setMinWidth(180);
    obj.flowPart196:setMaxWidth(180);
    obj.flowPart196:setName("flowPart196");
    obj.flowPart196:setMargins({top=5, bottom=5,right=10});

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.flowPart196);
    obj.label106:setText("Furtividade");
    obj.label106:setAlign("left");
    obj.label106:setFontSize(18);
    obj.label106:setVertTextAlign("center");
    obj.label106:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label106, "fontStyle",  "italic");
    obj.label106:setWidth(200);
    obj.label106:setName("label106");

    obj.horzLine68 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine68:setParent(obj.flowPart196);
    obj.horzLine68:setAlign("bottom");
    obj.horzLine68:setStrokeColor("#FFFFFF50");
    obj.horzLine68:setStrokeSize(1);
    obj.horzLine68:setName("horzLine68");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.tabelaPontosBonus);
    obj.flowLayout13:setHeight(20);
    obj.flowLayout13:setMinWidth(150);
    obj.flowLayout13:setMaxWidth(200);
    obj.flowLayout13:setMaxControlsPerLine(3);
    obj.flowLayout13:setName("flowLayout13");

    obj.furtividadeMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.furtividadeMinus:setParent(obj.flowLayout13);
    obj.furtividadeMinus:setName("furtividadeMinus");
    obj.furtividadeMinus:setText("-");
    obj.furtividadeMinus:setWidth(20);
    obj.furtividadeMinus:setHeight(20);

    obj.flowPart197 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart197:setParent(obj.flowLayout13);
    obj.flowPart197:setHeight(20);
    obj.flowPart197:setMinWidth(20);
    obj.flowPart197:setMaxWidth(20);
    obj.flowPart197:setName("flowPart197");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.flowPart197);
    obj.edit91:setAlign("client");
    obj.edit91:setField("furtividade");
    obj.edit91:setFontSize(12);
    obj.edit91:setTransparent(true);
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setType("number");
    obj.edit91:setReadOnly(true);
    obj.edit91:setMin(0);
    obj.edit91:setName("edit91");

    obj.furtividadePlus = GUI.fromHandle(_obj_newObject("button"));
    obj.furtividadePlus:setParent(obj.flowLayout13);
    obj.furtividadePlus:setName("furtividadePlus");
    obj.furtividadePlus:setText("+");
    obj.furtividadePlus:setWidth(20);
    obj.furtividadePlus:setHeight(20);

    obj.flowPart198 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart198:setParent(obj.tabelaPontosBonus);
    obj.flowPart198:setHeight(20);
    obj.flowPart198:setMinWidth(180);
    obj.flowPart198:setMaxWidth(180);
    obj.flowPart198:setName("flowPart198");
    obj.flowPart198:setMargins({top=5, bottom=5,right=10});

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.flowPart198);
    obj.label107:setText("Intuição");
    obj.label107:setAlign("left");
    obj.label107:setFontSize(18);
    obj.label107:setVertTextAlign("center");
    obj.label107:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label107, "fontStyle",  "italic");
    obj.label107:setWidth(200);
    obj.label107:setName("label107");

    obj.horzLine69 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine69:setParent(obj.flowPart198);
    obj.horzLine69:setAlign("bottom");
    obj.horzLine69:setStrokeColor("#FFFFFF50");
    obj.horzLine69:setStrokeSize(1);
    obj.horzLine69:setName("horzLine69");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.tabelaPontosBonus);
    obj.flowLayout14:setHeight(20);
    obj.flowLayout14:setMinWidth(150);
    obj.flowLayout14:setMaxWidth(200);
    obj.flowLayout14:setMaxControlsPerLine(3);
    obj.flowLayout14:setName("flowLayout14");

    obj.intuicaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.intuicaoMinus:setParent(obj.flowLayout14);
    obj.intuicaoMinus:setName("intuicaoMinus");
    obj.intuicaoMinus:setText("-");
    obj.intuicaoMinus:setWidth(20);
    obj.intuicaoMinus:setHeight(20);

    obj.flowPart199 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart199:setParent(obj.flowLayout14);
    obj.flowPart199:setHeight(20);
    obj.flowPart199:setMinWidth(20);
    obj.flowPart199:setMaxWidth(20);
    obj.flowPart199:setName("flowPart199");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.flowPart199);
    obj.edit92:setAlign("client");
    obj.edit92:setField("intuicao");
    obj.edit92:setFontSize(12);
    obj.edit92:setTransparent(true);
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setType("number");
    obj.edit92:setReadOnly(true);
    obj.edit92:setMin(0);
    obj.edit92:setName("edit92");

    obj.intuicaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.intuicaoPlus:setParent(obj.flowLayout14);
    obj.intuicaoPlus:setName("intuicaoPlus");
    obj.intuicaoPlus:setText("+");
    obj.intuicaoPlus:setWidth(20);
    obj.intuicaoPlus:setHeight(20);

    obj.flowPart200 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart200:setParent(obj.tabelaPontosBonus);
    obj.flowPart200:setHeight(20);
    obj.flowPart200:setMinWidth(180);
    obj.flowPart200:setMaxWidth(180);
    obj.flowPart200:setName("flowPart200");
    obj.flowPart200:setMargins({top=5, bottom=5,right=10});

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.flowPart200);
    obj.label108:setText("Didática");
    obj.label108:setAlign("left");
    obj.label108:setFontSize(18);
    obj.label108:setVertTextAlign("center");
    obj.label108:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label108, "fontStyle",  "italic");
    obj.label108:setWidth(200);
    obj.label108:setName("label108");

    obj.horzLine70 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine70:setParent(obj.flowPart200);
    obj.horzLine70:setAlign("bottom");
    obj.horzLine70:setStrokeColor("#FFFFFF50");
    obj.horzLine70:setStrokeSize(1);
    obj.horzLine70:setName("horzLine70");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.tabelaPontosBonus);
    obj.flowLayout15:setHeight(20);
    obj.flowLayout15:setMinWidth(150);
    obj.flowLayout15:setMaxWidth(200);
    obj.flowLayout15:setMaxControlsPerLine(3);
    obj.flowLayout15:setName("flowLayout15");

    obj.didaticaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.didaticaMinus:setParent(obj.flowLayout15);
    obj.didaticaMinus:setName("didaticaMinus");
    obj.didaticaMinus:setText("-");
    obj.didaticaMinus:setWidth(20);
    obj.didaticaMinus:setHeight(20);

    obj.flowPart201 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart201:setParent(obj.flowLayout15);
    obj.flowPart201:setHeight(20);
    obj.flowPart201:setMinWidth(20);
    obj.flowPart201:setMaxWidth(20);
    obj.flowPart201:setName("flowPart201");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.flowPart201);
    obj.edit93:setAlign("client");
    obj.edit93:setField("didatica");
    obj.edit93:setFontSize(12);
    obj.edit93:setTransparent(true);
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setType("number");
    obj.edit93:setReadOnly(true);
    obj.edit93:setMin(0);
    obj.edit93:setName("edit93");

    obj.didaticaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.didaticaPlus:setParent(obj.flowLayout15);
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

    obj.flowPart202 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart202:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart202:setHeight(20);
    obj.flowPart202:setMinWidth(180);
    obj.flowPart202:setMaxWidth(180);
    obj.flowPart202:setName("flowPart202");
    obj.flowPart202:setMargins({top=5, bottom=5,right=10});

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.flowPart202);
    obj.label109:setText("Geografia");
    obj.label109:setAlign("left");
    obj.label109:setFontSize(18);
    obj.label109:setVertTextAlign("center");
    obj.label109:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label109, "fontStyle",  "italic");
    obj.label109:setWidth(200);
    obj.label109:setName("label109");

    obj.horzLine71 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine71:setParent(obj.flowPart202);
    obj.horzLine71:setAlign("bottom");
    obj.horzLine71:setStrokeColor("#FFFFFF50");
    obj.horzLine71:setStrokeSize(1);
    obj.horzLine71:setName("horzLine71");

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout16:setHeight(20);
    obj.flowLayout16:setMinWidth(150);
    obj.flowLayout16:setMaxWidth(200);
    obj.flowLayout16:setMaxControlsPerLine(3);
    obj.flowLayout16:setName("flowLayout16");

    obj.geografiaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.geografiaMinus:setParent(obj.flowLayout16);
    obj.geografiaMinus:setName("geografiaMinus");
    obj.geografiaMinus:setText("-");
    obj.geografiaMinus:setWidth(20);
    obj.geografiaMinus:setHeight(20);

    obj.flowPart203 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart203:setParent(obj.flowLayout16);
    obj.flowPart203:setHeight(20);
    obj.flowPart203:setMinWidth(20);
    obj.flowPart203:setMaxWidth(20);
    obj.flowPart203:setName("flowPart203");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.flowPart203);
    obj.edit94:setAlign("client");
    obj.edit94:setField("geografia");
    obj.edit94:setFontSize(12);
    obj.edit94:setTransparent(true);
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setType("number");
    obj.edit94:setReadOnly(true);
    obj.edit94:setMin(0);
    obj.edit94:setName("edit94");

    obj.geografiaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.geografiaPlus:setParent(obj.flowLayout16);
    obj.geografiaPlus:setName("geografiaPlus");
    obj.geografiaPlus:setText("+");
    obj.geografiaPlus:setWidth(20);
    obj.geografiaPlus:setHeight(20);

    obj.flowPart204 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart204:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart204:setHeight(20);
    obj.flowPart204:setMinWidth(180);
    obj.flowPart204:setMaxWidth(180);
    obj.flowPart204:setName("flowPart204");
    obj.flowPart204:setMargins({top=5, bottom=5,right=10});

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.flowPart204);
    obj.label110:setText("História");
    obj.label110:setAlign("left");
    obj.label110:setFontSize(18);
    obj.label110:setVertTextAlign("center");
    obj.label110:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label110, "fontStyle",  "italic");
    obj.label110:setWidth(200);
    obj.label110:setName("label110");

    obj.horzLine72 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine72:setParent(obj.flowPart204);
    obj.horzLine72:setAlign("bottom");
    obj.horzLine72:setStrokeColor("#FFFFFF50");
    obj.horzLine72:setStrokeSize(1);
    obj.horzLine72:setName("horzLine72");

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout17:setHeight(20);
    obj.flowLayout17:setMinWidth(150);
    obj.flowLayout17:setMaxWidth(200);
    obj.flowLayout17:setMaxControlsPerLine(3);
    obj.flowLayout17:setName("flowLayout17");

    obj.historiaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.historiaMinus:setParent(obj.flowLayout17);
    obj.historiaMinus:setName("historiaMinus");
    obj.historiaMinus:setText("-");
    obj.historiaMinus:setWidth(20);
    obj.historiaMinus:setHeight(20);

    obj.flowPart205 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart205:setParent(obj.flowLayout17);
    obj.flowPart205:setHeight(20);
    obj.flowPart205:setMinWidth(20);
    obj.flowPart205:setMaxWidth(20);
    obj.flowPart205:setName("flowPart205");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.flowPart205);
    obj.edit95:setAlign("client");
    obj.edit95:setField("historia");
    obj.edit95:setFontSize(12);
    obj.edit95:setTransparent(true);
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setType("number");
    obj.edit95:setReadOnly(true);
    obj.edit95:setMin(0);
    obj.edit95:setName("edit95");

    obj.historiaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.historiaPlus:setParent(obj.flowLayout17);
    obj.historiaPlus:setName("historiaPlus");
    obj.historiaPlus:setText("+");
    obj.historiaPlus:setWidth(20);
    obj.historiaPlus:setHeight(20);

    obj.flowPart206 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart206:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart206:setHeight(20);
    obj.flowPart206:setMinWidth(180);
    obj.flowPart206:setMaxWidth(180);
    obj.flowPart206:setName("flowPart206");
    obj.flowPart206:setMargins({top=5, bottom=5,right=10});

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.flowPart206);
    obj.label111:setText("Religião");
    obj.label111:setAlign("left");
    obj.label111:setFontSize(18);
    obj.label111:setVertTextAlign("center");
    obj.label111:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label111, "fontStyle",  "italic");
    obj.label111:setWidth(200);
    obj.label111:setName("label111");

    obj.horzLine73 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine73:setParent(obj.flowPart206);
    obj.horzLine73:setAlign("bottom");
    obj.horzLine73:setStrokeColor("#FFFFFF50");
    obj.horzLine73:setStrokeSize(1);
    obj.horzLine73:setName("horzLine73");

    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout18:setHeight(20);
    obj.flowLayout18:setMinWidth(150);
    obj.flowLayout18:setMaxWidth(200);
    obj.flowLayout18:setMaxControlsPerLine(3);
    obj.flowLayout18:setName("flowLayout18");

    obj.religiaoMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.religiaoMinus:setParent(obj.flowLayout18);
    obj.religiaoMinus:setName("religiaoMinus");
    obj.religiaoMinus:setText("-");
    obj.religiaoMinus:setWidth(20);
    obj.religiaoMinus:setHeight(20);

    obj.flowPart207 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart207:setParent(obj.flowLayout18);
    obj.flowPart207:setHeight(20);
    obj.flowPart207:setMinWidth(20);
    obj.flowPart207:setMaxWidth(20);
    obj.flowPart207:setName("flowPart207");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.flowPart207);
    obj.edit96:setAlign("client");
    obj.edit96:setField("religiao");
    obj.edit96:setFontSize(12);
    obj.edit96:setTransparent(true);
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setType("number");
    obj.edit96:setReadOnly(true);
    obj.edit96:setMin(0);
    obj.edit96:setName("edit96");

    obj.religiaoPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.religiaoPlus:setParent(obj.flowLayout18);
    obj.religiaoPlus:setName("religiaoPlus");
    obj.religiaoPlus:setText("+");
    obj.religiaoPlus:setWidth(20);
    obj.religiaoPlus:setHeight(20);

    obj.flowPart208 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart208:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart208:setHeight(20);
    obj.flowPart208:setMinWidth(180);
    obj.flowPart208:setMaxWidth(180);
    obj.flowPart208:setName("flowPart208");
    obj.flowPart208:setMargins({top=5, bottom=5,right=10});

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.flowPart208);
    obj.label112:setText("Magia");
    obj.label112:setAlign("left");
    obj.label112:setFontSize(18);
    obj.label112:setVertTextAlign("center");
    obj.label112:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label112, "fontStyle",  "italic");
    obj.label112:setWidth(200);
    obj.label112:setName("label112");

    obj.horzLine74 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine74:setParent(obj.flowPart208);
    obj.horzLine74:setAlign("bottom");
    obj.horzLine74:setStrokeColor("#FFFFFF50");
    obj.horzLine74:setStrokeSize(1);
    obj.horzLine74:setName("horzLine74");

    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout19:setHeight(20);
    obj.flowLayout19:setMinWidth(150);
    obj.flowLayout19:setMaxWidth(200);
    obj.flowLayout19:setMaxControlsPerLine(3);
    obj.flowLayout19:setName("flowLayout19");

    obj.magiaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.magiaMinus:setParent(obj.flowLayout19);
    obj.magiaMinus:setName("magiaMinus");
    obj.magiaMinus:setText("-");
    obj.magiaMinus:setWidth(20);
    obj.magiaMinus:setHeight(20);

    obj.flowPart209 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart209:setParent(obj.flowLayout19);
    obj.flowPart209:setHeight(20);
    obj.flowPart209:setMinWidth(20);
    obj.flowPart209:setMaxWidth(20);
    obj.flowPart209:setName("flowPart209");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.flowPart209);
    obj.edit97:setAlign("client");
    obj.edit97:setField("magia");
    obj.edit97:setFontSize(12);
    obj.edit97:setTransparent(true);
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setType("number");
    obj.edit97:setReadOnly(true);
    obj.edit97:setMin(0);
    obj.edit97:setName("edit97");

    obj.magiaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.magiaPlus:setParent(obj.flowLayout19);
    obj.magiaPlus:setName("magiaPlus");
    obj.magiaPlus:setText("+");
    obj.magiaPlus:setWidth(20);
    obj.magiaPlus:setHeight(20);

    obj.flowPart210 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart210:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart210:setHeight(20);
    obj.flowPart210:setMinWidth(180);
    obj.flowPart210:setMaxWidth(180);
    obj.flowPart210:setName("flowPart210");
    obj.flowPart210:setMargins({top=5, bottom=5,right=10});

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.flowPart210);
    obj.label113:setText("Fauna/Flora");
    obj.label113:setAlign("left");
    obj.label113:setFontSize(18);
    obj.label113:setVertTextAlign("center");
    obj.label113:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label113, "fontStyle",  "italic");
    obj.label113:setWidth(200);
    obj.label113:setName("label113");

    obj.horzLine75 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine75:setParent(obj.flowPart210);
    obj.horzLine75:setAlign("bottom");
    obj.horzLine75:setStrokeColor("#FFFFFF50");
    obj.horzLine75:setStrokeSize(1);
    obj.horzLine75:setName("horzLine75");

    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout20:setHeight(20);
    obj.flowLayout20:setMinWidth(150);
    obj.flowLayout20:setMaxWidth(200);
    obj.flowLayout20:setMaxControlsPerLine(3);
    obj.flowLayout20:setName("flowLayout20");

    obj.faunafloraMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.faunafloraMinus:setParent(obj.flowLayout20);
    obj.faunafloraMinus:setName("faunafloraMinus");
    obj.faunafloraMinus:setText("-");
    obj.faunafloraMinus:setWidth(20);
    obj.faunafloraMinus:setHeight(20);

    obj.flowPart211 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart211:setParent(obj.flowLayout20);
    obj.flowPart211:setHeight(20);
    obj.flowPart211:setMinWidth(20);
    obj.flowPart211:setMaxWidth(20);
    obj.flowPart211:setName("flowPart211");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.flowPart211);
    obj.edit98:setAlign("client");
    obj.edit98:setField("faunaflora");
    obj.edit98:setFontSize(12);
    obj.edit98:setTransparent(true);
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setType("number");
    obj.edit98:setReadOnly(true);
    obj.edit98:setMin(0);
    obj.edit98:setName("edit98");

    obj.faunafloraPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.faunafloraPlus:setParent(obj.flowLayout20);
    obj.faunafloraPlus:setName("faunafloraPlus");
    obj.faunafloraPlus:setText("+");
    obj.faunafloraPlus:setWidth(20);
    obj.faunafloraPlus:setHeight(20);

    obj.flowPart212 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart212:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart212:setHeight(20);
    obj.flowPart212:setMinWidth(180);
    obj.flowPart212:setMaxWidth(180);
    obj.flowPart212:setName("flowPart212");
    obj.flowPart212:setMargins({top=5, bottom=5,right=10});

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.flowPart212);
    obj.label114:setText("Lng. Comum");
    obj.label114:setAlign("left");
    obj.label114:setFontSize(18);
    obj.label114:setVertTextAlign("center");
    obj.label114:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label114, "fontStyle",  "italic");
    obj.label114:setWidth(200);
    obj.label114:setName("label114");

    obj.horzLine76 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine76:setParent(obj.flowPart212);
    obj.horzLine76:setAlign("bottom");
    obj.horzLine76:setStrokeColor("#FFFFFF50");
    obj.horzLine76:setStrokeSize(1);
    obj.horzLine76:setName("horzLine76");

    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout21:setHeight(20);
    obj.flowLayout21:setMinWidth(150);
    obj.flowLayout21:setMaxWidth(200);
    obj.flowLayout21:setMaxControlsPerLine(3);
    obj.flowLayout21:setName("flowLayout21");

    obj.linguagemComumMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemComumMinus:setParent(obj.flowLayout21);
    obj.linguagemComumMinus:setName("linguagemComumMinus");
    obj.linguagemComumMinus:setText("-");
    obj.linguagemComumMinus:setWidth(20);
    obj.linguagemComumMinus:setHeight(20);

    obj.flowPart213 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart213:setParent(obj.flowLayout21);
    obj.flowPart213:setHeight(20);
    obj.flowPart213:setMinWidth(20);
    obj.flowPart213:setMaxWidth(20);
    obj.flowPart213:setName("flowPart213");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.flowPart213);
    obj.edit99:setAlign("client");
    obj.edit99:setField("linguagemComum");
    obj.edit99:setFontSize(12);
    obj.edit99:setTransparent(true);
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setType("number");
    obj.edit99:setReadOnly(true);
    obj.edit99:setMin(0);
    obj.edit99:setName("edit99");

    obj.linguagemComumPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemComumPlus:setParent(obj.flowLayout21);
    obj.linguagemComumPlus:setName("linguagemComumPlus");
    obj.linguagemComumPlus:setText("+");
    obj.linguagemComumPlus:setWidth(20);
    obj.linguagemComumPlus:setHeight(20);

    obj.flowPart214 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart214:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart214:setHeight(20);
    obj.flowPart214:setMinWidth(180);
    obj.flowPart214:setMaxWidth(180);
    obj.flowPart214:setName("flowPart214");
    obj.flowPart214:setMargins({top=5, bottom=5,right=10});

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.flowPart214);
    obj.label115:setText("Lng. Oriental");
    obj.label115:setAlign("left");
    obj.label115:setFontSize(18);
    obj.label115:setVertTextAlign("center");
    obj.label115:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label115, "fontStyle",  "italic");
    obj.label115:setWidth(200);
    obj.label115:setName("label115");

    obj.horzLine77 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine77:setParent(obj.flowPart214);
    obj.horzLine77:setAlign("bottom");
    obj.horzLine77:setStrokeColor("#FFFFFF50");
    obj.horzLine77:setStrokeSize(1);
    obj.horzLine77:setName("horzLine77");

    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout22:setHeight(20);
    obj.flowLayout22:setMinWidth(150);
    obj.flowLayout22:setMaxWidth(200);
    obj.flowLayout22:setMaxControlsPerLine(3);
    obj.flowLayout22:setName("flowLayout22");

    obj.linguagemOrientalMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemOrientalMinus:setParent(obj.flowLayout22);
    obj.linguagemOrientalMinus:setName("linguagemOrientalMinus");
    obj.linguagemOrientalMinus:setText("-");
    obj.linguagemOrientalMinus:setWidth(20);
    obj.linguagemOrientalMinus:setHeight(20);

    obj.flowPart215 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart215:setParent(obj.flowLayout22);
    obj.flowPart215:setHeight(20);
    obj.flowPart215:setMinWidth(20);
    obj.flowPart215:setMaxWidth(20);
    obj.flowPart215:setName("flowPart215");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.flowPart215);
    obj.edit100:setAlign("client");
    obj.edit100:setField("linguagemOriental");
    obj.edit100:setFontSize(12);
    obj.edit100:setTransparent(true);
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setType("number");
    obj.edit100:setReadOnly(true);
    obj.edit100:setMin(0);
    obj.edit100:setName("edit100");

    obj.linguagemOrientalPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemOrientalPlus:setParent(obj.flowLayout22);
    obj.linguagemOrientalPlus:setName("linguagemOrientalPlus");
    obj.linguagemOrientalPlus:setText("+");
    obj.linguagemOrientalPlus:setWidth(20);
    obj.linguagemOrientalPlus:setHeight(20);

    obj.flowPart216 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart216:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart216:setHeight(20);
    obj.flowPart216:setMinWidth(180);
    obj.flowPart216:setMaxWidth(180);
    obj.flowPart216:setName("flowPart216");
    obj.flowPart216:setMargins({top=5, bottom=5,right=10});

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.flowPart216);
    obj.label116:setText("Lng. Élfica");
    obj.label116:setAlign("left");
    obj.label116:setFontSize(18);
    obj.label116:setVertTextAlign("center");
    obj.label116:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label116, "fontStyle",  "italic");
    obj.label116:setWidth(200);
    obj.label116:setName("label116");

    obj.horzLine78 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine78:setParent(obj.flowPart216);
    obj.horzLine78:setAlign("bottom");
    obj.horzLine78:setStrokeColor("#FFFFFF50");
    obj.horzLine78:setStrokeSize(1);
    obj.horzLine78:setName("horzLine78");

    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout23:setHeight(20);
    obj.flowLayout23:setMinWidth(150);
    obj.flowLayout23:setMaxWidth(200);
    obj.flowLayout23:setMaxControlsPerLine(3);
    obj.flowLayout23:setName("flowLayout23");

    obj.linguagemElficaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemElficaMinus:setParent(obj.flowLayout23);
    obj.linguagemElficaMinus:setName("linguagemElficaMinus");
    obj.linguagemElficaMinus:setText("-");
    obj.linguagemElficaMinus:setWidth(20);
    obj.linguagemElficaMinus:setHeight(20);

    obj.flowPart217 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart217:setParent(obj.flowLayout23);
    obj.flowPart217:setHeight(20);
    obj.flowPart217:setMinWidth(20);
    obj.flowPart217:setMaxWidth(20);
    obj.flowPart217:setName("flowPart217");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.flowPart217);
    obj.edit101:setAlign("client");
    obj.edit101:setField("linguagemElfica");
    obj.edit101:setFontSize(12);
    obj.edit101:setTransparent(true);
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setType("number");
    obj.edit101:setReadOnly(true);
    obj.edit101:setMin(0);
    obj.edit101:setName("edit101");

    obj.linguagemElficaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemElficaPlus:setParent(obj.flowLayout23);
    obj.linguagemElficaPlus:setName("linguagemElficaPlus");
    obj.linguagemElficaPlus:setText("+");
    obj.linguagemElficaPlus:setWidth(20);
    obj.linguagemElficaPlus:setHeight(20);

    obj.flowPart218 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart218:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart218:setHeight(20);
    obj.flowPart218:setMinWidth(180);
    obj.flowPart218:setMaxWidth(180);
    obj.flowPart218:setName("flowPart218");
    obj.flowPart218:setMargins({top=5, bottom=5,right=10});

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.flowPart218);
    obj.label117:setText("Lng. Anã");
    obj.label117:setAlign("left");
    obj.label117:setFontSize(18);
    obj.label117:setVertTextAlign("center");
    obj.label117:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label117, "fontStyle",  "italic");
    obj.label117:setWidth(200);
    obj.label117:setName("label117");

    obj.horzLine79 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine79:setParent(obj.flowPart218);
    obj.horzLine79:setAlign("bottom");
    obj.horzLine79:setStrokeColor("#FFFFFF50");
    obj.horzLine79:setStrokeSize(1);
    obj.horzLine79:setName("horzLine79");

    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout24:setHeight(20);
    obj.flowLayout24:setMinWidth(150);
    obj.flowLayout24:setMaxWidth(200);
    obj.flowLayout24:setMaxControlsPerLine(3);
    obj.flowLayout24:setName("flowLayout24");

    obj.linguagemAnaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemAnaMinus:setParent(obj.flowLayout24);
    obj.linguagemAnaMinus:setName("linguagemAnaMinus");
    obj.linguagemAnaMinus:setText("-");
    obj.linguagemAnaMinus:setWidth(20);
    obj.linguagemAnaMinus:setHeight(20);

    obj.flowPart219 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart219:setParent(obj.flowLayout24);
    obj.flowPart219:setHeight(20);
    obj.flowPart219:setMinWidth(20);
    obj.flowPart219:setMaxWidth(20);
    obj.flowPart219:setName("flowPart219");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.flowPart219);
    obj.edit102:setAlign("client");
    obj.edit102:setField("linguagemAna");
    obj.edit102:setFontSize(12);
    obj.edit102:setTransparent(true);
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setType("number");
    obj.edit102:setReadOnly(true);
    obj.edit102:setMin(0);
    obj.edit102:setName("edit102");

    obj.linguagemAnaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemAnaPlus:setParent(obj.flowLayout24);
    obj.linguagemAnaPlus:setName("linguagemAnaPlus");
    obj.linguagemAnaPlus:setText("+");
    obj.linguagemAnaPlus:setWidth(20);
    obj.linguagemAnaPlus:setHeight(20);

    obj.flowPart220 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart220:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowPart220:setHeight(20);
    obj.flowPart220:setMinWidth(180);
    obj.flowPart220:setMaxWidth(180);
    obj.flowPart220:setName("flowPart220");
    obj.flowPart220:setMargins({top=5, bottom=5,right=10});

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.flowPart220);
    obj.label118:setText("Lng. Dracônica");
    obj.label118:setAlign("left");
    obj.label118:setFontSize(18);
    obj.label118:setVertTextAlign("center");
    obj.label118:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label118, "fontStyle",  "italic");
    obj.label118:setWidth(200);
    obj.label118:setName("label118");

    obj.horzLine80 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine80:setParent(obj.flowPart220);
    obj.horzLine80:setAlign("bottom");
    obj.horzLine80:setStrokeColor("#FFFFFF50");
    obj.horzLine80:setStrokeSize(1);
    obj.horzLine80:setName("horzLine80");

    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.tabelaConhecimentosEspecificos);
    obj.flowLayout25:setHeight(20);
    obj.flowLayout25:setMinWidth(150);
    obj.flowLayout25:setMaxWidth(200);
    obj.flowLayout25:setMaxControlsPerLine(3);
    obj.flowLayout25:setName("flowLayout25");

    obj.linguagemDraconicaMinus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemDraconicaMinus:setParent(obj.flowLayout25);
    obj.linguagemDraconicaMinus:setName("linguagemDraconicaMinus");
    obj.linguagemDraconicaMinus:setText("-");
    obj.linguagemDraconicaMinus:setWidth(20);
    obj.linguagemDraconicaMinus:setHeight(20);

    obj.flowPart221 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart221:setParent(obj.flowLayout25);
    obj.flowPart221:setHeight(20);
    obj.flowPart221:setMinWidth(20);
    obj.flowPart221:setMaxWidth(20);
    obj.flowPart221:setName("flowPart221");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.flowPart221);
    obj.edit103:setAlign("client");
    obj.edit103:setField("linguagemDraconica");
    obj.edit103:setFontSize(12);
    obj.edit103:setTransparent(true);
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setType("number");
    obj.edit103:setReadOnly(true);
    obj.edit103:setMin(0);
    obj.edit103:setName("edit103");

    obj.linguagemDraconicaPlus = GUI.fromHandle(_obj_newObject("button"));
    obj.linguagemDraconicaPlus:setParent(obj.flowLayout25);
    obj.linguagemDraconicaPlus:setName("linguagemDraconicaPlus");
    obj.linguagemDraconicaPlus:setText("+");
    obj.linguagemDraconicaPlus:setWidth(20);
    obj.linguagemDraconicaPlus:setHeight(20);

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle1);
    obj.dataLink12:setFields({'percepcao', 'intimidacao', 'persuasao', 'adestrarAnimais', 'furtividade', 'intuicao', 'didatica',
                       'geografia', 'historia', 'religiao', 'magia', 'faunaflora', 'linguagemComum', 'linguagemOriental', 'linguagemElfica',
                       'linguagemAna', 'linguagemDraconica', 'pontosRestantes', 'pontosTreinados', 'pontosDeConhecimento',
                       'pontosDeConhecimentoDistribuidos', 'destrezaDisponivel', 'dexTotal', 'atributoAcerto', 'atributoMira',
                       'atributoEsquiva', 'atributoBloqueio','xpAtualClasse', 'xpMaxClasse','xpTextoClasse', 'nivelClasse', 'xpAtualProfissao',
                       'xpMaxProfissao', 'xpTextoProfissao', 'nivelProfissao', 'intBase'});
    obj.dataLink12:setName("dataLink12");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pgcPrincipal);
    obj.tab2:setTitle("Habilidades");
    obj.tab2:setName("tab2");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.tab2);
    obj.rectangle7:setName("rectangle7");
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("#40000000");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle7);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.habilidadesLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.habilidadesLayout:setParent(obj.scrollBox2);
    obj.habilidadesLayout:setName("habilidadesLayout");
    obj.habilidadesLayout:setAlign("top");
    obj.habilidadesLayout:setHeight(800);
    obj.habilidadesLayout:setMargins({left=10, right=10, top=10});
    obj.habilidadesLayout:setAutoHeight(true);
    obj.habilidadesLayout:setHorzAlign("center");
    obj.habilidadesLayout:setLineSpacing(2);
    obj.habilidadesLayout:setMaxWidth(1600);
    obj.habilidadesLayout:setOrientation("vertical");
    obj.habilidadesLayout:setMaxColumns(3);
    obj.habilidadesLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.habilidadesLayout:setMinScaledWidth(300);

    obj.flowLayout26 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.habilidadesLayout);
    obj.flowLayout26:setAlign("top");
    obj.flowLayout26:setAutoHeight(true);
    obj.flowLayout26:setMaxControlsPerLine(1);
    obj.flowLayout26:setHorzAlign("center");
    obj.flowLayout26:setMaxWidth(406);
    obj.flowLayout26:setName("flowLayout26");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowLayout26);
    obj.rectangle8:setCornerType("bevel");
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(20);
    obj.rectangle8:setHeight(40);
    obj.rectangle8:setWidth(400);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("silver");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setName("rectangle8");

    obj.flowLayout27 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.rectangle8);
    obj.flowLayout27:setWidth(400);
    obj.flowLayout27:setHeight(40);
    obj.flowLayout27:setMaxControlsPerLine(1);
    obj.flowLayout27:setHorzAlign("center");
    obj.flowLayout27:setName("flowLayout27");

    obj.flowPart222 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart222:setParent(obj.flowLayout27);
    obj.flowPart222:setHeight(20);
    obj.flowPart222:setWidth(150);
    obj.flowPart222:setVertAlign("center");
    obj.flowPart222:setAlign("client");
    obj.flowPart222:setMargins({top=10});
    obj.flowPart222:setName("flowPart222");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.flowPart222);
    obj.label119:setText("Habilidades Base");
    obj.label119:setFontSize(18);
    lfm_setPropAsString(obj.label119, "fontStyle",  "italic bold");
    obj.label119:setAlign("client");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.horzLine81 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine81:setParent(obj.flowPart222);
    obj.horzLine81:setAlign("bottom");
    obj.horzLine81:setStrokeSize(1);
    obj.horzLine81:setStrokeColor("silver");
    obj.horzLine81:setName("horzLine81");

    obj.flowPart223 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart223:setParent(obj.rectangle8);
    obj.flowPart223:setWidth(16);
    obj.flowPart223:setHeight(20);
    obj.flowPart223:setLeft(375);
    obj.flowPart223:setTop(10);
    obj.flowPart223:setName("flowPart223");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowPart223);
    obj.button4:setAlign("client");
    obj.button4:setHeight(16);
    obj.button4:setText("+");
    obj.button4:setWidth(16);
    obj.button4:setHorzTextAlign("center");
    obj.button4:setName("button4");

    obj.rclHabilidadesbase = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesbase:setParent(obj.flowLayout26);
    obj.rclHabilidadesbase:setName("rclHabilidadesbase");
    obj.rclHabilidadesbase:setField("habilidadesbase");
    obj.rclHabilidadesbase:setTemplateForm("habilidadercl");
    obj.rclHabilidadesbase:setAlign("client");
    obj.rclHabilidadesbase:setMinHeight(70);
    obj.rclHabilidadesbase:setWidth(400);
    obj.rclHabilidadesbase:setAutoHeight(true);
    obj.rclHabilidadesbase:setHitTest(false);

    obj.flowLayout28 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout28:setParent(obj.habilidadesLayout);
    obj.flowLayout28:setAlign("top");
    obj.flowLayout28:setAutoHeight(true);
    obj.flowLayout28:setMaxControlsPerLine(1);
    obj.flowLayout28:setHorzAlign("center");
    obj.flowLayout28:setMaxWidth(406);
    obj.flowLayout28:setName("flowLayout28");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.flowLayout28);
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setXradius(10);
    obj.rectangle9:setYradius(20);
    obj.rectangle9:setHeight(40);
    obj.rectangle9:setWidth(400);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("silver");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setName("rectangle9");

    obj.flowLayout29 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout29:setParent(obj.rectangle9);
    obj.flowLayout29:setWidth(400);
    obj.flowLayout29:setHeight(40);
    obj.flowLayout29:setMaxControlsPerLine(1);
    obj.flowLayout29:setHorzAlign("center");
    obj.flowLayout29:setName("flowLayout29");

    obj.flowPart224 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart224:setParent(obj.flowLayout29);
    obj.flowPart224:setHeight(20);
    obj.flowPart224:setWidth(75);
    obj.flowPart224:setVertAlign("center");
    obj.flowPart224:setAlign("client");
    obj.flowPart224:setMargins({top=10});
    obj.flowPart224:setName("flowPart224");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.flowPart224);
    obj.label120:setText("Nível 1");
    obj.label120:setFontSize(18);
    lfm_setPropAsString(obj.label120, "fontStyle",  "italic bold");
    obj.label120:setAlign("client");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.horzLine82 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine82:setParent(obj.flowPart224);
    obj.horzLine82:setAlign("bottom");
    obj.horzLine82:setStrokeSize(1);
    obj.horzLine82:setStrokeColor("silver");
    obj.horzLine82:setName("horzLine82");

    obj.flowPart225 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart225:setParent(obj.rectangle9);
    obj.flowPart225:setWidth(16);
    obj.flowPart225:setHeight(20);
    obj.flowPart225:setLeft(375);
    obj.flowPart225:setTop(10);
    obj.flowPart225:setName("flowPart225");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowPart225);
    obj.button5:setAlign("client");
    obj.button5:setHeight(16);
    obj.button5:setText("+");
    obj.button5:setWidth(16);
    obj.button5:setHorzTextAlign("center");
    obj.button5:setName("button5");

    obj.rclHabilidadesnivel1 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel1:setParent(obj.flowLayout28);
    obj.rclHabilidadesnivel1:setName("rclHabilidadesnivel1");
    obj.rclHabilidadesnivel1:setField("habilidadesnivel1");
    obj.rclHabilidadesnivel1:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel1:setAlign("client");
    obj.rclHabilidadesnivel1:setMinHeight(70);
    obj.rclHabilidadesnivel1:setWidth(400);
    obj.rclHabilidadesnivel1:setAutoHeight(true);
    obj.rclHabilidadesnivel1:setHitTest(false);

    obj.flowLayout30 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout30:setParent(obj.habilidadesLayout);
    obj.flowLayout30:setAlign("top");
    obj.flowLayout30:setAutoHeight(true);
    obj.flowLayout30:setMaxControlsPerLine(1);
    obj.flowLayout30:setHorzAlign("center");
    obj.flowLayout30:setMaxWidth(406);
    obj.flowLayout30:setName("flowLayout30");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.flowLayout30);
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(20);
    obj.rectangle10:setHeight(40);
    obj.rectangle10:setWidth(400);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("silver");
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setName("rectangle10");

    obj.flowLayout31 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout31:setParent(obj.rectangle10);
    obj.flowLayout31:setWidth(400);
    obj.flowLayout31:setHeight(40);
    obj.flowLayout31:setMaxControlsPerLine(1);
    obj.flowLayout31:setHorzAlign("center");
    obj.flowLayout31:setName("flowLayout31");

    obj.flowPart226 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart226:setParent(obj.flowLayout31);
    obj.flowPart226:setHeight(20);
    obj.flowPart226:setWidth(75);
    obj.flowPart226:setVertAlign("center");
    obj.flowPart226:setAlign("client");
    obj.flowPart226:setMargins({top=10});
    obj.flowPart226:setName("flowPart226");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.flowPart226);
    obj.label121:setText("Nível 2");
    obj.label121:setFontSize(18);
    lfm_setPropAsString(obj.label121, "fontStyle",  "italic bold");
    obj.label121:setAlign("client");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.horzLine83 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine83:setParent(obj.flowPart226);
    obj.horzLine83:setAlign("bottom");
    obj.horzLine83:setStrokeSize(1);
    obj.horzLine83:setStrokeColor("silver");
    obj.horzLine83:setName("horzLine83");

    obj.flowPart227 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart227:setParent(obj.rectangle10);
    obj.flowPart227:setWidth(16);
    obj.flowPart227:setHeight(20);
    obj.flowPart227:setLeft(375);
    obj.flowPart227:setTop(10);
    obj.flowPart227:setName("flowPart227");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowPart227);
    obj.button6:setAlign("client");
    obj.button6:setHeight(16);
    obj.button6:setText("+");
    obj.button6:setWidth(16);
    obj.button6:setHorzTextAlign("center");
    obj.button6:setName("button6");

    obj.rclHabilidadesnivel2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel2:setParent(obj.flowLayout30);
    obj.rclHabilidadesnivel2:setName("rclHabilidadesnivel2");
    obj.rclHabilidadesnivel2:setField("habilidadesnivel2");
    obj.rclHabilidadesnivel2:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel2:setAlign("client");
    obj.rclHabilidadesnivel2:setMinHeight(70);
    obj.rclHabilidadesnivel2:setWidth(400);
    obj.rclHabilidadesnivel2:setAutoHeight(true);
    obj.rclHabilidadesnivel2:setHitTest(false);

    obj.flowLayout32 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout32:setParent(obj.habilidadesLayout);
    obj.flowLayout32:setAlign("top");
    obj.flowLayout32:setAutoHeight(true);
    obj.flowLayout32:setMaxControlsPerLine(1);
    obj.flowLayout32:setHorzAlign("center");
    obj.flowLayout32:setMaxWidth(406);
    obj.flowLayout32:setName("flowLayout32");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.flowLayout32);
    obj.rectangle11:setCornerType("bevel");
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(20);
    obj.rectangle11:setHeight(40);
    obj.rectangle11:setWidth(400);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("silver");
    obj.rectangle11:setStrokeSize(2);
    obj.rectangle11:setName("rectangle11");

    obj.flowLayout33 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout33:setParent(obj.rectangle11);
    obj.flowLayout33:setWidth(400);
    obj.flowLayout33:setHeight(40);
    obj.flowLayout33:setMaxControlsPerLine(1);
    obj.flowLayout33:setHorzAlign("center");
    obj.flowLayout33:setName("flowLayout33");

    obj.flowPart228 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart228:setParent(obj.flowLayout33);
    obj.flowPart228:setHeight(20);
    obj.flowPart228:setWidth(75);
    obj.flowPart228:setVertAlign("center");
    obj.flowPart228:setAlign("client");
    obj.flowPart228:setMargins({top=10});
    obj.flowPart228:setName("flowPart228");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.flowPart228);
    obj.label122:setText("Nível 3");
    obj.label122:setFontSize(18);
    lfm_setPropAsString(obj.label122, "fontStyle",  "italic bold");
    obj.label122:setAlign("client");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.horzLine84 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine84:setParent(obj.flowPart228);
    obj.horzLine84:setAlign("bottom");
    obj.horzLine84:setStrokeSize(1);
    obj.horzLine84:setStrokeColor("silver");
    obj.horzLine84:setName("horzLine84");

    obj.flowPart229 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart229:setParent(obj.rectangle11);
    obj.flowPart229:setWidth(16);
    obj.flowPart229:setHeight(20);
    obj.flowPart229:setLeft(375);
    obj.flowPart229:setTop(10);
    obj.flowPart229:setName("flowPart229");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowPart229);
    obj.button7:setAlign("client");
    obj.button7:setHeight(16);
    obj.button7:setText("+");
    obj.button7:setWidth(16);
    obj.button7:setHorzTextAlign("center");
    obj.button7:setName("button7");

    obj.rclHabilidadesnivel3 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel3:setParent(obj.flowLayout32);
    obj.rclHabilidadesnivel3:setName("rclHabilidadesnivel3");
    obj.rclHabilidadesnivel3:setField("habilidadesnivel3");
    obj.rclHabilidadesnivel3:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel3:setAlign("client");
    obj.rclHabilidadesnivel3:setMinHeight(70);
    obj.rclHabilidadesnivel3:setWidth(400);
    obj.rclHabilidadesnivel3:setAutoHeight(true);
    obj.rclHabilidadesnivel3:setHitTest(false);

    obj.flowLayout34 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout34:setParent(obj.habilidadesLayout);
    obj.flowLayout34:setAlign("top");
    obj.flowLayout34:setAutoHeight(true);
    obj.flowLayout34:setMaxControlsPerLine(1);
    obj.flowLayout34:setHorzAlign("center");
    obj.flowLayout34:setMaxWidth(406);
    obj.flowLayout34:setName("flowLayout34");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.flowLayout34);
    obj.rectangle12:setCornerType("bevel");
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setXradius(10);
    obj.rectangle12:setYradius(20);
    obj.rectangle12:setHeight(40);
    obj.rectangle12:setWidth(400);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("silver");
    obj.rectangle12:setStrokeSize(2);
    obj.rectangle12:setName("rectangle12");

    obj.flowLayout35 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout35:setParent(obj.rectangle12);
    obj.flowLayout35:setWidth(400);
    obj.flowLayout35:setHeight(40);
    obj.flowLayout35:setMaxControlsPerLine(1);
    obj.flowLayout35:setHorzAlign("center");
    obj.flowLayout35:setName("flowLayout35");

    obj.flowPart230 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart230:setParent(obj.flowLayout35);
    obj.flowPart230:setHeight(20);
    obj.flowPart230:setWidth(75);
    obj.flowPart230:setVertAlign("center");
    obj.flowPart230:setAlign("client");
    obj.flowPart230:setMargins({top=10});
    obj.flowPart230:setName("flowPart230");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.flowPart230);
    obj.label123:setText("Nível 4");
    obj.label123:setFontSize(18);
    lfm_setPropAsString(obj.label123, "fontStyle",  "italic bold");
    obj.label123:setAlign("client");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.horzLine85 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine85:setParent(obj.flowPart230);
    obj.horzLine85:setAlign("bottom");
    obj.horzLine85:setStrokeSize(1);
    obj.horzLine85:setStrokeColor("silver");
    obj.horzLine85:setName("horzLine85");

    obj.flowPart231 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart231:setParent(obj.rectangle12);
    obj.flowPart231:setWidth(16);
    obj.flowPart231:setHeight(20);
    obj.flowPart231:setLeft(375);
    obj.flowPart231:setTop(10);
    obj.flowPart231:setName("flowPart231");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.flowPart231);
    obj.button8:setAlign("client");
    obj.button8:setHeight(16);
    obj.button8:setText("+");
    obj.button8:setWidth(16);
    obj.button8:setHorzTextAlign("center");
    obj.button8:setName("button8");

    obj.rclHabilidadesnivel4 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel4:setParent(obj.flowLayout34);
    obj.rclHabilidadesnivel4:setName("rclHabilidadesnivel4");
    obj.rclHabilidadesnivel4:setField("habilidadesnivel4");
    obj.rclHabilidadesnivel4:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel4:setAlign("client");
    obj.rclHabilidadesnivel4:setMinHeight(70);
    obj.rclHabilidadesnivel4:setWidth(400);
    obj.rclHabilidadesnivel4:setAutoHeight(true);
    obj.rclHabilidadesnivel4:setHitTest(false);

    obj.flowLayout36 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout36:setParent(obj.habilidadesLayout);
    obj.flowLayout36:setAlign("top");
    obj.flowLayout36:setAutoHeight(true);
    obj.flowLayout36:setMaxControlsPerLine(1);
    obj.flowLayout36:setHorzAlign("center");
    obj.flowLayout36:setMaxWidth(406);
    obj.flowLayout36:setName("flowLayout36");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.flowLayout36);
    obj.rectangle13:setCornerType("bevel");
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setXradius(10);
    obj.rectangle13:setYradius(20);
    obj.rectangle13:setHeight(40);
    obj.rectangle13:setWidth(400);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("silver");
    obj.rectangle13:setStrokeSize(2);
    obj.rectangle13:setName("rectangle13");

    obj.flowLayout37 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout37:setParent(obj.rectangle13);
    obj.flowLayout37:setWidth(400);
    obj.flowLayout37:setHeight(40);
    obj.flowLayout37:setMaxControlsPerLine(1);
    obj.flowLayout37:setHorzAlign("center");
    obj.flowLayout37:setName("flowLayout37");

    obj.flowPart232 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart232:setParent(obj.flowLayout37);
    obj.flowPart232:setHeight(20);
    obj.flowPart232:setWidth(75);
    obj.flowPart232:setVertAlign("center");
    obj.flowPart232:setAlign("client");
    obj.flowPart232:setMargins({top=10});
    obj.flowPart232:setName("flowPart232");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.flowPart232);
    obj.label124:setText("Nível 5");
    obj.label124:setFontSize(18);
    lfm_setPropAsString(obj.label124, "fontStyle",  "italic bold");
    obj.label124:setAlign("client");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.horzLine86 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine86:setParent(obj.flowPart232);
    obj.horzLine86:setAlign("bottom");
    obj.horzLine86:setStrokeSize(1);
    obj.horzLine86:setStrokeColor("silver");
    obj.horzLine86:setName("horzLine86");

    obj.flowPart233 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart233:setParent(obj.rectangle13);
    obj.flowPart233:setWidth(16);
    obj.flowPart233:setHeight(20);
    obj.flowPart233:setLeft(375);
    obj.flowPart233:setTop(10);
    obj.flowPart233:setName("flowPart233");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.flowPart233);
    obj.button9:setAlign("client");
    obj.button9:setHeight(16);
    obj.button9:setText("+");
    obj.button9:setWidth(16);
    obj.button9:setHorzTextAlign("center");
    obj.button9:setName("button9");

    obj.rclHabilidadesnivel5 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel5:setParent(obj.flowLayout36);
    obj.rclHabilidadesnivel5:setName("rclHabilidadesnivel5");
    obj.rclHabilidadesnivel5:setField("habilidadesnivel5");
    obj.rclHabilidadesnivel5:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel5:setAlign("client");
    obj.rclHabilidadesnivel5:setMinHeight(70);
    obj.rclHabilidadesnivel5:setWidth(400);
    obj.rclHabilidadesnivel5:setAutoHeight(true);
    obj.rclHabilidadesnivel5:setHitTest(false);

    obj.flowLayout38 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout38:setParent(obj.habilidadesLayout);
    obj.flowLayout38:setAlign("top");
    obj.flowLayout38:setAutoHeight(true);
    obj.flowLayout38:setMaxControlsPerLine(1);
    obj.flowLayout38:setHorzAlign("center");
    obj.flowLayout38:setMaxWidth(406);
    obj.flowLayout38:setName("flowLayout38");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.flowLayout38);
    obj.rectangle14:setCornerType("bevel");
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setXradius(10);
    obj.rectangle14:setYradius(20);
    obj.rectangle14:setHeight(40);
    obj.rectangle14:setWidth(400);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("silver");
    obj.rectangle14:setStrokeSize(2);
    obj.rectangle14:setName("rectangle14");

    obj.flowLayout39 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout39:setParent(obj.rectangle14);
    obj.flowLayout39:setWidth(400);
    obj.flowLayout39:setHeight(40);
    obj.flowLayout39:setMaxControlsPerLine(1);
    obj.flowLayout39:setHorzAlign("center");
    obj.flowLayout39:setName("flowLayout39");

    obj.flowPart234 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart234:setParent(obj.flowLayout39);
    obj.flowPart234:setHeight(20);
    obj.flowPart234:setWidth(75);
    obj.flowPart234:setVertAlign("center");
    obj.flowPart234:setAlign("client");
    obj.flowPart234:setMargins({top=10});
    obj.flowPart234:setName("flowPart234");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.flowPart234);
    obj.label125:setText("Nível 6");
    obj.label125:setFontSize(18);
    lfm_setPropAsString(obj.label125, "fontStyle",  "italic bold");
    obj.label125:setAlign("client");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.horzLine87 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine87:setParent(obj.flowPart234);
    obj.horzLine87:setAlign("bottom");
    obj.horzLine87:setStrokeSize(1);
    obj.horzLine87:setStrokeColor("silver");
    obj.horzLine87:setName("horzLine87");

    obj.flowPart235 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart235:setParent(obj.rectangle14);
    obj.flowPart235:setWidth(16);
    obj.flowPart235:setHeight(20);
    obj.flowPart235:setLeft(375);
    obj.flowPart235:setTop(10);
    obj.flowPart235:setName("flowPart235");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.flowPart235);
    obj.button10:setAlign("client");
    obj.button10:setHeight(16);
    obj.button10:setText("+");
    obj.button10:setWidth(16);
    obj.button10:setHorzTextAlign("center");
    obj.button10:setName("button10");

    obj.rclHabilidadesnivel6 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel6:setParent(obj.flowLayout38);
    obj.rclHabilidadesnivel6:setName("rclHabilidadesnivel6");
    obj.rclHabilidadesnivel6:setField("habilidadesnivel6");
    obj.rclHabilidadesnivel6:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel6:setAlign("client");
    obj.rclHabilidadesnivel6:setMinHeight(70);
    obj.rclHabilidadesnivel6:setWidth(400);
    obj.rclHabilidadesnivel6:setAutoHeight(true);
    obj.rclHabilidadesnivel6:setHitTest(false);

    obj.flowLayout40 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout40:setParent(obj.habilidadesLayout);
    obj.flowLayout40:setAlign("top");
    obj.flowLayout40:setAutoHeight(true);
    obj.flowLayout40:setMaxControlsPerLine(1);
    obj.flowLayout40:setHorzAlign("center");
    obj.flowLayout40:setMaxWidth(406);
    obj.flowLayout40:setName("flowLayout40");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.flowLayout40);
    obj.rectangle15:setCornerType("bevel");
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setXradius(10);
    obj.rectangle15:setYradius(20);
    obj.rectangle15:setHeight(40);
    obj.rectangle15:setWidth(400);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("silver");
    obj.rectangle15:setStrokeSize(2);
    obj.rectangle15:setName("rectangle15");

    obj.flowLayout41 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout41:setParent(obj.rectangle15);
    obj.flowLayout41:setWidth(400);
    obj.flowLayout41:setHeight(40);
    obj.flowLayout41:setMaxControlsPerLine(1);
    obj.flowLayout41:setHorzAlign("center");
    obj.flowLayout41:setName("flowLayout41");

    obj.flowPart236 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart236:setParent(obj.flowLayout41);
    obj.flowPart236:setHeight(20);
    obj.flowPart236:setWidth(75);
    obj.flowPart236:setVertAlign("center");
    obj.flowPart236:setAlign("client");
    obj.flowPart236:setMargins({top=10});
    obj.flowPart236:setName("flowPart236");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.flowPart236);
    obj.label126:setText("Nível 7");
    obj.label126:setFontSize(18);
    lfm_setPropAsString(obj.label126, "fontStyle",  "italic bold");
    obj.label126:setAlign("client");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.horzLine88 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine88:setParent(obj.flowPart236);
    obj.horzLine88:setAlign("bottom");
    obj.horzLine88:setStrokeSize(1);
    obj.horzLine88:setStrokeColor("silver");
    obj.horzLine88:setName("horzLine88");

    obj.flowPart237 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart237:setParent(obj.rectangle15);
    obj.flowPart237:setWidth(16);
    obj.flowPart237:setHeight(20);
    obj.flowPart237:setLeft(375);
    obj.flowPart237:setTop(10);
    obj.flowPart237:setName("flowPart237");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.flowPart237);
    obj.button11:setAlign("client");
    obj.button11:setHeight(16);
    obj.button11:setText("+");
    obj.button11:setWidth(16);
    obj.button11:setHorzTextAlign("center");
    obj.button11:setName("button11");

    obj.rclHabilidadesnivel7 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel7:setParent(obj.flowLayout40);
    obj.rclHabilidadesnivel7:setName("rclHabilidadesnivel7");
    obj.rclHabilidadesnivel7:setField("habilidadesnivel7");
    obj.rclHabilidadesnivel7:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel7:setAlign("client");
    obj.rclHabilidadesnivel7:setMinHeight(70);
    obj.rclHabilidadesnivel7:setWidth(400);
    obj.rclHabilidadesnivel7:setAutoHeight(true);
    obj.rclHabilidadesnivel7:setHitTest(false);

    obj.flowLayout42 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout42:setParent(obj.habilidadesLayout);
    obj.flowLayout42:setAlign("top");
    obj.flowLayout42:setAutoHeight(true);
    obj.flowLayout42:setMaxControlsPerLine(1);
    obj.flowLayout42:setHorzAlign("center");
    obj.flowLayout42:setMaxWidth(406);
    obj.flowLayout42:setName("flowLayout42");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.flowLayout42);
    obj.rectangle16:setCornerType("bevel");
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setXradius(10);
    obj.rectangle16:setYradius(20);
    obj.rectangle16:setHeight(40);
    obj.rectangle16:setWidth(400);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("silver");
    obj.rectangle16:setStrokeSize(2);
    obj.rectangle16:setName("rectangle16");

    obj.flowLayout43 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout43:setParent(obj.rectangle16);
    obj.flowLayout43:setWidth(400);
    obj.flowLayout43:setHeight(40);
    obj.flowLayout43:setMaxControlsPerLine(1);
    obj.flowLayout43:setHorzAlign("center");
    obj.flowLayout43:setName("flowLayout43");

    obj.flowPart238 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart238:setParent(obj.flowLayout43);
    obj.flowPart238:setHeight(20);
    obj.flowPart238:setWidth(75);
    obj.flowPart238:setVertAlign("center");
    obj.flowPart238:setAlign("client");
    obj.flowPart238:setMargins({top=10});
    obj.flowPart238:setName("flowPart238");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.flowPart238);
    obj.label127:setText("Nível 8");
    obj.label127:setFontSize(18);
    lfm_setPropAsString(obj.label127, "fontStyle",  "italic bold");
    obj.label127:setAlign("client");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.horzLine89 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine89:setParent(obj.flowPart238);
    obj.horzLine89:setAlign("bottom");
    obj.horzLine89:setStrokeSize(1);
    obj.horzLine89:setStrokeColor("silver");
    obj.horzLine89:setName("horzLine89");

    obj.flowPart239 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart239:setParent(obj.rectangle16);
    obj.flowPart239:setWidth(16);
    obj.flowPart239:setHeight(20);
    obj.flowPart239:setLeft(375);
    obj.flowPart239:setTop(10);
    obj.flowPart239:setName("flowPart239");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.flowPart239);
    obj.button12:setAlign("client");
    obj.button12:setHeight(16);
    obj.button12:setText("+");
    obj.button12:setWidth(16);
    obj.button12:setHorzTextAlign("center");
    obj.button12:setName("button12");

    obj.rclHabilidadesnivel8 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel8:setParent(obj.flowLayout42);
    obj.rclHabilidadesnivel8:setName("rclHabilidadesnivel8");
    obj.rclHabilidadesnivel8:setField("habilidadesnivel8");
    obj.rclHabilidadesnivel8:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel8:setAlign("client");
    obj.rclHabilidadesnivel8:setMinHeight(70);
    obj.rclHabilidadesnivel8:setWidth(400);
    obj.rclHabilidadesnivel8:setAutoHeight(true);
    obj.rclHabilidadesnivel8:setHitTest(false);

    obj.flowLayout44 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout44:setParent(obj.habilidadesLayout);
    obj.flowLayout44:setAlign("top");
    obj.flowLayout44:setAutoHeight(true);
    obj.flowLayout44:setMaxControlsPerLine(1);
    obj.flowLayout44:setHorzAlign("center");
    obj.flowLayout44:setMaxWidth(406);
    obj.flowLayout44:setName("flowLayout44");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.flowLayout44);
    obj.rectangle17:setCornerType("bevel");
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setXradius(10);
    obj.rectangle17:setYradius(20);
    obj.rectangle17:setHeight(40);
    obj.rectangle17:setWidth(400);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("silver");
    obj.rectangle17:setStrokeSize(2);
    obj.rectangle17:setName("rectangle17");

    obj.flowLayout45 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout45:setParent(obj.rectangle17);
    obj.flowLayout45:setWidth(400);
    obj.flowLayout45:setHeight(40);
    obj.flowLayout45:setMaxControlsPerLine(1);
    obj.flowLayout45:setHorzAlign("center");
    obj.flowLayout45:setName("flowLayout45");

    obj.flowPart240 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart240:setParent(obj.flowLayout45);
    obj.flowPart240:setHeight(20);
    obj.flowPart240:setWidth(75);
    obj.flowPart240:setVertAlign("center");
    obj.flowPart240:setAlign("client");
    obj.flowPart240:setMargins({top=10});
    obj.flowPart240:setName("flowPart240");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.flowPart240);
    obj.label128:setText("Nível 9");
    obj.label128:setFontSize(18);
    lfm_setPropAsString(obj.label128, "fontStyle",  "italic bold");
    obj.label128:setAlign("client");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.horzLine90 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine90:setParent(obj.flowPart240);
    obj.horzLine90:setAlign("bottom");
    obj.horzLine90:setStrokeSize(1);
    obj.horzLine90:setStrokeColor("silver");
    obj.horzLine90:setName("horzLine90");

    obj.flowPart241 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart241:setParent(obj.rectangle17);
    obj.flowPart241:setWidth(16);
    obj.flowPart241:setHeight(20);
    obj.flowPart241:setLeft(375);
    obj.flowPart241:setTop(10);
    obj.flowPart241:setName("flowPart241");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.flowPart241);
    obj.button13:setAlign("client");
    obj.button13:setHeight(16);
    obj.button13:setText("+");
    obj.button13:setWidth(16);
    obj.button13:setHorzTextAlign("center");
    obj.button13:setName("button13");

    obj.rclHabilidadesnivel9 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel9:setParent(obj.flowLayout44);
    obj.rclHabilidadesnivel9:setName("rclHabilidadesnivel9");
    obj.rclHabilidadesnivel9:setField("habilidadesnivel9");
    obj.rclHabilidadesnivel9:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel9:setAlign("client");
    obj.rclHabilidadesnivel9:setMinHeight(70);
    obj.rclHabilidadesnivel9:setWidth(400);
    obj.rclHabilidadesnivel9:setAutoHeight(true);
    obj.rclHabilidadesnivel9:setHitTest(false);

    obj.flowLayout46 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout46:setParent(obj.habilidadesLayout);
    obj.flowLayout46:setAlign("top");
    obj.flowLayout46:setAutoHeight(true);
    obj.flowLayout46:setMaxControlsPerLine(1);
    obj.flowLayout46:setHorzAlign("center");
    obj.flowLayout46:setMaxWidth(406);
    obj.flowLayout46:setName("flowLayout46");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.flowLayout46);
    obj.rectangle18:setCornerType("bevel");
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setXradius(10);
    obj.rectangle18:setYradius(20);
    obj.rectangle18:setHeight(40);
    obj.rectangle18:setWidth(400);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("silver");
    obj.rectangle18:setStrokeSize(2);
    obj.rectangle18:setName("rectangle18");

    obj.flowLayout47 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout47:setParent(obj.rectangle18);
    obj.flowLayout47:setWidth(400);
    obj.flowLayout47:setHeight(40);
    obj.flowLayout47:setMaxControlsPerLine(1);
    obj.flowLayout47:setHorzAlign("center");
    obj.flowLayout47:setName("flowLayout47");

    obj.flowPart242 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart242:setParent(obj.flowLayout47);
    obj.flowPart242:setHeight(20);
    obj.flowPart242:setWidth(75);
    obj.flowPart242:setVertAlign("center");
    obj.flowPart242:setAlign("client");
    obj.flowPart242:setMargins({top=10});
    obj.flowPart242:setName("flowPart242");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.flowPart242);
    obj.label129:setText("Nível 10");
    obj.label129:setFontSize(18);
    lfm_setPropAsString(obj.label129, "fontStyle",  "italic bold");
    obj.label129:setAlign("client");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.horzLine91 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine91:setParent(obj.flowPart242);
    obj.horzLine91:setAlign("bottom");
    obj.horzLine91:setStrokeSize(1);
    obj.horzLine91:setStrokeColor("silver");
    obj.horzLine91:setName("horzLine91");

    obj.flowPart243 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart243:setParent(obj.rectangle18);
    obj.flowPart243:setWidth(16);
    obj.flowPart243:setHeight(20);
    obj.flowPart243:setLeft(375);
    obj.flowPart243:setTop(10);
    obj.flowPart243:setName("flowPart243");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.flowPart243);
    obj.button14:setAlign("client");
    obj.button14:setHeight(16);
    obj.button14:setText("+");
    obj.button14:setWidth(16);
    obj.button14:setHorzTextAlign("center");
    obj.button14:setName("button14");

    obj.rclHabilidadesnivel10 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel10:setParent(obj.flowLayout46);
    obj.rclHabilidadesnivel10:setName("rclHabilidadesnivel10");
    obj.rclHabilidadesnivel10:setField("habilidadesnivel10");
    obj.rclHabilidadesnivel10:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel10:setAlign("client");
    obj.rclHabilidadesnivel10:setMinHeight(70);
    obj.rclHabilidadesnivel10:setWidth(400);
    obj.rclHabilidadesnivel10:setAutoHeight(true);
    obj.rclHabilidadesnivel10:setHitTest(false);

    obj.flowLayout48 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout48:setParent(obj.habilidadesLayout);
    obj.flowLayout48:setAlign("top");
    obj.flowLayout48:setAutoHeight(true);
    obj.flowLayout48:setMaxControlsPerLine(1);
    obj.flowLayout48:setHorzAlign("center");
    obj.flowLayout48:setMaxWidth(406);
    obj.flowLayout48:setName("flowLayout48");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.flowLayout48);
    obj.rectangle19:setCornerType("bevel");
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setXradius(10);
    obj.rectangle19:setYradius(20);
    obj.rectangle19:setHeight(40);
    obj.rectangle19:setWidth(400);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("silver");
    obj.rectangle19:setStrokeSize(2);
    obj.rectangle19:setName("rectangle19");

    obj.flowLayout49 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout49:setParent(obj.rectangle19);
    obj.flowLayout49:setWidth(400);
    obj.flowLayout49:setHeight(40);
    obj.flowLayout49:setMaxControlsPerLine(1);
    obj.flowLayout49:setHorzAlign("center");
    obj.flowLayout49:setName("flowLayout49");

    obj.flowPart244 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart244:setParent(obj.flowLayout49);
    obj.flowPart244:setHeight(20);
    obj.flowPart244:setWidth(75);
    obj.flowPart244:setVertAlign("center");
    obj.flowPart244:setAlign("client");
    obj.flowPart244:setMargins({top=10});
    obj.flowPart244:setName("flowPart244");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.flowPart244);
    obj.label130:setText("Nível 11");
    obj.label130:setFontSize(18);
    lfm_setPropAsString(obj.label130, "fontStyle",  "italic bold");
    obj.label130:setAlign("client");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.horzLine92 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine92:setParent(obj.flowPart244);
    obj.horzLine92:setAlign("bottom");
    obj.horzLine92:setStrokeSize(1);
    obj.horzLine92:setStrokeColor("silver");
    obj.horzLine92:setName("horzLine92");

    obj.flowPart245 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart245:setParent(obj.rectangle19);
    obj.flowPart245:setWidth(16);
    obj.flowPart245:setHeight(20);
    obj.flowPart245:setLeft(375);
    obj.flowPart245:setTop(10);
    obj.flowPart245:setName("flowPart245");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.flowPart245);
    obj.button15:setAlign("client");
    obj.button15:setHeight(16);
    obj.button15:setText("+");
    obj.button15:setWidth(16);
    obj.button15:setHorzTextAlign("center");
    obj.button15:setName("button15");

    obj.rclHabilidadesnivel11 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesnivel11:setParent(obj.flowLayout48);
    obj.rclHabilidadesnivel11:setName("rclHabilidadesnivel11");
    obj.rclHabilidadesnivel11:setField("habilidadesnivel11");
    obj.rclHabilidadesnivel11:setTemplateForm("habilidadercl");
    obj.rclHabilidadesnivel11:setAlign("client");
    obj.rclHabilidadesnivel11:setMinHeight(70);
    obj.rclHabilidadesnivel11:setWidth(400);
    obj.rclHabilidadesnivel11:setAutoHeight(true);
    obj.rclHabilidadesnivel11:setHitTest(false);

    obj.flowLayout50 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout50:setParent(obj.habilidadesLayout);
    obj.flowLayout50:setAlign("top");
    obj.flowLayout50:setAutoHeight(true);
    obj.flowLayout50:setMaxControlsPerLine(1);
    obj.flowLayout50:setHorzAlign("center");
    obj.flowLayout50:setMaxWidth(406);
    obj.flowLayout50:setName("flowLayout50");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.flowLayout50);
    obj.rectangle20:setCornerType("bevel");
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setXradius(10);
    obj.rectangle20:setYradius(20);
    obj.rectangle20:setHeight(40);
    obj.rectangle20:setWidth(400);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("silver");
    obj.rectangle20:setStrokeSize(2);
    obj.rectangle20:setName("rectangle20");

    obj.flowLayout51 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout51:setParent(obj.rectangle20);
    obj.flowLayout51:setWidth(400);
    obj.flowLayout51:setHeight(40);
    obj.flowLayout51:setMaxControlsPerLine(1);
    obj.flowLayout51:setHorzAlign("center");
    obj.flowLayout51:setName("flowLayout51");

    obj.flowPart246 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart246:setParent(obj.flowLayout51);
    obj.flowPart246:setHeight(20);
    obj.flowPart246:setWidth(60);
    obj.flowPart246:setVertAlign("center");
    obj.flowPart246:setAlign("client");
    obj.flowPart246:setMargins({top=10});
    obj.flowPart246:setName("flowPart246");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.flowPart246);
    obj.label131:setText("Extras");
    obj.label131:setFontSize(18);
    lfm_setPropAsString(obj.label131, "fontStyle",  "italic bold");
    obj.label131:setAlign("client");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.horzLine93 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine93:setParent(obj.flowPart246);
    obj.horzLine93:setAlign("bottom");
    obj.horzLine93:setStrokeSize(1);
    obj.horzLine93:setStrokeColor("silver");
    obj.horzLine93:setName("horzLine93");

    obj.flowPart247 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart247:setParent(obj.rectangle20);
    obj.flowPart247:setWidth(16);
    obj.flowPart247:setHeight(20);
    obj.flowPart247:setLeft(375);
    obj.flowPart247:setTop(10);
    obj.flowPart247:setName("flowPart247");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.flowPart247);
    obj.button16:setAlign("client");
    obj.button16:setHeight(16);
    obj.button16:setText("+");
    obj.button16:setWidth(16);
    obj.button16:setHorzTextAlign("center");
    obj.button16:setName("button16");

    obj.rclHabilidadesextras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesextras:setParent(obj.flowLayout50);
    obj.rclHabilidadesextras:setName("rclHabilidadesextras");
    obj.rclHabilidadesextras:setField("habilidadesextras");
    obj.rclHabilidadesextras:setTemplateForm("habilidadercl");
    obj.rclHabilidadesextras:setAlign("client");
    obj.rclHabilidadesextras:setMinHeight(70);
    obj.rclHabilidadesextras:setWidth(400);
    obj.rclHabilidadesextras:setAutoHeight(true);
    obj.rclHabilidadesextras:setHitTest(false);

    obj.editaHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.editaHabilidade:setParent(obj.rectangle7);
    obj.editaHabilidade:setName("editaHabilidade");
    obj.editaHabilidade:setHeight(400);
    obj.editaHabilidade:setWidth(752);
    obj.editaHabilidade:setBackOpacity(0.5);

    obj.flowLayout52 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout52:setParent(obj.editaHabilidade);
    obj.flowLayout52:setAlign("client");
    obj.flowLayout52:setMaxControlsPerLine(1);
    obj.flowLayout52:setMargins({left=10,right=10,top=10,bottom=10});
    obj.flowLayout52:setName("flowLayout52");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.flowLayout52);
    obj.rectangle21:setCornerType("innerLine");
    obj.rectangle21:setXradius(10);
    obj.rectangle21:setYradius(10);
    obj.rectangle21:setHeight(300);
    obj.rectangle21:setWidth(732);
    obj.rectangle21:setColor("silver");
    obj.rectangle21:setStrokeColor("black");
    obj.rectangle21:setStrokeSize(2);
    obj.rectangle21:setName("rectangle21");

    obj.flowLayout53 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout53:setParent(obj.rectangle21);
    obj.flowLayout53:setHeight(300);
    obj.flowLayout53:setWidth(732);
    obj.flowLayout53:setPadding({left=10,right=10,top=10,bottom=10});
    obj.flowLayout53:setAlign("client");
    obj.flowLayout53:setName("flowLayout53");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.flowLayout53);
    obj.richEdit1:setHeight(280);
    obj.richEdit1:setWidth(712);
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#40000000");
    obj.richEdit1:setField("descricao");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setName("richEdit1");

    obj.flowPart248 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart248:setParent(obj.flowLayout52);
    obj.flowPart248:setWidth(135);
    obj.flowPart248:setHeight(20);
    obj.flowPart248:setName("flowPart248");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.flowPart248);
    obj.label132:setText("Máximo de Cargas:");
    obj.label132:setHeight(20);
    obj.label132:setWidth(110);
    obj.label132:setHorzTextAlign("leading");
    obj.label132:setVertTextAlign("center");
    obj.label132:setAlign("left");
    obj.label132:setName("label132");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.flowPart248);
    obj.edit104:setHeight(20);
    obj.edit104:setWidth(25);
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setFontSize(15);
    obj.edit104:setAlign("right");
    obj.edit104:setField("cargasMax");
    lfm_setPropAsString(obj.edit104, "fontStyle",  "bold");
    obj.edit104:setType("number");
    obj.edit104:setTransparent(true);
    obj.edit104:setName("edit104");

    obj.horzLine94 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine94:setParent(obj.flowPart248);
    obj.horzLine94:setAlign("bottom");
    obj.horzLine94:setStrokeColor("#FFFFFF50");
    obj.horzLine94:setStrokeSize(1);
    obj.horzLine94:setMargins({right=5});
    obj.horzLine94:setName("horzLine94");

    obj.flowPart249 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart249:setParent(obj.flowLayout52);
    obj.flowPart249:setWidth(135);
    obj.flowPart249:setHeight(20);
    obj.flowPart249:setName("flowPart249");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.flowPart249);
    obj.label133:setText("Tipo:");
    obj.label133:setHeight(20);
    obj.label133:setWidth(35);
    obj.label133:setHorzTextAlign("leading");
    obj.label133:setVertTextAlign("center");
    obj.label133:setAlign("left");
    obj.label133:setName("label133");

    obj.horzLine95 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine95:setParent(obj.flowPart249);
    obj.horzLine95:setAlign("bottom");
    obj.horzLine95:setStrokeColor("#FFFFFF50");
    obj.horzLine95:setStrokeSize(1);
    obj.horzLine95:setMargins({right=5});
    obj.horzLine95:setWidth(35);
    obj.horzLine95:setName("horzLine95");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.pgcPrincipal);
    obj.tab3:setTitle("Inventário");
    obj.tab3:setName("tab3");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.tab3);
    obj.rectangle22:setName("rectangle22");
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("#40000000");
    obj.rectangle22:setXradius(10);
    obj.rectangle22:setYradius(10);

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.rectangle22);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.riquezas = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.riquezas:setParent(obj.scrollBox3);
    obj.riquezas:setName("riquezas");
    obj.riquezas:setAlign("top");
    obj.riquezas:setHeight(500);
    obj.riquezas:setMargins({left=10, right=10, top=10});
    obj.riquezas:setAutoHeight(true);
    obj.riquezas:setMaxControlsPerLine(2);
    obj.riquezas:setHorzAlign("leading");
    obj.riquezas:setLineSpacing(2);
    obj.riquezas:setMaxWidth(1600);
    obj.riquezas:setStepSizes({310, 420, 640, 760, 1150});
    obj.riquezas:setMinScaledWidth(300);

    obj.flowLayout54 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout54:setParent(obj.riquezas);
    obj.flowLayout54:setAutoHeight(true);
    obj.flowLayout54:setMinWidth(150);
    obj.flowLayout54:setMaxWidth(300);
    obj.flowLayout54:setName("flowLayout54");

    obj.flowPart250 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart250:setParent(obj.flowLayout54);
    obj.flowPart250:setHeight(20);
    obj.flowPart250:setWidth(150);
    obj.flowPart250:setName("flowPart250");

    obj.bronze = GUI.fromHandle(_obj_newObject("label"));
    obj.bronze:setParent(obj.flowPart250);
    obj.bronze:setText("Bronze: ");
    obj.bronze:setAlign("client");
    obj.bronze:setName("bronze");

    obj.horzLine96 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine96:setParent(obj.flowPart250);
    obj.horzLine96:setAlign("bottom");
    obj.horzLine96:setStrokeColor("#FFFFFF50");
    obj.horzLine96:setStrokeSize(1);
    obj.horzLine96:setMargins({right=5});
    obj.horzLine96:setName("horzLine96");

    obj.flowPart251 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart251:setParent(obj.flowLayout54);
    obj.flowPart251:setHeight(20);
    obj.flowPart251:setWidth(30);
    obj.flowPart251:setName("flowPart251");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.flowPart251);
    obj.edit105:setAlign("client");
    obj.edit105:setField("bronze");
    obj.edit105:setName("edit105");

    obj.flowPart252 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart252:setParent(obj.flowLayout54);
    obj.flowPart252:setHeight(20);
    obj.flowPart252:setWidth(30);
    obj.flowPart252:setMargins({left=5});
    obj.flowPart252:setName("flowPart252");

    obj.buttonbronze = GUI.fromHandle(_obj_newObject("button"));
    obj.buttonbronze:setParent(obj.flowPart252);
    obj.buttonbronze:setName("buttonbronze");
    obj.buttonbronze:setAlign("client");
    obj.buttonbronze:setText("-/+");

    obj.popupRiquezasbronze = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupRiquezasbronze:setParent(obj.flowLayout54);
    obj.popupRiquezasbronze:setName("popupRiquezasbronze");
    obj.popupRiquezasbronze:setWidth(185);
    obj.popupRiquezasbronze:setHeight(50);
    obj.popupRiquezasbronze:setBackOpacity(0.4);

    obj.flowLayout55 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout55:setParent(obj.popupRiquezasbronze);
    obj.flowLayout55:setAlign("client");
    obj.flowLayout55:setMaxControlsPerLine(3);
    obj.flowLayout55:setName("flowLayout55");

    obj.flowPart253 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart253:setParent(obj.flowLayout55);
    obj.flowPart253:setHeight(20);
    obj.flowPart253:setWidth(110);
    obj.flowPart253:setName("flowPart253");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.flowPart253);
    obj.label134:setText("Somar Riquezas: ");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setVertTextAlign("center");
    obj.label134:setName("label134");

    obj.flowPart254 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart254:setParent(obj.flowLayout55);
    obj.flowPart254:setHeight(20);
    obj.flowPart254:setWidth(30);
    obj.flowPart254:setName("flowPart254");

    obj.somaRiquezasEditbronze = GUI.fromHandle(_obj_newObject("edit"));
    obj.somaRiquezasEditbronze:setParent(obj.flowPart254);
    obj.somaRiquezasEditbronze:setType("number");
    obj.somaRiquezasEditbronze:setAlign("client");
    obj.somaRiquezasEditbronze:setField("somaRiquezasbronze");
    obj.somaRiquezasEditbronze:setName("somaRiquezasEditbronze");
    obj.somaRiquezasEditbronze:setHorzTextAlign("center");
    obj.somaRiquezasEditbronze:setVertTextAlign("center");
    obj.somaRiquezasEditbronze:setTransparent(true);

    obj.horzLine97 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine97:setParent(obj.flowPart254);
    obj.horzLine97:setAlign("bottom");
    obj.horzLine97:setStrokeColor("#FFFFFF50");
    obj.horzLine97:setStrokeSize(1);
    obj.horzLine97:setName("horzLine97");

    obj.flowPart255 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart255:setParent(obj.flowLayout55);
    obj.flowPart255:setHeight(20);
    obj.flowPart255:setWidth(25);
    obj.flowPart255:setName("flowPart255");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.flowPart255);
    obj.button17:setText("ok");
    obj.button17:setHeight(20);
    obj.button17:setWidth(25);
    obj.button17:setName("button17");

    obj.flowPart256 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart256:setParent(obj.flowLayout55);
    obj.flowPart256:setHeight(20);
    obj.flowPart256:setWidth(40);
    obj.flowPart256:setName("flowPart256");

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.flowPart256);
    obj.radioButton1:setText("-");
    obj.radioButton1:setGroupName("groupRiquezasbronze");
    obj.radioButton1:setField("radioButtonRiquezasbronze");
    obj.radioButton1:setFieldValue("-");
    obj.radioButton1:setVertTextAlign("center");
    obj.radioButton1:setName("radioButton1");

    obj.flowPart257 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart257:setParent(obj.flowLayout55);
    obj.flowPart257:setHeight(20);
    obj.flowPart257:setWidth(40);
    obj.flowPart257:setName("flowPart257");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.flowPart257);
    obj.radioButton2:setText("+");
    obj.radioButton2:setGroupName("groupRiquezasbronze");
    obj.radioButton2:setField("radioButtonRiquezasbronze");
    obj.radioButton2:setFieldValue("+");
    obj.radioButton2:setVertTextAlign("center");
    obj.radioButton2:setName("radioButton2");

    obj.flowPart258 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart258:setParent(obj.flowLayout54);
    obj.flowPart258:setHeight(20);
    obj.flowPart258:setWidth(150);
    obj.flowPart258:setName("flowPart258");

    obj.prata = GUI.fromHandle(_obj_newObject("label"));
    obj.prata:setParent(obj.flowPart258);
    obj.prata:setText("Prata: ");
    obj.prata:setAlign("client");
    obj.prata:setName("prata");

    obj.horzLine98 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine98:setParent(obj.flowPart258);
    obj.horzLine98:setAlign("bottom");
    obj.horzLine98:setStrokeColor("#FFFFFF50");
    obj.horzLine98:setStrokeSize(1);
    obj.horzLine98:setMargins({right=5});
    obj.horzLine98:setName("horzLine98");

    obj.flowPart259 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart259:setParent(obj.flowLayout54);
    obj.flowPart259:setHeight(20);
    obj.flowPart259:setWidth(30);
    obj.flowPart259:setName("flowPart259");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.flowPart259);
    obj.edit106:setAlign("client");
    obj.edit106:setField("prata");
    obj.edit106:setName("edit106");

    obj.flowPart260 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart260:setParent(obj.flowLayout54);
    obj.flowPart260:setHeight(20);
    obj.flowPart260:setWidth(30);
    obj.flowPart260:setMargins({left=5});
    obj.flowPart260:setName("flowPart260");

    obj.buttonprata = GUI.fromHandle(_obj_newObject("button"));
    obj.buttonprata:setParent(obj.flowPart260);
    obj.buttonprata:setName("buttonprata");
    obj.buttonprata:setAlign("client");
    obj.buttonprata:setText("-/+");

    obj.popupRiquezasprata = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupRiquezasprata:setParent(obj.flowLayout54);
    obj.popupRiquezasprata:setName("popupRiquezasprata");
    obj.popupRiquezasprata:setWidth(185);
    obj.popupRiquezasprata:setHeight(50);
    obj.popupRiquezasprata:setBackOpacity(0.4);

    obj.flowLayout56 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout56:setParent(obj.popupRiquezasprata);
    obj.flowLayout56:setAlign("client");
    obj.flowLayout56:setMaxControlsPerLine(3);
    obj.flowLayout56:setName("flowLayout56");

    obj.flowPart261 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart261:setParent(obj.flowLayout56);
    obj.flowPart261:setHeight(20);
    obj.flowPart261:setWidth(110);
    obj.flowPart261:setName("flowPart261");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.flowPart261);
    obj.label135:setText("Somar Riquezas: ");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setVertTextAlign("center");
    obj.label135:setName("label135");

    obj.flowPart262 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart262:setParent(obj.flowLayout56);
    obj.flowPart262:setHeight(20);
    obj.flowPart262:setWidth(30);
    obj.flowPart262:setName("flowPart262");

    obj.somaRiquezasEditprata = GUI.fromHandle(_obj_newObject("edit"));
    obj.somaRiquezasEditprata:setParent(obj.flowPart262);
    obj.somaRiquezasEditprata:setType("number");
    obj.somaRiquezasEditprata:setAlign("client");
    obj.somaRiquezasEditprata:setField("somaRiquezasprata");
    obj.somaRiquezasEditprata:setName("somaRiquezasEditprata");
    obj.somaRiquezasEditprata:setHorzTextAlign("center");
    obj.somaRiquezasEditprata:setVertTextAlign("center");
    obj.somaRiquezasEditprata:setTransparent(true);

    obj.horzLine99 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine99:setParent(obj.flowPart262);
    obj.horzLine99:setAlign("bottom");
    obj.horzLine99:setStrokeColor("#FFFFFF50");
    obj.horzLine99:setStrokeSize(1);
    obj.horzLine99:setName("horzLine99");

    obj.flowPart263 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart263:setParent(obj.flowLayout56);
    obj.flowPart263:setHeight(20);
    obj.flowPart263:setWidth(25);
    obj.flowPart263:setName("flowPart263");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.flowPart263);
    obj.button18:setText("ok");
    obj.button18:setHeight(20);
    obj.button18:setWidth(25);
    obj.button18:setName("button18");

    obj.flowPart264 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart264:setParent(obj.flowLayout56);
    obj.flowPart264:setHeight(20);
    obj.flowPart264:setWidth(40);
    obj.flowPart264:setName("flowPart264");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.flowPart264);
    obj.radioButton3:setText("-");
    obj.radioButton3:setGroupName("groupRiquezasprata");
    obj.radioButton3:setField("radioButtonRiquezasprata");
    obj.radioButton3:setFieldValue("-");
    obj.radioButton3:setVertTextAlign("center");
    obj.radioButton3:setName("radioButton3");

    obj.flowPart265 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart265:setParent(obj.flowLayout56);
    obj.flowPart265:setHeight(20);
    obj.flowPart265:setWidth(40);
    obj.flowPart265:setName("flowPart265");

    obj.radioButton4 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.flowPart265);
    obj.radioButton4:setText("+");
    obj.radioButton4:setGroupName("groupRiquezasprata");
    obj.radioButton4:setField("radioButtonRiquezasprata");
    obj.radioButton4:setFieldValue("+");
    obj.radioButton4:setVertTextAlign("center");
    obj.radioButton4:setName("radioButton4");

    obj.flowPart266 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart266:setParent(obj.flowLayout54);
    obj.flowPart266:setHeight(20);
    obj.flowPart266:setWidth(150);
    obj.flowPart266:setName("flowPart266");

    obj.ouro = GUI.fromHandle(_obj_newObject("label"));
    obj.ouro:setParent(obj.flowPart266);
    obj.ouro:setText("Ouro: ");
    obj.ouro:setAlign("client");
    obj.ouro:setName("ouro");

    obj.horzLine100 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine100:setParent(obj.flowPart266);
    obj.horzLine100:setAlign("bottom");
    obj.horzLine100:setStrokeColor("#FFFFFF50");
    obj.horzLine100:setStrokeSize(1);
    obj.horzLine100:setMargins({right=5});
    obj.horzLine100:setName("horzLine100");

    obj.flowPart267 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart267:setParent(obj.flowLayout54);
    obj.flowPart267:setHeight(20);
    obj.flowPart267:setWidth(30);
    obj.flowPart267:setName("flowPart267");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.flowPart267);
    obj.edit107:setAlign("client");
    obj.edit107:setField("ouro");
    obj.edit107:setName("edit107");

    obj.flowPart268 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart268:setParent(obj.flowLayout54);
    obj.flowPart268:setHeight(20);
    obj.flowPart268:setWidth(30);
    obj.flowPart268:setMargins({left=5});
    obj.flowPart268:setName("flowPart268");

    obj.buttonouro = GUI.fromHandle(_obj_newObject("button"));
    obj.buttonouro:setParent(obj.flowPart268);
    obj.buttonouro:setName("buttonouro");
    obj.buttonouro:setAlign("client");
    obj.buttonouro:setText("-/+");

    obj.popupRiquezasouro = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupRiquezasouro:setParent(obj.flowLayout54);
    obj.popupRiquezasouro:setName("popupRiquezasouro");
    obj.popupRiquezasouro:setWidth(185);
    obj.popupRiquezasouro:setHeight(50);
    obj.popupRiquezasouro:setBackOpacity(0.4);

    obj.flowLayout57 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout57:setParent(obj.popupRiquezasouro);
    obj.flowLayout57:setAlign("client");
    obj.flowLayout57:setMaxControlsPerLine(3);
    obj.flowLayout57:setName("flowLayout57");

    obj.flowPart269 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart269:setParent(obj.flowLayout57);
    obj.flowPart269:setHeight(20);
    obj.flowPart269:setWidth(110);
    obj.flowPart269:setName("flowPart269");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.flowPart269);
    obj.label136:setText("Somar Riquezas: ");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setVertTextAlign("center");
    obj.label136:setName("label136");

    obj.flowPart270 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart270:setParent(obj.flowLayout57);
    obj.flowPart270:setHeight(20);
    obj.flowPart270:setWidth(30);
    obj.flowPart270:setName("flowPart270");

    obj.somaRiquezasEditouro = GUI.fromHandle(_obj_newObject("edit"));
    obj.somaRiquezasEditouro:setParent(obj.flowPart270);
    obj.somaRiquezasEditouro:setType("number");
    obj.somaRiquezasEditouro:setAlign("client");
    obj.somaRiquezasEditouro:setField("somaRiquezasouro");
    obj.somaRiquezasEditouro:setName("somaRiquezasEditouro");
    obj.somaRiquezasEditouro:setHorzTextAlign("center");
    obj.somaRiquezasEditouro:setVertTextAlign("center");
    obj.somaRiquezasEditouro:setTransparent(true);

    obj.horzLine101 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine101:setParent(obj.flowPart270);
    obj.horzLine101:setAlign("bottom");
    obj.horzLine101:setStrokeColor("#FFFFFF50");
    obj.horzLine101:setStrokeSize(1);
    obj.horzLine101:setName("horzLine101");

    obj.flowPart271 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart271:setParent(obj.flowLayout57);
    obj.flowPart271:setHeight(20);
    obj.flowPart271:setWidth(25);
    obj.flowPart271:setName("flowPart271");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.flowPart271);
    obj.button19:setText("ok");
    obj.button19:setHeight(20);
    obj.button19:setWidth(25);
    obj.button19:setName("button19");

    obj.flowPart272 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart272:setParent(obj.flowLayout57);
    obj.flowPart272:setHeight(20);
    obj.flowPart272:setWidth(40);
    obj.flowPart272:setName("flowPart272");

    obj.radioButton5 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.flowPart272);
    obj.radioButton5:setText("-");
    obj.radioButton5:setGroupName("groupRiquezasouro");
    obj.radioButton5:setField("radioButtonRiquezasouro");
    obj.radioButton5:setFieldValue("-");
    obj.radioButton5:setVertTextAlign("center");
    obj.radioButton5:setName("radioButton5");

    obj.flowPart273 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart273:setParent(obj.flowLayout57);
    obj.flowPart273:setHeight(20);
    obj.flowPart273:setWidth(40);
    obj.flowPart273:setName("flowPart273");

    obj.radioButton6 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.flowPart273);
    obj.radioButton6:setText("+");
    obj.radioButton6:setGroupName("groupRiquezasouro");
    obj.radioButton6:setField("radioButtonRiquezasouro");
    obj.radioButton6:setFieldValue("+");
    obj.radioButton6:setVertTextAlign("center");
    obj.radioButton6:setName("radioButton6");

    obj.flowPart274 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart274:setParent(obj.flowLayout54);
    obj.flowPart274:setHeight(20);
    obj.flowPart274:setWidth(150);
    obj.flowPart274:setName("flowPart274");

    obj.platina = GUI.fromHandle(_obj_newObject("label"));
    obj.platina:setParent(obj.flowPart274);
    obj.platina:setText("Platina: ");
    obj.platina:setAlign("client");
    obj.platina:setName("platina");

    obj.horzLine102 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine102:setParent(obj.flowPart274);
    obj.horzLine102:setAlign("bottom");
    obj.horzLine102:setStrokeColor("#FFFFFF50");
    obj.horzLine102:setStrokeSize(1);
    obj.horzLine102:setMargins({right=5});
    obj.horzLine102:setName("horzLine102");

    obj.flowPart275 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart275:setParent(obj.flowLayout54);
    obj.flowPart275:setHeight(20);
    obj.flowPart275:setWidth(30);
    obj.flowPart275:setName("flowPart275");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.flowPart275);
    obj.edit108:setAlign("client");
    obj.edit108:setField("platina");
    obj.edit108:setName("edit108");

    obj.flowPart276 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart276:setParent(obj.flowLayout54);
    obj.flowPart276:setHeight(20);
    obj.flowPart276:setWidth(30);
    obj.flowPart276:setMargins({left=5});
    obj.flowPart276:setName("flowPart276");

    obj.buttonplatina = GUI.fromHandle(_obj_newObject("button"));
    obj.buttonplatina:setParent(obj.flowPart276);
    obj.buttonplatina:setName("buttonplatina");
    obj.buttonplatina:setAlign("client");
    obj.buttonplatina:setText("-/+");

    obj.popupRiquezasplatina = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupRiquezasplatina:setParent(obj.flowLayout54);
    obj.popupRiquezasplatina:setName("popupRiquezasplatina");
    obj.popupRiquezasplatina:setWidth(185);
    obj.popupRiquezasplatina:setHeight(50);
    obj.popupRiquezasplatina:setBackOpacity(0.4);

    obj.flowLayout58 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout58:setParent(obj.popupRiquezasplatina);
    obj.flowLayout58:setAlign("client");
    obj.flowLayout58:setMaxControlsPerLine(3);
    obj.flowLayout58:setName("flowLayout58");

    obj.flowPart277 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart277:setParent(obj.flowLayout58);
    obj.flowPart277:setHeight(20);
    obj.flowPart277:setWidth(110);
    obj.flowPart277:setName("flowPart277");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.flowPart277);
    obj.label137:setText("Somar Riquezas: ");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setVertTextAlign("center");
    obj.label137:setName("label137");

    obj.flowPart278 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart278:setParent(obj.flowLayout58);
    obj.flowPart278:setHeight(20);
    obj.flowPart278:setWidth(30);
    obj.flowPart278:setName("flowPart278");

    obj.somaRiquezasEditplatina = GUI.fromHandle(_obj_newObject("edit"));
    obj.somaRiquezasEditplatina:setParent(obj.flowPart278);
    obj.somaRiquezasEditplatina:setType("number");
    obj.somaRiquezasEditplatina:setAlign("client");
    obj.somaRiquezasEditplatina:setField("somaRiquezasplatina");
    obj.somaRiquezasEditplatina:setName("somaRiquezasEditplatina");
    obj.somaRiquezasEditplatina:setHorzTextAlign("center");
    obj.somaRiquezasEditplatina:setVertTextAlign("center");
    obj.somaRiquezasEditplatina:setTransparent(true);

    obj.horzLine103 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine103:setParent(obj.flowPart278);
    obj.horzLine103:setAlign("bottom");
    obj.horzLine103:setStrokeColor("#FFFFFF50");
    obj.horzLine103:setStrokeSize(1);
    obj.horzLine103:setName("horzLine103");

    obj.flowPart279 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart279:setParent(obj.flowLayout58);
    obj.flowPart279:setHeight(20);
    obj.flowPart279:setWidth(25);
    obj.flowPart279:setName("flowPart279");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.flowPart279);
    obj.button20:setText("ok");
    obj.button20:setHeight(20);
    obj.button20:setWidth(25);
    obj.button20:setName("button20");

    obj.flowPart280 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart280:setParent(obj.flowLayout58);
    obj.flowPart280:setHeight(20);
    obj.flowPart280:setWidth(40);
    obj.flowPart280:setName("flowPart280");

    obj.radioButton7 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.flowPart280);
    obj.radioButton7:setText("-");
    obj.radioButton7:setGroupName("groupRiquezasplatina");
    obj.radioButton7:setField("radioButtonRiquezasplatina");
    obj.radioButton7:setFieldValue("-");
    obj.radioButton7:setVertTextAlign("center");
    obj.radioButton7:setName("radioButton7");

    obj.flowPart281 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart281:setParent(obj.flowLayout58);
    obj.flowPart281:setHeight(20);
    obj.flowPart281:setWidth(40);
    obj.flowPart281:setName("flowPart281");

    obj.radioButton8 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.flowPart281);
    obj.radioButton8:setText("+");
    obj.radioButton8:setGroupName("groupRiquezasplatina");
    obj.radioButton8:setField("radioButtonRiquezasplatina");
    obj.radioButton8:setFieldValue("+");
    obj.radioButton8:setVertTextAlign("center");
    obj.radioButton8:setName("radioButton8");

    obj.flowLayout59 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout59:setParent(obj.riquezas);
    obj.flowLayout59:setAutoHeight(true);
    obj.flowLayout59:setMinWidth(150);
    obj.flowLayout59:setMaxWidth(300);
    obj.flowLayout59:setName("flowLayout59");

    obj.flowPart282 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart282:setParent(obj.flowLayout59);
    obj.flowPart282:setHeight(20);
    obj.flowPart282:setWidth(150);
    obj.flowPart282:setName("flowPart282");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.flowPart282);
    obj.label138:setText("Gemas Raras: ");
    obj.label138:setAlign("client");
    obj.label138:setName("label138");

    obj.horzLine104 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine104:setParent(obj.flowPart282);
    obj.horzLine104:setAlign("bottom");
    obj.horzLine104:setStrokeColor("#FFFFFF50");
    obj.horzLine104:setStrokeSize(1);
    obj.horzLine104:setMargins({right=5});
    obj.horzLine104:setName("horzLine104");

    obj.flowPart283 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart283:setParent(obj.flowLayout59);
    obj.flowPart283:setHeight(20);
    obj.flowPart283:setWidth(30);
    obj.flowPart283:setName("flowPart283");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.flowPart283);
    obj.edit109:setAlign("client");
    obj.edit109:setField("raras");
    obj.edit109:setName("edit109");

    obj.flowPart284 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart284:setParent(obj.flowLayout59);
    obj.flowPart284:setHeight(20);
    obj.flowPart284:setWidth(30);
    obj.flowPart284:setMargins({left=5});
    obj.flowPart284:setName("flowPart284");

    obj.buttonraras = GUI.fromHandle(_obj_newObject("button"));
    obj.buttonraras:setParent(obj.flowPart284);
    obj.buttonraras:setName("buttonraras");
    obj.buttonraras:setAlign("client");
    obj.buttonraras:setText("-/+");

    obj.popupRiquezasraras = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupRiquezasraras:setParent(obj.flowLayout59);
    obj.popupRiquezasraras:setName("popupRiquezasraras");
    obj.popupRiquezasraras:setWidth(185);
    obj.popupRiquezasraras:setHeight(50);
    obj.popupRiquezasraras:setBackOpacity(0.4);

    obj.flowLayout60 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout60:setParent(obj.popupRiquezasraras);
    obj.flowLayout60:setAlign("client");
    obj.flowLayout60:setMaxControlsPerLine(3);
    obj.flowLayout60:setName("flowLayout60");

    obj.flowPart285 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart285:setParent(obj.flowLayout60);
    obj.flowPart285:setHeight(20);
    obj.flowPart285:setWidth(110);
    obj.flowPart285:setName("flowPart285");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.flowPart285);
    obj.label139:setText("Somar Riquezas: ");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setVertTextAlign("center");
    obj.label139:setName("label139");

    obj.flowPart286 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart286:setParent(obj.flowLayout60);
    obj.flowPart286:setHeight(20);
    obj.flowPart286:setWidth(30);
    obj.flowPart286:setName("flowPart286");

    obj.somaRiquezasEditraras = GUI.fromHandle(_obj_newObject("edit"));
    obj.somaRiquezasEditraras:setParent(obj.flowPart286);
    obj.somaRiquezasEditraras:setType("number");
    obj.somaRiquezasEditraras:setAlign("client");
    obj.somaRiquezasEditraras:setField("somaRiquezasraras");
    obj.somaRiquezasEditraras:setName("somaRiquezasEditraras");
    obj.somaRiquezasEditraras:setHorzTextAlign("center");
    obj.somaRiquezasEditraras:setVertTextAlign("center");
    obj.somaRiquezasEditraras:setTransparent(true);

    obj.horzLine105 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine105:setParent(obj.flowPart286);
    obj.horzLine105:setAlign("bottom");
    obj.horzLine105:setStrokeColor("#FFFFFF50");
    obj.horzLine105:setStrokeSize(1);
    obj.horzLine105:setName("horzLine105");

    obj.flowPart287 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart287:setParent(obj.flowLayout60);
    obj.flowPart287:setHeight(20);
    obj.flowPart287:setWidth(25);
    obj.flowPart287:setName("flowPart287");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.flowPart287);
    obj.button21:setText("ok");
    obj.button21:setHeight(20);
    obj.button21:setWidth(25);
    obj.button21:setName("button21");

    obj.flowPart288 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart288:setParent(obj.flowLayout60);
    obj.flowPart288:setHeight(20);
    obj.flowPart288:setWidth(40);
    obj.flowPart288:setName("flowPart288");

    obj.radioButton9 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton9:setParent(obj.flowPart288);
    obj.radioButton9:setText("-");
    obj.radioButton9:setGroupName("groupRiquezasraras");
    obj.radioButton9:setField("radioButtonRiquezasraras");
    obj.radioButton9:setFieldValue("-");
    obj.radioButton9:setVertTextAlign("center");
    obj.radioButton9:setName("radioButton9");

    obj.flowPart289 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart289:setParent(obj.flowLayout60);
    obj.flowPart289:setHeight(20);
    obj.flowPart289:setWidth(40);
    obj.flowPart289:setName("flowPart289");

    obj.radioButton10 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton10:setParent(obj.flowPart289);
    obj.radioButton10:setText("+");
    obj.radioButton10:setGroupName("groupRiquezasraras");
    obj.radioButton10:setField("radioButtonRiquezasraras");
    obj.radioButton10:setFieldValue("+");
    obj.radioButton10:setVertTextAlign("center");
    obj.radioButton10:setName("radioButton10");

    obj.flowPart290 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart290:setParent(obj.flowLayout59);
    obj.flowPart290:setHeight(20);
    obj.flowPart290:setWidth(150);
    obj.flowPart290:setName("flowPart290");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.flowPart290);
    obj.label140:setText("Gemas Preciosas: ");
    obj.label140:setAlign("client");
    obj.label140:setName("label140");

    obj.horzLine106 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine106:setParent(obj.flowPart290);
    obj.horzLine106:setAlign("bottom");
    obj.horzLine106:setStrokeColor("#FFFFFF50");
    obj.horzLine106:setStrokeSize(1);
    obj.horzLine106:setMargins({right=5});
    obj.horzLine106:setName("horzLine106");

    obj.flowPart291 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart291:setParent(obj.flowLayout59);
    obj.flowPart291:setHeight(20);
    obj.flowPart291:setWidth(30);
    obj.flowPart291:setName("flowPart291");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.flowPart291);
    obj.edit110:setAlign("client");
    obj.edit110:setField("preciosas");
    obj.edit110:setName("edit110");

    obj.flowPart292 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart292:setParent(obj.flowLayout59);
    obj.flowPart292:setHeight(20);
    obj.flowPart292:setWidth(30);
    obj.flowPart292:setMargins({left=5});
    obj.flowPart292:setName("flowPart292");

    obj.buttonpreciosas = GUI.fromHandle(_obj_newObject("button"));
    obj.buttonpreciosas:setParent(obj.flowPart292);
    obj.buttonpreciosas:setName("buttonpreciosas");
    obj.buttonpreciosas:setAlign("client");
    obj.buttonpreciosas:setText("-/+");

    obj.popupRiquezaspreciosas = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupRiquezaspreciosas:setParent(obj.flowLayout59);
    obj.popupRiquezaspreciosas:setName("popupRiquezaspreciosas");
    obj.popupRiquezaspreciosas:setWidth(185);
    obj.popupRiquezaspreciosas:setHeight(50);
    obj.popupRiquezaspreciosas:setBackOpacity(0.4);

    obj.flowLayout61 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout61:setParent(obj.popupRiquezaspreciosas);
    obj.flowLayout61:setAlign("client");
    obj.flowLayout61:setMaxControlsPerLine(3);
    obj.flowLayout61:setName("flowLayout61");

    obj.flowPart293 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart293:setParent(obj.flowLayout61);
    obj.flowPart293:setHeight(20);
    obj.flowPart293:setWidth(110);
    obj.flowPart293:setName("flowPart293");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.flowPart293);
    obj.label141:setText("Somar Riquezas: ");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setVertTextAlign("center");
    obj.label141:setName("label141");

    obj.flowPart294 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart294:setParent(obj.flowLayout61);
    obj.flowPart294:setHeight(20);
    obj.flowPart294:setWidth(30);
    obj.flowPart294:setName("flowPart294");

    obj.somaRiquezasEditpreciosas = GUI.fromHandle(_obj_newObject("edit"));
    obj.somaRiquezasEditpreciosas:setParent(obj.flowPart294);
    obj.somaRiquezasEditpreciosas:setType("number");
    obj.somaRiquezasEditpreciosas:setAlign("client");
    obj.somaRiquezasEditpreciosas:setField("somaRiquezaspreciosas");
    obj.somaRiquezasEditpreciosas:setName("somaRiquezasEditpreciosas");
    obj.somaRiquezasEditpreciosas:setHorzTextAlign("center");
    obj.somaRiquezasEditpreciosas:setVertTextAlign("center");
    obj.somaRiquezasEditpreciosas:setTransparent(true);

    obj.horzLine107 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine107:setParent(obj.flowPart294);
    obj.horzLine107:setAlign("bottom");
    obj.horzLine107:setStrokeColor("#FFFFFF50");
    obj.horzLine107:setStrokeSize(1);
    obj.horzLine107:setName("horzLine107");

    obj.flowPart295 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart295:setParent(obj.flowLayout61);
    obj.flowPart295:setHeight(20);
    obj.flowPart295:setWidth(25);
    obj.flowPart295:setName("flowPart295");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.flowPart295);
    obj.button22:setText("ok");
    obj.button22:setHeight(20);
    obj.button22:setWidth(25);
    obj.button22:setName("button22");

    obj.flowPart296 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart296:setParent(obj.flowLayout61);
    obj.flowPart296:setHeight(20);
    obj.flowPart296:setWidth(40);
    obj.flowPart296:setName("flowPart296");

    obj.radioButton11 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton11:setParent(obj.flowPart296);
    obj.radioButton11:setText("-");
    obj.radioButton11:setGroupName("groupRiquezaspreciosas");
    obj.radioButton11:setField("radioButtonRiquezaspreciosas");
    obj.radioButton11:setFieldValue("-");
    obj.radioButton11:setVertTextAlign("center");
    obj.radioButton11:setName("radioButton11");

    obj.flowPart297 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart297:setParent(obj.flowLayout61);
    obj.flowPart297:setHeight(20);
    obj.flowPart297:setWidth(40);
    obj.flowPart297:setName("flowPart297");

    obj.radioButton12 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton12:setParent(obj.flowPart297);
    obj.radioButton12:setText("+");
    obj.radioButton12:setGroupName("groupRiquezaspreciosas");
    obj.radioButton12:setField("radioButtonRiquezaspreciosas");
    obj.radioButton12:setFieldValue("+");
    obj.radioButton12:setVertTextAlign("center");
    obj.radioButton12:setName("radioButton12");

    obj.flowPart298 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart298:setParent(obj.flowLayout59);
    obj.flowPart298:setHeight(20);
    obj.flowPart298:setWidth(150);
    obj.flowPart298:setName("flowPart298");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.flowPart298);
    obj.label142:setText("Gemas Desconhecidas: ");
    obj.label142:setAlign("client");
    obj.label142:setName("label142");

    obj.horzLine108 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine108:setParent(obj.flowPart298);
    obj.horzLine108:setAlign("bottom");
    obj.horzLine108:setStrokeColor("#FFFFFF50");
    obj.horzLine108:setStrokeSize(1);
    obj.horzLine108:setMargins({right=5});
    obj.horzLine108:setName("horzLine108");

    obj.flowPart299 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart299:setParent(obj.flowLayout59);
    obj.flowPart299:setHeight(20);
    obj.flowPart299:setWidth(30);
    obj.flowPart299:setName("flowPart299");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.flowPart299);
    obj.edit111:setAlign("client");
    obj.edit111:setField("desconhecidas");
    obj.edit111:setName("edit111");

    obj.flowPart300 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart300:setParent(obj.flowLayout59);
    obj.flowPart300:setHeight(20);
    obj.flowPart300:setWidth(30);
    obj.flowPart300:setMargins({left=5});
    obj.flowPart300:setName("flowPart300");

    obj.buttondesconhecidas = GUI.fromHandle(_obj_newObject("button"));
    obj.buttondesconhecidas:setParent(obj.flowPart300);
    obj.buttondesconhecidas:setName("buttondesconhecidas");
    obj.buttondesconhecidas:setAlign("client");
    obj.buttondesconhecidas:setText("-/+");

    obj.popupRiquezasdesconhecidas = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupRiquezasdesconhecidas:setParent(obj.flowLayout59);
    obj.popupRiquezasdesconhecidas:setName("popupRiquezasdesconhecidas");
    obj.popupRiquezasdesconhecidas:setWidth(185);
    obj.popupRiquezasdesconhecidas:setHeight(50);
    obj.popupRiquezasdesconhecidas:setBackOpacity(0.4);

    obj.flowLayout62 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout62:setParent(obj.popupRiquezasdesconhecidas);
    obj.flowLayout62:setAlign("client");
    obj.flowLayout62:setMaxControlsPerLine(3);
    obj.flowLayout62:setName("flowLayout62");

    obj.flowPart301 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart301:setParent(obj.flowLayout62);
    obj.flowPart301:setHeight(20);
    obj.flowPart301:setWidth(110);
    obj.flowPart301:setName("flowPart301");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.flowPart301);
    obj.label143:setText("Somar Riquezas: ");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setVertTextAlign("center");
    obj.label143:setName("label143");

    obj.flowPart302 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart302:setParent(obj.flowLayout62);
    obj.flowPart302:setHeight(20);
    obj.flowPart302:setWidth(30);
    obj.flowPart302:setName("flowPart302");

    obj.somaRiquezasEditdesconhecidas = GUI.fromHandle(_obj_newObject("edit"));
    obj.somaRiquezasEditdesconhecidas:setParent(obj.flowPart302);
    obj.somaRiquezasEditdesconhecidas:setType("number");
    obj.somaRiquezasEditdesconhecidas:setAlign("client");
    obj.somaRiquezasEditdesconhecidas:setField("somaRiquezasdesconhecidas");
    obj.somaRiquezasEditdesconhecidas:setName("somaRiquezasEditdesconhecidas");
    obj.somaRiquezasEditdesconhecidas:setHorzTextAlign("center");
    obj.somaRiquezasEditdesconhecidas:setVertTextAlign("center");
    obj.somaRiquezasEditdesconhecidas:setTransparent(true);

    obj.horzLine109 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine109:setParent(obj.flowPart302);
    obj.horzLine109:setAlign("bottom");
    obj.horzLine109:setStrokeColor("#FFFFFF50");
    obj.horzLine109:setStrokeSize(1);
    obj.horzLine109:setName("horzLine109");

    obj.flowPart303 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart303:setParent(obj.flowLayout62);
    obj.flowPart303:setHeight(20);
    obj.flowPart303:setWidth(25);
    obj.flowPart303:setName("flowPart303");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.flowPart303);
    obj.button23:setText("ok");
    obj.button23:setHeight(20);
    obj.button23:setWidth(25);
    obj.button23:setName("button23");

    obj.flowPart304 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart304:setParent(obj.flowLayout62);
    obj.flowPart304:setHeight(20);
    obj.flowPart304:setWidth(40);
    obj.flowPart304:setName("flowPart304");

    obj.radioButton13 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton13:setParent(obj.flowPart304);
    obj.radioButton13:setText("-");
    obj.radioButton13:setGroupName("groupRiquezasdesconhecidas");
    obj.radioButton13:setField("radioButtonRiquezasdesconhecidas");
    obj.radioButton13:setFieldValue("-");
    obj.radioButton13:setVertTextAlign("center");
    obj.radioButton13:setName("radioButton13");

    obj.flowPart305 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart305:setParent(obj.flowLayout62);
    obj.flowPart305:setHeight(20);
    obj.flowPart305:setWidth(40);
    obj.flowPart305:setName("flowPart305");

    obj.radioButton14 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton14:setParent(obj.flowPart305);
    obj.radioButton14:setText("+");
    obj.radioButton14:setGroupName("groupRiquezasdesconhecidas");
    obj.radioButton14:setField("radioButtonRiquezasdesconhecidas");
    obj.radioButton14:setFieldValue("+");
    obj.radioButton14:setVertTextAlign("center");
    obj.radioButton14:setName("radioButton14");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.scrollBox3);
    obj.richEdit2:setAlign("client");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#40000000");
    obj.richEdit2:setField("inventario");
    obj.richEdit2:setName("richEdit2");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.pgcPrincipal);
    obj.tab4:setTitle("Anotações");
    obj.tab4:setName("tab4");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.tab4);
    obj.rectangle23:setName("rectangle23");
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("#40000000");
    obj.rectangle23:setXradius(10);
    obj.rectangle23:setYradius(10);

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.rectangle23);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.scrollBox4);
    obj.richEdit3:setAlign("client");
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "#40000000");
    obj.richEdit3:setField("anotacoes");
    obj.richEdit3:setName("richEdit3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            
                            sheet.xpAtualClasse = 0
                            sheet.xpAtualProfissao = 0
                            sheet.nivelClasse = 1
                            sheet.nivelProfissao = 1
                            sheet.xpMaxClasse = 100
                            sheet.xpTextoClasse = '0/100'
                            sheet.xpMaxProfissao = 5
                            sheet.xpTextoProfissao = '0/5'
                            sheet.pontosTreinados = 0
                            sheet.pontosRestantes = 2
                            sheet.pDestino = 0
                            sheet.atributoAcerto = 0
                            sheet.atributoMira = 0
                            sheet.atributoEsquiva = 0
                            sheet.atributoBloqueio = 0
                            sheet.classeAcerto = 0
                            sheet.armaAcerto = 0
                            sheet.armaduraAcerto = 0
                            sheet.extraAcerto = 0
                            sheet.classeMira = 0
                            sheet.armaMira = 0
                            sheet.armaduraMira = 0
                            sheet.extraMira = 0
                            sheet.classeEsquiva = 0
                            sheet.armaEsquiva = 0
                            sheet.armaduraEsquiva = 0
                            sheet.extraEsquiva = 0
                            sheet.classeBloqueio = 0
                            sheet.armaBloqueio = 0
                            sheet.armaduraBloqueio = 0
                            sheet.extraBloqueio = 0
                            sheet.conVida = 0
                            sheet.armaVida = 0
                            sheet.armaduraVida = 0
                            sheet.outroVida = 0
                            sheet.extraVida = 0
                            sheet.totalDefesa = 0
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet.pDestino == nil then sheet.pDestino = 0 end
                                                         if sheet.pDestino > 0 then
                                                            sheet.pDestino = sheet.pDestino - 1
                                                         end
                                    
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet.pDestino == nil then sheet.pDestino = 0 end
                                                        sheet.pDestino = sheet.pDestino + 1
                                   
        end, obj);

    obj._e_event3 = obj.rectangleVida:addEventListener("onClick",
        function (_)
            self.popupVida:show('bottomCenter',self.rectangleVida)
        end, obj);

    obj._e_event4 = obj.rectangleDefesa:addEventListener("onClick",
        function (_)
            self.popupDefesa:show('bottomCenter',self.rectangleDefesa)
        end, obj);

    obj._e_event5 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.conVida = sheet.conBase
                                            sheet.totalVida = (tonumber(sheet.conVida) or 0) +
                                            (tonumber(sheet.armaVida) or 0) +
                                            (tonumber(sheet.armaduraVida) or 0) +
                                            (tonumber(sheet.outroVida) or 0) +
                                            (tonumber(sheet.extraVida) or 0)
            
                                            sheet.Vida = sheet.totalVida
                                            sheet.Defesa = sheet.totalDefesa
        end, obj);

    obj._e_event6 = obj.rectangleAcerto:addEventListener("onClick",
        function (_)
            self.popupAcerto:show('bottomCenter',self.rectangleAcerto)
        end, obj);

    obj._e_event7 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.destrezaAcerto = tonumber(sheet.atributoAcerto) or 0
                            sheet.baseAcerto = (tonumber(sheet.destrezaAcerto) or 0) + (tonumber(sheet.classeAcerto) or 0)
                            sheet.totalAcerto = (tonumber(sheet.baseAcerto) or 0) +
                                                    (tonumber(sheet.armaAcerto) or 0) +
                                                    (tonumber(sheet.armaduraAcerto) or 0) +
                                                    (tonumber(sheet.extraAcerto) or 0)
            
                            sheet.destrezaDisponivel = (tonumber(sheet.dexBase) or 0) - (
                            (tonumber(sheet.atributoAcerto) or 0) +
                            (tonumber(sheet.atributoMira) or 0) +
                            (tonumber(sheet.atributoEsquiva) or 0) +
                            (tonumber(sheet.atributoBloqueio) or 0)
                            )
            
                            sheet.modAcerto = tostring("+"..math.floor(tonumber(sheet.totalAcerto)/10))
        end, obj);

    obj._e_event8 = obj.rectangleMira:addEventListener("onClick",
        function (_)
            self.popupMira:show('bottomCenter',self.rectangleMira)
        end, obj);

    obj._e_event9 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.destrezaMira = tonumber(sheet.atributoMira) or 0
                            sheet.baseMira = (tonumber(sheet.destrezaMira) or 0) + (tonumber(sheet.classeMira) or 0)
                            sheet.totalMira = (tonumber(sheet.baseMira) or 0) +
                                                    (tonumber(sheet.armaMira) or 0) +
                                                    (tonumber(sheet.armaduraMira) or 0) +
                                                    (tonumber(sheet.extraMira) or 0)
            
                            sheet.destrezaDisponivel = (tonumber(sheet.dexBase) or 0) - (
                            (tonumber(sheet.atributoAcerto) or 0) +
                            (tonumber(sheet.atributoMira) or 0) +
                            (tonumber(sheet.atributoEsquiva) or 0) +
                            (tonumber(sheet.atributoBloqueio) or 0)
                            )
            
                            sheet.modMira = tostring("+"..math.floor(tonumber(sheet.totalMira)/10))
        end, obj);

    obj._e_event10 = obj.rectangleEsquiva:addEventListener("onClick",
        function (_)
            self.popupEsquiva:show('bottomCenter',self.rectangleEsquiva)
        end, obj);

    obj._e_event11 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.destrezaEsquiva = tonumber(sheet.atributoEsquiva) or 0
                            sheet.baseEsquiva = (tonumber(sheet.destrezaEsquiva) or 0) + (tonumber(sheet.classeEsquiva) or 0)
                            sheet.totalEsquiva = (tonumber(sheet.baseEsquiva) or 0) +
                                                    (tonumber(sheet.armaEsquiva) or 0) +
                                                    (tonumber(sheet.armaduraEsquiva) or 0) +
                                                    (tonumber(sheet.extraEsquiva) or 0)
            
                            sheet.destrezaDisponivel = (tonumber(sheet.dexBase) or 0) - (
                            (tonumber(sheet.atributoAcerto) or 0) +
                            (tonumber(sheet.atributoMira) or 0) +
                            (tonumber(sheet.atributoEsquiva) or 0) +
                            (tonumber(sheet.atributoBloqueio) or 0)
                            )
            
                            sheet.modEsquiva = tostring("+"..math.floor(tonumber(sheet.totalEsquiva)/10))
        end, obj);

    obj._e_event12 = obj.rectangleBloqueio:addEventListener("onClick",
        function (_)
            self.popupBloqueio:show('bottomCenter',self.rectangleBloqueio)
        end, obj);

    obj._e_event13 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.destrezaBloqueio = tonumber(sheet.atributoBloqueio) or 0
                            sheet.baseBloqueio = (tonumber(sheet.destrezaBloqueio) or 0) + (tonumber(sheet.classeBloqueio) or 0)
                            sheet.totalBloqueio = (tonumber(sheet.baseBloqueio) or 0) +
                                                    (tonumber(sheet.armaBloqueio) or 0) +
                                                    (tonumber(sheet.armaduraBloqueio) or 0) +
                                                    (tonumber(sheet.extraBloqueio) or 0)
            
                            sheet.destrezaDisponivel = (tonumber(sheet.dexBase) or 0) - (
                            (tonumber(sheet.atributoAcerto) or 0) +
                            (tonumber(sheet.atributoMira) or 0) +
                            (tonumber(sheet.atributoEsquiva) or 0) +
                            (tonumber(sheet.atributoBloqueio) or 0)
                            )
            
                            sheet.modBloqueio = tostring("+"..math.floor(tonumber(sheet.totalBloqueio)/10))
        end, obj);

    obj._e_event14 = obj.barraxpClasse:addEventListener("onDblClick",
        function (_)
            self.popupxpClasse:show('bottomCenter', self.barraxpClasse)
                                             self.somaxpClasse:setFocus()
        end, obj);

    obj._e_event15 = obj.somaxpClasse:addEventListener("onKeyDown",
        function (_, event)
            
                                    if event.keyCode == 13 then
                                        self.okButtonClasse:setFocus()
                                        local recebido = sheet.somaxpClasse or 0
                                        local atual = sheet.xpAtualClasse or 0
                                        local max = sheet.xpMaxClasse or 0
                                        local nivel = sheet.nivelClasse
                                        local total = atual + recebido
            
            
                                        if self.barraxpClasse == self.barraxpClasse then
                                            while total >= max do
            
                                                total = total - max
                                                sobeNivel('classe');
                                                nivel = nivel + 1
                                                if nivel > 27 then
                                                    max = 100000 + (100000 * (nivel - 28))
                                                elseif nivel > 18 then
                                                    max = 10000 + (10000 * (nivel - 19))
                                                elseif nivel > 9 then
                                                    max = 1000 + (1000 * (nivel - 10))
                                                else
                                                    max = 100 * nivel
                                                end
                                            end
                                        else
                                            while total >= max do
                                                total = total - max
                                                sobeNivel('profissao');
                                                nivel = nivel + 1
                                                max = 5 * nivel
                                            end
                                        end
            
            
                                        atual = total
            
                                        sheet.xpMaxClasse = max
                                        sheet.xpTextoClasse = tostring(atual..'/'..max)
                                        sheet.xpAtualClasse = atual
                                        sheet.somaxpClasse = 0
                                        self.popupxpClasse:close();
                                    end
        end, obj);

    obj._e_event16 = obj.okButtonClasse:addEventListener("onClick",
        function (_)
            
                                     local recebido = sheet.somaxpClasse or 0
                                        local atual = sheet.xpAtualClasse or 0
                                        local max = sheet.xpMaxClasse or 0
            
                                        local total = atual + recebido
            
                                        while total >= max do
            
                                            total = total - max
                                            sobeNivel('classe');
                                            nivel = nivel + 1
                                            if nivel > 27 then
                                                max = 100000 + (100000 * (nivel - 28))
                                            elseif nivel > 18 then
                                                max = 10000 + (10000 * (nivel - 19))
                                            elseif nivel > 9 then
                                                max = 1000 + (1000 * (nivel - 10))
                                            else
                                                max = 100 * nivel
                                            end
                                        end
            
                                        atual = total
            
            
                                        sheet.xpMaxClasse = max
                                        sheet.xpTextoClasse = tostring(atual..'/'..max)
                                        sheet.xpAtualClasse = atual
                                        sheet.somaxpClasse = 0
                                        self.popupxpClasse:close();
        end, obj);

    obj._e_event17 = obj.barraxpProfissao:addEventListener("onDblClick",
        function (_)
            self.popupxpProfissao:show('bottomCenter', self.barraxpProfissao)
                                             self.somaxpProfissao:setFocus()
        end, obj);

    obj._e_event18 = obj.somaxpProfissao:addEventListener("onKeyDown",
        function (_, event)
            
                                    if event.keyCode == 13 then
                                        self.okButtonProfissao:setFocus()
                                        local recebido = sheet.somaxpProfissao or 0
                                        local atual = sheet.xpAtualProfissao or 0
                                        local max = sheet.xpMaxProfissao or 0
                                        local nivel = sheet.nivelProfissao
                                        local total = atual + recebido
            
            
                                        if self.barraxpProfissao == self.barraxpClasse then
                                            while total >= max do
            
                                                total = total - max
                                                sobeNivel('classe');
                                                nivel = nivel + 1
                                                if nivel > 27 then
                                                    max = 100000 + (100000 * (nivel - 28))
                                                elseif nivel > 18 then
                                                    max = 10000 + (10000 * (nivel - 19))
                                                elseif nivel > 9 then
                                                    max = 1000 + (1000 * (nivel - 10))
                                                else
                                                    max = 100 * nivel
                                                end
                                            end
                                        else
                                            while total >= max do
                                                total = total - max
                                                sobeNivel('profissao');
                                                nivel = nivel + 1
                                                max = 5 * nivel
                                            end
                                        end
            
            
                                        atual = total
            
                                        sheet.xpMaxProfissao = max
                                        sheet.xpTextoProfissao = tostring(atual..'/'..max)
                                        sheet.xpAtualProfissao = atual
                                        sheet.somaxpProfissao = 0
                                        self.popupxpProfissao:close();
                                    end
        end, obj);

    obj._e_event19 = obj.okButtonProfissao:addEventListener("onClick",
        function (_)
            
                                     local recebido = sheet.somaxpProfissao or 0
                                        local atual = sheet.xpAtualProfissao or 0
                                        local max = sheet.xpMaxProfissao or 0
            
                                        local total = atual + recebido
            
                                        while total >= max do
            
                                            total = total - max
                                            sobeNivel('classe');
                                            nivel = nivel + 1
                                            if nivel > 27 then
                                                max = 100000 + (100000 * (nivel - 28))
                                            elseif nivel > 18 then
                                                max = 10000 + (10000 * (nivel - 19))
                                            elseif nivel > 9 then
                                                max = 1000 + (1000 * (nivel - 10))
                                            else
                                                max = 100 * nivel
                                            end
                                        end
            
                                        atual = total
            
            
                                        sheet.xpMaxProfissao = max
                                        sheet.xpTextoProfissao = tostring(atual..'/'..max)
                                        sheet.xpAtualProfissao = atual
                                        sheet.somaxpProfissao = 0
                                        self.popupxpProfissao:close();
        end, obj);

    obj._e_event20 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.conBase = (tonumber(sheet.conNivel) or 0) +
                            (tonumber(sheet.conClasse) or 0) +
                            (tonumber(sheet.conRaca) or 0) +
                            (tonumber(sheet.conTreino) or 0) +
                            (tonumber(sheet.conOutros) or 0);
            
                            sheet.conTotal = (tonumber(sheet.conBase) or 0) +
                            (tonumber(sheet.conEquip) or 0);
        end, obj);

    obj._e_event21 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.forBase = (tonumber(sheet.forNivel) or 0) +
                            (tonumber(sheet.forClasse) or 0) +
                            (tonumber(sheet.forRaca) or 0) +
                            (tonumber(sheet.forTreino) or 0) +
                            (tonumber(sheet.forOutros) or 0);
            
                            sheet.forTotal = (tonumber(sheet.forBase) or 0) +
                            (tonumber(sheet.forEquip) or 0);
        end, obj);

    obj._e_event22 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.dexBase = (tonumber(sheet.dexNivel) or 0) +
                            (tonumber(sheet.dexClasse) or 0) +
                            (tonumber(sheet.dexRaca) or 0) +
                            (tonumber(sheet.dexTreino) or 0) +
                            (tonumber(sheet.dexOutros) or 0);
            
                            sheet.dexTotal = (tonumber(sheet.dexBase) or 0) +
                            (tonumber(sheet.dexEquip) or 0);
        end, obj);

    obj._e_event23 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.carBase = (tonumber(sheet.carNivel) or 0) +
                            (tonumber(sheet.carClasse) or 0) +
                            (tonumber(sheet.carRaca) or 0) +
                            (tonumber(sheet.carTreino) or 0) +
                            (tonumber(sheet.carOutros) or 0);
            
                            sheet.carTotal = (tonumber(sheet.carBase) or 0) +
                            (tonumber(sheet.carEquip) or 0);
        end, obj);

    obj._e_event24 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.intBase = (tonumber(sheet.intNivel) or 0) +
                            (tonumber(sheet.intClasse) or 0) +
                            (tonumber(sheet.intRaca) or 0) +
                            (tonumber(sheet.intTreino) or 0) +
                            (tonumber(sheet.intOutros) or 0);
            
                            sheet.intTotal = (tonumber(sheet.intBase) or 0) +
                            (tonumber(sheet.intEquip) or 0);
        end, obj);

    obj._e_event25 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.sabBase = (tonumber(sheet.sabNivel) or 0) +
                            (tonumber(sheet.sabClasse) or 0) +
                            (tonumber(sheet.sabRaca) or 0) +
                            (tonumber(sheet.sabTreino) or 0) +
                            (tonumber(sheet.sabOutros) or 0);
            
                            sheet.sabTotal = (tonumber(sheet.sabBase) or 0) +
                            (tonumber(sheet.sabEquip) or 0);
        end, obj);

    obj._e_event26 = obj.percepcaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.percepcao > valorBase('percepcao') then
                                       sheet.percepcao = (tonumber(sheet.percepcao) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event27 = obj.percepcaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.percepcao == 0 then sheet.percepcao = valorBase('percepcao') end
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.percepcao = (tonumber(sheet.percepcao) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.percepcao = (tonumber(sheet.percepcao) or 0) + 1
                                    end
        end, obj);

    obj._e_event28 = obj.intimidacaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.intimidacao > valorBase('intimidacao') then
                                       sheet.intimidacao = (tonumber(sheet.intimidacao) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event29 = obj.intimidacaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.intimidacao == 0 then sheet.intimidacao = valorBase('intimidacao') end
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.intimidacao = (tonumber(sheet.intimidacao) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.intimidacao = (tonumber(sheet.intimidacao) or 0) + 1
                                    end
        end, obj);

    obj._e_event30 = obj.persuasaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.persuasao > valorBase('persuasao') then
                                       sheet.persuasao = (tonumber(sheet.persuasao) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event31 = obj.persuasaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.persuasao == 0 then sheet.persuasao = valorBase('persuasao') end
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.persuasao = (tonumber(sheet.persuasao) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.persuasao = (tonumber(sheet.persuasao) or 0) + 1
                                    end
        end, obj);

    obj._e_event32 = obj.adestrarAnimaisMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.adestrarAnimais > valorBase('adestrarAnimais') then
                                       sheet.adestrarAnimais = (tonumber(sheet.adestrarAnimais) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event33 = obj.adestrarAnimaisPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.adestrarAnimais == 0 then sheet.adestrarAnimais = valorBase('adestrarAnimais') end
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.adestrarAnimais = (tonumber(sheet.adestrarAnimais) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.adestrarAnimais = (tonumber(sheet.adestrarAnimais) or 0) + 1
                                    end
        end, obj);

    obj._e_event34 = obj.furtividadeMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.furtividade > valorBase('furtividade') then
                                       sheet.furtividade = (tonumber(sheet.furtividade) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event35 = obj.furtividadePlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.furtividade == 0 then sheet.furtividade = valorBase('furtividade') end
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.furtividade = (tonumber(sheet.furtividade) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.furtividade = (tonumber(sheet.furtividade) or 0) + 1
                                    end
        end, obj);

    obj._e_event36 = obj.intuicaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.intuicao > valorBase('intuicao') then
                                       sheet.intuicao = (tonumber(sheet.intuicao) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event37 = obj.intuicaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.intuicao == 0 then sheet.intuicao = valorBase('intuicao') end
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.intuicao = (tonumber(sheet.intuicao) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.intuicao = (tonumber(sheet.intuicao) or 0) + 1
                                    end
        end, obj);

    obj._e_event38 = obj.didaticaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.didatica > valorBase('didatica') then
                                       sheet.didatica = (tonumber(sheet.didatica) or 0) - 1
                                       sheet.pontosRestantes = tonumber(sheet.pontosRestantes) + 1
                                    end
        end, obj);

    obj._e_event39 = obj.didaticaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.didatica == 0 then sheet.didatica = valorBase('didatica') end
                                    if sheet.pontosRestantes > 0 then
                                        sheet.pontosRestantes = tonumber(sheet.pontosRestantes) - 1
                                        sheet.didatica = (tonumber(sheet.didatica) or 0) + 1
                                    else
                                        sheet.pontosTreinados = tonumber(sheet.pontosTreinados) + 1
                                        sheet.didatica = (tonumber(sheet.didatica) or 0) + 1
                                    end
        end, obj);

    obj._e_event40 = obj.geografiaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.geografia > valorBase('geografia') then
                                       sheet.geografia = (tonumber(sheet.geografia) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event41 = obj.geografiaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.geografia == 0 then sheet.geografia = valorBase('geografia') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.geografia = (tonumber(sheet.geografia) or 0) + 1
                                    end
        end, obj);

    obj._e_event42 = obj.historiaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.historia > valorBase('historia') then
                                       sheet.historia = (tonumber(sheet.historia) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event43 = obj.historiaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.historia == 0 then sheet.historia = valorBase('historia') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.historia = (tonumber(sheet.historia) or 0) + 1
                                    end
        end, obj);

    obj._e_event44 = obj.religiaoMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.religiao > valorBase('religiao') then
                                       sheet.religiao = (tonumber(sheet.religiao) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event45 = obj.religiaoPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.religiao == 0 then sheet.religiao = valorBase('religiao') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.religiao = (tonumber(sheet.religiao) or 0) + 1
                                    end
        end, obj);

    obj._e_event46 = obj.magiaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.magia > valorBase('magia') then
                                       sheet.magia = (tonumber(sheet.magia) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event47 = obj.magiaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.magia == 0 then sheet.magia = valorBase('magia') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.magia = (tonumber(sheet.magia) or 0) + 1
                                    end
        end, obj);

    obj._e_event48 = obj.faunafloraMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.faunaflora > valorBase('faunaflora') then
                                       sheet.faunaflora = (tonumber(sheet.faunaflora) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event49 = obj.faunafloraPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.faunaflora == 0 then sheet.faunaflora = valorBase('faunaflora') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.faunaflora = (tonumber(sheet.faunaflora) or 0) + 1
                                    end
        end, obj);

    obj._e_event50 = obj.linguagemComumMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemComum > valorBase('linguagemComum') then
                                       sheet.linguagemComum = (tonumber(sheet.linguagemComum) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event51 = obj.linguagemComumPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemComum == 0 then sheet.linguagemComum = valorBase('linguagemComum') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemComum = (tonumber(sheet.linguagemComum) or 0) + 1
                                    end
        end, obj);

    obj._e_event52 = obj.linguagemOrientalMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemOriental > valorBase('linguagemOriental') then
                                       sheet.linguagemOriental = (tonumber(sheet.linguagemOriental) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event53 = obj.linguagemOrientalPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemOriental == 0 then sheet.linguagemOriental = valorBase('linguagemOriental') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemOriental = (tonumber(sheet.linguagemOriental) or 0) + 1
                                    end
        end, obj);

    obj._e_event54 = obj.linguagemElficaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemElfica > valorBase('linguagemElfica') then
                                       sheet.linguagemElfica = (tonumber(sheet.linguagemElfica) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event55 = obj.linguagemElficaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemElfica == 0 then sheet.linguagemElfica = valorBase('linguagemElfica') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemElfica = (tonumber(sheet.linguagemElfica) or 0) + 1
                                    end
        end, obj);

    obj._e_event56 = obj.linguagemAnaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemAna > valorBase('linguagemAna') then
                                       sheet.linguagemAna = (tonumber(sheet.linguagemAna) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event57 = obj.linguagemAnaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemAna == 0 then sheet.linguagemAna = valorBase('linguagemAna') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemAna = (tonumber(sheet.linguagemAna) or 0) + 1
                                    end
        end, obj);

    obj._e_event58 = obj.linguagemDraconicaMinus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemDraconica > valorBase('linguagemDraconica') then
                                       sheet.linguagemDraconica = (tonumber(sheet.linguagemDraconica) or 0) - 1
                                       sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) - 1
                                    end
        end, obj);

    obj._e_event59 = obj.linguagemDraconicaPlus:addEventListener("onClick",
        function (_)
            
                                    if sheet.linguagemDraconica == 0 then sheet.linguagemDraconica = valorBase('linguagemDraconica') end
                                    if sheet.pontosDeConhecimento > 0 then
                                        sheet.pontosDeConhecimentoDistribuidos = tonumber(sheet.pontosDeConhecimentoDistribuidos) + 1
                                        sheet.linguagemDraconica = (tonumber(sheet.linguagemDraconica) or 0) + 1
                                    end
        end, obj);

    obj._e_event60 = obj.dataLink12:addEventListener("onChange",
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
                        if sheet.magia == nil then sheet.magia = 0 end;
                        if sheet.faunaflora == nil then sheet.faunaflora = 0 end;
                        if sheet.linguagemComum == nil then sheet.linguagemComum = 0 end;
                        if sheet.linguagemOriental == nil then sheet.linguagemOriental = 0 end;
                        if sheet.linguagemElfica == nil then sheet.linguagemElfica = 0 end;
                        if sheet.linguagemAna == nil then sheet.linguagemAna = 0 end;
                        if sheet.linguagemDraconica == nil then sheet.linguagemDraconica = 0 end;
                        if sheet.pontosRestantes == nil then sheet.pontosRestantes = 2 end;
                        if sheet.pontosTreinados == nil then sheet.pontosTreinados = 0 end;
                        if sheet.pontosDeConhecimento == nil then sheet.pontosDeConhecimento = 0 end;
                        if sheet.pontosDeConhecimentoDistribuidos == nil then sheet.pontosDeConhecimentoDistribuidos = 0 end;
                        if sheet.nivelProfissao == nil then sheet.nivelProfissao = 0 end;
                        if sheet.nivelClasse == nil then sheet.nivelClasse = 1 end;
                        if sheet.nivelClasse == 0 then sheet.nivelClasse = 1 end;
                        if sheet.xpAtualClasse == nil then sheet.xpAtualClasse = 0 end;
                        if sheet.xpMaxClasse == nil then sheet.xpMaxClasse = 100 end;
                        if sheet.xpTextoClasse == nil then sheet.xpTextoClasse = '0/100' end;
                        if sheet.xpAtualProfissao == nil then sheet.xpAtualProfissao = 0 end;
                        if sheet.xpMaxProfissao == nil then sheet.xpMaxProfissao = 0 end;
                        if sheet.xpTextoProfissao == nil then sheet.xpTextoProfissao = '0/5' end;
                        if sheet.destrezaDisponivel == nil then sheet.destrezaDisponivel = 0 end;
            
            
                        -- ###### PONTOS DE CONHECIMENTOS ESPECÍFICOS ######
                        sheet.pontosDeConhecimento = tonumber(math.floor(tonumber(sheet.intBase)/5)) -
                        tonumber(sheet.pontosDeConhecimentoDistribuidos)
        end, obj);

    obj._e_event61 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclHabilidadesbase:append();
        end, obj);

    obj._e_event62 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel1:append();
        end, obj);

    obj._e_event63 = obj.button6:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel2:append();
        end, obj);

    obj._e_event64 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel3:append();
        end, obj);

    obj._e_event65 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel4:append();
        end, obj);

    obj._e_event66 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel5:append();
        end, obj);

    obj._e_event67 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel6:append();
        end, obj);

    obj._e_event68 = obj.button11:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel7:append();
        end, obj);

    obj._e_event69 = obj.button12:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel8:append();
        end, obj);

    obj._e_event70 = obj.button13:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel9:append();
        end, obj);

    obj._e_event71 = obj.button14:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel10:append();
        end, obj);

    obj._e_event72 = obj.button15:addEventListener("onClick",
        function (_)
            self.rclHabilidadesnivel11:append();
        end, obj);

    obj._e_event73 = obj.button16:addEventListener("onClick",
        function (_)
            self.rclHabilidadesextras:append();
        end, obj);

    obj._e_event74 = obj.buttonbronze:addEventListener("onClick",
        function (_)
            self.popupRiquezasbronze:show('right',self.buttonbronze)
                                         self.somaRiquezasEditbronze:setFocus()
                                        
        end, obj);

    obj._e_event75 = obj.somaRiquezasEditbronze:addEventListener("onKeyDown",
        function (_, event)
        end, obj);

    obj._e_event76 = obj.button17:addEventListener("onClick",
        function (_)
            
                                                local moeda = 'bronze'
                                                local op = sheet.radioButtonRiquezasbronze
                                                local dif = tonumber(sheet.somaRiquezasbronze)
                                                local atual = tonumber(sheet.bronze) or 0
                                                local bronze = tonumber(sheet.bronze) or 0
                                                local prata = tonumber(sheet.prata) or 0
                                                local ouro = tonumber(sheet.ouro) or 0
                                                local platina = tonumber(sheet.platina) or 0
            
                                                if op == nil then
                                                    showMessage('Afinal tu quer somar ou subtrair?')
                                                    return
                                                end
                                                if op == '-' then
                                                    if dif > atual then
            
                                                        if moeda == 'bronze' then
                                                            if prata > 0 then
                                                                prata = prata - 1
                                                                bronze = (bronze + 100) - dif
                                                            elseif ouro > 0 then
                                                                ouro = ouro - 1
                                                                prata = prata + 99
                                                                bronze = (bronze + 100) - dif
                                                            elseif platina > 0 then
                                                                platina = platina - 1
                                                                ouro = ouro + 99
                                                                prata = prata + 99
                                                                bronze = (bronze + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        elseif moeda == 'prata' then
                                                            if ouro > 0 then
                                                                ouro = ouro - 1
                                                                prata = (prata + 100) - dif
                                                            elseif platina > 0 then
                                                                platina = platina - 1
                                                                ouro = ouro + 99
                                                                prata = (prata + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        elseif moeda == 'ouro' then
                                                            if platina > 0 then
                                                               platina = platina - 1
                                                               ouro = (ouro + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        else showMessage('Pobre. Você não tem dinheiro.')
                                                        end
                                                    else
                                                        atual = atual - dif
                                                        if moeda == 'bronze' then
                                                            bronze = atual
                                                        elseif moeda == 'prata' then
                                                            prata = atual
                                                        elseif moeda == 'ouro' then
                                                            ouro = atual
                                                        elseif moeda == 'platina' then
                                                            platina = atual
                                                        else
                                                        showMessage('Deu ruim')
                                                        end
                                                    end
            
                                                elseif op == '+' then
                                                    atual = atual + dif
                                                    if moeda == 'bronze' then
                                                        bronze = atual
                                                    elseif moeda == 'prata' then
                                                        prata = atual
                                                    elseif moeda == 'ouro' then
                                                        ouro = atual
                                                    elseif moeda == 'platina' then
                                                        platina = atual
                                                    else
                                                        showMessage('Deu ruim')
                                                    end
                                                else showMessage('Deu ruim man.. vê se o botão de + ou - ta selecionado')
                                                end
            
                                                sheet.bronze = bronze
                                                sheet.prata = prata
                                                sheet.ouro = ouro
                                                sheet.platina = platina
                                                sheet.somaRiquezasbronze = 0
                                                self.popupRiquezasbronze:close();
                                                
        end, obj);

    obj._e_event77 = obj.buttonprata:addEventListener("onClick",
        function (_)
            self.popupRiquezasprata:show('right',self.buttonprata)
                                         self.somaRiquezasEditprata:setFocus()
                                        
        end, obj);

    obj._e_event78 = obj.somaRiquezasEditprata:addEventListener("onKeyDown",
        function (_, event)
        end, obj);

    obj._e_event79 = obj.button18:addEventListener("onClick",
        function (_)
            
                                                local moeda = 'prata'
                                                local op = sheet.radioButtonRiquezasprata
                                                local dif = tonumber(sheet.somaRiquezasprata)
                                                local atual = tonumber(sheet.prata) or 0
                                                local bronze = tonumber(sheet.bronze) or 0
                                                local prata = tonumber(sheet.prata) or 0
                                                local ouro = tonumber(sheet.ouro) or 0
                                                local platina = tonumber(sheet.platina) or 0
            
                                                if op == nil then
                                                    showMessage('Afinal tu quer somar ou subtrair?')
                                                    return
                                                end
                                                if op == '-' then
                                                    if dif > atual then
            
                                                        if moeda == 'bronze' then
                                                            if prata > 0 then
                                                                prata = prata - 1
                                                                bronze = (bronze + 100) - dif
                                                            elseif ouro > 0 then
                                                                ouro = ouro - 1
                                                                prata = prata + 99
                                                                bronze = (bronze + 100) - dif
                                                            elseif platina > 0 then
                                                                platina = platina - 1
                                                                ouro = ouro + 99
                                                                prata = prata + 99
                                                                bronze = (bronze + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        elseif moeda == 'prata' then
                                                            if ouro > 0 then
                                                                ouro = ouro - 1
                                                                prata = (prata + 100) - dif
                                                            elseif platina > 0 then
                                                                platina = platina - 1
                                                                ouro = ouro + 99
                                                                prata = (prata + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        elseif moeda == 'ouro' then
                                                            if platina > 0 then
                                                               platina = platina - 1
                                                               ouro = (ouro + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        else showMessage('Pobre. Você não tem dinheiro.')
                                                        end
                                                    else
                                                        atual = atual - dif
                                                        if moeda == 'bronze' then
                                                            bronze = atual
                                                        elseif moeda == 'prata' then
                                                            prata = atual
                                                        elseif moeda == 'ouro' then
                                                            ouro = atual
                                                        elseif moeda == 'platina' then
                                                            platina = atual
                                                        else
                                                        showMessage('Deu ruim')
                                                        end
                                                    end
            
                                                elseif op == '+' then
                                                    atual = atual + dif
                                                    if moeda == 'bronze' then
                                                        bronze = atual
                                                    elseif moeda == 'prata' then
                                                        prata = atual
                                                    elseif moeda == 'ouro' then
                                                        ouro = atual
                                                    elseif moeda == 'platina' then
                                                        platina = atual
                                                    else
                                                        showMessage('Deu ruim')
                                                    end
                                                else showMessage('Deu ruim man.. vê se o botão de + ou - ta selecionado')
                                                end
            
                                                sheet.bronze = bronze
                                                sheet.prata = prata
                                                sheet.ouro = ouro
                                                sheet.platina = platina
                                                sheet.somaRiquezasprata = 0
                                                self.popupRiquezasprata:close();
                                                
        end, obj);

    obj._e_event80 = obj.buttonouro:addEventListener("onClick",
        function (_)
            self.popupRiquezasouro:show('right',self.buttonouro)
                                         self.somaRiquezasEditouro:setFocus()
                                        
        end, obj);

    obj._e_event81 = obj.somaRiquezasEditouro:addEventListener("onKeyDown",
        function (_, event)
        end, obj);

    obj._e_event82 = obj.button19:addEventListener("onClick",
        function (_)
            
                                                local moeda = 'ouro'
                                                local op = sheet.radioButtonRiquezasouro
                                                local dif = tonumber(sheet.somaRiquezasouro)
                                                local atual = tonumber(sheet.ouro) or 0
                                                local bronze = tonumber(sheet.bronze) or 0
                                                local prata = tonumber(sheet.prata) or 0
                                                local ouro = tonumber(sheet.ouro) or 0
                                                local platina = tonumber(sheet.platina) or 0
            
                                                if op == nil then
                                                    showMessage('Afinal tu quer somar ou subtrair?')
                                                    return
                                                end
                                                if op == '-' then
                                                    if dif > atual then
            
                                                        if moeda == 'bronze' then
                                                            if prata > 0 then
                                                                prata = prata - 1
                                                                bronze = (bronze + 100) - dif
                                                            elseif ouro > 0 then
                                                                ouro = ouro - 1
                                                                prata = prata + 99
                                                                bronze = (bronze + 100) - dif
                                                            elseif platina > 0 then
                                                                platina = platina - 1
                                                                ouro = ouro + 99
                                                                prata = prata + 99
                                                                bronze = (bronze + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        elseif moeda == 'prata' then
                                                            if ouro > 0 then
                                                                ouro = ouro - 1
                                                                prata = (prata + 100) - dif
                                                            elseif platina > 0 then
                                                                platina = platina - 1
                                                                ouro = ouro + 99
                                                                prata = (prata + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        elseif moeda == 'ouro' then
                                                            if platina > 0 then
                                                               platina = platina - 1
                                                               ouro = (ouro + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        else showMessage('Pobre. Você não tem dinheiro.')
                                                        end
                                                    else
                                                        atual = atual - dif
                                                        if moeda == 'bronze' then
                                                            bronze = atual
                                                        elseif moeda == 'prata' then
                                                            prata = atual
                                                        elseif moeda == 'ouro' then
                                                            ouro = atual
                                                        elseif moeda == 'platina' then
                                                            platina = atual
                                                        else
                                                        showMessage('Deu ruim')
                                                        end
                                                    end
            
                                                elseif op == '+' then
                                                    atual = atual + dif
                                                    if moeda == 'bronze' then
                                                        bronze = atual
                                                    elseif moeda == 'prata' then
                                                        prata = atual
                                                    elseif moeda == 'ouro' then
                                                        ouro = atual
                                                    elseif moeda == 'platina' then
                                                        platina = atual
                                                    else
                                                        showMessage('Deu ruim')
                                                    end
                                                else showMessage('Deu ruim man.. vê se o botão de + ou - ta selecionado')
                                                end
            
                                                sheet.bronze = bronze
                                                sheet.prata = prata
                                                sheet.ouro = ouro
                                                sheet.platina = platina
                                                sheet.somaRiquezasouro = 0
                                                self.popupRiquezasouro:close();
                                                
        end, obj);

    obj._e_event83 = obj.buttonplatina:addEventListener("onClick",
        function (_)
            self.popupRiquezasplatina:show('right',self.buttonplatina)
                                         self.somaRiquezasEditplatina:setFocus()
                                        
        end, obj);

    obj._e_event84 = obj.somaRiquezasEditplatina:addEventListener("onKeyDown",
        function (_, event)
        end, obj);

    obj._e_event85 = obj.button20:addEventListener("onClick",
        function (_)
            
                                                local moeda = 'platina'
                                                local op = sheet.radioButtonRiquezasplatina
                                                local dif = tonumber(sheet.somaRiquezasplatina)
                                                local atual = tonumber(sheet.platina) or 0
                                                local bronze = tonumber(sheet.bronze) or 0
                                                local prata = tonumber(sheet.prata) or 0
                                                local ouro = tonumber(sheet.ouro) or 0
                                                local platina = tonumber(sheet.platina) or 0
            
                                                if op == nil then
                                                    showMessage('Afinal tu quer somar ou subtrair?')
                                                    return
                                                end
                                                if op == '-' then
                                                    if dif > atual then
            
                                                        if moeda == 'bronze' then
                                                            if prata > 0 then
                                                                prata = prata - 1
                                                                bronze = (bronze + 100) - dif
                                                            elseif ouro > 0 then
                                                                ouro = ouro - 1
                                                                prata = prata + 99
                                                                bronze = (bronze + 100) - dif
                                                            elseif platina > 0 then
                                                                platina = platina - 1
                                                                ouro = ouro + 99
                                                                prata = prata + 99
                                                                bronze = (bronze + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        elseif moeda == 'prata' then
                                                            if ouro > 0 then
                                                                ouro = ouro - 1
                                                                prata = (prata + 100) - dif
                                                            elseif platina > 0 then
                                                                platina = platina - 1
                                                                ouro = ouro + 99
                                                                prata = (prata + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        elseif moeda == 'ouro' then
                                                            if platina > 0 then
                                                               platina = platina - 1
                                                               ouro = (ouro + 100) - dif
                                                            else
                                                                showMessage('Pobre. Você não tem dinheiro.')
                                                            end
                                                        else showMessage('Pobre. Você não tem dinheiro.')
                                                        end
                                                    else
                                                        atual = atual - dif
                                                        if moeda == 'bronze' then
                                                            bronze = atual
                                                        elseif moeda == 'prata' then
                                                            prata = atual
                                                        elseif moeda == 'ouro' then
                                                            ouro = atual
                                                        elseif moeda == 'platina' then
                                                            platina = atual
                                                        else
                                                        showMessage('Deu ruim')
                                                        end
                                                    end
            
                                                elseif op == '+' then
                                                    atual = atual + dif
                                                    if moeda == 'bronze' then
                                                        bronze = atual
                                                    elseif moeda == 'prata' then
                                                        prata = atual
                                                    elseif moeda == 'ouro' then
                                                        ouro = atual
                                                    elseif moeda == 'platina' then
                                                        platina = atual
                                                    else
                                                        showMessage('Deu ruim')
                                                    end
                                                else showMessage('Deu ruim man.. vê se o botão de + ou - ta selecionado')
                                                end
            
                                                sheet.bronze = bronze
                                                sheet.prata = prata
                                                sheet.ouro = ouro
                                                sheet.platina = platina
                                                sheet.somaRiquezasplatina = 0
                                                self.popupRiquezasplatina:close();
                                                
        end, obj);

    obj._e_event86 = obj.buttonraras:addEventListener("onClick",
        function (_)
            self.popupRiquezasraras:show('right',self.buttonraras)
                                         self.somaRiquezasEditraras:setFocus()
                                        
        end, obj);

    obj._e_event87 = obj.somaRiquezasEditraras:addEventListener("onKeyDown",
        function (_, event)
        end, obj);

    obj._e_event88 = obj.button21:addEventListener("onClick",
        function (_)
            
                                                local gema = 'raras'
                                                local op = sheet.radioButtonRiquezasraras
                                                local dif = tonumber(sheet.somaRiquezasraras)
                                                local atual = tonumber(sheet.raras) or 0
                                                local raras = tonumber(sheet.raras) or 0
                                                local preciosas = tonumber(sheet.preciosas) or 0
                                                local desconhecidas = tonumber(sheet.desconhecidas) or 0
            
                                                if op == nil then
                                                     showMessage('Afinal tu quer somar ou subtrair?')
                                                     return
                                                end
                                                if op == '-' then
                                                    if dif > atual then
                                                        showMessage('Gemas Insuficientes.')
                                                    else
                                                        if gema == 'raras' then
                                                            raras = atual - dif
                                                        elseif gema == 'preciosas' then
                                                            preciosas = atual - dif
                                                        elseif gema == 'desconhecidas' then
                                                            desconhecidas = atual - dif
                                                        else
                                                            showMessage('Deu ruim.')
                                                        end
                                                    end
                                                elseif op == '+' then
                                                     if gema == 'raras' then
                                                            raras = atual + dif
                                                        elseif gema == 'preciosas' then
                                                            preciosas = atual + dif
                                                        elseif gema == 'desconhecidas' then
                                                            desconhecidsa = atual + dif
                                                        else
                                                            showMessage('Deu ruim.')
                                                     end
                                                else
                                                     showMessage('Deu ruim man.. vê se o botão de + ou - ta selecionado')
                                                end
            
            
                                                sheet.raras = raras
                                                sheet.precisoas = preciosas
                                                sheet.desconhecidas = desconhecidas
                                                sheet.somaRiquezasraras = 0
                                                self.popupRiquezasraras:close();
                                                
        end, obj);

    obj._e_event89 = obj.buttonpreciosas:addEventListener("onClick",
        function (_)
            self.popupRiquezaspreciosas:show('right',self.buttonpreciosas)
                                         self.somaRiquezasEditpreciosas:setFocus()
                                        
        end, obj);

    obj._e_event90 = obj.somaRiquezasEditpreciosas:addEventListener("onKeyDown",
        function (_, event)
        end, obj);

    obj._e_event91 = obj.button22:addEventListener("onClick",
        function (_)
            
                                                local gema = 'preciosas'
                                                local op = sheet.radioButtonRiquezaspreciosas
                                                local dif = tonumber(sheet.somaRiquezaspreciosas)
                                                local atual = tonumber(sheet.preciosas) or 0
                                                local raras = tonumber(sheet.raras) or 0
                                                local preciosas = tonumber(sheet.preciosas) or 0
                                                local desconhecidas = tonumber(sheet.desconhecidas) or 0
            
                                                if op == nil then
                                                     showMessage('Afinal tu quer somar ou subtrair?')
                                                     return
                                                end
                                                if op == '-' then
                                                    if dif > atual then
                                                        showMessage('Gemas Insuficientes.')
                                                    else
                                                        if gema == 'raras' then
                                                            raras = atual - dif
                                                        elseif gema == 'preciosas' then
                                                            preciosas = atual - dif
                                                        elseif gema == 'desconhecidas' then
                                                            desconhecidas = atual - dif
                                                        else
                                                            showMessage('Deu ruim.')
                                                        end
                                                    end
                                                elseif op == '+' then
                                                     if gema == 'raras' then
                                                            raras = atual + dif
                                                        elseif gema == 'preciosas' then
                                                            preciosas = atual + dif
                                                        elseif gema == 'desconhecidas' then
                                                            desconhecidsa = atual + dif
                                                        else
                                                            showMessage('Deu ruim.')
                                                     end
                                                else
                                                     showMessage('Deu ruim man.. vê se o botão de + ou - ta selecionado')
                                                end
            
            
                                                sheet.raras = raras
                                                sheet.precisoas = preciosas
                                                sheet.desconhecidas = desconhecidas
                                                sheet.somaRiquezaspreciosas = 0
                                                self.popupRiquezaspreciosas:close();
                                                
        end, obj);

    obj._e_event92 = obj.buttondesconhecidas:addEventListener("onClick",
        function (_)
            self.popupRiquezasdesconhecidas:show('right',self.buttondesconhecidas)
                                         self.somaRiquezasEditdesconhecidas:setFocus()
                                        
        end, obj);

    obj._e_event93 = obj.somaRiquezasEditdesconhecidas:addEventListener("onKeyDown",
        function (_, event)
        end, obj);

    obj._e_event94 = obj.button23:addEventListener("onClick",
        function (_)
            
                                                local gema = 'desconhecidas'
                                                local op = sheet.radioButtonRiquezasdesconhecidas
                                                local dif = tonumber(sheet.somaRiquezasdesconhecidas)
                                                local atual = tonumber(sheet.desconhecidas) or 0
                                                local raras = tonumber(sheet.raras) or 0
                                                local preciosas = tonumber(sheet.preciosas) or 0
                                                local desconhecidas = tonumber(sheet.desconhecidas) or 0
            
                                                if op == nil then
                                                     showMessage('Afinal tu quer somar ou subtrair?')
                                                     return
                                                end
                                                if op == '-' then
                                                    if dif > atual then
                                                        showMessage('Gemas Insuficientes.')
                                                    else
                                                        if gema == 'raras' then
                                                            raras = atual - dif
                                                        elseif gema == 'preciosas' then
                                                            preciosas = atual - dif
                                                        elseif gema == 'desconhecidas' then
                                                            desconhecidas = atual - dif
                                                        else
                                                            showMessage('Deu ruim.')
                                                        end
                                                    end
                                                elseif op == '+' then
                                                     if gema == 'raras' then
                                                            raras = atual + dif
                                                        elseif gema == 'preciosas' then
                                                            preciosas = atual + dif
                                                        elseif gema == 'desconhecidas' then
                                                            desconhecidsa = atual + dif
                                                        else
                                                            showMessage('Deu ruim.')
                                                     end
                                                else
                                                     showMessage('Deu ruim man.. vê se o botão de + ou - ta selecionado')
                                                end
            
            
                                                sheet.raras = raras
                                                sheet.precisoas = preciosas
                                                sheet.desconhecidas = desconhecidas
                                                sheet.somaRiquezasdesconhecidas = 0
                                                self.popupRiquezasdesconhecidas:close();
                                                
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
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

        if self.horzLine48 ~= nil then self.horzLine48:destroy(); self.horzLine48 = nil; end;
        if self.flowPart286 ~= nil then self.flowPart286:destroy(); self.flowPart286 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.linguagemElficaMinus ~= nil then self.linguagemElficaMinus:destroy(); self.linguagemElficaMinus = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.flowPart129 ~= nil then self.flowPart129:destroy(); self.flowPart129 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.imagemDoPersonagem ~= nil then self.imagemDoPersonagem:destroy(); self.imagemDoPersonagem = nil; end;
        if self.flowPart259 ~= nil then self.flowPart259:destroy(); self.flowPart259 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.flowPart260 ~= nil then self.flowPart260:destroy(); self.flowPart260 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.flowPart193 ~= nil then self.flowPart193:destroy(); self.flowPart193 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.horzLine47 ~= nil then self.horzLine47:destroy(); self.horzLine47 = nil; end;
        if self.linguagemElficaPlus ~= nil then self.linguagemElficaPlus:destroy(); self.linguagemElficaPlus = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.flowLayout43 ~= nil then self.flowLayout43:destroy(); self.flowLayout43 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.linguagemOrientalMinus ~= nil then self.linguagemOrientalMinus:destroy(); self.linguagemOrientalMinus = nil; end;
        if self.flowPart241 ~= nil then self.flowPart241:destroy(); self.flowPart241 = nil; end;
        if self.flowPart268 ~= nil then self.flowPart268:destroy(); self.flowPart268 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.flowPart243 ~= nil then self.flowPart243:destroy(); self.flowPart243 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.horzLine19 ~= nil then self.horzLine19:destroy(); self.horzLine19 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.topoAtributos ~= nil then self.topoAtributos:destroy(); self.topoAtributos = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.linguagemComumMinus ~= nil then self.linguagemComumMinus:destroy(); self.linguagemComumMinus = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.flowLayout44 ~= nil then self.flowLayout44:destroy(); self.flowLayout44 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.somaRiquezasEditdesconhecidas ~= nil then self.somaRiquezasEditdesconhecidas:destroy(); self.somaRiquezasEditdesconhecidas = nil; end;
        if self.horzLine67 ~= nil then self.horzLine67:destroy(); self.horzLine67 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.horzLine37 ~= nil then self.horzLine37:destroy(); self.horzLine37 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.furtividadePlus ~= nil then self.furtividadePlus:destroy(); self.furtividadePlus = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.horzLine41 ~= nil then self.horzLine41:destroy(); self.horzLine41 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.flowPart128 ~= nil then self.flowPart128:destroy(); self.flowPart128 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.flowPart219 ~= nil then self.flowPart219:destroy(); self.flowPart219 = nil; end;
        if self.flowPart236 ~= nil then self.flowPart236:destroy(); self.flowPart236 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.horzLine54 ~= nil then self.horzLine54:destroy(); self.horzLine54 = nil; end;
        if self.flowLayout31 ~= nil then self.flowLayout31:destroy(); self.flowLayout31 = nil; end;
        if self.flowPart297 ~= nil then self.flowPart297:destroy(); self.flowPart297 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.image37 ~= nil then self.image37:destroy(); self.image37 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.linguagemAnaPlus ~= nil then self.linguagemAnaPlus:destroy(); self.linguagemAnaPlus = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.flowPart145 ~= nil then self.flowPart145:destroy(); self.flowPart145 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.flowPart125 ~= nil then self.flowPart125:destroy(); self.flowPart125 = nil; end;
        if self.flowPart142 ~= nil then self.flowPart142:destroy(); self.flowPart142 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.tabelaConhecimentosEspecificos ~= nil then self.tabelaConhecimentosEspecificos:destroy(); self.tabelaConhecimentosEspecificos = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.flowPart246 ~= nil then self.flowPart246:destroy(); self.flowPart246 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowPart152 ~= nil then self.flowPart152:destroy(); self.flowPart152 = nil; end;
        if self.flowPart169 ~= nil then self.flowPart169:destroy(); self.flowPart169 = nil; end;
        if self.flowPart283 ~= nil then self.flowPart283:destroy(); self.flowPart283 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.flowPart215 ~= nil then self.flowPart215:destroy(); self.flowPart215 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.flowPart113 ~= nil then self.flowPart113:destroy(); self.flowPart113 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.flowPart199 ~= nil then self.flowPart199:destroy(); self.flowPart199 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.dadosAdicionais ~= nil then self.dadosAdicionais:destroy(); self.dadosAdicionais = nil; end;
        if self.rectangleBloqueio ~= nil then self.rectangleBloqueio:destroy(); self.rectangleBloqueio = nil; end;
        if self.perfilLayout ~= nil then self.perfilLayout:destroy(); self.perfilLayout = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.horzLine63 ~= nil then self.horzLine63:destroy(); self.horzLine63 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.horzLine71 ~= nil then self.horzLine71:destroy(); self.horzLine71 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.popupRiquezasbronze ~= nil then self.popupRiquezasbronze:destroy(); self.popupRiquezasbronze = nil; end;
        if self.flowPart144 ~= nil then self.flowPart144:destroy(); self.flowPart144 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.flowLayout62 ~= nil then self.flowLayout62:destroy(); self.flowLayout62 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.okButtonClasse ~= nil then self.okButtonClasse:destroy(); self.okButtonClasse = nil; end;
        if self.geografiaPlus ~= nil then self.geografiaPlus:destroy(); self.geografiaPlus = nil; end;
        if self.horzLine38 ~= nil then self.horzLine38:destroy(); self.horzLine38 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.flowPart118 ~= nil then self.flowPart118:destroy(); self.flowPart118 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.flowLayout61 ~= nil then self.flowLayout61:destroy(); self.flowLayout61 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.horzLine22 ~= nil then self.horzLine22:destroy(); self.horzLine22 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.flowPart183 ~= nil then self.flowPart183:destroy(); self.flowPart183 = nil; end;
        if self.somaRiquezasEditbronze ~= nil then self.somaRiquezasEditbronze:destroy(); self.somaRiquezasEditbronze = nil; end;
        if self.popupRiquezasplatina ~= nil then self.popupRiquezasplatina:destroy(); self.popupRiquezasplatina = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.image35 ~= nil then self.image35:destroy(); self.image35 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.editaHabilidade ~= nil then self.editaHabilidade:destroy(); self.editaHabilidade = nil; end;
        if self.flowPart274 ~= nil then self.flowPart274:destroy(); self.flowPart274 = nil; end;
        if self.faunafloraMinus ~= nil then self.faunafloraMinus:destroy(); self.faunafloraMinus = nil; end;
        if self.flowLayout54 ~= nil then self.flowLayout54:destroy(); self.flowLayout54 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.flowPart205 ~= nil then self.flowPart205:destroy(); self.flowPart205 = nil; end;
        if self.flowPart304 ~= nil then self.flowPart304:destroy(); self.flowPart304 = nil; end;
        if self.flowPart232 ~= nil then self.flowPart232:destroy(); self.flowPart232 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.flowLayout53 ~= nil then self.flowLayout53:destroy(); self.flowLayout53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.tabelaPontosBonus ~= nil then self.tabelaPontosBonus:destroy(); self.tabelaPontosBonus = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.horzLine64 ~= nil then self.horzLine64:destroy(); self.horzLine64 = nil; end;
        if self.dadosDeNivel ~= nil then self.dadosDeNivel:destroy(); self.dadosDeNivel = nil; end;
        if self.flowPart257 ~= nil then self.flowPart257:destroy(); self.flowPart257 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.flowPart222 ~= nil then self.flowPart222:destroy(); self.flowPart222 = nil; end;
        if self.flowPart234 ~= nil then self.flowPart234:destroy(); self.flowPart234 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowPart195 ~= nil then self.flowPart195:destroy(); self.flowPart195 = nil; end;
        if self.horzLine94 ~= nil then self.horzLine94:destroy(); self.horzLine94 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.flowPart188 ~= nil then self.flowPart188:destroy(); self.flowPart188 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.flowPart276 ~= nil then self.flowPart276:destroy(); self.flowPart276 = nil; end;
        if self.horzLine83 ~= nil then self.horzLine83:destroy(); self.horzLine83 = nil; end;
        if self.flowPart180 ~= nil then self.flowPart180:destroy(); self.flowPart180 = nil; end;
        if self.adestrarAnimaisPlus ~= nil then self.adestrarAnimaisPlus:destroy(); self.adestrarAnimaisPlus = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dadosDestaque ~= nil then self.dadosDestaque:destroy(); self.dadosDestaque = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.flowLayout45 ~= nil then self.flowLayout45:destroy(); self.flowLayout45 = nil; end;
        if self.somaRiquezasEditpreciosas ~= nil then self.somaRiquezasEditpreciosas:destroy(); self.somaRiquezasEditpreciosas = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.flowLayout56 ~= nil then self.flowLayout56:destroy(); self.flowLayout56 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.horzLine26 ~= nil then self.horzLine26:destroy(); self.horzLine26 = nil; end;
        if self.flowPart271 ~= nil then self.flowPart271:destroy(); self.flowPart271 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.flowPart124 ~= nil then self.flowPart124:destroy(); self.flowPart124 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.flowPart141 ~= nil then self.flowPart141:destroy(); self.flowPart141 = nil; end;
        if self.flowLayout36 ~= nil then self.flowLayout36:destroy(); self.flowLayout36 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.radioButton12 ~= nil then self.radioButton12:destroy(); self.radioButton12 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.flowPart291 ~= nil then self.flowPart291:destroy(); self.flowPart291 = nil; end;
        if self.popupRiquezasdesconhecidas ~= nil then self.popupRiquezasdesconhecidas:destroy(); self.popupRiquezasdesconhecidas = nil; end;
        if self.flowLayout37 ~= nil then self.flowLayout37:destroy(); self.flowLayout37 = nil; end;
        if self.horzLine99 ~= nil then self.horzLine99:destroy(); self.horzLine99 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.linguagemAnaMinus ~= nil then self.linguagemAnaMinus:destroy(); self.linguagemAnaMinus = nil; end;
        if self.flowPart224 ~= nil then self.flowPart224:destroy(); self.flowPart224 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.horzLine75 ~= nil then self.horzLine75:destroy(); self.horzLine75 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.flowPart155 ~= nil then self.flowPart155:destroy(); self.flowPart155 = nil; end;
        if self.intuicaoPlus ~= nil then self.intuicaoPlus:destroy(); self.intuicaoPlus = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.flowPart261 ~= nil then self.flowPart261:destroy(); self.flowPart261 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.flowPart198 ~= nil then self.flowPart198:destroy(); self.flowPart198 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.flowPart187 ~= nil then self.flowPart187:destroy(); self.flowPart187 = nil; end;
        if self.flowPart192 ~= nil then self.flowPart192:destroy(); self.flowPart192 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.horzLine45 ~= nil then self.horzLine45:destroy(); self.horzLine45 = nil; end;
        if self.rectangleVida ~= nil then self.rectangleVida:destroy(); self.rectangleVida = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.flowPart248 ~= nil then self.flowPart248:destroy(); self.flowPart248 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.somaRiquezasEditprata ~= nil then self.somaRiquezasEditprata:destroy(); self.somaRiquezasEditprata = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.horzLine88 ~= nil then self.horzLine88:destroy(); self.horzLine88 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.horzLine40 ~= nil then self.horzLine40:destroy(); self.horzLine40 = nil; end;
        if self.flowPart230 ~= nil then self.flowPart230:destroy(); self.flowPart230 = nil; end;
        if self.flowPart131 ~= nil then self.flowPart131:destroy(); self.flowPart131 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.flowLayout58 ~= nil then self.flowLayout58:destroy(); self.flowLayout58 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.flowLayout39 ~= nil then self.flowLayout39:destroy(); self.flowLayout39 = nil; end;
        if self.buttonplatina ~= nil then self.buttonplatina:destroy(); self.buttonplatina = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.horzLine44 ~= nil then self.horzLine44:destroy(); self.horzLine44 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.flowLayout29 ~= nil then self.flowLayout29:destroy(); self.flowLayout29 = nil; end;
        if self.horzLine28 ~= nil then self.horzLine28:destroy(); self.horzLine28 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rclHabilidadesnivel9 ~= nil then self.rclHabilidadesnivel9:destroy(); self.rclHabilidadesnivel9 = nil; end;
        if self.flowPart292 ~= nil then self.flowPart292:destroy(); self.flowPart292 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.flowPart263 ~= nil then self.flowPart263:destroy(); self.flowPart263 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.rclHabilidadesnivel10 ~= nil then self.rclHabilidadesnivel10:destroy(); self.rclHabilidadesnivel10 = nil; end;
        if self.flowPart202 ~= nil then self.flowPart202:destroy(); self.flowPart202 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.horzLine84 ~= nil then self.horzLine84:destroy(); self.horzLine84 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.flowPart237 ~= nil then self.flowPart237:destroy(); self.flowPart237 = nil; end;
        if self.rectangleEsquiva ~= nil then self.rectangleEsquiva:destroy(); self.rectangleEsquiva = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.flowPart174 ~= nil then self.flowPart174:destroy(); self.flowPart174 = nil; end;
        if self.horzLine81 ~= nil then self.horzLine81:destroy(); self.horzLine81 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.flowPart252 ~= nil then self.flowPart252:destroy(); self.flowPart252 = nil; end;
        if self.horzLine57 ~= nil then self.horzLine57:destroy(); self.horzLine57 = nil; end;
        if self.persuasaoPlus ~= nil then self.persuasaoPlus:destroy(); self.persuasaoPlus = nil; end;
        if self.flowPart214 ~= nil then self.flowPart214:destroy(); self.flowPart214 = nil; end;
        if self.horzLine33 ~= nil then self.horzLine33:destroy(); self.horzLine33 = nil; end;
        if self.flowPart197 ~= nil then self.flowPart197:destroy(); self.flowPart197 = nil; end;
        if self.flowLayout49 ~= nil then self.flowLayout49:destroy(); self.flowLayout49 = nil; end;
        if self.horzLine105 ~= nil then self.horzLine105:destroy(); self.horzLine105 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.flowLayout40 ~= nil then self.flowLayout40:destroy(); self.flowLayout40 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowPart254 ~= nil then self.flowPart254:destroy(); self.flowPart254 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.flowPart279 ~= nil then self.flowPart279:destroy(); self.flowPart279 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.flowPart136 ~= nil then self.flowPart136:destroy(); self.flowPart136 = nil; end;
        if self.atributosDestreza ~= nil then self.atributosDestreza:destroy(); self.atributosDestreza = nil; end;
        if self.horzLine25 ~= nil then self.horzLine25:destroy(); self.horzLine25 = nil; end;
        if self.geografiaMinus ~= nil then self.geografiaMinus:destroy(); self.geografiaMinus = nil; end;
        if self.flowPart250 ~= nil then self.flowPart250:destroy(); self.flowPart250 = nil; end;
        if self.pgcPrincipal ~= nil then self.pgcPrincipal:destroy(); self.pgcPrincipal = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.horzLine85 ~= nil then self.horzLine85:destroy(); self.horzLine85 = nil; end;
        if self.somaxpClasse ~= nil then self.somaxpClasse:destroy(); self.somaxpClasse = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.intimidacaoMinus ~= nil then self.intimidacaoMinus:destroy(); self.intimidacaoMinus = nil; end;
        if self.rclHabilidadesbase ~= nil then self.rclHabilidadesbase:destroy(); self.rclHabilidadesbase = nil; end;
        if self.flowLayout60 ~= nil then self.flowLayout60:destroy(); self.flowLayout60 = nil; end;
        if self.tabelaDadosImagem ~= nil then self.tabelaDadosImagem:destroy(); self.tabelaDadosImagem = nil; end;
        if self.horzLine52 ~= nil then self.horzLine52:destroy(); self.horzLine52 = nil; end;
        if self.flowPart139 ~= nil then self.flowPart139:destroy(); self.flowPart139 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.flowPart138 ~= nil then self.flowPart138:destroy(); self.flowPart138 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.flowPart191 ~= nil then self.flowPart191:destroy(); self.flowPart191 = nil; end;
        if self.flowPart123 ~= nil then self.flowPart123:destroy(); self.flowPart123 = nil; end;
        if self.horzLine74 ~= nil then self.horzLine74:destroy(); self.horzLine74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.flowPart242 ~= nil then self.flowPart242:destroy(); self.flowPart242 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.flowPart218 ~= nil then self.flowPart218:destroy(); self.flowPart218 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.flowLayout48 ~= nil then self.flowLayout48:destroy(); self.flowLayout48 = nil; end;
        if self.platina ~= nil then self.platina:destroy(); self.platina = nil; end;
        if self.radioButton13 ~= nil then self.radioButton13:destroy(); self.radioButton13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.flowPart210 ~= nil then self.flowPart210:destroy(); self.flowPart210 = nil; end;
        if self.horzLine43 ~= nil then self.horzLine43:destroy(); self.horzLine43 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.flowLayout57 ~= nil then self.flowLayout57:destroy(); self.flowLayout57 = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.rclHabilidadesnivel3 ~= nil then self.rclHabilidadesnivel3:destroy(); self.rclHabilidadesnivel3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.flowPart204 ~= nil then self.flowPart204:destroy(); self.flowPart204 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.flowPart179 ~= nil then self.flowPart179:destroy(); self.flowPart179 = nil; end;
        if self.horzLine21 ~= nil then self.horzLine21:destroy(); self.horzLine21 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.horzLine27 ~= nil then self.horzLine27:destroy(); self.horzLine27 = nil; end;
        if self.flowPart156 ~= nil then self.flowPart156:destroy(); self.flowPart156 = nil; end;
        if self.horzLine46 ~= nil then self.horzLine46:destroy(); self.horzLine46 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.horzLine51 ~= nil then self.horzLine51:destroy(); self.horzLine51 = nil; end;
        if self.flowPart298 ~= nil then self.flowPart298:destroy(); self.flowPart298 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.flowPart293 ~= nil then self.flowPart293:destroy(); self.flowPart293 = nil; end;
        if self.layoutPtBonusEConhecimentos ~= nil then self.layoutPtBonusEConhecimentos:destroy(); self.layoutPtBonusEConhecimentos = nil; end;
        if self.flowPart148 ~= nil then self.flowPart148:destroy(); self.flowPart148 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.adestrarAnimaisMinus ~= nil then self.adestrarAnimaisMinus:destroy(); self.adestrarAnimaisMinus = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.horzLine106 ~= nil then self.horzLine106:destroy(); self.horzLine106 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.horzLine73 ~= nil then self.horzLine73:destroy(); self.horzLine73 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.flowPart153 ~= nil then self.flowPart153:destroy(); self.flowPart153 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.flowPart177 ~= nil then self.flowPart177:destroy(); self.flowPart177 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.flowLayout42 ~= nil then self.flowLayout42:destroy(); self.flowLayout42 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.flowPart167 ~= nil then self.flowPart167:destroy(); self.flowPart167 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.rclHabilidadesnivel6 ~= nil then self.rclHabilidadesnivel6:destroy(); self.rclHabilidadesnivel6 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.flowPart300 ~= nil then self.flowPart300:destroy(); self.flowPart300 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.flowPart134 ~= nil then self.flowPart134:destroy(); self.flowPart134 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.flowPart211 ~= nil then self.flowPart211:destroy(); self.flowPart211 = nil; end;
        if self.buttondesconhecidas ~= nil then self.buttondesconhecidas:destroy(); self.buttondesconhecidas = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.flowPart288 ~= nil then self.flowPart288:destroy(); self.flowPart288 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.flowPart137 ~= nil then self.flowPart137:destroy(); self.flowPart137 = nil; end;
        if self.horzLine78 ~= nil then self.horzLine78:destroy(); self.horzLine78 = nil; end;
        if self.flowPart151 ~= nil then self.flowPart151:destroy(); self.flowPart151 = nil; end;
        if self.flowPart217 ~= nil then self.flowPart217:destroy(); self.flowPart217 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.percepcaoMinus ~= nil then self.percepcaoMinus:destroy(); self.percepcaoMinus = nil; end;
        if self.persuasaoMinus ~= nil then self.persuasaoMinus:destroy(); self.persuasaoMinus = nil; end;
        if self.faunafloraPlus ~= nil then self.faunafloraPlus:destroy(); self.faunafloraPlus = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.horzLine55 ~= nil then self.horzLine55:destroy(); self.horzLine55 = nil; end;
        if self.intimidacaoPlus ~= nil then self.intimidacaoPlus:destroy(); self.intimidacaoPlus = nil; end;
        if self.flowPart200 ~= nil then self.flowPart200:destroy(); self.flowPart200 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.horzLine77 ~= nil then self.horzLine77:destroy(); self.horzLine77 = nil; end;
        if self.flowPart165 ~= nil then self.flowPart165:destroy(); self.flowPart165 = nil; end;
        if self.horzLine65 ~= nil then self.horzLine65:destroy(); self.horzLine65 = nil; end;
        if self.flowPart184 ~= nil then self.flowPart184:destroy(); self.flowPart184 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.horzLine35 ~= nil then self.horzLine35:destroy(); self.horzLine35 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.flowPart181 ~= nil then self.flowPart181:destroy(); self.flowPart181 = nil; end;
        if self.rectangleDefesa ~= nil then self.rectangleDefesa:destroy(); self.rectangleDefesa = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.flowLayout47 ~= nil then self.flowLayout47:destroy(); self.flowLayout47 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.horzLine90 ~= nil then self.horzLine90:destroy(); self.horzLine90 = nil; end;
        if self.flowPart247 ~= nil then self.flowPart247:destroy(); self.flowPart247 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.popupRiquezasprata ~= nil then self.popupRiquezasprata:destroy(); self.popupRiquezasprata = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.horzLine69 ~= nil then self.horzLine69:destroy(); self.horzLine69 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.buttonprata ~= nil then self.buttonprata:destroy(); self.buttonprata = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.horzLine70 ~= nil then self.horzLine70:destroy(); self.horzLine70 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.flowPart157 ~= nil then self.flowPart157:destroy(); self.flowPart157 = nil; end;
        if self.flowPart178 ~= nil then self.flowPart178:destroy(); self.flowPart178 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.horzLine97 ~= nil then self.horzLine97:destroy(); self.horzLine97 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart203 ~= nil then self.flowPart203:destroy(); self.flowPart203 = nil; end;
        if self.somaRiquezasEditraras ~= nil then self.somaRiquezasEditraras:destroy(); self.somaRiquezasEditraras = nil; end;
        if self.flowPart233 ~= nil then self.flowPart233:destroy(); self.flowPart233 = nil; end;
        if self.flowPart290 ~= nil then self.flowPart290:destroy(); self.flowPart290 = nil; end;
        if self.flowPart161 ~= nil then self.flowPart161:destroy(); self.flowPart161 = nil; end;
        if self.flowPart294 ~= nil then self.flowPart294:destroy(); self.flowPart294 = nil; end;
        if self.flowPart272 ~= nil then self.flowPart272:destroy(); self.flowPart272 = nil; end;
        if self.flowPart225 ~= nil then self.flowPart225:destroy(); self.flowPart225 = nil; end;
        if self.rclHabilidadesnivel11 ~= nil then self.rclHabilidadesnivel11:destroy(); self.rclHabilidadesnivel11 = nil; end;
        if self.didaticaMinus ~= nil then self.didaticaMinus:destroy(); self.didaticaMinus = nil; end;
        if self.flowPart223 ~= nil then self.flowPart223:destroy(); self.flowPart223 = nil; end;
        if self.flowLayout30 ~= nil then self.flowLayout30:destroy(); self.flowLayout30 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.buttonbronze ~= nil then self.buttonbronze:destroy(); self.buttonbronze = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.horzLine30 ~= nil then self.horzLine30:destroy(); self.horzLine30 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.horzLine92 ~= nil then self.horzLine92:destroy(); self.horzLine92 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rclHabilidadesnivel1 ~= nil then self.rclHabilidadesnivel1:destroy(); self.rclHabilidadesnivel1 = nil; end;
        if self.flowPart150 ~= nil then self.flowPart150:destroy(); self.flowPart150 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.flowPart140 ~= nil then self.flowPart140:destroy(); self.flowPart140 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.barraxpClasse ~= nil then self.barraxpClasse:destroy(); self.barraxpClasse = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.flowPart190 ~= nil then self.flowPart190:destroy(); self.flowPart190 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.horzLine109 ~= nil then self.horzLine109:destroy(); self.horzLine109 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.okButtonProfissao ~= nil then self.okButtonProfissao:destroy(); self.okButtonProfissao = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.popupxpClasse ~= nil then self.popupxpClasse:destroy(); self.popupxpClasse = nil; end;
        if self.image42 ~= nil then self.image42:destroy(); self.image42 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.horzLine56 ~= nil then self.horzLine56:destroy(); self.horzLine56 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.flowLayout33 ~= nil then self.flowLayout33:destroy(); self.flowLayout33 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.flowPart240 ~= nil then self.flowPart240:destroy(); self.flowPart240 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.dadosDoPersonagem ~= nil then self.dadosDoPersonagem:destroy(); self.dadosDoPersonagem = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.horzLine66 ~= nil then self.horzLine66:destroy(); self.horzLine66 = nil; end;
        if self.flowPart231 ~= nil then self.flowPart231:destroy(); self.flowPart231 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.horzLine76 ~= nil then self.horzLine76:destroy(); self.horzLine76 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.image41 ~= nil then self.image41:destroy(); self.image41 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.horzLine108 ~= nil then self.horzLine108:destroy(); self.horzLine108 = nil; end;
        if self.horzLine62 ~= nil then self.horzLine62:destroy(); self.horzLine62 = nil; end;
        if self.popupRiquezasouro ~= nil then self.popupRiquezasouro:destroy(); self.popupRiquezasouro = nil; end;
        if self.flowPart287 ~= nil then self.flowPart287:destroy(); self.flowPart287 = nil; end;
        if self.dadosGerais ~= nil then self.dadosGerais:destroy(); self.dadosGerais = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.horzLine80 ~= nil then self.horzLine80:destroy(); self.horzLine80 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.horzLine101 ~= nil then self.horzLine101:destroy(); self.horzLine101 = nil; end;
        if self.flowPart209 ~= nil then self.flowPart209:destroy(); self.flowPart209 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.riquezas ~= nil then self.riquezas:destroy(); self.riquezas = nil; end;
        if self.flowPart295 ~= nil then self.flowPart295:destroy(); self.flowPart295 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.vidaEDefesa ~= nil then self.vidaEDefesa:destroy(); self.vidaEDefesa = nil; end;
        if self.historiaPlus ~= nil then self.historiaPlus:destroy(); self.historiaPlus = nil; end;
        if self.buttonouro ~= nil then self.buttonouro:destroy(); self.buttonouro = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.flowPart253 ~= nil then self.flowPart253:destroy(); self.flowPart253 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.horzLine95 ~= nil then self.horzLine95:destroy(); self.horzLine95 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.percepcaoPlus ~= nil then self.percepcaoPlus:destroy(); self.percepcaoPlus = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.tabelaDeAtributos ~= nil then self.tabelaDeAtributos:destroy(); self.tabelaDeAtributos = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.horzLine29 ~= nil then self.horzLine29:destroy(); self.horzLine29 = nil; end;
        if self.flowPart132 ~= nil then self.flowPart132:destroy(); self.flowPart132 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.flowLayout32 ~= nil then self.flowLayout32:destroy(); self.flowLayout32 = nil; end;
        if self.flowPart122 ~= nil then self.flowPart122:destroy(); self.flowPart122 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.rclHabilidadesnivel5 ~= nil then self.rclHabilidadesnivel5:destroy(); self.rclHabilidadesnivel5 = nil; end;
        if self.prata ~= nil then self.prata:destroy(); self.prata = nil; end;
        if self.flowPart235 ~= nil then self.flowPart235:destroy(); self.flowPart235 = nil; end;
        if self.image38 ~= nil then self.image38:destroy(); self.image38 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.horzLine39 ~= nil then self.horzLine39:destroy(); self.horzLine39 = nil; end;
        if self.flowPart220 ~= nil then self.flowPart220:destroy(); self.flowPart220 = nil; end;
        if self.flowLayout51 ~= nil then self.flowLayout51:destroy(); self.flowLayout51 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.horzLine89 ~= nil then self.horzLine89:destroy(); self.horzLine89 = nil; end;
        if self.flowPart256 ~= nil then self.flowPart256:destroy(); self.flowPart256 = nil; end;
        if self.flowPart280 ~= nil then self.flowPart280:destroy(); self.flowPart280 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.horzLine23 ~= nil then self.horzLine23:destroy(); self.horzLine23 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.radioButton14 ~= nil then self.radioButton14:destroy(); self.radioButton14 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.horzLine53 ~= nil then self.horzLine53:destroy(); self.horzLine53 = nil; end;
        if self.horzLine72 ~= nil then self.horzLine72:destroy(); self.horzLine72 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.linguagemDraconicaPlus ~= nil then self.linguagemDraconicaPlus:destroy(); self.linguagemDraconicaPlus = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.horzLine91 ~= nil then self.horzLine91:destroy(); self.horzLine91 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.flowPart244 ~= nil then self.flowPart244:destroy(); self.flowPart244 = nil; end;
        if self.flowPart127 ~= nil then self.flowPart127:destroy(); self.flowPart127 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.rectangleMira ~= nil then self.rectangleMira:destroy(); self.rectangleMira = nil; end;
        if self.flowPart147 ~= nil then self.flowPart147:destroy(); self.flowPart147 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.flowPart158 ~= nil then self.flowPart158:destroy(); self.flowPart158 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.flowPart189 ~= nil then self.flowPart189:destroy(); self.flowPart189 = nil; end;
        if self.horzLine60 ~= nil then self.horzLine60:destroy(); self.horzLine60 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.bronze ~= nil then self.bronze:destroy(); self.bronze = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.flowPart162 ~= nil then self.flowPart162:destroy(); self.flowPart162 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.flowPart176 ~= nil then self.flowPart176:destroy(); self.flowPart176 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.magiaPlus ~= nil then self.magiaPlus:destroy(); self.magiaPlus = nil; end;
        if self.flowPart208 ~= nil then self.flowPart208:destroy(); self.flowPart208 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.flowPart126 ~= nil then self.flowPart126:destroy(); self.flowPart126 = nil; end;
        if self.flowPart281 ~= nil then self.flowPart281:destroy(); self.flowPart281 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.horzLine58 ~= nil then self.horzLine58:destroy(); self.horzLine58 = nil; end;
        if self.flowPart249 ~= nil then self.flowPart249:destroy(); self.flowPart249 = nil; end;
        if self.horzLine20 ~= nil then self.horzLine20:destroy(); self.horzLine20 = nil; end;
        if self.buttonraras ~= nil then self.buttonraras:destroy(); self.buttonraras = nil; end;
        if self.horzLine31 ~= nil then self.horzLine31:destroy(); self.horzLine31 = nil; end;
        if self.popupDefesa ~= nil then self.popupDefesa:destroy(); self.popupDefesa = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.topoPtBonusEConhecimentos ~= nil then self.topoPtBonusEConhecimentos:destroy(); self.topoPtBonusEConhecimentos = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclHabilidadesnivel4 ~= nil then self.rclHabilidadesnivel4:destroy(); self.rclHabilidadesnivel4 = nil; end;
        if self.flowPart216 ~= nil then self.flowPart216:destroy(); self.flowPart216 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.flowPart149 ~= nil then self.flowPart149:destroy(); self.flowPart149 = nil; end;
        if self.popupVida ~= nil then self.popupVida:destroy(); self.popupVida = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.radioButton11 ~= nil then self.radioButton11:destroy(); self.radioButton11 = nil; end;
        if self.flowPart270 ~= nil then self.flowPart270:destroy(); self.flowPart270 = nil; end;
        if self.religiaoMinus ~= nil then self.religiaoMinus:destroy(); self.religiaoMinus = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.flowPart163 ~= nil then self.flowPart163:destroy(); self.flowPart163 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.flowPart226 ~= nil then self.flowPart226:destroy(); self.flowPart226 = nil; end;
        if self.flowLayout38 ~= nil then self.flowLayout38:destroy(); self.flowLayout38 = nil; end;
        if self.flowPart239 ~= nil then self.flowPart239:destroy(); self.flowPart239 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.popupRiquezaspreciosas ~= nil then self.popupRiquezaspreciosas:destroy(); self.popupRiquezaspreciosas = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.image36 ~= nil then self.image36:destroy(); self.image36 = nil; end;
        if self.didaticaPlus ~= nil then self.didaticaPlus:destroy(); self.didaticaPlus = nil; end;
        if self.nome ~= nil then self.nome:destroy(); self.nome = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.flowLayout59 ~= nil then self.flowLayout59:destroy(); self.flowLayout59 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.flowPart228 ~= nil then self.flowPart228:destroy(); self.flowPart228 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.religiaoPlus ~= nil then self.religiaoPlus:destroy(); self.religiaoPlus = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.barraxpProfissao ~= nil then self.barraxpProfissao:destroy(); self.barraxpProfissao = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.popupEsquiva ~= nil then self.popupEsquiva:destroy(); self.popupEsquiva = nil; end;
        if self.dadosNomeNivel ~= nil then self.dadosNomeNivel:destroy(); self.dadosNomeNivel = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.flowPart173 ~= nil then self.flowPart173:destroy(); self.flowPart173 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.horzLine96 ~= nil then self.horzLine96:destroy(); self.horzLine96 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.flowPart207 ~= nil then self.flowPart207:destroy(); self.flowPart207 = nil; end;
        if self.flowPart133 ~= nil then self.flowPart133:destroy(); self.flowPart133 = nil; end;
        if self.flowPart154 ~= nil then self.flowPart154:destroy(); self.flowPart154 = nil; end;
        if self.flowPart255 ~= nil then self.flowPart255:destroy(); self.flowPart255 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.magiaMinus ~= nil then self.magiaMinus:destroy(); self.magiaMinus = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.ouro ~= nil then self.ouro:destroy(); self.ouro = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.flowPart296 ~= nil then self.flowPart296:destroy(); self.flowPart296 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.flowPart227 ~= nil then self.flowPart227:destroy(); self.flowPart227 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.flowPart166 ~= nil then self.flowPart166:destroy(); self.flowPart166 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.horzLine59 ~= nil then self.horzLine59:destroy(); self.horzLine59 = nil; end;
        if self.flowPart135 ~= nil then self.flowPart135:destroy(); self.flowPart135 = nil; end;
        if self.rectangleAcerto ~= nil then self.rectangleAcerto:destroy(); self.rectangleAcerto = nil; end;
        if self.horzLine86 ~= nil then self.horzLine86:destroy(); self.horzLine86 = nil; end;
        if self.horzLine36 ~= nil then self.horzLine36:destroy(); self.horzLine36 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.popupAcerto ~= nil then self.popupAcerto:destroy(); self.popupAcerto = nil; end;
        if self.popupBloqueio ~= nil then self.popupBloqueio:destroy(); self.popupBloqueio = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.habilidadesLayout ~= nil then self.habilidadesLayout:destroy(); self.habilidadesLayout = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.flowPart170 ~= nil then self.flowPart170:destroy(); self.flowPart170 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.flowPart278 ~= nil then self.flowPart278:destroy(); self.flowPart278 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.intuicaoMinus ~= nil then self.intuicaoMinus:destroy(); self.intuicaoMinus = nil; end;
        if self.linguagemOrientalPlus ~= nil then self.linguagemOrientalPlus:destroy(); self.linguagemOrientalPlus = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.horzLine87 ~= nil then self.horzLine87:destroy(); self.horzLine87 = nil; end;
        if self.flowLayout52 ~= nil then self.flowLayout52:destroy(); self.flowLayout52 = nil; end;
        if self.somaRiquezasEditplatina ~= nil then self.somaRiquezasEditplatina:destroy(); self.somaRiquezasEditplatina = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.flowPart160 ~= nil then self.flowPart160:destroy(); self.flowPart160 = nil; end;
        if self.flowPart267 ~= nil then self.flowPart267:destroy(); self.flowPart267 = nil; end;
        if self.horzLine98 ~= nil then self.horzLine98:destroy(); self.horzLine98 = nil; end;
        if self.flowPart245 ~= nil then self.flowPart245:destroy(); self.flowPart245 = nil; end;
        if self.flowPart143 ~= nil then self.flowPart143:destroy(); self.flowPart143 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.flowPart275 ~= nil then self.flowPart275:destroy(); self.flowPart275 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.flowPart273 ~= nil then self.flowPart273:destroy(); self.flowPart273 = nil; end;
        if self.popupxpProfissao ~= nil then self.popupxpProfissao:destroy(); self.popupxpProfissao = nil; end;
        if self.horzLine34 ~= nil then self.horzLine34:destroy(); self.horzLine34 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.somaxpProfissao ~= nil then self.somaxpProfissao:destroy(); self.somaxpProfissao = nil; end;
        if self.horzLine100 ~= nil then self.horzLine100:destroy(); self.horzLine100 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.flowLayout46 ~= nil then self.flowLayout46:destroy(); self.flowLayout46 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.rclHabilidadesnivel2 ~= nil then self.rclHabilidadesnivel2:destroy(); self.rclHabilidadesnivel2 = nil; end;
        if self.flowLayout35 ~= nil then self.flowLayout35:destroy(); self.flowLayout35 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.flowPart262 ~= nil then self.flowPart262:destroy(); self.flowPart262 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine50 ~= nil then self.horzLine50:destroy(); self.horzLine50 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.buttonpreciosas ~= nil then self.buttonpreciosas:destroy(); self.buttonpreciosas = nil; end;
        if self.popupMira ~= nil then self.popupMira:destroy(); self.popupMira = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.flowPart258 ~= nil then self.flowPart258:destroy(); self.flowPart258 = nil; end;
        if self.flowPart186 ~= nil then self.flowPart186:destroy(); self.flowPart186 = nil; end;
        if self.flowPart302 ~= nil then self.flowPart302:destroy(); self.flowPart302 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.flowPart301 ~= nil then self.flowPart301:destroy(); self.flowPart301 = nil; end;
        if self.horzLine93 ~= nil then self.horzLine93:destroy(); self.horzLine93 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.horzLine49 ~= nil then self.horzLine49:destroy(); self.horzLine49 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rclHabilidadesextras ~= nil then self.rclHabilidadesextras:destroy(); self.rclHabilidadesextras = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.horzLine42 ~= nil then self.horzLine42:destroy(); self.horzLine42 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.flowPart277 ~= nil then self.flowPart277:destroy(); self.flowPart277 = nil; end;
        if self.horzLine107 ~= nil then self.horzLine107:destroy(); self.horzLine107 = nil; end;
        if self.flowPart212 ~= nil then self.flowPart212:destroy(); self.flowPart212 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.horzLine79 ~= nil then self.horzLine79:destroy(); self.horzLine79 = nil; end;
        if self.flowPart201 ~= nil then self.flowPart201:destroy(); self.flowPart201 = nil; end;
        if self.horzLine61 ~= nil then self.horzLine61:destroy(); self.horzLine61 = nil; end;
        if self.rclHabilidadesnivel8 ~= nil then self.rclHabilidadesnivel8:destroy(); self.rclHabilidadesnivel8 = nil; end;
        if self.flowPart164 ~= nil then self.flowPart164:destroy(); self.flowPart164 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.flowPart175 ~= nil then self.flowPart175:destroy(); self.flowPart175 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.somaRiquezasEditouro ~= nil then self.somaRiquezasEditouro:destroy(); self.somaRiquezasEditouro = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.flowPart172 ~= nil then self.flowPart172:destroy(); self.flowPart172 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.popupRiquezasraras ~= nil then self.popupRiquezasraras:destroy(); self.popupRiquezasraras = nil; end;
        if self.flowPart130 ~= nil then self.flowPart130:destroy(); self.flowPart130 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.flowLayout41 ~= nil then self.flowLayout41:destroy(); self.flowLayout41 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.flowPart221 ~= nil then self.flowPart221:destroy(); self.flowPart221 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.flowPart305 ~= nil then self.flowPart305:destroy(); self.flowPart305 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.flowLayout55 ~= nil then self.flowLayout55:destroy(); self.flowLayout55 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.flowPart265 ~= nil then self.flowPart265:destroy(); self.flowPart265 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.image39 ~= nil then self.image39:destroy(); self.image39 = nil; end;
        if self.flowPart229 ~= nil then self.flowPart229:destroy(); self.flowPart229 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.flowPart168 ~= nil then self.flowPart168:destroy(); self.flowPart168 = nil; end;
        if self.flowPart299 ~= nil then self.flowPart299:destroy(); self.flowPart299 = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.horzLine82 ~= nil then self.horzLine82:destroy(); self.horzLine82 = nil; end;
        if self.flowPart182 ~= nil then self.flowPart182:destroy(); self.flowPart182 = nil; end;
        if self.flowPart284 ~= nil then self.flowPart284:destroy(); self.flowPart284 = nil; end;
        if self.flowPart285 ~= nil then self.flowPart285:destroy(); self.flowPart285 = nil; end;
        if self.horzLine104 ~= nil then self.horzLine104:destroy(); self.horzLine104 = nil; end;
        if self.image40 ~= nil then self.image40:destroy(); self.image40 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.linguagemComumPlus ~= nil then self.linguagemComumPlus:destroy(); self.linguagemComumPlus = nil; end;
        if self.flowPart194 ~= nil then self.flowPart194:destroy(); self.flowPart194 = nil; end;
        if self.flowLayout50 ~= nil then self.flowLayout50:destroy(); self.flowLayout50 = nil; end;
        if self.horzLine102 ~= nil then self.horzLine102:destroy(); self.horzLine102 = nil; end;
        if self.tabelaPtBonusEConhecimentos ~= nil then self.tabelaPtBonusEConhecimentos:destroy(); self.tabelaPtBonusEConhecimentos = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.flowPart269 ~= nil then self.flowPart269:destroy(); self.flowPart269 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.flowPart159 ~= nil then self.flowPart159:destroy(); self.flowPart159 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.rclHabilidadesnivel7 ~= nil then self.rclHabilidadesnivel7:destroy(); self.rclHabilidadesnivel7 = nil; end;
        if self.flowPart264 ~= nil then self.flowPart264:destroy(); self.flowPart264 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.historiaMinus ~= nil then self.historiaMinus:destroy(); self.historiaMinus = nil; end;
        if self.horzLine32 ~= nil then self.horzLine32:destroy(); self.horzLine32 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.flowPart238 ~= nil then self.flowPart238:destroy(); self.flowPart238 = nil; end;
        if self.horzLine103 ~= nil then self.horzLine103:destroy(); self.horzLine103 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.flowPart185 ~= nil then self.flowPart185:destroy(); self.flowPart185 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.flowPart196 ~= nil then self.flowPart196:destroy(); self.flowPart196 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.linguagemDraconicaMinus ~= nil then self.linguagemDraconicaMinus:destroy(); self.linguagemDraconicaMinus = nil; end;
        if self.horzLine68 ~= nil then self.horzLine68:destroy(); self.horzLine68 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.flowPart282 ~= nil then self.flowPart282:destroy(); self.flowPart282 = nil; end;
        if self.flowLayout34 ~= nil then self.flowLayout34:destroy(); self.flowLayout34 = nil; end;
        if self.flowPart146 ~= nil then self.flowPart146:destroy(); self.flowPart146 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.flowPart171 ~= nil then self.flowPart171:destroy(); self.flowPart171 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.furtividadeMinus ~= nil then self.furtividadeMinus:destroy(); self.furtividadeMinus = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.flowLayout28 ~= nil then self.flowLayout28:destroy(); self.flowLayout28 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.flowPart213 ~= nil then self.flowPart213:destroy(); self.flowPart213 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.flowPart251 ~= nil then self.flowPart251:destroy(); self.flowPart251 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.flowPart266 ~= nil then self.flowPart266:destroy(); self.flowPart266 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.horzLine24 ~= nil then self.horzLine24:destroy(); self.horzLine24 = nil; end;
        if self.flowPart206 ~= nil then self.flowPart206:destroy(); self.flowPart206 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.flowPart289 ~= nil then self.flowPart289:destroy(); self.flowPart289 = nil; end;
        if self.image43 ~= nil then self.image43:destroy(); self.image43 = nil; end;
        if self.flowPart303 ~= nil then self.flowPart303:destroy(); self.flowPart303 = nil; end;
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
    title = "Ficha de Gaia", 
    description=""};

frmFichaDePersonagem = _frmFichaDePersonagem;
Firecast.registrarForm(_frmFichaDePersonagem);
Firecast.registrarDataType(_frmFichaDePersonagem);

return _frmFichaDePersonagem;
