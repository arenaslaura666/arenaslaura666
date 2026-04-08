# Instrucciones de Ejecución

## 1. Instalación de Dependencias
Para instalar las dependencias necesarias, asegúrate de tener pip (Python package installer) instalado en tu sistema. Ejecuta el siguiente comando:  
```
pip install -r requirements.txt
```

## 2. Configuración de la Base de Datos
Para configurar la base de datos, sigue estos pasos:
- Crea una base de datos en tu sistema de gestión de bases de datos favorito (MySQL, PostgreSQL, etc.).
- Importa el esquema de la base de datos usando el archivo SQL proporcionado:
```
mysql -u your_username -p your_database < schema.sql
```

## 3. Ejecución del Notebook
Una vez que la base de datos esté configurada, puedes ejecutar el notebook. Asegúrate de tener Jupyter Notebook instalado. Luego, ejecuta:
```
jupyter notebook
```
Navega a la ubicación del notebook correspondiente y ábrelo. Ejecuta las celdas en el orden que aparecen.

## 4. Generación del Reporte
Después de ejecutar el notebook, puedes generar el reporte en formato PDF. Usa el siguiente comando dentro del Jupyter Notebook:
```
!jupyter nbconvert --to pdf nombre_del_notebook.ipynb
```
Esto generará un archivo PDF en la misma carpeta del notebook.