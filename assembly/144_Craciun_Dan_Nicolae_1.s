.data
v: .space 4194304
n4: .long 1048576
n: .long 1023
n2: .space 4
n5: .long 1024
n7: .space 4
formatScanf: .asciz "%d"
formatPrintf: .asciz "%d: ((%d, %d), (%d, %d))\n"
formatPrintf3: .asciz "%d: ((0, 0), (0, 0))\n"
formatPrintf4: .asciz "((%d, %d), (%d, %d))\n"
formatPrintf5: .asciz "((0, 0), (0, 0))\n"

nr1: .space 4
nr2: .space 4
n1: .long 0
n3: .long 0
nr4: .long 0
nr3: .space 4
eax_copie: .long 0
ecx_copie: .long 0
edx_copie: .long 0
ebx_copie: .long 0
ecx_copie1: .long 0
ultimul: .long 0
const: .long 0
.text
.global main

Get_function:
push %ebp
mov %esp, %ebp
push %ebx
push %esi
push %edi
mov 12(%ebp), %edi
mov 8(%ebp), %esi
mov %esi, eax_copie
xor %ecx, %ecx
xor %ebx, %ebx
xor %edx, %edx



Get4_loop:
cmp n, %ecx
jg Get4_exit


Get5_loop:
cmp n, %ebx
jg Get5_exit
movl n5, %eax
push %edx
xor %edx, %edx
mul %ecx
pop %edx
add %ebx, %eax

mov (%edi, %eax, 4), %esi

cmp %esi, eax_copie
je Get4_adunare
add $1, %ebx
jmp Get5_loop

Get4_adunare:
add $1, %edx
mov %ecx, ecx_copie
mov %ebx, ebx_copie
add $1, %ebx
jmp Get5_loop

Get5_exit:
xor %ebx, %ebx
inc %ecx
jmp Get4_loop


Get4_exit:
mov ebx_copie, %ebx
mov ecx_copie, %ecx
sub %edx, %ebx
add $1, %ebx
mov eax_copie, %eax
push ebx_copie
push ecx_copie
push %ebx
push %ecx
push %eax
push $formatPrintf
call printf
add $4, %esp
pop %eax
pop %ecx
pop %ebx
add $8, %esp


Get4_revenire:
pop %edi
pop %esi
pop %ebx
pop %ebp
ret







main:
lea v, %edi
xor %ecx, %ecx
xor %ebx, %ebx
Init:
cmp %ecx, n4
je Proiect
movl $0, (%edi,%ecx,4)
add $1, %ecx
jmp Init

Proiect:
push $n7
push $formatScanf
call scanf
add $8, %esp
xor %ecx, %ecx



Read_loop:
movl nr4, %esi
cmp %esi, n7
je Et_exit
push $nr3
push $formatScanf
call scanf
add $8, %esp
mov nr3, %ebx

mov $1, %eax
mov $2, %edx
mov $3, %esi
mov $4, %ecx
cmp %ebx, %eax
je Op1
cmp %ebx, %edx
je Op2
cmp %ebx, %esi
je Op3


Op1:

push $n2
push $formatScanf
call scanf 
add $8, %esp
xor %ecx, %ecx
xor %ebx, %ebx
movl $0, n3



Elemente1:
mov n3, %esi
cmp %esi, n2
je Read_Revenire
Program:
movl $0, nr1
movl $0, nr2
push %ebx
push %edx
push %ecx
push %eax
push $nr1
push $formatScanf
call scanf
add $8, %esp
pop %eax
pop %ecx
pop %edx
pop %ebx


push %ebx
push %edx
push %ecx
push %eax
push $nr2
push $formatScanf
call scanf
add $8, %esp
pop %eax
pop %ecx
pop %edx
pop %ebx

xor %esi, %esi

xor %edx, %edx
mov nr2, %eax 
mov $8, %ebx
div %ebx
cmp %esi, %edx
jg Majorare
jmp Neschimbare

Majorare:
add $1, %eax
mov %eax, nr2

Neschimbare:
mov %eax, nr2

xor %eax, %eax

Program3:
mov $0, %ecx
mov $0, %ebx
mov $0, %edx


Add_loop:

cmp n, %ecx
jg Read_Sus






Eticheta2:
cmp n, %ebx
jg Program2
movl n5, %eax

