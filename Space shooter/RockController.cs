using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class RockController : MonoBehaviour
{
    float fallSpeed;
    float rotSpeed;
    string currentScene;

    // Start is called before the first frame update
    void Start()
    {
        this.fallSpeed = 15.0f * Time.deltaTime * Random.value;
        this.rotSpeed = 0.5f * Time.deltaTime * Random.value;

        // ���݂̃V�[�������擾
        currentScene = SceneManager.GetActiveScene().name;
    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(0, -fallSpeed, 0, Space.World);
        transform.Rotate(0, 0, rotSpeed);

        if (currentScene == "HardMode")
        {
            // HardMode�̏ꍇ�̏���
            if (transform.position.y < -3.5f)
            {
                SceneManager.LoadScene("HardModeResult"); // "Result"�V�[�������[�h
            }
        }
        else if (currentScene == "Game")
        {
            // Game�V�[���̏ꍇ�̏���
            if (transform.position.y < -5.5f)
            {
                Destroy(gameObject); // �Q�[���I�u�W�F�N�g��j��
            }
        }
    }
}
