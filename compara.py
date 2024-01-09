import filecmp

ave = filecmp.cmp("cpPar_average.txt", "cp_average.txt")
out = filecmp.cmp("cpPar_output.txt", "cp_output.txt")
traj = filecmp.cmp("cpPar_traj.xyz", "cp_traj.xyz")

if not out:
    original = []
    trab = []
    with open("cpPar_output.txt") as orig:
        original = [ line.strip() for line in orig.readlines()]
    with open("cp_output.txt") as tr:
        trab = [ line.strip() for line in tr.readlines()]

    out = True

    for i,(l1, l2) in enumerate(zip(original[1::], trab[1::])):
        nums1 = [num for num in l1.split(" ") if len(num)>0 ]
        nums2 = [num for num in l2.split(" ") if len(num)>0 ]
        for (num1, num2) in zip(nums1[1::], nums2[1::]):
            s = 0
            for (c1, c2) in zip(num1, num2):
                if c1 == c2:
                    s += 1
                elif s < 12:
                    out = False
                    break

print(ave)
print(out)
print(traj) 

