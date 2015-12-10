From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 06/22] drm/exynos: move dma_addr attribute from exynos
 plane to exynos fb
Date: Thu, 10 Dec 2015 22:05:37 +0900
Message-ID: <566978A1.60302@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
 <1448891617-18830-7-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36238 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751047AbbLJNFj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Dec 2015 08:05:39 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NZ502G5H8DDYQ50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Dec 2015 22:05:37 +0900 (KST)
In-reply-to: <1448891617-18830-7-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>



2015=EB=85=84 11=EC=9B=94 30=EC=9D=BC 22:53=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> DMA address is a framebuffer attribute and the right place for it is
> exynos_drm_framebuffer not exynos_drm_plane. This patch also introduc=
es
> helper function for getting dma address of the given framebuffer.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 13 ++++++++-----
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 16 +++++++++-------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  3 ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c        | 16 ++++++----------
>  drivers/gpu/drm/exynos/exynos_drm_fb.h        |  3 +--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 10 ++++++----
>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 18 -----------------=
-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  5 ++++-
>  drivers/gpu/drm/exynos/exynos_mixer.c         |  7 ++++---
>  9 files changed, 38 insertions(+), 53 deletions(-)
>=20

<--snip-->

> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/d=
rm/exynos/exynos_drm_vidi.c
> index 669362c53f49..3ce141236fad 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -24,6 +24,7 @@
> =20
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_crtc.h"
> +#include "exynos_drm_fb.h"
>  #include "exynos_drm_plane.h"
>  #include "exynos_drm_vidi.h"
> =20
> @@ -126,11 +127,13 @@ static void vidi_update_plane(struct exynos_drm=
_crtc *crtc,
>  			      struct exynos_drm_plane *plane)
>  {
>  	struct vidi_context *ctx =3D crtc->ctx;
> +	dma_addr_t addr;
> =20
>  	if (ctx->suspended)
>  		return;
> =20
> -	DRM_DEBUG_KMS("dma_addr =3D %pad\n", plane->dma_addr);
> +	addr =3D exynos_drm_fb_dma_addr(plane->base.fb, 0);

At this point, plane->base.fb is NULL so null pointer access happens li=
ke below,

[    5.969422] Unable to handle kernel NULL pointer dereference at virt=
ual address 00000090
[    5.977481] pgd =3D ee590000
[    5.980142] [00000090] *pgd=3D6e526831, *pte=3D00000000, *ppte=3D000=
00000
[    5.986347] Internal error: Oops: 17 [#1] PREEMPT SMP ARM
[    5.991712] Modules linked in:
[    5.994770] CPU: 3 PID: 1598 Comm: sh Not tainted 4.4.0-rc3-00052-gc=
60d7e2-dirty #199
[    6.002565] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    6.008647] task: ef328000 ti: ee4d4000 task.ti: ee4d4000
[    6.014053] PC is at exynos_drm_fb_dma_addr+0x8/0x14
[    6.018990] LR is at vidi_update_plane+0x4c/0xc4
[    6.023581] pc : [<c02b1fb4>]    lr : [<c02c3cc4>]    psr: 80000013
[    6.023581] sp : ee4d5d90  ip : 00000001  fp : 00000000
[    6.035029] r10: 00000000  r9 : c05b965c  r8 : ee813e00
[    6.040241] r7 : 00000000  r6 : ee8e3330  r5 : 00000000  r4 : ee8e30=
10
[    6.046749] r3 : 00000000  r2 : 00000000  r1 : 00000024  r0 : 000000=
00
[    6.053264] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Seg=
ment none
[    6.060379] Control: 10c5387d  Table: 6e59004a  DAC: 00000051
[    6.066107] Process sh (pid: 1598, stack limit =3D 0xee4d4210)
[    6.071748] Stack: (0xee4d5d90 to 0xee4d6000)
[    6.076100] 5d80:                                     00000000 ee813=
300 ee476e40 00000005
[    6.084236] 5da0: ee8e3330 c028ac14 00000008 ee476e40 ee476fc0 ef3b3=
800 ee476fc0 eeb3e380
[    6.092395] 5dc0: 00000002 c02b08e4 00000000 eeb3e3a4 ee476fc0 ee476=
e40 ef3b3800 eeb3e380
[    6.100554] 5de0: 00000002 c02b12b8 ee854400 00000000 00000001 ee850=
1a8 00000000 ee476e40
[    6.108714] 5e00: ef3b3800 00000001 ee476e40 00000050 ee850c80 00000=
001 ee476e40 ef3b3aac
[    6.116873] 5e20: 00000002 000000ff 00000000 c028e0ec 000a82b4 c02ac=
c50 ee8e36a0 ee476c80
[    6.125032] 5e40: ef3b3aac ef3b3800 ee476c9c ee850c80 ef3b3800 ef3b3=
800 ef3b3800 ef3b398c
[    6.133191] 5e60: c088c390 00000002 000a82b4 c028f8d4 00000000 ef3b3=
800 ef0f4300 c028f948
[    6.141350] 5e80: ee850c80 c028f864 ef3b3a84 00000001 ef3b3a90 c0285=
3e4 00000001 00000000
[    6.149509] 5ea0: 000a82b4 ee4d5ec0 00000002 ee8e3010 00000002 00000=
002 ee4d5f88 00000000
[    6.157669] 5ec0: 00000000 eeb8df00 000a82b4 c02c4278 00000002 ee476=
b00 eeb8df0c c01390ac
[    6.165828] 5ee0: 00000000 00000000 ee4e1f00 00000002 000a9540 ee4d5=
f88 c000f844 ee4d4000
[    6.173987] 5f00: 00000000 c00dbf70 000a82b4 c00093dc ee4d4000 ee4d5=
f78 ef328234 c0579bec
[    6.182146] 5f20: 00000001 00000001 ee4d5f3c 00000001 ee45e9c4 00000=
001 000a82b4 c005ca74
[    6.190306] 5f40: ee45e9c4 00000002 000a9540 c005cad4 ee4e1f00 00000=
002 000a9540 ee4d5f88
[    6.198465] 5f60: c000f844 c00dc770 00000000 00000000 ee4e1f00 ee4e1=
f00 00000002 000a9540
[    6.206624] 5f80: c000f844 c00dcf98 00000000 00000000 00000003 000a7=
c40 00000001 000a9540
[    6.214783] 5fa0: 00000004 c000f680 000a7c40 00000001 00000001 000a9=
540 00000002 00000000
[    6.222942] 5fc0: 000a7c40 00000001 000a9540 00000004 00000020 000a8=
2c8 000a8294 000a82b4
[    6.231102] 5fe0: 00000000 be8b1624 00012345 b6e94166 40000030 00000=
001 00000000 00000000
[    6.239270] [<c02b1fb4>] (exynos_drm_fb_dma_addr) from [<c02c3cc4>] =
(vidi_update_plane+0x4c/0xc4)
[    6.248122] [<c02c3cc4>] (vidi_update_plane) from [<c028ac14>] (drm_=
atomic_helper_commit_planes+0x1f4/0x258)
[    6.257928] [<c028ac14>] (drm_atomic_helper_commit_planes) from [<c0=
2b08e4>] (exynos_atomic_commit_complete+0xe4/0x1c4)
[    6.268688] [<c02b08e4>] (exynos_atomic_commit_complete) from [<c02b=
12b8>] (exynos_atomic_commit+0x180/0x1cc)
[    6.278584] [<c02b12b8>] (exynos_atomic_commit) from [<c028e0ec>] (r=
estore_fbdev_mode+0x260/0x290)
[    6.287525] [<c028e0ec>] (restore_fbdev_mode) from [<c028f8d4>] (drm=
_fb_helper_restore_fbdev_mode_unlocked+0x30/0x74)
[    6.298111] [<c028f8d4>] (drm_fb_helper_restore_fbdev_mode_unlocked)=
 from [<c028f948>] (drm_fb_helper_set_par+0x30/0x54)
[    6.308961] [<c028f948>] (drm_fb_helper_set_par) from [<c028f864>] (=
drm_fb_helper_hotplug_event+0x9c/0xdc)
[    6.318595] [<c028f864>] (drm_fb_helper_hotplug_event) from [<c02853=
e4>] (drm_helper_hpd_irq_event+0xd4/0x160)
[    6.328578] [<c02853e4>] (drm_helper_hpd_irq_event) from [<c02c4278>=
] (vidi_store_connection+0x94/0xcc)
[    6.337954] [<c02c4278>] (vidi_store_connection) from [<c01390ac>] (=
kernfs_fop_write+0xb8/0x1bc)
[    6.346723] [<c01390ac>] (kernfs_fop_write) from [<c00dbf70>] (__vfs=
_write+0x20/0xd8)
[    6.354531] [<c00dbf70>] (__vfs_write) from [<c00dc770>] (vfs_write+=
0x90/0x164)
[    6.361821] [<c00dc770>] (vfs_write) from [<c00dcf98>] (SyS_write+0x=
44/0x9c)
[    6.368855] [<c00dcf98>] (SyS_write) from [<c000f680>] (ret_fast_sys=
call+0x0/0x3c)
[    6.376404] Code: eb0b17f1 eaffffe7 e3510003 d2811024 (d7900101)=20

When vidi driver is intiated by triggering a connection sysfs file, vid=
i driver tries modeset binding by calling drm_fb_helper_hotplug_event.
However, at this time it seems there is a case that plan->state->crtc e=
xists but plane->fb is NULL, which would be related to vidi driver.

I just looked into this issue roughly so we would need to check this is=
sue in more details.

Thanks,
Inki Dae

> +	DRM_DEBUG_KMS("dma_addr =3D %pad\n", &addr);
> =20
>  	if (ctx->vblank_on)
>  		schedule_work(&ctx->work);
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index 47777be1a754..f40de82848dc 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -37,6 +37,7 @@
> =20
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_crtc.h"
> +#include "exynos_drm_fb.h"
>  #include "exynos_drm_plane.h"
>  #include "exynos_drm_iommu.h"
> =20
> @@ -422,8 +423,8 @@ static void vp_video_buffer(struct mixer_context =
*ctx,
>  		return;
>  	}
> =20
> -	luma_addr[0] =3D plane->dma_addr[0];
> -	chroma_addr[0] =3D plane->dma_addr[1];
> +	luma_addr[0] =3D exynos_drm_fb_dma_addr(fb, 0);
> +	chroma_addr[0] =3D exynos_drm_fb_dma_addr(fb, 1);
> =20
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
>  		ctx->interlace =3D true;
> @@ -575,7 +576,7 @@ static void mixer_graph_buffer(struct mixer_conte=
xt *ctx,
>  	dst_y_offset =3D plane->crtc_y;
> =20
>  	/* converting dma address base and source offset */
> -	dma_addr =3D plane->dma_addr[0]
> +	dma_addr =3D exynos_drm_fb_dma_addr(fb, 0)
>  		+ (plane->src_x * fb->bits_per_pixel >> 3)
>  		+ (plane->src_y * fb->pitches[0]);
>  	src_x_offset =3D 0;
>=20
