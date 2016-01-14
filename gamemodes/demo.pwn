#include <a_samp>
#include <physics_extendBAK>
new clearntimer; 
new Balls[3];
main() { }

new Float:vec[3];
public OnGameModeInit()
{
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	
	/*PHY_CreateWall(1961.4270, 1339.6151, 1961.4269, 1346.3175);
	PHY_CreateWall(1961.4269, 1346.3175, 1951.4360, 1345.8835);
	PHY_CreateWall(1951.4360, 1345.8835, 1951.5145, 1340.2163);
	PHY_CreateWall(1951.5145, 1340.2163, 1961.4270, 1339.6151);*/
	PHY_CreateArea(1951.43, 1339.61, 1961.43, 1345.88);
	
	CreateObject(1352, 1957.0, 1344.1, 15.3746 - 1.2, 0, 0, 0); // Traffic light
	PHY_CreateCylinder(1957.0, 1344.1 + 0.13, 0.3);
	
	//printf("COT = %f",floatcot(45,degrees));
	return 1;
}



public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/3d", cmdtext, true, 10) == 0)
	{
		new a = CreateObject(1598, 1960.3783, 1344.0, 15.3746-0.69, 0, 0, 0);
		new b = CreateObject(2114, 1954.3783, 1344.0, 15.3746-0.69, 0, 0, 0);
		PHY_InitObject(a, 1598, 1.4);
		PHY_InitObject(b, 2114, 1.0);
		PHY_SetObjectVelocity(a, -4.0, 0.0, 5.5);
		PHY_SetObjectVelocity(b, 4.0, 0.0, 5.5);
		PHY_RollObject(a);
		PHY_RollObject(b);
		PHY_SetObjectFriction(a, 0.25);
		PHY_SetObjectFriction(b, 0.25);
		PHY_SetObjectAirResistance(a, 0.1);
		PHY_SetObjectAirResistance(b, 0.1);
		PHY_SetObjectGravity(a, 7.1);
		PHY_SetObjectGravity(b, 7.1);
		PHY_SetObjectZBound(a, _, _, 0.5);
		PHY_SetObjectZBound(b, _, _, 0.5);
		return 1;
	}
	if (strcmp("/2d", cmdtext, true, 10) == 0)
	{

		DestroyObject(Balls[0]);
		Balls[0] = CreateObject(1598, 1958.6987, 1340.2689, 14.8012, 0, 0, 0);
		//new b = CreateObject(2114, 1954.3783, 1344.0, 15.3746-0.69, 0, 0, 0);
		PHY_InitObject(Balls[0] , 1598, 1.0, _, PHY_MODE_2D);
		//PHY_InitObject(b, 2114, 1.0, _, PHY_MODE_2D);
		/*
		new Float:vay;
		vay -= 2 * (PHY_TIMER_INTERVAL/1000.0);
		*/
		PHY_SetObjectVelocity(Balls[0] ,-4,-4);
		//PHY_SetObjectVelocity(b, 0.0, 0.0);
		PHY_RollObject(Balls[0] );
		//PHY_RollObject(b);
		PHY_SetObjectFriction(Balls[0] , 0.25);
	//	PHY_SetObjectFriction(b, 0.25);
		PHY_SetObjectAirResistance(Balls[0] , 0.1);
	//	PHY_SetObjectAirResistance(b, 0.1);
		return 1;
	}
	
	if (strcmp("/test", cmdtext, true, 10) == 0)
	{
		Balls[2] = CreateObject(19571, 1958.6987, 1340.2689, 14.8012, 0, 0, 0);
		clearntimer = SetTimer("ClearnBalls",20,true);
	}
	return 0;
}

forward ClearnBalls();

public ClearnBalls()
{	
	//if(!PHY_IsObjectMoving(Balls[0])) DestroyObject(Balls[0]);
	
	vec[0] -= 45.0;
	vec[1] -= 45.0;
	printf("%f,%f",vec[0],vec[1]);
	
	
	SetObjectRot(Balls[2],vec[0],vec[1],vec[2]);

}
