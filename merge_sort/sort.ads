with Ada.Text_IO;

package SORT is
	SIZE : constant integer := 40;
	
	type sort_range is range -500 .. 500;
	type sort_array is array ( Positive range <>) of sort_range;
    
	procedure MergeSort (A : in out sort_array;  size : in integer);

end SORT;
