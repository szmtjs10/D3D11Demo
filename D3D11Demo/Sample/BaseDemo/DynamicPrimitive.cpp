#include "DynamicPrimitive.h"
#include "DeviceManager.h"
#include "VertexTypes.h"
#include "D3D11RendererMaterial.h"
#include "d3dUtil.h"
#include "CommonStates.h"

DynamicPrimitive& DynamicPrimitive::GetInstance()
{
	static DynamicPrimitive _instance;
	return *(&_instance);
}

DynamicPrimitive::DynamicPrimitive(int initialBufferCapacity /*= 32*/, int maxBufferSizePerPrimitive /*= 32768*/)
{
	m_initialBufferCapacity = initialBufferCapacity;
	m_maxBufferSizePerPrimitive = maxBufferSizePerPrimitive;
	m_d3dDevice = g_objDeviecManager.GetDevice();
	m_deviceContext = g_objDeviecManager.GetImmediateContext();

	RendererMaterialDesc desc;
	desc.vertexShaderPath = "DynamicPrimitiveVS.hlsl";
	desc.pixelShaderPath = "DynamicPrimitivePS.hlsl";
	desc.geometryShaderPath = desc.vertexShaderPath;
	desc.vecPass.push_back("mainTex");
	desc.vecPass.push_back("mainColor");


	m_MaterialPtr = std::make_shared<D3D11RendererMaterial>(desc);
	CreateIndexBuffer(0, 0);
	CreateVertexBuffer(0, 0);


}

DynamicPrimitive::~DynamicPrimitive()
{
	SAFE_RELEASE(m_vertexBuffer);
	SAFE_RELEASE(m_indexBuffer);

}

void DynamicPrimitive::CreateIndexBuffer(int nType, int nSize)
{
	D3D11_BUFFER_DESC  indexBufferDesc;
	indexBufferDesc.Usage = D3D11_USAGE_DEFAULT;
	indexBufferDesc.ByteWidth = sizeof(unsigned long)* m_initialBufferCapacity;
	indexBufferDesc.BindFlags = D3D11_BIND_INDEX_BUFFER;
	indexBufferDesc.CPUAccessFlags = 0;
	indexBufferDesc.MiscFlags = 0;
	indexBufferDesc.StructureByteStride = 0;
	HRESULT result = S_FALSE;
	result = m_d3dDevice->CreateBuffer(&indexBufferDesc, NULL, &m_indexBuffer);
	if (FAILED(result))
	{
		return;
	}
}

void DynamicPrimitive::CreateVertexBuffer(int nType, int nSize)
{
	D3D11_BUFFER_DESC vertexBufferDesc;
	vertexBufferDesc.Usage = D3D11_USAGE_DYNAMIC; //??̬????
	vertexBufferDesc.ByteWidth = sizeof(VertexPositionColorTexture)* m_maxBufferSizePerPrimitive;
	vertexBufferDesc.BindFlags = D3D11_BIND_VERTEX_BUFFER;
	vertexBufferDesc.CPUAccessFlags = D3D11_CPU_ACCESS_WRITE; //CPU ??д
	vertexBufferDesc.MiscFlags = 0;
	vertexBufferDesc.StructureByteStride = 0;

	HRESULT result = S_FALSE;
	result = m_d3dDevice->CreateBuffer(&vertexBufferDesc, NULL, &m_vertexBuffer);
}

void DynamicPrimitive::ShowRect(int x1, int y1, int x2, int y2, const XMFLOAT4& color, bool bDot, float dt /*= 0*/)
{
	float x = (float)x1;
	float y = (float)y1;
	float h = (float)y2 - y1;
	float w = (float)x2 - x1;

	XMFLOAT3 LeftTop = XMFLOAT3(x, y, 0.0f);
	XMFLOAT3 RightTop = XMFLOAT3(x + w, y, 0.0f);

	XMFLOAT3 LeftBottom = XMFLOAT3(x, (y + h), 0.0f);
	XMFLOAT3 RightBottom = XMFLOAT3(x + w, (y + h), 0.0f);

	VertexPositionColorTexture vertices[8] =
	{
		//???????ĸ???
		{ LeftBottom, color, XMFLOAT2(0, 1) },
		{ LeftTop, color, XMFLOAT2(0, 0) },

		{ LeftTop, color, XMFLOAT2(0, 0) },
		{ RightTop, color, XMFLOAT2(1, 0) },

		{ RightTop, color, XMFLOAT2(1, 0) },
		{ RightBottom, color, XMFLOAT2(1, 1) },

		{ RightBottom, color, XMFLOAT2(1, 1) },
		{ LeftBottom, color, XMFLOAT2(0, 1) }
	};

	XMMATRIX rz = XMMatrixRotationZ(XM_PI *dt);
	//??ƽ??Ϊԭ?㣬????ԭ????ת, ת????ƽ??ͶӰ???е?Ϊ??w/2,h/2??????ϵ??Y ?ǵߵ??ģ?????ת
	XMMATRIX rTmp = XMMatrixTranslation(-x, -y, 0.0)* rz * XMMatrixTranslation(x, y, 0.0);

	XMMATRIX toTexSpace = GetShow2DMatrix(m_nWidth, m_nHeight);
	toTexSpace = rTmp * toTexSpace;
//	m_MaterialPtr->SetbUseGeometry(bDot);
	DrawPrimitiveUP(PRIMITIVE_LINELIST, 8, vertices, toTexSpace);
}

