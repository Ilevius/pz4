function df = naive_diff(x,y)
    [n m] = size(x);
    df = zeros(n-1,2);
    df(:,1) = x(1:n-1);
    for i = 1:n-1
        dx = x(i+1)-x(i); dy = y(i+1) - y(i); df(i,2) = dx/dy;   
    end
end