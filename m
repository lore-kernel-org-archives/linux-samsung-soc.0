From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH -v3 00/11] drm/exynos: Add atomic modesetting support
Date: Thu, 09 Apr 2015 16:04:16 +0900
Message-ID: <55262470.6010609@samsung.com>
References: <1428084583-14616-1-git-send-email-gustavo@padovan.org>
 <55226412.8040807@samsung.com>
 <CAAQKjZNMkNVs9YOq5G+u+-oQJrJrmxi=6bqMM2ScQP7RRrNpig@mail.gmail.com>
 <552381FE.20503@samsung.com> <20150407183959.GE7380@joana>
 <552545BF.8070505@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48690 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751493AbbDIHEF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Apr 2015 03:04:05 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NMJ00KPD2ARSQC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Apr 2015 16:04:03 +0900 (KST)
In-reply-to: <552545BF.8070505@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi,

On 04/09/2015 12:14 AM, Inki Dae wrote:
> On 2015=EB=85=84 04=EC=9B=94 08=EC=9D=BC 03:39, Gustavo Padovan wrote=
:
>> Hi Inki,
>>
>> 2015-04-07 Inki Dae <inki.dae@samsung.com>:
>>
>>> On 2015=EB=85=84 04=EC=9B=94 07=EC=9D=BC 00:44, Inki Dae wrote:
>>>> 2015-04-06 19:46 GMT+09:00 Inki Dae <inki.dae@samsung.com>:
>>>>> On 2015=EB=85=84 04=EC=9B=94 04=EC=9D=BC 03:09, Gustavo Padovan w=
rote:
>>>>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Here goes the full support for atomic modesetting on exynos. I'v=
e
>>>>>> split the patches in the various phases of atomic support.
>>>>>>
>>>>>> These patches sits on top of the clean up patches I've sent yest=
erday
>>>>>> to this mailing list[1].
>>>>>>
>>>>>> v2: fixes comments by Joonyoung
>>>>>>         - remove unused var in patch 09
>>>>>>         - use ->disable instead of outdated ->dpms in hdmi code
>>>>>>         - remove WARN_ON from crtc enable/disable
>>>>>>
>>>>>> v3: fixes comment by Joonyoung
>>>>>>       - move the removal of drm_helper_disable_unused_functions(=
) to
>>>>>>       separated patch
>>>>>
>>>>> With this patch series, Kernel booting is halted at end of kernel
>>>>> booting. I tested this patch series on Trats2 board based on Exyn=
os4412 SoC.
>>>>>
>>>>> Below is a part of full booting logs, which was halted,
>>>>> [    1.992015] exynos-drm-ipp exynos-drm-ipp: drm ipp registered
>>>>> successfully.
>>>>> [    1.993009] exynos-drm exynos-drm: bound exynos-drm-vidi (ops
>>>>> vidi_component_ops)
>>>>> [    1.993036] exynos-drm exynos-drm: bound 11c00000.fimd (ops
>>>>> fimd_component_ops)
>>>>> [    1.993385] exynos-drm exynos-drm: bound 11c80000.dsi (ops
>>>>> exynos_dsi_component_ops)
>>>>> [    1.993390] [drm] Supports vblank timestamp caching Rev 2 (21.=
10.2013).
>>>>> [    1.993393] [drm] No driver support for vblank timestamp query=
=2E
>>>>> [    1.993442] [drm] Initialized exynos 1.0.0 20110530 on minor 0
>>>>> [    2.043358] WARNING: CPU: 2 PID: 1209 at drivers/clk/clk.c:898
>>>>> clk_unprepare+0x24/0x2c()
>>>>> [    2.051412] Modules linked in:
>>>>> [    2.054422] CPU: 2 PID: 1209 Comm: kworker/2:1 Tainted: G     =
   W
>>>>>     4.0.0-rc6-00526-gc49d7de-dirty #1278
>>>>> [    2.064337] Hardware name: SAMSUNG EXYNOS (Flattened Device Tr=
ee)
>>>>> [    2.070428] Workqueue: pm pm_runtime_work>
>>>>>
>>>>> After that, I tested it again without FIMD and the booting is ok.=
 So I