void DynamicPrimitive::ShowBlock(int x1, int y1, int x2, int y2, const XMFLOAT4& color, float dt)
{
	float x = (float)x1;
	float y = (float)y1;
	float h = (float)y2 - y1;
	float w = (float)x2 - x1;

	XMFLOAT3 LeftTop = XMFLOAT3(x, y, 0.0f);
	XMFLOAT3 RightTop = XMFLOAT3(x + w, y, 0.0f);

	XMFLOAT3 LeftBottom = XMFLOAT3(x, (y + h), 0.0f);
	XMFLOAT3 RightBottom = XMFLOAT3(x + w, (y + h), 0.0f);


	VertexPositionColorTexture vertices[] =
	{
		//???????ĸ???
		{ LeftBottom, color, XMFLOAT2(0, 1) },
		{ LeftTop, color, XMFLOAT2(0, 0) },
		{ RightTop, color, XMFLOAT2(1, 0) },
		{ LeftBottom, color, XMFLOAT2(0, 1) },
		{ RightTop, color, XMFLOAT2(1, 0) },
		{ RightBottom, color, XMFLOAT2(1, 1) }
	};
	XMMATRIX rz = XMMatrixRotationZ(XM_PI *dt);
	//??ƽ??Ϊԭ?㣬????ԭ????ת, ת????ƽ??ͶӰ???е?Ϊ??w/2,h/2??????ϵ??Y ?ǵߵ??ģ?????ת
	XMMATRIX rTmp = XMMatrixTranslation(-x, -y, 0.0)* rz * XMMatrixTranslation(x, y, 0.0);

	XMMATRIX toTexSpace = GetShow2DMatrix(m_nWidth, m_nHeight);
	toTexSpace = rTmp * toTexSpace;
	//m_MaterialPtr->SetbUseGeometry(false);
	DrawPrimitiveUP(PRIMITIVE_TRIANGLELIST, 6, vertices, toTexSpace);
}

void DynamicPrimitive::DrawPrimitiveUP(PrimitiveType PrimitiveType, unsigned int PrimitiveCount, VertexPositionColor *pVertexs, const XMMATRIX &model /*= XMMatrixIdentity()*/, ID3D11ShaderResourceView*pTexture /*= NULL*/)
{
	std::vector<VertexPositionColorTexture> vertex;
	vertex.resize(PrimitiveCount);
	for (uint32 i = 0; i < PrimitiveCount; ++i)
	{
		VertexPositionColorTexture& pPoint = vertex[i];
		pPoint.color = pVertexs[i].color;
		pPoint.position = pVertexs[i].position;
	}
	DrawPrimitiveUP(PrimitiveType, PrimitiveCount, &vertex[0], model, pTexture);
}

