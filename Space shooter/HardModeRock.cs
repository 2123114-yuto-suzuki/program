using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class HardModeRock : MonoBehaviour
{
    float fallSpeed;
    float rotSpeed;


    // Start is called before the first frame update
    void Start()
    {
        this.fallSpeed = 15.0f * Time.deltaTime * Random.value;
        this.rotSpeed = 0.5f * Time.deltaTime * Random.value;
    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(0, -fallSpeed, 0, Space.World);
        transform.Rotate(0, 0, rotSpeed);

        if (transform.position.y < -3.5f)
        {
            SceneManager.LoadScene("Result");
        }
    }
}