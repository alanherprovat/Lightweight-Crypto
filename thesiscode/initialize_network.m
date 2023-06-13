function network = initialize_network(ilayer,hlayer,olayer)

    for i=1:hlayer
        for j=1:ilayer+1
             wti(j)=rand;
        end
        hidden_layer(i,:)=wti;
    end
%     disp(hidden_layer);
   network{1}=hidden_layer;
   for i=1:olayer
        for j=1:hlayer+1
             wth(j)=rand;
        end
        output_layer(i,:)=wth;
   end
%    disp(output_layer);
   network{2}=output_layer;
 
