From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH -v3 00/11] drm/exynos: Add atomic modesetting support
Date: Tue, 07 Apr 2015 16:06:38 +0900
Message-ID: <552381FE.20503@samsung.com>
References: <1428084583-14616-1-git-send-email-gustavo@padovan.org>
 <55226412.8040807@samsung.com>
 <CAAQKjZNMkNVs9YOq5G+u+-oQJrJrmxi=6bqMM2ScQP7RRrNpig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62614 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751528AbbDGHGk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Apr 2015 03:06:40 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NMF00IQED33KIB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Apr 2015 16:06:39 +0900 (KST)
In-reply-to: <CAAQKjZNMkNVs9YOq5G+u+-oQJrJrmxi=6bqMM2ScQP7RRrNpig@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

On 2015=B3=E2 04=BF=F9 07=C0=CF 00:44, Inki Dae wrote:
> 2015-04-06 19:46 GMT+09:00 Inki Dae <inki.dae@samsung.com>:
>> On 2015=B3=E2 04=BF=F9 04=C0=CF 03:09, Gustavo Padovan wrote:
>>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>>>
>>> Hi,
>>>
>>> Here goes the full support for atomic modesetting on exynos. I've
>>> split the patches in the various phases of atomic support.
>>>
>>> These patches sits on top of the clean up patches I've sent yesterd=
ay
>>> to this mailing list[1].
>>>
>>> v2: fixes comments by Joonyoung
>>>         - remove unused var in patch 09
>>>         - use ->disable instead of outdated ->dpms in hdmi code
>>>         - remove WARN_ON from crtc enable/disable
>>>
>>> v3: fixes comment by Joonyoung
>>>       - move the removal of drm_helper_disable_unused_functions() t=
o
>>>       separated patch
>>
>> With this patch series, Kernel booting is halted at end of kernel
>> booting. I tested this patch series on Trats2 board based on Exynos4=
412 SoC.
>>
>> Below is a part of full booting logs, which was halted,
>> [    1.992015] exynos-drm-ipp exynos-drm-ipp: drm ipp registered
>> successfully.
>> [    1.993009] exynos-drm exynos-drm: bound exynos-drm-vidi (ops
>> vidi_component_ops)
>> [    1.993036] exynos-drm exynos-drm: bound 11c00000.fimd (ops
>> fimd_component_ops)
>> [    1.993385] exynos-drm exynos-drm: bound 11c80000.dsi (ops
>> exynos_dsi_component_ops)
>> [    1.993390] [drm] Supports vblank timestamp caching Rev 2 (21.10.=
2013).
>> [    1.993393] [drm] No driver support for vblank timestamp query.
>> [    1.993442] [drm] Initialized exynos 1.0.0 20110530 on minor 0
>> [    2.043358] WARNING: CPU: 2 PID: 1209 at drivers/clk/clk.c:898
>> clk_unprepare+0x24/0x2c()
>> [    2.051412] Modules linked in:
>> [    2.054422] CPU: 2 PID: 1209 Comm: kworker/2:1 Tainted: G        =
W
>>     4.0.0-rc6-00526-gc49d7de-dirty #1278
>> [    2.064337] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> [    2.070428] Workqueue: pm pm_runtime_work>
>>
>> After that, I tested it again without FIMD and the booting is ok. So=
 I
>> guess that this atomic feature has a bug to FIMD driver.
>>
>=20
> More information,
>=20
> The reason the booting is halted is that a deadlock occurs at fbcon
> module when register_framebuffer() is called.
>=20
> Below are our test results,
> - with only cleanup series, FIMD and HDMI work well.
> - with cleanup and atomic series, HDMI works well but FIMD doesn't
> work - a deadlock occurs.
>=20
> Could anyone test it with the atomic series on trats2 board? You can
> test it on top of exynos-drm-next-todo branch which contains all
> relevant patches,
> https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/l=
og/?h=3Dexynos-drm-next-todo
>=20
> Anyway, we will continue to take a look at the this issue why the
> deadlock occurs.

In addition,

I added some codes temporarily to fbmem module which mitigates the
deadlock issue. After that, I see below panic log,

