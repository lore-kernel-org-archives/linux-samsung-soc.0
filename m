From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH V5 12/12] drm/exynos: Add ps8622 lvds bridge
 discovery to DP driver
Date: Mon, 21 Jul 2014 16:44:28 +0200
Message-ID: <20140721144427.GA28336@ulmo>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-13-git-send-email-ajaykumar.rs@samsung.com>
 <20140721071028.GB8843@ulmo>
 <CAEC9eQPkzrpQn41+zu8mwJUctSd0CF_U4UCdff0F7VYq2oWthw@mail.gmail.com>
 <20140721125424.GD15238@ulmo>
 <CAEC9eQODqv=vkWhxnSVC4fFcfn1pHAmXzMZowayBbgKPjdppzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2027931073=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQODqv=vkWhxnSVC4fFcfn1pHAmXzMZowayBbgKPjdppzw@mail.gmail.com>
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


--===============2027931073==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 08:06:01PM +0530, Ajay kumar wrote:
> Hi Thierry,
>=20
> On Mon, Jul 21, 2014 at 6:24 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Mon, Jul 21, 2014 at 04:58:25PM +0530, Ajay kumar wrote:
> >> On Mon, Jul 21, 2014 at 12:40 PM, Thierry Reding
> >> <thierry.reding@gmail.com> wrote:
> >> > On Fri, Jul 18, 2014 at 02:13:58AM +0530, Ajay Kumar wrote:
> >> >> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> >> >>
> >> >> This patch adds ps8622 lvds bridge discovery code to the dp driver.
> >> >>
> >> >> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> >> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> >> ---
> >> >>  drivers/gpu/drm/exynos/exynos_dp_core.c |    5 +++++
> >> >>  1 file changed, 5 insertions(+)
> >> >>
> >> >> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/=
drm/exynos/exynos_dp_core.c
> >> >> index 0ca6256..82e2942 100644
> >> >> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> >> >> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> >> >> @@ -31,6 +31,7 @@
> >> >>  #include <drm/drm_panel.h>
> >> >>  #include <drm/bridge/ptn3460.h>
> >> >>  #include <drm/bridge/panel_binder.h>
> >> >> +#include <drm/bridge/ps8622.h>
> >> >>
> >> >>  #include "exynos_drm_drv.h"
> >> >>  #include "exynos_dp_core.h"
> >> >> @@ -999,6 +1000,10 @@ static int exynos_drm_attach_lcd_bridge(struc=
t exynos_dp_device *dp,
> >> >>       if (find_bridge("nxp,ptn3460", &bridge)) {
> >> >>               bridge_chain =3D ptn3460_init(dp->drm_dev, encoder, b=
ridge.client,
> >> >>                                                               bridg=
e.node);
> >> >> +     } else if (find_bridge("parade,ps8622", &bridge) ||
> >> >> +                             find_bridge("parade,ps8625", &bridge)=
) {
> >> >> +             bridge_chain =3D ps8622_init(dp->drm_dev, encoder, br=
idge.client,
> >> >> +                                                             bridg=
e.node);
> >> >>       }
> >> >
> >> > We really ought to be adding some sort of registry at some point.
> >> > Otherwise every driver that wants to use bridges needs to come up wi=
th a
> >> > similar set of helpers to instantiate them.
> >> >
> >> > Also you're making this driver depend on (now) two bridges, whereas =
it
> >> > really shouldn't matter which exact types it supports. Bridges shoul=
d be
> >> > exposed via a generic interface.
> >>
> >> How about moving out the find_bridge() function into a common header f=
ile,
> >> and also supporting the list of bridge_init declarations in the same f=
ile?
> >>
> >> We get bridge chip node from phandle, and then pass the same node
> >> to find_bridge() which searches the list using of_device_is_compatible=
()
> >> to call the appropriate bridge_init function?
> >
> > That could work, but it's still somewhat unusual and shouldn't be
> > required. I think we'd be better of with some sort of registry like we
> > have for panels. That would mean that a driver that wants to use a
> > bridge would do something like this:
> >
> >         struct drm_bridge *bridge;
> >         struct device_node *np;
> >
> >         np =3D of_parse_phandle(dev->of_node, "bridge", 0);
> >         if (np) {
> >                 bridge =3D of_drm_find_bridge(np);
> >                 of_node_put(np);
> >
> >                 if (!bridge)
> >                         return -EPROBE_DEFER;
> >         }
> >
> > An alternative way would be to add a non-OF wrapper around this, like
> > this for example:
> Let me try the DT version first :)
>=20
> >         bridge =3D drm_bridge_get(dev, NULL);
> >
> > Which would be conceptually the same as clk_get() or regulator_get() and
> > could be easily extended to support non-DT setups as well.
> >
> > As for bridge drivers I think we may have to rework things a little, so
> > that a driver can call some sequence like this:
> >
> >         struct foo_bridge {
> >                 struct drm_bridge base;
> >                 ...
> >         };
> >
> >         static const struct drm_bridge_funcs foo_bridge_funcs =3D {
> >                 ...
> >         };
> >
> >         static int foo_probe(...)
> >         {
> >                 struct foo_bridge *bridge;
> >                 int err;
> >
> >                 bridge =3D devm_kzalloc(dev, sizeof(*bridge), GFP_KERNE=
L);
> >                 if (!bridge)
> >                         return -ENOMEM;
> >
> >                 /* setup bridge (return -EPROBE_DEFER if necessary, ...=
) */
> >
> >                 /* register bridge with DRM */
> >                 drm_bridge_init(&bridge->base);
> >                 bridge->base.dev =3D dev;
> >                 bridge->base.funcs =3D &foo_bridge_funcs;
> >
> >                 err =3D drm_bridge_add(&bridge->base);
> >                 if (err < 0)
> >                         return err;
> >
> >                 dev_set_drvdata(dev, bridge);
> >                 ...
> >         }
> >
> > drm_bridge_add() would add the bridge to a global list of bridge devices
> > which drm_bridge_get()/of_drm_find_bridge() can use to find the one that
> > it needs. The above has the big advantage that it'sdev->mode_config.bri=
dge_list completely
> > independent of the underlying bus that the bridge is on. It could be I2C
> > or SPI, platform device or PCI device.
> >
> > Thierry
> Ok. This is all about making the bridge driver confine to the driver mode=
l.
> But, I would need a drm_device pointer to register the bridge to DRM core.
> How do I get it?

