#include <stdio.h>
#include <windows.h>
#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
using namespace std;
string str;
string gto;
int once=0;
int lagresolve;
int nine=9999;
int more=1000;
int point=0;
int number=0;
int reset=0;
string helpim="";
int stop=0;
int a=0;     
int A;
string slash="\\";
int seek=1;
int B;
int speculative=0;
int C;
int D;
int Milliseconds[99999];
string Username[99999];
string Action[99999];
string Parameters[99999];           
int HACKPAUSE=0;
int falsepositives=2;
int zergmineralhack=0;
int twenty=0; //get the point if someone hacks
int ticker=0;
int namecheck=0;
int yes=0;
int E;
int F;
int G;
int H;
int i=0;
int I;
int x=0;
int y=0;
int z=0;
string b="";  //player name
string c="";  //action}
string d;     //Parameters]
string Names[99999];
string Detected[99999]; 
int Milli[99999]; 
int HackOccurances=0; 
int restart=1;
int bailrepeat;



int HackerTextExport()
{
lagresolve=HackOccurances;
lagresolve--;
bailrepeat=0;
if(lagresolve==0)
{
lagresolve++;
}
while(lagresolve>0)
{
     if((Milli[lagresolve]==a) && (Detected[lagresolve]==b) && (Names[lagresolve]==c))
     {
     bailrepeat==1;
     }
lagresolve--;
} 
       if(bailrepeat!=1)
       {
       Milli[HackOccurances]=a;    
       Detected[HackOccurances]=b; //stores names 
       Names[HackOccurances]=c;    //stores method
       HackOccurances++;
       restart=0;
       }
       }




