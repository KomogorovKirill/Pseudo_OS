This repository provides a concept for transferring the processor to different operating modes. At the same time, related preparatory work is carried out on memory areas and, as an optimization, the A20 line of the CPU is unlocked.

For correct operation you need to install [Qemu](https://www.qemu.org/).

---Instructions for use---

Assembly: *make*

Cleaning up the space after assembly: *make clean*

Launch of the project: *make run*


---Example of the work---

Welcome Screen

![](./img/start.png)

Entering the password

![](./img/enter_password.png)

The correct password is *543*

Displaying information about an invalid password

![](./img/wrong_password.png)

Displaying information about an correct password

![](./img/win.png)
