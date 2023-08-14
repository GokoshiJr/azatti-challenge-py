import fillpdf, datetime, os
import pymysql.cursors
from fillpdf import fillpdfs
from dotenv import load_dotenv

load_dotenv()

def main():
    form_path = 'formulario nueva instalacion.pdf'

    conn = pymysql.connect(
        host = os.environ.get('DB_HOST'),
        user = os.environ.get('DB_USER'),
        passwd = os.environ.get('DB_PSSWD'),
        database = os.environ.get('DB_NAME'),
        cursorclass = pymysql.cursors.DictCursor
    )

    with conn:
        with conn.cursor() as cursor:
            sql = '''
                SELECT * FROM empresa 
                INNER JOIN establecimiento
                ON empresa.id = establecimiento.empresa_id
                LIMIT 1
            '''
            cursor.execute(sql)
            conn.commit()
            record = cursor.fetchall()[0]
            
        data_dict = {
            'Fecha': datetime.datetime.today().strftime('%d-%m-%Y'), 
            'Nombre establecimiento': record['nombre_establecimiento'], 
            'Dirección': record['direccion'], 
            'CP': record['cp'], 
            'Localidad': record['localidad'], 
            'Provincia': record['provincia'], 
            'Persona contacto': record['persona_contacto'], 
            'Teléfono contacto': record['telefono_contacto'], 
            'email': record['email'], 
            'Sector actividad': record['sector_actividad'], 
            'Check Cajero': 'Yes', 
            'Check datáfono': '', 
            'comisión': record['comision'], 
            'Retorno grupo': record['retorno_grupo'], 
            'porcentaje retorno': record['porcentaje_retorno'], 
            'Fondo inicial': record['fondo_inicial'], 
            'Aportacion fondo grupo': record['aportacion_fondo_grupo'], 
            'Método reposición grupo': record['metodo_reposicion_grupo'], 
            
            'Nombre empresa': record['nombre_empresa'], 
            'CIF': record['cif'], 
            'Dirección Fiscal': record['direccion_fiscal'], 
            'CP 2': record['cp_2'], 
            'Localidad 2': record['localidad_2'], 
            'Provincia 2': record['provincia_2'], 
            'Nombre administrador': record['nombre_administrador'], 
            'DNI administrador': record['dni_administrador']
        }
    
    fillpdfs.write_fillable_pdf(form_path, 'output.pdf', data_dict)


if __name__ == '__main__':
    main()