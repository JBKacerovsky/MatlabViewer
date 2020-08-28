using UnityEngine;

public class PanelResize : MonoBehaviour
{
    private RectTransform rectTransform;
    [SerializeField] private float scaleIncrement = 50; 

    private void Start()
    {
        rectTransform = gameObject.GetComponent<RectTransform>();
    }

    public void Yplus()
    {
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, rectTransform.rect.height + scaleIncrement);
    }

    public void Yminus()
    {
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, rectTransform.rect.height - scaleIncrement);
    }

    public void Xplus()
    {
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, rectTransform.rect.width + scaleIncrement);
    }

    public void Xminus()
    {
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, rectTransform.rect.width - scaleIncrement);
    }
}
