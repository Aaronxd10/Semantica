//Briseño Rivera Aaron David 

using System;
using System.Collections.Generic;
//Unidad 3
//Requerimiento 1: 
//  x a) Agregar el residuo de la division en el PorFactor()
//  x b) Agregar en instruccion los incrementos de termino() y los incrementos de factor()
//     a++, a--, a+=1, a-=1, a*=1, a/=1, a%=1
//     en donde el 1 puede ser una expresion
//  c) Programar el destructor 
//        para ejecutar el metodo cerrarArchivo()
//        #libreria especial? contenedor?
//        #en la clase lexico
//Requerimiento 2:
//  c) Marcar errores semanticos cuando los incrementos de termino() o incrementos de factor() superen el limite de la variable
//  d) Considerar el inciso b y c para el for
//  e) Correcto funcionamiento del ciclo while y do while
//Requerimiento 3:
//  a) Considerar las variables y los casteos en las expresiones matematicas en ensamblador
//  B) Considerar el residuo de la division en assembler
//  c) Programar el printf y scanf en assembler
// Requerimiento 4:
//  a) Programar el else en assembler
//  b) Programar el for en assembler
// Requerimiento 5:
//  a) Programar el while en assembler
//  b) Programar el do while en assembler
namespace Semantica
{
    public class Lenguaje : Sintaxis
    {
        List<Variable> variables = new List<Variable>();
        Stack<float> stack = new Stack<float>();

        Variable.TipoDato dominante;

        int cif;
        int cfor;

        public Lenguaje()
        {
            cif = cfor = 0;
        }
        public Lenguaje(string nombre) : base(nombre)
        {
            cif = cfor = 0;
        }
        ~Lenguaje()
        {
            Console.WriteLine("Destructor");
            cerrar();
        }

        private void addVariable(String nombre, Variable.TipoDato tipo)
        {
            variables.Add(new Variable(nombre, tipo));
        }

        private void displayVariables()
        {
            log.WriteLine();
            log.WriteLine("variables: ");
            foreach (Variable v in variables)
            {
                log.WriteLine(v.getNombre() + " " + v.getTipo() + " " + v.getValor());
            }
        }
        private void VariablesASM()
        {
            asm.WriteLine(";Variables");
            foreach (Variable v in variables)
            {
                asm.WriteLine("\t" + v.getNombre() + " DW ? ");
            }
        }

        private bool existeVariable(string nombre)
        {
            foreach (Variable v in variables)
            {
                if (v.getNombre().Equals(nombre))
                {
                    return true;
                }
            }
            return false;
        }
        private void modVariable(string nombre, float nuevoValor)
        {
            foreach (Variable v in variables)
                if (v.getNombre() == nombre)
                {
                    v.setValor(nuevoValor);
                }

        }
        private float getValor(string nombre)
        {
            float n = 0;
            foreach (Variable v in variables)
                if (v.getNombre() == nombre)
                {
                    n = v.getValor();
                    return n;
                }
            return 0;
        }
        private Variable.TipoDato getTipo(string nombre)
        {

            foreach (Variable v in variables)
                if (v.getNombre() == nombre)
                {
                    return v.getTipo();
                }
            return Variable.TipoDato.Char;
        }
        //Programa  -> Librerias? Variables? Main
        public void Programa()
        {
            asm.WriteLine("#make_COM#");
            asm.WriteLine("include emu8086.inc");
            asm.WriteLine("ORG 100h");
            Libreria();
            Variables();
            VariablesASM();
            Main();
            displayVariables();
            asm.WriteLine("RET");
            asm.WriteLine("DEFINE_SCAN_NUM");
        }

        //Librerias -> #include<identificador(.h)?> Librerias?
        private void Libreria()
        {
            if (getContenido() == "#")
            {
                match("#");
                match("include");
                match("<");
                match(Tipos.Identificador);
                if (getContenido() == ".")
                {
                    match(".");
                    match("h");
                }
                match(">");
                Libreria();
            }
        }

