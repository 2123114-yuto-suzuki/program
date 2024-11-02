using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RockGenerator : MonoBehaviour
{
    public GameObject rockPrefab;
	public float interval = 0.5f; 
	float timer = 0;

	void Update()
	{
		timer += Time.deltaTime;
		if (timer >= interval)
		{
			timer = 0; //タイマーのリセット

			GameObject o = Instantiate(rockPrefab);

			o.transform.position = new Vector3(Random.Range(-5, 5), 7, 0); 
		}
	}
}
