using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameDirector : MonoBehaviour
{
	Text timerText; //残り時間テキストオブジェクト
	Text pointText; //点数テキストオブジェクト

	public float gameTime = 60.0f;  //制限時間
	float timer = 0.0f; //経過時間タイマー
	static int point;   //ポイント用変数

	public void AddPoint(int s)
	{
		point += s;
	}

	public static int GetPoint()
	{
		return point;
	}

	// Use this for initialization
	void Start()
	{
		timerText = GameObject.Find("Time").GetComponent<Text>();
		pointText = GameObject.Find("Point").GetComponent<Text>();
		point = 0;
		timer = 0.0f;
	}

	// Update is called once per frame
	void Update()
	{
		timer += Time.deltaTime;

		timerText.text = (gameTime - timer).ToString("F1"); //残り時間を小数点第1位で表示
		pointText.text = point.ToString(); //点数を表示

		if (timer >= gameTime)
		{
			SceneManager.LoadScene("Result");
		}
	}
}