import util
import sort

if __name__ == '__main__':
    the_list = util.random_list(10000)
    print(the_list)
    # sort.insertion_sort_inplace(the_list)
    # print(the_list)
    a = []
    for i in range(1):
        a = sort.insertion_sort(the_list)
    print(a)