        //Variables -> tipo_dato Lista_identificadores; Variables?
        private void Variables()
        {
            if (getClasificacion() == Tipos.TipoDato)
            {
                Variable.TipoDato tipo = Variable.TipoDato.Char;
                switch (getContenido())
                {
                    case "int": tipo = Variable.TipoDato.Int; break;
                    case "float": tipo = Variable.TipoDato.Float; break;
                }
                match(Tipos.TipoDato);
                Lista_identificadores(tipo);
                match(Tipos.FinSentencia);
                Variables();
            }
        }

        //Lista_identificadores -> identificador (,Lista_identificadores)?
        private void Lista_identificadores(Variable.TipoDato tipo)
        {
            if (getClasificacion() == Tipos.Identificador)
            {
                if (!existeVariable(getContenido()))
                {
                    addVariable(getContenido(), tipo);
                }
                else
                {
                    throw new Error("Error de sintaxis, variable duplicada <" + getContenido() + "> en linea: " + linea, log);
                }
            }
            match(Tipos.Identificador);
            if (getContenido() == ",")
            {
                match(",");
                Lista_identificadores(tipo);
            }
        }
        //Main      -> void main() Bloque de instrucciones
        private void Main()
        {
            match("void");
            match("main");
            match("(");
            match(")");
            BloqueInstrucciones(true);
        }
        //Bloque de instrucciones -> {listaIntrucciones?}
        private void BloqueInstrucciones(bool evaluacion)
        {
            match("{");
            if (getContenido() != "}")
            {
                ListaInstrucciones(evaluacion);
            }
            match("}");
        }

        //ListaInstrucciones -> Instruccion ListaInstrucciones?
        private void ListaInstrucciones(bool evaluacion)
        {
            Instruccion(evaluacion);
            if (getContenido() != "}")
            {
                ListaInstrucciones(evaluacion);
            }
        }

        //ListaInstruccionesCase -> Instruccion ListaInstruccionesCase?
        private void ListaInstruccionesCase(bool evaluacion)
        {
            Instruccion(evaluacion);
            if (getContenido() != "case" && getContenido() != "break" && getContenido() != "default" && getContenido() != "}")
            {
                ListaInstruccionesCase(evaluacion);
            }
        }

        //Instruccion -> Printf | Scanf | If | While | do while | For | Switch | Asignacion
        private void Instruccion(bool evaluacion)
        {
            if (getContenido() == "printf")
            {
                Printf(evaluacion);
            }
            else if (getContenido() == "scanf")
            {
                Scanf(evaluacion);
            }
            else if (getContenido() == "if")
            {
                If(evaluacion);
            }
            else if (getContenido() == "while")
            {
                While(evaluacion);
            }
            else if (getContenido() == "do")
            {
                Do(evaluacion);
            }
            else if (getContenido() == "for")
            {
                For(evaluacion);
            }
            else if (getContenido() == "switch")
            {
                Switch(evaluacion);
            }
            else
            {
                Asignacion(evaluacion);
            }
        }
        private Variable.TipoDato evaluaNumero(float resultado)
        {
            if (resultado % 1 != 0)
            {
                return Variable.TipoDato.Float;
            }
            else if (resultado <= 255)
            {
                return Variable.TipoDato.Char;
            }
            else if (resultado <= 65335)
            {
                return Variable.TipoDato.Int;
            }
            return Variable.TipoDato.Float;

        }
        private bool evaluaSemantica(string variable, float resultado)
        {
            Variable.TipoDato tipoDato = getTipo(variable);
            return false;
        }
        //Asignacion -> identificador = cadena | Expresion;
        private void Asignacion(bool evaluacion)
        {
            if (!existeVariable(getContenido()))
            {
                throw new Error("No existe la variable<" + getContenido() + "> en linea: " + linea, log);

            }
            log.WriteLine();
            log.Write(getContenido() + " = ");
            string nombre = getContenido();
            match(Tipos.Identificador);
            if (getClasificacion() == Tipos.IncrementoTermino || getClasificacion() == Tipos.IncrementoFactor)
            {
                //Requerimiento 1.b
                //Requerimiento 1.c
            }
            else
            {

            }
            match(Tipos.Asignacion);
            dominante = Variable.TipoDato.Char;
            Expresion();
            match(";");
            float resultado = stack.Pop();
            asm.WriteLine("POP AX");
            log.Write("= " + resultado);
            log.WriteLine();
            if (dominante < evaluaNumero(resultado))
            {
                dominante = evaluaNumero(resultado);
            }
            if (dominante <= getTipo(nombre))
            {
                if (evaluacion)
                {
                    modVariable(nombre, resultado);
                    asm.WriteLine("MOV " + nombre + ", AX");
                }
            }
            else
            {
                throw new Error("Error de semantica: no podemos asignar un: <" + dominante + "> a un <" + getTipo(nombre) + "> en linea  " + linea, log);
            }

        }

