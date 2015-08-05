From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 11/11] drm/exynos: remove struct exynos_drm_encoder layer
Date: Wed, 5 Aug 2015 10:43:17 -0300
Message-ID: <20150805134317.GC8125@joana>
References: <1438628998-3435-1-git-send-email-gustavo@padovan.org>
 <1438628998-3435-12-git-send-email-gustavo@padovan.org>
 <55C08B98.4090002@samsung.com>
 <20150804144716.GA8125@joana>
 <55C1676A.4080207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:34872 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751421AbbHENnV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Aug 2015 09:43:21 -0400
Received: by ykcq64 with SMTP id q64so30434555ykc.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Aug 2015 06:43:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55C1676A.4080207@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

2015-08-05 Inki Dae <inki.dae@samsung.com>:

Hi Inki,

> On 2015=EB=85=84 08=EC=9B=94 04=EC=9D=BC 23:47, Gustavo Padovan wrote=
:
> > Hi Inki,
> >=20
> > 2015-08-04 Inki Dae <inki.dae@samsung.com>:
> >=20
> >> On 2015=EB=85=84 08=EC=9B=94 04=EC=9D=BC 04:09, Gustavo Padovan wr=
ote:
> >>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >>>
> >>> struct exynos_drm_encoder was justing wrapping struct drm_encoder=
, it had
> >>> only a drm_encoder member and the internal exynos_drm_encoders op=
s that
> >>> was directly mapped to the drm_encoder helper funcs.
> >>>
> >>> So now exynos DRM uses struct drm_encoder directly, this removes
> >>> completely the struct exynos_drm_encoder.
> >>>
> >>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >>> ---
> >>>  drivers/gpu/drm/exynos/Makefile             |   7 +-
> >>>  drivers/gpu/drm/exynos/exynos7_drm_decon.c  |   2 +-
> >>>  drivers/gpu/drm/exynos/exynos_dp_core.c     |  68 ++++++++++++--=
----
> >>>  drivers/gpu/drm/exynos/exynos_dp_core.h     |   2 +-
> >>>  drivers/gpu/drm/exynos/exynos_drm_core.c    |   1 -
> >>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c    |   1 -
> >>>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |  51 ++++++++------
> >>>  drivers/gpu/drm/exynos/exynos_drm_drv.c     |   1 -
> >>>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |  47 ++-----------
> >>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  80 +++++++++++---=
-------
> >>>  drivers/gpu/drm/exynos/exynos_drm_encoder.c | 105 --------------=
--------------
> >>>  drivers/gpu/drm/exynos/exynos_drm_encoder.h |  22 ------
> >>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c    |   2 +-
> >>>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  71 ++++++++++++++=
-----
> >>>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  85 +++++++++++++-=
--------
> >>>  15 files changed, 236 insertions(+), 309 deletions(-)
> >>>  delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.c
> >>>  delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_encoder.h
> >>
> >> [-- SNIP --]
> >>
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gp=
u/drm/exynos/exynos_drm_dsi.c
> >>> index d791ad4..a87d030 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >>> @@ -30,7 +30,6 @@
> >>>  #include <video/videomode.h>
> >>> =20
> >>>  #include "exynos_drm_crtc.h"
> >>> -#include "exynos_drm_encoder.h"
> >>>  #include "exynos_drm_drv.h"
> >>> =20
> >>>  /* returns true iff both arguments logically differs */
> >>> @@ -260,7 +259,7 @@ struct exynos_dsi_driver_data {
> >>>  };
> >>> =20
> >>>  struct exynos_dsi {
> >>> -	struct exynos_drm_encoder encoder;
> >>> +	struct drm_encoder encoder;
> >>>  	struct mipi_dsi_host dsi_host;
> >>>  	struct drm_connector connector;
> >>>  	struct device_node *panel_node;
> >>> @@ -296,7 +295,7 @@ struct exynos_dsi {
> >>>  #define host_to_dsi(host) container_of(host, struct exynos_dsi, =
dsi_host)
> >>>  #define connector_to_dsi(c) container_of(c, struct exynos_dsi, c=
onnector)
> >>> =20
> >>> -static inline struct exynos_dsi *encoder_to_dsi(struct exynos_dr=
m_encoder *e)
> >>> +static inline struct exynos_dsi *encoder_to_dsi(struct drm_encod=
er *e)
> >>>  {
> >>>  	return container_of(e, struct exynos_dsi, encoder);
> >>>  }
> >>> @@ -1273,7 +1272,7 @@ static irqreturn_t exynos_dsi_irq(int irq, =
void *dev_id)
> >>>  static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_=
id)
> >>>  {
> >>>  	struct exynos_dsi *dsi =3D (struct exynos_dsi *)dev_id;
> >>> -	struct drm_encoder *encoder =3D &dsi->encoder.base;
> >>> +	struct drm_encoder *encoder =3D &dsi->encoder;
> >>> =20
> >>>  	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
> >>>  		exynos_drm_crtc_te_handler(encoder->crtc);
> >>> @@ -1519,7 +1518,7 @@ static void exynos_dsi_poweroff(struct exyn=
os_dsi *dsi)
> >>>  		dev_err(dsi->dev, "cannot disable regulators %d\n", ret);
> >>>  }
> >>> =20
> >>> -static void exynos_dsi_enable(struct exynos_drm_encoder *encoder=
)
> >>> +static void exynos_dsi_enable(struct drm_encoder *encoder)
> >>>  {
> >>>  	struct exynos_dsi *dsi =3D encoder_to_dsi(encoder);
> >>>  	int ret;
> >>> @@ -1555,7 +1554,7 @@ static void exynos_dsi_enable(struct exynos=
_drm_encoder *encoder)
> >>>  	dsi->state |=3D DSIM_STATE_VIDOUT_AVAILABLE;
> >>>  }
> >>> =20
> >>> -static void exynos_dsi_disable(struct exynos_drm_encoder *encode=
r)
> >>> +static void exynos_dsi_disable(struct drm_encoder *encoder)
> >>>  {
> >>>  	struct exynos_dsi *dsi =3D encoder_to_dsi(encoder);
> >>> =20
> >>> @@ -1583,7 +1582,7 @@ exynos_dsi_detect(struct drm_connector *con=
nector, bool force)
> >>>  		if (dsi->panel)
> >>>  			drm_panel_attach(dsi->panel, &dsi->connector);
> >>>  	} else if (!dsi->panel_node) {
> >>> -		struct exynos_drm_encoder *encoder;
> >>> +		struct drm_encoder *encoder;
> >>> =20
> >>>  		encoder =3D platform_get_drvdata(to_platform_device(dsi->dev))=
;
> >>>  		exynos_dsi_disable(encoder);
> >>> @@ -1629,7 +1628,7 @@ exynos_dsi_best_encoder(struct drm_connecto=
r *connector)
> >>>  {
> >>>  	struct exynos_dsi *dsi =3D connector_to_dsi(connector);
> >>> =20
> >>> -	return &dsi->encoder.base;
> >>> +	return &dsi->encoder;
> >>>  }
> >>> =20
> >>>  static struct drm_connector_helper_funcs exynos_dsi_connector_he=
lper_funcs =3D {
> >>> @@ -1637,11 +1636,9 @@ static struct drm_connector_helper_funcs e=
xynos_dsi_connector_helper_funcs =3D {
> >>>  	.best_encoder =3D exynos_dsi_best_encoder,
> >>>  };
> >>> =20
> >>> -static int exynos_dsi_create_connector(
> >>> -				struct exynos_drm_encoder *exynos_encoder)
> >>> +static int exynos_dsi_create_connector(struct drm_encoder *encod=
er)
> >>>  {
> >>> -	struct exynos_dsi *dsi =3D encoder_to_dsi(exynos_encoder);
> >>> -	struct drm_encoder *encoder =3D &exynos_encoder->base;
> >>> +	struct exynos_dsi *dsi =3D encoder_to_dsi(encoder);
> >>>  	struct drm_connector *connector =3D &dsi->connector;
> >>>  	int ret;
> >>> =20
> >>> @@ -1662,28 +1659,34 @@ static int exynos_dsi_create_connector(
> >>>  	return 0;
> >>>  }
> >>> =20
> >>> -static void exynos_dsi_mode_set(struct exynos_drm_encoder *encod=
er,
> >>> -			 struct drm_display_mode *mode)
> >>> +static void exynos_dsi_mode_set(struct drm_encoder *encoder,
> >>> +				struct drm_display_mode *mode,
> >>> +				struct drm_display_mode *adjusted_mode)
> >>>  {
> >>>  	struct exynos_dsi *dsi =3D encoder_to_dsi(encoder);
> >>>  	struct videomode *vm =3D &dsi->vm;
> >>> -
> >>> -	vm->hactive =3D mode->hdisplay;
> >>> -	vm->vactive =3D mode->vdisplay;
> >>> -	vm->vfront_porch =3D mode->vsync_start - mode->vdisplay;
> >>> -	vm->vback_porch =3D mode->vtotal - mode->vsync_end;
> >>> -	vm->vsync_len =3D mode->vsync_end - mode->vsync_start;
> >>> -	vm->hfront_porch =3D mode->hsync_start - mode->hdisplay;
> >>> -	vm->hback_porch =3D mode->htotal - mode->hsync_end;
> >>> -	vm->hsync_len =3D mode->hsync_end - mode->hsync_start;
> >>> +	struct drm_display_mode *m =3D adjusted_mode;
> >>> +
> >>> +	vm->hactive =3D m->hdisplay;
> >>> +	vm->vactive =3D m->vdisplay;
> >>> +	vm->vfront_porch =3D m->vsync_start - m->vdisplay;
> >>> +	vm->vback_porch =3D m->vtotal - m->vsync_end;
> >>> +	vm->vsync_len =3D m->vsync_end - m->vsync_start;
> >>> +	vm->hfront_porch =3D m->hsync_start - m->hdisplay;
> >>> +	vm->hback_porch =3D m->htotal - m->hsync_end;
> >>> +	vm->hsync_len =3D m->hsync_end - m->hsync_start;
> >>
> >> Above changes are not related to what this patch wants to do and j=
ust
> >> cleanup patch.
> >=20
> > It is related in my opinion. Here I change dsi mode_set() to be a
> > drm_encoder ops. Before the change 'mode' was receiving ajusted_mod=
e, but
> > now 'mode' receives the original 'mode' and I need to add=20
> >=20
> > 	struct drm_display_mode *m =3D adjusted_mode;
> >=20
> > to use adjusted_mode again.
>=20
> You changed local variable name from 'mode' to 'm' even through using
> adjusted_mode instead.
>=20
> There would be no any changes if you declared like this, struct
> drm_display_mode *mode =3D adjusted_mode. And seems simple enough and
> meaningful more to use 'mode' variable name. Anyway, that is very
> trivial issue but is there any reason to use 'm' instead of 'mode'?

Yes, because exynos_dsi_mode_set() already have 'mode' as argument:

static void exynos_dsi_mode_set(struct drm_encoder *encoder,           =
                                         =20
                           struct drm_display_mode *mode,              =
                                         =20
                           struct drm_display_mode *adjusted_mode)

Thus I need to define m =3D adjusted_mode

	Gustavo
