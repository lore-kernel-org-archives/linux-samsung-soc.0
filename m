From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH -v2 10/14] drm/exynos: atomic phase 1: add
 atomic_begin()/atomic_flush()
Date: Mon, 09 Feb 2015 23:53:18 +0900
Message-ID: <54D8C9DE.5040103@samsung.com>
References: <1423251478-17043-1-git-send-email-gustavo@padovan.org>
 <1423251478-17043-11-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49284 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759408AbbBIOxU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Feb 2015 09:53:20 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJI00H6BEOUUR90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Feb 2015 23:53:18 +0900 (KST)
In-reply-to: <1423251478-17043-11-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>


Hi,

I'm merging this patch series but I found two issues. One is already
pointed out.

On 2015=EB=85=84 02=EC=9B=94 07=EC=9D=BC 04:37, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Add CRTC callbacks .atomic_begin() .atomic_flush(). On exynos they
> unprotect the windows before the commit and protects it after based o=
n
> a plane mask tha store which plane will be updated.
>=20
> For that we create two new exynos_crtc callbacks: .win_protect() and
> .win_unprotect(). The only driver that implement those now is FIMD.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 34 +++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  6 ++++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 49 ++++++++++++++++++++-=
----------
>  drivers/gpu/drm/exynos/exynos_drm_plane.c |  4 +++
>  4 files changed, 76 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/d=
rm/exynos/exynos_drm_crtc.c
> index 1c0d936..5e7c13e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -153,6 +153,38 @@ static void exynos_drm_crtc_disable(struct drm_c=
rtc *crtc)
>  	}
>  }
> =20
> +static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
> +{
> +	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> +	struct drm_plane *plane;
> +	int index =3D 0;
> +
> +	list_for_each_entry(plane, &crtc->dev->mode_config.plane_list, head=
) {
> +		if (exynos_crtc->ops->win_protect &&
> +		    exynos_crtc->plane_mask & (0x01 << index))
> +			exynos_crtc->ops->win_protect(exynos_crtc, index);
> +
> +		index++;
> +	}
> +}
> +
> +static void exynos_crtc_atomic_flush(struct drm_crtc *crtc)
> +{
> +	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> +	struct drm_plane *plane;
> +	int index =3D 0;
> +
> +	list_for_each_entry(plane, &crtc->dev->mode_config.plane_list, head=
) {
> +		if (exynos_crtc->ops->win_unprotect &&
> +		    exynos_crtc->plane_mask & (0x01 << index))
> +			exynos_crtc->ops->win_unprotect(exynos_crtc, index);
> +
> +		index++;
> +	}
> +
> +	exynos_crtc->plane_mask =3D 0;
> +}
> +
>  static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs =3D {
>  	.dpms		=3D exynos_drm_crtc_dpms,
>  	.prepare	=3D exynos_drm_crtc_prepare,
> @@ -161,6 +193,8 @@ static struct drm_crtc_helper_funcs exynos_crtc_h=
elper_funcs =3D {
>  	.mode_set	=3D exynos_drm_crtc_mode_set,
>  	.mode_set_base	=3D exynos_drm_crtc_mode_set_base,
>  	.disable	=3D exynos_drm_crtc_disable,
> +	.atomic_begin	=3D exynos_crtc_atomic_begin,
> +	.atomic_flush	=3D exynos_crtc_atomic_flush,
>  };
> =20
>  static int exynos_drm_crtc_page_flip(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index ab82772..f025a54 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -175,6 +175,8 @@ struct exynos_drm_display {
>   *	hardware overlay is updated.
>   * @win_commit: apply hardware specific overlay data to registers.
>   * @win_disable: disable hardware specific overlay.
> + * @win_protect: protect hardware specific window.
> + * @win_unprotect: unprotect hardware specific window.
>   * @te_handler: trigger to transfer video image at the tearing effec=
t
>   *	synchronization signal if there is a page flip request.
>   */
> @@ -190,6 +192,8 @@ struct exynos_drm_crtc_ops {
>  	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
>  	void (*win_commit)(struct exynos_drm_crtc *crtc, unsigned int zpos)=
;
>  	void (*win_disable)(struct exynos_drm_crtc *crtc, unsigned int zpos=
);
> +	void (*win_protect)(struct exynos_drm_crtc *crtc, unsigned int zpos=
);
> +	void (*win_unprotect)(struct exynos_drm_crtc *crtc, unsigned int zp=
os);
>  	void (*te_handler)(struct exynos_drm_crtc *crtc);
>  };
> =20
> @@ -206,6 +210,7 @@ struct exynos_drm_crtc_ops {
>   *	we can refer to the crtc to current hardware interrupt occurred t=
hrough
>   *	this pipe value.
>   * @dpms: store the crtc dpms value
> + * @plane_mask: store planes to be updated on atomic modesetting
>   * @event: vblank event that is currently queued for flip
>   * @ops: pointer to callbacks for exynos drm specific functionality
>   * @ctx: A pointer to the crtc's implementation specific context
> @@ -215,6 +220,7 @@ struct exynos_drm_crtc {
>  	enum exynos_drm_output_type	type;
>  	unsigned int			pipe;
>  	unsigned int			dpms;
> +	unsigned int			plane_mask;
>  	wait_queue_head_t		pending_flip_queue;
>  	struct drm_pending_vblank_event	*event;
>  	struct exynos_drm_crtc_ops	*ops;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 990ead434..bea70f6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -590,6 +590,16 @@ static void fimd_shadow_protect_win(struct fimd_=
context *ctx,
>  {
>  	u32 reg, bits, val;
> =20
> +	/*
> +	 * SHADOWCON/PRTCON register is used for enabling timing.
> +	 *
> +	 * for example, once only width value of a register is set,
> +	 * if the dma is started then fimd hardware could malfunction so
> +	 * with protect window setting, the register fields with prefix '_F=
'
> +	 * wouldn't be updated at vsync also but updated once unprotect win=
dow
> +	 * is set.
> +	 */
> +
>  	if (ctx->driver_data->has_shadowcon) {
>  		reg =3D SHADOWCON;
>  		bits =3D SHADOWCON_WINx_PROTECT(win);
> @@ -628,20 +638,6 @@ static void fimd_win_commit(struct exynos_drm_cr=
tc *crtc, unsigned int win)
>  		return;
>  	}
> =20
> -	/*
> -	 * SHADOWCON/PRTCON register is used for enabling timing.
> -	 *
> -	 * for example, once only width value of a register is set,
> -	 * if the dma is started then fimd hardware could malfunction so
> -	 * with protect window setting, the register fields with prefix '_F=
'
> -	 * wouldn't be updated at vsync also but updated once unprotect win=
dow
> -	 * is set.
> -	 */
> -
> -	/* protect windows */
> -	fimd_shadow_protect_win(ctx, win, true);

You removed to protect shadow register updating at vsync so fimd
hardware could malfunction if setcrtc/page flip/setplane are requested
by userspace. Actually, when I run modetest repeatedly, I could see
overlay isn't rarely turned on.

So how about calling win_protect/unprotect callbacks like below? If you
are ok, I can modify it and merge it.

static void exynos_drm_crtc_commit(struct drm_crtc *crtc)
{
        ...
        if (exynos_crtc->ops->win_protect)
                exynos_crtc->ops->win_protect(exynos_crtc,
exynos_plane->zpos);

        if (exynos_crtc->ops->win_commit)
                exynos_crtc->ops->win_commit(exynos_crtc,
exynos_plane->zpos);

        if (exynos_crtc->ops->win_unprotect)
                exynos_crtc->ops->win_unprotect(exynos_crtc,
exynos_plane->zpos);
        ...
}


And other, I could see below warning messages when I tried to unload
Exynos dsi module with a command, "echo 11c80000.dsi
>/sys/bus/platform/drivers/exynos-dsi/unbind"

# echo 11c80000.dsi >/sys/bus/platform/drivers/exynos-dsi/unbind
[  230.800467] Console: switching to colour dummy device 80x30
[  230.805005] drm_kms_helper: drm: unregistered panic notifier
[  230.849266] ------------[ cut here ]------------
[  230.852516] WARNING: CPU: 3 PID: 1428 at
drivers/gpu/drm/drm_crtc.c:5455 drm_mode_config_cleanup+0x1f4/0x1fc()
[  230.862532] Modules linked in:
[  230.865472] CPU: 3 PID: 1428 Comm: sh Not tainted
3.19.0-rc6-161746-g9d96aee-dirty #1243
[  230.873564] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[  230.879677] [<c0014430>] (unwind_backtrace) from [<c001158c>]
(show_stack+0x10/0x14)
[  230.887370] [<c001158c>] (show_stack) from [<c047cfbc>]
(dump_stack+0x84/0xc4)
[  230.894580] [<c047cfbc>] (dump_stack) from [<c0020b00>]
(warn_slowpath_common+0x80/0xb0)
[  230.902639] [<c0020b00>] (warn_slowpath_common) from [<c0020bcc>]
(warn_slowpath_null+0x1c/0x24)
[  230.911405] [<c0020bcc>] (warn_slowpath_null) from [<c0274370>]
(drm_mode_config_cleanup+0x1f4/0x1fc)
[  230.920608] [<c0274370>] (drm_mode_config_cleanup) from [<c0282970>]
(exynos_drm_unload+0x38/0x4c)
[  230.929548] [<c0282970>] (exynos_drm_unload) from [<c026c250>]
(drm_dev_unregister+0x24/0x98)
[  230.938050] [<c026c250>] (drm_dev_unregister) from [<c026c4dc>]
(drm_put_dev+0x2c/0x60)
[  230.946046] [<c026c4dc>] (drm_put_dev) from [<c029b1d0>]
(take_down_master+0x24/0x44)
[  230.953861] [<c029b1d0>] (take_down_master) from [<c029b328>]
(component_del+0x90/0xd0)
[  230.961850] [<c029b328>] (component_del) from [<c0288184>]
(exynos_dsi_remove+0x18/0x2c)
[  230.969919] [<c0288184>] (exynos_dsi_remove) from [<c02a10cc>]
(platform_drv_remove+0x18/0x30)
[  230.978505] [<c02a10cc>] (platform_drv_remove) from [<c029f58c>]
(__device_release_driver+0x70/0xc4)
[  230.987615] [<c029f58c>] (__device_release_driver) from [<c029f5fc>]
(device_release_driver+0x1c/0x28)
[  230.996904] [<c029f5fc>] (device_release_driver) from [<c029e730>]
(unbind_store+0x78/0xf8)
[  231.005240] [<c029e730>] (unbind_store) from [<c0125f1c>]
(kernfs_fop_write+0xb8/0x19c)
[  231.013223] [<c0125f1c>] (kernfs_fop_write) from [<c00cd830>]
(vfs_write+0xa0/0x1ac)
[  231.020946] [<c00cd830>] (vfs_write) from [<c00cde88>]
(SyS_write+0x44/0x9c)
[  231.027983] [<c00cde88>] (SyS_write) from [<c000e6e0>]
(ret_fast_syscall+0x0/0x34)
[  231.035523] ---[ end trace 954377a3aab4ab59 ]---
[  231.042414] lcd0-power-domain: Power-off latency exceeded, new value
201333 ns

This warning would mean a fb object leak and while I have a review, I
couldn't find why it causes the leak.

However, I'd like to merge this patch series this time and fix this
issue at RC for phase 3.

Thanks,
Inki Dae
