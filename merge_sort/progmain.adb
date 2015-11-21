with Ada.Text_IO;
with SORT;


procedure ProgMain is
	
	use Ada.Text_IO;
	use SORT;
	package I_IO is new Ada.Text_IO.Integer_IO (sort_range);
	
	A : sort_array ( 1 .. SIZE );
	input : sort_range;
	sum : integer;

-- Initialize the array from console input

 	procedure InitializeProc is

 		task initialize;

		task body initialize is
		begin		
		    for i in 1 .. SIZE loop
	        	I_IO.get(input);
	   			A(i) := input;
	    	end loop;
		end;

	begin
		null;
	end InitializeProc;

	procedure PrintandSum is

		task sumArray;

		task printTask is
			entry sumDone;
		end printTask;

-- Calculate sum of all elements

		task body sumArray is
		begin
			sum := 0;
	    	for i in 1 .. SIZE loop
	    		sum := sum + integer(A(i));
	    	end loop;
	    	printTask.sumDone;		
		end;

-- Print array elements and sum

		task body printTask is
		begin
			for i in 1 .. SIZE loop
	    		Put(integer'image(integer(A(i))));
	    		put_Line("");
	    	end loop;

	    	accept sumDone;
	    	Put("Sum: " & integer'image(sum));
		end;

	begin	
		null;
	end PrintandSum;	

begin
	InitializeProc;
	MergeSort(A, SIZE);
	PrintandSum;
end ProgMain;