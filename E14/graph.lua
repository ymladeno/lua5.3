local function name2node(graph, name)
  local node = graph[name]
  if not node then
    node = {name = name, adj = {}, weight = 0}
    graph[name] = node
  end
  return node
end

function readgraph()
  local graph = {}
  for line in io.lines() do
    local namefrom, nameto, label = string.match(line, "(%S+)%s+(%S+)%s+(%d+)")
    local from = name2node(graph, namefrom)
    local to = name2node(graph, nameto)
    local arc = {label = tonumber(label), next = to}
    from.adj[arc] = true
  end
  return graph
end

function findpath(curr, to, path, visited, distance)
  path = path or {}
  visited = visited or {}
  distance = distance or 0
  
  if visited[curr] then
    return nil
  end

  visited[curr] = true
  path[#path + 1] = curr
  if curr == to then
    return path, distance
  end

  for node in pairs(curr.adj) do
    distance = distance + node.label
    local p,d = findpath(node.next, to, path, visited, distance)
    if p then return p,d end
    distance = distance - node.label
  end
  table.remove(path)
end

function copytable(t)
  local t1 = {}
  for _,x in pairs(t) do
    t1[#t1+1] = x
  end
  return t1
end

shortest = {}
shortestDistance = 0
function findShortestPath(curr, to, path, visited, distance)
  visited = visited or {}
  path = path or {}
  distance = distance or 0

  visited[curr] = true
  path[#path + 1] = curr
  if curr == to then
    return path
  end

  for node in pairs(curr.adj) do
    distance = distance + node.label
    local p = findShortestPath(node.next, to, path, visited, distance)
    if p then
        if shortestDistance == 0 or distance < shortestDistance then
          shortestDistance = distance 
          shortest = copytable(path) 
        end
    end
    distance = 0
    table.remove(path)
  end
end

-- minimum spaining tree (dijkstra algoritm)
-- not finished
function mst(graph, curr, visited, distance)
  graph = graph or {}
  visited = visited or {}
  distance = distance or 0

  if visited[curr] then
    return
  end

  visited[curr] = true
  graph[curr.name] = curr

  local nearest = {}
  local label = 2^1024
  for node in pairs(curr.adj) do
    distance = distance + node.label
    if curr.weight == 0  or curr.weight > distance then
      curr.weight = distance
    end
  end
  
  mst(graph, visited, nearest)
end

function findShortestPath1(curr, to)
  local g = mst(curr)
  local from = node2name(g, curr.name)
  local to = node2name(g, to.name)
  local p = findpath(from, to)
  return p
end
-- not finished

function printpath(path)
  for i = 1, #path do
    print(path[i].name)
  end
end

g = readgraph()
a = name2node(g, "a")
b = name2node(g, "b")
print("First deep:")
p,d = findpath(a, b)
if p then printpath(p); print("Distance: ", d) end

print("Shortest path:")
findShortestPath(a, b)
printpath(shortest)
print(shortestDistance)
