clear all
close all
clc
 

arduino=serialport('COM7',9600); 
fopen(arduino); 
VM(1)=0;
AM(1)=0;
CM(1)=0;
time(1)=0;
i=1;
tic;


while (toc<100)
   
   CM(2)=fscanf(arduino,'%f');
   time(2)=toc;
   figure(1);
   grid on;
   title('position');
   axis([toc-10, toc+10, 0, 500])
   xlabel('seconds');
   ylabel('cm');
   h(i)=plot(time,CM,'b','LineWidth',4);
   hold on
   if(CM(2)~=CM(1))
       VM(2)=((CM(2)-CM(1))/(100))/(time(2)-time(1));
   else 
       VM(2)=0;
   end

   
   
figure(2);
grid on;
title('velocity');
xlabel('seconds');
ylabel('m/s');
axis([toc-10, toc+10, -5, 5])
g(i)=plot(time,VM,'b','LineWidth',4);
hold on


   if(VM(2)~=VM(1))
       AM(2)=(VM(2)-VM(1))/(time(2)-time(1));
   else 
       AM(2)=0;
   end
   
   
figure(3);
grid on;
title('acceleration');
xlabel('seconds');
ylabel('m/s^2');
axis([toc-10, toc+10, -10, 10])
a(i)=plot(time,AM,'b','LineWidth',4);
hold on



 if(i >= 300)
   delete(h(i-299));
   delete(g(i-299));
   delete(a(i-299));
 end

 AM(1)=AM(2);
 VM(1)=VM(2);
 CM(1)=CM(2);
 time(1)=time(2);
i=i+1;
 
end