PGDMP     *    %    
            z         	   redlab_v5    13.6    13.6    l           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            m           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            n           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            o           1262    16394 	   redlab_v5    DATABASE     e   CREATE DATABASE redlab_v5 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE redlab_v5;
                postgres    false            �            1259    16395 
   Agreements    TABLE     �  CREATE TABLE public."Agreements" (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    ruc character varying(255),
    email character varying(255),
    "tlfNumber" character varying(255),
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "TypeAgreementId" integer
);
     DROP TABLE public."Agreements";
       public         heap    postgres    false            �            1259    16401    Agreements_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Agreements_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Agreements_id_seq";
       public          postgres    false    200            p           0    0    Agreements_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Agreements_id_seq" OWNED BY public."Agreements".id;
          public          postgres    false    201            �            1259    16403    AppointmentDetails    TABLE     �   CREATE TABLE public."AppointmentDetails" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "AppointmentId" integer,
    "ExaminationId" integer
);
 (   DROP TABLE public."AppointmentDetails";
       public         heap    postgres    false            �            1259    16406    AppointmentDetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public."AppointmentDetails_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."AppointmentDetails_id_seq";
       public          postgres    false    202            q           0    0    AppointmentDetails_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."AppointmentDetails_id_seq" OWNED BY public."AppointmentDetails".id;
          public          postgres    false    203            �            1259    16408    Appointments    TABLE     �  CREATE TABLE public."Appointments" (
    id integer NOT NULL,
    code character varying(255),
    "time" time without time zone DEFAULT '00:00:00'::time without time zone,
    "dateAppointment" date,
    "totalPrice" double precision,
    discount double precision,
    "finalPrice" double precision,
    status character varying(1) DEFAULT 'S'::character varying,
    result character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ClientId" integer,
    "ResponsibleId" integer,
    "PriceListId" integer,
    "HeadquarterId" integer,
    "EmployeeId" integer,
    "RefererId" integer,
    "refererCode" character varying(40),
    "DoctorId" integer
);
 "   DROP TABLE public."Appointments";
       public         heap    postgres    false            r           0    0 !   COLUMN "Appointments"."RefererId"    COMMENT     ]   COMMENT ON COLUMN public."Appointments"."RefererId" IS 'campo que enlaza la tabla Referers';
          public          postgres    false    204            s           0    0     COLUMN "Appointments"."DoctorId"    COMMENT     Y   COMMENT ON COLUMN public."Appointments"."DoctorId" IS 'campo que une con tabla Doctors';
          public          postgres    false    204            �            1259    16416    Appointments_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Appointments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Appointments_id_seq";
       public          postgres    false    204            t           0    0    Appointments_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Appointments_id_seq" OWNED BY public."Appointments".id;
          public          postgres    false    205            �            1259    16418 
   Categories    TABLE     �   CREATE TABLE public."Categories" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(2000),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Categories";
       public         heap    postgres    false            �            1259    16424    Categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Categories_id_seq";
       public          postgres    false    206            u           0    0    Categories_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Categories_id_seq" OWNED BY public."Categories".id;
          public          postgres    false    207            �            1259    16426    Clients    TABLE     &  CREATE TABLE public."Clients" (
    id integer NOT NULL,
    dni character varying(255),
    "birthDate" date,
    code character varying(255),
    "historyNumber" character varying(255),
    name character varying(255),
    "lastNameP" character varying(255),
    "lastNameM" character varying(255),
    "phoneNumber" character varying(255),
    "tlfNumber" character varying(255),
    gender character varying(1),
    "civilStatus" character varying(1),
    nationality character varying(255),
    address character varying(255),
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer,
    "TypeDocId" integer,
    "DistrictId" character varying(255),
    edad integer
);
    DROP TABLE public."Clients";
       public         heap    postgres    false            �            1259    16433    Clients_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Clients_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Clients_id_seq";
       public          postgres    false    208            v           0    0    Clients_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Clients_id_seq" OWNED BY public."Clients".id;
          public          postgres    false    209            �            1259    16435 	   Districts    TABLE     �   CREATE TABLE public."Districts" (
    id character varying(255) NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ProvinceId" character varying(255)
);
    DROP TABLE public."Districts";
       public         heap    postgres    false                       1259    17336    Doctors    TABLE     �   CREATE TABLE public."Doctors" (
    id integer NOT NULL,
    "doctorName" character varying(150),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Doctors";
       public         heap    postgres    false                       1259    17334    Doctors_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Doctors_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Doctors_id_seq";
       public          postgres    false    262            w           0    0    Doctors_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Doctors_id_seq" OWNED BY public."Doctors".id;
          public          postgres    false    261            �            1259    16441 	   Employees    TABLE     ]  CREATE TABLE public."Employees" (
    id integer NOT NULL,
    dni character varying(255),
    "admissionDate" date,
    "birthDate" date,
    name character varying(255),
    "lastNameP" character varying(255),
    "lastNameM" character varying(255),
    gender character varying(1),
    "civilStatus" character varying(1),
    "phoneNumber" character varying(255),
    "tlfNumber" character varying(255),
    "digitalSignatureUrl" character varying(500),
    "tuitionNumber" character varying(255),
    "tuitionNumber2" character varying(255),
    address character varying(500),
    "referencePoint" character varying(500),
    "typeDirection" character varying(1),
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "CategoryId" integer,
    "DistrictId" character varying(255),
    "UserId" integer,
    "TypeDocId" integer,
    "TypeEmployeeId" integer,
    "SpecialityId" integer,
    "ProfessionId" integer,
    "TuitionId" integer,
    "Tuition2Id" integer,
    "HeadquarterId" integer
);
    DROP TABLE public."Employees";
       public         heap    postgres    false            �            1259    16448    Employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Employees_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Employees_id_seq";
       public          postgres    false    211            x           0    0    Employees_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Employees_id_seq" OWNED BY public."Employees".id;
          public          postgres    false    212            �            1259    16450    ExaminationDetails    TABLE     L  CREATE TABLE public."ExaminationDetails" (
    value character varying(255),
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "AppointmentDetailId" integer NOT NULL,
    "ExaminationValueId" integer NOT NULL
);
 (   DROP TABLE public."ExaminationDetails";
       public         heap    postgres    false            �            1259    16454    ExaminationGroups    TABLE     @  CREATE TABLE public."ExaminationGroups" (
    id integer NOT NULL,
    name character varying(255),
    "countEV" integer,
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ExaminationId" integer
);
 '   DROP TABLE public."ExaminationGroups";
       public         heap    postgres    false            �            1259    16458    ExaminationGroups_id_seq    SEQUENCE     �   CREATE SEQUENCE public."ExaminationGroups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ExaminationGroups_id_seq";
       public          postgres    false    214            y           0    0    ExaminationGroups_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."ExaminationGroups_id_seq" OWNED BY public."ExaminationGroups".id;
          public          postgres    false    215            �            1259    16460    ExaminationPrices    TABLE     �   CREATE TABLE public."ExaminationPrices" (
    price double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ExaminationId" integer NOT NULL,
    "PriceListId" integer NOT NULL
);
 '   DROP TABLE public."ExaminationPrices";
       public         heap    postgres    false            �            1259    16463    ExaminationReferenceValues    TABLE       CREATE TABLE public."ExaminationReferenceValues" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ExaminationValueId" integer,
    "ExaminationId" integer
);
 0   DROP TABLE public."ExaminationReferenceValues";
       public         heap    postgres    false            �            1259    16466 !   ExaminationReferenceValues_id_seq    SEQUENCE     �   CREATE SEQUENCE public."ExaminationReferenceValues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."ExaminationReferenceValues_id_seq";
       public          postgres    false    217            z           0    0 !   ExaminationReferenceValues_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."ExaminationReferenceValues_id_seq" OWNED BY public."ExaminationReferenceValues".id;
          public          postgres    false    218            �            1259    16468    ExaminationValues    TABLE     s  CREATE TABLE public."ExaminationValues" (
    id integer NOT NULL,
    name character varying(255),
    "countVR" integer,
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ExaminationGroupId" integer,
    "MethodId" integer,
    "UnitId" integer
);
 '   DROP TABLE public."ExaminationValues";
       public         heap    postgres    false            �            1259    16472    ExaminationValues_id_seq    SEQUENCE     �   CREATE SEQUENCE public."ExaminationValues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ExaminationValues_id_seq";
       public          postgres    false    219            {           0    0    ExaminationValues_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."ExaminationValues_id_seq" OWNED BY public."ExaminationValues".id;
          public          postgres    false    220            �            1259    16474    Examinations    TABLE     �  CREATE TABLE public."Examinations" (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    indications character varying(3000),
    "typeSample" character varying(255),
    volume character varying(255),
    supplies character varying(255),
    "storageTemperature" character varying(255),
    "fastingConditions" character varying(255),
    "runFrequency" character varying(255),
    "processTime" character varying(255),
    "reportTime" character varying(255),
    "countEG" character varying(255),
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "ServiceId" integer
);
 "   DROP TABLE public."Examinations";
       public         heap    postgres    false            �            1259    16481    Examinations_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Examinations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Examinations_id_seq";
       public          postgres    false    221            |           0    0    Examinations_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Examinations_id_seq" OWNED BY public."Examinations".id;
          public          postgres    false    222            �            1259    16483 	   Functions    TABLE     �  CREATE TABLE public."Functions" (
    id integer NOT NULL,
    title character varying(255),
    type character varying(255),
    parent_id integer,
    url character varying(255),
    icon character varying(255),
    "typeApplication" character varying(1) DEFAULT 'I'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Functions";
       public         heap    postgres    false            �            1259    16490    Functions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Functions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Functions_id_seq";
       public          postgres    false    223            }           0    0    Functions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Functions_id_seq" OWNED BY public."Functions".id;
          public          postgres    false    224            �            1259    16492    Headquarters    TABLE     �  CREATE TABLE public."Headquarters" (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    "tlfNumber" character varying(255),
    email character varying(255),
    "urlImage" character varying(2000) DEFAULT 'http://localhost:8080/public/imgs/headquarter/dark-material-bg.jpg'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."Headquarters";
       public         heap    postgres    false            �            1259    16499    Headquarters_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Headquarters_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Headquarters_id_seq";
       public          postgres    false    225            ~           0    0    Headquarters_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Headquarters_id_seq" OWNED BY public."Headquarters".id;
          public          postgres    false    226            �            1259    16501    Methods    TABLE     �   CREATE TABLE public."Methods" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Methods";
       public         heap    postgres    false            �            1259    16507    Methods_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Methods_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Methods_id_seq";
       public          postgres    false    227                       0    0    Methods_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Methods_id_seq" OWNED BY public."Methods".id;
          public          postgres    false    228            �            1259    16509 
   PriceLists    TABLE        CREATE TABLE public."PriceLists" (
    id integer NOT NULL,
    name character varying(255),
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "AgreementId" integer
);
     DROP TABLE public."PriceLists";
       public         heap    postgres    false            �            1259    16513    PriceLists_id_seq    SEQUENCE     �   CREATE SEQUENCE public."PriceLists_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."PriceLists_id_seq";
       public          postgres    false    229            �           0    0    PriceLists_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."PriceLists_id_seq" OWNED BY public."PriceLists".id;
          public          postgres    false    230            �            1259    16515    Professions    TABLE     �   CREATE TABLE public."Professions" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(2000),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."Professions";
       public         heap    postgres    false            �            1259    16521    Professions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Professions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Professions_id_seq";
       public          postgres    false    231            �           0    0    Professions_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Professions_id_seq" OWNED BY public."Professions".id;
          public          postgres    false    232            �            1259    16523 	   Provinces    TABLE     �   CREATE TABLE public."Provinces" (
    id character varying(255) NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "RegionId" character varying(255)
);
    DROP TABLE public."Provinces";
       public         heap    postgres    false            �            1259    16529    ReferenceValues    TABLE     �   CREATE TABLE public."ReferenceValues" (
    id integer NOT NULL,
    name character varying(255),
    unit character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 %   DROP TABLE public."ReferenceValues";
       public         heap    postgres    false            �            1259    16535    ReferenceValues_id_seq    SEQUENCE     �   CREATE SEQUENCE public."ReferenceValues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."ReferenceValues_id_seq";
       public          postgres    false    234            �           0    0    ReferenceValues_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."ReferenceValues_id_seq" OWNED BY public."ReferenceValues".id;
          public          postgres    false    235            �            1259    16537    Referers    TABLE     �   CREATE TABLE public."Referers" (
    id integer NOT NULL,
    "refererName" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Referers";
       public         heap    postgres    false            �            1259    16540    Referers_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Referers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Referers_id_seq";
       public          postgres    false    236            �           0    0    Referers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Referers_id_seq" OWNED BY public."Referers".id;
          public          postgres    false    237            �            1259    16542    Regions    TABLE     �   CREATE TABLE public."Regions" (
    id character varying(255) NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Regions";
       public         heap    postgres    false            �            1259    16548    RoleFunctions    TABLE     d  CREATE TABLE public."RoleFunctions" (
    "canView" boolean DEFAULT true,
    "canEdit" boolean DEFAULT true,
    "canDelete" boolean DEFAULT true,
    "canCreate" boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "FunctionId" integer NOT NULL,
    "RoleId" integer NOT NULL
);
 #   DROP TABLE public."RoleFunctions";
       public         heap    postgres    false            �            1259    16555    Roles    TABLE     (  CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Roles";
       public         heap    postgres    false            �            1259    16562    Roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Roles_id_seq";
       public          postgres    false    240            �           0    0    Roles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;
          public          postgres    false    241            �            1259    16564    Services    TABLE     �   CREATE TABLE public."Services" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Services";
       public         heap    postgres    false            �            1259    16570    Services_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Services_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Services_id_seq";
       public          postgres    false    242            �           0    0    Services_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Services_id_seq" OWNED BY public."Services".id;
          public          postgres    false    243            �            1259    16572    Specialities    TABLE     �   CREATE TABLE public."Specialities" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(2000),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."Specialities";
       public         heap    postgres    false            �            1259    16578    Specialities_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Specialities_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Specialities_id_seq";
       public          postgres    false    244            �           0    0    Specialities_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Specialities_id_seq" OWNED BY public."Specialities".id;
          public          postgres    false    245            �            1259    16580    Tokens    TABLE     �  CREATE TABLE public."Tokens" (
    id integer NOT NULL,
    hash character varying(255),
    expiration_date timestamp with time zone DEFAULT '2021-11-22 09:30:48.661-05'::timestamp with time zone,
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "UserId" integer
);
    DROP TABLE public."Tokens";
       public         heap    postgres    false            �            1259    16585    Tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Tokens_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Tokens_id_seq";
       public          postgres    false    246            �           0    0    Tokens_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Tokens_id_seq" OWNED BY public."Tokens".id;
          public          postgres    false    247            �            1259    16587    Tuitions    TABLE     �   CREATE TABLE public."Tuitions" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(2000),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Tuitions";
       public         heap    postgres    false            �            1259    16593    Tuitions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Tuitions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Tuitions_id_seq";
       public          postgres    false    248            �           0    0    Tuitions_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Tuitions_id_seq" OWNED BY public."Tuitions".id;
          public          postgres    false    249            �            1259    16595    TypeAgreements    TABLE     �   CREATE TABLE public."TypeAgreements" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(2000),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 $   DROP TABLE public."TypeAgreements";
       public         heap    postgres    false            �            1259    16601    TypeAgreements_id_seq    SEQUENCE     �   CREATE SEQUENCE public."TypeAgreements_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."TypeAgreements_id_seq";
       public          postgres    false    250            �           0    0    TypeAgreements_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."TypeAgreements_id_seq" OWNED BY public."TypeAgreements".id;
          public          postgres    false    251            �            1259    16603    TypeDocs    TABLE     �   CREATE TABLE public."TypeDocs" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(2000),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."TypeDocs";
       public         heap    postgres    false            �            1259    16609    TypeDocs_id_seq    SEQUENCE     �   CREATE SEQUENCE public."TypeDocs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."TypeDocs_id_seq";
       public          postgres    false    252            �           0    0    TypeDocs_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."TypeDocs_id_seq" OWNED BY public."TypeDocs".id;
          public          postgres    false    253            �            1259    16611    TypeEmployees    TABLE     �   CREATE TABLE public."TypeEmployees" (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public."TypeEmployees";
       public         heap    postgres    false            �            1259    16617    TypeEmployees_id_seq    SEQUENCE     �   CREATE SEQUENCE public."TypeEmployees_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."TypeEmployees_id_seq";
       public          postgres    false    254            �           0    0    TypeEmployees_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."TypeEmployees_id_seq" OWNED BY public."TypeEmployees".id;
          public          postgres    false    255                        1259    16619    Units    TABLE     �   CREATE TABLE public."Units" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Units";
       public         heap    postgres    false                       1259    16622    Units_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Units_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Units_id_seq";
       public          postgres    false    256            �           0    0    Units_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Units_id_seq" OWNED BY public."Units".id;
          public          postgres    false    257                       1259    16624    UserRole    TABLE     �   CREATE TABLE public."UserRole" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "RoleId" integer NOT NULL,
    "UserId" integer NOT NULL
);
    DROP TABLE public."UserRole";
       public         heap    postgres    false                       1259    16627    Users    TABLE     �  CREATE TABLE public."Users" (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    "urlAvatar" character varying(2000) DEFAULT 'http://localhost/public/imgs/avatar/avatardefault.png'::character varying,
    status character varying(1) DEFAULT 'A'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false                       1259    16635    Users_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public          postgres    false    259            �           0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
          public          postgres    false    260            �           2604    16637    Agreements id    DEFAULT     r   ALTER TABLE ONLY public."Agreements" ALTER COLUMN id SET DEFAULT nextval('public."Agreements_id_seq"'::regclass);
 >   ALTER TABLE public."Agreements" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200            �           2604    16638    AppointmentDetails id    DEFAULT     �   ALTER TABLE ONLY public."AppointmentDetails" ALTER COLUMN id SET DEFAULT nextval('public."AppointmentDetails_id_seq"'::regclass);
 F   ALTER TABLE public."AppointmentDetails" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            �           2604    16639    Appointments id    DEFAULT     v   ALTER TABLE ONLY public."Appointments" ALTER COLUMN id SET DEFAULT nextval('public."Appointments_id_seq"'::regclass);
 @   ALTER TABLE public."Appointments" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            �           2604    16640    Categories id    DEFAULT     r   ALTER TABLE ONLY public."Categories" ALTER COLUMN id SET DEFAULT nextval('public."Categories_id_seq"'::regclass);
 >   ALTER TABLE public."Categories" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            �           2604    16641 
   Clients id    DEFAULT     l   ALTER TABLE ONLY public."Clients" ALTER COLUMN id SET DEFAULT nextval('public."Clients_id_seq"'::regclass);
 ;   ALTER TABLE public."Clients" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            %           2604    17339 
   Doctors id    DEFAULT     l   ALTER TABLE ONLY public."Doctors" ALTER COLUMN id SET DEFAULT nextval('public."Doctors_id_seq"'::regclass);
 ;   ALTER TABLE public."Doctors" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    262    262            �           2604    16642    Employees id    DEFAULT     p   ALTER TABLE ONLY public."Employees" ALTER COLUMN id SET DEFAULT nextval('public."Employees_id_seq"'::regclass);
 =   ALTER TABLE public."Employees" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211                       2604    16643    ExaminationGroups id    DEFAULT     �   ALTER TABLE ONLY public."ExaminationGroups" ALTER COLUMN id SET DEFAULT nextval('public."ExaminationGroups_id_seq"'::regclass);
 E   ALTER TABLE public."ExaminationGroups" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214                       2604    16644    ExaminationReferenceValues id    DEFAULT     �   ALTER TABLE ONLY public."ExaminationReferenceValues" ALTER COLUMN id SET DEFAULT nextval('public."ExaminationReferenceValues_id_seq"'::regclass);
 N   ALTER TABLE public."ExaminationReferenceValues" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217                       2604    16645    ExaminationValues id    DEFAULT     �   ALTER TABLE ONLY public."ExaminationValues" ALTER COLUMN id SET DEFAULT nextval('public."ExaminationValues_id_seq"'::regclass);
 E   ALTER TABLE public."ExaminationValues" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219                       2604    16646    Examinations id    DEFAULT     v   ALTER TABLE ONLY public."Examinations" ALTER COLUMN id SET DEFAULT nextval('public."Examinations_id_seq"'::regclass);
 @   ALTER TABLE public."Examinations" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            	           2604    16647    Functions id    DEFAULT     p   ALTER TABLE ONLY public."Functions" ALTER COLUMN id SET DEFAULT nextval('public."Functions_id_seq"'::regclass);
 =   ALTER TABLE public."Functions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223                       2604    16648    Headquarters id    DEFAULT     v   ALTER TABLE ONLY public."Headquarters" ALTER COLUMN id SET DEFAULT nextval('public."Headquarters_id_seq"'::regclass);
 @   ALTER TABLE public."Headquarters" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225                       2604    16649 
   Methods id    DEFAULT     l   ALTER TABLE ONLY public."Methods" ALTER COLUMN id SET DEFAULT nextval('public."Methods_id_seq"'::regclass);
 ;   ALTER TABLE public."Methods" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227                       2604    16650    PriceLists id    DEFAULT     r   ALTER TABLE ONLY public."PriceLists" ALTER COLUMN id SET DEFAULT nextval('public."PriceLists_id_seq"'::regclass);
 >   ALTER TABLE public."PriceLists" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229                       2604    16651    Professions id    DEFAULT     t   ALTER TABLE ONLY public."Professions" ALTER COLUMN id SET DEFAULT nextval('public."Professions_id_seq"'::regclass);
 ?   ALTER TABLE public."Professions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231                       2604    16652    ReferenceValues id    DEFAULT     |   ALTER TABLE ONLY public."ReferenceValues" ALTER COLUMN id SET DEFAULT nextval('public."ReferenceValues_id_seq"'::regclass);
 C   ALTER TABLE public."ReferenceValues" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234                       2604    16653    Referers id    DEFAULT     n   ALTER TABLE ONLY public."Referers" ALTER COLUMN id SET DEFAULT nextval('public."Referers_id_seq"'::regclass);
 <   ALTER TABLE public."Referers" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236                       2604    16654    Roles id    DEFAULT     h   ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 9   ALTER TABLE public."Roles" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240                       2604    16655    Services id    DEFAULT     n   ALTER TABLE ONLY public."Services" ALTER COLUMN id SET DEFAULT nextval('public."Services_id_seq"'::regclass);
 <   ALTER TABLE public."Services" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242                       2604    16656    Specialities id    DEFAULT     v   ALTER TABLE ONLY public."Specialities" ALTER COLUMN id SET DEFAULT nextval('public."Specialities_id_seq"'::regclass);
 @   ALTER TABLE public."Specialities" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244                       2604    16657 	   Tokens id    DEFAULT     j   ALTER TABLE ONLY public."Tokens" ALTER COLUMN id SET DEFAULT nextval('public."Tokens_id_seq"'::regclass);
 :   ALTER TABLE public."Tokens" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246                       2604    16658    Tuitions id    DEFAULT     n   ALTER TABLE ONLY public."Tuitions" ALTER COLUMN id SET DEFAULT nextval('public."Tuitions_id_seq"'::regclass);
 <   ALTER TABLE public."Tuitions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248                       2604    16659    TypeAgreements id    DEFAULT     z   ALTER TABLE ONLY public."TypeAgreements" ALTER COLUMN id SET DEFAULT nextval('public."TypeAgreements_id_seq"'::regclass);
 B   ALTER TABLE public."TypeAgreements" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250                       2604    16660    TypeDocs id    DEFAULT     n   ALTER TABLE ONLY public."TypeDocs" ALTER COLUMN id SET DEFAULT nextval('public."TypeDocs_id_seq"'::regclass);
 <   ALTER TABLE public."TypeDocs" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252                        2604    16661    TypeEmployees id    DEFAULT     x   ALTER TABLE ONLY public."TypeEmployees" ALTER COLUMN id SET DEFAULT nextval('public."TypeEmployees_id_seq"'::regclass);
 A   ALTER TABLE public."TypeEmployees" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254            !           2604    16662    Units id    DEFAULT     h   ALTER TABLE ONLY public."Units" ALTER COLUMN id SET DEFAULT nextval('public."Units_id_seq"'::regclass);
 9   ALTER TABLE public."Units" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256            "           2604    16663    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259            +          0    16395 
   Agreements 
   TABLE DATA           �   COPY public."Agreements" (id, name, address, ruc, email, "tlfNumber", description, "createdAt", "updatedAt", "TypeAgreementId") FROM stdin;
    public          postgres    false    200   �s      -          0    16403    AppointmentDetails 
   TABLE DATA           n   COPY public."AppointmentDetails" (id, "createdAt", "updatedAt", "AppointmentId", "ExaminationId") FROM stdin;
    public          postgres    false    202   :u      /          0    16408    Appointments 
   TABLE DATA             COPY public."Appointments" (id, code, "time", "dateAppointment", "totalPrice", discount, "finalPrice", status, result, "createdAt", "updatedAt", "ClientId", "ResponsibleId", "PriceListId", "HeadquarterId", "EmployeeId", "RefererId", "refererCode", "DoctorId") FROM stdin;
    public          postgres    false    204   �w      1          0    16418 
   Categories 
   TABLE DATA           W   COPY public."Categories" (id, name, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    206   B|      3          0    16426    Clients 
   TABLE DATA             COPY public."Clients" (id, dni, "birthDate", code, "historyNumber", name, "lastNameP", "lastNameM", "phoneNumber", "tlfNumber", gender, "civilStatus", nationality, address, status, "createdAt", "updatedAt", "UserId", "TypeDocId", "DistrictId", edad) FROM stdin;
    public          postgres    false    208   �|      5          0    16435 	   Districts 
   TABLE DATA           W   COPY public."Districts" (id, name, "createdAt", "updatedAt", "ProvinceId") FROM stdin;
    public          postgres    false    210   ~�      i          0    17336    Doctors 
   TABLE DATA           O   COPY public."Doctors" (id, "doctorName", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    262   ��      6          0    16441 	   Employees 
   TABLE DATA           �  COPY public."Employees" (id, dni, "admissionDate", "birthDate", name, "lastNameP", "lastNameM", gender, "civilStatus", "phoneNumber", "tlfNumber", "digitalSignatureUrl", "tuitionNumber", "tuitionNumber2", address, "referencePoint", "typeDirection", status, "createdAt", "updatedAt", "CategoryId", "DistrictId", "UserId", "TypeDocId", "TypeEmployeeId", "SpecialityId", "ProfessionId", "TuitionId", "Tuition2Id", "HeadquarterId") FROM stdin;
    public          postgres    false    211   9�      8          0    16450    ExaminationDetails 
   TABLE DATA           �   COPY public."ExaminationDetails" (value, status, "createdAt", "updatedAt", "AppointmentDetailId", "ExaminationValueId") FROM stdin;
    public          postgres    false    213   ��      9          0    16454    ExaminationGroups 
   TABLE DATA           u   COPY public."ExaminationGroups" (id, name, "countEV", status, "createdAt", "updatedAt", "ExaminationId") FROM stdin;
    public          postgres    false    214   ��      ;          0    16460    ExaminationPrices 
   TABLE DATA           n   COPY public."ExaminationPrices" (price, "createdAt", "updatedAt", "ExaminationId", "PriceListId") FROM stdin;
    public          postgres    false    216   r�      <          0    16463    ExaminationReferenceValues 
   TABLE DATA           �   COPY public."ExaminationReferenceValues" (id, name, "createdAt", "updatedAt", "ExaminationValueId", "ExaminationId") FROM stdin;
    public          postgres    false    217   ��      >          0    16468    ExaminationValues 
   TABLE DATA           �   COPY public."ExaminationValues" (id, name, "countVR", status, "createdAt", "updatedAt", "ExaminationGroupId", "MethodId", "UnitId") FROM stdin;
    public          postgres    false    219   4�      @          0    16474    Examinations 
   TABLE DATA           �   COPY public."Examinations" (id, name, code, indications, "typeSample", volume, supplies, "storageTemperature", "fastingConditions", "runFrequency", "processTime", "reportTime", "countEG", status, "createdAt", "updatedAt", "ServiceId") FROM stdin;
    public          postgres    false    221   ��      B          0    16483 	   Functions 
   TABLE DATA           y   COPY public."Functions" (id, title, type, parent_id, url, icon, "typeApplication", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    223   �      D          0    16492    Headquarters 
   TABLE DATA           u   COPY public."Headquarters" (id, name, address, "tlfNumber", email, "urlImage", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    225   G�      F          0    16501    Methods 
   TABLE DATA           T   COPY public."Methods" (id, name, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    227   G�      H          0    16509 
   PriceLists 
   TABLE DATA           a   COPY public."PriceLists" (id, name, status, "createdAt", "updatedAt", "AgreementId") FROM stdin;
    public          postgres    false    229   �      J          0    16515    Professions 
   TABLE DATA           X   COPY public."Professions" (id, name, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    231   %�      L          0    16523 	   Provinces 
   TABLE DATA           U   COPY public."Provinces" (id, name, "createdAt", "updatedAt", "RegionId") FROM stdin;
    public          postgres    false    233   ��      M          0    16529    ReferenceValues 
   TABLE DATA           U   COPY public."ReferenceValues" (id, name, unit, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    234   l�      O          0    16537    Referers 
   TABLE DATA           Q   COPY public."Referers" (id, "refererName", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    236   �      Q          0    16542    Regions 
   TABLE DATA           G   COPY public."Regions" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    238   �      R          0    16548    RoleFunctions 
   TABLE DATA           �   COPY public."RoleFunctions" ("canView", "canEdit", "canDelete", "canCreate", "createdAt", "updatedAt", "FunctionId", "RoleId") FROM stdin;
    public          postgres    false    239   G�      S          0    16555    Roles 
   TABLE DATA           Z   COPY public."Roles" (id, name, description, status, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    240   ��      U          0    16564    Services 
   TABLE DATA           U   COPY public."Services" (id, name, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    242   v�      W          0    16572    Specialities 
   TABLE DATA           Y   COPY public."Specialities" (id, name, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    244   #�      Y          0    16580    Tokens 
   TABLE DATA           i   COPY public."Tokens" (id, hash, expiration_date, status, "createdAt", "updatedAt", "UserId") FROM stdin;
    public          postgres    false    246   ��      [          0    16587    Tuitions 
   TABLE DATA           U   COPY public."Tuitions" (id, name, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    248   ��      ]          0    16595    TypeAgreements 
   TABLE DATA           [   COPY public."TypeAgreements" (id, name, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    250   �      _          0    16603    TypeDocs 
   TABLE DATA           U   COPY public."TypeDocs" (id, name, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    252   |�      a          0    16611    TypeEmployees 
   TABLE DATA           Z   COPY public."TypeEmployees" (id, name, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    254   .�      c          0    16619    Units 
   TABLE DATA           E   COPY public."Units" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    256   ��      e          0    16624    UserRole 
   TABLE DATA           R   COPY public."UserRole" ("createdAt", "updatedAt", "RoleId", "UserId") FROM stdin;
    public          postgres    false    258   ��      f          0    16627    Users 
   TABLE DATA           h   COPY public."Users" (id, username, password, "urlAvatar", status, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    259   ��      �           0    0    Agreements_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Agreements_id_seq"', 8, true);
          public          postgres    false    201            �           0    0    AppointmentDetails_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."AppointmentDetails_id_seq"', 69, true);
          public          postgres    false    203            �           0    0    Appointments_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Appointments_id_seq"', 30, true);
          public          postgres    false    205            �           0    0    Categories_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Categories_id_seq"', 3, true);
          public          postgres    false    207            �           0    0    Clients_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Clients_id_seq"', 28, true);
          public          postgres    false    209            �           0    0    Doctors_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Doctors_id_seq"', 6, true);
          public          postgres    false    261            �           0    0    Employees_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Employees_id_seq"', 8, true);
          public          postgres    false    212            �           0    0    ExaminationGroups_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."ExaminationGroups_id_seq"', 37, true);
          public          postgres    false    215            �           0    0 !   ExaminationReferenceValues_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."ExaminationReferenceValues_id_seq"', 172, true);
          public          postgres    false    218            �           0    0    ExaminationValues_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."ExaminationValues_id_seq"', 141, true);
          public          postgres    false    220            �           0    0    Examinations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Examinations_id_seq"', 19, true);
          public          postgres    false    222            �           0    0    Functions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Functions_id_seq"', 10, true);
          public          postgres    false    224            �           0    0    Headquarters_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Headquarters_id_seq"', 5, true);
          public          postgres    false    226            �           0    0    Methods_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Methods_id_seq"', 6, true);
          public          postgres    false    228            �           0    0    PriceLists_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."PriceLists_id_seq"', 14, true);
          public          postgres    false    230            �           0    0    Professions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Professions_id_seq"', 3, true);
          public          postgres    false    232            �           0    0    ReferenceValues_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."ReferenceValues_id_seq"', 12, true);
          public          postgres    false    235            �           0    0    Referers_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Referers_id_seq"', 11, true);
          public          postgres    false    237            �           0    0    Roles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Roles_id_seq"', 3, true);
          public          postgres    false    241            �           0    0    Services_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Services_id_seq"', 5, true);
          public          postgres    false    243            �           0    0    Specialities_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Specialities_id_seq"', 3, true);
          public          postgres    false    245            �           0    0    Tokens_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Tokens_id_seq"', 1, false);
          public          postgres    false    247            �           0    0    Tuitions_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Tuitions_id_seq"', 3, true);
          public          postgres    false    249            �           0    0    TypeAgreements_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."TypeAgreements_id_seq"', 2, true);
          public          postgres    false    251            �           0    0    TypeDocs_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."TypeDocs_id_seq"', 3, true);
          public          postgres    false    253            �           0    0    TypeEmployees_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."TypeEmployees_id_seq"', 3, true);
          public          postgres    false    255            �           0    0    Units_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Units_id_seq"', 11, true);
          public          postgres    false    257            �           0    0    Users_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Users_id_seq"', 36, true);
          public          postgres    false    260            '           2606    16665    Agreements Agreements_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Agreements"
    ADD CONSTRAINT "Agreements_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Agreements" DROP CONSTRAINT "Agreements_pkey";
       public            postgres    false    200            )           2606    16667    Agreements Agreements_ruc_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Agreements"
    ADD CONSTRAINT "Agreements_ruc_key" UNIQUE (ruc);
 K   ALTER TABLE ONLY public."Agreements" DROP CONSTRAINT "Agreements_ruc_key";
       public            postgres    false    200            +           2606    16669 E   AppointmentDetails AppointmentDetails_AppointmentId_ExaminationId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."AppointmentDetails"
    ADD CONSTRAINT "AppointmentDetails_AppointmentId_ExaminationId_key" UNIQUE ("AppointmentId", "ExaminationId");
 s   ALTER TABLE ONLY public."AppointmentDetails" DROP CONSTRAINT "AppointmentDetails_AppointmentId_ExaminationId_key";
       public            postgres    false    202    202            -           2606    16671 *   AppointmentDetails AppointmentDetails_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."AppointmentDetails"
    ADD CONSTRAINT "AppointmentDetails_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public."AppointmentDetails" DROP CONSTRAINT "AppointmentDetails_pkey";
       public            postgres    false    202            /           2606    16673 "   Appointments Appointments_code_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_code_key" UNIQUE (code);
 P   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_code_key";
       public            postgres    false    204            1           2606    16675    Appointments Appointments_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_pkey";
       public            postgres    false    204            5           2606    16677    Categories Categories_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Categories" DROP CONSTRAINT "Categories_pkey";
       public            postgres    false    206            7           2606    16679    Clients Clients_code_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_code_key" UNIQUE (code);
 F   ALTER TABLE ONLY public."Clients" DROP CONSTRAINT "Clients_code_key";
       public            postgres    false    208            9           2606    16681    Clients Clients_dni_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_dni_key" UNIQUE (dni);
 E   ALTER TABLE ONLY public."Clients" DROP CONSTRAINT "Clients_dni_key";
       public            postgres    false    208            ;           2606    16683 !   Clients Clients_historyNumber_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_historyNumber_key" UNIQUE ("historyNumber");
 O   ALTER TABLE ONLY public."Clients" DROP CONSTRAINT "Clients_historyNumber_key";
       public            postgres    false    208            =           2606    16685    Clients Clients_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Clients" DROP CONSTRAINT "Clients_pkey";
       public            postgres    false    208            ?           2606    16687    Districts Districts_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Districts"
    ADD CONSTRAINT "Districts_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Districts" DROP CONSTRAINT "Districts_pkey";
       public            postgres    false    210            }           2606    17341    Doctors Doctors_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Doctors"
    ADD CONSTRAINT "Doctors_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Doctors" DROP CONSTRAINT "Doctors_pkey";
       public            postgres    false    262            A           2606    16689    Employees Employees_dni_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_dni_key" UNIQUE (dni);
 I   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_dni_key";
       public            postgres    false    211            C           2606    16691    Employees Employees_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_pkey";
       public            postgres    false    211            E           2606    16693 *   ExaminationDetails ExaminationDetails_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationDetails"
    ADD CONSTRAINT "ExaminationDetails_pkey" PRIMARY KEY ("AppointmentDetailId", "ExaminationValueId");
 X   ALTER TABLE ONLY public."ExaminationDetails" DROP CONSTRAINT "ExaminationDetails_pkey";
       public            postgres    false    213    213            G           2606    16695 (   ExaminationGroups ExaminationGroups_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."ExaminationGroups"
    ADD CONSTRAINT "ExaminationGroups_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."ExaminationGroups" DROP CONSTRAINT "ExaminationGroups_pkey";
       public            postgres    false    214            I           2606    16697 (   ExaminationPrices ExaminationPrices_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationPrices"
    ADD CONSTRAINT "ExaminationPrices_pkey" PRIMARY KEY ("ExaminationId", "PriceListId");
 V   ALTER TABLE ONLY public."ExaminationPrices" DROP CONSTRAINT "ExaminationPrices_pkey";
       public            postgres    false    216    216            K           2606    16699 :   ExaminationReferenceValues ExaminationReferenceValues_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."ExaminationReferenceValues"
    ADD CONSTRAINT "ExaminationReferenceValues_pkey" PRIMARY KEY (id);
 h   ALTER TABLE ONLY public."ExaminationReferenceValues" DROP CONSTRAINT "ExaminationReferenceValues_pkey";
       public            postgres    false    217            M           2606    16701 (   ExaminationValues ExaminationValues_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."ExaminationValues"
    ADD CONSTRAINT "ExaminationValues_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."ExaminationValues" DROP CONSTRAINT "ExaminationValues_pkey";
       public            postgres    false    219            O           2606    16703    Examinations Examinations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Examinations"
    ADD CONSTRAINT "Examinations_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Examinations" DROP CONSTRAINT "Examinations_pkey";
       public            postgres    false    221            Q           2606    16705    Functions Functions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Functions"
    ADD CONSTRAINT "Functions_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Functions" DROP CONSTRAINT "Functions_pkey";
       public            postgres    false    223            S           2606    16707    Headquarters Headquarters_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Headquarters"
    ADD CONSTRAINT "Headquarters_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Headquarters" DROP CONSTRAINT "Headquarters_pkey";
       public            postgres    false    225            U           2606    16709    Methods Methods_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Methods"
    ADD CONSTRAINT "Methods_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Methods" DROP CONSTRAINT "Methods_pkey";
       public            postgres    false    227            W           2606    16711    PriceLists PriceLists_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."PriceLists"
    ADD CONSTRAINT "PriceLists_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."PriceLists" DROP CONSTRAINT "PriceLists_pkey";
       public            postgres    false    229            Y           2606    16713    Professions Professions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Professions"
    ADD CONSTRAINT "Professions_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Professions" DROP CONSTRAINT "Professions_pkey";
       public            postgres    false    231            [           2606    16715    Provinces Provinces_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Provinces" DROP CONSTRAINT "Provinces_pkey";
       public            postgres    false    233            ]           2606    16717 $   ReferenceValues ReferenceValues_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."ReferenceValues"
    ADD CONSTRAINT "ReferenceValues_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."ReferenceValues" DROP CONSTRAINT "ReferenceValues_pkey";
       public            postgres    false    234            _           2606    16719    Referers Referers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Referers"
    ADD CONSTRAINT "Referers_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Referers" DROP CONSTRAINT "Referers_pkey";
       public            postgres    false    236            a           2606    16721    Regions Regions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Regions"
    ADD CONSTRAINT "Regions_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Regions" DROP CONSTRAINT "Regions_pkey";
       public            postgres    false    238            c           2606    16723     RoleFunctions RoleFunctions_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."RoleFunctions"
    ADD CONSTRAINT "RoleFunctions_pkey" PRIMARY KEY ("FunctionId", "RoleId");
 N   ALTER TABLE ONLY public."RoleFunctions" DROP CONSTRAINT "RoleFunctions_pkey";
       public            postgres    false    239    239            e           2606    16725    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public            postgres    false    240            g           2606    16727    Services Services_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Services"
    ADD CONSTRAINT "Services_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Services" DROP CONSTRAINT "Services_pkey";
       public            postgres    false    242            i           2606    16729    Specialities Specialities_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Specialities"
    ADD CONSTRAINT "Specialities_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Specialities" DROP CONSTRAINT "Specialities_pkey";
       public            postgres    false    244            k           2606    16731    Tokens Tokens_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Tokens"
    ADD CONSTRAINT "Tokens_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Tokens" DROP CONSTRAINT "Tokens_pkey";
       public            postgres    false    246            m           2606    16733    Tuitions Tuitions_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Tuitions"
    ADD CONSTRAINT "Tuitions_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Tuitions" DROP CONSTRAINT "Tuitions_pkey";
       public            postgres    false    248            o           2606    16735 "   TypeAgreements TypeAgreements_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."TypeAgreements"
    ADD CONSTRAINT "TypeAgreements_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."TypeAgreements" DROP CONSTRAINT "TypeAgreements_pkey";
       public            postgres    false    250            q           2606    16737    TypeDocs TypeDocs_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."TypeDocs"
    ADD CONSTRAINT "TypeDocs_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."TypeDocs" DROP CONSTRAINT "TypeDocs_pkey";
       public            postgres    false    252            s           2606    16739     TypeEmployees TypeEmployees_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."TypeEmployees"
    ADD CONSTRAINT "TypeEmployees_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."TypeEmployees" DROP CONSTRAINT "TypeEmployees_pkey";
       public            postgres    false    254            u           2606    16741    Units Units_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Units_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Units" DROP CONSTRAINT "Units_pkey";
       public            postgres    false    256            w           2606    16743    UserRole UserRole_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY ("RoleId", "UserId");
 D   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_pkey";
       public            postgres    false    258    258            y           2606    16745    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    259            {           2606    16747    Users Users_username_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);
 F   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key";
       public            postgres    false    259            2           1259    17377    fki_Appointments_DoctorId_Fkey    INDEX     a   CREATE INDEX "fki_Appointments_DoctorId_Fkey" ON public."Appointments" USING btree ("DoctorId");
 4   DROP INDEX public."fki_Appointments_DoctorId_Fkey";
       public            postgres    false    204            3           1259    16748    fki_Appointments_RefererId_Fkey    INDEX     c   CREATE INDEX "fki_Appointments_RefererId_Fkey" ON public."Appointments" USING btree ("RefererId");
 5   DROP INDEX public."fki_Appointments_RefererId_Fkey";
       public            postgres    false    204            ~           2606    16749 *   Agreements Agreements_TypeAgreementId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Agreements"
    ADD CONSTRAINT "Agreements_TypeAgreementId_fkey" FOREIGN KEY ("TypeAgreementId") REFERENCES public."TypeAgreements"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."Agreements" DROP CONSTRAINT "Agreements_TypeAgreementId_fkey";
       public          postgres    false    250    200    3183                       2606    16754 8   AppointmentDetails AppointmentDetails_AppointmentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AppointmentDetails"
    ADD CONSTRAINT "AppointmentDetails_AppointmentId_fkey" FOREIGN KEY ("AppointmentId") REFERENCES public."Appointments"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public."AppointmentDetails" DROP CONSTRAINT "AppointmentDetails_AppointmentId_fkey";
       public          postgres    false    204    202    3121            �           2606    16759 8   AppointmentDetails AppointmentDetails_ExaminationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AppointmentDetails"
    ADD CONSTRAINT "AppointmentDetails_ExaminationId_fkey" FOREIGN KEY ("ExaminationId") REFERENCES public."Examinations"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public."AppointmentDetails" DROP CONSTRAINT "AppointmentDetails_ExaminationId_fkey";
       public          postgres    false    202    3151    221            �           2606    16764 '   Appointments Appointments_ClientId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_ClientId_fkey" FOREIGN KEY ("ClientId") REFERENCES public."Clients"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_ClientId_fkey";
       public          postgres    false    204    208    3133            �           2606    17372 '   Appointments Appointments_DoctorId_Fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_DoctorId_Fkey" FOREIGN KEY ("DoctorId") REFERENCES public."Doctors"(id);
 U   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_DoctorId_Fkey";
       public          postgres    false    204    3197    262            �           2606    16769 )   Appointments Appointments_EmployeeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES public."Employees"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_EmployeeId_fkey";
       public          postgres    false    3139    204    211            �           2606    16774 ,   Appointments Appointments_HeadquarterId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_HeadquarterId_fkey" FOREIGN KEY ("HeadquarterId") REFERENCES public."Headquarters"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_HeadquarterId_fkey";
       public          postgres    false    225    3155    204            �           2606    16779 *   Appointments Appointments_PriceListId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_PriceListId_fkey" FOREIGN KEY ("PriceListId") REFERENCES public."PriceLists"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 X   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_PriceListId_fkey";
       public          postgres    false    3159    204    229            �           2606    16784 (   Appointments Appointments_RefererId_Fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_RefererId_Fkey" FOREIGN KEY ("RefererId") REFERENCES public."Referers"(id);
 V   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_RefererId_Fkey";
       public          postgres    false    3167    204    236            �           2606    16789 ,   Appointments Appointments_ResponsibleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT "Appointments_ResponsibleId_fkey" FOREIGN KEY ("ResponsibleId") REFERENCES public."Employees"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT "Appointments_ResponsibleId_fkey";
       public          postgres    false    3139    204    211            �           2606    16794    Clients Clients_DistrictId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_DistrictId_fkey" FOREIGN KEY ("DistrictId") REFERENCES public."Districts"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Clients" DROP CONSTRAINT "Clients_DistrictId_fkey";
       public          postgres    false    3135    208    210            �           2606    16799    Clients Clients_TypeDocId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_TypeDocId_fkey" FOREIGN KEY ("TypeDocId") REFERENCES public."TypeDocs"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public."Clients" DROP CONSTRAINT "Clients_TypeDocId_fkey";
       public          postgres    false    252    208    3185            �           2606    16804    Clients Clients_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public."Clients" DROP CONSTRAINT "Clients_UserId_fkey";
       public          postgres    false    208    3193    259            �           2606    16809 #   Districts Districts_ProvinceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Districts"
    ADD CONSTRAINT "Districts_ProvinceId_fkey" FOREIGN KEY ("ProvinceId") REFERENCES public."Provinces"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."Districts" DROP CONSTRAINT "Districts_ProvinceId_fkey";
       public          postgres    false    3163    233    210            �           2606    16814 #   Employees Employees_CategoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_CategoryId_fkey" FOREIGN KEY ("CategoryId") REFERENCES public."Categories"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_CategoryId_fkey";
       public          postgres    false    211    3125    206            �           2606    16819 #   Employees Employees_DistrictId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_DistrictId_fkey" FOREIGN KEY ("DistrictId") REFERENCES public."Districts"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_DistrictId_fkey";
       public          postgres    false    211    3135    210            �           2606    16824 &   Employees Employees_HeadquarterId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_HeadquarterId_fkey" FOREIGN KEY ("HeadquarterId") REFERENCES public."Headquarters"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 T   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_HeadquarterId_fkey";
       public          postgres    false    211    3155    225            �           2606    16829 %   Employees Employees_ProfessionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_ProfessionId_fkey" FOREIGN KEY ("ProfessionId") REFERENCES public."Professions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_ProfessionId_fkey";
       public          postgres    false    3161    231    211            �           2606    16834 %   Employees Employees_SpecialityId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_SpecialityId_fkey" FOREIGN KEY ("SpecialityId") REFERENCES public."Specialities"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_SpecialityId_fkey";
       public          postgres    false    244    3177    211            �           2606    16839 #   Employees Employees_Tuition2Id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_Tuition2Id_fkey" FOREIGN KEY ("Tuition2Id") REFERENCES public."Tuitions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_Tuition2Id_fkey";
       public          postgres    false    248    3181    211            �           2606    16844 "   Employees Employees_TuitionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_TuitionId_fkey" FOREIGN KEY ("TuitionId") REFERENCES public."Tuitions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_TuitionId_fkey";
       public          postgres    false    211    248    3181            �           2606    16849 "   Employees Employees_TypeDocId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_TypeDocId_fkey" FOREIGN KEY ("TypeDocId") REFERENCES public."TypeDocs"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_TypeDocId_fkey";
       public          postgres    false    3185    211    252            �           2606    16854 '   Employees Employees_TypeEmployeeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_TypeEmployeeId_fkey" FOREIGN KEY ("TypeEmployeeId") REFERENCES public."TypeEmployees"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_TypeEmployeeId_fkey";
       public          postgres    false    211    254    3187            �           2606    16859    Employees Employees_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Employees" DROP CONSTRAINT "Employees_UserId_fkey";
       public          postgres    false    3193    211    259            �           2606    16864 >   ExaminationDetails ExaminationDetails_AppointmentDetailId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationDetails"
    ADD CONSTRAINT "ExaminationDetails_AppointmentDetailId_fkey" FOREIGN KEY ("AppointmentDetailId") REFERENCES public."AppointmentDetails"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 l   ALTER TABLE ONLY public."ExaminationDetails" DROP CONSTRAINT "ExaminationDetails_AppointmentDetailId_fkey";
       public          postgres    false    202    3117    213            �           2606    16869 =   ExaminationDetails ExaminationDetails_ExaminationValueId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationDetails"
    ADD CONSTRAINT "ExaminationDetails_ExaminationValueId_fkey" FOREIGN KEY ("ExaminationValueId") REFERENCES public."ExaminationValues"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 k   ALTER TABLE ONLY public."ExaminationDetails" DROP CONSTRAINT "ExaminationDetails_ExaminationValueId_fkey";
       public          postgres    false    213    3149    219            �           2606    16874 6   ExaminationGroups ExaminationGroups_ExaminationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationGroups"
    ADD CONSTRAINT "ExaminationGroups_ExaminationId_fkey" FOREIGN KEY ("ExaminationId") REFERENCES public."Examinations"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public."ExaminationGroups" DROP CONSTRAINT "ExaminationGroups_ExaminationId_fkey";
       public          postgres    false    3151    221    214            �           2606    16879 6   ExaminationPrices ExaminationPrices_ExaminationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationPrices"
    ADD CONSTRAINT "ExaminationPrices_ExaminationId_fkey" FOREIGN KEY ("ExaminationId") REFERENCES public."Examinations"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public."ExaminationPrices" DROP CONSTRAINT "ExaminationPrices_ExaminationId_fkey";
       public          postgres    false    221    3151    216            �           2606    16884 4   ExaminationPrices ExaminationPrices_PriceListId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationPrices"
    ADD CONSTRAINT "ExaminationPrices_PriceListId_fkey" FOREIGN KEY ("PriceListId") REFERENCES public."PriceLists"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 b   ALTER TABLE ONLY public."ExaminationPrices" DROP CONSTRAINT "ExaminationPrices_PriceListId_fkey";
       public          postgres    false    216    229    3159            �           2606    16889 H   ExaminationReferenceValues ExaminationReferenceValues_ExaminationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationReferenceValues"
    ADD CONSTRAINT "ExaminationReferenceValues_ExaminationId_fkey" FOREIGN KEY ("ExaminationId") REFERENCES public."Examinations"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 v   ALTER TABLE ONLY public."ExaminationReferenceValues" DROP CONSTRAINT "ExaminationReferenceValues_ExaminationId_fkey";
       public          postgres    false    221    3151    217            �           2606    16894 M   ExaminationReferenceValues ExaminationReferenceValues_ExaminationValueId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationReferenceValues"
    ADD CONSTRAINT "ExaminationReferenceValues_ExaminationValueId_fkey" FOREIGN KEY ("ExaminationValueId") REFERENCES public."ExaminationValues"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 {   ALTER TABLE ONLY public."ExaminationReferenceValues" DROP CONSTRAINT "ExaminationReferenceValues_ExaminationValueId_fkey";
       public          postgres    false    219    217    3149            �           2606    16899 ;   ExaminationValues ExaminationValues_ExaminationGroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationValues"
    ADD CONSTRAINT "ExaminationValues_ExaminationGroupId_fkey" FOREIGN KEY ("ExaminationGroupId") REFERENCES public."ExaminationGroups"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public."ExaminationValues" DROP CONSTRAINT "ExaminationValues_ExaminationGroupId_fkey";
       public          postgres    false    3143    219    214            �           2606    16904 1   ExaminationValues ExaminationValues_MethodId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationValues"
    ADD CONSTRAINT "ExaminationValues_MethodId_fkey" FOREIGN KEY ("MethodId") REFERENCES public."Methods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 _   ALTER TABLE ONLY public."ExaminationValues" DROP CONSTRAINT "ExaminationValues_MethodId_fkey";
       public          postgres    false    227    3157    219            �           2606    16909 /   ExaminationValues ExaminationValues_UnitId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ExaminationValues"
    ADD CONSTRAINT "ExaminationValues_UnitId_fkey" FOREIGN KEY ("UnitId") REFERENCES public."Units"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."ExaminationValues" DROP CONSTRAINT "ExaminationValues_UnitId_fkey";
       public          postgres    false    3189    256    219            �           2606    16914 (   Examinations Examinations_ServiceId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Examinations"
    ADD CONSTRAINT "Examinations_ServiceId_fkey" FOREIGN KEY ("ServiceId") REFERENCES public."Services"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Examinations" DROP CONSTRAINT "Examinations_ServiceId_fkey";
       public          postgres    false    3175    221    242            �           2606    16919 "   Functions Functions_parent_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Functions"
    ADD CONSTRAINT "Functions_parent_id_fkey" FOREIGN KEY (parent_id) REFERENCES public."Functions"(id) ON UPDATE CASCADE;
 P   ALTER TABLE ONLY public."Functions" DROP CONSTRAINT "Functions_parent_id_fkey";
       public          postgres    false    3153    223    223            �           2606    16924 &   PriceLists PriceLists_AgreementId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PriceLists"
    ADD CONSTRAINT "PriceLists_AgreementId_fkey" FOREIGN KEY ("AgreementId") REFERENCES public."Agreements"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 T   ALTER TABLE ONLY public."PriceLists" DROP CONSTRAINT "PriceLists_AgreementId_fkey";
       public          postgres    false    3111    229    200            �           2606    16929 !   Provinces Provinces_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Provinces"
    ADD CONSTRAINT "Provinces_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Regions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."Provinces" DROP CONSTRAINT "Provinces_RegionId_fkey";
       public          postgres    false    233    3169    238            �           2606    16934 +   RoleFunctions RoleFunctions_FunctionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RoleFunctions"
    ADD CONSTRAINT "RoleFunctions_FunctionId_fkey" FOREIGN KEY ("FunctionId") REFERENCES public."Functions"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public."RoleFunctions" DROP CONSTRAINT "RoleFunctions_FunctionId_fkey";
       public          postgres    false    3153    239    223            �           2606    16939 '   RoleFunctions RoleFunctions_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RoleFunctions"
    ADD CONSTRAINT "RoleFunctions_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public."RoleFunctions" DROP CONSTRAINT "RoleFunctions_RoleId_fkey";
       public          postgres    false    3173    240    239            �           2606    16944    Tokens Tokens_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tokens"
    ADD CONSTRAINT "Tokens_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Tokens" DROP CONSTRAINT "Tokens_UserId_fkey";
       public          postgres    false    259    3193    246            �           2606    16949    UserRole UserRole_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_RoleId_fkey";
       public          postgres    false    258    240    3173            �           2606    16954    UserRole UserRole_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_UserId_fkey";
       public          postgres    false    258    259    3193            +   �  x����j�0���)�}زO6�!K7I�І\�#�?�����}�J��u��C!:F���!�H�i|u�� �z�ލ����~9Z�����:?-�)fۃ��D��B���y�p����51��Q�bC�(���e7ͳ�X7��[������?���"�gT����re����ʍ+����p�a��ԃ}l�T:�2X�ǰ�������JSX\�r:�E�e��bZ��P��L�F7%�"�Ҭh
���`g?�(ۣp��OC����!��ַ�RJ���=�1��UH�]M/ow��Tw������: �F����\���5m���k����x�͹?�6j^p�t����.!1���j�#��]U��L�qh��}�)�a�N?�ޖ�<0B�/����      -   �  x���[��0D��U���,��k-��u�6�D(��t��n��D�'�Sd��k�IC�OѮ$~0ɹA�e$�:�
�iV��p�&�ӬQ97���r�:�*�s�5�����iX�yVb�Z7�D�t�l�N��ˮ����W(�r��ETN�>��)�G19�*~��R��ӫ��8��+�ӫp"qzu6�W>�*e�ue�B�ӫ�(�rz�EPN�>����U�`W������,�N�n�J����H�^݀�tӫ��v�0��t��ȤG�T�Jh���&�\�� �E��u�����Ó0@���n=YO)��}�0@��<�,,�s�5Xm/�T�p ���B)�YĖ��n-�lᣂɒ)��	��	�Q0Z�ʛ#!�R�#��0]@�/P��b����fϧ�����ފ�uG%��{K�>�V��+2H;�98.�z�]jؖ�\A�(�i��uƪۻ�ZȜO���c��2~yx��ٺ$�}T���d���i���Xzr[w6�D7��K�L���zT��3z'�G%�A��>�6��\i\�deG�u�.d�UC�i�^��"�ݜ�s����8�7�<O��n�kP�z'�u�:�c�i���7[-�}.��O�q��<Oc�e��՝'�Ǽ��;�&��r��}"��� _      /   Y  x���_n�FƟ�S� �bg�/�f�~H��A��Pm�I��Eo�3��X�YR�.MA�"�g�?��7�+�խ&_i�Y�i]�f�h�p���|��������ԙ�,���M6�Ȥg+��?l��/59;�X����N�^˛�#���
8ې���\�����5����;G3�m�+#\S8�6�62����>s�4�l,W�Ϸ�jn�&�ͱڿ�uimב���j�Kj���Ƣ���肚�L麫��1��D���P�	P�_]�}����Vl:v#�6D���cnD�w��;�UpWdir��h�*r��&��ZS������,k�AB]A�L-͡�4��b�5�/��9�xASJ�Q�I1g3y�!*����av��y�a��H�ƽ���@�U�ɈR�0�I��k�&kްꬩQ� .��N)d�fwE��;�d�0������ pR���S��pp��y��˪:B�h:YD3��(�ĳ9����8(�D��ry����3�(���)��-��	��z|�|:���d����&�e�R)�@O�r!���#�J�;�X)N��W����Ҿ㨂�K*R���ⵥ���鎨����r&52ӉPb�3��Ϡ[���Mԟ���ͻ旛����=XI�M��/����q�	�k�h7�6��4������0v�����Ph����'=����L#+�LD��4ϩ|�Ф�5Jl��R�ԩ���<!e���0,mEƨT�fI�L#5���^�^',%=�cH�6׮`��K,�X9=�$`�-"����>�j�K�967�]0\#<囹�R�=�Zy^�����U�Oϧ�?6��s|�|>v������?�.�Vâ&H��S�|�4���=$\Nn�Nn��L6\��,"r�W��WaJ�W�.4�I�}7�]��6N�o����_�����K���;�����t�v<���sT�v�_~?5�}�;>�g��q���pq-u`Vޔ��"<�E���GWK�o��r� ��cm-�������� �����j������v��sl�F��|�fab�C~�I��C��+-�:d�\��G�s�3��Z�T]��e���      1   T   x�3�tN,IM�/:�6Q���%�8�(� 9���<N##C]CC]##K+c3+c=s]S<R\F�&Q�Dcd��ab� �?U      3   �  x����n�8�����@��1w(��9�&�ɪUo���������wlCJڴZ�B�O�O��3F�� ��NP$� ����rii߻fu���?u�ivm߀P�@H�p��ݷ�ݮ�w0kvO������H[PV(J%R"�W��E�P�ҙ1��b"��V��E���-/{h��ux�����?��_�<��\X���B�)�x>Jd�d�� a$(���1"��~��
?�G��[��^�u���*^�/T�5	H�pq	E���%�*a�H'R���H&�8"�;L⯳�b}uWB]V�dS��ʺ���T(�
�g8��.�����Y����H_��u�����U�,U=_-�D7��B�qE>�	/�8:�J���F$\h�]n�U]�K�U������}��Ak�
�Yy�͑��G,�K�4�4�S����A���Ҝ�EN:(��wn���?w�m��Ǧ��u�o��vp�ƻ&>�����Ƕ��������<L�����e!��DJ�IΦ��K��b��AD��Cf	����l�=����
��V�c)���BY��$�0�RJ�x-�7%�j�X����YY_/WG���1��_J�B��k*)_N���(B�$|�f!_����~����췻�8�ޕ�m:m�Lʤ�:%ұ�w!��-���2��5�2�Hگ��[̇�u|Hn��y�Hc��p��p���O����D!5�e�����NY6�$��ʅ��zM�f�����(&�H�L��K�n �wC�	�D6���P.� ��g�AU�kD!�Qe�T+�O}����fϛYe������_`%�LYe���(�M�7�wR!�A;>�M�gc��/�`�Y�xD<���s{Z���Y6ސMp��H;��q���&G��-e�T(%�7w����7��~v+։�#�D�s&�S�����e���FiE�O���      5      x����n�H����O�˙E_8��̻�T�*�eKm�Tc�A�ɖ�f�Y̤nKo1�P�^ԢP�����d��u1��
���$��|�ϛ���\<����'{4ɛd�����I�z��ϴ��,���:��������͟�ĜǮj^~�"�Rsn�c���֧>)'R�6?�M��Xm$֝������a����`����vU���5�v�޶U�[�1�u��#����p����:։�`�w���O�mh��mW�xj�653������b�r�u�����1^aa�ڶ��n�1�}�5Һ+͍�V������]���ޏ16�z+�w�f7���/�s�7�o�*jM��z�aTB��9��pR2�����v��/���\Юh[�h��̼mW�v@޽�����>�xa���5�!&VJ�����Î�t�%|��.��K�fƯ1Xd=�t =�`��06�C�U���~h��޳6�=-0`�{Ri>��)�3�C��-r�8�n��=����������D5�z����ǆ��pR6�>�.�F�OKͧ�_�}�Sc�C{"��K/�~܅��D'�D�0Ի����|�T�����Y2{;D��9�wr�zTa�u�tn,��=nc.{�E��{�+�[����ȑ�"<;1Z}i����"r^~��d������J	5�m����Ȯr�����g��,���]T䫝^~���{7t6~��1��sc�����]��At������Ǽ�d^���Ͳ�BW�_:[�.��\�_��{�u���6���I��b{�����t�/� ?���b��\�0��ɽ�`����2�S��b<Wn.�=z_{Z!r[{�f��ם�+�W-����*jk���Y:�����c����,b�{Tb��oWgm}? a�	��� +��� �f���� l�M:B��$B+��Gy��\�=��b��}�{r=�G)�h�k�}E%.��%6�K�#��DÃ}� ���Շ�Ì;E,h��1|�*Ԇ�o��]=�l�Ǫx%+W������
�N�k��l���& �W ����O��8�YaL\$5�0�EO�{Rʛ�j��P��e�^?�CU���rs3V�[�Qy�l��FB���%z>���5�A��ӫ�,NY7ع�Y9�yCT����ԓ'�6�*�'�fM��>�ry.N�#�)�a�dwuk�]ω!��~�U��)vj��StM��d�� ��o43gH�E�r�L+����XrXz҆��}��`R/�/��<m˴c��A�0�������X�\1aW��ʏ@�C�l;�<*%����p\�29�>4�c��iGw��v�^"�ss��s⿙�=vxW��YrzB�!
F�����Yp1@�9;ٟ�:�U��3�Ev�gm���0bG���,߳���n9�
��L�M��D�iDBm��B��#r�lfX%�����	(O*��8�R9�s>��\t٥�1�=9��;ի�})V̌_�	�'Ԗ�^?�@؟!K������!��G��1�Cȓr�����
����5O�Ёq@V�#��La�p����A\$(c;��^H���F|=ҝ�#v�����C��V�X��~�m���㼱-�G ��I�G{A��u�M+Rb>�ك��.%��u��pg�w��|iw���0��+d��9�}��5%�	���٨���0�8@�ãrڙ�c��J�8q�d&%BMBʀQ���{o���Y���ǃ
���r�#/n��ڞ�<�Yb,��a��6���eh�/������V{v�a�����	�.���9qĔ]H�y���������/���iZЙ��ّ�~�6t����q�(r.��?� �]��1�c�J�a<��$�@\UH&u��$�琣ă�O�
�P�l�������c.HFb���W�D�}�7����o�y��.� N�ʦ���ٕMcJ��AFj>�s޷�}W���8@�U#d�{Z�\�c��������v��1��QѸk-�Yh�?�Xu�T��D't�z�\����*��ܲ��8Us݃���hɜ��#��ـ�]��I���rX�S]�HPk3��"<Qą�gЉ.S�~���q��9�������*�6��"�6s�ԕ��|v��3���V*Hp����H߳t�(����P��m��KU�qŮ�u=��;��Ds|@��ge��*�ײJbhyPa>և��7�{z7��-�]XS� ik>��c����8]v�< J	̘P�-oK�Y���;����v@~�G��u|@����S`��k�V�7L�(
�Cx7�b��%�!j�H�alL6���q	'�V!ܒI�̨)�u@�O��t�;����>a��,�5ֶ1P-�n�b�,8:��C;����䶁��C��9rvǱ���J]�{�ZG�
>�l��+(�3�%(�s֛P3�h쬳�C��T0���|m8h�V~�~�����l5��F@��ä�����ERE��H���y����k���U����bK��r�6��S�4Ɠm�_�%�5v�@P�8�T���������>ޮ���q.Vy���J�&�i��x�4���"��jĠV�|
:��)X^Ey����W�����i%M�Ƚ�%�p7B���/�C"m��y�_�5�����.�џ�UrB�3�i��tFP()��w�C����z{<4]��={���*rn����0�bq�7f��m=��'w�N�gM�g-Vz����Tz�.�-*���'p	{�Tt�XC����
WH@}����a�Nl�p�Q�J�a�S�:;��+�̈��̊RUx��Bb��Xkx�~���w0�T\6D���!�� &�F#���d�A���q�]=�)�QdW���WA���2�]>��g\"[��`P8NC���]O��U��:�/���(�B.-���j8�&d�2L���B���*u݄]���F��&��mQ4W�QA>����{�V���>��^�6�3Y��u�i���b�n��5�z��������?V\�Ǻk��.om.�����#�r��ޚ���z��5�N��\:4�q������ɳ|1Cx���񙹇NM�*̇��ukW�,����%t�CY?�+Y��~ l�#?8/Jq�­%,�J�
m�7�q)��V,��8"�qae.�3�t��/���3I������#*m���>�G��^\=���L2�ÿ�BrN]�j��IEc+��G:d�e�Ɍ�W?�ݩ�����+}���X[���]��P�@������Y��o^C�pkn��w���h�k�ek�K�A��)#R�G���_���iR�B�r�.\6H�8�I9)V�*�q� �[����h�t���>~w�w.�'	d�����
N̍��X�,���be�s����'~��]p�#�~�4�2������~�������aM���x<q��^�D���r���k�%��/�df%��Q����=8���,��b��嗡
�7Q�L��*{#Ps㟖N��>X�몸�K�+ǣ��V(�$��v�&���1�������pZ:Ӥ�p��J��	(�W��I�?�a�9�[r�?w�Id�@,>�`	�����$�`���Z`7r�g�qd���@�\�8���+R"���;*��h!�D���١����f��R��)�m���l|@�r�S+ �hd�m�H��rZ�Wr���ࠖ�m�� J2.4_��C��ǭ�Ft�)1�_~SP��SQ~]�@��ϣ&!�GdA�3�m��	�yT:uwW= ��x��B�70=J�X3��7��R�,9���mΜQ�y�r�ּ#'<)fO(t����G$��I��F �+�����|��PY� �����
YxT!�-N�Km�4�"q=jxrP��E����7�0�"~�D*^e{��P̼�����%�b!qJ�A���Y�y�n�(6�D�8�J�n�o�z�hq �fǅ�� �ٜ\�8�>	�#��ǥ滚N�/��5�HN�3���"�ēr���
s=v.�~������n����vdN�8��3��� r2 US
�D� =!���ν    ]L���
�*�(k��,P��p�|�B�νq@v��b��~_������>$9 �ܕK<I�W0,w��ܕKT}�\
�2������Ֆ
(�n��c�����
U`�z�ĕVW��)Z9�E@M�`�q&��{��i��[��%��
���W�q,�YUX� ����ݺB�KY"9���e���˿���,Z��)f��������n���)��w<���������&���d��6�x�H+�b[���4�2�f��-��eΩ�&�LV�\$�b<f!jqR�F�@�.�Q�d-ÛE����#f�)\��ܺ�j�H��ɟ"J����_	ҋ�CO�nQ�>�!!X$'�~��i
��K��6uE+��eM�8���S�Jsٲ
��S�-���)��va�}��Mw� W�ǭ��8An�+�ӏ�I�4�ɩ����Z�"�8׊�U�(۫Xl��|\D`F*�.�V�{��K7:�t��H[)�����%��������܈�UUxW���-Ǧ�WV�(�G#2 O�RPkZ��+|c۪F,>���,$�dM��i�^7�Pnfџ*x��X�(\Q��沦5���k�uc!rR��@2Q������rW���2���:�ȅ�Il)7��I�72�����.��h߈�]�	�����[�:;Mf{��GE��h{ ���۸Y�dP"w�f�I�a �g�J�Ǻ%��x��[�b<a&ʃ���i9��P�Ɠ$��LuT,��'{��b 7�Q�1�4��z�h�G��>F9�87
�7U$Y{�9����$�yR�4ޡ��+��S�,^O�8�wd�z��F�\=�\d�tc��o� ��@��J
`���Ξh���W���K�b��_�E�Q�[n�Kҳfw���P�if)d�yX�b�U�~��q(�7��%�7���\�)nxN⮗-�ױ�
83���G�Y7�#sv�����4��� 7Y�|�܍�M~-p.�Ԝ��
����t ��B�%:
%(V1պE@m��]R9��镱�f�v�E���%��H�O ��
5	|`��Ǖ!�;���'�g"��T=��Zh�4���Ĵ�P!�u���"x�$
Za�u��P��w.DvRFD[[�JZ)GZu�i)�B*�����ߵx�i��c}UEc�>!iF�%w��*7o;��tE+��(��Gg�P�R� ���n.�;`�+.K���l[������M������I��)zX2�Q�G*\iF�Je��:�VF�d�宎�l��iN�μ�I�{͵�/�_!�i.�7V�C�Kb.���0)�T.��%�����pύC/�<��S���D,~x���CܘI���}[�p�H1Ks�O���-�l�z��g��2+��|>Ey����.��z8�ݔ� Fz�S?��=��i�쉫b�$�C��GeN���CZ�0"o޳��}���n��q����J7c9�/�N-���1��5�+ry���"%"dW�@u���0�
��=*3�Mx_��.l�LuS�%,�ƦM�/�1��lE+�m_��g
�u�1��7�DR��N�ކ�d�$��J$\^��}(��5�h�U���0>s�+��<��2��]�,c�+�d��0>K�G��F
���C��O+�O}���I���S=<���Y���x�34
���8C<��z�"�'������6=��������wn���ǖ��kea)�hk��f4��]%��� �<u���8�l���w���=?iKp{��t��N�[D�K�2�C,!�ʹ��kz�ұ]��C�$��&��8�R܏�r�
%��=���4.}yo��|�j
)}Y�G��P�䰦.�`eniq'~K�@��B���ꚼNdOy�F�ArUT�PJ�v�(>����f�t_��!n����:�6����q۩���}g�����R�s�3H;�H�09����0.U[]�T���:���+�Êו[��8����;l��L�rW��v]���qT�(Vj��h����i�k�^�� �=�=����s�J�+�#ZX���8>�ױ�f3qo�](�y�:J]1�����o_~}�`\���<1����?�� ~��e�ҿ�`l��oi)�����3p�.���R.���ƶ�cS��ǣ&s`���n�4txOC-�d��vB�
]����8�����hW�-R��t \�;��_'3-�BiCGG>0�W!S�G�e<B���j��N�I\����sr~X�z���y�H�zae�=p'E(�{{<�P��t�t�^ކ[l���8�5V��cU�3�A� V85�`E��Y;�i�l'�m�J��O߸������
�K�bk�d�է����O+��u=���L6�(F��KM�	-*׍�}�7+�r��r!��S�@�O�x��ޖ�HNI�=��߻f�g�l�M}ǣ.�w�"��"l#2���L�J�d*��0�ͤ3.�W^.]=\)��:�W�(�� ��:Ū���
�KlR
��+�+̧��!I�*맅;=���3��-]�U�&�t��h�ԗ6ؚ��l�n���p�K%�ΙF@�X�ȍ��zBT_m�����%E���0:M���o�Є�dxT�,-��fwA�7)P�}��qGEbk
w�Ht�5GQ��U�c ���FEr��&<p�a\��0@��t�%�T�TWQP�������8a=��"��Pl�#�ԮN�A��x
ų�Z�ѳ;���UG7M5J��/]�-2r��3���]�;�]�&��l�D��|�q� �<<�����A�G�h�5�]6�6S�,�)]	F�jChqT�G�8���5 �%u?�u�g�s�y�V����A��G�|З߀z$+͗�m���gqy������g��!�i
�`\�����,E�x��0";ݳXx�m���ø���֐0:�Ƨ�#�x^i�Ze�	�>�q�W�R�R�Lޒ�8 R�
&U&O=�]=m�F!'��r^�P�A�
��ڶ��e��1i�wM�\�b���e��?u��"�9�\�c�b���ڼ��a���x��R�v����S�
�N��4h��uM[�[_yHJseH:�]QJ�4m�N'E�K��Q$���<�D����	�,��\�!�
%�T*Z_؅� Kڡt5Ӫ�A�~��d��� �X�g��P4�PN��ʅ7���]��r�,��0�/�ARQǩ���q�T�pE�u�y�~���{ΖE`e|��9Zh9�N����
�ɂ���6.O�T��sx�"m�(f�_HfY��=b5/0�? ���J�K�k�+���q�l�<���L	�Y��|����L������h��V��$2��d����7������bw�����h����y6ߝ�'�v@�P�D{��$���Q�T�BTMzhڋ�m��0�v,ͻg��m+#�#�D �7+Қ�zs�l�G�E�&���U��|��~uUU�4Ndyt �H��h#-�u�H�[���4gǪ���9������
���s�Jj�o��Њ�B:
�� \�$�lk�*&/6�c�~RH�M�Jý�@��g��x� ���7錒*+��~����X���e��.��
f�x�d%���
6X�i�
��,�?�i�*b9O�:Ԃ�)�ܚ�#�k���S�ҙD\E��ϥ�#|���,�ӂC=�M�M]U1���8;�������u�F['/7��7�n�q��(�b�Eq�BF
&������m]=���\��I�rIn;�om7N�ێ ��rU�d���J�mS!3~=K��FZ���g6�S���Bl�2k̸��E�I�·z����QE+�e_=b�z�f�3A���J�xη�ַ	.�U���%��9�`9��I6��8V�;�e".f��� ��Տ���$�h/�;@�I�27y��W]a��g��XK�{zZ�1��<�"m8�qh�(�Ǖ"膜���t���s��Gk��F�0����<:i�yB&#)��twl�jU�K_�-������XV���"�	�����t����6�ٓ6��';x�͌���4S=��	\Q��=,3g������n�x�{\a��]C7�    ��н�B�y�b��n��*<O¡C�G���i�5�4Y[y!?#��'�|��(��Bc�#&�b�c�!�5)p�U槬>�\\�����C���n�Xx��p]��z ƀ/����@�����S^2�H�T�����[�v�F��a,FNi��)�Xt�'h�`�F�fo8XmC�2���ݠq�#	5֨B;:�W��/�T������f��}�CD����͋��h�v�=ѫ}�Պ��@-Q����#�n�ak����8n40������Y��M�� V�p%�nT
aqjxl]�����5*�� ׇ�M�wC��*^o�Dw4|������'h_����/��I6ծ��\8-�i>��F�r�/t2�`�.b%�#PC�a�	��HdC�<�<16+17����VMKE ����Dz2+��ǧcDҼ���q<���,$N�\����g�X9`͒ΆǗ_;���>��̼�<�J�k`n�s�	�M=��9Po��B>�cm��:�=��i@�߳���!�C�Mx��&�]z3K'�Z>��g�#�V̴d������q���ɩ���6=����Y��M�������o sb4;7��P��Y��ڮ_}G_�س �c����H d35�4����-��MX�k"5�8�ei^��9�7��>Xd>��&w��m�\;�r>��Xw��f� ��z��{~��O���y�QX����@=����4鐋��I2N�2�=+�pai����}x��Bb�t�`2��&w�z��\���3�k=����ZW4+#�t:HXW�r�����F�H��
6�]*1��F�dP>�!enF�h�и�Ik����c�gǗ_c�7��]p'8��`rH�2c����%d��W	˪i\f�<;�'��{@QC����x��м�\�a���u�4��I��%�.���o<Gf�6,@��[`j.����}�׆���_��Z��],�Ou��R8n�x�R�&�ŭ���	��Ѥ����+g=E����չO�)��kTK\�s3ޝl�hZѼ�܆7�kP���˿aMR5��L��� �7�����:�`�J��骍��rԴ��˛50�˸5�0?�ܴ��(�u�x`�jv.�������^��!\=B���;�Ӂ��YkWZ(u�}�sR�h�Ƚ��$7|�nu� U������3��DF�9=+7_�֠Ӫ��eY���,�+1�ȸj�Jͧ�_���e��)���ms�-���9�k$��v����\chx�G�X�%\U^�2�>⡦?��V�'�e;���<�*���<�s_�5݊��は4��h�M�hLx�'q6T��DR������B�ΏGz5�`ӧ
�Y\�h\h�x��={���p-��pAI�J\5{ٰc�%�&��H���S:*6�@����S��y���7�[�4�uБ?>�H��[���8C�E�T<'���Ҵ��Q��T=��V0�y�c-��M�Ksv?O/�FX����\�ycc�ܓ��[�/�r��
L3��a�է4��9��4�5�~�ß%ј���C��Y&��L�q8��q@�qE�Ѱ��C��rWK�}�b���i���Z����=�n����(h�bq϶C�0
�U�q��$��E�Ԇ�ik�ACJDN�t�[����\U��
����K�6�ۂ���G������+�G��t�%��pO<*u���J�.�ĥ����|���C���tꃣ�����v��'.��8�����J9WS�̜�,P��P�T������2x���6�$��(�Z=nZ
V�Ԭ�_�l̸5�u�pBnm���}�H\S�с{��ߞ��˚+�VW�����߂;�543�m_I�F�o�*c�;.�=��j�ƑVp��K���%�:��i	�^#t�y�ڑ��\��p%F�_(�YP ǣ8J�Ŗ<*w�!H�2 ;�o䮱
��+���^�d����*޷�[X8c�J�d�A�$�څ�Ѩ�H�kLV�҆�$)*y��#9��~��5�99#�{%��9G�O4D�f���綂�=L���S��(�	�Ɋ�fh ��Rn|�lw�����E��,w����]�\����1P���X�#F�Ǖ�z<���=W�EuRA�q�'(����pa7AL���װ�����8Q<�A-���NzE+�A��q$�p�o�H�W�G��-�8�Ĝ@��3���[e�%s��$R87Y�e΁̖�e��)P�_#���>���z��L��_N0���3����7!�zt`=z.�csQ�扴d#N��Se>@�vf%�7*=)��#��+�<0sQ.w���yX�����o�!��S7����6�4�dp3�j��]x���nE!�"�K��v�"�ԥnSi�y˝��c�5�
C����Y��+ђcE�\I���Y,���C=pb2�`}e [�P�x��4�Y��4�Bm�M����}�����rQ
�&�:��mT=�WCa��BT���K:�N��NR�n(���������m�n27����������_���W�ڼ����SE�������}��1\�-u��T2���B�/
��O�����%A�:,7���1֣D��ڳd�WЇ���r@��b�Q:�<��P[ )���b:Q[t�z�,��rEs��M$�^��gĘ)f�&<�J�*���%�� fp�{Y����o������=�dZ
��A��z(R���@\9~� ��g��?����u��s����LM��%cfDL#OK����>��ME frz����K�L+%�����L#�clw���W4�n���3Ś|H{Dj�/wC� '=-Q^��\�m\ƞT�
�`�����?���&�W���x�/)c��m	�FT��|��2���up�)ХsJt��{��<����@)��e\�H�+�4��Tx�DAi�e-����^��H�N����A�כ
YmN�*m�3r}��[���-�8(��Ƃ��N�.�|�	\SM�����}U���ȟ�p.���Z!3m��Mq�ӰJE��r����BJ�<���Ղ���'{��L�`�Z!�dI>x"J�9��L��S�k���2�$e�Rx��}�K��Sx�H�2��>g^>I s�v��.�`N�œw��p�^�6Ļ~��2��X�=x;(�V����$pY�WOܹ��%UxY�"�H*����,5��[�2U��K�qR�#kl{���7�T�����n�FP���ʇ�a.�䍹��F�'�%�=g�#�X_Ɍ�85��.kXjX*�S4N�u,;ϛ�P��>�> 
#���
H��BQ2����	���"錓��|S��0��m�쁟�Q<�	��P�\*�=��<���!���J��U��\���"q�jZ���'EZ��`E㮏j��>�r1�/�p�)w�w.&�YW��
���p}/��̹8���,7�r5E@S���U�����S8'.=p�Z��W���h��/��$$��Hk��)`���%q��1�FL2#��m�-�hy/Q���l�*��'��奯�&|j�ƕ�r�{N��X)[�E8*�1WU�qg~pi���g���k0�0sL�Y�\���V�����+X��|��uS�­Ed��d�5M7��b�,ηpݻto����ov��>Esfܻc�w�.yU!�I�W蘻/]�k"�\�[�y
#�Q�P#Z"���Yׄ'}o��Q�����6BXm�eo^eoF ������gHU\����s�=�]�Ef�DU_�vh����#s�k�M�o�̰D���=P{�h|��(�htZ ��N<O���W{B���ُ�0 ��@�����Qs9�!��HѸ�H�x��\�	N�f��FdZ+�:�NH	�����ã��"{P�Q�"�4I�|ӻ�ʑ[|�S-*��bSKg��o5�g4-�#�zP*�]�� ���E=���y���AIu�bS0d�Y�n�YT$���ND�c�L/EU3h�FR��*�/�0    ��	O�)V"���(/m�N�$�������z��AGȃ���� ��+\��,�bF%,E�(\h��B�
�t�+df�F�k��<-w���%�Y�y�j��e�Q\��?4Ȏ��r���I�a�o��=�v�Ͻ�5X�[��g��a�����X7������GLM�ù����I73�k��'�/Ml��x2���x��bO˧"�(V����ƍ���>��[@�@���m_=4�q5�h�^�;zŞǵ�7�I<_;�<J�|�+��`+aJ��mclg��s��@�C)")x�R󼍎��ë��{}g�е�q���6@9�M޼�ފ6���ó�Zur���bDEN�`�����t���Sx]��fߪ���
��a(��m�Ѳ���)�ph��+Iv"q��o��=���}�8�{-ʋH_gn�q
����W)��P���<�ʑL��y�P6��QdC�T�$���,GV)pF{*K�0�^���l*�t�BR�ڈ�><�YK'n5��, ��@�p���Na���G^/r�L,�ؽzB�+�����HXʳx��_��Gen��{\n>�G�#zR�*���E6��IK,&V������������R�h�T�̜=�G�G\X�9{~���|�ɳи1m�F"`�,,g�)��I�EXR��̤S(���Q���?�bj�K��}���8`�.01,�ǽ,�'�g�#�$B��[^���J4Ҳ��R��-<J
]wu���#h�r���+�}��۩A�+���#b<X.�I�,�Ik��?��[ܼ���cGaKs�,������Gn�-� ����)�Z@\��P�������O�t6�#��~��Z�p�M��_}�]�P��];��z	��x�O ��X\nt\���s|)`!�Z�7�"mȃokU��K�e�'[���Յ��21�u���l�J��-�0@@�S���':���~D�H2�X�=�Tݩx�y_�!!=�*P��*AGGx�5RwQ���|��P?�>��P��"ُ�d����$�Qn:��B�Rs�܇�)3�C�?�'l�x^n>�;qʺ9����TN���C�ΓxV�#�==jJ�ػ��BO�Q�(A��|fM7��=4@vO9:w����Q�y�oڦ_��X.�F�M�[��͌ cC?�g-�Mh�s
%s��,�����1	
ɡMzkd�L4�R����B�FW'UH��;Y��㶕�P�>��2�nW���TDNC�{�1�0_�pO���}��27��
��,�p�?��Q8.����m5��d���=�'j�Q�Q��A}������M-\�����v\��
H)`�X��̯҅���ٳ�_"����ĵp����9M�#ЁǙ�`�I�Rq�]�y�OU<ֆ ����0OK��>�6�وg�}sz��\jwx|��=!��m~E�,CM.�~0y�\�^~�SY#��ǟX�E���d�
��}���[�>�2,�Z+�ܧF (�Xd����uX%
Ǟ�>��t5lCs<��h^+d��+�l�(��W{ޘW�PN����Sy+���Zs
��w�4 (��r�^�
s��q~冻��3�r�X���D0E: ��3�\��wH�F�8$
T�{����r>eS7:򬽧˳�O��}bm'�g;��h�N��\�`2ثW�i�70�V�27��O)Xn>6<�4ʓɌ����� ��nG2֠�s� ߳O�+Wc||�U�"~�K��d��f����˞���	��B�����o�'����b��-0aZ���s=NRK�[Զ�0�N��<��9x'�Fw�s�i��ٴg"��?C��]�[x�#����uá�1�l@�J�ꩰ�����?-T�����I��'g(^:�����w���)Vn����Xr%��é_�����߻����n&M�O�ܿ?���X5���#��c��	o8�D��\(k�a��V�e���P,C�д�m�[�b"ж얝�Y&�v���X���x�%P��i�lbÑ50�;��F����4���/d�����w�@&Vb��g�iRj�7-���&��Z��)<��Y�ea��E�cߠ�V�G�[����c\�������F���'|��J]�x�h�q��1`OzZʧ���t@ӕ�� �.ƣ:�=��=�m�
���aZT�7���m�n̍Lp��*'����ܐ��A`�f3����5�ů�3h������Y"8��q�4n#8(�a������a�W��}��عÜ�E�����\=������8�N�8���egt�'-1��]�?�ϮӬԈ5���nP���$I~p�6��*ؒ���jMc�nɧo�˥nFvL��Y�,�o�#P��q�yw�Y�G{��d0z(�]œ�"��ᾏ5f�y^a�{��b 7�c=�U��Y,#��l#���m9���̰)�\�Y\��:j�x-��h�Ѭ���m��]/0�jaq-�M]=@��rf�d����g����ƣ��J�~�������54���V=�0�>��ή.����3u��c�,"!L � ���Hd?8Q��@��e��4�k����AɃ��V��S��ӌ5l�e'���"�X`+�u�W,��]�*ҧt�n9Kc����֞��7��m�y��m\�J�e�aצ%qVP�C0�����":�bƆ� )c�w�XS(>}�R�&�O�_��F��g\%�5�4� ٦��5�=�*%m��C�5i�l�����i��:�H|%�RU�����x��eilN'�[���`�ԓː6`��3�Φ��SV��)�GzGXlx�L��t�8?�Φa�� �bm̻f�xO�;�!܏T0'���Cΐ��5�ǆǱ�s�q����e\���Z����G�A�=�'u(�ķb<^f�Bn)�;S,�~�U�(��tM��5�Q�� Ĉ=*�a��}�LJčB��J齷�=+���i�ܻ.���
���P�0��;hT�E��4��{���8�\7�A�4#�K�Ӹ
q ��
UN�؊��@�^"�kA\Oݸt�!�`��F^av��e�#ݖGĻ���\U#�t�Y�+��@�Ȁ���,n����5���������Z�<&�������̒*���fq��!�Ce沥�5�SeUxǨF�#9�}�7�1W�ՠ(X������ؔ��f�`n!L ���Z=J,�'���8�Z�� %bˢs�T��'�&,�LW隐>���!\�ASE�������м���xs�ɫD����̚L��t�R�}��SU=��Y`9>P|�%n���w�Ɍ�@>�w-��\6�;āXX�Z�#`/4��g!�-���Q�����ZY����O��i���#��TU����+V��}���QC�9�YrC�]�Q���F��Gѹ4��e��\`�Bh�xX�M�O��h�9,�$C�z�>q��d�i��.�l-�T�̼�u˅yhte�Cs
�)W��Ϥ�7�=��>��1q��ĥ���;o�#�t�q'��k��,��25͵3|���&�ǥӰv��e�%oҙJ_�~���Ia+�<���Լ�j��/�`O}xdͳ2� ����'.�H�H6Y<���=���=T���>U�+jo�
�ar���z�����p����lF2����ѩk��P���&�2���<��:v���	���{�m$�0�����)�ꪏ��6�Ӹ�34<��`NH���>V8q(�ϫ.XeB�X0�쨖�G�U�^��q�Hv{X!��}_~�3�m��K�(���j��,��j�4<��Q�Z(�i���T=r�lfT�D��� �UO㛬mGȣ�\�E�^��q$5�P~lXS2<��iZ�].�k��=�I��B�;�!g���d٧2˙D��ٯ#�<���_�q��WN�:83���{L�B�)5��*���w�ˆ�M���&�2�� ,�O�}>�Oö<�V�f�h[�[�D��'.Ӕ����h]֏���#���X
1A=���g /�Xd �  �>4��״����~x���yO(��S�O+��t�5OT�iwIC�����������`[���,n�<�0f^Ӓm-��Q�1��N�2����Krͷ=ǟß˥LI6����{���_ڂL�h�F=���6v�
��Ϙ�P餟_��H����>װz�6�@�ºJ�(OH�y3��n%�I`�����B����y0��`eq�T���P]\�J��d��ꇡ���vǑ����n�
t����8��*��Dܒ7zͱ������><uQ�����%Q�T���G�,�� B��;�@}��I}A+��[��e_�@�3u)��M�h-��<+5�����&�?�
N]P<�,ŏ/�z�՞��%_�xB��+�Y�F�����Nj�+��ȁ,d�x�׏P	�������O��&�������+%���W0QG��j�4�L�8��y�PX��~o+`T����Zɺ���u��d��F_ч��)�M���^a߃]��������L\�)�Ɠp��B����gޏ�/��C��2Z� �(X&�0 �5�r7�¶-���U�O�E�C��o-�nY���2z���^0�X��I�"�@4������VM�A6�f���,ާ}����m�\���� �Eլi.W�,�8��R��1kgw6tj�p&���}�Ï5�J�o f�jXf>�Ǉ1�XR�ܜ��?Y�{X}�Տd�����3i�^�|��b9����ӟ��� 3o�.      i   �   x�}��!@�L4�d����xS���:l�ń�B�Wޛ�d(l�������5�Z��qҋ�O'�x��`�9�#���2�V��|G@��y�海H��J"�!0 ��@gY$.�Esb�C`B�-��랤���7�\ |z�O�      6   �  x�ݔMn�0���S��ȡh��%R�@
���fl12Zti��ܨ�^�[_�#%n!��*	��? A�|���!(@)�Hq,��T��F��醛�T��u�l�4�aE~vM��\��v��*-ê�غ٥��\C��U55m�郋?n+P��g��`N1�H����U�&��j*mt������KD��F���zRdz�W��y��H�2^��e�7�	�*v�=��Um���ex"q�P�!
-2Ч�bea�v?����ȳ�H����Y������ֳP°S��X��X�h=���I��p���9��ԁ�	�n�_>$��¸>�`��^ L���䗖[�3����!��`6�	5�����P���0pC����0v�_�oC+�.Y��9��S���<p$5�&J5Km<Ձ�C܏��k3�      8   �  x�}[ѕ��n����%���	�6�8Zc�.��RB*dڞ���L�D��?�?��7�{H��Dr������>�����'AY�,>�R�!�P�p~�C���P��/�'��KC��P痔!�Bz�
f���$�o
�'������	u~M��_�Ǒ���|K�����o�A>�P����2���\���R��	�B�0�P\E�U�����)���\��c*Ρ�$�R3�`KAa75�6�@5��/�%�n��i@���0�
���<��<�a�8 W��Џ�M��̑B���+��Џ$�2{�%1�#��� W����BW/41�#�� W��|Q`�9�z;�P��ӭ��}��>bok�����ŷ��c�i����OG�o��&�������gį�!���u>|�|�|���<�5���'�����o�z����G,�� :@Q*�A�;�OG,`x��yXp"N�� �|��'@&�=T!\H�Ŵ\L�)c��R(pB~������@`#���@`d�>��C|7��\�x�� \�x����p@.P��:~H?Gf��M�*֟%���O��9��/���zK�:��������@�	u��u����, ElX�-�~a  0��?r��r�����}�\�߆	����d����P�o+��bP��\���+�(�-����-��S0 ?�����u�������հ@[|}iq��
�����EX��@�De����`h�N�(��,P�@�>Pl$]Fl��L�4���]����S�U!�D��*�V��`@.��'nQ�%��(X�,�d ��rIG7%�P����K��X�>�5�v�C�Cu@�`]!#�Su@�ЂJ6x����������2
�l؏r��	��2�Ā\��EA��5 ()C8�N�����^�+lw\�:>���r���	��~��Q�h	H �N��-d�A^�@`{2|C.`��vO��\`?M�(%(pB]�� .��@���{Pg�>گQ&P��\ ��~�>�����\ ��~���\ ��0�%Y2��\ �؅u	l$��(�����`n@�B�J�=8!��;�%J������Q�FV<������7����q6 N�
���FV�]�Յ��Zqꬁ'AΣy��+�H��N��@���p�'֌���'֌���'ւ���~)��~��9���b�G��ܣ��(���E�^���P�?i���������n��#�ͯW�/�/�/�b~�|���ǐG����N!����d���$�/C�~�ڢ�I����ok}��V	��q��% ,�$ `�� ���h%�A�K�����zȃ
旹>t�G�
�Y�6l�o���@�(�[8!�Wd"�xAj�h���GH�Y@�NH�9����\?�`��׹>E���壨~��g�9ȰOHm�$�E5l�R�>J�Q�I� ����=
vp���R�>H�Q�������D�&� ���8 ��3`h��m��(\^S �1e\�<k��o_�!����U���4G.,�He�#'b��G>\���Ǔ��$�:�'1�I�]������_���ߐ���5hK�r�$����m�5į�O��5e�7��r�%�|�����7����5����ܿp�9�>\@�ϘO�O�_0�q���X?a�>���$c~^|�_)8���7x~_���_��q���o8{����^�U8=�|N��8�3{~�������5	,�v��\�����; �������[R�?<����W=R�t�|RR�
�w�s���2��\ {@s��r�%$Pp�,���&�x���	�����#�.�m�����X�"*�.R(P�@]|}-�Ga�u���� ��7�=��	�0�����	f?�NWLg�:���a�F���+H�k�v�%�����A�
^���	��^���y�ǭ��:
��׉8[6>r~�û��{����g3����]���r~྆��������y@���1|}��{����|�>�O�9��z�Y}��3|y���_��|�>ó���	�/x�en?�=�<�&OM��SJ�C�;#      9   �  x���Kn�0�5y
]�g��;!I� Ic�(P8�0�����S�b���k����5��P��~�� r�
a0CL��Bj��)s*�������!�˓����]�x�5��Ш8S0S6�, p���Q��I�f�_n��.�(���nU���b'�aM�}�m"'u|�UUl�er������r�,��*�X-�±:�:��fZϟv�ڗ°6[�&rҊ��z-xTp�� ��Bg�SI&]c`���9����5��i��o��ɏPC�t��؋�uN#'�5��v��x�M���Vb�N��E'��n�bP:���Cu����/��َ�]3��Sk����}��,���X<km'W�nn��E,�E<Ց���$Х��NF ���Y��uY�v�ʧ6sc�J8컼���}T�O�T��l�'# ���X��oY�X;f] J5�ۍ@�xr�Ѻ�َ�]ӻ�;Q��*s7�}�B;���t#>�O��;��`�I�m�
�������>�Ɖ皡��:�+G$�Z��H�c�v�%�%&"��<>x�p���T4�DC�0<o��@�����|]6c�LgCbA|W#�'��*QMh1����ͯ�p��~ �$#���鶮A����:�.��1J�Krux���i�o���L�u5      ;   +  x�}�ۑ�0��g\�.�/�l�u�X�r<����"V�ƅ� :��2��T���(u�hӤhiP_��h�PG�µ�1�/������0Z�70|�H~�ķ���2�WZ.~}��d=��$����ߒm����Tv�)<E��mbGj,q���� ���Z��D�Іu$�n��G���/��䚭�o�L��0�à�����4V��H��H>��y$قk�<R?5��4vҩmR�s{���6N����i`ː�5*N����[�*Zұ�נns�X"x�H��ON)���;V      <   w	  x���m���S��L�����@��(��"/l$Q ��3��@ΐ��$)VqF�=��h7k@k��<�*�,��́��w��0""b��zD:BYJ+���I�x���� �5]�R�@�"�ND���4��A5�%	��Аj� ���J�Lj1�bT\ȩRM~P&	��  hX�ܰ��R	�������P�+F�U]�*��$h�$ϙ��OR	Ԛ���\KUMHG� �X~���,�'�`�r�^}+�$��2��ϫy�d
�ӡID�JD_Ũ�1J/��V^�+�!)	F��� �%bHF*~�ܮr�t� 4��}Ԑ��Ȓ^Չ�Q��O����+��Z��rJ=���)Ԫ��r-~����x(��'IM�5|���;#�p�p�xD^0���\R�cS�Gt!CR{ST�GVp!&�:�@!<ْ1��Մ
����<ȐH�L��<�.CR���F%:�>>��J �.�-��bu&���rx�ڗ�a��F"u,���՟�i2��ԪT���	��Q�ԪԂ���^�S�ԩ,�X�='���c�W�{�������U�����%������+k��}#�Z�Ū ^]�1�ձ����k��3��Y9���36[���d���3	��۹��}H�F��|N�NH�/��B<�����	��qb�[CJjτ��O$ؽ%]����-��줬��9�(?Oe�f3�ޟ_�^�-;)��r�I9��T�z#���A�IY��ľ`���+R�ے��!��v$��`)�Zq�J�\���m���%	�Z9?��2�c¥��ն���J�������±�SK#���y�[�`�1�?��|ONR?��<�#���(�(�ƒ���)&�R�KH��H �(7�єR?�x��H��q���8���=�z��pi�@2���,�uS��J��A�(wފ6�V�~����9#Î��9[��Wtd9n��;g�0�[7�g�b��C�}*���d�oe�������O���������������9�r�;�r�K;��FN���P��/?����H�<"o�����)&�9�b�,�����K�
��Tt��|J[�T {@����O���Ǒt����M�b�~	�<H'<�.ʤ�˱�3*.4�.I�b_���̇_!���B�U�􊟞IEE��|VE�en��[mHE�z�_-��x����lHUW|��w�x��o�i!�����2Kr�T]W���}4�o�0z�Ili�j���ϧ�8�?�?�&U�HUhm��۬�l$������k�n�Tu5XNt~�F݌%�{������4i��zlԿ��u�i~v&U]��Z_���o����
�z1�r4J}�G����!Kݔ��μ�Aߵb��x�^[��6��A�Z��(�5�h���l��r �'�ʶ��s6iY	B��Y�]5H��)����.���Nϒ�{G�	���,�l����7|���1�K�i�('�����7�����c��L�j�irx������jA9TU����R�k���	�����ҙn���h^/��Q绵B7��.hH���6H��$${"�;ëO��<��Hh��g�ăd�Ad�i>si�E�T�hO�䗐�'q�cjF��҉��]�cJ#&{8��T<�sg��t��HW��B�'R~.��H�$�'������S	N�X1��w��ﺭΟ��Pn��_<7Oǧ����<FCֶKy"�x�
�`tV}�hU�Y���ټf�Y^E��n���`�\X���l�沬C�G��V('�QW('��8�`b�f�9A���؃\�h0��N�g	��2��5_��|���Y{+�9�����-"��0�j�ws����#Z"�����U�f���J�RN�чE�T�X��tS��{���y���b�P�⺡b�I�bזP�]���t�uU��/�Q1ZU�3�mC^%����$۪Ox���O���O�Ks?Օ1��t�kR-< lCj�����E~;	��(���K�kg'���rc���t��.9��^� �N��P�+x�!���L��e��pQܝ��ȭ�ѣ�u�S6����ɡ`r)&������e�v�T{��]�u�0S��C��e/���\;���9�KgJ�z&%�y p���ѐ��;��:e��ːΔ~��yF�@�mЩ.^���xU���L��j�KgJ�'��c��:s�q���؋9�J������^:S�yۙ�o���.�o�����%�횾��^�_�>l��fh�)yC�}�X�]
��`3K�r(�SN��:f�������&�8��cI�Bϥ���8�pq)<V��9����Qj�8���҉Rb��f��"ќr��^��v{�f(�\S
����P '���F�yF7S�/^���o[      >   M  x����n#�������A�ſ}k˲V�d9rۻ�s82���&H!�����d���]�3^� s�����UŢ4�v�����OX��X��F^�n�\�$*��۝���{�Qb�a��
l-��Q�$)���:���}S�9��zV2v�^홦) iI�{e�������� B�W��@����A��ʰ�c��]�"�4��=KW��J�����"�n�/P�sSù�
8{ض4��H_��֫��R�$F$��>n�R���MȞ�'�iϒ�]��'v	���JR��
ۖ9��؞c+��{ڞ����DԖ��$�.���yl�����q>��w�'i��۝��ñ�#8I'8;��_��Ί(%0�W-�s#J	&��n�ݷ���"QJ8d�_���	2�iFEu�!$;��kC��$%�b���#@��~��"�L�Ȱ��e���쟟���嗿�O0����Z�\n`�K��07��h�8��'J���jQ2���0����ƹg+�	 qI��Y�h� ib�KCV�^a�r�ƷТ�CEELY���S�H.���1+߳���pf>ge˗�m"��D;�����H)bnq��w �+L�l���*��q���Z�Z:̐��"���}b"����|��U ©A�3_83��6��q���6�j"<�ԁ���p��!��W ��S�M��H�A��򒖸��Mt�ԘF7��:u��V��.�l��������o"�J��}�/�#J�J�������W�I����m��iV��q*W������I�i�j��z1�&%�4,���x�C3	dg���}]-i�@� ,�w�%�$��v�b�_7�.�L�y�X��&2�Q�h�Y��D�����=��Oq�:�Q���t��ԑle8Q��'�Uʱ_�ƶkZOIj�FWs�ǙkƋ�
�^��a��BN���k�+������qQ�oYoT
�_�|���_������Vs���q�PW�w�G�. ͂�U�:$a�,a�<nW��;����X��+�%h���0�g�k?�8��
x��Rn��C������Ks�؜|�lV����}>l�Շv��q�Vnja��cQ�"�A���tjV��S�?��>�a��nÇ~��ۏ#o2�"?IM>H����]�ds�6G����]s�Ȑd/��D�����S�W��m����K����e�m���i,̘{���%I��@�5q9���.1��[��6X���Xs�y:M�|��izl��,L1O!J��9�G9\YŞC��A}u.��D��jc�[m��^�U���D���g��r.�>Mvm��Z��I;�j<��W��ҏD���%n&w�6�2��c���?mj4�H�����P#n4���5����@��7?3��dQ���Ѵ~�q���R�&��>��|�p	6�����ٜ�-99�&�9ɓ$N4[9я����k	�4�N��{	��4TNu�-�1�=I��:�=h��9b�x�L|*���m�O7~@.Kq�q��O��B~::TI�ݫ8g���{U��oX�v�SR�+xD�(�4�	��4�Eda�eh�I,ٱ0�D�I
��]DO��D{�&R,Q��oB�t$����Y����R��$**����B��JR���GV!�ocy� "K�D{+��ç����Bu׽�����ϧ�b\�l�q5�0�D��h�J��Q�?d"G3~���03��<L���~����$�����a7�$���x�I0,�4Ӄe!f���|���sQ��>퇦��4`i�`!7��i���H��u'�o�|�OI&Z�0�B�L$� s�H:hQ`�`t־	�:�d/0mea�Ŭ�Ǝ�OȢ�q +��(��a�x�ړ�@��}&���x�,�f�IW�e/�&;����B���4��ԁ�����E��hߢ�A1�>^D!J������V����ڟ�����9�K(�@����je�:O�\���8���`Ҡ(��熡�,�<ܹ�aj�-uWp��"�[:<��ƚi�����
�YdH�c�]��{H]@�U		�n������]���9:H)%�k>\}�*�A�kQ��_+~�TU�?T��Q      @   o  x�ՕKn�0���)x3ç�S�1�4��l� ��
E���(�C�T�XG��r̤]������?cE�T-�DQ�����uu}�^����+���Z��������t�A��p�8!��G����x��}����x�tD��2�;��#}H�03�#ހI:2��Hg�w�~�rd�f^��g���i!�ˋ���b��8:c^�i�N�I�tD��՝³RP����I��x-6���hB(�"�hs�o�vK���C�bV��MO�q9c���~9<8��A"|$����[�)����Lg�utz��.B��t.!pP���n������y!�q��D�����mo����s��	;lٺe�b4��*hJÝ"o[8j1;)>^��y���biȡ?K�Sy��ئ���Zh�mbLjb����"jK>`'���&������ ��<���*�a��J6ZRƄ���q�\����l; �6�'���~>�����]=�b�xe�I�^*@7:D���/�7E�/���*G�C%�y������7nk���N�[�#��N�&:

)O��ފ��5��s�H��_��6�3I)c�_�u)oRz��S+�埱W.�}��N9���_�,�� b%Hp      B   '  x���AN�0EדS�i�-Mw�b�T��R4J�b��X�S���,\7�E"��T�������6�598X��/�q�"EV�i^m��fQ�D����W��Wj	��
�_����[�j	[�GҒ�X��#���j���P#1�i;��5��uF�*��G����4�km��]( LO�X�B]{��_�Vz�"3���Wh*�-��s��h�;x!�+��� ;�;0�T��N�a�)':a'u����<I���⻏�ݍ�y`g�zJ�'dv�O����oe��%I��$�      D   �   x����N�0�g�)����s�TĎ�X�8���8M����i��z�#���ty�]d@΂=c�@8M�O�,��2�mȇq^|�*%��ɩ�i�gy��{[.e��RSȼ��q�	(�\k�T�M����/��1�y��M��.�(�q�������������m�6M!���L��&��1��4-�7F�&j�5�^�k`��*Qh���a���B����B��R��f�L      F   �   x�}�K� ���)z3@K��		��u�<������^�?_�Ar�a$	9"'jd�t��t\�?��t�c
�{�q�Rq����!��k'�����P�qjC�ˮL�[}h�h|�\�}6Jh{�ٌ�����O�&�:�� {�X hY�]c�r*��[��?|[J�N�i[%�ֿF� ��3`/      H     x����J�@�u�S�d�{��� 
.t��Q�-���	���)��p?�I�v��o����j*R�5bM$T�l�f��je~�h�^����Н���x��8�����g�Zq�J���&���Rd�N���5��t���"�#�:~qC7��Sd���ҹ����l�6ґ[�摅p���F5�1T�^�����
%���e� q���(p�����}|j��}{�6�5JI*�R��H��J����Z�#�oZ��<�yx� ��%�      J   R   x�3�(�OK-�<�9O���%�8�(� ��4202�54�52R0��26�21�346�50�#�e�l�5L4F6ј&��qqq P�?�      L   �  x����rܸ���S���|i���׎\�z��]��\Zd.���J8O}���m�|�t7ЧмHU�
`w����g������N���rV�_��ʲ�mZ�Z�_oW������0��K�U"�g8x�D��\�U[�5m��NA�7b�
�w��_s��{�w����K�������$j���QJ+�Q����%UF�ȵ��}�"�nZ�[�CW���-���*�g�(����V�ŕ=4�,?9�����
����x�]�?7�[�^8�^��b���[y˱�P
��E��^,6�<�C�;1�����Ģ���<+��;���Al�9E�G���;��J~,
���A�q�F!q�ZB�"���V~(r���������{L���-8\?B��Y���|���(��҂�)��AWc���Xˆ��q���QG-̈́#���A��Nc�u�6�2�J�$54�u`b-B҃']��b�2�֠��a� ��ϙ	��]}�]�c$9���ʏ�D"]���Sc��dWWm�R������gHB�a�p2��ӀʷA".b~JI�U0�	bԚ� l���,�6\8Ӏ�ؐʁ�l���x<��U��p�?�dN�^9-%qE��V�u�[�n/v>�M?�J�����fGڀ\�9�`~ٶ��r��2t����
�flb�4����D
ɾi}��ܕp����)�CkĤ�R�*1���=��������"`����"J�@�nq��u%ƕn��)'���(n�Ϟ�G��٧���}�
zC�[�Q7�}�ğU6�*��wPX2urV�ĠPV�B�H�($�D
�#���ţ����g1���	3vE�X�Pܠ�>i�/"YE�0�N�c� ;�����'�����v��+R|r��� ����`l�L~<l#pw��,��A��'X�Q1�s�k��[�0Â��o�m=[�B%�H��s� C	n�e�����`�H~h� r�7��+���2�NA'qߑ���o�?g;���NN[�L[�d�!#qF�������ĵZ��(I�v�-n�l]J<�w���ε�("~g�I�U�[�[hAe8N � ��� r�2,N�x?a�6����_�O+#����'�j��E���1�IN��>�ɷBB������b֚�֜&�b�{����W�2r�6T
'�� ��翘���`�H�t��t�rVx���	��=������Z),b�0r؏��4(��PU�&^�	�p9�g=���Q_�pN�jG>������b������y����K�:9j9<�2���xit��{��;�#?jo��V���Ëya�sg
����X�9^ӈi�a�͍�J�Qa���m��O�u|V�Y��aь��,^�w|5ҧ��D�"�5	S}�ݤ�61؏6��ZG'�
���.v$G�u����Z����j�Eܷ��+~탒�L ����u>ʹ��x��y�Zh9�����T�<c���i�	"������x9i�;� 1�j��5Ͼ�L��;�hRѱ¤;��+(�P���@�	o#�d�n��u��^��_�Ӆ?�N4&��0��A)g������-a�ʁ��]�$��:M��(n�=�|�2��бW0�A�U�V�	�#�v�Ɏ�rI�g���Ȉ���bϿf��6�+o�s����R7���r�:U���6��ɗ�E��AW��I���r���+����u��5�F�	�V��Z0Dy�㊽��l�p������lge2^F7���ɜ�x�ao,��a��;Lp��r��oTF��ǲ�����`y�f���������GT|X�7nC�d%x�
�r��3(��,"jxŻ�G�rE�{���ΰw �a� h�"+L�|�(��ed��{��8hZ]|�N;?%4}ſ��s��0���vbg]+�T��H�*��JQP�$؂�a��G��y�����3w�?�����˗���m�      M   �   x�����0�s�\<B�Px/c�F�Q���H�z��M��o~�{Ȟ71��k�ژJ����6z����������}�����Pha�8%�g���'y��(��|*��+��M�\��%ï��#�aI���z!�ܚiw[�b>qxʁ�k��z���      O   �   x�}�;n�0@����	~D��12w	�ҡ�*AL�
h��ãd��>�?����1�MHxd���Bت�d� ���i����HB�9�{s���I$!(9R��5d?�NB`9�7I���������3�$�9��o�Qh`���*�ո@���U��eg��˦r@�r���-����M�D��T�j#�߼\P�?���F����x�������/Yg��      Q   *  x���1N�0����@��M�` �H�(ˋc�F�S�)l���!�+���ҧ��}r*����,}u���L�H�H���|���3��e�n���R�0�o��?a�k���.����G0g�[f���:uc�0��,y��\!mK��-B�@@� ͋�ԭGY��L?.�.�;}B8��ঋ�\hAqaj�j0Lv�ؚƹS�Q���X�9�Т�z ��y��x7:~0�y����8p�"�tɅV&x�@r�Up� ��B..�h��#=�r���!�Zc���櫢�Z!��Q�ç^t      R   �   x��ҽ� F�O����d��o��C��q�"�����H#��G�0#f��\7�-|rͥ~N�k�j+�'4[X�zB�b%���La��b����zX�y��;%
$,԰�a����x��I��=)W�� xN �I���      S   �   x���;!��V� �1�����چ�-H�Aĝ�7f����?�P]���<�Y��[��<�:(B�h��}��a����H�V�4�Qb^�c�j�c*2��=��,�nO��d�,� 0F7��;��߫�:��O@9      U   �   x���K
�0��ur�\ aIh��4`)��ܕ.�Q���<���P�Uw��7(]�(m�*�����֖��"5�&R"�h� Uܟ$i�h�G���خ�tlv�&'��UҀ��*��6���t�N,r�?�:/����`��������$�FJ��ZX�      W   i   x�3��=�2%39_!3�$�(/��$��%�8�(� 9���<N##C]CC]##K+c3+c=sK]S<R\F��%�7���S�8cΐ��<�y
�S��=... a�D�      Y      x������ � �      [   U   x�3�t��IM�L,)-JT0�tI-N.�,H�<�9�����P��P��H��������X���H������F�0��Hcj���� >�      ]   N   x�3��K,)-J��tI-N.�,H�<�9�����P��P��H��������X���H�����WiQfJfr"5L�����  �&r      _   �   x���;�0D��)|�D��HS�AH�4+{AF��G�RT!�t4T����}@�l���[_�P���P��]W�]]��)D�a
z��������(�O�'Wp����j��.#n��%��E��m���at�%��\]��h��<��,�����1���*      a   b   x�3��=�2%39��%�8�(� 9���<N##C]CC]##K+c3+c=3S]S<R\F����E�%�E���0Ϙ�1%73/���(�$��*n����� g�=�      c   �   x�}ѽNC1�9~��0��'ί7$$�Ɔ�]����\��������$D ���0�9J��(��RׯK�Q�nR-k�O�?�4���}E3<Zu�Qw{����m@%|��V��m;��s�y�0��m<�p:޺6V�݈��R��\���7����]�\չ�L	/��`���+���E���u<��K���}��蕉��SU      e     x���ˍ�0@�5T���M�2��1f��m�X ݜbF��hc.�Cj���nhO��:͕��#-�Z�ki�e}-�k�e�e���VC4��{;�$�7�:��tP�%�8�� �t���I�P�L�B�)����WA�K��^�3%�e
v`�'��������:�t������C�6�cJ�/�B=�s�NoI��R!�|� �/���~��~*��d�W�))����~�0�~�ϔ�3;�V��|�4%��w!湵�t�����u�v>��      f   T  x���͎�0��� �g�ا�з��\�f�JB����O_CRKZ��J����0?y�	�^�pE��uQ�uY��:0@R�=7�ɯV�����ܬNo?��b�;lϫ��P�~6�Sx�7�tܲo%B
�"&�y2^� �R��q��������K]���f�3Q�<��e�T�4E�\�bz
-M�=E-M�z�^��z�Y������X�.��N"���`*1E�H�IyeEFp��%�-fx$Jw�W9�G+P��A�YQ�������;�f3-k&�^O2���Qđ��<�i)����,��y��I&Gե9�.��r���5�M��Q�X[(T#�$�h�&��w��_Ѵ�6��L��S�0☱�岎��*�����	@[���1cqtl�]�)s���"�}�F��>��A�*�i��o.���*�	D��5�8A&s=�ji�RJ�|$ }|+%�Ƒkq�O{��.�,�Z��B����!�`�3ţ��fḉK'�E�zZo�-Ć��+��E�
*��	+�G���Q9tˇ(��'-c�����O�%q�y�Bj��9�3�\A:��v�)��� �&�����)v�K��LH�aӈ����8��     