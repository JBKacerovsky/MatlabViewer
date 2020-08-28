using UnityEngine;
using System.Collections;

public class CamOrbit : MonoBehaviour
{
    private Transform _XForm_Camera;
    private Transform _XForm_Parent;

    private Vector3 _LocalRotation;
    public float _CameraDistanceDefault = 3000;
    private float _CameraDistance;

    private Vector3 _LocalPosition;

    public float MouseSensitivity = 4f;
    public float ScrollSensitivity = 2f;
    public float OrbitDampening = 10f;
    public float ScrollDampening = 6f;

    public float MouseSensitivityPan = 400f;

    public bool CameraDisabled = true;
    public bool PanDisabled = true;

    // Start is called before the first frame update
    void Start()
    {
        _CameraDistance = _CameraDistanceDefault;
        _XForm_Camera = transform;
        _XForm_Parent = transform.parent;
        CameraDisabled = true;
    }

    // Update is called once per frame

    void LateUpdate()
    {
        if (Input.GetKeyDown(KeyCode.C))
        {
            toggleCamOrbit();
        }

        if (Input.GetKeyDown(KeyCode.P))
        {
            togglePan();
        }

        if (!CameraDisabled)
        {
            if (Input.GetMouseButton(0))
            {
                if (Input.GetAxis("Mouse X") != 0 || Input.GetAxis("Mouse Y") != 0)
                {
                    _LocalRotation.y += Input.GetAxis("Mouse X") * MouseSensitivity;
                    _LocalRotation.x += Input.GetAxis("Mouse Y") * MouseSensitivity;

                    _LocalRotation.x = Mathf.Clamp(_LocalRotation.x, -90f, 90f);
                }
            }

            if (Input.GetAxis("Mouse ScrollWheel") != 0f)
            {
                float ScrollAmount = Input.GetAxis("Mouse ScrollWheel") * ScrollSensitivity;

                ScrollAmount *= (_CameraDistance * 0.3f);
                _CameraDistance += ScrollAmount * -1f;
                _CameraDistance = Mathf.Clamp(_CameraDistance, 10f, 7000f);
            }

            Quaternion QT = Quaternion.Euler(_LocalRotation.x, _LocalRotation.y, 0);
            _XForm_Parent.rotation = Quaternion.Lerp(_XForm_Parent.rotation, QT, Time.deltaTime * OrbitDampening);

            if (_XForm_Camera.localPosition.z != _CameraDistance)
            {
                _XForm_Camera.localPosition = new Vector3(0f, 0f, Mathf.Lerp(_XForm_Camera.localPosition.z, _CameraDistance, Time.deltaTime * ScrollDampening));
            }
        }

        if (!PanDisabled)
        {
            if (Input.GetMouseButton(0))
            {
                if (Input.GetAxis("Mouse X") != 0 || Input.GetAxis("Mouse Y") != 0)
                {
                    _XForm_Parent.Translate(-Vector3.left * Input.GetAxis("Mouse X") * MouseSensitivityPan * Mathf.Abs(_CameraDistance) * Time.deltaTime);
                    _XForm_Parent.Translate(-Vector3.up * Input.GetAxis("Mouse Y") * MouseSensitivityPan * Mathf.Abs(_CameraDistance) * Time.deltaTime);
                }
            }
        }
    }

    public void toggleCamOrbit()
    {
        CameraDisabled = !CameraDisabled;
        PanDisabled = true; 
    }

    public void togglePan()
    {
        PanDisabled = !PanDisabled;
        CameraDisabled = true; 
    }

    public void RestView()
    {
        _CameraDistance = _CameraDistanceDefault;
        _LocalRotation = new Vector3(0, 0, 0);

        _XForm_Parent.position = new Vector3(0, 0, 0);
        _XForm_Parent.rotation = Quaternion.Euler(_LocalRotation);

        _XForm_Camera.localPosition = new Vector3(0f, 0f, _CameraDistance);
    }
}
