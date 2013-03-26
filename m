From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [Suggestion] kernel: 'now' may be used uninitialized in posix_cpu_timer_schedule
 function
Date: Tue, 26 Mar 2013 14:41:23 +0800
Message-ID: <51514313.1070505@asianux.com>
References: <51514202.2030504@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51514202.2030504@asianux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, Greg KH <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


 oh, sorry, it seems better to let ARM folks know about it.

 ;-)


On 2013=E5=B9=B403=E6=9C=8826=E6=97=A5 14:36, Chen Gang wrote:
> Hello Maintainers:
>=20
>   compiling with EXTRA_CFLAGS=3D-W:
>     make V=3D1 EXTRA_CFLAGS=3D-W ARCH=3Darm s3c2410_defconfig
>     make V=3D1 EXTRA_CFLAGS=3D-W ARCH=3Darm menuconfig
>       set 'arm-linux-gnu-' for cross chain prefix
>     make V=3D1 EXTRA_CFLAGS=3D-W ARCH=3Darm
>=20
>   it will report:
>     kernel/posix-cpu-timers.c:1065:19: warning: =E2=80=98now=E2=80=99=
 may be used uninitialized in this function [-Wuninitialized]
>=20
>   it seems it is really a bug.
>     can any member help to fix it ?
>     or provide additional suggestion ?
>       (it seems only "unsigned long long now =3D 0" is not enough).
>=20
>   :-)
>=20
>=20
>=20
> in kernel/posix-cpu-timers.c:
>   for variable 'now' is defined without initialization (line 1029)
>   it may be used without initialization (line 1066)
>=20
>=20
> 1026 void posix_cpu_timer_schedule(struct k_itimer *timer)
> 1027 {
> 1028         struct task_struct *p =3D timer->it.cpu.task;
> 1029         unsigned long long now;
> 1030=20
> 1031         if (unlikely(p =3D=3D NULL))
> 1032                 /*
> 1033                  * The task was cleaned up already, no future fi=
rings.
> 1034                  */
> 1035                 goto out;
> 1036=20
> 1037         /*
> 1038          * Fetch the current sample and update the timer's expir=
y time.
> 1039          */
> 1040         if (CPUCLOCK_PERTHREAD(timer->it_clock)) {
> 1041                 cpu_clock_sample(timer->it_clock, p, &now);
> 1042                 bump_cpu_timer(timer, now);
> 1043                 if (unlikely(p->exit_state)) {
> 1044                         clear_dead_task(timer, now);
> 1045                         goto out;
> 1046                 }
> 1047                 read_lock(&tasklist_lock); /* arm_timer needs it=
=2E  */
> 1048                 spin_lock(&p->sighand->siglock);
> 1049         } else {
> 1050                 read_lock(&tasklist_lock);
> 1051                 if (unlikely(p->sighand =3D=3D NULL)) {
> 1052                         /*
> 1053                          * The process has been reaped.
> 1054                          * We can't even collect a sample any mo=
re.
> 1055                          */
> 1056                         put_task_struct(p);
> 1057                         timer->it.cpu.task =3D p =3D NULL;
> 1058                         timer->it.cpu.expires =3D 0;
> 1059                         goto out_unlock;
> 1060                 } else if (unlikely(p->exit_state) && thread_gro=
up_empty(p)) {
> 1061                         /*
> 1062                          * We've noticed that the thread is dead=
, but
> 1063                          * not yet reaped.  Take this opportunit=
y to
> 1064                          * drop our task ref.
> 1065                          */
> 1066                         clear_dead_task(timer, now);
> 1067                         goto out_unlock;
> 1068                 }
> 1069                 spin_lock(&p->sighand->siglock);
> 1070                 cpu_timer_sample_group(timer->it_clock, p, &now)=
;
> 1071                 bump_cpu_timer(timer, now);
> 1072                 /* Leave the tasklist_lock locked for the call b=
elow.  */
> 1073         }
> 1074=20
> 1075         /*
> 1076          * Now re-arm for the new expiry time.
> 1077          */
> 1078         BUG_ON(!irqs_disabled());
> 1079         arm_timer(timer);
> 1080         spin_unlock(&p->sighand->siglock);
> 1081=20
> 1082 out_unlock:
> 1083         read_unlock(&tasklist_lock);
> 1084=20
> 1085 out:
> 1086         timer->it_overrun_last =3D timer->it_overrun;
> 1087         timer->it_overrun =3D -1;
> 1088         ++timer->it_requeue_pending;
> 1089 }
>=20


--=20
Chen Gang

Asianux Corporation
