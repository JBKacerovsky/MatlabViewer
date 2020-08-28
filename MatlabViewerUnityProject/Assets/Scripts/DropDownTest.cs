using UnityEngine;
using UnityEngine.UI.Extensions;
using System.IO;
using System.Collections.Generic;

public class DropDownTest : MonoBehaviour
{
    public AutoCompleteComboBox dropDown;
    private string[] _files; 

    // Start is called before the first frame update
    void Start()
    {
        _files = Directory.GetFiles(Application.streamingAssetsPath, "*.mat");

        List<string> _fileList = new List<string>();

        for (int i = 0; i < _files.Length; i++)
        {
            string[] temp = _files[i].Split(Path.DirectorySeparatorChar);
            _fileList.Add(temp[temp.Length - 1]);
        }

        dropDown.SetAvailableOptions(_fileList);
        dropDown.ItemsToDisplay = _files.Length;
    }

    public void DD()
    {
        string val = dropDown.Text;
        Debug.Log(Application.streamingAssetsPath+ Path.DirectorySeparatorChar+val);
    }
}
