From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH V5 12/12] drm/exynos: Add ps8622 lvds bridge
 discovery to DP driver
Date: Mon, 21 Jul 2014 14:54:25 +0200
Message-ID: <20140721125424.GD15238@ulmo>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-13-git-send-email-ajaykumar.rs@samsung.com>
 <20140721071028.GB8843@ulmo>
 <CAEC9eQPkzrpQn41+zu8mwJUctSd0CF_U4UCdff0F7VYq2oWthw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:51276 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754580AbaGUMy3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jul 2014 08:54:29 -0400
Received: by mail-wi0-f180.google.com with SMTP id n3so4015703wiv.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2014 05:54:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAEC9eQPkzrpQn41+zu8mwJUctSd0CF_U4UCdff0F7VYq2oWthw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Rahul Sharma <rahul.sharma@samsung.com>


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 04:58:25PM +0530, Ajay kumar wrote:
> On Mon, Jul 21, 2014 at 12:40 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Fri, Jul 18, 2014 at 02:13:58AM +0530, Ajay Kumar wrote:
> >> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> >>
> >> This patch adds ps8622 lvds bridge discovery code to the dp driver.
> >>
> >> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> ---
> >>  drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm=
/exynos/exynos_dp_core.c
> >> index 0ca6256..82e2942 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> >> @@ -31,6 +31,7 @@
> >>  #include <drm/drm_panel.h>
> >>  #include <drm/bridge/ptn3460.h>
> >>  #include <drm/bridge/panel_binder.h>
> >> +#include <drm/bridge/ps8622.h>
> >>
> >>  #include "exynos_drm_drv.h"
> >>  #include "exynos_dp_core.h"
> >> @@ -999,6 +1000,10 @@ static int exynos_drm_attach_lcd_bridge(struct e=
xynos_dp_device *dp,
> >>       if (find_bridge("nxp,ptn3460", &bridge)) {
> >>               bridge_chain =3D ptn3460_init(dp->drm_dev, encoder, brid=
ge.client,
> >>                                                               bridge.n=
ode);
> >> +     } else if (find_bridge("parade,ps8622", &bridge) ||
> >> +                             find_bridge("parade,ps8625", &bridge)) {
> >> +             bridge_chain =3D ps8622_init(dp->drm_dev, encoder, bridg=
e.client,
> >> +                                                             bridge.n=
ode);
> >>       }
> >
> > We really ought to be adding some sort of registry at some point.
> > Otherwise every driver that wants to use bridges needs to come up with a
> > similar set of helpers to instantiate them.
> >
> > Also you're making this driver depend on (now) two bridges, whereas it
> > really shouldn't matter which exact types it supports. Bridges should be
> > exposed via a generic interface.
>=20
> How about moving out the find_bridge() function into a common header file,
> and also supporting the list of bridge_init declarations in the same file?
>=20
> We get bridge chip node from phandle, and then pass the same node
> to find_bridge() which searches the list using of_device_is_compatible()
> to call the appropriate bridge_init function?

That could work, but it's still somewhat unusual and shouldn't be
required. I think we'd be better of with some sort of registry like we
have for panels. That would mean that a driver that wants to use a
bridge would do something like this:

	struct drm_bridge *bridge;
	struct device_node *np;

	np =3D of_parse_phandle(dev->of_node, "bridge", 0);
	if (np) {
		bridge =3D of_drm_find_bridge(np);
		of_node_put(np);

		if (!bridge)
			return -EPROBE_DEFER;
	}

An alternative way would be to add a non-OF wrapper around this, like
this for example:

	bridge =3D drm_bridge_get(dev, NULL);

Which would be conceptually the same as clk_get() or regulator_get() and
could be easily extended to support non-DT setups as well.

As for bridge drivers I think we may have to rework things a little, so
that a driver can call some sequence like this:

	struct foo_bridge {
		struct drm_bridge base;
		...
	};

	static const struct drm_bridge_funcs foo_bridge_funcs =3D {
		...
	};

	static int foo_probe(...)
	{
		struct foo_bridge *bridge;
		int err;

		bridge =3D devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
		if (!bridge)
			return -ENOMEM;

		/* setup bridge (return -EPROBE_DEFER if necessary, ...) */

		/* register bridge with DRM */
		drm_bridge_init(&bridge->base);
		bridge->base.dev =3D dev;
		bridge->base.funcs =3D &foo_bridge_funcs;

		err =3D drm_bridge_add(&bridge->base);
		if (err < 0)
			return err;

		dev_set_drvdata(dev, bridge);
		...
	}

drm_bridge_add() would add the bridge to a global list of bridge devices
which drm_bridge_get()/of_drm_find_bridge() can use to find the one that
it needs. The above has the big advantage that it's completely
independent of the underlying bus that the bridge is on. It could be I2C
or SPI, platform device or PCI device.

Thierry

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzQ2AAAoJEN0jrNd/PrOhnMUQAIre6jFB6sIbZwWNBJnmaaFs
CKt9Sup5sYZituSYnvoukov4+suCN7HLPRVAKb045tZwB5v5/GOzzkgNIBIpp3Wp
ZEVjTHyks7aMPbiOtBedUBXN6x9TsYj1/kpLsDBS810ifHs2em5djclB1v2xHAWT
NKeXd1RoJW5Cy4CO91wYyR0UAcxlH4NMkzLUVJxfq46PP3rTX2bfmGedOwtYHrPa
GLWbgdv3b7L4I44CnJkCicIvCxZTFAthrzSv5ZFAgNUMkHkM2xPViwj6C/Gh161U
RiMUpwh8lf8xUSlCTlqjo8Lvz/bCui6XSPQLxtrrNSY5emK9GH46ivqZDSTjffRH
Rff7dlAW7z2Bl2VciqKZxkiVExGzsh/iNwXfDNzticxY9NY0ASteRvFynwKdQduO
kUmmRE3vRIcTEykfWcRSHRbnWyL0JxWXGd5AJrNdekqpObcyBGlCKKggQsHaoerw
yzu2GH36uf09e8GBp/fZ6gmyeDnwHUnmmYXRbZH6yBioQY0TAS7DGy7Ut6e+Q8QK
x4ce8UwrogTaFw8Ku0BA9pqHAWApeg6eO691Yxn7MJ4fipKHGSLybf8mpGQPIixT
Y/eOs4Cu8C5+m3kKa5JfbqvLymgMWGf51fhDKI8J0r+NWjI7jT2RerYKpdwdVEFt
GdtleGMpzG0XwnUt0eYa
=eX7i
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
