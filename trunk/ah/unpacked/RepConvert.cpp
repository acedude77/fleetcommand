#include "stdafx.h"
#include "RepLib/BWrepAPI.h"
#include <atlstr.h>
#include <stdio.h>
#include <conio.h>
#include "OKFile.h"

CString GetReplayName (CString a_replay)
{
	CString name = a_replay.Mid(a_replay.ReverseFind('\\') + 1);
	name = name.Left(name.GetLength() - 4);
	return name;
}

void RepToTxt (CString a_replay, CString a_text)
{
	printf("Converting %s\nto %s\n... ", a_replay, a_text);
	OKFile textFile;
	BWrepFile* replay = new BWrepFile();

	// open both
	if(!replay->Load(a_replay)) 
	{
		printf("Error loading replay!\n");
		delete replay;
		return;
	}

	if (!textFile.Open(a_text, OKFile::FileMode_ReCreate, OKFile::FileMode_Text))
	{
		printf("Error creating textfile!\n");
		delete replay;
		return;
	}

	// load actions and write them to the file
	for (int n = 0; n < replay->m_oActions.GetActionCount(); n ++)
	{
		const BWrepAction* currentAction = NULL;
		currentAction = replay->m_oActions.GetAction (n);

		if (currentAction == NULL)
			continue;

		BWrepPlayer player;
		replay->m_oHeader.getPlayerFromAction(player, currentAction->GetPlayerID());

		textFile.WriteFormatedData("%d\t%s\t%s\t%s\t\n", currentAction->GetTime(), player.getName(), currentAction->GetName(),
			currentAction->GetParameters());
	}

	// delete rep in memory and finish
	delete replay;
	textFile.Close();
	printf("done\n");
}

void ConvertRep (CString a_replay, CString a_destination)
{
	if (!OKFile::DoesFileExist(a_replay))
	{
		printf("Replay %s does not exist!", a_replay);
		return;
	}

	// file or directory
	if (a_destination.Right(4)[0] == '.')
	{
		RepToTxt(a_replay, a_destination);
	}
	else
	{
		if (a_destination.Right(1) != "\\")
			a_destination += "\\";

		RepToTxt(a_replay, a_destination + GetReplayName(a_replay) + ".txt");
	}
}

void ConvertDirectory (CString a_source, CString a_destination)
{
	if (a_destination.Right(4)[0] == '.')
	{
		printf("Wrong syntax!");
		return;
	}

	if (a_source.Right(1) != "\\")
		a_source += "\\";

	if (a_destination.Right(1) != "\\")
		a_destination += "\\";

	CreateDirectory (a_destination, 0);

	WIN32_FIND_DATA findFileData;
	HANDLE repFind = FindFirstFile(a_source + "*.rep", &findFileData);

	if (repFind == INVALID_HANDLE_VALUE) 
	{
		printf ("Error while searching for replays: %u\n", GetLastError());
		return;
	} 
	else 
	{
		RepToTxt(a_source + findFileData.cFileName, a_destination + GetReplayName(findFileData.cFileName) + ".txt");
		int count = 1;
		while (FindNextFile(repFind, &findFileData) != 0) 
		{
			RepToTxt(a_source + findFileData.cFileName, a_destination + GetReplayName(findFileData.cFileName) + ".txt");
			count ++;
		}

		FindClose(repFind);
		printf("Replay conversion finished, %d reps converted", count);
	}
}

int _tmain(int argc, _TCHAR* argv[])
{
	// no arguments, no work
	if (argc == 1 || argc > 3)
	{
		printf ("You have to give one or two arguments to the program, not more, not less!\n");
		printf ("syntax 1: RepConvert \"SourceDirectory\"\n");
		printf ("syntax 2: RepConvert \"SourceDirectory\" \"DestinationDirectory\"\n");
		printf ("syntax 3: RepConvert \"SourceReplay.rep\"\n");
		printf ("syntax 4: RepConvert \"SourceReplay.rep\" \"DestinationReplay.txt\"\n");
		printf ("syntax 5: RepConvert \"SourceReplay.rep\" \"DestinationDirectory\"\n");
		
		_getch();
		return 0;
	}

	// get arguments
	CString source = argv[1];
	CString destination;
	if (argc == 3)
		destination = argv[2];

	source.Replace("\"", "");
	destination.Replace("\"", "");

	// single rep or full directory
	if (source.Right(4).CompareNoCase(".rep") == 0)
		ConvertRep(source, destination);
	else 
	{
		if (destination.GetLength() == 0)
			destination = source;
		ConvertDirectory(source, destination);
	}

	_getch();
	return 0;
}

