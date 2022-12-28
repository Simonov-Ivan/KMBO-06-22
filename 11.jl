"11. ДАНО: Робот - в произвольной клетке ограниченного 
прямоугольного поля, на поле расставлены горизонтальные 
перегородки различной длины (перегорки длиной в несколько 
клеток, считаются одной перегородкой), не касающиеся 
внешней рамки.
РЕЗУЛЬТАТ: Робот — в исходном положении, подсчитано и 
возвращено число всех перегородок на поле."


using HorizonSideRobots
r=Robot(animate=true)
function rCountPartt(robot)
    side = Ost
    count = 0
    cCheck = 0
    cTotal = 0
    while !isborder(robot, side)
        move!(robot, side)

        if isborder(robot, Nord)

            count += 1;
            cCheck += 1
        else 
            if count == 0 || cCheck == 0
                cTotal += 0
            else 
                cTotal += count / cCheck
                count = 0
                cCheck = 0
            end
        end
        if isborder(robot, side) && !isborder(robot, Nord)
            move!(robot, Nord)  
            
            side = inverse(side)
            count = 0
            cCheck = 0
        end
    end
    return cTotal
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
rCountPartt(r)