From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 03/11] drm/exynos: add prepare and cleanup phases for planes
Date: Mon, 24 Aug 2015 21:56:19 +0900
Message-ID: <55DB1473.40109@samsung.com>
References: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
 <1439655980-32146-4-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60058 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754136AbbHXM4V convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 08:56:21 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTL01RVM7XVCM40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Aug 2015 21:56:19 +0900 (KST)
In-reply-to: <1439655980-32146-4-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 08=EC=9B=94 16=EC=9D=BC 01:26, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> .prepare_plane() and .cleanup_plane() allows to perform extra operati=
ons
> before and after the update of planes. For FIMD for example this will
> be used to enable disable the shadow protection bit.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |  6 ++++++
>  2 files changed, 25 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/d=
rm/exynos/exynos_drm_crtc.c
> index 5a19e16..3a89fc9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -72,15 +72,34 @@ exynos_drm_crtc_mode_set_nofb(struct drm_crtc *cr=
tc)
>  static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
>  {
>  	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> +	struct drm_plane *plane;
> =20
>  	if (crtc->state->event) {
>  		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
>  		exynos_crtc->event =3D crtc->state->event;
>  	}
> +
> +	drm_atomic_crtc_for_each_plane(plane, crtc) {
> +		struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
> +
> +		if (exynos_crtc->ops->prepare_plane)
> +			exynos_crtc->ops->prepare_plane(exynos_crtc,
> +							exynos_plane);

There is no any reason to use prepare_plane/cleanup_plane callback
names. How about using atomic_begin/atomic_flush callback names instead
for consistency between framework and device drivers?

Thanks,
Inki Dae

> +	}
>  }
> =20
>  static void exynos_crtc_atomic_flush(struct drm_crtc *crtc)
>  {
> +	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> +	struct drm_plane *plane;
> +
> +	drm_atomic_crtc_for_each_plane(plane, crtc) {
> +		struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
> +
> +		if (exynos_crtc->ops->cleanup_plane)
> +			exynos_crtc->ops->cleanup_plane(exynos_crtc,
> +							exynos_plane);
> +	}
>  }
> =20
>  static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs =3D {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index a993aac..9f2b5c9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -87,6 +87,8 @@ struct exynos_drm_plane {
>   * @disable_vblank: specific driver callback for disabling vblank in=
terrupt.
>   * @wait_for_vblank: wait for vblank interrupt to make sure that
>   *	hardware overlay is updated.
> + * @prepare_plane: prepare a window to receive a update
> + * @cleanup_plane: mark the end of a window update
>   * @update_plane: apply hardware specific overlay data to registers.
>   * @disable_plane: disable hardware specific overlay.
>   * @te_handler: trigger to transfer video image at the tearing effec=
t
> @@ -107,10 +109,14 @@ struct exynos_drm_crtc_ops {
>  	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
>  	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
>  	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
> +	void (*prepare_plane)(struct exynos_drm_crtc *crtc,
> +			      struct exynos_drm_plane *plane);
>  	void (*update_plane)(struct exynos_drm_crtc *crtc,
>  			     struct exynos_drm_plane *plane);
>  	void (*disable_plane)(struct exynos_drm_crtc *crtc,
>  			      struct exynos_drm_plane *plane);
> +	void (*cleanup_plane)(struct exynos_drm_crtc *crtc,
> +			      struct exynos_drm_plane *plane);
>  	void (*te_handler)(struct exynos_drm_crtc *crtc);
>  	void (*clock_enable)(struct exynos_drm_crtc *crtc, bool enable);
>  };
>=20
