defmodule R do


def nth(n,[]) do [] end
def nth(0,[h|t]) do [h] end
def nth(n,[h|t]) do nth(n-1,  t) end
##

def len([]) do 0 end
def len([h|t]) do 1+ len(t) end
##

def sum([]) do 0 end
def sum([h|t]) do h + sum(t) end

##

def duplicate([]) do [] end
def duplicate([h|t]) do [h,h|duplicate(t)] end

##

def add(x,[]) do [x] end
def add(x,[x|t]) do [x|t] end
def add(x,[h|t]) do [h|add(x,t)] end
##

def remove(_,[]) do [] end
def remove(x,[x|t]) do remove(x,t) end
def remove(x,[h|t]) do [h|remove(x,t)] end
##

def unique([]) do [] end
def unique([h|t]) do [h|unique(remove(h,t))] end

###

def pack([]) do [] end
def pack([h|t]) do
 {all,rest} = match(h,t,[h],[])
 [all|pack(rest)] end


def match(_,[],all,rest) do {all,rest} end
def match(x,[x|t],all,rest) do match(x,t,[x|all],rest) end
def match(x,[h|t],all,rest) do match(x,t,all,[h|rest]) end
##

def naive_reverse([]) do [] end
def naive_reverse([h|t]) do naive_reverse(t) ++ [h] end

##
def reverse(l) do reverse(l,[]) end
def reverse([],rev) do rev end
def reverse([h|t],rev) do reverse(t,[h|rev]) end
##
def append(l1,l2) do
   case l1  do
   [] -> l2
   [h|t] -> [h|append(t,l2)]

end
end


##
def drop(list,n) do drop(list,n,n) end
def drop([],_,_) do [] end
def drop([h|t],1,n) do drop(t,n,n) end
def drop([h|t],i,n) do [h|drop(t,i-1,n)] end
##

def rotate(list,n) do rotate(list,n,[]) end
def rotate(t,0,rest) do append(t,reverse(rest)) end
def rotate([h|t],n,rest) do rotate(t,n-1,[h|rest]) end
##

def nth(1, {:leaf, val}) do {:found, val} end
def nth(n, {:leaf, _}) do {:cont, n-1} end
def nth(n, {:node, left, right}) do
case nth(n, left) do
{:found, val} ->
{:found, val}
{:cont, k} ->
nth(k, right)
end
end
##

def hp35(seq) do hp35(seq,[]) end
def hp35([],[res|_]) do res end
def hp35([:add|rest],[a,b|stack]) do hp35(rest,[a+b|stack]) end

def hp35([h|rest],[stack]) do hp35(rest,[h|stack]) end


####

def reduce([]) do [] end
def reduce([h,h|t]) do reduce([h|t]) end
def reduce([h|t]) do [h| reduce(t)] end

####
def once([]) do {0,0} end
def once([],sum,length) do {sum,length} end
def once([h|t]) do once([h|t],0,0) end
def once([h|t],sum,length) do once(t,sum+h,length+1) end
#####

def eval([]) do 0 end
def eval([h]) do h end
def eval([h1,h2,h3|t]) do
  if h2 == '+' do [h1+h2|eval(t)]
else [h1-h3|eval(t)]
end
end
##

def isomorfic(:nil,:nil) do true end
def isomorfic({:node,_,l1,r1},{:node,_,l2,r2}) do
  case isomorfic(l1,l2) do
    true -> isomorfic(r1,r2)
    false -> false
  end

end

def isomorfic(_,_) do false end

#####

def miror(:nil) do nil end
def miror({:node,v,l,r}) do {:node,v,miror(r),miror(l)} end

############

def transf(_,_,[]) do [] end
def transf(x,y,[x|t]) do transf(x,y,t) end
def transf(x,y,[h|t]) do [y*h|transf(x,y,t)] end

##########

def sum1(l) do sum1(l,0) end
def sum1([],t) do t end
def sum1([h|t],x) do sum1(t,x+h) end

###

 def sum_t(:nil) do 0 end
 def sum_t({:node,v,l,r}) do v + sum_t(l) + sum_t(r) end
##########











end
