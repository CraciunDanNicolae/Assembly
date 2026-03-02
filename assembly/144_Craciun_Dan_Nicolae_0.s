.data
v: .space 4096
n5: .long 1024
n: .long 1023
n4: .long 1022
n1: .space 4
n2: .space 4
n3: .space 4
nr3: .long 0
nr4: .long 0
formatScanf: .asciz "%ld"
formatPrintf: .asciz "%d: (%d, %d)\n"
nr1: .space 4
nr2: .space 4
formatPrintf2: .asciz "(0, 0)\n"
formatPrintf3: .asciz "(%d, %d)\n"
formatPrintf4: .asciz "%d: (0, 0)\n"
nr5: .space 4
nr6: .long 0
ultim: .space 4
restituire: .space 4
restituire1: .space 4
.text
.global main

Get_function:
push %ebp
mov %esp, %ebp
push %edi
push %ebx
push %esi
mov 8(%ebp), %eax
mov 12(%ebp), %edi
xor %ecx, %ecx
xor %ebx, %ebx
xor %edx, %edx







mov $0, %ecx

Get_loop:
cmp n, %ecx
jg Get_exit
mov (%edi, %ecx, 4), %esi
cmp %eax, %esi
je Get_interval
inc %ecx
jmp Get_loop

Get_interval:
add $1, %ebx
mov %ecx, %edx
inc %ecx
jmp Get_loop



Get_exit:

cmp nr6, %ebx
jg Get_exit2


Get_exit1:
push $formatPrintf2
call printf
add $4, %esp
jmp Get_exit3


Get_exit2:
mov %edx, %esi
sub %ebx, %esi
add $1, %esi
mov %esi, %ebx

push %edx
push %ebx
push %eax
push $formatPrintf
call printf
add $4, %esp
pop %eax
pop %ebx
pop %edx




Get_exit3:
pop %esi
pop %ebx
pop %edi
pop %ebp
ret


main:
lea v, %edi
xor %ecx, %ecx
movl $0, n2
Init:
cmp %ecx, n
je Proiect
movl $0, (%edi,%ecx,4)
inc %ecx
jmp Init

Proiect:
push $n2
push $formatScanf
call scanf
add $8, %esp
xor %ecx, %ecx



Read_loop:
movl nr4, %ecx
cmp %ecx, n2
je Et_exit
push $n3
push $formatScanf
call scanf
add $8, %esp
mov n3, %ebx

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

cmp %ebx, %ecx
je Op4


Op1:
push $n1
push $formatScanf
call scanf
add $8, %esp
movl $0, nr3



Program1:
mov nr3, %eax

cmp n1, %eax
je Read_Revenire
Program:
movl $0, nr1
movl $0, nr2
push $nr1
push $formatScanf
call scanf
add $8, %esp



push $nr2
push $formatScanf
call scanf
add $8, %esp
mov nr1, %ebx
mov nr2, %ebp
xor %esi, %esi
xor %edx, %edx
mov %ebp, %eax
mov $8, %ecx
div %ecx
cmp %esi, %edx
jg Majorare
jmp Neschimbare

Majorare:
add $1, %eax
mov %eax, %ebp

Neschimbare:
mov %eax, %ebp






Program2:
xor %ecx, %ecx
xor %edx, %edx
xor %esi, %esi




Add_loop:
cmp n, %ecx
jg Read_Sus
mov (%edi,%ecx,4), %eax

cmp %eax, %esi
je Add_adunare
inc %ecx
xor %edx, %edx
jmp Add_loop


Add_adunare:


add $1, %edx
mov %ecx, %eax
cmp %edx, %ebp
je Add_schimbare
inc %ecx
jmp Add_loop



Add_schimbare:

mov %eax, %esi
sub %edx, %esi
add $1, %esi
push %eax
push %esi
push %ebx
push $formatPrintf
call printf
add $4, %esp
pop %ebx
pop %esi
pop %eax





Add_init:
cmp %eax, %esi
jg Add_exit
movl %ebx, (%edi,%esi,4)
add $1, %esi
jmp Add_init





Add_exit:
addl $1, nr3
jmp Program1

Read_Sus:
push %ebx
push $formatPrintf4
call printf
add $4, %esp
pop %ebx
addl $1, nr3
jmp Program1


Read_Revenire:
addl $1, nr4
jmp Read_loop



Op2:
push $nr5
push $formatScanf
call scanf
add $8, %esp

