create or replace TYPE InventoryInfo AS OBJECT (
    INVENTORY_ID NUMBER,
    MEDICATION_ID NUMBER,
    MED_NAME VARCHAR2(255),
    QUANTITY NUMBER,
    EXPIRATION_DATE DATE,
    REMAINING_DAYS NUMBER
);

create or replace TYPE InventoryInfoList IS TABLE OF InventoryInfo;