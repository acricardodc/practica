using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proyecto_Csharp.Vistas.Empleados
{
    public partial class FormRegistrar : Form
    {
        public FormRegistrar()
        {
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btn_registrar_Click(object sender, EventArgs e)
        {
            if (txt_apellidos.Text.Trim().Equals(""))
            {
                txt_apellidos.Focus();
                MessageBox.Show("Completar Apellidos", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if (txt_nombre.Text.Trim().Equals(""))
            {
                txt_nombre.Focus();
                MessageBox.Show("Completar Nombre", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if (txt_cedula.Text.Trim().Length !=8)
            {
                txt_cedula.Focus();
                MessageBox.Show("Completar Cedula de 8 digitos", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if (txt_direccion.Text.Trim().Equals(""))
            {
                txt_direccion.Focus();
                MessageBox.Show("Completar Direccion", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if (dgv_telefonos.Rows.Count == 0)
            {
                MessageBox.Show("Ingresar al menos un telefono", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {

                var empleado = new Clases.Empleado(
                    txt_apellidos.Text.Trim().ToUpper(),
                    txt_nombre.Text.Trim().ToUpper(),
                    txt_cedula.Text.Trim(),
                    cbo_genero.Text,
                    cbo_estado_civil.Text,
                    txt_direccion.Text.Trim(),
                    cbo_distrito.SelectedValue.ToString()
                    );

                int ultimo_id = empleado.Registrar();

                int numero_filas = dgv_telefonos.Rows.Count;

                for (int i = 0; i  < numero_filas; i++)
                {
                    string operador = dgv_telefonos.Rows[i].Cells[0].Value.ToString();
                    string numero = dgv_telefonos.Rows[i].Cells[1].Value.ToString();
                    int empleado_id = ultimo_id;
                    var telefono = new Clases.Telefono(operador, numero, empleado_id);
                    var resultado = telefono.Registrar();

                    if (!resultado)
                    {
                        MessageBox.Show("Error al registrar telefono", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                MessageBox.Show("Empleado registrado correctamente", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);

                empleado.ListarEmpleadoDataGridView(Vistas.Empleados.FormListar.MyForm.dgv_empleados); // Listado actualizado
            }


        }

        private void FormRegistrar_Load(object sender, EventArgs e)
        {
            cbo_genero.SelectedIndex = 0;
            cbo_estado_civil.SelectedIndex = 0;
            cbo_operador.SelectedIndex = 0;

            //Instanciar la clase ubigeo
            var ubigeo = new Clases.Ubigeo();

            var tabla = ubigeo.ListarPais(); ;

            if (tabla.Rows.Count > 0)
            {
                cbo_pais.DataSource = ubigeo.ListarPais();
                cbo_pais.DisplayMember = "NOMBRE_PAIS";

                //Ocultar fila
                cbo_pais.ValueMember = "PAIS_ID";
            }
           
        }

        private void cbo_pais_SelectedValueChanged(object sender, EventArgs e)
        {
            //Instanciar la clase ubigeo
            var ubigeo = new Clases.Ubigeo();
            var paisId = cbo_pais.SelectedValue.ToString();
            var tabla = ubigeo.ListarProvinciasPorPaisId(paisId); ;

            if (tabla.Rows.Count > 0)
            {
                cbo_provincia.DataSource = tabla;
                cbo_provincia.DisplayMember = "NOMBRE_PROVINCIA";
                cbo_provincia.ValueMember = "PROVINCIA_ID";

            }
        }

        private void cbo_provincia_SelectedValueChanged(object sender, EventArgs e)
        {
            //Instanciar la clase ubigeo
            var ubigeo = new Clases.Ubigeo();
            var provinciaId = cbo_provincia.SelectedValue.ToString();
            var tabla = ubigeo.ListarDistritosPorPorvinciaId(provinciaId); ;

            if (tabla.Rows.Count > 0)
            {
                cbo_distrito.DataSource = tabla;
                cbo_distrito.DisplayMember = "NOMBRE_DISTRITO";
                cbo_distrito.ValueMember = "DISTRITO_ID";

            }
        }

        private void btn_agregar_Click(object sender, EventArgs e)
        {
            if (txt_telefono.Text.Trim().Equals(""))
            {
                txt_telefono.Focus();
                MessageBox.Show("Completar numero", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if(txt_telefono.Text.Trim().Length !=9)
            {
                txt_telefono.Focus();
                MessageBox.Show("Completar numero de 9 digitos", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Warning);

            }
            else
            {
                int numero_filas = dgv_telefonos.Rows.Count;

                if (numero_filas == 0)
                {
                    AgregarTelefonos();
                }
                else
                {
                    bool existe = false;
                    string numero = txt_telefono.Text;
                    for (int i = 0; i < numero_filas; i++)
                    {
                        if (numero.Equals(dgv_telefonos.Rows[i].Cells[1].Value.ToString()))
                        {
                            existe = true;
                            break;
                        }

                    }
                    if (existe)
                    {
                        MessageBox.Show("Este telefono ya fue agregado");
                    }
                    else
                    {
                        AgregarTelefonos();
                    }
                }


            }
        }

  

        private void AgregarTelefonos()
        {
            string operador = cbo_operador.Text;
            string numero = txt_telefono.Text;
            dgv_telefonos.Rows.Add(operador, numero, "Eliminar");
        }
    }
}
