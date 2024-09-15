require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAtributosEquipamento()
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
    obj:setName("frmAtributosEquipamento");
    obj.grid.role = "container";
    obj.grid["cnt-horz-align"] = "center";
    obj:setMargins({top=5, bottom=5});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1.grid.role = "row";
    obj.layout1.grid["min-height"] = 30;
    obj.layout1:setMargins({top=2, bottom=2});
    obj.layout1:setName("layout1");

    obj.atributoFixo = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributoFixo:setParent(obj.layout1);
    obj.atributoFixo:setName("atributoFixo");
    obj.atributoFixo.grid.role = "row";
    obj.atributoFixo.grid["min-height"] = 30;
    obj.atributoFixo.grid["cnt-horz-align"] = "center";
    obj.atributoFixo.grid["cnt-vert-align"] = "center";
    obj.atributoFixo:setMargins({top=2, bottom=2});
    obj.atributoFixo.grid["cnt-gutter"] = 10;

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.atributoFixo);
    obj.label1.grid.role = "block";
    obj.label1:setText("+");
    obj.label1:setWidth(10);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.atributoFixo);
    obj.edit1.grid.role = "col";
    obj.edit1:setField("valorAtributo");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.atributoFixo);
    obj.label2.grid.role = "block";
    obj.label2:setText("de");
    obj.label2:setWidth(15);
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.atributoFixo);
    obj.comboBox1.grid.role = "col";
    obj.comboBox1:setField("nomeAtributo");
    obj.comboBox1:setItems({'Vida', 'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox1:setValues({'vida', 'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox1:setName("comboBox1");

    obj.Fixo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Fixo:setParent(obj.atributoFixo);
    obj.Fixo:setField("tipoDeCalculo");
    obj.Fixo.grid.role = "col";
    obj.Fixo.grid.width = 2;
    obj.Fixo:setName("Fixo");
    obj.Fixo:setItems({'Fixo', 'Porcentagem', 'Incremento', 'Fixo * Nível', 'Porcentagem * Nível', 'Incremento * Nível'});
    obj.Fixo:setValues({'Fixo', 'Porcentagem', 'Incremento', 'FixoXNivel', 'PorcentagemXNivel', 'IncrementoXNivel'});

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.atributoFixo);
    obj.dataLink1:setField("tipoDeCalculo");
    obj.dataLink1:setName("dataLink1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.atributoFixo);
    obj.button1:setText("X");
    obj.button1.grid.role = "block";
    obj.button1:setWidth(20);
    obj.button1:setName("button1");

    obj.atributoPorcentagem = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributoPorcentagem:setParent(obj.layout1);
    obj.atributoPorcentagem:setName("atributoPorcentagem");
    obj.atributoPorcentagem.grid.role = "row";
    obj.atributoPorcentagem.grid["min-height"] = 30;
    obj.atributoPorcentagem.grid["cnt-horz-align"] = "center";
    obj.atributoPorcentagem.grid["cnt-vert-align"] = "center";
    obj.atributoPorcentagem:setVisible(false);
    obj.atributoPorcentagem:setMargins({top=2, bottom=2});
    obj.atributoPorcentagem.grid["cnt-gutter"] = 10;

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.atributoPorcentagem);
    obj.label3.grid.role = "block";
    obj.label3:setText("+");
    obj.label3:setWidth(10);
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.atributoPorcentagem);
    obj.edit2.grid.role = "col";
    obj.edit2:setField("valorAtributo");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.atributoPorcentagem);
    obj.label4.grid.role = "block";
    obj.label4:setText("% de");
    obj.label4:setWidth(30);
    obj.label4:setName("label4");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.atributoPorcentagem);
    obj.comboBox2.grid.role = "col";
    obj.comboBox2:setField("nomeAtributo");
    obj.comboBox2:setItems({'Vida', 'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox2:setValues({'vida', 'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox2:setName("comboBox2");

    obj.Porcentagem = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Porcentagem:setParent(obj.atributoPorcentagem);
    obj.Porcentagem:setField("tipoDeCalculo");
    obj.Porcentagem.grid.role = "col";
    obj.Porcentagem.grid.width = 2;
    obj.Porcentagem:setName("Porcentagem");
    obj.Porcentagem:setItems({'Fixo', 'Porcentagem', 'Incremento', 'Fixo * Nível', 'Porcentagem * Nível', 'Incremento * Nível'});
    obj.Porcentagem:setValues({'Fixo', 'Porcentagem', 'Incremento', 'FixoXNivel', 'PorcentagemXNivel', 'IncrementoXNivel'});

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.atributoPorcentagem);
    obj.dataLink2:setField("tipoDeCalculo");
    obj.dataLink2:setName("dataLink2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.atributoPorcentagem);
    obj.button2:setText("X");
    obj.button2.grid.role = "block";
    obj.button2:setWidth(20);
    obj.button2:setName("button2");

    obj.atributoIncremento = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributoIncremento:setParent(obj.layout1);
    obj.atributoIncremento:setName("atributoIncremento");
    obj.atributoIncremento.grid.role = "row";
    obj.atributoIncremento.grid["min-height"] = 30;
    obj.atributoIncremento.grid["cnt-horz-align"] = "center";
    obj.atributoIncremento:setVisible(false);
    obj.atributoIncremento.grid["cnt-vert-align"] = "center";
    obj.atributoIncremento:setMargins({top=2, bottom=2});
    obj.atributoIncremento.grid["cnt-gutter"] = 10;

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.atributoIncremento);
    obj.label5.grid.role = "block";
    obj.label5:setText("+");
    obj.label5:setWidth(10);
    obj.label5:setName("label5");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.atributoIncremento);
    obj.edit3.grid.role = "col";
    obj.edit3:setField("valorAtributo");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.atributoIncremento);
    obj.label6.grid.role = "block";
    obj.label6:setText("% de");
    obj.label6:setWidth(30);
    obj.label6:setName("label6");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.atributoIncremento);
    obj.comboBox3.grid.role = "col";
    obj.comboBox3:setField("nomeAtributoOrigem");
    obj.comboBox3:setItems({'Vida', 'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox3:setValues({'vida', 'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox3:setName("comboBox3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.atributoIncremento);
    obj.label7.grid.role = "block";
    obj.label7:setText("em");
    obj.label7:setWidth(20);
    obj.label7:setName("label7");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.atributoIncremento);
    obj.comboBox4.grid.role = "col";
    obj.comboBox4:setField("nomeAtributo");
    obj.comboBox4:setItems({'Vida', 'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox4:setValues({'vida', 'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox4:setName("comboBox4");

    obj.Incremento = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Incremento:setParent(obj.atributoIncremento);
    obj.Incremento:setField("tipoDeCalculo");
    obj.Incremento.grid.role = "col";
    obj.Incremento.grid.width = 2;
    obj.Incremento:setName("Incremento");
    obj.Incremento:setItems({'Fixo', 'Porcentagem', 'Incremento', 'Fixo * Nível', 'Porcentagem * Nível', 'Incremento * Nível'});
    obj.Incremento:setValues({'Fixo', 'Porcentagem', 'Incremento', 'FixoXNivel', 'PorcentagemXNivel', 'IncrementoXNivel'});

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.atributoIncremento);
    obj.dataLink3:setField("tipoDeCalculo");
    obj.dataLink3:setName("dataLink3");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.atributoIncremento);
    obj.button3:setText("X");
    obj.button3.grid.role = "block";
    obj.button3:setWidth(20);
    obj.button3:setName("button3");

    obj.atributoFixoXNivel = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributoFixoXNivel:setParent(obj.layout1);
    obj.atributoFixoXNivel:setName("atributoFixoXNivel");
    obj.atributoFixoXNivel.grid.role = "row";
    obj.atributoFixoXNivel.grid["min-height"] = 30;
    obj.atributoFixoXNivel.grid["cnt-horz-align"] = "center";
    obj.atributoFixoXNivel.grid["cnt-vert-align"] = "center";
    obj.atributoFixoXNivel:setVisible(false);
    obj.atributoFixoXNivel:setMargins({top=2, bottom=2});
    obj.atributoFixoXNivel.grid["cnt-gutter"] = 10;

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.atributoFixoXNivel);
    obj.label8.grid.role = "block";
    obj.label8:setText("+");
    obj.label8:setWidth(10);
    obj.label8:setName("label8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.atributoFixoXNivel);
    obj.edit4.grid.role = "col";
    obj.edit4:setField("valorAtributo");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.atributoFixoXNivel);
    obj.label9.grid.role = "block";
    obj.label9:setText("x Nível de");
    obj.label9:setWidth(60);
    obj.label9:setName("label9");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.atributoFixoXNivel);
    obj.comboBox5.grid.role = "col";
    obj.comboBox5:setField("nomeAtributo");
    obj.comboBox5:setItems({'Vida', 'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox5:setValues({'vida', 'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox5:setName("comboBox5");

    obj.FixoXNivel = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.FixoXNivel:setParent(obj.atributoFixoXNivel);
    obj.FixoXNivel:setField("tipoDeCalculo");
    obj.FixoXNivel.grid.role = "col";
    obj.FixoXNivel.grid.width = 2;
    obj.FixoXNivel:setName("FixoXNivel");
    obj.FixoXNivel:setItems({'Fixo', 'Porcentagem', 'Incremento', 'Fixo * Nível', 'Porcentagem * Nível', 'Incremento * Nível'});
    obj.FixoXNivel:setValues({'Fixo', 'Porcentagem', 'Incremento', 'FixoXNivel', 'PorcentagemXNivel', 'IncrementoXNivel'});

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.atributoFixoXNivel);
    obj.dataLink4:setField("tipoDeCalculo");
    obj.dataLink4:setName("dataLink4");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.atributoFixoXNivel);
    obj.button4:setText("X");
    obj.button4.grid.role = "block";
    obj.button4:setWidth(20);
    obj.button4:setName("button4");

    obj.atributoPorcentagemXNivel = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributoPorcentagemXNivel:setParent(obj.layout1);
    obj.atributoPorcentagemXNivel:setName("atributoPorcentagemXNivel");
    obj.atributoPorcentagemXNivel.grid.role = "row";
    obj.atributoPorcentagemXNivel.grid["min-height"] = 30;
    obj.atributoPorcentagemXNivel.grid["cnt-horz-align"] = "center";
    obj.atributoPorcentagemXNivel.grid["cnt-vert-align"] = "center";
    obj.atributoPorcentagemXNivel:setVisible(false);
    obj.atributoPorcentagemXNivel:setMargins({top=2, bottom=2});
    obj.atributoPorcentagemXNivel.grid["cnt-gutter"] = 10;

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.atributoPorcentagemXNivel);
    obj.label10.grid.role = "block";
    obj.label10:setText("+");
    obj.label10:setWidth(10);
    obj.label10:setName("label10");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.atributoPorcentagemXNivel);
    obj.edit5.grid.role = "col";
    obj.edit5:setField("valorAtributo");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.atributoPorcentagemXNivel);
    obj.label11.grid.role = "block";
    obj.label11:setText("x Nível % de");
    obj.label11:setWidth(80);
    obj.label11:setName("label11");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.atributoPorcentagemXNivel);
    obj.comboBox6.grid.role = "col";
    obj.comboBox6:setField("nomeAtributo");
    obj.comboBox6:setItems({'Vida', 'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox6:setValues({'vida', 'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox6:setName("comboBox6");

    obj.PorcentagemXNivel = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.PorcentagemXNivel:setParent(obj.atributoPorcentagemXNivel);
    obj.PorcentagemXNivel:setField("tipoDeCalculo");
    obj.PorcentagemXNivel.grid.role = "col";
    obj.PorcentagemXNivel.grid.width = 2;
    obj.PorcentagemXNivel:setName("PorcentagemXNivel");
    obj.PorcentagemXNivel:setItems({'Fixo', 'Porcentagem', 'Incremento', 'Fixo * Nível', 'Porcentagem * Nível', 'Incremento * Nível'});
    obj.PorcentagemXNivel:setValues({'Fixo', 'Porcentagem', 'Incremento', 'FixoXNivel', 'PorcentagemXNivel', 'IncrementoXNivel'});

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.atributoPorcentagemXNivel);
    obj.dataLink5:setField("tipoDeCalculo");
    obj.dataLink5:setName("dataLink5");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.atributoPorcentagemXNivel);
    obj.button5:setText("X");
    obj.button5.grid.role = "block";
    obj.button5:setWidth(20);
    obj.button5:setName("button5");

    obj.atributoIncrementoXNivel = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributoIncrementoXNivel:setParent(obj.layout1);
    obj.atributoIncrementoXNivel:setName("atributoIncrementoXNivel");
    obj.atributoIncrementoXNivel.grid.role = "row";
    obj.atributoIncrementoXNivel.grid["min-height"] = 30;
    obj.atributoIncrementoXNivel.grid["cnt-horz-align"] = "center";
    obj.atributoIncrementoXNivel:setVisible(false);
    obj.atributoIncrementoXNivel.grid["cnt-vert-align"] = "center";
    obj.atributoIncrementoXNivel:setMargins({top=2, bottom=2});
    obj.atributoIncrementoXNivel.grid["cnt-gutter"] = 10;

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.atributoIncrementoXNivel);
    obj.label12.grid.role = "block";
    obj.label12:setText("+");
    obj.label12:setWidth(10);
    obj.label12:setName("label12");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.atributoIncrementoXNivel);
    obj.edit6.grid.role = "col";
    obj.edit6:setField("valorAtributo");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.atributoIncrementoXNivel);
    obj.label13.grid.role = "block";
    obj.label13:setText("x Nível % de");
    obj.label13:setWidth(80);
    obj.label13:setName("label13");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.atributoIncrementoXNivel);
    obj.comboBox7.grid.role = "col";
    obj.comboBox7:setField("nomeAtributoOrigem");
    obj.comboBox7:setItems({'Vida', 'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox7:setValues({'vida', 'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox7:setName("comboBox7");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.atributoIncrementoXNivel);
    obj.label14.grid.role = "block";
    obj.label14:setText("em");
    obj.label14:setWidth(20);
    obj.label14:setName("label14");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.atributoIncrementoXNivel);
    obj.comboBox8.grid.role = "col";
    obj.comboBox8:setField("nomeAtributo");
    obj.comboBox8:setItems({'Vida', 'Constituição', 'Força', 'Destreza', 'Carisma', 'Inteligência', 'Sabedoria', 'Acerto',
'Mira', 'Esquiva', 'Bloqueio'});
    obj.comboBox8:setValues({'vida', 'con', 'for', 'dex', 'car', 'int', 'sab', 'acerto', 'mira', 'esquiva', 'bloqueio'});
    obj.comboBox8:setName("comboBox8");

    obj.IncrementoXNivel = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.IncrementoXNivel:setParent(obj.atributoIncrementoXNivel);
    obj.IncrementoXNivel:setField("tipoDeCalculo");
    obj.IncrementoXNivel.grid.role = "col";
    obj.IncrementoXNivel.grid.width = 2;
    obj.IncrementoXNivel:setName("IncrementoXNivel");
    obj.IncrementoXNivel:setItems({'Fixo', 'Porcentagem', 'Incremento', 'Fixo * Nível', 'Porcentagem * Nível', 'Incremento * Nível'});
    obj.IncrementoXNivel:setValues({'Fixo', 'Porcentagem', 'Incremento', 'FixoXNivel', 'PorcentagemXNivel', 'IncrementoXNivel'});

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.atributoIncrementoXNivel);
    obj.dataLink6:setField("tipoDeCalculo");
    obj.dataLink6:setName("dataLink6");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.atributoIncrementoXNivel);
    obj.button6:setText("X");
    obj.button6.grid.role = "block";
    obj.button6:setWidth(20);
    obj.button6:setName("button6");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.Fixo.visible = false;
            
                            for i, componente in ipairs({ self.atributoFixo, self.atributoPorcentagem,
                            self.atributoIncremento, self.atributoFixoXNivel, self.atributoPorcentagemXNivel,
                            self.atributoIncrementoXNivel }) do
                                if componente.name ~= "atributo" .. sheet.tipoDeCalculo then
                                    componente:destroy()
                                end
                            end
            
                            self['atributo'..tostring(sheet.tipodeCalculo)].visible = true
        end);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.Porcentagem.visible = false;
            
                            for i, componente in ipairs({ self.atributoFixo, self.atributoPorcentagem,
                            self.atributoIncremento, self.atributoFixoXNivel, self.atributoPorcentagemXNivel,
                            self.atributoIncrementoXNivel }) do
                                if componente.name ~= "atributo" .. sheet.tipoDeCalculo then
                                    componente:destroy()
                                end
                            end
            
                            self['atributo'..tostring(sheet.tipodeCalculo)].visible = true
        end);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.Incremento.visible = false;
            
                            for i, componente in ipairs({ self.atributoFixo, self.atributoPorcentagem,
                            self.atributoIncremento, self.atributoFixoXNivel, self.atributoPorcentagemXNivel,
                            self.atributoIncrementoXNivel }) do
                                if componente.name ~= "atributo" .. sheet.tipoDeCalculo then
                                    componente:destroy()
                                end
                            end
            
                            self['atributo'..tostring(sheet.tipodeCalculo)].visible = true
        end);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.FixoXNivel.visible = false;
            
                            for i, componente in ipairs({ self.atributoFixo, self.atributoPorcentagem,
                            self.atributoIncremento, self.atributoFixoXNivel, self.atributoPorcentagemXNivel,
                            self.atributoIncrementoXNivel }) do
                                if componente.name ~= "atributo" .. sheet.tipoDeCalculo then
                                    componente:destroy()
                                end
                            end
            
                            self['atributo'..tostring(sheet.tipodeCalculo)].visible = true
        end);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    obj._e_event8 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.PorcentagemXNivel.visible = false;
            
                            for i, componente in ipairs({ self.atributoFixo, self.atributoPorcentagem,
                            self.atributoIncremento, self.atributoFixoXNivel, self.atributoPorcentagemXNivel,
                            self.atributoIncrementoXNivel }) do
                                if componente.name ~= "atributo" .. sheet.tipoDeCalculo then
                                    componente:destroy()
                                end
                            end
            
                            self['atributo'..tostring(sheet.tipodeCalculo)].visible = true
        end);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    obj._e_event10 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.IncrementoXNivel.visible = false;
            
                            for i, componente in ipairs({ self.atributoFixo, self.atributoPorcentagem,
                            self.atributoIncremento, self.atributoFixoXNivel, self.atributoPorcentagemXNivel,
                            self.atributoIncrementoXNivel }) do
                                if componente.name ~= "atributo" .. sheet.tipoDeCalculo then
                                    componente:destroy()
                                end
                            end
            
                            self['atributo'..tostring(sheet.tipodeCalculo)].visible = true
        end);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    function obj:_releaseEvents()
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

        if self.atributoPorcentagemXNivel ~= nil then self.atributoPorcentagemXNivel:destroy(); self.atributoPorcentagemXNivel = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.Fixo ~= nil then self.Fixo:destroy(); self.Fixo = nil; end;
        if self.atributoPorcentagem ~= nil then self.atributoPorcentagem:destroy(); self.atributoPorcentagem = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.atributoIncremento ~= nil then self.atributoIncremento:destroy(); self.atributoIncremento = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.atributoIncrementoXNivel ~= nil then self.atributoIncrementoXNivel:destroy(); self.atributoIncrementoXNivel = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.Porcentagem ~= nil then self.Porcentagem:destroy(); self.Porcentagem = nil; end;
        if self.Incremento ~= nil then self.Incremento:destroy(); self.Incremento = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.IncrementoXNivel ~= nil then self.IncrementoXNivel:destroy(); self.IncrementoXNivel = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.FixoXNivel ~= nil then self.FixoXNivel:destroy(); self.FixoXNivel = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.atributoFixo ~= nil then self.atributoFixo:destroy(); self.atributoFixo = nil; end;
        if self.atributoFixoXNivel ~= nil then self.atributoFixoXNivel:destroy(); self.atributoFixoXNivel = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.PorcentagemXNivel ~= nil then self.PorcentagemXNivel:destroy(); self.PorcentagemXNivel = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAtributosEquipamento()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAtributosEquipamento();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAtributosEquipamento = {
    newEditor = newfrmAtributosEquipamento, 
    new = newfrmAtributosEquipamento, 
    name = "frmAtributosEquipamento", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmAtributosEquipamento = _frmAtributosEquipamento;
Firecast.registrarForm(_frmAtributosEquipamento);

return _frmAtributosEquipamento;
