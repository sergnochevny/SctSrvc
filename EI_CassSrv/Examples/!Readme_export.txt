===========================��������� ExpImp_Dukat.dll===========================

�������/������ ������ � ������� �/�� ���� ��������� �������. 

(� ������������ ������� �� ������.)
--------------------------------------------------------------------------------
	1. ����������� ����������.
	2. �������� ����������.
		2.1. �������� �������.
		2.2. �������� ����� ��������.
		2.3. ������ �������������� �����.
	3. ������� ����������� ����������.
--------------------------------------------

======= 1. ����������� ����������.

	��� ��������� �������� ���������� ��������� ��������:
    	1. Database version 135(�������).
    	2. Butuz version 3.60.08(�������).
    	3. ����� ��������� ��������� ������� "�����" 
         � ����������� �������� ���� � ��� � ������� (������� ��� "�������").
    	4. �������������� ������� ��� ����������.
    	5. BServer.exe version 2.55.01(�������).
    	6. ExpImp_Dukat.dll version 2.0.01(�������).
    	7. EIDukat.ini - ���� �������� (��. �. 2.3.).
    	8. ��������� �����, ������������ � ����������� ������ (��. �. 3.1.).
--------------------------------------------

======= 2. �������� ����������.

	�����!!! ���������� ������ ��������� � ��������, ��� ��������� BTAdmin.exe �/��� Butuz.exe
	
	�������, ������������ � �������� ��-���:
    				InitLibrary,
    				SyncData,
    				ExportData,
    				ImportData

 	����� ������: function ^^^^^^^^^^ (Value: OleVariant): Olevariant; stdcall;
 	���������� ���������� �������� GetDllStr(<DllName>,<FunctinName>,<ParametersStringfordllfunction>). GetDllStr ���������� ���������
 	���������� �������.
  	��������� ��� ������� ����������� � ������ � ������������ ";". ��� ������ - ������ (���������) �������� ��� ������� GetDllStr.
  	��� ������ ������� ���������� �������:
  		�)	���� ��������� ������� � �������������� ������. �������������� ������� ������ ���������
  			� �������� ���� ��������� �������;
  		�)	����� �������� EIDukat.ini.
  	
	2.1. �������� �������.
	----------------------
	
		�) InitLibrary (������������� ����������)
		==================
			���������� '0' ���� '1' (�������� �� �������������). ����� ���������� (��������) ����� ������� ���� �������.
		
			���������:
				1. ����� ���������� ���������. (� �������� ����� ������� ���������� ������������ ������� AppHandle).
			
		�) SyncData (��������� ������������� ������ � ����� ������� � ��������� ������� - ������ ����, �����-���� � ������������.
					 ������ ������� �� �������� �����, ��������������� ��������.)
		==================
			���������� ������ � ���� 'str1;str2',
			���:
				str1 - ���������� ������� ������������������� ������ (-3, 0..n);
					('-3' : ���� � ���� ��������� ������� ����� �������. (��. �. 2.2))
				str2 - ���������� ����� ����������� ��� ������������� (0..n).
			
			���������: ������ ������.
		
		�) ExportDat�	(��������� ������� ���������� �� ������� � ���� ��������� �������. ������� ����� �����, ����������� ������� ���
						 ������������� ��� ������ � �������� ��� ���� �� �����, ��������� �����-���� ��� �������.
						 ������ ������� �� �������� �����, ��������������� ��������)
		==================
			���������� ������ � ���� 'str1;str2',
			���:
				str1 - ���������� ������� ������������������� ������ (-3, 0..n);
					('-3' : ���� � ���� ��������� ������� ����� �������. (��. �. 2.2))
				str2 - ���������� ����� ����������� ��� ������������� (0..n).
			
			���������: ������ ������.
			
		�) ImportData (��������� ������������ ����� ������������� �������, ���� ���������� ���������� � �������� � ���� ��������� �������,
					   ������� ������������ ������� ����������.
					   ��� ��������� ������������� ������� ������ ���������� ��������� �� �����������.)
		==================
			���������� ������ 'str'
				'-3'		: ���� � ���� ��������� ������� ����� �������. (��. �. 2.2)	
				'-2'		: �� ������� ������� �������� ����.		
				'-1'		: ���� �������������������� � �������� ����� �����.
				'0'			: ������ ���
				'n'(n > 0)	: ���������� ������������ �������.
				
			���������:
				1. ����� (���� ����, ����� ����� ������)
				(������������ ����, �� ������� ������ �������� ����������.)
				2. ���
				3. �����
				4. ����
        5. ��� ������ (0-��������, 1-���, 2-������ )

		�����!!! ��� ������ ���������� ��������� ���� ��������.

				
	2.2. �������� ����� ��������.
	----------------------------
	
		�����!!! ���� �������� ������ ��������� ����� � BTAdmin.exe �/��� Butuz.exe

		���� �������� EIDukat.ini �������� ��� ������:

			begin=============================EIDukat.ini
			
			[COMMON]
			PathBasa = D:\DUKAT\DATA

			[FILES]
			ImpFileName = Imp.dat
			ExpFileName = Exp.dat
			SyncFileName = Sync.dat
			ScriptFile = imp.sql

			[TOKENS]
			TokenLog = 1
			TokenWriteWOSync = 0		
			
			end===============================EIDukat.ini
		
			PathBasa - ���� � ���� �������� ��������;
			ImpFileName - ������������ ����� ��������;
			ExpFileName - ������������ ����� �������;
			SyncFileName - ������������ ����� �������������;
			ScriptFile - ������������ ����� �������;
			TokenLog - ������� ������� ���-�����;
				�������� (0, 1, 2):
					0 - �� ����� ���-����;
					1 - ����� ���-���� 'EIDukat.log' (���� �� ���� ������� ������������� � ���������� � Butuz.exe/BTAdmin.exe);
					2 - �������� ���� � ���������� ���-����� (���� �� ���� ������� �� �������).
			TokenWriteWOSync - ������� ������������ ����� ������� ��� ������� ��������������������� ������;
				�������� (0, 1):
					0 - �� ��������� ���� ������� ������ ��� ����������������;
					1 - ��������� ���� ������� � ����� ������.
					
	2.2. ������� ������������� ������.
	----------------------------------
		
		ExpHeader - 'TCE';
		ImpHeader - 'TCI';
		US - Chr(31)
		RS - Chr(30)
		FS - Chr(28)
		GS - Chr(29)
		
		�������:
		------------------------------------------	

			Header:
			|	Record:
			|	|	ExpHeader+Us+
			|	|	Field1+Us+
			|	|	Field2+Us+
			|	|	Field3+Us+
			|	Rs+
			Gs+
			Body:
			|	Record:		
			|	|	IncrMtu+Us+
			|	|	Code+Us+
			|	|	Name+Us+
			|	|	ShortName+Us+
			|	|	BarCode+Us+
      | | Department+Us+
			|	|	TaxGrp+Us+
			|	|	Price+Us+
			|	|	Count+Us+
			|	|	Dividable+Us+
			|	|	ValidCount+Us+
			|	|	IncrEd+Us+
			|	|	Fs+ (if any)
			|	|	|	BarCode1+Us+ (from MtuBar)
			|	|	|	Scale1+Us+
			|	|	|	BarCode2+Us+
			|	|	|	Scale2+Us+
			|	|	|	BarCode3+Us+
			|	|	|	Scale3+Us+
			|	|	|	...
			|	|	|	BarCodeN+Us+
			|	|	|	ScaleN
			|	|	Us+
			|	Rs+
			Gs

		�������������:
		------------------------------------------

			Header:
			|	Record:
			|	|	ExpHeader+Us+
			|	|	Field1+Us+
			|	|	Field2+Us+
			|	|	Field3+Us+
			|	Rs+
			Gs+
			Body:
			|	Record:		
			|	|	IncrMtu+Us+
			|	|	Code+Us+
			|	|	Name+Us+
			|	|	ShortName+Us+
			|	|	BarCode+Us+
			|	|	IncrEd+Us+
			|	|	Fs+ (if any)
			|	|	|	BarCode1+Us+ (from MtuBar)
			|	|	|	Scale1+Us+
			|	|	|	BarCode2+Us+
			|	|	|	Scale2+Us+
			|	|	|	BarCode3+Us+
			|	|	|	Scale3+Us+
			|	|	|	...
			|	|	|	BarCodeN+Us+
			|	|	|	ScaleN
			|	|	Us+
			|	Rs+
			Gs
			
		������:
		------------------------------------------		

			Header:
			|	Record:
			|	|	ImpHeader+Us+
			|	|	Year+Us+
			|	|	Month+Us+
			|	|	Day+Us+
			|	Rs+
			Gs+
			Body:
			|	Record:		
			|	|	Department+Us+
			|	|	IncrMtu+Us+
			|	|	Price+Us+
			|	|	Count+Us+
			|	|	Summa+Us+
			|	|	TaxSum+Us+
			|	|	Discount+Us+
			|	|	IncrEd+Us+
			|	Rs+
			Gs

		�����!!! ���������� ��������!!!
--------------------------------------------			

======= 3. ������ ����������� ����������.
  �������� ������ �������: EXPORT_D.QR2, EXPORT_D_IM.QR2, EXPORT_D_PR.QR2
  ������ ����������: ���_����������_�����_����.ds, ���_����������_�����_����_(visa).ds 
			