[    3.254840] Unable to handle kernel NULL pointer dereference at
virtual address 000000a4
[    3.262870] pgd =3D c0004000
[    3.265539] [000000a4] *pgd=3D00000000
[    3.269102] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    3.274392] Modules linked in:
[    3.277435] CPU: 2 PID: 1 Comm: swapper/0 Tainted: G        W
4.0.0-rc6-00526-gc49d7de-dirty #1308
[    3.286892] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    3.292970] task: ee878000 ti: ee880000 task.ti: ee880000
[    3.298356] PC is at exynos_plane_atomic_update+0x24/0x1d4
[    3.303824] LR is at drm_atomic_helper_commit_planes+0xa4/0x18c
[    3.309723] pc : [<c028bff4>]    lr : [<c0265308>]    psr: 60000113
[    3.309723] sp : ee881b38  ip : 00000020  fp : 00000000
[    3.321179] r10: c04cfc00  r9 : 00000008  r8 : eebfb9c0
[    3.326387] r7 : 00000002  r6 : 00000000  r5 : 00000000  r4 : ee9253=
08
[    3.332897] r3 : ee329fc0  r2 : 00000000  r1 : 00000000  r0 : ee9253=
08
[    3.339409] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
Segment kernel
[    3.346699] Control: 10c5387d  Table: 4000404a  DAC: 00000015
[    3.352427] Process swapper/0 (pid: 1, stack limit =3D 0xee880210)
[    3.358416] Stack: (0xee881b38 to 0xee882000)
[    3.362757] 1b20:
   c0726794 00000008
[    3.370919] 1b40: 00000002 ee925308 00000000 ee329e00 00000002
eebfb9c0 00000008 c04cfc00
[    3.379078] 1b60: 00000000 c0265308 00000008 00000000 ee329e00
ee0a8000 00000008 00000000
[    3.387237] 1b80: 00000000 c0267304 ee329e00 ee8efe00 ee914c00
00000002 00000000 00000002
[    3.395396] 1ba0: 00000000 c026609c c0265ef0 00000000 ee914c00
00000028 ee8eff00 00000001
[    3.403555] 1bc0: 00000000 c06c8380 00000000 c02770d0 ee8efe00
00000000 00000028 ee8eff00
[    3.411714] 1be0: 00000001 c0267a2c ee0a8000 c0286214 ee8eff00
ee8eff00 ee0a8000 00000000
[    3.419874] 1c00: 00000000 c0722ad4 ee35e000 c0269900 00000000
ee915400 00000000 c0269958
[    3.428033] 1c20: ee808c00 c020cc8c c0248620 c05d5448 ee808c00
ee808c00 ee808d34 00000000
[    3.436192] 1c40: 00000000 00000001 00000066 c0724acc c0724fd4
0000005b 00000066 0000005b
[    3.444351] 1c60: c05b28cc ee808c00 ee808d74 00000000 00000000
00000001 ee808c00 00000000
[    3.452511] 1c80: 00000001 c0246564 c04b4950 00000000 c0724fdc
c07250f0 00000001 c0248568
[    3.460670] 1ca0: c049cc58 c06ce2e4 00000000 0000003e c070da2c
c05d09ec 00000000 c0724fcc
[    3.468829] 1cc0: 00000000 c04b4950 c0724fe8 00000000 00000000
00000000 0000003e 00000000
[    3.476988] 1ce0: c0725604 c0248de0 c05d54ac 00000001 ee074780
00000001 c0724920 c06c8380
[    3.485148] 1d00: c0724acc 00008380 00000005 00000000 00000000
01d00000 00000000 c020cd5c
[    3.493306] 1d20: c06c8754 ffffffff ee881d88 c0039890 c06c8754
00000005 ee881d88 ffffffff
[    3.501466] 1d40: ee915644 ee91540c 01d00000 c0039bec 00000000
00000000 ee915644 c06badb8
[    3.509625] 1d60: ee915400 c06badb8 00000000 c0039c1c 00000000
ee915400 c06badb8 c0215980
[    3.517784] 1d80: c05d101c 00000000 ee915400 00000000 00000000
00000000 000002d0 00000500
[    3.525943] 1da0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    3.534103] 1dc0: 00000000 00000020 ee8efe50 ee8eff00 ee915400
00000001 ee8efe50 c0726794
[    3.542262] 1de0: 00000002 c0269bc4 000002d0 00000500 000002d0
00000500 00000020 00000018
[    3.550421] 1e00: ee0a8000 00000000 eebfbdc0 ee8eff00 ee0a8190
c028a374 ee0a8288 00000001
[    3.558580] 1e20: ee0a8294 ee0a8000 ee0a8190 c025ff20 00000000
c0491308 c06933e0 c0492b3c
[    3.566740] 1e40: ee08b374 ee914428 ee9000d4 ee08b200 ee08b208
00000000 00000098 c06933e0
[    3.574899] 1e60: 00000000 c028e764 ee08b200 c0288088 ee9000d0
ee9000d4 ee08b200 c029c5bc
[    3.583058] 1e80: c0726874 ee08b208 c06d42a4 00000000 00000000
c02a2504 ee08b208 c06d42a4
[    3.591217] 1ea0: ee08b23c c06d2b7c eebf83c0 c02a2708 00000000
c06d42a4 c02a267c c02a0ad8
[    3.599376] 1ec0: ee9bf674 ee06db40 c06d42a4 ee06df00 00000000
c02a1d2c c05dee34 c06bcbe0
[    3.607535] 1ee0: c0681fc8 c06d42a4 c06bcbe0 c0681fc8 00000000
c02a2d04 c06bcbe0 c06bcbe0
[    3.615695] 1f00: c0681fc8 c0008990 ee855980 c04971d0 00000025
00000000 60000100 c06c066c
[    3.623854] 1f20: 00000000 c06c066c 60000113 00000003 ef7fc9ed
ef7fc9de c04a96e8 c00384d0
[    3.632013] 1f40: c05f26cc ef7fc9fc 00000006 00000006 c06c0648
ef7fc940 c06b3f98 00000006
[    3.640172] 1f60: c06933d8 c06eabc0 c06eabc0 00000098 c06933e0
c0668dac 00000006 00000006
[    3.648331] 1f80: c0668594 c003c944 0000abc0 c048bed0 00000000
00000000 00000000 00000000
[    3.656490] 1fa0: 00000000 c048bedc 00000000 c000e7c0 00000000
00000000 00000000 00000000
[    3.664649] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    3.672809] 1fe0: 00000000 00000000 00000000 00000000 00000013
00000000 ffffffff ffffffff
[    3.680977] [<c028bff4>] (exynos_plane_atomic_update) from
[<c0265308>] (drm_atomic_helper_commit_planes+0xa4/0x18c)
[    3.691475] [<c0265308>] (drm_atomic_helper_commit_planes) from
[<c0267304>] (drm_atomic_helper_commit+0xec/0x144)
[    3.701804] [<c0267304>] (drm_atomic_helper_commit) from [<c026609c>=
]
(drm_atomic_helper_set_config+0x1ac/0x3d0)
[    3.711962] [<c026609c>] (drm_atomic_helper_set_config) from
[<c02770d0>] (drm_mode_set_config_internal+0x58/0xd4)
[    3.722288] [<c02770d0>] (drm_mode_set_config_internal) from
[<c0267a2c>] (restore_fbdev_mode+0xd4/0xf4)
[    3.731749] [<c0267a2c>] (restore_fbdev_mode) from [<c0269900>]
(drm_fb_helper_restore_fbdev_mode_unlocked+0x1c/0x5c)
[    3.742338] [<c0269900>] (drm_fb_helper_restore_fbdev_mode_unlocked)
from [<c0269958>] (drm_fb_helper_set_par+0x18/0x34)
[    3.753191] [<c0269958>] (drm_fb_helper_set_par) from [<c020cc8c>]
(fbcon_init+0x5c8/0x614)
[    3.761525] [<c020cc8c>] (fbcon_init) from [<c0246564>]
(visual_init+0xa4/0xec)

