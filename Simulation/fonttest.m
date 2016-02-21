plot(1:10)
h = title(gca,'Why won''t my font change?');

%The title comes out looking like courier. So I try this
set(h,'FontName','Open Sans Light') %No Change
set(h,'FontSize',20) %No Change
