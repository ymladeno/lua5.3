function disk(cx,cy,r)
  return function (x,y)
    return (x-cx)^2 + (y-cy)^2 <=r^2
  end
end

function rect(left,right,bottom,up)
  return function (x,y)
    return left <=x and x<=right and
           bottom <=y and y <=up
  end
end

function difference(r1,r2)
  return function(x,y)
    return r1(x,y) and not r2(x,y)
  end
end

function translate(r,dx,dy)
  return function(x,y)
    return r(x-dx,y-dy)
  end
end

function translateAngel(r,angel)
  return function (x,y)
    return r(x*math.cos(angel),y*math.sin(angel))
  end
end

-- generate PBM file
function plot(r,M,N)
  io.write("P1\n",M," ",N,'\n') --header
  for i = 1,N do
    local y = (N-i*2)/N
    for j = 1,M do
      local x =(j*2-M)/M
      io.write(r(x,y) and "1" or "0")
    end
    io.write("\n")
  end
end

c1 = disk(0,0,1)
--plot(difference(c1, translate(c1,-0.3,0)), 500, 500)
r1 = rect(-0.5,0.5,-0.5,0.5)
r2 = translateAngel(r1,45)
plot(translateAngel(r1,45), 500, 500)
--plot(r1,500,500)