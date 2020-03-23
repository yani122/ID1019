defmodule R do

def nth(_,[]) do [] end
def nth(0,[h|t]) do h end
def nth(n,[h|t])  do nth(n-1,t) end
#####################

def len([]) do 0 end
def len([h|t]) do 1 + len(t) end
########################

def sum([]) do 0 end
def sum([h|t]) do h + sum(t) end
#################

def duplicate([]) do [] end
def duplicate([h|t]) do [h,h|duplicate(t)] end
##########

def add(x,[]) do [x] end
def add(x,[x|t]) do [x|t] end
def add(x,[h|t]) do  [h|add(x,t)] end

#################

def remove(x,[x]) do [] end
def remove(_,[]) do [] end
def remove(x,[x|t]) do  remove(x,t) end
def remove(x,[h|t]) do [h|remove(x,t)] end
##############

def unique([]) do [] end
def unique([h|t]) do [h|unique(remove(h,t))] end
###########

def pack([]) do [] end
def pack([h|t]) do
  [all,rest] = match(h,t,[h],[])
  [all|pack(rest)] end


def match(_,[],all,rest) do [all,rest] end
def match(x,[x|t],all,rest) do match(x,t,[x|all],rest) end
def match(x,[h|t],all,rest) do match(x,t,all,[h|rest]) end
#############

def naive_reverse([]) do [] end
def naive_reverse([h|t]) do naive_reverse(t) ++ [h] end

def reverse(l) do reverse(l,[]) end
def reverse([], rev) do rev end
def reverse([h|t],rev) do reverse(t,[h|rev]) end

#######

def n_flat([]) do [] end
def n_flat([h|t]) do
h ++ n_flat(t)
end
#####
def flat(l) do flat(l,[]) end
def flat([],lis) do lis end
def flat([h|t],lis) do flat(t,lis ++ h) end
##############
def fib(0) do 0 end
def fib(1) do 1 end
def fib(n) do
fib(n-1) + fib(n-2)
end
############

def eval([:const,c]) do c end
def eval([:add,x,y]) do eval(x) + eval(y) end
def eval([:mul,x,y]) do eval(x) * eval(y) end

##########
def insert(:nil,e) do {:node,e,:nil,:nil} end
def insert({:node,x,l,r},e) do
  if e < x do {:node,x,insert(l,e)}
else {:node,x,l,insert(r,e)}
end
end
####################

def reduce([]) do [] end
def reduce([h,h|t]) do reduce([h|t]) end
def reduce([h|t]) do [h|reduce(t)] end
#################

def traversera({:leaf,a}) do [a] end
def traversera({:node,l,r}) do traversera(l) ++ traversera(r) end
##########

def once([]) do {0,0} end
def once([h|t]) do
  {s,l} = once(t)
  {s+h,l+1} end
##################


#################

def eval_1([]) do 0 end
def eval_1([h]) do h end
def eval_1([h1,'+',h3|t]) do eval_1([h1+h3|t]) end
def eval_1([h1,'-',h3|t]) do eval_1([h1-h3|t]) end

#############

def isomorfa(:nil,:nil) do true end
def isomorfa({:node,_,l1,r1},{:node,_,l2,r2}) do
    case isomorfa(l1,l2) do
      true -> isomorfa(r1,r2)
      false -> false
    end
    end
    def isomorfa(_,_) do false end

############################
def miror(:nil) do nil end
def miror({:node,v,l,r}) do {:node,v,miror(r),miror(l)} end

##################

def calc(list,x) do calc(list,x,0) end
def calc([],_,l) do l end
def calc([h|t],x,l) do calc(t,x,h+l*x) end

###########################

def freq(key,[]) do [{key,1}] end
def freq(key,[{key,v}|t]) do [{key,v+1}|t] end
def freq(key,[{k,v}|t]) do [{k,v}|freq(key,t)] end
####################
def fraq([]) do [] end
def fraq([h|t]) do freq(h,fraq(t)) end
################3
def append(l1,l2) do
  case l1 do
    [] -> l2
    [h|t] -> [h|append(t,l2)]
  end
  end
####################
def str_to_list({:str,l}) do l end
def str_to_list({:str,l1,l2}) do
  append(str_to_list(l1),str_to_list(l2)) end

#################
def enque(elem,[]) do elem end
def enque(elem,[h|t]) do [h|enque(elem,t)] end
################
def flatten([]) do [] end
def flatten([h|t]) do append(flatten(h),flatten(t)) end
def flatten(h) do [h] end
#######################
def transf(_,_,[]) do [] end
def transf(x,y,[x|t]) do transf(x,y,t) end
def transf(x,y,[h|t]) do [h*y|transf(x,y,t)] end
#######################

def sum_1(l) do sum_1(l,0) end
def sum_1([],list) do list end
def sum_1([h|t],list) do sum_1(t,h+list) end

###############

def sum_2(:nil) do 0 end
def sum_2({:node,v,l,r}) do v + sum_2(l) + sum_2(r) end

##############
def fizzbuzz(n) do fizzbuzz(1, n+1, 1, 1) end
def fizzbuzz(n,n,_,_) do [] end
def fizzbuzz(i,n,3,5) do [:fizzbuzz|fizzbuzz(i+1,n,1,1)] end
def fizzbuzz(i,n,a,5) do [:buzz|fizzbuzz(i+1,n,a+1,1)] end
def fizzbuzz(i,n,3,b) do [:fizz|fizzbuzz(i+1,n,1,b+1)] end
def fizzbuzz(i,n,a,b) do [i|fizzbuzz(i+1,n,a+1,b+1)] end
##############

def decode([]) do [] end
def decode([{x,0}|t]) do decode(t) end
def decode([{x,v}|t]) do [x|decode([{x,v-1}|t])] end
#################
def zip([],[]) do [] end
def zip([h|t],[x|y]) do [{h,x}|zip(t,y)] end
#######################











end
