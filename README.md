# Implementasi Pada level baru:
	
## Platform dan air yang menyatu
Saya menggunakan 2 buah TileMapLayer agar platform dan air terlihat menyatu dengan platform. Berdasarkan [sumber](https://www.youtube.com/watch?v=o2OzgXYbkPY), kita dapat mengatur z index dari TileSet untuk mengatur Tile mana yang berada diatas atau bawah.

## Musuh atau obstacle yang dapat menyesuaikan dengan posisi Player
1. Membuat CharacterBody2D untuk node musuh yaitu BarnacleMissile. Disini saya menggunakan CharacterBody2D agar dapat melakukan [move_and_slide](https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html). Hal ini penting karena musuh yang ingin saya implementasi berakselerasi kearah player.
2. Menambahkan Area2D di dalam BarnacleMissile agar dapat mengurangi health Player jika tersentuh
3. Menambahkan script yang sama seperti Area2D milik FallingFish pada node BarnacleMissile
4. Menambahkan script untuk BarnacleMissile yang berisi perhitungan angle dan akselerasi BarnacleMissile kearan Player
5. Menambahkan spawner untuk BarnacleMissile pada scene Level 2 lalu menambahkan script. Pada script tersebut, dihitung tinggi relatif spawner terhadap Player agar jarak vertikal titik spawn dengan player selalu sama. Selain itu, BarnacleMissile juga diset agar spawn tidak terlalu jauh dari Player secara horizontal.

## Healthbar
1. Membuat scene/node heart yang akan menampung sprite hati
2. Membuat 2DNode HealthBar pada Player yang akan menjadi placeholder dari node heart lalu meletakkannya pada pojok kiri atas Camera2D
3. Membuat variable health dan menggunakan [PackedScene](https://docs.godotengine.org/en/stable/classes/class_packedscene.html) pada script Player agar dapat mengimport suatu scene
4. Menginstansiasi node heart dengan PackedScene sebanyak jumlah health lalu mengatur posisi heart dari kiri ke kanan di dalam node HealthBar. Setelah itu tiap node heart disimpan didalam list of heart secara berurutan agar dapat dipop dari kanan ke kiri. 
5. Menambahkan method take_damage untuk mengurangi health dan pop list of heart.
6. Menambahkan pemanggilan method take_damage pada signal on_body_entered di dalam script Area2D milik FallingFish dan BarnacleMissile agar setiap terkena kedua node tersebut, maka health Player akan berkurang.
