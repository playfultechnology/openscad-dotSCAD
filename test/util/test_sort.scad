use <util/sort.scad>;

module test_sort() {
    echo("==== test_sort ====");

    assert(
        [[2, 0, 0], [5, 0, 0], [7, 0, 0], [9, 0, 0], [10, 0, 0]] == 
        sort([[10, 0, 0], [5, 0, 0], [7, 0, 0], [2, 0, 0], [9, 0, 0]])
    );

    assert(
        [[2, 0, 0], [5, 0, 0], [7, 0, 0], [9, 0, 0], [10, 0, 0]] == 
        sort([[10, 0, 0], [5, 0, 0], [7, 0, 0], [2, 0, 0], [9, 0, 0]], by = "x")
    );

    assert(
        [[0, 2, 0], [0, 5, 0], [0, 7, 0], [0, 9, 0], [0, 10, 0]] == 
        sort([[0, 10, 0], [0, 5, 0], [0, 7, 0], [0, 2, 0], [0, 9, 0]], by = "idx", idx = 1)
    );
 
    ascending = function(e1, e2) e1 - e2;
    descending = function(e1, e2) e2 - e1;
    assert(sort([2, 1, 3, 5, 4], by = ascending) == [1, 2, 3, 4, 5]);
    assert(sort([2, 1, 3, 5, 4], by = descending) == [5, 4, 3, 2, 1]);
}

test_sort();
