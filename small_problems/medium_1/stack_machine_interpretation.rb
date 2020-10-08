def minilang(orders)
  all_orders = orders.split
  stack = []
  register = [0]
  all_orders.each do |command|
    if command.to_i.to_s == command
      register[0] = command.to_i
    else
      process_order(command, stack, register)
    end
  end
  puts '******************************'
end

def process_order(order, stack, register)
  case order
  when 'PUSH'
    push(stack, register)
  when 'ADD'
    add(stack, register)
  when 'SUB'
    sub(stack, register)
  when 'MULT'
    mult(stack, register)
  when 'DIV'
    div(stack, register)
  when 'MOD'
    mod(stack, register)
  when 'POP'
    pop(stack, register)
  when 'PRINT'
    print(register)
  end
end

def push(stack, register)
  stack.push(register[0])
end

def add(stack, register)
  register[0] += stack.pop
end

def sub(stack, register)
  register[0] -= stack.pop
end

def mult(stack, register)
  register[0] *= stack.pop
end

def div(stack, register)
  register[0] /= stack.pop
end

def mod(stack, register)
  register[0] %= stack.pop
end

def pop(stack, register)
  register[0] = stack.pop
end

def print(register)
  puts register[0]
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)


