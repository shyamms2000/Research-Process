function [output,count,pilot_sequence]=insert_pilot(pilot_inter,pilot_symbol,map_out_block)  % 5����״��Ƶ��OFDM���ţ�����С��1*1���ѵ��źţ�256��*100��
% pilot_interΪ��Ƶ���ż������ofdm���Ÿ�������ʽ������Ϊ���������Խ��������Խ��
% pilot_symbol_bit ���ó�����Ƶ���ţ�����������Ķ�������ʽ
% map_out_block ӳ����һ�η����������ķ��ſ�
  [N,NL]=size(map_out_block);%---------------------------------------------�õ��ѵ��źž�����������������д����������ز�������Ϊ256���д�������OFDM���ţ�����Ϊ100
  output=zeros(N,(NL+fix(NL/pilot_inter))); %------------------------------�õ����뵼Ƶ����������output��256��*120��
  pilot_sequence=pilot_symbol*ones(N,1);%----------------------------------�õ���״��Ƶ��ÿ����״��Ƶ�൱��һ��OFDM���ţ���Ϊ256��*1�У������ֵ��Ϊ-1+1i
  
  count=0;%----------------------------------------------------------------��¼���뵼Ƶ�źŵĴ���,һ��Ҫ��20����Ƶȫ�����뵽�ѵ��ź���ȥ
  i=1;
  while i<(NL+fix(NL/pilot_inter))%----------------------------------------ÿ��pilot_inter������(5��)����һ����Ƶ���У�i>120��ʱֹͣѭ��
      output(:,i)=pilot_sequence;%-----------------------------------------����Ƶ���Ÿ�ֵ��Output��ĳЩ�У�ÿ��5��OFDM���Ų���һ����Ƶ���ţ����뵼Ƶ
      count=count+1;%------------------------------------------------------Ȼ�����һ�β�ֵ
   if count*pilot_inter<=NL%-----------------------------------------------��20����Ƶ���Ų���֮ǰ���Ե��ƺ��OFDM����Ѱ�Ҳ�ֵ��Ϊ��λ��
      output(:,(i+1):(i+pilot_inter))=map_out_block(:,((count-1)*pilot_inter+1):count*pilot_inter);
   else%-------------------------------------------------------------------��20����Ƶ���Ų���֮�󣬽�ʣ���OFDM���ţ�ȫ������output�����������ȥ
      output(:,(i+1):(i+pilot_inter+NL-count*pilot_inter))=map_out_block(:,((count-1)*pilot_inter+1):NL);
   end
      i=i+pilot_inter+1;
  end

          