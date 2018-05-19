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
    public partial class FormListar : Form
    {
        public FormListar()
        {
            InitializeComponent();

            if (_myForm == null)
            {
                _myForm = this;
            }
        }

        private static FormListar _myForm;

        public static FormListar MyForm
        {
            get
            {
                if (_myForm == null)
                {
                    _myForm = new FormListar();
                }
                return _myForm;
            }
            set
            {
                _myForm = value;
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void FormListar_Load(object sender, EventArgs e)
        {
            var empleado = new Clases.Empleado();
          ListarEmpleadoDataGridView(dgv_empleados);
        }

        public void ListarEmpleadoDataGridView(DataGridView dgv)
        {
            var empleado = new Clases.Empleado();
            var tabla = empleado.Listar();
            var numero_filas = tabla.Rows.Count;
            if (numero_filas > 0)
            {
                for (int i = 0; i < numero_filas; i++)
                {
                    string nombre_completo = tabla.Rows[i][2].ToString() + "  " + tabla.Rows[i][1].ToString();
                    string cedula = tabla.Rows[i][3].ToString();
                    string genero = tabla.Rows[i][4].ToString();
                    string distrito = tabla.Rows[i][5].ToString();
                    int empleadoId = int.Parse(tabla.Rows[i][0].ToString());

                    dgv.Rows.Add(
                        nombre_completo, cedula, genero, distrito, "Editar", "Eliminar", empleadoId

                        );
                }
            }
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
           // this.Hide();

            FormRegistrar frm = new FormRegistrar();

            frm.Show();
        }

        private void txt_buscar_TextChanged(object sender, EventArgs e)
        {
            var empleado = new Clases.Empleado();
            if (txt_buscar.Text.Trim().Length > 0)
            {
                empleado.BuscarEmpleadoLike(dgv_empleados, txt_buscar.Text.Trim());
            }
            else
            {
                empleado.ListarEmpleadoDataGridView(dgv_empleados);
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
