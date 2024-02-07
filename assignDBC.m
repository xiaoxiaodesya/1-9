function [dbcsysmat, dbcrhs] = assignDBC(sysmat, rhs, dbc)
dbcsysmat = sysmat;
dbcrhs = rhs;
a = size(dbc, 1);
for i = 1:a
    dbcsysmat(dbc(i, 1), :) = 0;
    dbcsysmat(dbc(i, 1), dbc(i, 1)) = 1;
    dbcrhs(dbc(i, 1)) = dbc(i, 2);
end
end