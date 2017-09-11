 close all;
clear all;
clc;

%a = xlsread('lihongbo_run2.xlsx');
string_name = 'get_data20170828182244(1)';
fid = fopen([string_name,'.txt']);
read_txt = textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s','EmptyValue', -Inf);
fclose(fid);


tmp_1 = read_txt{1};        % time
tmp_2 = read_txt{2};        % hr_value_wrist 
tmp_3 = read_txt{3};        % PPG1_high    
tmp_4 = read_txt{4};        % PPG1_low
tmp_5 = read_txt{5};        % acc1
tmp_6 = read_txt{6};        % acc2
tmp_7 = read_txt{7};        % PPG2_high  
tmp_8 = read_txt{8};        % PPG2_low
tmp_9 = read_txt{9};        % acc3
tmp_10 = read_txt{10};      % acc4
tmp_11 = read_txt{11};      % PPG3_high  
tmp_12 = read_txt{12};      % PPG3_low
tmp_13 = read_txt{13};      % acc5
tmp_14 = read_txt{14};      % acc6
tmp_15 = read_txt{15};      % PPG4_high  
tmp_16 = read_txt{16};      % PPG4_low
tmp_17 = read_txt{17};      % acc7
tmp_18 = read_txt{18};      % acc8
tmp_19 = read_txt{19};      
tmp_20 = read_txt{20};      
tmp_21 = read_txt{21};      % serial num
     



tmp = [tmp_1,tmp_2,tmp_3,tmp_4,tmp_5,tmp_6,tmp_7,tmp_8,tmp_9,tmp_10, ...
    tmp_11,tmp_12,tmp_13,tmp_14,tmp_15,tmp_16,tmp_17,tmp_18,tmp_19,tmp_20,tmp_21];

row_num = find(~strcmp(tmp_21,''));
tmp_valid = tmp(row_num,:);

%hr_value polar
%hr_value_polar = tmp_valid(:,2);
%hr_value_polar_num = hex2dec(hr_value_polar);

%hr_value wrist
hr_value_wrist = tmp_valid(:,2);
hr_value_wrist_num = hex2dec(hr_value_wrist);

% gsensor 
% gsensor_x = [tmp_valid(:,4),tmp_valid(:,7),tmp_valid(:,10),tmp_valid(:,13)];
% gsensor_y = [tmp_valid(:,5),tmp_valid(:,8),tmp_valid(:,11),tmp_valid(:,14)];
% gsensor_z = [tmp_valid(:,6),tmp_valid(:,9),tmp_valid(:,12),tmp_valid(:,15)];
acc = [tmp_valid(:,5),tmp_valid(:,6),tmp_valid(:,9),tmp_valid(:,10),tmp_valid(:,13),tmp_valid(:,14),tmp_valid(:,17),tmp_valid(:,18)];

%gsensor_x_num = hex2dec(gsensor_x');
%gsensor_y_num = hex2dec(gsensor_y');
%gsensor_z_num = hex2dec(gsensor_z');
acc_num = hex2dec(acc');
len_acc_num  = length(acc_num(:,1));

% ppg
ppg1 = [tmp_valid(:,3),tmp_valid(:,4)];
ppg2 = [tmp_valid(:,7),tmp_valid(:,8)];
ppg3 = [tmp_valid(:,11),tmp_valid(:,12)];
ppg4 = [tmp_valid(:,15),tmp_valid(:,16)];

pp1_com = strcat(ppg1(:,1),ppg1(:,2));
pp2_com = strcat(ppg2(:,1),ppg2(:,2));
pp3_com = strcat(ppg3(:,1),ppg3(:,2));
pp4_com = strcat(ppg4(:,1),ppg4(:,2));

pp1_num = hex2dec(pp1_com);
pp2_num = hex2dec(pp2_com);
pp3_num = hex2dec(pp3_com);
pp4_num = hex2dec(pp4_com);
ppg_num = [pp1_num,pp2_num,pp3_num,pp4_num];
len_ppg_num = length(ppg_num);
ppg_reshape = reshape(ppg_num',len_ppg_num*4,1);


figure(1);
t_acc = 1:1:len_acc_num;
plot(t_acc,acc_num,'r.-');


figure(2);
len_ppg_reshape = length(ppg_reshape);
t_ppg_reshape = 1:1:len_ppg_reshape;
plot(t_ppg_reshape,ppg_reshape,'g.-');

figure(3);
%plot(hr_value_polar_num,'r.-');
hold on;
plot(hr_value_wrist_num,'b.-');

% Êý¾Ý´æ´¢
% % aac_data = (gsensor_x_num-128).*(gsensor_x_num-128) + (gsensor_y_num-128) ...
% %     .* (gsensor_y_num-128) + (gsensor_z_num-128) .* (gsensor_z_num-128);
% % acc_data_sqrt = sqrt(aac_data);
% % 
% % acc_data_sqrt_int = floor(acc_data_sqrt);
% % len_acc_data_sqrt_int = length(acc_data_sqrt_int);
% % acc_data_sqrt_int_reshape = reshape(acc_data_sqrt_int,2,len_acc_data_sqrt_int/2);
% % acc_data_sqrt_int_reshape = acc_data_sqrt_int_reshape';
% % 
% % data_out = [ppg_reshape,acc_data_sqrt_int_reshape(:,1)];
% % dlmwrite('ppg_gsensor_raw_data.txt', data_out,'delimiter','\t');
% % 
% % data_out2 = [hr_value_polar_num,hr_value_wrist_num];
% % dlmwrite('hr_polar_wrist_data.txt', data_out2,'delimiter','\t');




%plot(t_fft_time,fft_time);
%hold on;


