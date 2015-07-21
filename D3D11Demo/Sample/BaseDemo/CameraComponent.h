#pragma once
#include "HpD3D9Type.h"

class CameraComponent
{
public:
	CameraComponent();
	~CameraComponent();
	// Functions to change camera matrices
	virtual void                Reset();
	virtual void                SetViewParams(Vector3 vEyePt, Vector3 vLookatPt, Vector3 vEyePtUp = Vector3::Up);
	virtual void                SetProjParams(FLOAT fFOV, FLOAT fAspect, FLOAT fNearPlane, FLOAT fFarPlane);

	// Functions to get state
	Matrix GetViewMatrix() 	{ return m_mView; }
	Matrix GetProjMatrix() { return m_mProj; }


private:
	Vector3 m_vDefaultEye;          // Default camera eye position
	Vector3 m_vDefaultLookAt;       // Default LookAt position
	Vector3 m_vEye;                 // Camera eye position
	Vector3 m_vLookAt;              // LookAt position


	float m_fFOV;                 // Field of view
	float m_fAspect;              // Aspect ratio
	float m_fNearPlane;           // Near plane
	float m_fFarPlane;            // Far plane


	Matrix m_mView;              // View matrix 
	Matrix m_mProj;              // Projection matrix
	
};

