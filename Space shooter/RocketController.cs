using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RocketController : MonoBehaviour
{
    const float moveMax = 5.0f;
    public GameObject bullet;

    public AudioClip sound1;
    AudioSource audioSource;

    // Start is called before the first frame update
    void Start()
    {
        audioSource = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.LeftArrow))
        {
            if (this.transform.position.x >= -moveMax)
            {
                transform.Translate(-10.0f * Time.deltaTime, 0, 0);
            }
        }

        if (Input.GetKey(KeyCode.RightArrow))
        {
            if (this.transform.position.x <= moveMax)
            {
                transform.Translate(10.0f * Time.deltaTime, 0, 0);
            }
        }

        if (Input.GetKeyDown(KeyCode.Space))
        {
            Instantiate(bullet, transform.position, Quaternion.identity);
            audioSource.PlayOneShot(sound1);
        }
    }
}

