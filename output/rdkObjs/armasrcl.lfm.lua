require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_armasrcl()
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
    obj:setName("armasrcl");
    obj:setHeight(600);
    obj:setWidth(400);
    obj:setMargins({top=2,bottom=2});


                local function sobeNivel(campo)
                    if campo == 'classe' then
                        sheet.nivelClasse = sheet.nivelClasse + 1
                        sheet.pontosRestantes = sheet.pontosRestantes + 2
                    elseif campo == 'profissao' then
                        sheet.nivelProfissao = sheet.nivelProfissao + 1
                    end
                end
			


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setXradius(8);
    obj.rectangle1:setYradius(8);
    obj.rectangle1:setMargins({left=5,right=5,top=5,bottom=5});
    obj.rectangle1:setHeight(600);
    obj.rectangle1:setWidth(800);
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setName("rectangle1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.rectangle1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(1);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setMaxWidth(800);
    obj.flowLayout1:setName("flowLayout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowLayout1);
    obj.edit1:setTransparent(true);
    obj.edit1:setField("nomeArma");
    obj.edit1:setFontSize(18);
    obj.edit1:setFontColor("black");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "italic bold");
    obj.edit1:setWidth(600);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowLayout1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeColor("#FFFFFF50");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setName("horzLine1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowLayout1);
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
    obj.image1:setStyle("proportional");
    obj.image1:setOptimize(true);
    obj.image1:setEditable(true);
    obj.image1:setAlign("client");
    obj.image1:setField("imagemArma");
    obj.image1:setMargins({left=5,right=5,top=5,bottom=5});
    obj.image1:setName("image1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setWidth(100);
    obj.flowPart1:setHeight(20);
    obj.flowPart1:setMargins({top=5,bottom=5});
    obj.flowPart1:setName("flowPart1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart1);
    obj.label1:setText("Acerto: +");
    obj.label1:setWidth(54);
    obj.label1:setAlign("left");
    obj.label1:setName("label1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart1);
    obj.edit2:setAlign("client");
    obj.edit2:setTransparent(true);
    obj.edit2:setField("acertoArma");
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setWidth(100);
    obj.flowPart2:setHeight(20);
    obj.flowPart2:setMargins({top=5,bottom=5});
    obj.flowPart2:setName("flowPart2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart2);
    obj.label2:setText("Mira: +");
    obj.label2:setWidth(42);
    obj.label2:setAlign("left");
    obj.label2:setName("label2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart2);
    obj.edit3:setAlign("client");
    obj.edit3:setTransparent(true);
    obj.edit3:setField("miraArma");
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setWidth(100);
    obj.flowPart3:setHeight(20);
    obj.flowPart3:setMargins({top=5,bottom=5});
    obj.flowPart3:setName("flowPart3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setText("Esquiva: +");
    obj.label3:setWidth(59);
    obj.label3:setAlign("left");
    obj.label3:setName("label3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart3);
    obj.edit4:setAlign("client");
    obj.edit4:setTransparent(true);
    obj.edit4:setField("esquivaArma");
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setWidth(100);
    obj.flowPart4:setHeight(20);
    obj.flowPart4:setMargins({top=5,bottom=5});
    obj.flowPart4:setName("flowPart4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setText("Bloqueio: +");
    obj.label4:setWidth(68);
    obj.label4:setAlign("left");
    obj.label4:setName("label4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart4);
    obj.edit5:setAlign("client");
    obj.edit5:setTransparent(true);
    obj.edit5:setField("bloqueioArma");
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout1);
    obj.button1:setText("excluir");
    obj.button1:setHeight(20);
    obj.button1:setWidth(50);
    obj.button1:setMargins({left=5,right=5});
    obj.button1:setName("button1");


			local function askForDelete()
				Dialogs.confirmYesNo("Deseja realmente apagar esta arma?",
									 function (confirmado)
										if confirmado then
											NDB.deleteNode(self.sheet);
										end;
									 end);
			end;
			


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newarmasrcl()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_armasrcl();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _armasrcl = {
    newEditor = newarmasrcl, 
    new = newarmasrcl, 
    name = "armasrcl", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

armasrcl = _armasrcl;
Firecast.registrarForm(_armasrcl);

return _armasrcl;
