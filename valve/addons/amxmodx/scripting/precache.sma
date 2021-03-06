/* Plugin generated by AMXX-Studio */

#include <amxmodx>
#include <amxmisc>

#define PLUGIN "PRECACHE MODELS"
#define VERSION "1.0"
#define AUTHOR "MarioK17"


public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)	

}

public plugin_precache() {
	
	const TAMANO = 80;
	
	
	new dirPath [ TAMANO ];
	dirPath = "models/player"
	//get_configsdir( dirPath, charsmax( dirPath ) );
	
	server_print("base dir: %s", dirPath);
	new fileName[ TAMANO ];
	new handleDir = open_dir( dirPath, fileName, charsmax( fileName ) );
	server_print("Loading models...");
	if ( !handleDir )
	{
	// directory was not found or unable to open it.
		server_print( "No open" );
		return;
	}
	
	do
	{
		if(strcmp(".",fileName) == 0 || strcmp("..",fileName) == 0) {			
			continue;
		}		
		
		// It will loop through all the found files.
		//server_print( "Filename : %s", fileName );
	
	
		new dirSubPath [ TAMANO];
		dirSubPath = "models/player/";
		
		strcat(dirSubPath, fileName, charsmax(dirSubPath));
		
		//server_print("subpath %s ", dirSubPath);
		
		new subFileName[TAMANO];
		new subHandleDir = open_dir( dirSubPath, subFileName, charsmax( subFileName ) ); 
	
		if ( !subHandleDir )
		{
		// directory was not found or unable to open it.
			server_print( "Could'nt open" );
			return;
		} do {
					
			if(strcmp(".", subFileName) == 0 || strcmp("..", subFileName) == 0) {				
				continue;
			}
			
			//server_print( "SubFilename : %s", subFileName );	
			
			new fullFilePath[TAMANO];
			
			copy(fullFilePath, charsmax(fullFilePath), dirSubPath);
			
			strcat(fullFilePath, "/", charsmax(fullFilePath));	
			strcat(fullFilePath, subFileName, charsmax(fullFilePath));
			
			if(contain(subFileName,".ztmp") != -1) {
				//server_print("es tmp");
			}else if(contain(subFileName,".mdl") != -1) {				
				precache_model(fullFilePath);
			} else if(contain(subFileName,".bmp") != -1) {
				precache_generic(fullFilePath);
			} else {
				server_print("nor mdl either bmp %s", subFileName);			
			}
			
			
		
		} while ( next_file( subHandleDir, subFileName, charsmax( subFileName ) ) );	
		
		close_dir( subHandleDir );
	
	}   
	while ( next_file( handleDir, fileName, charsmax( fileName ) ) );
	
	close_dir( handleDir );
	
	server_print("Loaded models");	
	

}

