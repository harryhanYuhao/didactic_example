def merge_sort(input):
    res = []
    if len(input) <= 1:
        res = input.copy()
        return res

    mid = len(input) // 2
    left_half = input[:mid].copy()
    right_half = input[mid:].copy()
    left_half = merge_sort(left_half)
    right_half = merge_sort(right_half)
    i = 0
    j = 0
    while i < len(left_half) and j < len(right_half):
        if left_half[i] < right_half[j]:
            res.append(left_half[i])
            i += 1
        else:
            res.append(right_half[j])
            j += 1
    while i < len(left_half):
        res.append(left_half[i])
        i += 1
    while j < len(right_half):
        res.append(right_half[j])
        j += 1
    return res
