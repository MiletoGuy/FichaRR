require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_habilidadercl()
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
    obj:setName("habilidadercl");
    obj:setHeight(70);
    obj:setMargins({top=2,bottom=2});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setMargins({left=5,right=5,top=5,bottom=5});
    obj.rectangle1:setHeight(60);
    obj.rectangle1:setWidth(400);
    obj.rectangle1:setColor("#40000000");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setName("rectangle1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.rectangle1);
    obj.flowLayout1:setHeight(60);
    obj.flowLayout1:setWidth(400);
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setWidth(280);
    obj.flowPart1:setHeight(25);
    obj.flowPart1:setAlign("left");
    obj.flowPart1:setMargins({left=10,top=5});
    obj.flowPart1:setName("flowPart1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setTextPrompt("Nome da Habilidade");
    obj.edit1:setFontSize(15);
    obj.edit1:setTransparent(true);
    obj.edit1:setField("habilidadeNome");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setWidth(280);
    obj.edit1:setName("edit1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart1);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setStrokeColor("black");
    obj.horzLine1:setName("horzLine1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.flowLayout1);
    obj.rectangle2:setCornerType("innerLine");
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setXradius(3);
    obj.rectangle2:setYradius(3);
    obj.rectangle2:setMargins({left=5,right=5});
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setWidth(55);
    obj.rectangle2:setColor("#40000000");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setName("rectangle2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle2);
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setItems({'', 'C', 'C+','B', 'B+', 'A', 'A+', 'S', 'S+'});
    obj.comboBox1:setField("habilidadeRank");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setName("comboBox1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setHeight(20);
    obj.flowPart2:setWidth(30);
    obj.flowPart2:setAlign("right");
    obj.flowPart2:setMargins({right=10, top=5});
    obj.flowPart2:setName("flowPart2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowPart2);
    obj.rectangle3:setCornerType("innerLine");
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setXradius(3);
    obj.rectangle3:setYradius(3);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setWidth(30);
    obj.rectangle3:setColor("#40000000");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setName("rectangle3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle3);
    obj.edit2:setHeight(20);
    obj.edit2:setWidth(30);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setFontSize(15);
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontColor("black");
    obj.edit2:setField("habilidadeCargas");
    obj.edit2:setType("number");
    obj.edit2:setTransparent(true);
    obj.edit2:setName("edit2");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flowLayout1);
    obj.flowLayout2:setHeight(35);
    obj.flowLayout2:setWidth(400);
    obj.flowLayout2:setAlign("client");
    obj.flowLayout2:setMargins({top=5,left=15});
    obj.flowLayout2:setName("flowLayout2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout2);
    obj.button1:setText("usar");
    obj.button1:setHeight(20);
    obj.button1:setWidth(50);
    obj.button1:setMargins({left=5,right=5});
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout2);
    obj.button2:setText("editar");
    obj.button2:setHeight(20);
    obj.button2:setWidth(50);
    obj.button2:setMargins({left=5,right=5});
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout2);
    obj.button3:setText("i");
    obj.button3:setHeight(20);
    obj.button3:setWidth(20);
    obj.button3:setMargins({left=5,right=5});
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowLayout2);
    obj.button4:setText("excluir");
    obj.button4:setHeight(20);
    obj.button4:setWidth(50);
    obj.button4:setMargins({left=5,right=5});
    obj.button4:setName("button4");

    obj.editaHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.editaHabilidade:setParent(obj);
    obj.editaHabilidade:setName("editaHabilidade");
    obj.editaHabilidade:setHeight(400);
    obj.editaHabilidade:setWidth(752);
    obj.editaHabilidade:setBackOpacity(0.5);

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.editaHabilidade);
    obj.flowLayout3:setAlign("client");
    obj.flowLayout3:setMaxControlsPerLine(1);
    obj.flowLayout3:setMargins({left=10,right=10,top=10,bottom=10});
    obj.flowLayout3:setName("flowLayout3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowLayout3);
    obj.rectangle4:setCornerType("innerLine");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setHeight(200);
    obj.rectangle4:setWidth(732);
    obj.rectangle4:setColor("silver");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setName("rectangle4");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.rectangle4);
    obj.flowLayout4:setHeight(200);
    obj.flowLayout4:setWidth(732);
    obj.flowLayout4:setPadding({left=10,right=10,top=10,bottom=10});
    obj.flowLayout4:setAlign("client");
    obj.flowLayout4:setName("flowLayout4");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.flowLayout4);
    obj.richEdit1:setHeight(200);
    obj.richEdit1:setWidth(712);
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#40000000");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setName("richEdit1");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout3);
    obj.flowPart3:setWidth(135);
    obj.flowPart3:setHeight(20);
    obj.flowPart3:setName("flowPart3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart3);
    obj.label1:setText("Máximo de Cargas:");
    obj.label1:setHeight(20);
    obj.label1:setWidth(110);
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setVertTextAlign("center");
    obj.label1:setAlign("left");
    obj.label1:setName("label1");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setHeight(20);
    obj.edit3:setWidth(25);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setFontSize(15);
    obj.edit3:setAlign("right");
    obj.edit3:setField("habilidadeCargasMax");
    lfm_setPropAsString(obj.edit3, "fontStyle",  "bold");
    obj.edit3:setType("number");
    obj.edit3:setTransparent(true);
    obj.edit3:setName("edit3");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart3);
    obj.horzLine2:setAlign("bottom");
    obj.horzLine2:setStrokeColor("#FFFFFF50");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setMargins({right=5});
    obj.horzLine2:setName("horzLine2");


			local function askForDelete()
				Dialogs.confirmYesNo("Deseja realmente apagar esta habilidade?",
									 function (confirmado)
										if confirmado then
											NDB.deleteNode(self.sheet);
										end;
									 end);
			end;
			


    obj._e_event0 = obj.button2:addEventListener("onClick",
        function (_)
            self.editaHabilidade:show()
        end, obj);

    obj._e_event1 = obj.button3:addEventListener("onClick",
        function (_)
            showMessage(NDB.getChildNodes(NDB.getRoot(self.sheet)))
        end, obj);

    obj._e_event2 = obj.button4:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.editaHabilidade ~= nil then self.editaHabilidade:destroy(); self.editaHabilidade = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newhabilidadercl()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_habilidadercl();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _habilidadercl = {
    newEditor = newhabilidadercl, 
    new = newhabilidadercl, 
    name = "habilidadercl", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

habilidadercl = _habilidadercl;
Firecast.registrarForm(_habilidadercl);

return _habilidadercl;
