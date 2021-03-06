DXBC:?bE????'????   ?M     8   ?  l  ?  l  ?  RDEF?     t          ??	  \  \                              i                             MatrixBuffer cbSkinned ?\      ?   ?           i      $  ?          ?       @       ?         @   @       ?         ?   @      ?       worldMatrix             viewMatrix projectionMatrix <      ?     L      gBoneTransforms     :       Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 ??ISGN?         h                    t                   }                   ?                   SV_Position TEXCOORD WEIGHTS BONEINDICES ???OSGNP         8                    D                   SV_Position TEXCOORD ???SHDR?  @  (  Y  F?         Y F?     ?   _  r     _  2    _  ?    _  ?    g  ?         e  2     h     )  ?      F    @     8  
r     V     F?             2  r          F?          F    2  r     ?     F?             F       
r     F    F?             8  r     F    V    8  
r     V     F?       
      2  r          F?    
      F    2  r     ?     F?       
      F       
r     F    F?       
      2  	r         F    F    8  
r     V     F?       *      2  r          F?    *      F    2  r     ?     F?       *      F       
r      F    F?       *      2  	r      ?    F     F    8  
r     V     F?       :      2  r          F?    :      F    2  r     ?     F?       :      F       
r     F    F?       :      2  	r      ?    F    F     8  ?     V     F?      	   2  
?           F?         F    2  
?      ?
     F?      
   F       ?      F     F?         2  2     F    @    ??  ??        @        ??        >  STATt                                                                                                                 SPDB F  Microsoft C/C++ MSF 7.00
DS         #   ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????8   ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????       <       ????                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ?.1?wmU   ??????K?
???)?                          A?2                                                                                                                                                                                                                                                                                                                                                                                                                                                                    er cbSkinned
{
	matrix gBoneTransforms[58];
};

//////////////
// TYPEDEFS //
//////////////
struct VertexInputType
{
	float3 position : SV_Position;
	float2 tex : TEXCOORD;
	float4 Weights    : WEIGHTS;
	uint4 BoneIndices : BONEINDICES;
};

struct PixelInputType
{
    float4 position : SV_Position;
    float2 tex : TEXCOORD;
};


////////////////////////////////////////////////////////////////////////////////
// Vertex Shader
////////////////////////////////////////////////////////3M  /,  ws  l  ?l  ?  w  W.  ?F  n  ?A  ?*  ?&  {h  ?{  ?x                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ////////////////////////////////////////////////////////////////////////////////
// Filename: color.vs
////////////////////////////////////////////////////////////////////////////////


/////////////
// GLOBALS //
/////////////
cbuffer MatrixBuffer
{
	matrix worldMatrix;
	matrix viewMatrix;
	matrix projectionMatrix;
};

cbuffer cbSkinned
{
	matrix gBoneTransforms[58];
};

//////////////
// TYPEDEFS //
//////////////
struct VertexInputType
{
	float3 position : SV_Position;
	float2 tex : TEXCOORD;
	float4 Weights    : WEIGHTS;
	uint4 BoneIndices : BONEINDICES;
};

struct PixelInputType
{
    float4 position : SV_Position;
    float2 tex : TEXCOORD;
};


////////////////////////////////////////////////////////////////////////////////
// Vertex Shader
////////////////////////////////////////////////////////////////////////////////
PixelInputType ColorVertexShader(VertexInputType input)
{
	PixelInputType output;
	float weights[4] = { 0.0f, 0.0f, 0.0f, 0.0f };
	weights[0] = input.Weights.x;
	weights[1] = input.Weights.y;
	weights[2] = input.Weights.z;
	weights[3] = input.Weights.w;
	float3 posLTmp  = mul(float4(input.position, 1.0f), worldMatrix);
	posLTmp = input.position;
	// Change the position vector to be 4 units for proper matrix calculations.
	float3 posL = float3(0.0f, 0.0f, 0.0f);

	for (int i = 0; i < 4; ++i)
	{
		int bone = input.BoneIndices[i];
		matrix mm =   gBoneTransforms[bone];
		posL += weights[i] * mul(float4(posLTmp, 1.0f), mm).xyz;
	}

	output.position = mul(float4(posL, 1.0f), projectionMatrix);
	//output.position = mul(float4(input.position, 1.0f), projectionMatrix);
	// Store the input color for the pixel shader to use.
	//output.position = mul(input.position, projectionMatrix);
	output.tex.x = input.tex.x;
	output.tex.y = 1.0f - input.tex.y;
	return output;
}                                                                                                                                                                            ????   ?   D:\VS2013Proj\DXEngine(UE)\DXEngine\VS2013_Proj\Bin\Debug\Shaders\SkinVS.hlsl  d:\vs2013proj\dxengine(ue)\dxengine\vs2013_proj\bin\debug\shaders\skinvs.hlsl ////////////////////////////////////////////////////////////////////////////////
// Filename: color.vs
////////////////////////////////////////////////////////////////////////////////


