using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class HardModeDirector : MonoBehaviour
{
	Text pointText; //点数テキストオブジェクト
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
		pointText = GameObject.Find("Point").GetComponent<Text>();
		point = 0;
	}

	// Update is called once per frame
	void Update()
	{
		pointText.text = point.ToString(); //点数を表示
	}
}