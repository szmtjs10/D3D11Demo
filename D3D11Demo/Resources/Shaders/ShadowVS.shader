DXBCў•ЛH≠ƒH¬…∞Wiџo   »V     8   \  –  t  D  ј  RDEF     x          ю€	  и  \                              i                             MatrixBuffer LightBuffer2 ЂЂ\      ®   @          i      А                    @      ,      <  @   @      ,      G  А   @      ,      X  ј   @      ,      h     @      ,      worldMatrix             viewMatrix projectionMatrix lightViewMatrix lightProjectionMatrix ЂЂ∞            ј      –            Ў      lightPosition ЂЂ            padding              Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 ЂЂISGNl         P                    Y                   `                   POSITION NORMAL TEXCOORD ЂЂЂOSGNЬ         А                    М                   Х                   М                   М                  SV_POSITION TEXCOORD NORMAL SHDR»  @  2  Y  FО         Y  FО        _  r     _  r    _  2    g  т         e  2     e  r     e  т     e  r     h     8  т      V     FО         2  
т           FО          F     2  
т      ¶     FО         F        т      F     FО         8  т     V     FО         2  
т           FО         F    2  
т     ¶
     FО         F    2  
т     ц     FО         F    8  т     V    FО      	   2  
т          FО         F    2  
т     ¶
    FО      
   F    2  
т      ц    FО         F    6  2     F    8  r     V    FВ         2  
r         FВ          F    2  
r     ¶    FВ         F      В     F    F    D  В     :     8  r     ц    F    8  т     V     FО         2  
т           FО         F    2  
т     ¶
     FО         F    2  
т     ц     FО         F       	r      FАA       FВ         8  т     V    FО         2  
т          FО         F    2  
т     ¶
    FО         F    2  
т     ц    FО         F      В      F     F     D  В      :      8  r     ц     F     >  STATt                                                                                                                  SPDB N  Microsoft C/C++ MSF 7.00
DS         '   Є       #                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ј€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€8   р€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€       <       €€€€                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Ф.1џ!ІU   Д1Ґ≠ЧоДOЭ«ђ5zЧL                          AС2                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ojectionMatrix;
};


//////////////////////
// CONSTANT BUFFERS //
//////////////////////
cbuffer LightBuffer2
{
    float3 lightPosition;
    float padding;
};


//////////////
// TYPEDEFS //
//////////////
struct VertexInputType
{
    float4 position : POSITION;
    float3 normal : NORMAL;
	float2 tex : TEXCOORD0;
};

struct PixelInputType
{
    float4 position : SV_POSITION;
    float2 tex : TEXCOORD0;
    float3 normal : NORMAL;
    float4 lightViewPosition : TEXCOORD1;
   ws  3M  /,  6$  Ї  L  €2  ВF  р1  ‘(  є*  ≠Z  б/  ~3  З2                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ////////////////////////////////////////////////////////////////////////////////
// Filename: shadow.vs
////////////////////////////////////////////////////////////////////////////////


/////////////
// GLOBALS //
/////////////
cbuffer MatrixBuffer
{
    matrix worldMatrix;
    matrix viewMatrix;
    matrix projectionMatrix;
    matrix lightViewMatrix;
    matrix lightProjectionMatrix;
};


//////////////////////
// CONSTANT BUFFERS //
//////////////////////
cbuffer LightBuffer2
{
    float3 lightPosition;
    float padding;
};


//////////////
// TYPEDEFS //
//////////////
struct VertexInputType
{
    float4 position : POSITION;
    float3 normal : NORMAL;
	float2 tex : TEXCOORD0;
};

struct PixelInputType
{
    float4 position : SV_POSITION;
    float2 tex : TEXCOORD0;
    float3 normal : NORMAL;
    float4 lightViewPosition : TEXCOORD1;
    float3 lightPos : TEXCOORD2;
};


////////////////////////////////////////////////////////////////////////////////
// Vertex Shader
////////////////////////////////////////////////////////////////////////////////
PixelInputType ShadowVertexShader(VertexInputType input)
{
    PixelInputType output;
    float4 worldPosition;
    
    
    // Change the position vector to be 4 units for proper matrix calculations.
    input.position.w = 1.0f;

    // Calculate the position of the vertex against the world, view, and projection matrices.
    output.position = mul(input.position, worldMatrix);
    output.position = mul(output.position, viewMatrix);
    output.position = mul(output.position, projectionMatrix);
    
    // Calculate the position of the vertice as viewed by the light source.
    output.lightViewPosition = mul(input.position, worldMatrix);
    output.lightViewPosition = mul(output.lightViewPosition, lightViewMatrix);
    output.lightViewPosition = mul(output.lightViewPosition, lightProjectionMatrix);

    // Store the texture coordinates for the pixel shader.
    output.tex = input.tex;
    
    // Calculate the normal vector against the world matrix only.
    output.normal = mul(input.normal, (float3x3)worldMatrix);
    
    // Normalize the normal vector.
    output.normal = normalize(output.normal);

    // Calculate the position of the vertex in the world.
    worldPosition = mul(input.position, worldMatrix);

    // Determine the light position based on the position of the light and the position of the vertex in the world.
    output.lightPos = lightPosition.xyz - worldPosition.xyz;

    // Normalize the light position vector.
    output.lightPos = normalize(output.lightPos);

    return output;
}                                                                                                                                                                                                                                                                                                                                                                                                    юпюп   н
   F:\D3D11Demo\D3D11Demo\Resources\Shaders\ShadowVS.hlsl  f:\d3d11demo\d3d11demo\resources\shaders\shadowvs.hlsl ////////////////////////////////////////////////////////////////////////////////
// Filename: shadow.vs
////////////////////////////////////////////////////////////////////////////////


/////////////
// GLOBALS //
/////////////
cbuffer MatrixBuffer
{
    matrix worldMatrix;
    matrix viewMatrix;
    matrix projectionMatrix;
    matrix lightViewMatrix;
    matrix lightPrв0А   y4±uњ–                                                               9   (   в0ќ,S|
     8   9                                                                                                                                                                                                                                                                                                                                                                                                                  J <      @А%   @А%Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 B =hlslFlags 0x9 hlslTarget vs_4_0 hlslEntry ShadowVertexShader   :     Д      4      4  	  Ф    †ShadowVertexShader   . >  	 input                                  P     Ф    4     P    Ф    4    P    Ф    4    P    Ф    4    P    Ф    4    P    Ф    4    P    Ф    4    P    Ф    4     P     Ф    4$   J >  И <ShadowVertexShader return value>                                  P  4  Ф    4@    P  8  Ф    4D    P  <  Ф    4H    P  $  Ф    40    P  (  Ф    44    P  ,  Ф    48    P  0  Ф    4<    P    Ф    4     P    Ф    4$    P     Ф    4(    P    Ф    4    P    Ф    4    P     Ф    4     P    Ф    4    P    Ф    4    P    Ф    4   . >   output                                 P      $   Ш      P     $   Ш     P     $   Ш     P     $   Ш     P      Љ   ћ     P     Љ   ћ     P     Љ   ћ     P     Љ   8    P     Ў   l     P     Ў   l     P      Ў   l     P   $  Љ       P   (  Љ       P   ,  Љ       P   0  Љ       P   4  а   и      P   8  а   и     P   <  а   и      ф         Ґ¬€IЋњzcn!3'EƒH  т           »      @     Ф   >  АФ   >   і   >  Аі   >   №   >  А№   >     >  А  >   $  ?  А$  ?   D  ?  АD  ?   l  ?  Аl  ?   Ф  ?  АФ  ?   Љ  @  АЉ  @   №  @  А№  @     @  А  @   ,  @  А,  @   T  Y  АT  Y   h  K  Аh  K   И  K  АИ  K   ∞  K  А∞  K   Ў  N  АЎ  N   ф  N  Аф  N     N  А  N   $  D  А$  D   D  D  АD  D   l  D  Аl  D   Ф  D  АФ  D   Љ  T  АЉ  T   а  E  Аа  E      E  А   E   (  E  А(  E   P  E  АP  E   x  W  Аx  W   Ф  W  АФ  W   ®  W  А®  W   ƒ  Y  Аƒ  Y    7  6  7  6  7  6  7  6  7  6  7  6  7  6  7  6  =  <  =  <  =  <  =  <      =  <  =  <  =  <  -  ,  -  ,  -  ,  N   M  N   M  N   M  N   M  <  ;  T   S  T   S  T   S  T   S  1  0  1  0  1  0     ц                 $   D   d   М   ∞   №                                                                                                                                                                                                                                                                                18        Є  
 €€   А      <   <      D        @       float4 утс @       float3 утс @       float2 утс:       position с    normal утс    tex тс&              $ VertexInputType тс
      j       position с    tex тс    normal утс    $ lightViewPosition    4 lightPos с&              @ PixelInputType утс
             @            @ float4x4 
 
    
     
     
                      18              €€   А                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   float3 lightPos : TEXCOORD2;
};


////////////////////////////////////////////////////////////////////////////////
// Vertex Shader
////////////////////////////////////////////////////////////////////////////////
PixelInputType ShadowVertexShader(VertexInputType input)
{
    PixelInputType output;
    float4 worldPosition;
    
    
    // Change the position vector to be 4 units for proper matrix calculations.
    input.position.w = 1.0f;

    // Calculate the position of the vertex against the world, view, and projection matrices.
    output.position = mul(input.position, worldMatrix);
    output.position = mul(output.position, viewMatrix);
    output.position = mul(output.position, projectionMatrix);
    
    // Calculate the position of the vertice as viewed by the light source.
    output.lightViewPosition = mul(input.position, worldMatrix);
    output.lightViewPosition = mul(output.lightViewPosition, lightViewMatrix);
    output.lightViewPosition = mul(output.lightViewPosition, lightProjectionMatrix);

    // Store the texture coordinates for the pixel shader.
    output.tex = input.tex;
    
    // Calculate the normal vector against the world matrix only.
    output.normal = mul(input.normal, (float3x3)worldMatrix);
    
    // Normalize the normal vector.
    output.normal = normalize(output.normal);

    // Calculate the position of the vertex in the world.
    worldPosition = mul(input.position, worldMatrix);

    // Determine the light position based on the position of the light and the position of the vertex in the world.
    output.lightPos = lightPosition.xyz - worldPosition.xyz;

    // Normalize the light position vector.
    output.lightPos = normalize(output.lightPos);

    return output;
}        8      9   p                                                                                                                                                                                                                                                 D3DSHDR »                             `                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        €€€€	/с8      e      E      %      Ё            ±      Н                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              $   0   <   H                                                                                                                                                                                                                                                                                                                                                                                                                           " %    Ф    ShadowVertexShader     Q       €€€€€€worldMatrix  Q     @ €€€€€€viewMatrix  & Q     А €€€€€€projectionMatrix    " Q     ј €€€€€€lightViewMatrix * Q      €€€€€€lightProjectionMatrix   " Q      €€€€€€lightPosition                                                                                                                                                                                                                                                                                              €€€€	/с                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            €€€€w	1     Л Ј√   X       ,   D                                    »     `             	 И      L      И'         ShadowVertexShader none -Ї.с /     »     `  /                 €€€€    »        €€€€    €€€€         F:\D3D11Demo\D3D11Demo\Resources\Shaders\ShadowVS.hlsl  юпюп                  €€€€€€€€€€ €€€€€€€€€€                                                                                                                                                                         Ф.1џ!ІU   Д1Ґ≠ЧоДOЭ«ђ5zЧLd   /LinkInfo /names /src/headerblock /src/files/f:\d3d11demo\d3d11demo\resources\shaders\shadowvs.hlsl          :             
             "          AС2                                                                                                                                                                                                                                                                                                                                       ј   р  W  8         А   |
  ф  D       (   h  ,         !                                     	   
                                                                                                                                                                                                                                                                                                                                                                                     "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               