        //While -> while(Condicion) bloque de instrucciones | instruccion
        private void While(bool evaluacion)
        {
            match("while");
            match("(");
            bool ValidarWhile = Condicion("");
            if (!evaluacion)
            {
                ValidarWhile = false;
            }
            match(")");
            if (getContenido() == "{")
            {
                BloqueInstrucciones(evaluacion);
            }
            else
            {
                Instruccion(evaluacion);
            }
        }

        //Do -> do bloque de instrucciones | intruccion while(Condicion)
        private void Do(bool evaluacion)
        {
            match("do");
            if (getContenido() == "{")
            {
                BloqueInstrucciones(evaluacion);
            }
            else
            {
                Instruccion(evaluacion);
            }
            match("while");
            match("(");
            bool ValidarDo = Condicion("");
            if (!evaluacion)
            {
                ValidarDo = false;
            }
            match(")");
            match(";");
        }

        //For -> for(Asignacion Condicion; Incremento) BloqueInstruccones | Intruccion 
        private void For(bool evaluacion)
        {
            string etiquetaInicioFor = "InicioFor" + cfor;
            string etiquetaFinFor = "FinFor" + cfor++;
            asm.WriteLine(etiquetaInicioFor + " ;");
            match("for");
            match("(");
            Asignacion(evaluacion);
            bool ValidarFor;
            string variable = getContenido();
            int pos = posicion;
            int lin = linea;
            do
            {
                ValidarFor = Condicion("");
                if (!evaluacion)
                {
                    ValidarFor = false;
                }
                match(";");
                Incremento(ValidarFor);
                //Requerimiento 1.d
                match(")");
                if (getContenido() == "{")
                {
                    BloqueInstrucciones(ValidarFor);
                }
                else
                {
                    Instruccion(ValidarFor);
                }
                if (ValidarFor)
                {
                    posicion = pos - variable.Length;
                    linea = lin;
                    archivo.DiscardBufferedData();
                    archivo.BaseStream.Seek(posicion, SeekOrigin.Begin);
                    NextToken();
                }
            } while (ValidarFor);
            asm.WriteLine(etiquetaFinFor + " ;");
        }

        //Incremento -> Identificador ++ | --
        private void Incremento(bool evaluacion)
        {
            string variable = getContenido();
            if (!existeVariable(getContenido()))
            {
                throw new Error("No existe la variable<" + getContenido() + "> en linea: " + linea, log);

            }
            match(Tipos.Identificador);
            if (getContenido() == "++")
            {
                match("++");
                if (evaluacion)
                {
                    modVariable(variable, getValor(variable) + 1);
                }
            }
            else
            {
                match("--");
                if (evaluacion)
                {
                    modVariable(variable, getValor(variable) - 1);
                }
            }
        }

        //Switch -> switch (Expresion) {Lista de casos} | (default: )
        private void Switch(bool evaluacion)
        {
            match("switch");
            match("(");
            Expresion();
            stack.Pop();
            asm.WriteLine("POP AX");
            match(")");
            match("{");
            ListaDeCasos(evaluacion);
            if (getContenido() == "default")
            {
                match("default");
                match(":");
                if (getContenido() == "{")
                {
                    BloqueInstrucciones(evaluacion);
                }
                else
                {
                    Instruccion(evaluacion);
                }
            }
            match("}");
        }

