From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support
 driver model
Date: Mon, 22 Sep 2014 09:40:38 +0200
Message-ID: <20140922074037.GA1470@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <2567411.1uGei9I2NP@avalon>
 <CAEC9eQMYTELvK_0bcrs+wNk=qYXzS69bOqYGr-yLf6h18bfM4Q@mail.gmail.com>
 <3764548.s4ysdtHE5z@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:46306 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073AbaIVHkm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 03:40:42 -0400
Content-Disposition: inline
In-Reply-To: <3764548.s4ysdtHE5z@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Sean Cross <xobs@kosagi.com>


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2014 at 12:27:13PM +0300, Laurent Pinchart wrote:
> Hi Ajay,
>=20
> On Wednesday 17 September 2014 14:37:30 Ajay kumar wrote:
> > On Mon, Sep 15, 2014 at 11:07 PM, Laurent Pinchart wrote:
> > > Hi Ajay,
> > >=20
> > > Thank you for the patch.
> > >=20
> > > I think we're moving in the right direction, but we're not there yet.
> > >=20
> > > On Saturday 26 July 2014 00:52:08 Ajay Kumar wrote:
> > >> This patch tries to seperate drm_bridge implementation
> > >> into 2 parts, a drm part and a non_drm part.
> > >>=20
> > >> A set of helper functions are defined in this patch to make
> > >> bridge driver probe independent of the drm flow.
> > >>=20
> > >> The bridge devices register themselves on a lookup table
> > >> when they get probed by calling "drm_bridge_add_for_lookup".
> > >>=20
> > >> The parent encoder driver waits till the bridge is available in the
> > >> lookup table(by calling "of_drm_find_bridge") and then continues with
> > >> its initialization.
> > >=20
> > > Before the introduction of the component framework I would have said =
this
> > > is the way to go. Now, I think bridges should register themselves as
> > > components, and the DRM master driver should use the component framew=
ork
> > > to get a reference to the bridges it needs.
> >=20
> > Well, I have modified the bridge framework exactly the way Thierry want=
ed it
> > to be, I mean the same way the current panel framework is.
> > And, I don't think there is a problem with that.
> > What problem are you facing with current bridge implementation?
> > What is the advantage of using the component framework to register brid=
ges?
>=20
> There are several advantages.
>=20
> - The component framework has been designed with this exact problem in mi=
nd,=20
> piecing multiple components into a display device.

No. Component framework was designed with multi-device drivers in mind.
That is, drivers that need to combine two or more platform devices into
a single logical device. Typically that includes display controllers and
encoders (in various looks) for DRM.

Panels and bridges are in my opinion different because they are outside
of the DRM driver. They aren't part of the device complex that an SoC
provides. They represent hardware that is external to the SoC and the
DRM driver and can be shared across SoCs.

Forcing panels and bridges to register as components will require all
drivers to implement master/component support solely for accessing this
external hardware.

What you're suggesting is like saying that clocks or regulators should
register as components so that their users can get them that way. In
fact by that argument everything that's referenced by phandle would need
to register as component (PHYs, LEDs, GPIOs, I2C controllers, ...).

> This patch set introduces=20
> yet another framework, without any compelling reason as far as I can see.=
=20
> Today DRM drivers already need to use three different frameworks (compone=
nt,=20
> I2C slave encoder and panel), and we're adding a fourth one to make the m=
ess=20
> even messier.

Panel and bridge aren't really frameworks. Rather they are a simple
registry to allow drivers to register panels and bridges and display
drivers to look them up.

> This is really a headlong rush, we need to stop and fix the  design mista=
kes.

Can you point out specific design mistakes? I don't see any, but I'm
obviously biased.

> - The component framework solves the probe ordering problem. Bridges can =
use=20
> deferred probing, but when a bridge requires a resources (such as a clock=
 for=20
> instance) provided by the display controller, this will break.

Panel and bridges can support deferred probing without the component
framework just fine.

> > Without this patchset, you cannot bring an X server
> > based display on snow and peach_pit. Also, day by day the number of
> > platforms using drm_bridge is increasing.
>=20
> That's exactly why I'd like to use the component framework now, as the=20
> conversion will become more complex as time goes by.

No it won't. If we ever do decide that component framework is a better
fit then the conversion may be more work but it would still be largely
mechanical.

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUH9J1AAoJEN0jrNd/PrOhbU4QALbMU2XPvdleKvT5lHXY5ZwM
nrrAJ3ZnQPX9/Hj4pY6rsmU5L25cZQf1hSKQVnkgd8mWDIfo9NqFlrY0X+S7H341
1VfAYy3Vy2WqePzAbnaHUKi8w73uFQ9JpSsZ0Dt32Pn783aF2jvscN2E2JvuUmyZ
ZhET6CeTOlcWzGWmEXpssn5D+bn5kppX+mNzleuQKnfAArff7NgqjpiSEoxIWgjh
x2zSJWPSAgzwMWdiTks6hGZIpwK2/AmmqF593I0LpqMUumevkXnA+WE2htN8dsIZ
VDNs0kpsGeLbEEcxEq/nD9aZrV5r5yYPj8LV0SMud4ls+ZzZOovRjiuVATbnVzMh
cCJHRTiOSJAW265yZUxNOfPLMmld9FkZpieZeTHRDcHLQuXtYi0uHZsM/fqja3nF
uWNzDvRT/T/pN27qwadhEABGrK2V0VKFsacT6MONpvT0Lu2f5hrWYlt71ZKf95bJ
Vmp+bGQewkZUrcxUgTZL3OsmWYth0pB73Qo2qbp+dYAz14GjrUecbYCrmQIsh72I
LAtHfslVNuxGmH519wNyov6P8DBTejoDq9HjsMgyizLJgIyK8EXqi91+i6hlvHXy
KBKK02ngemlUIPxO3jStcunkHS5tC1MhXTMCWJipFkw/XUvQCoD7ZHmfZHzWCBZM
+2QCVvKVklnIv61yipGE
=swoG
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
