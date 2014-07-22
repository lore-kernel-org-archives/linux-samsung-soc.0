From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH V5 12/12] drm/exynos: Add ps8622 lvds bridge
 discovery to DP driver
Date: Tue, 22 Jul 2014 09:51:37 +0200
Message-ID: <20140722075136.GD18258@ulmo>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-13-git-send-email-ajaykumar.rs@samsung.com>
 <20140721071028.GB8843@ulmo>
 <CAEC9eQPkzrpQn41+zu8mwJUctSd0CF_U4UCdff0F7VYq2oWthw@mail.gmail.com>
 <20140721125424.GD15238@ulmo>
 <CAEC9eQODqv=vkWhxnSVC4fFcfn1pHAmXzMZowayBbgKPjdppzw@mail.gmail.com>
 <20140721144427.GA28336@ulmo>
 <CAEC9eQOTtFPx-tK8Loo=V1LxSm0i5zwmdCv8khRQr7pYZEiF3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0578150846=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQOTtFPx-tK8Loo=V1LxSm0i5zwmdCv8khRQr7pYZEiF3A@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@dowhile0.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0578150846==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2014 at 11:35:52AM +0530, Ajay kumar wrote:
> On Mon, Jul 21, 2014 at 8:14 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Mon, Jul 21, 2014 at 08:06:01PM +0530, Ajay kumar wrote:
> >> Hi Thierry,
> >>
> >> On Mon, Jul 21, 2014 at 6:24 PM, Thierry Reding
> >> <thierry.reding@gmail.com> wrote:
> >> > On Mon, Jul 21, 2014 at 04:58:25PM +0530, Ajay kumar wrote:
> >> >> On Mon, Jul 21, 2014 at 12:40 PM, Thierry Reding
> >> >> <thierry.reding@gmail.com> wrote:
> >> >> > On Fri, Jul 18, 2014 at 02:13:58AM +0530, Ajay Kumar wrote:
> >> >> >> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> >> >> >>
> >> >> >> This patch adds ps8622 lvds bridge discovery code to the dp driv=
er.
> >> >> >>
> >> >> >> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> >> >> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> >> >> ---
> >> >> >>  drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
> >> >> >>  1 file changed, 5 insertions(+)
> >> >> >>
> >> >> >> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/g=
pu/drm/exynos/exynos_dp_core.c
> >> >> >> index 0ca6256..82e2942 100644
> >> >> >> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> >> >> >> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> >> >> >> @@ -31,6 +31,7 @@
> >> >> >>  #include <drm/drm_panel.h>
> >> >> >>  #include <drm/bridge/ptn3460.h>
> >> >> >>  #include <drm/bridge/panel_binder.h>
> >> >> >> +#include <drm/bridge/ps8622.h>
> >> >> >>
> >> >> >>  #include "exynos_drm_drv.h"
> >> >> >>  #include "exynos_dp_core.h"
> >> >> >> @@ -999,6 +1000,10 @@ static int exynos_drm_attach_lcd_bridge(st=
ruct exynos_dp_device *dp,
> >> >> >>       if (find_bridge("nxp,ptn3460", &bridge)) {
> >> >> >>               bridge_chain =3D ptn3460_init(dp->drm_dev, encoder=
, bridge.client,
> >> >> >>                                                               br=
idge.node);
> >> >> >> +     } else if (find_bridge("parade,ps8622", &bridge) ||
> >> >> >> +                             find_bridge("parade,ps8625", &brid=
ge)) {
> >> >> >> +             bridge_chain =3D ps8622_init(dp->drm_dev, encoder,=
 bridge.client,
> >> >> >> +                                                             br=
idge.node);
> >> >> >>       }
> >> >> >
> >> >> > We really ought to be adding some sort of registry at some point.
> >> >> > Otherwise every driver that wants to use bridges needs to come up=
 with a
> >> >> > similar set of helpers to instantiate them.
> >> >> >
> >> >> > Also you're making this driver depend on (now) two bridges, where=
as it
> >> >> > really shouldn't matter which exact types it supports. Bridges sh=
ould be
> >> >> > exposed via a generic interface.
> >> >>
> >> >> How about moving out the find_bridge() function into a common heade=
r file,
> >> >> and also supporting the list of bridge_init declarations in the sam=
e file?
> >> >>
> >> >> We get bridge chip node from phandle, and then pass the same node
> >> >> to find_bridge() which searches the list using of_device_is_compati=
ble()
> >> >> to call the appropriate bridge_init function?
> >> >
> >> > That could work, but it's still somewhat unusual and shouldn't be
> >> > required. I think we'd be better of with some sort of registry like =
we
> >> > have for panels. That would mean that a driver that wants to use a
> >> > bridge would do something like this:
> >> >
> >> >         struct drm_bridge *bridge;
> >> >         struct device_node *np;
> >> >
> >> >         np =3D of_parse_phandle(dev->of_node, "bridge", 0);
> >> >         if (np) {
> >> >                 bridge =3D of_drm_find_bridge(np);
> >> >                 of_node_put(np);
> >> >
> >> >                 if (!bridge)
> >> >                         return -EPROBE_DEFER;
> >> >         }
> >> >
> >> > An alternative way would be to add a non-OF wrapper around this, like
> >> > this for example:
> >> Let me try the DT version first :)
> >>
> >> >         bridge =3D drm_bridge_get(dev, NULL);
> >> >
> >> > Which would be conceptually the same as clk_get() or regulator_get()=
 and
