require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_AtributoDeEquipamento()
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
    obj:setName("AtributoDeEquipamento");
    obj.grid.role = "container";
    obj.grid["cnt-horz-align"] = "center";
    obj:setMargins({top=5, bottom=5});


                function calcularTotaisAtributos()
                        somacon = 0
                        somafor = 0
                        somadex = 0
                        somacar = 0
                        somaint = 0
                        somasab = 0
                        somaacerto = 0
                        somamira = 0
                        somaesquiva = 0
                        somabloqueio = 0

                        for _, equipamento in ipairs(sheet.rclEquipamentos) do
                                for _, atributo in ipairs(equipamento.rclAtributoEquipamento) do
                                        showMessage("até aqui ok")
                                        if atributo.nomeAtributo == "con" then
                                                somacon = somacon + (atributo.valorAtributo or 0)
                                        elseif atributo.nomeAtributo == "for" then
                                                somafor = somafor + (atributo.valorAtributo or 0)
                                        elseif atributo.nomeAtributo == "dex" then
                                                somadex = somadex + (atributo.valorAtributo or 0)
                                        elseif atributo.nomeAtributo == "car" then
                                                somacar = somacar + (atributo.valorAtributo or 0)
                                        elseif atributo.nomeAtributo == "int" then
                                                somaint = somaint + (atributo.valorAtributo or 0)
                                        elseif atributo.nomeAtributo == "sab" then
                                                somasab = somasab + (atributo.valorAtributo or 0)
                                        elseif atributo.nomeAtributo == "acerto" then
                                                somaacerto = somaacerto + (atributo.valorAtributo or 0)
                                        elseif atributo.nomeAtributo == "mira" then
                                                somamira = somamira + (atributo.valorAtributo or 0)
                                        elseif atributo.nomeAtributo == "esquiva" then
                                                somaesquiva = somaesquiva + (atributo.valorAtributo or 0)
                                        elseif atributo.nomeAtributo == "bloqueio" then
                                                somabloqueio = somabloqueio + (atributo.valorAtributo or 0)
                                        end
                                end
                        end

                        sheet.conEquipTotal = somacon
                        sheet.forEquipTotal = somafor
                        sheet.dexEquipTotal = somadex
                        sheet.carEquipTotal = somacar
                        sheet.intEquipTotal = somaint
                        sheet.sabEquipTotal = somasab
                        sheet.acertoEquipTotal = somaacerto
                        sheet.miraEquipTotal = somamira
                        sheet.esquivaEquipTotal = somaesquiva
                        sheet.bloqueioEquipTotal = somabloqueio
                end

                function calcularTotaisAtributosaaa()
                        showMessage(sheet.equipamentos.atributoEquipamentos)
                end
        


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1.grid.role = "row";
    obj.layout1.grid["min-height"] = 30;
    obj.layout1.grid["cnt-horz-align"] = "center";
    obj.layout1.grid["cnt-vert-align"] = "center";
    obj.layout1:setMargins({top=2, bottom=2});
    obj.layout1.grid["cnt-gutter"] = 10;
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1.grid.role = "block";
    obj.label1:setText("+");
    obj.label1:setWidth(10);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1.grid.role = "col";
    obj.edit1:setField("valorAtributo");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2.grid.role = "block";
    obj.label2:setText("de");
    obj.label2:setWidth(15);
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1.grid.role = "col";
    obj.comboBox1:setField("nomeAtributo");
    obj.comboBox1:setItems({'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto', 'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox1:setValues({'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox1:setName("comboBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("X");
    obj.button1.grid.role = "block";
    obj.button1:setWidth(20);
    obj.button1:setName("button1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'valorAtributo', 'nomeAtributo'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            calcularTotaisAtributos()
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newAtributoDeEquipamento()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_AtributoDeEquipamento();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _AtributoDeEquipamento = {
    newEditor = newAtributoDeEquipamento, 
    new = newAtributoDeEquipamento, 
    name = "AtributoDeEquipamento", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

AtributoDeEquipamento = _AtributoDeEquipamento;
Firecast.registrarForm(_AtributoDeEquipamento);

return _AtributoDeEquipamento;