void DynamicPrimitive::DrawPrimitiveUP(PrimitiveType PrimitiveType, unsigned int PrimitiveCount, VertexPositionColorTexture *pVertexs, const XMMATRIX &model /*= XMMatrixIdentity()*/, ID3D11ShaderResourceView*pTexture /*= NULL*/)
{
	D3D11_MAPPED_SUBRESOURCE mappedResource;
	ZeroMemory(&mappedResource, sizeof(D3D11_MAPPED_SUBRESOURCE));
	m_deviceContext->Map(m_vertexBuffer,
		0,
		D3D11_MAP_WRITE_DISCARD,
		0,
		&mappedResource);
	//	Update the vertex buffer here.
	int nSize = PrimitiveCount;
	if (nSize > m_maxBufferSizePerPrimitive)
	{
		nSize = m_maxBufferSizePerPrimitive;
	}
	memcpy(mappedResource.pData, pVertexs, nSize * sizeof(VertexPositionColorTexture));
	//	Reenable GPU access to the vertex buffer data.
	m_deviceContext->Unmap(m_vertexBuffer, 0);

	unsigned int stride;
	unsigned int offset;
	stride = sizeof(VertexPositionColorTexture);
	offset = 0;
	m_deviceContext->IASetInputLayout(m_MaterialPtr->getLayout<VertexPositionColorTexture>());
	m_deviceContext->IASetPrimitiveTopology((D3D_PRIMITIVE_TOPOLOGY)PrimitiveType);
	m_deviceContext->IASetVertexBuffers(0, 1, &m_vertexBuffer, &stride, &offset);


	m_MaterialPtr->SetMatrix(Matrix::Identity, Matrix::Identity, model);
	if (pTexture)
	{
		m_MaterialPtr->PSSetShaderResources("shaderTexture", &pTexture);
		m_MaterialPtr->setShaders();
	}
	else
	{
		m_MaterialPtr->setShaders(1);
	}

	ID3D11BlendState* AlphaBlendingState = g_objStates.AlphaBlend();
	FLOAT BlendFactor[4] = { 0.0f, 0.0f, 0.0f, 0.0f };
	m_deviceContext->OMSetBlendState(AlphaBlendingState, BlendFactor, 0xFFFFFFFF);
	m_deviceContext->Draw(PrimitiveCount, 0);
}


void DynamicPrimitive::ResetSize(int nWidth, int nHeight)
{
	m_nWidth = nWidth;
	m_nHeight = nHeight;
}

void DynamicPrimitive::ShowTexEx(RECT *pDest, RECT *pSrc, int nWidth, int nHeight, ID3D11ShaderResourceView*pTexture)
{
	XMFLOAT4 color(0, 0, 0, 0);
	int x = pDest->left;
	int y = pDest->top;

	int h = pDest->bottom - pDest->top;
	int w = pDest->right - pDest->left;

	XMFLOAT3 LeftTop = XMFLOAT3(x, y, 0.0f);
	XMFLOAT3 RightTop = XMFLOAT3(x + w, y, 0.0f);

	XMFLOAT3 LeftBottom = XMFLOAT3(x, (y + h), 0.0f);
	XMFLOAT3 RightBottom = XMFLOAT3(x + w, (y + h), 0.0f);
	int tmpX = (float)m_nWidth*1.0f / 2.0f - x;
	int tmpY = (float)m_nHeight*1.0f / 2.0f - y;
	VertexPositionColorTexture vertices[] =
	{
		//???????ĸ???
		{ LeftBottom, color, XMFLOAT2(0, 1) },
		{ LeftTop, color, XMFLOAT2(0, 0) },
		{ RightTop, color, XMFLOAT2(1, 0) },
		{ LeftBottom, color, XMFLOAT2(0, 1) },
		{ RightTop, color, XMFLOAT2(1, 0) },
		{ RightBottom, color, XMFLOAT2(1, 1) }
	};
	XMFLOAT2 textureCoordinate[4];
	textureCoordinate[0].x = textureCoordinate[1].x = float(pSrc->left) / (float)nWidth;
	textureCoordinate[0].y = textureCoordinate[3].y = float(pSrc->bottom) / (float)nHeight;


	textureCoordinate[2].x = textureCoordinate[3].x = float(pSrc->right) / (float)nWidth;
	textureCoordinate[2].y = textureCoordinate[1].y = float(pSrc->top) / (float)nHeight;
	vertices[0].textureCoordinate = textureCoordinate[0];
	vertices[1].textureCoordinate = textureCoordinate[1];
	vertices[2].textureCoordinate = textureCoordinate[2];

	vertices[3].textureCoordinate = textureCoordinate[0];
	vertices[4].textureCoordinate = textureCoordinate[2];
	vertices[5].textureCoordinate = textureCoordinate[3];


	// Transform NDC space [-1,+1]^2 to texture space [0,1]^2
	XMMATRIX toTexSpace = GetShow2DMatrix(m_nWidth, m_nHeight);
	DrawPrimitiveUP(PRIMITIVE_TRIANGLELIST, 6, vertices, toTexSpace, pTexture);
}