/////////////
// GLOBALS //
/////////////
cbuffer MatrixBuffer
{
	matrix worldMatrix;
	matrix viewMatrix;
	matrix projectionMatrix;
};

cbuff?0?   #5???                                                               P   (   ?0	I~?T     O   P                                                                                                                                                                                                                                                                                                                                                                                                                  J <      @?%   @?%Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 B =hlslFlags 0x9 hlslTarget vs_4_0 hlslEntry ColorVertexShader    :     ?      $      $  
  |    ?ColorVertexShader    . >  	 input                                  P     |    $     P    |    $    P    |    $    P    |    $    P    |    $    P    |    $     P    |    $$    P    |    $(    P     |    $,    P  $  |    $0    P  (  |    $4    P  ,  |    $8    P  0  |    $<   F >	  ? <ColorVertexShader return value>                               P    |    $    P    |    $    P     |    $     P    |    $    P    |    $    P    |    $   * >    posL                               P      0   ?     P     0   ?     P     0   ?     P          @     P         @    P         @     ?         ??+?$Dl?d(Y??  ?   ?        ?      6   ?  |   :  ?|   :   ?   ;  ??   ;   ?   ;  ??   ;   ?   ;  ??   ;     ;  ?  ;   D  ;  ?D  ;   `  ;  ?`  ;   ?  ;  ??  ;   ?  ;  ??  ;   ?  ;  ??  ;     ;  ?  ;   0  ;  ?0  ;   X  ;  ?X  ;   ?  ;  ??  ;   ?  ;  ??  ;   ?  ;  ??  ;      ;  ?   ;   (  ;  ?(  ;   T  ;  ?T  ;   ?  ;  ??  ;   ?  ;  ??  ;   ?  >  ??  >   ?  >  ??  >     >  ?  >   @  >  ?@  >   `  D  ?`  D   ?  D  ??  D    &  %  :  5  :  5  :  5  :  5  :  9  :  5  :  5  :  5  :  5  :  9  :  5  :  5  :  5  :  5  :  9  :  5  :  5  :  5  :  5  :  9  =  <  =  <  =  <  =  <         ?                     H                                                                                                                                                                                                                                                                                                                                               ?18        ?  
 ??   ?      @   @      H        @       float3 ??? @       float2 ??? @       float4 ??? u       uint4 R       position ?    tex ??    Weights ??   $ BoneIndices ??&              4 VertexInputType ??
      &      position ?    tex ??&               PixelInputType ???
      	       @            @ float4x4 
     
        "   @   ? ?
                                     ?18              ??   ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ////////////////////////
PixelInputType ColorVertexShader(VertexInputType input)
{
	PixelInputType output;
	float weights[4] = { 0.0f, 0.0f, 0.0f, 0.0f };
	weights[0] = input.Weights.x;
	weights[1] = input.Weights.y;
	weights[2] = input.Weights.z;
	weights[3] = input.Weights.w;
	float3 posLTmp  = mul(float4(input.position, 1.0f), worldMatrix);
	posLTmp = input.position;
	// Change the position vector to be 4 units for proper matrix calculations.
	float3 posL = float3(0.0f, 0.0f, 0.0f);

	for (int i = 0; i < 4; ++i)
	{
		int bone = input.BoneIndices[i];
		matrix mm =   gBoneTransforms[bone];
		posL += weights[i] * mul(float4(posLTmp, 1.0f), mm).xyz;
	}

	output.position = mul(float4(posL, 1.0f), projectionMatrix);
	//output.position = mul(float4(input.position, 1.0f), projectionMatrix);
	// Store the input color for the pixel shader to use.
	//output.position = mul(input.position, projectionMatrix);
	output.tex.x = input.tex.x;
	output.tex.y = 1.0f - input.tex.y;
	return output;
}        O      P       ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       D3DSHDR ?                             `                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ????	/?           !      I                                                                                                                                                                                                                                                   ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       %    ?    ColorVertexShader & Q     ? ??????projectionMatrix    " Q      ??????gBoneTransforms                                                                                                                                                                                                                                                                                                                                                                                                                                                ????	/?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ????w	1     ? ??   X       ,   \                                    ?     `             	 ?      ?     @?7         ColorVertexShader none  -?.? //    ?     `  //                ????    ?        ????    ????         D:\VS2013Proj\DXEngine(UE)\DXEngine\VS2013_Proj\Bin\Debug\Shaders\SkinVS.hlsl   ????                  ?????????? ??????????                                                                                                                                                 ?.1?wmU   ??????K?
???)?{   /LinkInfo /names /src/headerblock /src/files/d:\vs2013proj\dxengine(ue)\dxengine\vs2013_proj\bin\debug\shaders\skinvs.hlsl                 "            
                 A?2                                                                                                                                                                                                                                                                                                                ?   ?  o  8       #  ?   T  ?  H       (   8  ,   l                                       	   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           