push %edx
xor %edx, %edx
mul %ecx
pop %edx
add %ebx, %eax

mov (%edi, %eax, 4), %esi
cmp %esi, n1
je Add_adunare
add $1, %ebx
xor %edx, %edx
jmp Eticheta2

Add_adunare:
add $1, %edx
cmp %edx, nr2
je Add_afisare
add $1, %ebx
jmp Eticheta2

Add_afisare:

movl %ebx, eax_copie
subl %edx, eax_copie
addl $1, eax_copie
mov %ecx, ecx_copie
push %eax
push %ebx
push %ecx
push eax_copie
push ecx_copie
push nr1
push $formatPrintf
call printf
add $16, %esp
pop %ecx
pop %ebx
pop %eax




Add_schimbare:

mov %eax, %ebx
sub nr2, %ebx
add $1, %ebx

Add_schimbare1:
mov $0, %ecx
cmp %eax, %ebx
jg Elemente1_revenire
movl nr1, %edx
movl %edx, (%edi,%ebx,4)
add $1, %ebx
Jmp Add_schimbare1

Elemente1_revenire:

xor %ebx, %ebx
xor %edx, %edx
mov $0, %ecx
addl $1, n3
jmp Elemente1


Program2:



xor %ebx, %ebx
xor %edx, %edx
inc %ecx
jmp Add_loop



Read_Sus:
push nr1
push $formatPrintf3
call printf
add $8, %esp
xor %ecx, %ecx
addl $1, n3
jmp Elemente1

Read_Revenire:
addl $1, nr4
jmp Read_loop

Op2:
push $n2
push $formatScanf
call scanf 
add $8, %esp
xor %ecx, %ecx
xor %ebx, %ebx
xor %edx, %edx
xor %ecx, %ecx


Get_loop:
cmp n, %ecx
jg Get_exit


Get1_loop:
cmp n, %ebx
jg Get1_exit
movl n5, %eax
push %edx
xor %edx, %edx
mul %ecx
pop %edx
add %ebx, %eax

mov (%edi, %eax, 4), %esi

cmp %esi, n2
je Get_adunare
add $1, %ebx
jmp Get1_loop

Get_adunare:
add $1, %edx
mov %ecx, ecx_copie
mov %ebx, ebx_copie
add $1, %ebx
jmp Get1_loop

Get1_exit:
xor %ebx, %ebx
inc %ecx
jmp Get_loop


Get_exit:
xor %esi, %esi
cmp %esi, %edx
jne Get_exit2

Get_exit1:
push $formatPrintf5
call printf
add $4, %esp
jmp Get_revenire

Get_exit2:
mov ebx_copie, %ebx
mov ecx_copie, %ecx
sub %edx, %ebx
add $1, %ebx

push ebx_copie
push ecx_copie
push %ebx
push %ecx
push $formatPrintf4
call printf
add $4, %esp
pop %ecx
pop %ebx
add $8, %esp


Get_revenire:
addl $1, nr4
jmp Read_loop


Op3:
push $n2
push $formatScanf
call scanf 
add $8, %esp

xor %ecx, %ecx

Delete_loop:
cmp n4, %ecx
je Delete_afisare_init

mov (%edi, %ecx, 4), %esi
cmp %esi, n2
je Delete_change
inc %ecx
jmp Delete_loop

Delete_change:
movl $0, (%edi, %ecx, 4)
inc %ecx
jmp Delete_loop


Delete_afisare_init:

xor %ecx, %ecx


Delete_afisare:

cmp n4, %ecx
je Delete_revenire

mov (%edi, %ecx, 4), %esi
cmp %esi, const
jne Del_show
inc %ecx
jmp Delete_afisare


Del_show:
cmp %esi, ultimul
jne Del_show1
inc %ecx
jmp Delete_afisare

Del_show1:
mov %esi, ultimul
mov %ecx, ecx_copie1
push $v
push ultimul
call Get_function
pop %eax
add $4, %esp
mov ecx_copie1, %ecx
mov %eax, ultimul
inc %ecx
jmp Delete_afisare


Delete_revenire:
addl $1, nr4
jmp Read_loop











Et_exit:
pushl $0
call fflush
popl %eax
mov $1, %eax
mov $0, %ebx
int $0x80