
CREATE TABLE public.Truck (
                Tru_id VARCHAR NOT NULL,
                Tru_available BOOLEAN DEFAULT True NOT NULL,
                CONSTRAINT truck_pk PRIMARY KEY (Tru_id)
);
COMMENT ON COLUMN public.Truck.Tru_id IS 'Unique identifier (for instance : AC-543-AG).';
COMMENT ON COLUMN public.Truck.Tru_available IS 'True if can make deliveries. False if in maintenance (temporally unavailable) or written off (definitely unavailable, for example car accident, end of life). Warning ! This attribute does NOT track if a truck is unavailble because it is on the road !';


CREATE SEQUENCE public.driver_dri_id_seq_1;

CREATE TABLE public.Driver (
                Dri_id INTEGER NOT NULL DEFAULT nextval('public.driver_dri_id_seq_1'),
                Dri_firstName VARCHAR,
                Dri_lastName VARCHAR NOT NULL,
                Dri_available BOOLEAN DEFAULT True NOT NULL,
                Tru_id VARCHAR NOT NULL,
                CONSTRAINT driver_pk PRIMARY KEY (Dri_id)
);
COMMENT ON TABLE public.Driver IS 'A driver who is working in our society or has worked in our society by the past';
COMMENT ON COLUMN public.Driver.Dri_available IS 'True if the driver is availbale and can make deliveries. False if the driver is fired, has resigned, is sick, etc.';
COMMENT ON COLUMN public.Driver.Tru_id IS 'Unique identifier (for instance : AC-543-AG).';


ALTER SEQUENCE public.driver_dri_id_seq_1 OWNED BY public.Driver.Dri_id;

CREATE SEQUENCE public.postaladdress_add_id_seq_2;

CREATE TABLE public.PostalAddress (
                Add_id INTEGER NOT NULL DEFAULT nextval('public.postaladdress_add_id_seq_2'),
                Add_number VARCHAR,
                Add_name VARCHAR NOT NULL,
                Add_city VARCHAR NOT NULL,
                CONSTRAINT postaladdress_pk PRIMARY KEY (Add_id)
);
COMMENT ON COLUMN public.PostalAddress.Add_number IS 'Number in the street (NULL if irrelevant).';
COMMENT ON COLUMN public.PostalAddress.Add_name IS 'Name of the street if relevant or name of the place';
COMMENT ON COLUMN public.PostalAddress.Add_city IS 'City';


ALTER SEQUENCE public.postaladdress_add_id_seq_2 OWNED BY public.PostalAddress.Add_id;

CREATE SEQUENCE public.loadingpoint_lpt_id_seq_1;

CREATE TABLE public.LoadingPoint (
                Lpt_id INTEGER NOT NULL DEFAULT nextval('public.loadingpoint_lpt_id_seq_1'),
                Add_id INTEGER NOT NULL,
                CONSTRAINT loadingpoint_pk PRIMARY KEY (Lpt_id)
);
COMMENT ON TABLE public.LoadingPoint IS 'A place were trucks can be loaded.';


ALTER SEQUENCE public.loadingpoint_lpt_id_seq_1 OWNED BY public.LoadingPoint.Lpt_id;

CREATE SEQUENCE public.mission_mis_id_seq;

CREATE TABLE public.Mission (
                Mis_id INTEGER NOT NULL DEFAULT nextval('public.mission_mis_id_seq'),
                Lpt_id INTEGER NOT NULL,
                Tru_id VARCHAR NOT NULL,
                Mis_loadingDate TIMESTAMP NOT NULL,
                Dri_id INTEGER NOT NULL,
                CONSTRAINT mission_pk PRIMARY KEY (Mis_id)
);
COMMENT ON TABLE public.Mission IS 'A sequence of targets for a driver, from a loading point ans multiple delivery points';
COMMENT ON COLUMN public.Mission.Tru_id IS 'Unique identifier (for instance : AC-543-AG).';
COMMENT ON COLUMN public.Mission.Mis_loadingDate IS 'The time of truck loading. The driver should be present at that time to the mission associated loading point.';


ALTER SEQUENCE public.mission_mis_id_seq OWNED BY public.Mission.Mis_id;

CREATE SEQUENCE public.product_pro_id_seq;

CREATE TABLE public.Product (
                Pro_id INTEGER NOT NULL DEFAULT nextval('public.product_pro_id_seq'),
                Pro_name VARCHAR NOT NULL,
                CONSTRAINT product_pk PRIMARY KEY (Pro_id)
);
COMMENT ON TABLE public.Product IS 'List of products than can be sold or were sold by the past';


ALTER SEQUENCE public.product_pro_id_seq OWNED BY public.Product.Pro_id;

CREATE SEQUENCE public.company_com_id_seq;

CREATE TABLE public.Company (
                Com_id INTEGER NOT NULL DEFAULT nextval('public.company_com_id_seq'),
                Com_name VARCHAR NOT NULL,
                Add_id INTEGER NOT NULL,
                CONSTRAINT com_pk PRIMARY KEY (Com_id)
);
COMMENT ON TABLE public.Company IS 'Every company that can take orders or have taken orders by the past.';
COMMENT ON COLUMN public.Company.Com_name IS 'The public name of the company';
COMMENT ON COLUMN public.Company.Add_id IS 'The address of the company office';


ALTER SEQUENCE public.company_com_id_seq OWNED BY public.Company.Com_id;

CREATE SEQUENCE public.warehouse_war_id_seq_1;

CREATE TABLE public.Warehouse (
                War_id INTEGER NOT NULL DEFAULT nextval('public.warehouse_war_id_seq_1'),
                Com_id INTEGER NOT NULL,
                Add_id INTEGER NOT NULL,
                CONSTRAINT warehouse_pk PRIMARY KEY (War_id)
);
COMMENT ON TABLE public.Warehouse IS 'A place for a customer where products can be delivered';


