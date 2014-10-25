%归一化初始数据
function y_guiyi=guiyi(x)
for i=1:size(x)
xmin=min(x);
xmax=max(x);
y(i,:)=((x(i,:)-xmin)/(xmax-xmin))*(1.0-0.0);
end
y_guiyi=y;
