DXBC٥?H??H?ɰWi?o   ?V     8   \  ?  t  D  ?  RDEF     x          ??	  ?  \                              i                             MatrixBuffer LightBuffer2 ??\      ?   @          i      ?                    @      ,      <  @   @      ,      G  ?   @      ,      X  ?   @      ,      h     @      ,      worldMatrix             viewMatrix projectionMatrix lightViewMatrix lightProjectionMatrix ???            ?      ?            ?      lightPosition ??            padding              Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 ??ISGNl         P                    Y                   `                   POSITION NORMAL TEXCOORD ???OSGN?         ?                    ?                   ?                   ?                   ?                  SV_POSITION TEXCOORD NORMAL SHDR?  @  2  Y  F?         Y  F?        _  r     _  r    _  2    g  ?         e  2     e  r     e  ?     e  r     h     8  ?      V     F?         2  
?           F?          F     2  
?      ?     F?         F        ?      F     F?         8  ?     V     F?         2  
?           F?         F    2  
?     ?
     F?         F    2  
?     ?     F?         F    8  ?     V    F?      	   2  
?          F?         F    2  
?     ?
    F?      
   F    2  
?      ?    F?         F    6  2     F    8  r     V    F?         2  
r         F?          F    2  
r     ?    F?         F      ?     F    F    D  ?     :     8  r     ?    F    8  ?     V     F?         2  
?           F?         F    2  
?     ?
     F?         F    2  
?     ?     F?         F       	r      F?A       F?         8  ?     V    F?         2  
?          F?         F    2  
?     ?
    F?         F    2  
?     ?    F?         F      ?      F     F     D  ?      :      8  r     ?     F     >  STATt                                                                                                                  SPDB N  Microsoft C/C++ MSF 7.00
DS         '   ?       #                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????8   ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????       <       ????                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ?.1?!?U   ?1?????O?Ǭ5z?L                          A?2                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ojectionMatrix;
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
   ws  3M  /,  6$  ?  L  ?2  ?F  ?1  ?(  ?*  ?Z  ?/  ~3  ?2                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ////////////////////////////////////////////////////////////////////////////////
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
}                                                                                                                                                                                                                                                                                                                                                                                                    ????   ?
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
    matrix lightPr?0?   y4?u??                                                               9   (   ?0?,S|
     8   9                                                                                                                                                                                                                                                                                                                                                                                                                  J <      @?%   @?%Microsoft (R) HLSL Shader Compiler 6.3.9600.16384 B =hlslFlags 0x9 hlslTarget vs_4_0 hlslEntry ShadowVertexShader   :     ?      4      4  	  ?    ?ShadowVertexShader   . >  	 input                                  P     ?    4     P    ?    4    P    ?    4    P    ?    4    P    ?    4    P    ?    4    P    ?    4    P    ?    4     P     ?    4$   J >  ? <ShadowVertexShader return value>                                  P  4  ?    4@    P  8  ?    4D    P  <  ?    4H    P  $  ?    40    P  (  ?    44    P  ,  ?    48    P  0  ?    4<    P    ?    4     P    ?    4$    P     ?    4(    P    ?    4    P    ?    4    P     ?    4     P    ?    4    P    ?    4    P    ?    4   . >   output                                 P      $   ?      P     $   ?     P     $   ?     P     $   ?     P      ?   ?     P     ?   ?     P     ?   ?     P     ?   8    P     ?   l     P     ?   l     P      ?   l     P   $  ?       P   (  ?       P   ,  ?       P   0  ?       P   4  ?   ?      P   8  ?   ?     P   <  ?   ?      ?         ???I˿zcn!3'E?H  ?           ?      @     ?   >  ??   >   ?   >  ??   >   ?   >  ??   >     >  ?  >   $  ?  ?$  ?   D  ?  ?D  ?   l  ?  ?l  ?   ?  ?  ??  ?   ?  @  ??  @   ?  @  ??  @     @  ?  @   ,  @  ?,  @   T  Y  ?T  Y   h  K  ?h  K   ?  K  ??  K   ?  K  ??  K   ?  N  ??  N   ?  N  ??  N     N  ?  N   $  D  ?$  D   D  D  ?D  D   l  D  ?l  D   ?  D  ??  D   ?  T  ??  T   ?  E  ??  E      E  ?   E   (  E  ?(  E   P  E  ?P  E   x  W  ?x  W   ?  W  ??  W   ?  W  ??  W   ?  Y  ??  Y    7  6  7  6  7  6  7  6  7  6  7  6  7  6  7  6  =  <  =  <  =  <  =  <      =  <  =  <  =  <  -  ,  -  ,  -  ,  N   M  N   M  N   M  N   M  <  ;  T   S  T   S  T   S  T   S  1  0  1  0  1  0     ?                 $   D   d   ?   ?   ?                                                                                                                                                                                                                                                                               ?18        ?  
 ??   ?      <   <      D        @       float4 ??? @       float3 ??? @       float2 ???:       position ?    normal ???    tex ??&              $ VertexInputType ??
      j       position ?    tex ??    normal ???    $ lightViewPosition    4 lightPos ?&              @ PixelInputType ???
             @            @ float4x4 
 
    
     
     
                     ?18              ??   ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   float3 lightPos : TEXCOORD2;
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
}        8      9   p                                                                                                                                                                                                                                                 D3DSHDR ?                             `                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ????	/?8      e      E      %      ?            ?      ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              $   0   <   H                                                                                                                                                                                                                                                                                                                                                                                                                           " %    ?    ShadowVertexShader     Q       ??????worldMatrix  Q     @ ??????viewMatrix  & Q     ? ??????projectionMatrix    " Q     ? ??????lightViewMatrix * Q      ??????lightProjectionMatrix   " Q      ??????lightPosition                                                                                                                                                                                                                                                                                              ????	/?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ????w	1     ? ??   X       ,   D                                    ?     `             	 ?      L      ?'         ShadowVertexShader none -?.? /     ?     `  /                 ????    ?        ????    ????         F:\D3D11Demo\D3D11Demo\Resources\Shaders\ShadowVS.hlsl  ????                  ?????????? ??????????                                                                                                                                                                         ?.1?!?U   ?1?????O?Ǭ5z?Ld   /LinkInfo /names /src/headerblock /src/files/f:\d3d11demo\d3d11demo\resources\shaders\shadowvs.hlsl          :             
             "          A?2                                                                                                                                                                                                                                                                                                                                       ?   ?  W  8         ?   |
  ?  D       (   h  ,         !                                     	   
                                                                                                                                                                                                                                                                                                                                                                                     "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               