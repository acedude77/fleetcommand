#include <stdio.h>
#include <windows.h>
#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
using namespace std;
int falsepositives=2;
int a;    //milliseconds
string b; //player name
string c; //action
string d; //garbage
int storage;
int start=0;
int zero=0;
int zergmineralhack=0;
int zergmineralhack2=0;
int twenty=0; //get the point if someone hacks
int reset=0;                   
int ticker=0;
int increment=0;
int mineralwhileA=0;
int multiselect=0;
int namecheck=0;
int multiselectbam=0;
int multiselectguilty=0;
int main()
{
cout<<"Each detection labels which method (eg #1, #2, #3...)"<<endl;
cout<<"*If* any false positive you can see method used in source code and can revise"<<endl;
cout<<"Tested against 1000+ programers no false positives"<<endl<<endl<<endl;
system("pause");
system("RepConvert.bat");
int zero=0;
a=0;
b="";
c="";
int twenty=0;
int Ralph=99999;
int Milliseconds[Ralph];
string Username[Ralph];
string Action[Ralph];
string Garbage[Ralph];
string Garbage2[Ralph];
int x=0;    
cout<<"Hackers "<<endl<<endl;                       
string path = "C:\\replays2\\";
string searchPattern = "*.txt";
string fullSearchPath = path + searchPattern;
WIN32_FIND_DATA FindData;
HANDLE hFind;
hFind = FindFirstFile( fullSearchPath.c_str(), &FindData );
if( hFind == INVALID_HANDLE_VALUE )
{
cout << "Error searching directory place the replays in Starcraft Replays directory";
system("pause");
return -1;
}
do
{
string filePath = path + FindData.cFileName;
ifstream in( filePath.c_str() );    
             
if( in )
{
system("pause");
cout<<endl<<endl<<endl<<"                "<<FindData.cFileName<<endl;             
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
                   Garbage[ticker]=d;
                   
                   ticker++;
                                  
                                 if(! in)
                                 {
                                 reset=1;
                                 ticker=0;        
                                 }
                   
                   if(reset==1)
                   {     
/* DO NOT EDIT ABOVE THIS LINE DO NOT EDIT ABOVE THIS LINE DO NOT EDIT ABOVE THIS LINE DO NOT EDIT ABOVE THIS LINE DO NOT EDIT ABOVE THIS LINE DO NOT EDIT ABOVE THIS LINE  */                               

                        /*                            #1  Autosplit Hack    @Bnet latency                             */
                       reset=0;
                                 while(reset<100)
                                 {
                                 if((Milliseconds[reset]==5)&& (Milliseconds[reset]==Milliseconds[reset+1]))
                                 {
                                 cout<<Username[reset]<<" #1 Autosplit at "<< Milliseconds[reset]<< " milliseconds." <<endl;
                                 } 
                                 reset++; 
                                 }
                                  
                       /*                              #2  Autosplit Hack    @Chaos latency                             */          
                                 reset=0;
                                 while(reset<100)
                                 {
                                 if((Milliseconds[reset]==2 && (Username[zero] == Username[zero+1]) && (Username[zero+1] == Username[zero+2])))   
                                 cout<<Username[reset]<<" #2 Autosplit at "<< Milliseconds[reset]<<" milliseconds." <<endl;
                                 reset++; 
                                 } 
                       
                       
                       /*                              Zerg Hack Mineral Hack @ Any Latency  1st method                         */
                
                twenty=0;
                mineralwhileA=10;
                while(mineralwhileA<99999)
                {  
                mineralwhileA++;            
                zergmineralhack=Milliseconds[mineralwhileA+2]-Milliseconds[mineralwhileA];                 
                        if((zergmineralhack==5) || (zergmineralhack==4) || (zergmineralhack==2) || (zergmineralhack==0))    
                             {                                                      
                                                                                                                                                                   // Without Chaos Plugin Version    
                                     if((Username[mineralwhileA] == Username[mineralwhileA+1] && Username[mineralwhileA+1] == Username[mineralwhileA+2]))            // Without Chaos Plugin Version
                                     {                                                     
                                             if((Action[mineralwhileA]=="Select") && (Action[mineralwhileA+1]=="Hatch") && (Action[mineralwhileA+2]=="Cancel"))       // Without Chaos Plugin Version
                                             { 
                                                                                                     
                                                 if((Garbage[mineralwhileA+1]=="Drone") && (Garbage[mineralwhileA+2]=="Train"))
                                                 {
                                                                             if(twenty<20)
                                                                             {
                                                                             cout<<Username[mineralwhileA]<<" #3 Zerg Mineral Hacked at "<< Milliseconds[mineralwhileA] <<" milliseconds."<<endl;
                                                                             twenty--;
                                                                             }
                                                 }
                                             } 
                                      }
                             }                                         
                   }   
                                                     /* Zerg Mineral Hack Detection        2nd method                 */
                twenty=0;
                mineralwhileA=10;
                while(mineralwhileA<99999)
                {  
                mineralwhileA++;            
                
                if(Milliseconds[mineralwhileA]==Milliseconds[mineralwhileA+1])
                {                                                                          
                                     if((Username[mineralwhileA] == Username[mineralwhileA+1]))
                                     {                                                                         
                                             if((Action[mineralwhileA]=="Hatch") && (Action[mineralwhileA+1]=="Cancel"))
                                             {                                                       
                                                 if((Garbage[mineralwhileA]=="Drone") && (Garbage[mineralwhileA+1]=="Train"))
                                                 {
                                                                             if(twenty<20)
                                                                             {
                                                                             cout<<Username[mineralwhileA]<<" #4 Zerg Mineral Hacked at "<< Milliseconds[mineralwhileA] <<" milliseconds."<<endl;
                                                                             twenty--;
                                                                             }
                                                 }
                                             } 
                                      }
                             }                                         
                   }  
                     
                   


/*           M U L T I S E L E C T     M U L T I S E L E C T     M U L T I S E L E C T     M U L T I S E L E C T      M U L T I S E L E C T     */
/*           I RECOMMEND BEING CAREFUL WITH 1 OR 2 FLAGS, BUT SO FAR NO PROGAMERS IN MY 1000+ FLAGGED BUT AIM FOR 5+ DETECTIONS                 */
/*           FIRST 2 ARE AUTOMATICALLY REMOVED DUE TO A VERY RARE OCCURANCE OF PROGAMERS GETTING A SINGLE FALSE POSITIVE                        */




                                               /* Basic Multiselect Detection */
                                               
                           namecheck=30;
                           falsepositives=2;
                           while(namecheck<99999)
                                 {
                             
                                 {                
                                    if((Milliseconds[namecheck]==Milliseconds[namecheck+1]) && (Milliseconds[namecheck+1]==Milliseconds[namecheck+2]) && (Milliseconds[namecheck+2]==Milliseconds[namecheck+3]) && (Username[namecheck+3]==Username[namecheck+4]) && (Username[namecheck+4]==Username[namecheck+5]))
                                        {
                                            if((Username[namecheck]==Username[namecheck+1]) && (Username[namecheck+1]==Username[namecheck+2]) && (Username[namecheck+2]==Username[namecheck+3]) && (Username[namecheck+3]==Username[namecheck+4]) && (Username[namecheck+4]==Username[namecheck+5]))
                                           {
                                                                                       
                                             if((Action[namecheck]=="Select"))
                                              {
                                                                         
                                                    if((Action[namecheck+1]=="Attack") && (Action[namecheck]==Action[namecheck+2]) && (Action[namecheck+1]==Action[namecheck+3]))                                             
                                                        {
                                                        if (falsepositives>0)
                                                        {                                        
                                                        falsepositives--;       
                                                        }
                                                        if (falsepositives<1)
                                                        {
                                                        cout<<Username[namecheck]<<" #5 Very Suspicious Multiselection "<< Milliseconds[namecheck]<<endl;
                                                        }       
                                                        }
                                                     if((Action[namecheck+1]=="Patrol") && (Action[namecheck]==Action[namecheck+2]) && (Action[namecheck+1]==Action[namecheck+3]))                                            
                                                           {
                                                        if (falsepositives>0)
                                                        {                                        
                                                        falsepositives--;       
                                                        }
                                                        if (falsepositives<1)
                                                        {
                                                        cout<<Username[namecheck]<<" #6 Very Suspicious Multiselection "<< Milliseconds[namecheck]<<endl;
                                                        }       
                                                        }
                                                     if((Action[namecheck+1]=="Set") && (Action[namecheck]==Action[namecheck+2]) && (Action[namecheck+1]==Action[namecheck+3]))                                             
                                                           {
                                                        if (falsepositives>0)
                                                        {                                        
                                                        falsepositives--;       
                                                        }
                                                        if (falsepositives<1)
                                                        {
                                                        cout<<Username[namecheck]<<" #7 Very Suspicious Multiselection "<< Milliseconds[namecheck]<<endl;
                                                        }       
                                                        }
                                                     }    
                                               }                                         
                                        }
                                        
                                
                                } 
                                namecheck++;                                
                            }         
                            
                                                    
                                               

                                               /* Protoss Carriers Multiselect */
                falsepositives=2;
                twenty=10; //just reusing the variable
                mineralwhileA=30;
                while(mineralwhileA<99999)
                {  
                        if((Milliseconds[mineralwhileA] == Milliseconds[mineralwhileA+1] && Milliseconds[mineralwhileA+1] == Milliseconds[mineralwhileA+2]))         // Without Chaos Plugin Version
                             {   
                                if((Username[mineralwhileA] == Username[mineralwhileA+1] && Username[mineralwhileA+1] == Username[mineralwhileA+2]))            // Without Chaos Plugin Version
                                {                                                                                                                       // Without Chaos Plugin Version    
                                     if((Action[mineralwhileA]=="Select") && (Action[mineralwhileA+1]=="Arm") && (Action[mineralwhileA+2]=="Shift"))         // Without Chaos Plugin Version
                                     {                                        
                                        if (falsepositives>0)
                                        {                                        
                                            falsepositives--;       
                                            }
                                                if (falsepositives<1)
                                                {
                                                        if(twenty<20)
                                                        {
                                                        cout<<Username[mineralwhileA]<<" #8 Protoss Carrier Suspicious Multiselection at "<< Milliseconds[mineralwhileA]<< " milliseconds.";
                                                        twenty--;
                                                        }                    
                                                }                    
                                            } 
                                        }
                                   } 


                mineralwhileA++;                                        
                }

                         

 /* DO NOT EDIT BELOW THIS LINE    DO NOT EDIT BELOW THIS LINE DO NOT EDIT BELOW THIS LINE  DO NOT EDIT BELOW THIS LINE    DO NOT EDIT BELOW THIS LINE                                                      */                                                                                                                                                                                                                                                  
reset=0;
}  
}                                  
}

else
{
cout << "Problem opening file " << FindData.cFileName << "\n";   
system("pause"); 
}
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
