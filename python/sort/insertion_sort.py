def insertion_sort(input):
    tmp = input.copy()
    for i in range(1, len(tmp)):
        key = tmp[i]
        j = i - 1
        while j >= 0 and key < tmp[j]:
            tmp[j + 1] = tmp[j]
            j -= 1
        tmp[j + 1] = key
    return tmp


def insertion_sort_inplace(input):
    for i in range(1, len(input)):
        key = input[i]
        j = i - 1
        while j >= 0 and key < input[j]:
            input[j + 1] = input[j]
            j -= 1
        input[j + 1] = key
    return input