> >> > could be easily extended to support non-DT setups as well.
> >> >
> >> > As for bridge drivers I think we may have to rework things a little,=
 so
> >> > that a driver can call some sequence like this:
> >> >
> >> >         struct foo_bridge {
> >> >                 struct drm_bridge base;
> >> >                 ...
> >> >         };
> >> >
> >> >         static const struct drm_bridge_funcs foo_bridge_funcs =3D {
> >> >                 ...
> >> >         };
> >> >
> >> >         static int foo_probe(...)
> >> >         {
> >> >                 struct foo_bridge *bridge;
> >> >                 int err;
> >> >
> >> >                 bridge =3D devm_kzalloc(dev, sizeof(*bridge), GFP_KE=
RNEL);
> >> >                 if (!bridge)
> >> >                         return -ENOMEM;
> >> >
> >> >                 /* setup bridge (return -EPROBE_DEFER if necessary, =
=2E..) */
> >> >
> >> >                 /* register bridge with DRM */
> >> >                 drm_bridge_init(&bridge->base);
> >> >                 bridge->base.dev =3D dev;
> >> >                 bridge->base.funcs =3D &foo_bridge_funcs;
> >> >
> >> >                 err =3D drm_bridge_add(&bridge->base);
> >> >                 if (err < 0)
> >> >                         return err;
> >> >
> >> >                 dev_set_drvdata(dev, bridge);
> >> >                 ...
> >> >         }
> >> >
> >> > drm_bridge_add() would add the bridge to a global list of bridge dev=
ices
> >> > which drm_bridge_get()/of_drm_find_bridge() can use to find the one =
that
> >> > it needs. The above has the big advantage that it'sdev->mode_config.=
bridge_list completely
> >> > independent of the underlying bus that the bridge is on. It could be=
 I2C
> >> > or SPI, platform device or PCI device.
> >> >
> >> > Thierry
> >> Ok. This is all about making the bridge driver confine to the driver m=
odel.
> >> But, I would need a drm_device pointer to register the bridge to DRM c=
ore.
> >> How do I get it?
> >
> > Once you've obtained a reference to the DRM bridge from your driver you
> > should carry it around until you've set up the DRM device. Then you can
> > hook it up, which possibly requires a new function (since it's what the
> > drm_bridge_init() used to do).
>=20
> Ok. We can have 2 parts:
>=20
> Non-DRM part:
> In order to get a reference for drm_bridge in my encoder driver, I
> should be using
> of_drm_find_bridge(). In order to do that, I should have already added
> the bridge
> into a static list of bridges(using something like drm_bridge_add).
> Also, bridge_funcs pointer is assigned to the bridge object in the
> bridge driver itself.
>=20
> DRM part:
> Assuming that the bridge driver probe will take care of calling
> drm_bridge_add(),
> I can then call drm_bridge_init from encoder driver, with a drm_bridge po=
inter
> and a drm_device pointer, which will actually register the bridge into DR=
M core.

Yes, exactly.

Thierry

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzhgIAAoJEN0jrNd/PrOhipYP/3IBxAqMogmo1QNUEtnyYvHH
MhOz5/1uKmOpEcTpczuDclb9X+2Ph3UFox16JnLmeYcXS/+PMaE/IYdwmqxmLO0w
tEOgBR/CkUZY5k6mbrmEgQms1KDfj/zsf5pdLHNT2Mw6Rzs+uwEL+DDOWD82He2t
axaW/uPv9EWsB8c1glKwOgIKk1yOjm5FIClQ9B2hhV8VunjTZB7g5iam6z/bn6xw
b4CpJNITIGxq2GUkhZL4NKfH4R6GudVRuaBvQuPRkC43nUC3A94IprGvQrVCPgmI
Z//UMOsD0Mq4sS1ssHz38uJ2+Sj+d6RoiytP0C+HXsTL09DRQbWDEpf8WMcb5Unf
i0xI+DFCPmZhlbdD5Gar7tuL6EgPHdWPTYLGn61SNMIfVh+Z9kypVbNCuTIt0C61
q8rETOEmsyx0IFC4cpWZpZ/OD2by+V89Tx/heX8/1Q8dzG5rybxQl7tPxNtBpcjZ
earnR1YUkShjJhv4nAZwRj4/DfS7oSKcUEgoVVvw4ueJicjcjqbeQKpfufQhwlET
ca8+57vFRe8D8q/c7PuxrrBfPI87MB+JOB7AbDYirRUcZQjwMMoaDzd/q2tXajcr
o1T2OvIJdTZmsXpiNNPldYbwFLo4Rty0bkdRcVdb7ekW337zhSLcXPLC+zCUwndp
gIiq0rnlQDoAzaPLjVHH
=gmoe
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--

--===============0578150846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0578150846==--
