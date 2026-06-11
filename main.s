format ELF64 executable    


segment readable writeable

msg db  'Hello World',0xA
len = $ - msg  

segment readable executable
entry _start               

_start:
  push 5 ; put value 5 on stack [rsp] [5,]
  jmp cloop

print:
  mov rax,0x01 ;write stdout function
  mov rdi,1 ;write stdout

  mov rdx,len
  mov rsi,msg 
  syscall

cloop:
  dec dword [rsp]
  cmp dword [rsp],0
  jg print
  [rsp + 8] 

exit:
  mov rax,0x3c 
  mov rdi,0 
  syscall

