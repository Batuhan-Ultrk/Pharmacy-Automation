
create or replace TRIGGER log_orders_insert_delete
  AFTER INSERT OR DELETE ON orders
  FOR EACH ROW
DECLARE
    
  log_message VARCHAR2(200);

BEGIN
    IF INSERTING THEN
        log_message := 'Sipariþ Girildi';
         INSERT INTO log (log_id,order_id,message,log_time) VALUES (otomatik_artis.NEXTVAL,:new.order_id,log_message,sysdate);
    END IF;
    
    IF DELETING THEN
         log_message := 'Sipariþ Silindi';
         INSERT INTO log (log_id,order_id,message,log_time) VALUES (otomatik_artis.NEXTVAL,:old.order_id,log_message,sysdate);
    END IF;
    
    
 
END;