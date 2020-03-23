defmodule R do

def reduce([]) do [] end
def reduce([h,h|t]) do reduce([h|t]) end
def reduce([h|t]) do [h|reduce(t)] end
#########


def once([]) do {0,0} end
def once([],sum,lenght) do {sum,lenght} end
def once([h|t]) do once([h|t],0,0) end
def once([h|t],sum,lenght) do once(t,sum+h,lenght+1) end

######

def eval([]) do 0 end
def eval([h]) do h end
def eval([h1,h2,h3|t]) do
  if h2 == '+' do eval([h1+h3|t])
else eval([h1-h3|t])end
end

####

def miror(:nil) do nil end
def miror({:trad,value,left,right}) do
    {:trad,value,miror(right),miror(left)}
end
####

def reverse(l) do reverse(l,[]) end
def reverse([],rev) do rev end
def reverse([h|t],rev) do reverse(t,[h|rev]) end
###########

def append(l1,l2) do
  case l1 do
    [] -> l2
    [h|t] -> [h |append(t,l2)] end
end

############

def f_append(a, b) do reverse(reverse(a), b) end







#######################
def fizzbuzz(n) do fizzbuzz(1,n+1,1,1) end
def fizzbuzz(n,n,_,_) do [] end
def fizzbuzz(i,n,3,5) do [:fizzbuzz | fizzbuzz(i+1,n,1,1)] end
def fizzbuzz(i,n,3,b) do [:fizz | fizzbuzz(i+1,n,1,b+1)] end
def fizzbuzz(i,n,a,5) do [:buzz | fizzbuzz(i+1,n,a+1,1)] end
def fizzbuzz(i,n,a,b) do [i | fizzbuzz(i+1,n,a+1,b+1)] end
#######

def decode([]) do [] end
def decode([{elem, 0}|code]) do decode(code) end
def decode([{elem,n}|code]) do [elem|decode([{elem, n-1}|code])] end

#################

def zip([],[]) do [] end
def zip([h|t],[x|y]) do [{h,x}|zip(t,y)] end

##############

def calc(l,x) do calc(l,x,0) end
def calc([],_x,svar) do svar end
def calc([h|t],x,svar) do calc(t,x, h+ x*svar) end
##############

def freq(key,[]) do [{key,1}] end
def freq(key,[{key,f}|rest]) do [{key,f+1}|rest] end
def freq(key,[{k,f}|rest]) do [{k,f}| freq(key,rest)] end

#####

def fraq([]) do  []  end
def fraq([h|t]) do freq(h,fraq(t))  end

##########

def flatten([]) do [] end

def flatten([h|t]) do append(flatten(h),flatten(t)) end
def flatten(x) do [x] end


#################

def drop(l,n) do drop(l,n,n) end
def drop([],_,_) do [] end
def drop([h|t],n,1) do drop(t,n,n) end
def drop([h|t],n,i) do [h|drop(t,n,n-1)] end

##################

def rotate(l,n) do rotate(l,n,[]) end
def rotate([h|t],0,list) do append([h|t],reverse(list)) end
def rotate([h|t],n,list) do rotate(t,n-1,[h|list]) end
####################

def nth(1, {:leaf, val}) do {:found, val} end
def nth(n, {:leaf, _}) do {:cont, n-1} end
def nth(n, {:node, left, right}) do
case nth(n, left) do
  {:found, val} -> {:found, val}
  {:cont, n} -> nth(n, right)
                  end
                                end


###########


def hp35(seq) do hp35(seq,[]) end
def hp35([],rest) do rest end
def hp35([:add|t],[a,b|rest]) do hp35(t,[a+b|rest]) end
def hp35([:sub|t],[a,b|rest]) do hp35(t,[b-a|rest]) end
def hp35([h|t],rest) do hp35(t,[h|rest]) end


#########
def pascal(1) do [1] end
def pascal(n) do [1 | next(pascal(n-1))] end

def next([]) do [] end
def next([h]) do [h] end
def next([a,b|rest]) do [a+b | next([b|rest])] end

###########

def eval1({:add, x, y}) do
eval1(x) + eval1(y)
end
def eval1({:mul, x, y}) do
eval1(x) * eval1(y)
end
def eval1({:neg, x}) do
- eval1(x)
end
def eval1(x) do
x
end
##########

def gray(0) do [[]] end
def gray(n) do
g1 = gray(n-1)
r1 = reverse(g1)
append( update(g1, 0), update(r1, 1))
end
def update([], _) do [] end
def update([h|t], b) do
[[b|h]| update(t,b)]
end






end
