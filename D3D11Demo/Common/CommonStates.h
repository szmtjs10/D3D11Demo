//--------------------------------------------------------------------------------------
// File: CommonStates.h
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
// ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//
// http://go.microsoft.com/fwlink/?LinkId=248929
//--------------------------------------------------------------------------------------

#pragma once

#if defined(_XBOX_ONE) && defined(_TITLE)
#include <d3d11_x.h>
#else
#include <d3d11_1.h>
#endif

#include <memory>


namespace DirectX
{
    class CommonStates
    {
    public:
		static CommonStates* GetInstancePtr()
		{
			static CommonStates _instance;
			return &_instance;
		}
		static CommonStates& CommonStates::GetInstance()
		{
			return *GetInstancePtr();
		}

        virtual ~CommonStates();
		void ReleaseAll();
        // Blend states.
		ID3D11BlendState* __cdecl Add() const;
        ID3D11BlendState* __cdecl Opaque() const;
        ID3D11BlendState* __cdecl AlphaBlend() const;
        ID3D11BlendState* __cdecl Additive() const;
        ID3D11BlendState* __cdecl NonPremultiplied() const;

        // Depth stencil states.
        ID3D11DepthStencilState* __cdecl DepthNone() const;
        ID3D11DepthStencilState* __cdecl DepthDefault() const;
        ID3D11DepthStencilState* __cdecl DepthRead() const;		

        // Rasterizer states.
        ID3D11RasterizerState* __cdecl CullNone() const;
        ID3D11RasterizerState* __cdecl CullClockwise() const;
        ID3D11RasterizerState* __cdecl CullCounterClockwise() const;
        ID3D11RasterizerState* __cdecl Wireframe() const;

        // Sampler states.
        ID3D11SamplerState* __cdecl PointWrap() const;
        ID3D11SamplerState* __cdecl PointClamp() const;
        ID3D11SamplerState* __cdecl LinearWrap() const;
        ID3D11SamplerState* __cdecl LinearClamp() const;
        ID3D11SamplerState* __cdecl AnisotropicWrap() const;
        ID3D11SamplerState* __cdecl AnisotropicClamp() const;

    private:
        // Private implementation.
        class Impl;

        std::shared_ptr<Impl> pImpl;
		explicit CommonStates();

        // Prevent copying.
        CommonStates(CommonStates const&);
        CommonStates& operator= (CommonStates const&);
    };
}
#define  g_objStates CommonStates::GetInstance()