CREATE TABLE public.Stock (
                Sto_quantity INTEGER NOT NULL DEFAULT 0,
                Pro_id INTEGER NOT NULL,
                War_id INTEGER NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (Pro_id, War_id)
);
COMMENT ON TABLE public.Stock IS 'Inventory of products.';

ALTER TABLE public.Stock ADD CONSTRAINT stock_product_fk
FOREIGN KEY (Pro_id)
REFERENCES public.Product (Pro_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT stock_warehouse_fk
FOREIGN KEY (War_id)
REFERENCES public.Warehouse (War_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