ALTER SEQUENCE public.warehouse_war_id_seq_1 OWNED BY public.Warehouse.War_id;

CREATE SEQUENCE public.bookorder_ord_id_seq;

CREATE TABLE public.BookOrder (
                Ord_id INTEGER NOT NULL DEFAULT nextval('public.bookorder_ord_id_seq'),
                Ord_date TIMESTAMP NOT NULL,
                Com_id INTEGER NOT NULL,
                CONSTRAINT bookorder_pk PRIMARY KEY (Ord_id)
);
COMMENT ON TABLE public.BookOrder IS 'List or ordered products';
COMMENT ON COLUMN public.BookOrder.Ord_date IS 'The date of order creation';


ALTER SEQUENCE public.bookorder_ord_id_seq OWNED BY public.BookOrder.Ord_id;

CREATE SEQUENCE public.ordereditem_ori_id_seq;

CREATE TABLE public.OrderedItem (
                Ori_id INTEGER NOT NULL DEFAULT nextval('public.ordereditem_ori_id_seq'),
                Ori_quantity INTEGER NOT NULL,
                Ori_deliveryDueDate TIMESTAMP NOT NULL,
                Pro_id INTEGER NOT NULL,
                Ord_id INTEGER NOT NULL,
                War_id INTEGER NOT NULL,
                CONSTRAINT ordereditem_pk PRIMARY KEY (Ori_id)
);
COMMENT ON TABLE public.OrderedItem IS 'A line in an order, associated to a product. Should be delivered in the future.';
COMMENT ON COLUMN public.OrderedItem.Ori_quantity IS 'In kilogrammes';
COMMENT ON COLUMN public.OrderedItem.Ori_deliveryDueDate IS 'The initially planned delivery date';


ALTER SEQUENCE public.ordereditem_ori_id_seq OWNED BY public.OrderedItem.Ori_id;

CREATE TABLE public.OrderedItemMission (
                Ori_id INTEGER NOT NULL,
                Mis_id INTEGER NOT NULL,
                CONSTRAINT ordereditemmission_pk PRIMARY KEY (Ori_id, Mis_id)
);
COMMENT ON TABLE public.OrderedItemMission IS 'Association table, an order item can be added in mission several times if the product was not found (ie : was missing) in the previous delivery.';


CREATE SEQUENCE public.slip_sli_id_seq;

CREATE TABLE public.Slip (
                Sli_id INTEGER NOT NULL DEFAULT nextval('public.slip_sli_id_seq'),
                Sli_deliveryDate TIMESTAMP NOT NULL,
                Sli_signed BOOLEAN NOT NULL,
                Ori_id INTEGER NOT NULL,
                CONSTRAINT slip_pk PRIMARY KEY (Sli_id)
);
COMMENT ON TABLE public.Slip IS 'Created when an order item is delivered. Should be signed.';
COMMENT ON COLUMN public.Slip.Sli_deliveryDate IS 'Effective delivery date';
COMMENT ON COLUMN public.Slip.Sli_signed IS 'True if the physical paper slip has been signed.';


ALTER SEQUENCE public.slip_sli_id_seq OWNED BY public.Slip.Sli_id;

ALTER TABLE public.Mission ADD CONSTRAINT truck_mission_fk
FOREIGN KEY (Tru_id)
REFERENCES public.Truck (Tru_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Driver ADD CONSTRAINT truck_driver_fk
FOREIGN KEY (Tru_id)
REFERENCES public.Truck (Tru_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Mission ADD CONSTRAINT driver_mission_fk
FOREIGN KEY (Dri_id)
REFERENCES public.Driver (Dri_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Company ADD CONSTRAINT postaladdress_company_fk
FOREIGN KEY (Add_id)
REFERENCES public.PostalAddress (Add_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Warehouse ADD CONSTRAINT postaladdress_warehouse_fk
FOREIGN KEY (Add_id)
REFERENCES public.PostalAddress (Add_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.LoadingPoint ADD CONSTRAINT postaladdress_loadingpoint_fk
FOREIGN KEY (Add_id)
REFERENCES public.PostalAddress (Add_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Mission ADD CONSTRAINT loadingpoint_mission_fk
FOREIGN KEY (Lpt_id)
REFERENCES public.LoadingPoint (Lpt_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderedItemMission ADD CONSTRAINT mission_ordereditemmission_fk
FOREIGN KEY (Mis_id)
REFERENCES public.Mission (Mis_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderedItem ADD CONSTRAINT product_ordereditem_fk
FOREIGN KEY (Pro_id)
REFERENCES public.Product (Pro_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.BookOrder ADD CONSTRAINT company_bookorder_fk
FOREIGN KEY (Com_id)
REFERENCES public.Company (Com_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Warehouse ADD CONSTRAINT company_warehouse_fk
FOREIGN KEY (Com_id)
REFERENCES public.Company (Com_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderedItem ADD CONSTRAINT warehouse_ordereditem_fk
FOREIGN KEY (War_id)
REFERENCES public.Warehouse (War_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderedItem ADD CONSTRAINT bookorder_ordereditem_fk
FOREIGN KEY (Ord_id)
REFERENCES public.BookOrder (Ord_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Slip ADD CONSTRAINT ordereditem_slip_fk
FOREIGN KEY (Ori_id)
REFERENCES public.OrderedItem (Ori_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.OrderedItemMission ADD CONSTRAINT ordereditem_ordereditemmission_fk
FOREIGN KEY (Ori_id)
REFERENCES public.OrderedItem (Ori_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
