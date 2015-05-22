From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v6 11/12] drm/exynos: atomic dpms support
Date: Fri, 22 May 2015 22:00:24 +0900
Message-ID: <555F2868.8060109@samsung.com>
References: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
 <1432238571-31621-12-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44826 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964803AbbEVNA0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 09:00:26 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NOR000BA5GOV690@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 May 2015 22:00:25 +0900 (KST)
In-reply-to: <1432238571-31621-12-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

On 2015=EB=85=84 05=EC=9B=94 22=EC=9D=BC 05:02, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Run dpms operations through the atomic intefaces. This basically remo=
ves
> the .dpms() callback from econders and crtcs and use .disable() and
> .enable() to turn the crtc on and off.
>=20
> v2: Address comments by Joonyoung:
> 	- make hdmi code call ->disable() instead of ->dpms()
> 	- do not use WARN_ON on crtc enable/disable
>=20
> v3: - Fix build failure after the hdmi change in v2
>     - Change dpms helper of ptn3460 bridge
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/bridge/ps8622.c             |  2 +-
>  drivers/gpu/drm/bridge/ptn3460.c            |  2 +-
>  drivers/gpu/drm/exynos/exynos_dp_core.c     |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 99 ++++++++++++++++---=
----------
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |  4 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_encoder.c | 27 ++------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  2 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  6 +-
>  10 files changed, 71 insertions(+), 77 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ps8622.c b/drivers/gpu/drm/bridge=
/ps8622.c
> index b604326..d686235 100644
> --- a/drivers/gpu/drm/bridge/ps8622.c
> +++ b/drivers/gpu/drm/bridge/ps8622.c
> @@ -499,7 +499,7 @@ static void ps8622_connector_destroy(struct drm_c=
onnector *connector)
>  }
> =20
>  static const struct drm_connector_funcs ps8622_connector_funcs =3D {
> -	.dpms =3D drm_helper_connector_dpms,
> +	.dpms =3D drm_atomic_helper_connector_dpms,
>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
>  	.detect =3D ps8622_detect,
>  	.destroy =3D ps8622_connector_destroy,
> diff --git a/drivers/gpu/drm/bridge/ptn3460.c b/drivers/gpu/drm/bridg=
e/ptn3460.c
> index 8ed3617..260bc9f 100644
> --- a/drivers/gpu/drm/bridge/ptn3460.c
> +++ b/drivers/gpu/drm/bridge/ptn3460.c
> @@ -260,7 +260,7 @@ static void ptn3460_connector_destroy(struct drm_=
connector *connector)
>  }
> =20
>  static struct drm_connector_funcs ptn3460_connector_funcs =3D {
> -	.dpms =3D drm_helper_connector_dpms,
> +	.dpms =3D drm_atomic_helper_connector_dpms,
>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
>  	.detect =3D ptn3460_detect,
>  	.destroy =3D ptn3460_connector_destroy,
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/dr=
m/exynos/exynos_dp_core.c
> index 195fe60..c9995b1 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -954,7 +954,7 @@ static void exynos_dp_connector_destroy(struct dr=
m_connector *connector)
>  }
> =20
>  static struct drm_connector_funcs exynos_dp_connector_funcs =3D {
> -	.dpms =3D drm_helper_connector_dpms,
> +	.dpms =3D drm_atomic_helper_connector_dpms,
>  	.fill_modes =3D drm_helper_probe_single_connector_modes,
>  	.detect =3D exynos_dp_detect,
>  	.destroy =3D exynos_dp_connector_destroy,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/d=
rm/exynos/exynos_drm_crtc.c
> index 3251652..92a5595 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -22,51 +22,57 @@
>  #include "exynos_drm_encoder.h"
>  #include "exynos_drm_plane.h"
> =20
> -static void exynos_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
> +static void exynos_drm_crtc_enable(struct drm_crtc *crtc)
>  {
>  	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> +	struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(crtc->pri=
mary);
> =20
> -	DRM_DEBUG_KMS("crtc[%d] mode[%d]\n", crtc->base.id, mode);
> -
> -	if (exynos_crtc->dpms =3D=3D mode) {
> -		DRM_DEBUG_KMS("desired dpms mode is same as previous one.\n");
> +	if (exynos_crtc->enabled)
>  		return;
> -	}
> -
> -	if (mode > DRM_MODE_DPMS_ON) {
> -		/* wait for the completion of page flip. */
> -		if (!wait_event_timeout(exynos_crtc->pending_flip_queue,
> -				(exynos_crtc->event =3D=3D NULL), HZ/20))
> -			exynos_crtc->event =3D NULL;
> -		drm_crtc_vblank_off(crtc);
> -	}
> =20
>  	if (exynos_crtc->ops->dpms)
> -		exynos_crtc->ops->dpms(exynos_crtc, mode);
> +		exynos_crtc->ops->dpms(exynos_crtc, DRM_MODE_DPMS_ON);
> =20
> -	exynos_crtc->dpms =3D mode;
> +	exynos_crtc->enabled =3D true;
> =20
> -	if (mode =3D=3D DRM_MODE_DPMS_ON)
> -		drm_crtc_vblank_on(crtc);
> -}
> +	drm_crtc_vblank_on(crtc);
> =20
> -static void exynos_drm_crtc_prepare(struct drm_crtc *crtc)
> -{
> -	/* drm framework doesn't check NULL. */
> +	if (exynos_crtc->ops->win_commit)
> +		exynos_crtc->ops->win_commit(exynos_crtc, exynos_plane->zpos);
> +
> +	if (exynos_crtc->ops->commit)
> +		exynos_crtc->ops->commit(exynos_crtc);

crtc commit already was called by mode_set_nofb callback as soon as it
disables crtc and encoder devices so I think unnecessary. Please see th=
e
drm_atomic_helper_commit_modeset_disable function.

<--snip-->

Thanks,
Inki Dae