        //ListaDeCasos -> case Expresion: listaInstruccionesCase (break;)? (ListaDeCasos)?
        private void ListaDeCasos(bool evaluacion)
        {
            match("case");
            Expresion();
            stack.Pop();
            asm.WriteLine("POP AX");
            match(":");
            ListaInstruccionesCase(evaluacion);
            if (getContenido() == "break")
            {
                match("break");
                match(";");
            }
            if (getContenido() == "case")
            {
                ListaDeCasos(evaluacion);
            }
        }

        //Condicion -> Expresion operador relacional Expresion
        private bool Condicion(string etiqueta)
        {
            Expresion();
            string operador = getContenido();
            match(Tipos.OperadorRelacional);
            Expresion();
            float e2 = stack.Pop();
            asm.WriteLine("POP AX");
            float e1 = stack.Pop();
            asm.WriteLine("POP BX");
            asm.WriteLine("CMP AX, BX");
            switch (operador)
            {
                case "==":
                    asm.WriteLine("JNE" + etiqueta);
                    return e1 == e2;
                case ">":
                    asm.WriteLine("JLE" + etiqueta);
                    return e1 > e2;
                case ">=":
                    asm.WriteLine("JL" + etiqueta);
                    return e1 >= e2;
                case "<":
                    asm.WriteLine("JGE" + etiqueta);
                    return e1 < e2;
                case "<=":
                    asm.WriteLine("JG" + etiqueta);
                    return e1 <= e2;
                default:
                    asm.WriteLine("JE" + etiqueta);
                    return e1 != e2;

            }
        }

        //If -> if(Condicion) bloque de instrucciones (else bloque de instrucciones)?
        private void If(bool evaluacion)
        {
            string etiquetaIf = "if" + ++cif;
            match("if");
            match("(");
            bool validarIf = Condicion("");
            if (!evaluacion)
            {
                validarIf = false;
            }
            match(")");
            if (getContenido() == "{")
            {
                BloqueInstrucciones(validarIf);
            }
            else
            {
                Instruccion(validarIf);
            }

            if (getContenido() == "else")
            {
                match("else");
                if (getContenido() == "{")
                {

                    if (evaluacion)
                    {
                        BloqueInstrucciones(!validarIf);
                    }
                    else
                    {
                        BloqueInstrucciones(evaluacion);
                    }
                }
                else
                {
                    if (evaluacion)
                    {
                        Instruccion(!validarIf);
                    }
                    else
                    {
                        Instruccion(evaluacion);
                    }
                }
            }
            cif++;
            asm.WriteLine(etiquetaIf + ":");
        }

        //Printf -> printf(cadena|expresion);
        private void Printf(bool evaluacion)
        {
            match("printf");
            match("(");
            if (getClasificacion() == Tipos.Cadena)
            {
                //Console.WriteLine(getContenido().Replace("\"", " ").Replace("\\n", "\n").Replace("\\t", "    "));
                if (evaluacion)
                {
                    Console.Write(getContenido().Replace("\"", " ").Replace("\\n", "\n").Replace("\\t", "    "));
                }
                asm.WriteLine("PRINTN \"" + getContenido().Replace("\"", "").Replace("\\n", "\n").Replace("\\t", "    ") + "\"");
                match(Tipos.Cadena);
            }
            else
            {
                Expresion();
                float resultado = stack.Pop();
                asm.WriteLine("POP AX");
                if (evaluacion)
                {
                    Console.Write(resultado);
                    //Codigo ensambaldor para imprimir una variable 
                }
            }
            match(")");
            match(";");
        }

