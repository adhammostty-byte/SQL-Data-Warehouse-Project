/*
======================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
======================================================================================
Script Purpose:
This stored procedure loads data into the 'bronze' schema from external CSV files.
It performs the following actions:
- Truncates the bronze tables before loading data.
- Uses the 'Bulk Insert' command to load data from CSV files to bronze tables.

Paramaters:
None.
  This stored procedrue doesn't accept any parameter or return any values.

Usage Exambles:
  EXEC bronze.load_bronze;
======================================================================================
*/

Create OR Alter PROCEDURE bronze.load_bronze AS
	 BEGIN 
	 Declare @Start_Time DATETIME, @End_Time DATETIME, @BatchStart_Time DATETIME, @BatchEnd_Time DATETIME;
		Begin TRY
		Set @BatchStart_Time = GETDATE();
	 Print '================================================';
	 PRINT 'Loading Bronze Layer';
	 Print '================================================';

	 Print '------------------------------------------------';
	 Print 'Loading CRM Section';
	 Print '------------------------------------------------';

	 	 Set @Start_Time = GETDATE();
	Print 'Truncating Table: crm_cust_info';


Truncate Table bronze.crm_cust_info;

Print 'Inserting Into: crm_cust_info';

 Bulk insert bronze.crm_cust_info
 From 'D:\Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
 with (
 Firstrow = 2,
 FIELDTERMINATOR = ',',
 TABLOCK
 );
 	 Set @End_Time = GETDATE();
	 		 Print '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @Start_Time, @End_Time) As NVARCHAR) + ' Seconds';



	 Set @Start_Time = GETDATE();
	 Print 'Truncating crm_prd_info';

	Truncate Table bronze.crm_prd_info;

	Print 'Inserting Into: crm_prd_info';

	 Bulk insert bronze.crm_prd_info
	 From 'D:\Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	 with (
	 Firstrow = 2,
	 FIELDTERMINATOR = ',',
	 TABLOCK
	 );
	 	 Set @End_Time = GETDATE();
		 Print '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @Start_Time, @End_Time) As NVARCHAR) + ' Seconds';

		 	 Set @Start_Time = GETDATE();
	 Print 'Truncating Table: crm_sales_details'

	 Truncate Table bronze.crm_sales_details;

	 Print 'Inserting Into: crm_sales_details';

	 Bulk insert bronze.crm_sales_details
	 From 'D:\Data Warehouse Project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	 with (
	 Firstrow = 2,
	 FIELDTERMINATOR = ',',
	 TABLOCK
	 );

	 	 Set @End_Time = GETDATE();
		 Print '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @Start_Time, @End_Time) As NVARCHAR) + ' Seconds';



	Print '------------------------------------------------';
	Print 'Loading erp Section';
	Print '------------------------------------------------';

		 Set @Start_Time = GETDATE();
	Print 'Truncating Table: erp_CUST_AZ12';

	 Truncate Table bronze.erp_CUST_AZ12;

	 Print 'Inserting Into: erp_CUST_AZ12';

	 Bulk insert bronze.erp_CUST_AZ12
	 From 'D:\Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	 with (
	 Firstrow = 2,
	 FIELDTERMINATOR = ',',
	 TABLOCK
	 );
	 	 Set @End_Time = GETDATE();
			 Print '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @Start_Time, @End_Time) As NVARCHAR) + ' Seconds';


			 	 Set @Start_Time = GETDATE();
	 Print 'Truncating Table: erp_LOC_A101'

	  Truncate Table bronze.erp_LOC_A101;
	  
	  Print 'Inserting Into: erp_LOC_A101';

	 Bulk insert bronze.erp_LOC_A101
	 From 'D:\Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	 with (
	 Firstrow = 2,
	 FIELDTERMINATOR = ',',
	 TABLOCK
	 );
	 	 Set @End_Time = GETDATE();
			 Print '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @Start_Time, @End_Time) As NVARCHAR) + ' Seconds';

			 	 Set @Start_Time = GETDATE();
		Print 'Truncating Table: erp_PX_CAT_G1V2'

	   Truncate Table bronze.erp_PX_CAT_G1V2;

		Print 'Inserting Into: erp_PX_CAT_G1V2';

	 Bulk insert bronze.erp_PX_CAT_G1V2
	 From 'D:\Data Warehouse Project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	 with (
	 Firstrow = 2,
	 FIELDTERMINATOR = ',',
	 TABLOCK
	 );
	 	 Set @End_Time = GETDATE();
			 Print '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @Start_Time, @End_Time) As NVARCHAR) + ' Seconds';

			 Set @BatchEnd_Time = GETDATE();

			 Print '===================================';
			 Print 'Loading Bronze Layer Is Complete';
			 Print '	-Total Load Duration: ' + Cast(DATEDIFF(SECOND, @BatchStart_Time, @BatchEnd_Time) As NVARCHAR) + ' Seconds';
			 Print'====================================';

	 END TRY

	 BEGIN CATCH
		Print '==============================='
		Print 'Error Occured During Loading Bronze Layer'
		Print 'Error Message' + Error_Message();
		Print 'Error Message' + Cast (Error_Message() As NVARCHAR);
		Print 'Error Message' + Cast (Error_State() As NVARCHAR);
		Print '==============================='

	 END CATCH
	END
