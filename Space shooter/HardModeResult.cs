using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class HardModeResult : MonoBehaviour
{
	Text pointText;
	Text rankText;

	// Start is called before the first frame update
	void Start()
	{
		pointText = GameObject.Find("Point").GetComponent<Text>();
		rankText = GameObject.Find("Rank").GetComponent<Text>();
	}

	// Update is called once per frame
	void Update()
	{
		pointText.text = HardModeDirector.GetPoint().ToString();
		
		if (HardModeDirector.GetPoint() >= 500)
		{
			rankText.text = "SSS";
		}
		else if (HardModeDirector.GetPoint() >= 400)
		{
			rankText.text = "SS";
		}
		else if (HardModeDirector.GetPoint() >= 300)
		{
			rankText.text = "S";
		}
		else if (HardModeDirector.GetPoint() >= 200)
		{
			rankText.text = "A";
		}
		else if (HardModeDirector.GetPoint() >= 100)
		{
			rankText.text = "B";
		}
		else
		{
			rankText.text = "C";
		}

		if (Input.GetKeyDown(KeyCode.R))
		{
			SceneManager.LoadScene("Title");
		}

		if (Input.GetKeyDown(KeyCode.F))
		{
			ExitGame();
		}
	}

	void ExitGame()
	{
#if UNITY_EDITOR
		UnityEditor.EditorApplication.isPlaying = false;
#else
		Application.Quit();
#endif
	}
}
