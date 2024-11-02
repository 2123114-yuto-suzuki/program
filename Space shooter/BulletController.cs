using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletController : MonoBehaviour
{
    public GameObject explosionPrefab;
    GameDirector gameDirector;
    HardModeDirector hardmodeDirector;

    // Start is called before the first frame update
    void Start()
    {
        // "GameDirector" が存在する場合は取得する
        GameObject gameDirectorObject = GameObject.Find("GameDirector");
        if (gameDirectorObject != null)
        {
            gameDirector = gameDirectorObject.GetComponent<GameDirector>();
        }

        // "HardModeDirector" が存在する場合は取得する
        GameObject hardmodeDirectorObject = GameObject.Find("HardModeDirector");
        if (hardmodeDirectorObject != null)
        {
            hardmodeDirector = hardmodeDirectorObject.GetComponent<HardModeDirector>();
        }
    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(0, 50.0f * Time.deltaTime, 0);

        if (transform.position.y > 5)
        {
            Destroy(gameObject);
        }
    }

    void OnTriggerEnter2D(Collider2D coll)
    {
        Instantiate(explosionPrefab, transform.position, Quaternion.identity);
        Destroy(coll.gameObject);
        Destroy(gameObject);

        // HardModeDirector が存在する場合、そのメソッドを呼び出す
        if (hardmodeDirector != null)
        {
            hardmodeDirector.AddPoint(1);
        }
        // GameDirector が存在する場合、そのメソッドを呼び出す
        else if (gameDirector != null)
        {
            gameDirector.AddPoint(1);
        }
    }
}