//system("RepConvert.bat");
int main()
{
cout<<"************************************************************************"<<endl;
int zehn=5;
while(zehn>0)
{
cout<<"*                                                                      *"<<endl;
zehn--;
}
cout<<"*                            Hacker Scanner V1.04                      *"<<endl;
cout<<"*                                  By:Odor                             *"<<endl;
cout<<"*       Special thanks to GnarTheDwarf for his contribution in this.   *"<<endl;
cout<<"*                                                                      *"<<endl;
zehn=5;
while(zehn>0)
{
cout<<"*                                                                      *"<<endl;
zehn--;
}
cout<<"************************************************************************"<<endl<<endl<<endl;

cout<<"0 only adds the names in hacker.txt and is much faster. [RECOMMENDED]"<<endl;
cout<<"1 shows who hacked while it's scanning and adds the names to hacker.txt. "<<endl;
cout<<endl<<"                       Enter 0 [RECOMMENDED] or 1: ";
yes=0;
cin>>yes;
cout<<endl<<endl;
cout<<"Would you like to disable suspicious scanning and only search for 100% hackers, suspicious scanning will greatly increase scan time"<<endl;
cout<<endl<<"                       Enter 0 [RECOMMENDED] for yes and 1 for no: ";

cin>>speculative;

cout<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl;
cout<<"Which directory are you scanning"<<endl;
cout<<"Press 1 C:/Program Files/Starcraft/maps/replays"<<endl;
cout<<"Press 2 C:/Program Files/Starcraft/maps/autoreplay"<<endl;
cout<<"Press 3 D:/Program Files/Starcraft/maps/replays"<<endl;
cout<<"Press 4 D:/Program Files/Starcraft/maps/autoreplay"<<endl;
cout<<"Press 5 E:/Program Files/Starcraft/maps/replays"<<endl; 
cout<<"Press 6 E:/Program Files/Starcraft/maps/autoreplay"<<endl;
cout<<"Press 7 C:/program files/starcraft/maps/replays/autoreplay"<<endl;
cout<<"Press 8 Type your own replay folder in manually"<<endl;
cout<<endl<<endl<<"Which replay directory do you want to scan? Enter 1 2 3 4 5 6 7 or 8: ";
cin>>seek;
cout<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl;
string fudge[nine];
int Milliseconds[99999];
string Username[99999];
string Action[99999];
string Parameters[99999];           
string bestmulti[99999];
int HACKPAUSE=0;
int falsepositives=2;
int zergmineralhack=0;
int twenty=0; //get the point if someone hacks
int ticker=0;
int reset=0;

cout<<endl<<endl;  
string wow="C:Program Files\\Starcraft\\maps\\replays\\";
string wow2="C:Program Files\\Starcraft\\maps\\replays";
if(seek==1)
{
wow="C:\\Program Files\\Starcraft\\maps\\replays\\";
wow2="C:\\Program Files\\Starcraft\\maps\\replays";
ofstream RepConvert;
RepConvert.open ("RepConvert.Bat");
RepConvert<<"RepConvert " <<('"') <<wow2<<('"')<<" " <<('"') <<wow2<<('"');
RepConvert.close();
system("RepConvert.bat");
}

if(seek==2)
{
wow="C:\\Program Files\\Starcraft\\maps\\autoreplay\\";
wow2="C:\\Program Files\\Starcraft\\maps\\autoreplay";
ofstream RepConvert;
RepConvert.open ("RepConvert.Bat");
RepConvert<<"RepConvert " <<('"') <<wow2<<('"')<<" " <<('"') <<wow2<<('"');
RepConvert.close();
system("RepConvert.bat");

}
if (seek==3)
{
wow="D:\\Program Files\\Starcraft\\maps\\replays\\";
wow2="D:\\Program Files\\Starcraft\\maps\\replays";
ofstream RepConvert;
RepConvert.open ("RepConvert.Bat");
RepConvert<<"RepConvert " <<('"') <<wow2<<('"')<<" " <<('"') <<wow2<<('"');
RepConvert.close();
system("RepConvert.bat");
}
if (seek==4)
{
wow="D:\\Program Files\\Starcraft\\maps\\autoreplay\\";
wow2="D:\\Program Files\\Starcraft\\maps\\autoreplay";
ofstream RepConvert;
RepConvert.open ("RepConvert.Bat");
RepConvert<<"RepConvert " <<('"') <<wow2<<('"')<<" " <<('"') <<wow2<<('"');
RepConvert.close();
system("RepConvert.bat");
}
if (seek==5)
{
wow="E:\\Program Files\\Starcraft\\maps\\replays\\";
wow2="E:\\Program Files\\Starcraft\\maps\\replays";
ofstream RepConvert;
RepConvert.open ("RepConvert.Bat");
RepConvert<<"RepConvert " <<('"') <<wow2<<('"')<<" " <<('"') <<wow2<<('"');
RepConvert.close();
system("RepConvert.bat");
}
if (seek==6)
{
wow="E:\\Program Files\\Starcraft\\maps\\autoreplay\\";
wow2="E:\\Program Files\\Starcraft\\maps\\autoreplay";
ofstream RepConvert;
RepConvert.open ("RepConvert.Bat");
RepConvert<<"RepConvert " <<('"') <<wow2<<('"')<<" " <<('"') <<wow2<<('"');
RepConvert.close();
system("RepConvert.bat");
}

if (seek==7)
{
wow="C:\\program files\\starcraft\\maps\\replays\\autoreplay\\"; 
wow2="C:\\program files\\starcraft\\maps\\replays\\autoreplay"; 
ofstream RepConvert;
RepConvert.open ("RepConvert.Bat");
RepConvert<<"RepConvert " <<('"') <<wow2<<('"')<<" " <<('"') <<wow2<<('"');
RepConvert.close();
system("RepConvert.bat");

}

if (seek==8)
{
cout<<"You MUST manually edit RepConvert.Bat for this to work"<<endl;
cout<<"Enter your specific directory you would like to scan."<<endl<<"This DOESN'T support spaces!"<<endl<<"Sample below and don't forget the two ending slashes"<<endl
<<"C:\\"<<slash<<"myreplays\\"<<slash<<"starcraft\\"<<slash<<"autoreplay"<<slash<<slash<<endl<<endl; 
cin>>wow;
system("RepConvert.bat");
}
cout<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<endl<<"Start hacker scanner"<<endl;
system("pause");

string path = wow;            
string searchPattern = "*.txt";
string fullSearchPath = path + searchPattern;
WIN32_FIND_DATA FindData;
HANDLE hFind;
hFind = FindFirstFile( fullSearchPath.c_str(), &FindData );
if( hFind == INVALID_HANDLE_VALUE )
{
cout << "Error searching directory place the replays in Starcraft Replays directory";
return -1;
}
do
{
string filePath = path + FindData.cFileName;
ifstream in( filePath.c_str() );    
if( in )
{
cout<<endl<<endl<<"                "<<FindData.cFileName<<endl;

         while(in) 
         {                   
         in>>a;
         in>>b;
         in>>c;
         in>>d;
         in.ignore(100, '\n'); 
         Milliseconds[ticker]=a;
         Username[ticker]=b;
         Action[ticker]=c;
         Parameters[ticker]=d;
         ticker++;
         }
                                  
                                 if(! in)
                                 {
                                 reset=1;
                                 ticker=0;        
                                 }
                   
if(reset==1)                               
{
               
  
/* Do not edit above this line Do not edit above this line Do not edit above this line Do not edit above this line Do not edit above this line */
			           /*                 #1  Autosplit Hack    @Bnet latency              */             
                                 reset=0;
                                 while(reset<100)
                                 {
                                 if((Milliseconds[reset]==5)&& (Milliseconds[reset]==Milliseconds[reset+1]))
                                 {
                                 if (yes==1)
                                 { 
                                 cout<<Username[reset]<<" #1 Autosplit at "<< Milliseconds[reset]<< " milliseconds." <<endl;
                                 }
                                 a=Milliseconds[reset];
                                 b=Username[reset];
                                 c="#1_Autosplit_Method";     
                                 HackerTextExport(); //for exporting
                                 HACKPAUSE=1;
                                 } 
                                 reset++; 
                                 }
                                 
                       /*                              #2  Autosplit Hack    @Chaos latency                             */
                                 reset=0;
                                 while(reset<100)
                                 {
                                 if((Milliseconds[reset]==2 && (Username[reset] == Username[reset+1]) && (Username[reset+1] == Username[reset+2])))   
                                 {
                                 if (yes==1)
                                 {
                                 cout<<Username[reset]<<" #1 Autosplit at "<< Milliseconds[reset]<<" milliseconds." <<endl;
                                 }
                                 a=Milliseconds[reset];
                                 b=Username[reset];
                                 c="#1_Autosplit_Method";     
                                 HackerTextExport(); //for exporting
                                 HACKPAUSE=1;            
                                 }
                                 reset++; 
                                 } 


        
                         
                                                  
                   

/* #4  Protoss Carriers Multiselect                 */                              
stop=0;
falsepositives=2;
twenty=10; //just reusing the variable
reset=100;
while(reset<99999)
{  
reset++;  
                
                             /* Zerg Mineral Hacked     embedded from within                        */
                                         if(Milliseconds[reset]==Milliseconds[reset+1])
                                         {                                                                                         
                                                  if((Username[reset] == Username[reset+1]))
                                                  {                                                                         
                                                           if((Action[reset]=="Hatch") && (Action[reset+1]=="Cancel"))
                                                           {                                                       
                                                                   if((Parameters[reset]=="Drone") && (Parameters[reset+1]=="Train"))
                                                                   {
                                                                          if(twenty<20)
                                                                          {
                                                                          if (yes==1)
                                                                          {
                                                                          cout<<Username[reset]<<" #2 Zerg Mineral Hacked at "<< Milliseconds[reset]<<" milliseconds"<<endl;
                                                                          }
                                                                          a=Milliseconds[reset];
                                                                          b=Username[reset];
                                                                          c="#2_Zerg_Mineral_Hacked";     
                                                                          HackerTextExport(); //for exporting
                                                                          twenty++;
                                                                          reset++;
                                                                          }
                                                                   }
                                                           } 
                                                  }
                                         }        
                
                
                
                if((Milliseconds[reset] == Milliseconds[reset+1] && Milliseconds[reset+1] == Milliseconds[reset+2]))         // Without Chaos Plugin Version
                {   
                if((Username[reset] == Username[reset+1] && Username[reset+1] == Username[reset+2]))            // Without Chaos Plugin Version
                {                                                                                                                       // Without Chaos Plugin Version    
                if((Action[reset]=="Select") && (Action[reset+1]=="Arm") && (Action[reset+2]=="Shift"))         // Without Chaos Plugin Version
                {                                        
                if (falsepositives>0)
                {                                        
                falsepositives--;       
                }
                if (falsepositives<1)
                {
                if(stop<5)
                {
                stop++;
                if (yes==1)
                {
                cout<<Username[reset]<<" #3 Multiselection at "<< Milliseconds[reset]<< " milliseconds."<<endl;
                }
                twenty--;
                a=Milliseconds[reset];
                b=Username[reset];
                c="#3_Multiselection";     
                HackerTextExport(); //for exporting
                twenty++;
                HACKPAUSE=1;
                reset++;
                }
                                                                            
                }                    
                } 
                                        }
                                   } 
                                                      
                }
/* #5  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  Attack  */

reset=200;
stop=0;
while(reset<70000)
{
reset++;                      
                                        if((Milliseconds[reset]==Milliseconds[reset+3])) 
                                        {
                                                                                         
                                        if((Username[reset]==Username[reset+1]) && (Username[reset+1]==Username[reset+2]) && (Username[reset+2]==Username[reset+3]))
                                        {
                                                                                
                                        if((Action[reset]=="Select") && (Action[reset+1]=="Attack") && (Action[reset+2]=="Select") && (Action[reset+3]=="Attack"))
                                        {   
                                        x=reset; //needed for below 
                                        reset=reset+4;     
                                        a=0;
                                               while(a<10)
                                               {
                                                          
                                                          if((Milliseconds[reset]==Milliseconds[reset+3]))
                                                          {
                                                          if((Username[reset]==Username[reset+1]) && (Username[reset+1]==Username[reset+2]) && (Username[reset+2]==Username[reset+3])&& (Username[reset+2]==Username[x]))
                                                          { 
                                                          if(Username[reset]==Username[x])
                                                          {                                     
                                                          if((Action[reset]=="Select") && (Action[reset+1]=="Attack") && (Action[reset+2]=="Select") && (Action[reset+3]=="Attack") || (Action[reset]=="Attack") && (Action[reset+1]=="Select") && (Action[reset+2]=="Attack") && (Action[reset+3]=="Select"))      
                                                          {         
                                                          x=Milliseconds[reset];
                                                                             
                                                                                if(stop<5)
                                                                                {
                                                                                if(x != a) //prevents repeating at same millisecond
                                                                                {         
                                                                                stop++;
                                                                                if (yes==1)
                                                                                {
                                                                                cout<<Username[reset]<<" #3 Multiselection At "<< Milliseconds[reset]<<endl;                             
                                                                                }
                                                                                a=Milliseconds[reset];
                                                                                b=Username[reset];
                                                                                c="#3_Multiselection";     
                                                                                HackerTextExport(); //for exporting
                                                                                y=10; 
                                                                                HACKPAUSE=1;
                                                                                reset++;
                                                                                }
                                                                                }
                                                                                    
                                                          
                                                          }
                                                          }
                                                          }
                                                          }
                                                          a++;
                                                          }
                                              
                                              
                                              }}}
                                        
}

/*  Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather Gather */
reset=200;
stop=0;
once=0;
while(reset<70000)
{
reset++;                                
                                        if((Milliseconds[reset]==Milliseconds[reset+4])) 
                                        {
                                                                                         
                                        if((Username[reset]==Username[reset+1]) && (Username[reset+1]==Username[reset+2]) && (Username[reset+2]==Username[reset+3]) && (Username[reset+3]==Username[reset+4]) && (Username[reset+4]==Username[reset+5]))
                                        {
                                                                                
                                        if((Action[reset]=="Select") && (Action[reset+1]=="Select") && (Action[reset+2]=="Gather") && (Action[reset+3]=="Select") && (Action[reset+4]=="Select") && (Action[reset+5]=="Gather"))
                                        {   
                                        x=Milliseconds[reset];
                                              
                                                                                if(stop<10)
                                                                                {
                                                                                    if(x != a) //prevents repeating at same millisecond
                                                                                    {         
                                                                                    
                                                                                    stop++;
                                                                                    a=Milliseconds[reset];
                                                                                    b=Username[reset];
                                                                                    c="#4_Suspicious_Likely_Multiselection_Review_Player_With_Bwchart";    
                                                                                    HackerTextExport(); //for exporting
                                                                                    HACKPAUSE=1;
                                                                                    reset++;
                                                                                    }
                                                                                }
                                                                                    
                                                          
                                                         
                                              
                                              
                                              }}}
}
/* #7  Extreme Multiselect Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move Move */
reset=200;
stop=0;
while(reset<70000)
{
reset++;                               
x=Milliseconds[reset];
y=Milliseconds[reset+14];
                   if(x+5>=y)
                   {
                                        if((Milliseconds[reset]==Milliseconds[reset+15])) 
                                        {                                                                                         
                                        if((Username[reset]==Username[reset+1]) && (Username[reset+1]==Username[reset+2]) && (Username[reset+2]==Username[reset+3]) && (Username[reset+3]==Username[reset+4]) && (Username[reset+4]==Username[reset+5]) && (Username[reset+5]==Username[reset+6]) && (Username[reset+6]==Username[reset+7]) && (Username[reset+7]==Username[reset+8]) && (Username[reset+8]==Username[reset+9]) && (Username[reset+9]==Username[reset+10]) && (Username[reset+11]==Username[reset+12]) && (Username[reset+12]==Username[reset+13]) && (Username[reset+13]==Username[reset+14]))
                                        {                                       
                                        if((Action[reset]=="Select") && (Action[reset+1]=="Move") && (Action[reset+2]=="Select") && (Action[reset+3]=="Move") && (Action[reset+4]=="Select") && (Action[reset+5]=="Move") && (Action[reset+6]=="Select") && (Action[reset+7]=="Move") && (Action[reset+8]=="Select") && (Action[reset+9]=="Move") && (Action[reset+10]=="Select") && (Action[reset+11]=="Move") && (Action[reset+12]=="Select") && (Action[reset+13]=="Move") && (Action[reset+14]=="Select"))
                                        {   
                                          if(stop<10)
                                          {
                                          if(x != a) //prevents repeating at same millisecond
                                          {                                          
                                          stop++;
                                          if (yes==1)
                                          {
                                          cout<<Username[reset]<<" #3 Multiselection At "<< Milliseconds[reset]<<endl;                             
                                          }
                                          a=Milliseconds[reset];
                                          b=Username[reset];
                                          c="#3_Multiselection";     
                                          HackerTextExport(); //for exporting
                                          HACKPAUSE=1;
                                          reset++;
                                          }
                                          }
                                        }                                        
                                        }                               
                                        }
                   }                                       
}
/* #8    Multiselect Move Method -------------------------------------------------------------------- #9 Multiselect Move Method       */
reset=200;
stop=0;
while(reset<70000)
{
reset++;                      
                                        if((Milliseconds[reset]==Milliseconds[reset+3])) 
                                        {
                                                                                         
                                        if((Username[reset]==Username[reset+1]) && (Username[reset+1]==Username[reset+2]) && (Username[reset+2]==Username[reset+3]))
                                        {
                                                                                
                                        if((Action[reset]=="Select") && (Action[reset+1]=="Move") && (Action[reset+2]=="Select") && (Action[reset+3]=="Move") || (Action[reset]=="Move") && (Action[reset+1]=="Select") && (Action[reset+2]=="Move") && (Action[reset+3]=="Select"))      
                                        {   
                                        x=reset; //needed for below 
                                        y=Milliseconds[reset];
                                        reset=reset+4;     
                                               while(a<10)
                                               {
                                               a++;
                                                          if(Username[reset]==Username[x])
                                                          {
                                                          if((Milliseconds[reset]==Milliseconds[reset+3]))
                                                          {       
                                                          if((Username[reset]==Username[reset+1]) && (Username[reset+1]==Username[reset+2]) && (Username[reset+2]==Username[reset+3])&& (Username[reset+2]==Username[x]))
                                                          {               
                                                          if((Action[reset]=="Select") && (Action[reset+1]=="Move") && (Action[reset+2]=="Select") && (Action[reset+3]=="Move") || (Action[reset]=="Move") && (Action[reset+1]=="Select") && (Action[reset+2]=="Move") && (Action[reset+3]=="Select"))      
                                                          {                                                          
                                                          z=Milliseconds[reset+3]; 
                                                                                if((y+5)>=z)
                                                                                {
                                                                                if(stop<5)
                                                                                {
                                                                                stop++;
                                                                                if (yes==1)
                                                                                {
                                                                                cout<<Username[reset]<<" #3 Multiselection At "<< Milliseconds[reset]<<endl;                             
                                                                                }
                                                                                a=Milliseconds[reset];
                                                                                b=Username[reset];
                                                                                c="#3_Multiselection";     
                                                                                HackerTextExport(); //for exporting
                                                                                y=10; 
                                                                                HACKPAUSE=1;
                                                                                reset++;
                                                                                }
                                                                                }
                                                          }                 
                                                          }
                                                          }
                                                          }
                                                          }
                                                          }
                                                   reset++;
                                                          }
                                              
                                              
                                              }}
/*   #9 Multiselect Patrol Method -------------------------------------------------------------------- Multiselect Patrol Method       */
reset=200;
stop=0;
while(reset<70000)
{
reset++;                      
                                        if((Milliseconds[reset]==Milliseconds[reset+3])) 
                                        {
                                                                                         
                                        if((Username[reset]==Username[reset+1]) && (Username[reset+1]==Username[reset+2]) && (Username[reset+2]==Username[reset+3]))
                                        {
                                                                                
                                        if((Action[reset]=="Select") && (Action[reset+1]=="Patrol") && (Action[reset+2]=="Select") && (Action[reset+3]=="Patrol") || (Action[reset]=="Patrol") && (Action[reset+1]=="Select") && (Action[reset+2]=="Patrol") && (Action[reset+3]=="Select"))      
                                        {   
                                        x=reset; //needed for below 
                                        y=Milliseconds[reset];
                                        reset=reset+4;     
                                               while(a<10)
                                               {
                                               a++;
                                                          if(Username[reset]==Username[x])
                                                          {
                                                          if((Milliseconds[reset]==Milliseconds[reset+3]))
                                                          {       
                                                          if((Username[reset]==Username[reset+1]) && (Username[reset+1]==Username[reset+2]) && (Username[reset+2]==Username[reset+3])&& (Username[reset+2]==Username[x]))
                                                          {               
                                                          if((Action[reset]=="Select") && (Action[reset+1]=="Patrol") && (Action[reset+2]=="Select") && (Action[reset+3]=="Patrol") || (Action[reset]=="Patrol") && (Action[reset+1]=="Select") && (Action[reset+2]=="Patrol") && (Action[reset+3]=="Select"))      
                                                          {                                                          
                                                          z=Milliseconds[reset+3]; 
                                                                                if((y+5)>=z)
                                                                                {
                                                                                if(stop<5)
                                                                                {
                                                                                stop++;
                                                                                if (yes==1)
                                                                                {
                                                                                cout<<Username[reset]<<" #3 Multiselection At "<< Milliseconds[reset]<<endl;                             
                                                                                }
                                                                                a=Milliseconds[reset];
                                                                                b=Username[reset];
                                                                                c="#3_Multiselection"; 
                                                                                HackerTextExport(); //for exporting
                                                                                y=10; 
                                                                                HACKPAUSE=1;
                                                                                reset++;
                                                                                }
                                                                                }
                                                          }                                   
                                                          }
                                                          }
                                                          }
                                                          }
                                                          }
                                                   reset++;
                                                          }
                                              
                                              
                                              }}
                                        
/*  10th method BWCHARt says HACK         --------------------------------------------------------       10th method BWCHARt says HACK  */
reset=200;
stop=0;
while(reset<70000)
{
reset++;                                
                                        if((Action[reset]=="HACK"))
                                        {
                                        if(stop<10)
                                        {
                                        stop++;
                                        if (yes==1)
                                        {
                                        cout<<Username[reset]<<" #5 BWCHART labels this play as causing a HACK action at "<< Milliseconds[reset]<<endl;                             
                                        }
                                        a=Milliseconds[reset];
                                        b=Username[reset];
                                        c="#5_bwchart_labels_this_a_hack";     
                                        HackerTextExport(); //for exporting
                                        HACKPAUSE=1;
                                        reset++;
                                        }}                                
}       

if (speculative==1)
{
/*11  Looks for same selection of 9 units @2 occurances logically it seems a false positive is plausible  */
A=3000;
B=0;
C=0;
D=0;
E=0;
F=0;
once=0;
while (A<99999)
{   
E=0;
C=0;
G=A+1;
I=A;
int t=1;
if(Parameters[A]!="")
{
str=Parameters[A];
const char *ch = str.c_str();
B=str.size();//              length of string           str.size();
C=0;
D=0;

                      D=count(str.begin(), str.end(), ','); 
                      if(D>9)
                      {
                      if((Action[A+1]=="Move")|| (Action[A+1]=="Attack"))
                      {
                      if((Username[A]==Username[A+1]))
                      {
                                        E=2;
                                        while(E<100)
                                        {
                                          if((Action[A+1]=="Move"||"Attack") && (Action[A+1]==Action[A+E+1]) && (Username[A]==Username[A+1]) && (Username[A]==Username[A+E+1]))  // && (Username[A]==Username[A+E+1))//same coordinates for clicking Select ------>  MOVE/ATTACK <---- SAME!!!
                                            {
                                            if((Parameters[A+E]==Parameters[A]) && (Parameters[A]!=""))
                                            {
                                            //cout<<Username[A]<<endl<<bestmulti[A]<<" at "<< Milliseconds[A]<<endl<<bestmulti[A+E]<<" at "<< Milliseconds[A+E]<<endl;
                                    
                                            a=0;
                                            b=Username[A];
                                            if (yes==1)
                                            {           
                                            c="#4_Suspicious_Likely_Multiselection_Review_Player_With_Bwchart";     
                                            }
                                            HackerTextExport(); //for exporting 
                                            HACKPAUSE=1;
                                            reset++;

                                            }
                                            }
                                            
                                        E++;
                                        }
                                        }
                      }
                      }
                      }
A++;
}


/*12 Double click on same coordinates in same millisecond */
reset=200;
stop=0;
while(reset<70000)
{
reset++;                      
                                        if((Username[reset]==Username[reset+1]) && (Username[reset+1]==Username[reset+2]) && (Username[reset+2]==Username[reset+3]))
                                        {                      
                                        if((Action[reset]=="Select") && (Action[reset+1]=="Move") && (Action[reset+2]=="Select") && (Action[reset+3]=="Move"))
                                        {   
                                        if((Milliseconds[reset+1])==(Milliseconds[reset+3]))
                                        {
                                        if(Parameters[reset+1]==Parameters[reset+3])
                                        {
                                            if(stop<5)
                                            {
                                            stop++;               
                                       
                                            a=0;
                                            b=Username[reset];
                                            c="#4_Suspicious_Likely_Multiselection_Review_Player_With_Bwchart";      
                                            HackerTextExport(); //for exporting
                                            }
                                            
                                            
                                        
                                        
                                        }}}}
                                              
}
}
                /*
                if (HACKPAUSE==1)    // IF ANY REPLAY HAS HACK PAUSE SO YOU CAN VIEW IT
                {
                system("pause");
                HACKPAUSE=0;
                }           
                      */   

/* DO NOT EDIT BELOW THIS LINE    DO NOT EDIT BELOW THIS LINE DO NOT EDIT BELOW THIS LINE  DO NOT EDIT BELOW THIS LINE    DO NOT EDIT BELOW THIS LINE                                                      */                                                                                                                                                                                                                                                  
reset=1;
}  
}                                  


else
{
cout << "Problem opening file " << FindData.cFileName << "\n";   
system("pause"); 
}

  ofstream Hacker;
  Hacker.open ("Hacker.txt");
  int run=HackOccurances;
  int uptick=0;
  int holder=0;
  int duplicate;
  while(run !=0)
  {
  holder=uptick-1;
  while(holder!=-1)
  {  
  if((Detected[uptick]==Detected[holder]) && (Names[uptick]==Names[holder]) && (Milli[uptick]==Milli[holder]))
  {
  duplicate=1; //Prevents duplicate entries from showing up in hacker.txt
  }
  holder--;
  }
  if (duplicate ==0)
  {
 	 if(Milli[uptick]==0)
 	 {
	 Hacker<<Detected[uptick]<<" "<<Names[uptick]<<endl;
	 }

	 if(Milli[uptick]!=0)
	 {
  	 Hacker<<Detected[uptick]<<" "<<Names[uptick]<<" at "<<Milli[uptick]<<" milliseconds."<<endl;
  	 }
   }
  
  duplicate=0;
  run--;
  uptick++;
  }
  Hacker.close();
  
}  
while( FindNextFile(hFind, &FindData) > 0 );   
if( GetLastError() != ERROR_NO_MORE_FILES )
{
cout << "Something went wrong during searching\n";
system("pause");
}
system("pause");
return 0;
}
