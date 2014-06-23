From: Tushar Behera <trblinux@gmail.com>
Subject: Re: Boot regression on Arndale Octa
Date: Mon, 23 Jun 2014 09:37:02 +0530
Message-ID: <53A7A7E6.5030903@gmail.com>
References: <53A7009C.3090003@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:40576 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711AbaFWEHG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 00:07:06 -0400
Received: by mail-pa0-f42.google.com with SMTP id lj1so5369484pab.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Jun 2014 21:07:05 -0700 (PDT)
In-Reply-To: <53A7009C.3090003@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 06/22/2014 09:43 PM, Andreas F=C3=A4rber wrote:
> Hello,
>=20
> Both on kgene's for-next 053341b6993a3e838cfa35c9f594fb94ee3da9ce and=
 on
> Linus' 401c58fcbbf570e7e4a8ee0e21ffd829deb4de0b my Arndale Octa board
> fails to boot with an "Unhandled fault: synchronous external abort
> (0x210)". This is a regression from v3.15, 100% reproducible.
>=20
> [    6.251931] s3c-rtc 101e0000.rtc: setting system cloco to 2000-01-=
01
> 21:56:23 UTC (946763783)
> [    6.253401] Unable to find PPMU node
> [    6.253461] exynos5-bus-int: probe of exynos5-bus-int failed with
> error -2
> [    6.268412] clk: Not disabling unused clocks
> [    6.310161] Unhandled fault: synchronous external abort (0x210)
> X=EF=BF=BD=EF=BF=BD=EF=BF=BD17403d
>     6.316467] Internal error: : 210 [#1] PREEMPT SMP ARM
> [    6.321576] Modules linked in:
> [    6.324613] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 3.16.0-rc1-00330-g401c58f #2
> [    6.332151] task: ecc12000 ti: ecc84000 task.ti: ecc84000
> [    6.337529] PC is at n_tty_open+0x68/0x118
> [    6.341598] LR is at n_tty_open+0x64/0x118
> [    6.3=EF=BF=BDM=EF=BF=BD=EF=BF=BDpc : [c023007c>]    lr : [<c02300=
78>]    psr: a0000113
> [    6.345670] sp : ecc85d10  ip : 00000003  fp : 00000000
> [    6.357106] r10: 00000002  r9 : c0MV"=EF=BF=BD  r8 : 0500001
> [    6.362305] r7 : 0000224c  r6 : eb1fd800  r5 : 00000000  r4 : f017=
4000
> [    6.368804] r3 : f0176294  r2 : c061305c  r1 : c04dd17c  r0 : f017=
6280
> [    6.375304] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> Segment kernel
> [    6.382582] Control: 30c5387d  Table: 20003000  DAC:
> fffffff=EF=BF=BDC=EF=BF=BD+=EF=BF=BDr=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BDProcess swpper/0 (pid: 1, stack limit =3D 0xecc84240)
> [    6.394280] Stack: (0xecc85d10 to 0xecc86000)
> [    6.398615] 5d00:                                     c0230014
> eb1fd800 eb1fd9bc eb2f1e80
> [    6.406761] 5d20: c040ca0=EF=BF=BD=EF=BF=BD33ef8 0000000 eb2f1e80 =
eb1fd800 c0234550
> ece91800 eb1fd800
> [    6.414906] 5d40: 00000003 c0=EF=BF=BD=EF=BF=BD,V*=EF=BF=BD=EF=BF=BD=
5e70 c006ba0 eb33e100 00000001
> ece91800 c022db48
> [    6.423051] 5d60: eb40482p c05c1428 c06134c0 c05d66b0 00000001
> 00000003 00000001 c0613020
> [    6.431196] 5d80: eb404820 eb33e100 c040ca04 00000000 00000000
> 00000000 ecc85e70 c00d8880
> [    6.439343] 5da0: eb33e108 00000000 00000003 eb33e100 eb404820
> eb33e108 c00d87e4 c00d2e2c
> [    6.447488] 5dc0: 00000000 ecc85e6c ecc85f34 00000002 00000000
> 00000000 00000000 c00d3108
> [    6.455633] 5de0: ecc85eb0 c00g056c ecc84000 c00de4a0 c0599ed0
> ecc01d80 00000001 ecc84030
> [    6.463779] 5e00: eb33e100 00000026 eb402558 00000000 00000000
> 00000000 0f4756ea 00000007
> [    6.471925] 5e20: eb311015 eb404820 eb33e100 eb33e100 ecc85eb0
> ec,=EF=BF=BD2=EF=BF=BD4 ec85e70 ffffff9c
> [    6.480070] 5e40: 00000000 00000000 ecc84000 c00e0e70 ecc85e6c
> c05c5e70 ecc85e88 ecc85f2e
> [    6.488215] 5e60: c05c5e94 80000113 00000000 00000000 ecc1d3d0
> eb402688 00000000 00000000
> [    6.496361] 5e80: 00000000 ecc85f34 00000001 eb311000 ffffff9c
> c0553514 00000085 c057b630
> [    6.504506] 5ea0: c057b628 c00e22c4 00000041 00000000 ecc1d3d0
> eb402688 0f4756ea 00000007
> [    6.511578] usb 1-1.4: new high-spe=EF=BF=BDd USB device number 3 =
using
> exynos-ehci
> [    6.519584] 5ec0: eb311015 c05ab500 00000000 eb402000 eb404820
> 00000101 00000004 00000018
> [    6.527729] 5ee0: 00000000 00000000 ecc86008 c03e8db8 00000002
> c00edfe4 c05fd1d0 00000002
> [    6.535875] 5f00: 00000001 00000002 eb311000 ffffff9c c05d6740
> 00000002 eb311000 ffffff9c
> [    6.544020] 5f20: 00000000 c00d4088 00000085 0p006fbc 00000000
> 00000002 00000000 00=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDj
>             [   6.552166] 5f40: 00000100 00000001 c05d6740 c0595360
> 00000007 c05=EF=BF=BD=EF=BF=BD=EF=BF=BD5d6740 0553514
> [    6.560312] 5f60: 00000085 c0553d20 00000007 00000007 c0553514
> c03e8=EF=BF=BD3c ebb7a700 c004fb00
> [    6.568456] 5f80: 2b5e3000 c05d6740 g03dff8c 00000000 00000000
> 00=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDj
>          [    6.57602] 5fa0: 00000000 c03dff9c 00000000 c001c9b8
> 00000000 0=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDj
>                  [    6.54747] 5fc0: 00000000 00000000 00000000 00000=
000
> 00=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDj
>                         [    6.92893] 5fe0: 0p000000 00000000 0000000=
0
> 00000000 00000013 00000000 ecc85ff4 00000000
> [    6.601049] [<c023007c>] (n_tty_open) from [<c0233ef8>]
> (tty_ldisc_open.isra.4+0x3c/0x7c)
> [    6.609189] [<c0233ef8>] (tty_ldisc_open.isra.4) from [<c0234550>]
> (tty_ldisc_setup+0x18/0x58)
> [    6.617768] [<c0234550>] (tty_ldisc_setup) from [<c022cfe0>]
> (tty_init_dev+0xa0/0x198)
> [    6.625654] [<c022cfe0>] (tty_init_dev) from [<c022db48>]
> (tty_open+0x2c8/0x5bc)
> [    6.633019] [<c022db48>] (tty_open) from [<c00d8880>]
> (chrdev_open+0x9c/0x178)
> [    6.640212] [<c00d8880>] (chrdev_open) from [<c00d2e2c>]
> (do_dentry_open.isra.15+0xdc/0x2e8)
> [    6.648617] [<c00d2e2c>] (do_dentry_open.isra.15) from [<c00d3108>=
]
> (finish_open+0x20/0x38)
> [    6.656939] [<c00d3108>] (finish_open) from [<c00e056c>]
> (do_last.isra.55+0x3e8/0xc38)
> [    6.664821] [<c00e056c>] (do_las|.isra.55) from [<c00e0e70>]
> (path_openat+0xb4/0x5e0)
> [    6.672620] [<c00e0e70>] (path_openat) from [<c00e22c4>]
> (do_filp_open+0x2c/0x80)
> [    6.680072] [<c00e22c4>] (do_filp_open) from [<c00d4088>]
> (do_sys_open+0x10=EF=BF=BD/0x1d0)
> [    6.687696] [<c00d4088>] (do_sys_open) from [<c0553d20>]
> (kernel_init_freeable+0x160/0x1d8)
> [    6.696017] [<c0553d20>] (kernel_init_freeable) from [<c03dff9c>]
> (kernel_ini[    6.704165] [<c03dff9c>] (kernel_init) from [<c001c9b8>=
]
> (ret_from_fork+0x14/0x3c)
> [    6.711698] Code: e34c104d e34c2061 ebf8d227 e5864224 (e5d4303d)
> [    6.717766] ---[ end trace 67957db0672cb23f ]---
> [    6.722430] Kernel panic - not syncing: Attempted to kill init!
> exitcode=3D0x0000000b
> [    6.722430]
> [    6.=D3=8A=EF=BF=BD=EF=BF=BD=EF=BF=BDCPU3: stpping
> [    6.734141] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D
> 3.16.0-rc1-00330-g401c58f #2
> [    6.742730] [<c00226d4>] (unwind_backtrace) from [<c001f890>]
> (show_stack+0x10/0x14)
> [    6.750439] [<c001f890>] (show_stack) from [<c03e38cc>]
> (dump_stack+0x80/0xc0)
> [    6.757628] [<c03e38cc>] (dump_stack) from [<c0021978>]
> (handle_IPI+0x17c/0x38c)
> [    6.764992] [<c0021978>] (handle_IPI) from [<c0008640>]
> (gic_handle_irq+0x64/0x68)
> [    6.772530] [<c0008640>] (gic_handle_irq) from [<c00203c0>]
> (__irq_svc+0x40/0x70)
> [    6.779977] Exception stack(0xeccc3f70 to 0xeccc3fb8)
> [    6.785006] 3f60:              =EF=BF=BD*=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BDfb8 00000018 112a90e 00000001
> [    6.793152] 3f80: 908bb587 00=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD1af8 c0ce558 p0000000 c05d65f3
> eccc2000 00000000
> [    6.801296] 3fa0: fffffff8 eccc3fb8 c0077c4c c0301c5g 60000113 fff=
fffff
> [    6.807888] [<c00203c0>] (__irq_svc) from [<c0301c5c>]
> (cpuidle_enter_state+0x50/0xe0)
> [    6.815773] [<c0301c5c>] (cpuidle_enter_state) from [<c006185c>]
> (cpu_startup_entry+0x204/0x228)
> [    6.824523] [<c006185c>] (cpu_startup_entry) from [<200086e4>]
> (0x200086e4)
> [    6.83145=EF=BF=BDWAU=EF=BF=BD: stpping
> [    6.834139] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G      D
> 3.16.0-rc1-00330-g401c58f #2
> [    6.842726] [<c00226d4>] (unwind_backtrace) from [<c001f890>]
> (show_stack+0x10/0x14)
> [    6.x50436] [<c001f890>] (show_stack) from [<c03e38cc>]
> (dump_stack+0x80/0xc0)
> [    6.857627] [<c03e38cc>] (dump_stack) from [<c0021978>]
> (handle_IPI+0x17c/0x18c)
> [    6.864991] [<c0021978>] (handle_IPI) from [<c0008640>]
> (gic_handle_irq+0x64/0x68)
> [    6.8w2529] [<c000=EF=BF=BD=EF=BF=BD=EF=BF=BD(gic_hndle_irq) from =
[<c00203c0>]
> (__irq_svc+0x40/0x70)
> [    6.879976] ExcY=D1=A5=EF=BF=BD=EF=BF=BD=EF=BF=BDstac(0xeccc1f70 t=
o 0xeccc1fb8+
> [    6.885004] 1f60:                                     eccc1fb8
> p0000018 9112a867 00000001
> [    6.893151] 1f80: 90da86f0 00000001 ebb89af8 c05ce558 00000000
> c05d65f3 eccg0000 00000000
> [    6.901295] 1fa0: fffffff8 eccc1fb8 c0077c4c c0301c5c 60000113 fff=
fffff
> [    6.907886] [<c00203c0>] (__irq_svc) from [<c0301c5c>]
> (cpuidle_enter_state+0x50/0xe0)
> [    6.915771] [<c0301c5c>] (cpuidle_enter_state) from [<c006185c>]
> (cpu_startup_entry+0x204/0x228)
> [    6.924520] [<c006185c>] (cpu_startup_entry) from [<200086e4>]
> (=EF=BF=BD=EF=BF=BD00086e4)
>     6.931450] CPU1: stopping
> [    6.934138] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D
> 3.16.0-rc1-00330-g401c58f #2
> [    6.942724] [<c00226d4>]=EF=BF=BD=EF=BF=BD=EF=BF=BD=DD=B9=EF=BF=BD=
}=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=C9=85=EF=BF=BD=EF=BF=BD=EF=
=BF=BD from [<c01f890>]
> (show_stack+0x10/0x14)
> [    6.950434] [<c001f890>] (show_stack) from [<c03e38cc>]
> (dump_stack+0x80/0=EF=BF=BD,Jj[    6.95726] [<c03e38cc>] (dump_stack)=
 from
> [<c0021978>] (handle_IPI+0x17c/0x18c)
> [    6.964989] [<c0021978>] (handle_IPI) from [<c0008640>]
> (gic_handle_irq+0x64/0x68)
> [    6.972527] [<c0008640>] (gic_handle_irq) from [<c00203c0>]
> (__irq_svc+0x40/0x70)
> [    6.979975] Exception stack(0xeccbff70 to 0xeccbffb8)
> [    6.985003] ff60:                                     eccbffb8
> 00000018 9112ab55 00000001
> [    6.993150] ff80: 77eb4196 00000001 ebb81af8 c05ce558 00000000
> c05d65f3 eccbe000 00000000
> [    7.001294] ffa0: fffff=EF=BF=BD*=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD c0077c4c 0301c5c 60000113
> fffffff=EF=BF=BDC=EF=BF=BD+=EF=BF=BDr=EF=BF=BD=EF=BF=BD=EF=BF=BD=C2=A2=
=EF=BF=BD[<c0203,=EF=BF=BD=EF=BF=BD(_irq_svc) from [<c0301c5c>]
> =EF=BF=BD,=D5=A5=EF=BF=BD=EF=BF=BD}=EF=BF=BD=EF=BF=BD=D1=95=EF=BF=BD}=
=EF=BF=BD=D1=85=D1=95=EF=BF=BD0x50/0xe0
> [    7.015768] [<c0301c5c>] (cpuidle_enter_state) from [<c006185c>]
> (cpu_startup_entry+0x204/0x228)
> [    7.024519] [<c006185c>] (cpu_startup_entry) from [<200086e4>]=EF=BF=
=BD
> =EF=BF=BD00086e4)
>     7.031454] ---[ end Kernel panic - not syncing: Attempted to kill
> init! exitcode=3D0x0000000b
> [    7.031454]
> [  275.976162} random: nonblocking pool is initialized
>=20
> NB: The serial debug board's output seems unreliable, so take with a
> grain of salt ("cloco" -> "clock", "X???" etc.).
>=20
> Anyone any idea what this external abort may be related to?
>=20

Could you please check if following commit has anything to do with your
issue?

'git bisect' points to this commit.
commit 1c2f87c22566 "ARM: 8025/1: Get rid of meminfo"

Also please confirm if there is any change in behavior when you use
uImage/zImage.

I want to confirm whether this is same as [1].

[1] http://www.spinics.net/lists/arm-kernel/msg340668.html

> Regards,
> Andreas
>=20


--=20
Tushar Behera
