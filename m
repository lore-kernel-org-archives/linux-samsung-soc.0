From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: 'win' is always unsigned
Date: Mon, 11 May 2015 22:26:20 +0900
Message-ID: <5550ADFC.90508@samsung.com>
References: <1430914222-3603-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1430914222-3603-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45734 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448AbbEKN0X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 09:26:23 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NO600HVTTBXD600@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 May 2015 22:26:21 +0900 (KST)
In-reply-to: <1430914222-3603-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com

On 2015=EB=85=84 05=EC=9B=94 06=EC=9D=BC 21:10, Tobias Jakobi wrote:
> The index for the hardware layer is always >=3D0. Previous
> code that also used -1 as special index is now gone.
>=20
> Also apply this to 'ch_enabled' (decon/fimd), since the
> variable is on the same line (and is again always unsigned).

I can see below error with checkpatch.pl,

WARNING: line over 80 characters
#125: FILE: drivers/gpu/drm/exynos/exynos_drm_fimd.c:232:
+static void fimd_enable_shadow_channel_path(struct fimd_context *ctx,
unsigned int win,

WARNING: line over 80 characters
#147: FILE: drivers/gpu/drm/exynos/exynos_mixer.c:336:
+static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int
win, bool enable)

Please check coding style with checkpath.pl before posting it next time=
=2E
I modified and merged them.

Thanks,
Inki Dae

>=20
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 6 +++---
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu=
/drm/exynos/exynos7_drm_decon.c
> index 1f7e33f..5c0b2cc 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -91,7 +91,7 @@ static void decon_wait_for_vblank(struct exynos_drm=
_crtc *crtc)
> =20
>  static void decon_clear_channel(struct decon_context *ctx)
>  {
> -	int win, ch_enabled =3D 0;
> +	unsigned int win, ch_enabled =3D 0;
> =20
>  	DRM_DEBUG_KMS("%s\n", __FILE__);
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index 9819fa6..ee11ea6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -216,7 +216,7 @@ static void fimd_wait_for_vblank(struct exynos_dr=
m_crtc *crtc)
>  		DRM_DEBUG_KMS("vblank wait timed out.\n");
>  }
> =20
> -static void fimd_enable_video_output(struct fimd_context *ctx, int w=
in,
> +static void fimd_enable_video_output(struct fimd_context *ctx, unsig=
ned int win,
>  					bool enable)
>  {
>  	u32 val =3D readl(ctx->regs + WINCON(win));
> @@ -229,7 +229,7 @@ static void fimd_enable_video_output(struct fimd_=
context *ctx, int win,
>  	writel(val, ctx->regs + WINCON(win));
>  }
> =20
> -static void fimd_enable_shadow_channel_path(struct fimd_context *ctx=
, int win,
> +static void fimd_enable_shadow_channel_path(struct fimd_context *ctx=
, unsigned int win,
>  						bool enable)
>  {
>  	u32 val =3D readl(ctx->regs + SHADOWCON);
> @@ -244,7 +244,7 @@ static void fimd_enable_shadow_channel_path(struc=
t fimd_context *ctx, int win,
> =20
>  static void fimd_clear_channel(struct fimd_context *ctx)
>  {
> -	int win, ch_enabled =3D 0;
> +	unsigned int win, ch_enabled =3D 0;
> =20
>  	DRM_DEBUG_KMS("%s\n", __FILE__);
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index ff15702..4a1656b 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -333,7 +333,7 @@ static void mixer_cfg_rgb_fmt(struct mixer_contex=
t *ctx, unsigned int height)
>  	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_RGB_FMT_MASK);
>  }
> =20
> -static void mixer_cfg_layer(struct mixer_context *ctx, int win, bool=
 enable)
> +static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int =
win, bool enable)
>  {
>  	struct mixer_resources *res =3D &ctx->mixer_res;
>  	u32 val =3D enable ? ~0 : 0;
> @@ -379,7 +379,7 @@ static void mixer_stop(struct mixer_context *ctx)
>  		usleep_range(10000, 12000);
>  }
> =20
> -static void vp_video_buffer(struct mixer_context *ctx, int win)
> +static void vp_video_buffer(struct mixer_context *ctx, unsigned int =
win)
>  {
>  	struct mixer_resources *res =3D &ctx->mixer_res;
>  	unsigned long flags;
> @@ -511,7 +511,7 @@ fail:
>  	return -ENOTSUPP;
>  }
> =20
> -static void mixer_graph_buffer(struct mixer_context *ctx, int win)
> +static void mixer_graph_buffer(struct mixer_context *ctx, unsigned i=
nt win)
>  {
>  	struct mixer_resources *res =3D &ctx->mixer_res;
>  	unsigned long flags;
>=20
