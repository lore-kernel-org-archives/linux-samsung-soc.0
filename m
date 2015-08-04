From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 11/11] drm/exynos: remove struct exynos_drm_encoder layer
Date: Tue, 04 Aug 2015 18:53:28 +0900
Message-ID: <55C08B98.4090002@samsung.com>
References: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
 <1438628998-3435-12-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56657 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932305AbbHDJxq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Aug 2015 05:53:46 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NSJ00WYQY549J60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Aug 2015 18:53:28 +0900 (KST)
In-reply-to: <1438628998-3435-12-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 08=EC=9B=94 04=EC=9D=BC 04:09, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> struct exynos_drm_encoder was justing wrapping struct drm_encoder, it=
 had
> only a drm_encoder member and the internal exynos_drm_encoders ops th=
at
> was directly mapped to the drm_encoder helper funcs.
>=20
> So now exynos DRM uses struct drm_encoder directly, this removes
> completely the struct exynos_drm_encoder.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/Makefile             |   7 +-
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c  |   2 +-
>  drivers/gpu/drm/exynos/exynos_dp_core.c     |  68 ++++++++++++------
>  drivers/gpu/drm/exynos/exynos_dp_core.h     |   2 +-
>  drivers/gpu/drm/exynos/exynos_drm_core.c    |   1 -
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c    |   1 -
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  51 ++++++++------
>  drivers/gpu/drm/exynos/exynos_drm_drv.c     |   1 -
>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |  47 ++-----------
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  80 +++++++++++-------=
---
>  drivers/gpu/drm/exynos/exynos_drm_encoder.c | 105 ------------------=
----------
>  drivers/gpu/drm/exynos/exynos_drm_encoder.h |  22 ------
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c    |   2 +-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  71 ++++++++++++++----=
-
>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  85 +++++++++++++-----=
----
>  15 files changed, 236 insertions(+), 309 deletions(-)
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.c
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.h

[-- SNIP --]

> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/dr=
m/exynos/exynos_drm_dsi.c
> index d791ad4..a87d030 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -30,7 +30,6 @@
>  #include <video/videomode.h>
> =20
>  #include "exynos_drm_crtc.h"
> -#include "exynos_drm_encoder.h"
>  #include "exynos_drm_drv.h"
> =20
>  /* returns true iff both arguments logically differs */
> @@ -260,7 +259,7 @@ struct exynos_dsi_driver_data {
>  };
> =20
>  struct exynos_dsi {
> -	struct exynos_drm_encoder encoder;
> +	struct drm_encoder encoder;
>  	struct mipi_dsi_host dsi_host;
>  	struct drm_connector connector;
>  	struct device_node *panel_node;
> @@ -296,7 +295,7 @@ struct exynos_dsi {
>  #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_=
host)
>  #define connector_to_dsi(c) container_of(c, struct exynos_dsi, conne=
ctor)
> =20
> -static inline struct exynos_dsi *encoder_to_dsi(struct exynos_drm_en=
coder *e)
> +static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *=
e)
>  {
>  	return container_of(e, struct exynos_dsi, encoder);
>  }
> @@ -1273,7 +1272,7 @@ static irqreturn_t exynos_dsi_irq(int irq, void=
 *dev_id)
