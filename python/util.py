import random


def random_list(lenght):
    ret = [i for i in range(lenght)]
    random.shuffle(ret)
    return ret
