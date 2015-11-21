# Parallel Merge-Sort

I used Ada to implement the parallel Merge-Sort algorithm i.e. each subproblem is handled by a separate "thread" or "task". 

## Usage

Navigate to the merge_sort/ directory in a linux shell and run the command below. You must have Ada installed:

```
	./progmain <list of integers>
```

As an example, an input.txt is included which has numbers in unsorted order. To run the algorithm on that list:

```
	./progmain < input.txt
```

If the need arises to recompile:

```
	gnatmake progmain.adb
```

The output of the above is the given list of integers in sorted order (and a sum just for fun).