>  static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
>  {
>  	struct exynos_dsi *dsi =3D (struct exynos_dsi *)dev_id;
> -	struct drm_encoder *encoder =3D &dsi->encoder.base;
> +	struct drm_encoder *encoder =3D &dsi->encoder;
> =20
>  	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
>  		exynos_drm_crtc_te_handler(encoder->crtc);
> @@ -1519,7 +1518,7 @@ static void exynos_dsi_poweroff(struct exynos_d=
si *dsi)
>  		dev_err(dsi->dev, "cannot disable regulators %d\n", ret);
>  }
> =20
> -static void exynos_dsi_enable(struct exynos_drm_encoder *encoder)
> +static void exynos_dsi_enable(struct drm_encoder *encoder)
>  {
>  	struct exynos_dsi *dsi =3D encoder_to_dsi(encoder);
>  	int ret;
> @@ -1555,7 +1554,7 @@ static void exynos_dsi_enable(struct exynos_drm=
_encoder *encoder)
>  	dsi->state |=3D DSIM_STATE_VIDOUT_AVAILABLE;
>  }
> =20
> -static void exynos_dsi_disable(struct exynos_drm_encoder *encoder)
> +static void exynos_dsi_disable(struct drm_encoder *encoder)
>  {
>  	struct exynos_dsi *dsi =3D encoder_to_dsi(encoder);
> =20
> @@ -1583,7 +1582,7 @@ exynos_dsi_detect(struct drm_connector *connect=
or, bool force)
>  		if (dsi->panel)
>  			drm_panel_attach(dsi->panel, &dsi->connector);
>  	} else if (!dsi->panel_node) {
> -		struct exynos_drm_encoder *encoder;
> +		struct drm_encoder *encoder;
> =20
>  		encoder =3D platform_get_drvdata(to_platform_device(dsi->dev));
>  		exynos_dsi_disable(encoder);
> @@ -1629,7 +1628,7 @@ exynos_dsi_best_encoder(struct drm_connector *c=
onnector)
>  {
>  	struct exynos_dsi *dsi =3D connector_to_dsi(connector);
> =20
> -	return &dsi->encoder.base;
> +	return &dsi->encoder;
>  }
> =20
>  static struct drm_connector_helper_funcs exynos_dsi_connector_helper=
_funcs =3D {
> @@ -1637,11 +1636,9 @@ static struct drm_connector_helper_funcs exyno=
s_dsi_connector_helper_funcs =3D {
>  	.best_encoder =3D exynos_dsi_best_encoder,
>  };
> =20
> -static int exynos_dsi_create_connector(
> -				struct exynos_drm_encoder *exynos_encoder)
> +static int exynos_dsi_create_connector(struct drm_encoder *encoder)
>  {
> -	struct exynos_dsi *dsi =3D encoder_to_dsi(exynos_encoder);
> -	struct drm_encoder *encoder =3D &exynos_encoder->base;
> +	struct exynos_dsi *dsi =3D encoder_to_dsi(encoder);
>  	struct drm_connector *connector =3D &dsi->connector;
>  	int ret;
> =20
> @@ -1662,28 +1659,34 @@ static int exynos_dsi_create_connector(
>  	return 0;
>  }
> =20
> -static void exynos_dsi_mode_set(struct exynos_drm_encoder *encoder,
> -			 struct drm_display_mode *mode)
> +static void exynos_dsi_mode_set(struct drm_encoder *encoder,
> +				struct drm_display_mode *mode,
> +				struct drm_display_mode *adjusted_mode)
>  {
>  	struct exynos_dsi *dsi =3D encoder_to_dsi(encoder);
>  	struct videomode *vm =3D &dsi->vm;
> -
> -	vm->hactive =3D mode->hdisplay;
> -	vm->vactive =3D mode->vdisplay;
> -	vm->vfront_porch =3D mode->vsync_start - mode->vdisplay;
> -	vm->vback_porch =3D mode->vtotal - mode->vsync_end;
> -	vm->vsync_len =3D mode->vsync_end - mode->vsync_start;
> -	vm->hfront_porch =3D mode->hsync_start - mode->hdisplay;
> -	vm->hback_porch =3D mode->htotal - mode->hsync_end;
> -	vm->hsync_len =3D mode->hsync_end - mode->hsync_start;
> +	struct drm_display_mode *m =3D adjusted_mode;
> +
> +	vm->hactive =3D m->hdisplay;
> +	vm->vactive =3D m->vdisplay;
> +	vm->vfront_porch =3D m->vsync_start - m->vdisplay;
> +	vm->vback_porch =3D m->vtotal - m->vsync_end;
> +	vm->vsync_len =3D m->vsync_end - m->vsync_start;
> +	vm->hfront_porch =3D m->hsync_start - m->hdisplay;
> +	vm->hback_porch =3D m->htotal - m->hsync_end;
> +	vm->hsync_len =3D m->hsync_end - m->hsync_start;

Above changes are not related to what this patch wants to do and just
cleanup patch.