mov nr5, %ebx
xor %ecx, %ecx
xor %eax, %eax
xor %edx, %edx







mov $0, %ecx

Get1_loop:
cmp n, %ecx
jg Get1_exit
mov (%edi, %ecx, 4), %esi
cmp %ebx, %esi
je Get1_interval
inc %ecx
jmp Get1_loop

Get1_interval:
add $1, %eax
mov %ecx, %edx
inc %ecx
jmp Get1_loop



Get1_exit:

cmp nr6, %eax
jg Get1_exit2


Get1_exit1:
push %ebx
push $formatPrintf2
call printf
add $8, %esp
jmp Get1_exit3

Get1_exit2:
mov %edx, %esi
sub %eax, %esi
add $1, %esi
mov %esi, %eax
push %edx
push %eax
push $formatPrintf3
call printf
add $4, %esp
pop %eax
pop %edx

Get1_exit3:
addl $1, nr4
jmp Read_loop

Op3:
push $n1
push $formatScanf
call scanf
add $8, %esp
xor %edx, %edx
mov n1, %ebx

xor %ecx, %ecx

Del_loop:
cmp n, %ecx
jg Del_afisare_init
mov (%edi,%ecx,4), %eax
cmp %ebx, %eax
je Delete
inc %ecx
jmp Del_loop

Delete:
inc %edx
movl $0, (%edi,%ecx,4)
inc %ecx
jmp Del_loop


Del_afisare_init:
add %edx, n5
xor %ecx, %ecx
xor %eax, %eax
xor %edx, %edx



Del_afisare:
xor %edx, %edx

cmp n, %ecx 
jg Del_revenire
mov (%edi,%ecx,4), %ebx
cmp %ebx, %edx
jne Del_afisare1
inc %ecx
jmp Del_afisare


Del_afisare1:
cmp %ebx, %eax
jne Del_afisare2
inc %ecx
jmp Del_afisare


Del_afisare2:
mov %ebx, %eax
movl %eax, restituire
movl %ecx, restituire1
push $v
push restituire
call Get_function
pop %eax
add $4, %esp
movl restituire, %eax
movl restituire1, %ecx

inc %ecx
jmp Del_afisare


Del_revenire:
addl $1, nr4
jmp Read_loop


Op4:
xor %ecx, %ecx
xor %eax, %eax
Find_ultim:
cmp n, %ecx
jg Parcurgere_init
mov (%edi, %ecx, 4), %ebx


cmp %ebx, %eax
jne Schimbare_ultim
inc %ecx
jmp Find_ultim

Schimbare_ultim:
movl %ecx, ultim
inc %ecx
jmp Find_ultim


Parcurgere_init:
xor %ecx, %ecx

Parcurgere:

movl ultim, %eax
cmp %ecx, %eax
je Defragmantation_afisare_init

xor %esi, %esi





mov (%edi, %ecx, 4), %ebx
cmp %ebx, %esi
je Defragmantation
inc %ecx

jmp Parcurgere



Defragmantation:
mov %ecx, %edx

Defragmantation_loop:
cmp n4, %edx
jg Parcurgere_intoarcere
mov %edx, %eax
add $1, %eax
movl (%edi, %eax, 4), %esi
mov %esi, (%edi, %edx, 4)
add $1, %edx
jmp Defragmantation_loop

Parcurgere_intoarcere:
subl $1, ultim
mov n, %eax
movl $0, (%edi, %eax, 4)
jmp Parcurgere


Defragmantation_afisare_init:

xor %ecx, %ecx
xor %eax, %eax
xor %edx, %edx



Defragmantation_afisare:
xor %edx, %edx

cmp n, %ecx 
jg Defragmantation_exit
mov (%edi,%ecx,4), %ebx
cmp %ebx, %edx
jne Defragmantation_afisare1
inc %ecx
jmp Defragmantation_afisare


Defragmantation_afisare1:
cmp %ebx, %eax
jne Defragmantation_afisare2
inc %ecx
jmp Defragmantation_afisare


Defragmantation_afisare2:
mov %ebx, %eax
movl %eax, restituire
movl %ecx, restituire1
push $v
push restituire
call Get_function
pop %eax
add $4, %esp
movl restituire, %eax
movl restituire1, %ecx
inc %ecx
jmp Defragmantation_afisare



Defragmantation_exit:
addl $1, nr4
jmp Read_loop

Et_exit:
pushl $0
call fflush
popl %eax

mov $1, %eax
mov $0, %ebx
int $0x80