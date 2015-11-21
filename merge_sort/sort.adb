package body SORT is


    procedure MergeSort ( A : in out sort_array;  size : in integer) is
    	
    	procedure run(sizeFirst : in integer; sizeSecond : in integer) is
    		
    		firstHalf : sort_array ( 1 .. sizeFirst );
    		secondHalf : sort_array ( 1 .. sizeSecond );
            i : integer;
            j : integer;
            k : integer;

    		task first;
    		
    		task second;
    		
    		task merge is
                entry firstDone;
                entry secondDone;
            end merge;

-- Initialize and populate the first half and call mergesort(firstHalf)

    		task body first is
    		begin
    			for i in 1 .. sizeFirst loop
    				firstHalf(i) := A(i);	
    			end loop;

    			MergeSort(firstHalf, sizeFirst);
    			merge.firstDone;
    		end;

-- Initialize and populate the second half and call mergesort(secondHalf)

    		task body second is
    		begin
    			for i in 1 .. sizeSecond loop
    				secondHalf(i) := A(i + sizeFirst);
    			end loop;

    			MergeSort(secondHalf, sizeSecond);
    			merge.secondDone;
    		end;

-- Merge the two sorted halves    		

    		task body merge is
    		begin
    			accept firstDone;
    			accept secondDone;

                i := 1;
                j := 1;
                k := 1;


                while i <= sizeFirst and j <= sizeSecond loop
                    if firstHalf(i) < secondHalf(j) then
                        A(k) := firstHalf(i);
                        k := k + 1;
                        i := i + 1;
                    else
                        A(k) := secondHalf(j);
                        k := k + 1;
                        j := j + 1;
                    end if;
                end loop;


                while (i <= sizeFirst) loop
                    A(k) := firstHalf(i);
                    k := k + 1;
                    i := i + 1;
                end loop;

                while (j <= sizeSecond) loop
                    A(k) := secondHalf(j);
                    k := k + 1;
                    j := j + 1;
                end loop;
    		end;
    	
    	begin
    		null;
    	end run;
    
    begin

-- Take care of base case

		if(size > 1) then
    		run(size / 2, size - (size / 2));
    	else
    		return;
    	end if;
    end MergeSort;

end SORT;