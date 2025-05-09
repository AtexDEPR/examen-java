(4H) Soluciones Eficientes S.A.S

### **Contexto: ¿Qué es una Empresa de Outsourcing?**

Una empresa de **outsourcing** se especializa en proporcionar servicios o procesos específicos a otras organizaciones, permitiendo a estas enfocarse en sus objetivos principales. Al externalizar servicios, las empresas contratantes pueden reducir costos, mejorar la eficiencia y beneficiarse del conocimiento especializado que ofrece el proveedor.

Los servicios de outsourcing son muy variados y pueden abarcar desde áreas técnicas como TI y desarrollo de software hasta funciones de soporte como recursos humanos, atención al cliente, limpieza, o seguridad.

En este modelo, las relaciones entre cliente y proveedor se regulan mediante contratos que especifican términos, costos y estándares de calidad.



**Soluciones Eficientes S.A.S.** es una empresa colombiana dedicada a ofrecer servicios de outsourcing personalizados para optimizar las operaciones de sus clientes. Su propósito principal es permitir que las empresas se concentren en su actividad principal mientras delegan áreas críticas como tecnología, administración, limpieza, atención al cliente, y seguridad. La empresa requiere una aplicación en Java que permita organizar y operar estas actividades de manera eficiente. La aplicación debe incluir manejo de archivos de texto, conexión a una base de datos MySQL mediante JDBC, seguir principios y patrones de diseño, y utilizar expresiones lambda y Stream API para operaciones específicas. La interfaz de usuario será implementada en consola.



#### **Servicios que Ofrecemos:**

- **Tecnología de la Información (TI):** Desarrollo de software, soporte técnico, administración de redes.
- **Limpieza y Mantenimiento:** Servicios integrales para empresas e industrias.
- **Seguridad:** Vigilancia física y electrónica.
- **Administración y Recursos Humanos:** Gestión de personal, nómina, y contratación.
- **Atención al Cliente:** Call centers, gestión de quejas y reclamos.

###  

#### **1. Diseño de la Base de Datos**

La base de datos gestionará la información de clientes, servicios, contratos, empleados y proyectos activos.

**Tablas y relaciones:**

1. **Cliente (ID, Nombre, Representante, Correo, Teléfono, Dirección, Sector)**

- *Sector*: Enum (Tecnología, Salud, Educación, Comercio, Manufactura).

1. **Servicio (ID, Nombre, Descripción, PrecioPorHora, Categoría)**

- *Categoría*: Enum (TI, Limpieza, Seguridad, Administración).

1. **Contrato (ID, ID_Cliente, ID_Servicio, FechaInicio, FechaFin, CostoTotal, Estado)**

- *Estado*: Enum (Activo, En espera, Finalizado).

1. **Empleado (ID, Nombre, Cargo, Salario, Especialidad, ID_Proyecto)**

- *Especialidad*: Enum (TI, Administración, Limpieza, Seguridad).

1. **Proyecto (ID, ID_Cliente, Nombre, FechaInicio, FechaFin, Estado)**

- *Estado*: Enum (En curso, Completado, Cancelado).

1. **Asignación (ID_Empleado, ID_Proyecto, HorasTrabajadas, FechaAsignación)**

**Relaciones principales**:

- Un cliente puede contratar múltiples servicios (relación entre **Cliente** y **Contrato**).
- Los servicios pueden asignarse a proyectos específicos para un cliente.
- Los empleados pueden trabajar en uno o varios proyectos.
- Cada proyecto tiene una relación directa con un cliente y sus contratos.

**Datos de Ejemplo**:

- **Clientes**:
- Cliente 1: "TecnoGlobal", Representante: "Laura Martínez", Sector: Tecnología.
- Cliente 2: "Clínica Vida", Representante: "Carlos Ruiz", Sector: Salud.
- **Servicios**:
- Servicio 1: "Desarrollo de Software", Categoría: TI, PrecioPorHora: 120,000 COP.
- Servicio 2: "Limpieza Industrial", Categoría: Limpieza, PrecioPorHora: 30,000 COP.
- **Empleados**:
- Empleado 1: "Juan Pérez", Cargo: Analista de Sistemas, Especialidad: TI.
- Empleado 2: "Marta Gómez", Cargo: Supervisora, Especialidad: Limpieza.

#### **2. Diagrama de Clases**

El diagrama debe reflejar las siguientes clases y relaciones:

- **Cliente**
- Métodos: `consultarContratos()`, `listarProyectosActivos()`.
- **Servicio**
- Métodos: `calcularCostoTotal(horas: int)`.
- **Contrato**
- Métodos: `verEstadoContrato()`, `calcularCosto()`.
- **Empleado**
- Métodos: `asignarProyecto()`, `registrarHorasTrabajadas()`.
- **Proyecto**
- Métodos: `listarEmpleados()`, `calcularDuración()`.

#### **3. Funcionalidades Java**

Implemente las siguientes funcionalidades:

1. **Gestión de Clientes:**

- Registrar un nuevo cliente.
- Listar todos los clientes con su sector y contratos activos.

1. **Gestión de Servicios:**

- Registrar un nuevo servicio.
- Consultar servicios por categoría.

1. **Gestión de Contratos:**

- Registrar un nuevo contrato.
- Consultar contratos activos para un cliente.
- Finalizar un contrato.

1. **Gestión de Proyectos:**

- Crear un nuevo proyecto para un cliente.
- Asignar empleados a un proyecto.
- Consultar proyectos activos y su estado.

1. **Gestión de Empleados:**

- Registrar un nuevo empleado.
- Consultar empleados asignados a un proyecto.
- Registrar horas trabajadas por empleado.

1. **Reportes:**

- Ver ingresos totales generados por los contratos activos.
- Listar los servicios más contratados.
- Listar los empleados con más horas trabajadas.

#### **4. Conexión JDBC**

Incluya las operaciones CRUD necesarias para todas las tablas:

- **Cliente:** Registrar y actualizar datos.
- **Servicio:** Registrar y listar servicios.
- **Contrato:** Registrar, listar y actualizar estados.
- **Proyecto:** Registrar y listar proyectos.
- **Empleado:** Registrar y asignar empleados.

#### **5. Interfaz por Consola**

Incluya un menú principal con opciones claras para cada funcionalidad y un submenú en cada sección.

#### **6. Manejo de Archivos de Texto**

Guarde resúmenes de contratos finalizados y permita consultarlos desde el archivo.
