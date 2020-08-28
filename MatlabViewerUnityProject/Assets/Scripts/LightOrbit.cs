using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightOrbit : MonoBehaviour
{
    private Transform _lightManager;

    private Vector3 _LocalRotation;

    public float MouseSensitivity = 4f;
    public float OrbitDampening = 10f;

    public bool LightsDisabled = true;

    // Start is called before the first frame update
    void Start()
    {
        _lightManager = transform;
        LightsDisabled = true;
    }


    void LateUpdate()
    {
        if (Input.GetKeyDown(KeyCode.L))
        {
            toggleLightOrbit();
        }

        if (!LightsDisabled)
        {
            if (Input.GetMouseButton(0))
            {
                if (Input.GetAxis("Mouse X") != 0 || Input.GetAxis("Mouse Y") != 0)
                {
                    _LocalRotation.y += Input.GetAxis("Mouse X") * MouseSensitivity;
                    _LocalRotation.x -= Input.GetAxis("Mouse Y") * MouseSensitivity;

                    Quaternion QT = Quaternion.Euler(_LocalRotation.x, _LocalRotation.y, 0);
                    _lightManager.rotation = Quaternion.Lerp(_lightManager.rotation, QT, Time.deltaTime * OrbitDampening);
                }
            }
        }
    }

    public void toggleLightOrbit()
    {
        LightsDisabled = !LightsDisabled;
    }
}