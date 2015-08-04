From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 09/11] drm/exynos: remove exynos_drm_create_enc_conn()
Date: Tue, 04 Aug 2015 18:41:38 +0900
Message-ID: <55C088D2.1090008@samsung.com>
References: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
 <1438628998-3435-10-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56849 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754495AbbHDJl4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Aug 2015 05:41:56 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NSJ01ETTXLE2A10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Aug 2015 18:41:38 +0900 (KST)
In-reply-to: <1438628998-3435-10-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 08=EC=9B=94 04=EC=9D=BC 04:09, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> This functions was just hiding the encoder and connector creation in
> a way that was less clean than if we get rid of it. For example,
> exynos_encoder ops had .create_connector() defined only because we we=
re
> handing off the encoder and connector creation to
> exynos_drm_create_enc_conn(). Without this function we can directly c=
all
> the create_connector function internally in the code, without the nee=
d of
> any vtable access.
>=20
> It also does some refactoring in the code like creating a bind functi=
on
> for dpi devices.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c  |  3 +--
>  drivers/gpu/drm/exynos/exynos_dp_core.c     | 20 ++++++++++++++++---
>  drivers/gpu/drm/exynos/exynos_drm_core.c    | 30 -------------------=
----------
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     | 26 +++++++++++++++++++=
++++--
>  drivers/gpu/drm/exynos/exynos_drm_drv.h     | 12 ++++++------
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 20 ++++++++++++-------
>  drivers/gpu/drm/exynos/exynos_drm_encoder.c | 11 +++++++----
>  drivers/gpu/drm/exynos/exynos_drm_encoder.h |  4 +++-
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  3 +--
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    | 20 ++++++++++---------
>  drivers/gpu/drm/exynos/exynos_hdmi.c        | 21 +++++++++++++++++--=
-
>  11 files changed, 101 insertions(+), 69 deletions(-)
>=20

[-- SNIP --]

> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/e=
xynos/exynos_hdmi.c
> index 11bac50..f72ceeb 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -44,6 +44,7 @@
> =20
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_crtc.h"
> +#include "exynos_drm_encoder.h"
>  #include "exynos_mixer.h"
> =20
>  #include <linux/gpio.h>
> @@ -1783,7 +1784,6 @@ static void hdmi_disable(struct exynos_drm_enco=
der *encoder)
>  }
> =20
>  static struct exynos_drm_encoder_ops hdmi_encoder_ops =3D {
> -	.create_connector =3D hdmi_create_connector,
>  	.mode_fixup	=3D hdmi_mode_fixup,
>  	.mode_set	=3D hdmi_mode_set,
>  	.enable		=3D hdmi_enable,
> @@ -1917,11 +1917,26 @@ static int hdmi_bind(struct device *dev, stru=
ct device *master, void *data)
>  {
>  	struct drm_device *drm_dev =3D data;
>  	struct hdmi_context *hdata =3D dev_get_drvdata(dev);
> +	struct exynos_drm_encoder *exynos_encoder =3D &hdata->encoder;
> +	int ret;
> =20
>  	hdata->drm_dev =3D drm_dev;
> =20
> -	return exynos_drm_create_enc_conn(drm_dev, &hdata->encoder,
> -					  EXYNOS_DISPLAY_TYPE_HDMI);
> +	ret =3D exynos_drm_encoder_create(drm_dev, exynos_encoder,
> +					EXYNOS_DISPLAY_TYPE_HDMI);
> +	if (ret) {
> +		DRM_ERROR("failed to create encoder\n");
> +		return ret;
> +	}
> +
> +	hdmi_create_connector(exynos_encoder);

ret =3D hdmi_create_connector(exynos_encoder);

> +	if (ret) {
> +		DRM_ERROR("failed to create connector ret =3D %d\n", ret);
> +		drm_encoder_cleanup(&exynos_encoder->base);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
> =20
>  static void hdmi_unbind(struct device *dev, struct device *master, v=
oid *data)
>=20
