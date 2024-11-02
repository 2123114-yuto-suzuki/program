using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Result : MonoBehaviour
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
		pointText.text = GameDirector.GetPoint().ToString();

		if (GameDirector.GetPoint() >= 100)
		{
			rankText.text = "S";
		}
		else if (GameDirector.GetPoint() >= 50)
		{
			rankText.text = "A";
		}
		else if (GameDirector.GetPoint() >= 10)
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
