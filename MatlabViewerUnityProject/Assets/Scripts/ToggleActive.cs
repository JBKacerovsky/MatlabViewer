using UnityEngine;

public class ToggleActive : MonoBehaviour
{
    [SerializeField]private bool _active = false;

    public void ToggleSetActive()
    {
        _active = !_active;
        gameObject.SetActive(_active);
    }
}