>>>>> guess that this atomic feature has a bug to FIMD driver.
>>>>>
>>>>
>>>> More information,
>>>>
>>>> The reason the booting is halted is that a deadlock occurs at fbco=
n
>>>> module when register_framebuffer() is called.
>>>>
>>>> Below are our test results,
>>>> - with only cleanup series, FIMD and HDMI work well.
>>>> - with cleanup and atomic series, HDMI works well but FIMD doesn't
>>>> work - a deadlock occurs.
>>>>
>>>> Could anyone test it with the atomic series on trats2 board? You c=
an
>>>> test it on top of exynos-drm-next-todo branch which contains all
>>>> relevant patches,
>>>> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.gi=
t/log/?h=3Dexynos-drm-next-todo
>>>>
>>>> Anyway, we will continue to take a look at the this issue why the
>>>> deadlock occurs.
>>>
>>> In addition,
>>>
>>> I added some codes temporarily to fbmem module which mitigates the
>>> deadlock issue. After that, I see below panic log,
>>>
>>> [    3.254840] Unable to handle kernel NULL pointer dereference at
>>> virtual address 000000a4
>>> [    3.262870] pgd =3D c0004000
>>> [    3.265539] [000000a4] *pgd=3D00000000
>>> [    3.269102] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>>> [    3.274392] Modules linked in:
>>> [    3.277435] CPU: 2 PID: 1 Comm: swapper/0 Tainted: G        W
>>> 4.0.0-rc6-00526-gc49d7de-dirty #1308
>>> [    3.286892] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree=
)
>>> [    3.292970] task: ee878000 ti: ee880000 task.ti: ee880000
>>> [    3.298356] PC is at exynos_plane_atomic_update+0x24/0x1d4
>>> [    3.303824] LR is at drm_atomic_helper_commit_planes+0xa4/0x18c
>>> [    3.309723] pc : [<c028bff4>]    lr : [<c0265308>]    psr: 60000=
113
>>> [    3.309723] sp : ee881b38  ip : 00000020  fp : 00000000
>>> [    3.321179] r10: c04cfc00  r9 : 00000008  r8 : eebfb9c0
>>> [    3.326387] r7 : 00000002  r6 : 00000000  r5 : 00000000  r4 : ee=
925308
>>> [    3.332897] r3 : ee329fc0  r2 : 00000000  r1 : 00000000  r0 : ee=
925308
>>> [    3.339409] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
>>> Segment kernel
>>> [    3.346699] Control: 10c5387d  Table: 4000404a  DAC: 00000015
>>> [    3.352427] Process swapper/0 (pid: 1, stack limit =3D 0xee88021=
0)
>>> [    3.358416] Stack: (0xee881b38 to 0xee882000)
>>> [    3.362757] 1b20:
>>>    c0726794 00000008
>>> [    3.370919] 1b40: 00000002 ee925308 00000000 ee329e00 00000002
>>> eebfb9c0 00000008 c04cfc00
>>> [    3.379078] 1b60: 00000000 c0265308 00000008 00000000 ee329e00
>>> ee0a8000 00000008 00000000
>>> [    3.387237] 1b80: 00000000 c0267304 ee329e00 ee8efe00 ee914c00
>>> 00000002 00000000 00000002
>>> [    3.395396] 1ba0: 00000000 c026609c c0265ef0 00000000 ee914c00
>>> 00000028 ee8eff00 00000001
>>> [    3.403555] 1bc0: 00000000 c06c8380 00000000 c02770d0 ee8efe00
>>> 00000000 00000028 ee8eff00
>>> [    3.411714] 1be0: 00000001 c0267a2c ee0a8000 c0286214 ee8eff00
>>> ee8eff00 ee0a8000 00000000
>>> [    3.419874] 1c00: 00000000 c0722ad4 ee35e000 c0269900 00000000
>>> ee915400 00000000 c0269958
>>> [    3.428033] 1c20: ee808c00 c020cc8c c0248620 c05d5448 ee808c00
>>> ee808c00 ee808d34 00000000
>>> [    3.436192] 1c40: 00000000 00000001 00000066 c0724acc c0724fd4
>>> 0000005b 00000066 0000005b
>>> [    3.444351] 1c60: c05b28cc ee808c00 ee808d74 00000000 00000000
>>> 00000001 ee808c00 00000000
>>> [    3.452511] 1c80: 00000001 c0246564 c04b4950 00000000 c0724fdc
>>> c07250f0 00000001 c0248568
>>> [    3.460670] 1ca0: c049cc58 c06ce2e4 00000000 0000003e c070da2c
>>> c05d09ec 00000000 c0724fcc
>>> [    3.468829] 1cc0: 00000000 c04b4950 c0724fe8 00000000 00000000
>>> 00000000 0000003e 00000000
>>> [    3.476988] 1ce0: c0725604 c0248de0 c05d54ac 00000001 ee074780
>>> 00000001 c0724920 c06c8380
>>> [    3.485148] 1d00: c0724acc 00008380 00000005 00000000 00000000
>>> 01d00000 00000000 c020cd5c
>>> [    3.493306] 1d20: c06c8754 ffffffff ee881d88 c0039890 c06c8754
>>> 00000005 ee881d88 ffffffff
>>> [    3.501466] 1d40: ee915644 ee91540c 01d00000 c0039bec 00000000
>>> 00000000 ee915644 c06badb8
>>> [    3.509625] 1d60: ee915400 c06badb8 00000000 c0039c1c 00000000
>>> ee915400 c06badb8 c0215980
>>> [    3.517784] 1d80: c05d101c 00000000 ee915400 00000000 00000000
>>> 00000000 000002d0 00000500
>>> [    3.525943] 1da0: 00000000 00000000 00000000 00000000 00000000
>>> 00000000 00000000 00000000
>>> [    3.534103] 1dc0: 00000000 00000020 ee8efe50 ee8eff00 ee915400
>>> 00000001 ee8efe50 c0726794
>>> [    3.542262] 1de0: 00000002 c0269bc4 000002d0 00000500 000002d0
>>> 00000500 00000020 00000018
>>> [    3.550421] 1e00: ee0a8000 00000000 eebfbdc0 ee8eff00 ee0a8190
>>> c028a374 ee0a8288 00000001
>>> [    3.558580] 1e20: ee0a8294 ee0a8000 ee0a8190 c025ff20 00000000
>>> c0491308 c06933e0 c0492b3c
>>> [    3.566740] 1e40: ee08b374 ee914428 ee9000d4 ee08b200 ee08b208
>>> 00000000 00000098 c06933e0
>>> [    3.574899] 1e60: 00000000 c028e764 ee08b200 c0288088 ee9000d0
>>> ee9000d4 ee08b200 c029c5bc
>>> [    3.583058] 1e80: c0726874 ee08b208 c06d42a4 00000000 00000000
>>> c02a2504 ee08b208 c06d42a4
>>> [    3.591217] 1ea0: ee08b23c c06d2b7c eebf83c0 c02a2708 00000000
>>> c06d42a4 c02a267c c02a0ad8
>>> [    3.599376] 1ec0: ee9bf674 ee06db40 c06d42a4 ee06df00 00000000
>>> c02a1d2c c05dee34 c06bcbe0
>>> [    3.607535] 1ee0: c0681fc8 c06d42a4 c06bcbe0 c0681fc8 00000000
>>> c02a2d04 c06bcbe0 c06bcbe0
>>> [    3.615695] 1f00: c0681fc8 c0008990 ee855980 c04971d0 00000025
>>> 00000000 60000100 c06c066c
>>> [    3.623854] 1f20: 00000000 c06c066c 60000113 00000003 ef7fc9ed
>>> ef7fc9de c04a96e8 c00384d0
>>> [    3.632013] 1f40: c05f26cc ef7fc9fc 00000006 00000006 c06c0648
>>> ef7fc940 c06b3f98 00000006
>>> [    3.640172] 1f60: c06933d8 c06eabc0 c06eabc0 00000098 c06933e0
>>> c0668dac 00000006 00000006
>>> [    3.648331] 1f80: c0668594 c003c944 0000abc0 c048bed0 00000000
>>> 00000000 00000000 00000000
>>> [    3.656490] 1fa0: 00000000 c048bedc 00000000 c000e7c0 00000000
>>> 00000000 00000000 00000000
>>> [    3.664649] 1fc0: 00000000 00000000 00000000 00000000 00000000
>>> 00000000 00000000 00000000
>>> [    3.672809] 1fe0: 00000000 00000000 00000000 00000000 00000013
>>> 00000000 ffffffff ffffffff
>>> [    3.680977] [<c028bff4>] (exynos_plane_atomic_update) from
>>> [<c0265308>] (drm_atomic_helper_commit_planes+0xa4/0x18c)
>>> [    3.691475] [<c0265308>] (drm_atomic_helper_commit_planes) from
>>> [<c0267304>] (drm_atomic_helper_commit+0xec/0x144)
>>> [    3.701804] [<c0267304>] (drm_atomic_helper_commit) from [<c0266=
09c>]
>>> (drm_atomic_helper_set_config+0x1ac/0x3d0)
>>> [    3.711962] [<c026609c>] (drm_atomic_helper_set_config) from
>>> [<c02770d0>] (drm_mode_set_config_internal+0x58/0xd4)
>>> [    3.722288] [<c02770d0>] (drm_mode_set_config_internal) from
>>> [<c0267a2c>] (restore_fbdev_mode+0xd4/0xf4)
>>> [    3.731749] [<c0267a2c>] (restore_fbdev_mode) from [<c0269900>]
>>> (drm_fb_helper_restore_fbdev_mode_unlocked+0x1c/0x5c)
>>> [    3.742338] [<c0269900>] (drm_fb_helper_restore_fbdev_mode_unloc=
ked)
>>> from [<c0269958>] (drm_fb_helper_set_par+0x18/0x34)
>>> [    3.753191] [<c0269958>] (drm_fb_helper_set_par) from [<c020cc8c=
>]
>>> (fbcon_init+0x5c8/0x614)
>>> [    3.761525] [<c020cc8c>] (fbcon_init) from [<c0246564>]
>>> (visual_init+0xa4/0xec)
>>>
>>> exynos_plane_atomic_update function calls internally
>>> exynos_plane_mode_set function, and this call incurs a panic becaus=
e
>>> exynos_plane_mode_set function is called with null argument -
>>> state->crtc is null.
>>
>> I just checked the value of state->crtc for me at this point of the =
flow
>> and it is not NULL. I wonder why this works differently for your boa=
rd.
>> Could you check if state is null or if state->crtc is null?
>=20
> state->crtc is null. For the test, I added printk - which prints out
> address values of state and state->crtc address - to
> exynos_plane_atomic_update function.
>=20
> Below is the test result,
> # modetest -v -s 25@23:720x1280 -P 23:100x100+0+0
> [    5.457989] exynos_plane_atomic_update: state =3D eea11880, state-=
>crtc
> =3D ee914c00
> ...snip...
> [    7.005817] exynos_plane_atomic_update: state =3D ee265b40, state-=
>crtc
> =3D ee914c00
> [    7.089881] exynos_plane_atomic_update: state =3D ee265780, state-=
>crtc
> =3D   (null)
> [    7.095823] Unable to handle kernel NULL pointer dereference at
> virtual address 000000a4
> [    7.103884] pgd =3D c0004000
> [    7.106581] [000000a4] *pgd=3D00000000
> [    7.110120] Internal error: Oops: 17 [#1] PREEMPT SMP ARM
> [    7.115497] Modules linked in:
> [    7.118540] CPU: 0 PID: 1458 Comm: modetest Not tainted
> 4.0.0-rc6-00526-gc49d7de-dirty #1329
> [    7.126955] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [    7.133033] task: ee1eee80 ti: ee1be000 task.ti: ee1be000
> [    7.138426] PC is at exynos_plane_atomic_update+0x60/0x200
> [    7.143882] LR is at 0x0
> [    7.146401] pc : [<c028c014>]    lr : [<00000000>]    psr: 6000001=
3
> [    7.146401] sp : ee1bfde0  ip : 00000000  fp : 00000000
> [    7.157856] r10: 00000000  r9 : 00000000  r8 : 00000000
> [    7.163065] r7 : 00000000  r6 : 00000000  r5 : 00000000  r4 : ee92=
6228
> [    7.169574] r3 : 00000004  r2 : 00000000  r1 : 00000000  r0 : 0000=
0000
> [    7.176086] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> Segment user
> [    7.183202] Control: 10c5387d  Table: 6dc2004a  DAC: 00000015
> [    7.188932] Process modetest (pid: 1458, stack limit =3D 0xee1be21=
0)
> [    7.195094] Stack: (0xee1bfde0 to 0xee1c0000)
> [    7.199438] fde0: 00000000 ee265740 c071dd14 00000005 00000001
> ee926228 00000001 ee265740
> [    7.207597] fe00: 00000001 ee265c80 00000005 c04c9c18 00100100
> c0265314 00000005 00000000
> [    7.215755] fe20: ee265740 ee350000 00000005 00000000 ee350000
> c0267310 00000000 ee265780
> [    7.223915] fe40: ee926228 ee265740 ee350000 ee350260 ee350000
> c0265ed0 ee926228 eeafb840
> [    7.232074] fe60: ee350000 ee3502b0 ee350000 c027717c ee926228
> eeafb840 ee350000 c02772a4
> [    7.240233] fe80: ee3501ec ee3501ec ee3501ec c0704fac 60000013
> c048acd0 ee350260 c0704fac
> [    7.248392] fea0: 60000013 eeafb840 ee369b40 ee369b40 edcd4c64
> c027c180 edcd4ca8 edcd4c00
> [    7.256551] fec0: 00200200 ee350000 ee350034 edcd4ca4 ee350000
> c026d51c ee419558 00000001
> [    7.264711] fee0: ee17bf00 ee350154 60000013 00000000 ee419558
> edcd4300 edc50598 00000000
> [    7.272869] ff00: ee8ee510 ee6b3428 00000008 edcd4308 00000000
> c00cd6a8 00000000 00000000
> [    7.281029] ff20: ee1ef1f4 00000000 c06e3d40 ee1eee80 ee1ef204
> ee1be000 00000000 c0037594
> [    7.289188] ff40: ee1eee80 edc561c0 00000001 ee1bff60 ee1ef204
> c00222d8 0001d008 c00ccb30
> [    7.297348] ff60: 00000000 00000000 0001d008 eebd8c80 00000000
> b6ef2750 000000f8 c000e8a4
> [    7.305506] ff80: ee1be000 00000000 00000000 c002378c 0006560a
> 00000000 b6ef2750 c0023814
> [    7.313666] ffa0: 0006560a c000e720 0006560a 00000000 00000000
> 000655f0 00000000 b6f4d4c0
> [    7.321825] ffc0: 0006560a 00000000 b6ef2750 000000f8 00000000
> 00000000 b6f51000 00000000
> [    7.329984] ffe0: 000000f8 beac7a7c b6e8eaf7 b6e41946 60000030
> 00000000 6f7fd821 6f7fdc21
> [    7.338162] [<c028c014>] (exynos_plane_atomic_update) from
> [<c0265314>] (drm_atomic_helper_commit_planes+0xa4/0x18c)
> [    7.348652] [<c0265314>] (drm_atomic_helper_commit_planes) from
> [<c0267310>] (drm_atomic_helper_commit+0xec/0x144)
> [    7.358979] [<c0267310>] (drm_atomic_helper_commit) from [<c0265ed=
0>]
> (drm_atomic_helper_disable_plane+0xcc/0xf8)
> [    7.369224] [<c0265ed0>] (drm_atomic_helper_disable_plane) from
> [<c027717c>] (drm_plane_force_disable+0x24/0x5c)
> [    7.379376] [<c027717c>] (drm_plane_force_disable) from [<c02772a4=
>]
> (drm_framebuffer_remove+0xf0/0x108)
> [    7.388838] [<c02772a4>] (drm_framebuffer_remove) from [<c027c180>=
]
> (drm_fb_release+0x70/0x88)
> [    7.397432] [<c027c180>] (drm_fb_release) from [<c026d51c>]
> (drm_release+0x41c/0x4c8)
> [    7.405245] [<c026d51c>] (drm_release) from [<c00cd6a8>]
> (__fput+0x80/0x1c8)
> [    7.412279] [<c00cd6a8>] (__fput) from [<c0037594>]
> (task_work_run+0xac/0xe4)
> [    7.419398] [<c0037594>] (task_work_run) from [<c00222d8>]
> (do_exit+0x2e8/0x980)
> [    7.426769] [<c00222d8>] (do_exit) from [<c002378c>]
> (do_group_exit+0x4c/0xc4)
> [    7.433971] [<c002378c>] (do_group_exit) from [<c0023814>]
> (__wake_up_parent+0x0/0x18)
> [    7.441870] Code: e1d592b2 e1d502b6 e1d5a2be e1d552ba (e59630a4)
> [    7.447990] ---[ end trace 3cb27f1bd07f8c05 ]---
> [    7.452561] Fixing recursive fault but reboot is needed!
>=20

This problem occurs when try to disable again the plane disabled
already.

Please see below codes of drm_atomic_helper_commit_planes function.

		/*
		 * Special-case disabling the plane if drivers support it.
		 */
		if (drm_atomic_plane_disabling(plane, old_plane_state) &&
		    funcs->atomic_disable)
			funcs->atomic_disable(plane, old_plane_state);
		else
			funcs->atomic_update(plane, old_plane_state);

Now funcs->atomic_update is called even though we try to disable plane
because already the plane was disabled.

I posted a patch to fix this problem.
Please refer "drm/exynos: use drm_plane_force_disable" patch.

Thanks.

> However, please know that I disabled other crtc drivers for the test
> because with only fimd enabled, kernel booting was ok and at least I
> could test modetest app although I faced with a kernel panic. As I
> mentioned already, with crtc drivers more than two, kernel booting is
> halted.
>=20
> P.s. I tested it on exynos-drm-next-todo branch. If you tried to test=
 it
> on other branch, then please test it on same branch, exynos-drm-next-=
todo.
>=20
> Thanks,
> Inki Dae
>=20
>>
>> 	Gustavo
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