Once you've obtained a reference to the DRM bridge from your driver you
should carry it around until you've set up the DRM device. Then you can
hook it up, which possibly requires a new function (since it's what the
drm_bridge_init() used to do).

Thierry

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzSdLAAoJEN0jrNd/PrOhBpkP/A5L6vIod+WyT67vqSac30cr
DU0J4BlZD3bs0YMC7QkjGx0dOVwwA3bdzSrGpCq8DExOwT/1hIeH5eUx5rYgFotD
S0JEkMQZsdoScvG/4ZQfYq4tp0RS6fWp7Y1Rf6wjfuzophBkelBTPPZNk69xwZl7
nTsUR3Yx3UxDnfu5XYPaBCOdDe7AbLldz//8vY50dM3pV90APwIx7tnyFBhlJeJN
HJGNKUUasuycOeJ2gsRg8ObufVy1GZ8Ja+WkPAyybQvv1ZlZJhVOEALj+kjp7E8K
rAFoci/TThJFZz91EPe5F/Vrr/ljeajLSCBEDGmH619+bDz+mspET51CG9XoP5+r
AbMBYomzOOfg68x0SlbsSRjo0E6uZa0RtL3SmN22ODoOIqNblZ52ND6nQu77b/as
vxGYb9Fhinqlh6jydl2/cIdDFsc9293BcpsT5Tq5s474YKgjJOUQE5ZilIMwooH9
VcGQO/EM5i0n5YHDalLdWcB43XbGnL+0Is0EIJTdhihb4Yv2EQHBmzOs6mXVodJw
Glml6Y4qnjcOleYe8hBW1cVQf72w4oeZFDTZONtvz0cJtLusLLjOJEGTXY9hoaCx
jJvhh8Vi/WuFEawsXlKPOVlZlDuPIYd7PnhReheNKGCrJ4NWWVketj1eTehk0YOk
Hou5k2A4cmZin0MQ1no3
=5W44
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============2027931073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2027931073==--
