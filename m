From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 25/29] drm/exynos: atomic phase 1: use
 drm_plane_helper_disable()
Date: Tue, 30 Dec 2014 23:19:24 +0900
Message-ID: <54A2B46C.7060401@samsung.com>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
 <1418911135-5207-26-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46622 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833AbaL3OT0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Dec 2014 09:19:26 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NHE004N1FSCLA50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 30 Dec 2014 23:19:24 +0900 (KST)
In-reply-to: <1418911135-5207-26-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2014=EB=85=84 12=EC=9B=94 18=EC=9D=BC 22:58, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> The atomic helper to disable planes also uses exynos_update_plane() t=
o
> disable plane so we had to adapt it to both commit and disable planes=
=2E
>=20
> A check for NULL CRTC was added to exynos_plane_mode_set() since plan=
es
> to be disabled have plane_state->crtc set to NULL.
>=20
> Also win_disable() callback uses plane->crtc as arg for the same reas=
on.
>=20
> exynos_drm_fb_get_buf_cnt() needs a fb check too to avoid a null poin=
ter.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c    |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c | 24 ++++++++++++++++++---=
---
>  2 files changed, 19 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm=
/exynos/exynos_drm_fb.c
> index d346d1e..470456d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -136,7 +136,7 @@ unsigned int exynos_drm_fb_get_buf_cnt(struct drm=
_framebuffer *fb)
> =20
>  	exynos_fb =3D to_exynos_fb(fb);
> =20
> -	return exynos_fb->buf_cnt;
> +	return exynos_fb ? exynos_fb->buf_cnt : 0;

This change isn't related with this patch.

>  }
> =20
>  struct drm_framebuffer *
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/=
drm/exynos/exynos_drm_plane.c
> index 1c67fbc..dfca218 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -98,6 +98,9 @@ static void exynos_plane_mode_set(struct drm_plane =
*plane, struct drm_crtc *crtc
>  	unsigned int actual_w;
>  	unsigned int actual_h;
> =20
> +	if (!crtc)
> +		return;

Ditto.

> +
>  	actual_w =3D exynos_plane_get_size(crtc_x, crtc_w, crtc->mode.hdisp=
lay);
>  	actual_h =3D exynos_plane_get_size(crtc_y, crtc_h, crtc->mode.vdisp=
lay);
> =20
> @@ -140,8 +143,6 @@ static void exynos_plane_mode_set(struct drm_plan=
e *plane, struct drm_crtc *crtc
>  			exynos_plane->crtc_x, exynos_plane->crtc_y,
>  			exynos_plane->crtc_width, exynos_plane->crtc_height);
> =20
> -	plane->crtc =3D crtc;
> -
>  	if (exynos_crtc->ops->win_mode_set)
>  		exynos_crtc->ops->win_mode_set(exynos_crtc, exynos_plane);
>  }
> @@ -179,15 +180,26 @@ exynos_update_plane(struct drm_plane *plane, st=
ruct drm_crtc *crtc,
>  		     uint32_t src_x, uint32_t src_y,
>  		     uint32_t src_w, uint32_t src_h)
>  {
> -	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
>  	struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
> +	struct exynos_drm_crtc *exynos_crtc;
> =20
>  	exynos_plane_mode_set(plane, crtc, fb, crtc_x, crtc_y,
>  			      crtc_w, crtc_h, src_x >> 16, src_y >> 16,
>  			      src_w >> 16, src_h >> 16);
> =20
> -	if (exynos_crtc->ops->win_commit)
> -		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
> +	if (fb) {
> +		exynos_crtc =3D to_exynos_crtc(crtc);
> +		if (exynos_crtc->ops->win_commit)
> +			exynos_crtc->ops->win_commit(exynos_crtc,
> +						     exynos_plane->zpos);
> +	} else {
> +		exynos_crtc =3D to_exynos_crtc(plane->crtc);
> +		if (exynos_crtc->ops->win_disable)
> +			exynos_crtc->ops->win_disable(exynos_crtc,
> +						      exynos_plane->zpos);
> +	}
> +
> +	plane->crtc =3D crtc;
>  }
> =20
>  static int exynos_disable_plane(struct drm_plane *plane)
> @@ -224,7 +236,7 @@ static int exynos_plane_set_property(struct drm_p=
lane *plane,
> =20
>  static struct drm_plane_funcs exynos_plane_funcs =3D {
>  	.update_plane	=3D drm_plane_helper_update,
> -	.disable_plane	=3D exynos_disable_plane,
> +	.disable_plane	=3D drm_plane_helper_disable,
>  	.destroy	=3D exynos_plane_destroy,
>  	.set_property	=3D exynos_plane_set_property,
>  };
>=20