        //Scanf -> scanf(cadena, &Identificador);
        private void Scanf(bool evaluacion)
        {
            match("scanf");
            match("(");
            match(Tipos.Cadena);
            match(",");
            match("&");
            if (!existeVariable(getContenido()))
            {
                throw new Error("No existe la variable<" + getContenido() + "> en linea: " + linea, log);

            }
            if (evaluacion)
            {
                string val = "" + Console.ReadLine();
                double numeroval;
                if (!double.TryParse(val, out numeroval))
                {
                    throw new Error("Error, no asignaste un numero en linea: " + linea, log);
                }
                modVariable(getContenido(), float.Parse(val));
                asm.WriteLine("CALL SCAN_NUM");
                asm.WriteLine("MOV " + getContenido() + ", CX ");
            }
            match(Tipos.Identificador);
            match(")");
            match(";");
        }
        //Expresion -> Termino MasTermino
        private void Expresion()
        {
            Termino();
            MasTermino();
        }
        //MasTermino -> (OperadorTermino Termino)?
        private void MasTermino()
        {
            if (getClasificacion() == Tipos.OperadorTermino)
            {
                string operador = getContenido();
                match(Tipos.OperadorTermino);
                Termino();
                log.Write(operador + " ");
                float n1 = stack.Pop();
                asm.WriteLine("POP BX");
                float n2 = stack.Pop();
                asm.WriteLine("POP AX");
                switch (operador)
                {
                    case "+":
                        stack.Push(n2 + n1);
                        asm.WriteLine("ADD AX, BX");
                        asm.WriteLine("PUSH AX");
                        break;
                    case "-":
                        stack.Push(n2 - n1);
                        asm.WriteLine("SUB AX, BX");
                        asm.WriteLine("PUSH AX");
                        break;
                }
            }
        }
        //Termino -> Factor PorFactor
        private void Termino()
        {
            Factor();
            PorFactor();
        }
        //PorFactor -> (OperadorFactor Factor)? 
        private void PorFactor()
        {
            if (getClasificacion() == Tipos.OperadorFactor)
            {
                string operador = getContenido();
                match(Tipos.OperadorFactor);
                Factor();
                log.Write(operador + " ");
                float n1 = stack.Pop();
                asm.WriteLine("POP BX");
                float n2 = stack.Pop();
                asm.WriteLine("POP AX");
                //Requerimiento 1.a 
                switch (operador)
                {
                    case "*":
                        stack.Push(n2 * n1);
                        asm.WriteLine("MUL BX");
                        asm.WriteLine("PUSH AX");
                        break;
                    case "/":
                        stack.Push(n2 / n1);
                        asm.WriteLine("DIV BX");
                        asm.WriteLine("PUSH AX");
                        //Residuo en DX
                        //Resultado de la division en AX
                        break;
                }
            }
        }
        //Factor -> numero | identificador | (Expresion)
        private void Factor()
        {
            if (getClasificacion() == Tipos.Numero)
            {
                log.Write(getContenido() + " ");
                log.Write(" ");
                if (dominante < evaluaNumero(float.Parse(getContenido())))
                {
                    dominante = evaluaNumero(float.Parse(getContenido()));
                }
                stack.Push(float.Parse(getContenido()));
                asm.WriteLine("MOV AX, " + getContenido());
                asm.WriteLine("PUSH AX");
                match(Tipos.Numero);
            }
            else if (getClasificacion() == Tipos.Identificador)
            {
                if (!existeVariable(getContenido()))
                {
                    throw new Error("No existe la variable<" + getContenido() + "> en linea: " + linea, log);

                }
                log.Write(getContenido() + " ");
                log.Write(" ");
                if (dominante < getTipo(getContenido()))
                {
                    dominante = getTipo(getContenido());
                }
                stack.Push(getValor(getContenido()));
                match(Tipos.Identificador);
            }
            else
            {
                bool hubocasteo = false;
                Variable.TipoDato casteo = Variable.TipoDato.Char;
                match("(");
                if (getClasificacion() == Tipos.TipoDato)
                {
                    hubocasteo = true;
                    switch (getContenido())
                    {
                        case "char":
                            casteo = Variable.TipoDato.Char;
                            break;
                        case "int":
                            casteo = Variable.TipoDato.Int;
                            break;
                        case "float":
                            casteo = Variable.TipoDato.Float;
                            break;
                    }
                    match(Tipos.TipoDato);
                    match(")");
                    match("(");
                }
                Expresion();
                match(")");
                if (hubocasteo)
                {
                    dominante = casteo;
                    float val = stack.Pop();
                    asm.WriteLine("POP AX");
                    switch (dominante)
                    {
                        case Variable.TipoDato.Char:
                            stack.Push((char)val % 256);
                            break;
                        case Variable.TipoDato.Int:
                            stack.Push((int)val % 65535);
                            break;
                        case Variable.TipoDato.Float:
                            stack.Push((float)val);
                            break;
                    }
                }
            }
        }
    }
}