exynos_plane_atomic_update function calls internally
exynos_plane_mode_set function, and this call incurs a panic because
exynos_plane_mode_set function is called with null argument -
state->crtc is null.


And below is the place where the deadlock occurs,

                                            actual_w =3D
exynos_plane_get_size(crtc_x, crtc_w, crtc->mode.hdisplay);
NSR:C028BFF4 E595E0A4                  ldr    r14,[r5,%0xA4]


Thanks,
Inki Dae

>=20
> Thanks,
> Inki Dae
>=20
>> Thanks,
>> Inki Dae
>>
>>>
>>>       Gustavo
>>> ---
>>>
>>> Gustavo Padovan (11):
>>>   drm/exynos: atomic phase 1: use drm_plane_helper_update()
>>>   drm/exynos: atomic phase 1: use drm_plane_helper_disable()
>>>   drm/exynos: atomic phase 1: add .mode_set_nofb() callback
>>>   drm/exynos: atomic phase 2: wire up state reset(), duplicate() an=
d
>>>     destroy()
>>>   drm/exynos: atomic phase 2: keep track of framebuffer pointer
>>>   drm/exynos: atomic phase 3: atomic updates of planes
>>>   drm/exynos: atomic phase 3: use atomic .set_config helper
>>>   drm/exynos: atomic phase 3: convert page flips
>>>   drm/exynos: remove exported functions from exynos_drm_plane
>>>   drm/exynos: don't disable unused functions at init
>>>   drm/exynos: atomic dpms support
>>>
>>>  drivers/gpu/drm/bridge/ptn3460.c              |   4 +
>>>  drivers/gpu/drm/exynos/exynos_dp_core.c       |   6 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_connector.c |   6 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 226 ++++++++------=
------------
>>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c       |   6 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c       |   2 +
>>>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |   4 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |   6 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_encoder.c   |  27 +--
>>>  drivers/gpu/drm/exynos/exynos_drm_fb.c        |  12 +-
>>>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |   3 -
>>>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 113 +++++++------
>>>  drivers/gpu/drm/exynos/exynos_drm_plane.h     |  11 --
>>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |   6 +-
>>>  drivers/gpu/drm/exynos/exynos_hdmi.c          |  10 +-
>>>  15 files changed, 187 insertions(+), 255 deletions(-)
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
