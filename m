From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support driver model
Date: Tue, 23 Sep 2014 03:29:13 +0300
Message-ID: <3478703.M4FqhaqXMa@avalon>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com> <3764548.s4ysdtHE5z@avalon> <20140922074037.GA1470@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart15343923.Pt2zlWJ9ll"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:43892 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751619AbaIWA3Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Sep 2014 20:29:16 -0400
In-Reply-To: <20140922074037.GA1470@ulmo>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ajay kumar <ajaynumb@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Sean Cross <xobs@kosagi.com>


--nextPart15343923.Pt2zlWJ9ll
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Thierry,

On Monday 22 September 2014 09:40:38 Thierry Reding wrote:
> On Wed, Sep 17, 2014 at 12:27:13PM +0300, Laurent Pinchart wrote:
> > On Wednesday 17 September 2014 14:37:30 Ajay kumar wrote:
> > > On Mon, Sep 15, 2014 at 11:07 PM, Laurent Pinchart wrote:
> > > > Hi Ajay,
> > > >=20
> > > > Thank you for the patch.
> > > >=20
> > > > I think we're moving in the right direction, but we're not ther=
e yet.
> > > >=20
> > > > On Saturday 26 July 2014 00:52:08 Ajay Kumar wrote:
> > > >> This patch tries to seperate drm_bridge implementation
> > > >> into 2 parts, a drm part and a non_drm part.
> > > >>=20
> > > >> A set of helper functions are defined in this patch to make
> > > >> bridge driver probe independent of the drm flow.
> > > >>=20
> > > >> The bridge devices register themselves on a lookup table
> > > >> when they get probed by calling "drm_bridge_add_for_lookup".
> > > >>=20
> > > >> The parent encoder driver waits till the bridge is available i=
n the
> > > >> lookup table(by calling "of_drm_find_bridge") and then continu=
es with
> > > >> its initialization.
> > > >=20
> > > > Before the introduction of the component framework I would have=
 said
> > > > this is the way to go. Now, I think bridges should register the=
mselves
> > > > as components, and the DRM master driver should use the compone=
nt
> > > > framework to get a reference to the bridges it needs.
> > >=20
> > > Well, I have modified the bridge framework exactly the way Thierr=
y
> > > wanted it to be, I mean the same way the current panel framework =
is.
> > > And, I don't think there is a problem with that.
> > > What problem are you facing with current bridge implementation?
> > > What is the advantage of using the component framework to registe=
r
> > > bridges?
> >=20
> > There are several advantages.
> >=20
> > - The component framework has been designed with this exact problem=
 in
> > mind, piecing multiple components into a display device.
>=20
> No. Component framework was designed with multi-device drivers in min=
d.
> That is, drivers that need to combine two or more platform devices in=
to
> a single logical device. Typically that includes display controllers =
and
> encoders (in various looks) for DRM.

I disagree. AFAIK the component framework was designed to easily combin=
e=20
multiple devices into a single logical device, regardless of which bus =
each=20
device is connected to. That's what makes the component framework usefu=
l : it=20
allows master drivers to build logical devices from heterogeneous compo=
nents=20
without having to use one API per bus and/or component type. If the onl=
y goal=20
had been to combine platform devices on an SoC, simpler device-specific=
=20
solutions would likely have been used instead.

> Panels and bridges are in my opinion different because they are outsi=
de
> of the DRM driver. They aren't part of the device complex that an SoC=

> provides. They represent hardware that is external to the SoC and the=

> DRM driver and can be shared across SoCs.

They represent hardware external to the SoC, but internal to the logica=
l DRM=20
device.

> Forcing panels and bridges to register as components will require all=

> drivers to implement master/component support solely for accessing th=
is
> external hardware.
>=20
> What you're suggesting is like saying that clocks or regulators shoul=
d
> register as components so that their users can get them that way. In
> fact by that argument everything that's referenced by phandle would n=
eed
> to register as component (PHYs, LEDs, GPIOs, I2C controllers, ...).

No, that's very different. The device you list are clearly external res=
ources,=20
while the bridges and panels are components part of a logical display d=
evice.

> > This patch set introduces yet another framework, without any compel=
ling
> > reason as far as I can see. Today DRM drivers already need to use t=
hree
> > different frameworks (component, I2C slave encoder and panel), and =
we're
> > adding a fourth oneto make the mess even messier.
>=20
> Panel and bridge aren't really frameworks. Rather they are a simple
> registry to allow drivers to register panels and bridges and display
> drivers to look them up.

Regardless of how you call them, we have three interfaces.

> > This is really a headlong rush, we need to stop and fix the  design=

> > mistakes.
>
> Can you point out specific design mistakes? I don't see any, but I'm
> obviously biased.

The slave encoder / bridge split is what I consider a design mistake. T=
hose=20
two interfaces serve the same purpose, they should really be merged.

> > - The component framework solves the probe ordering problem. Bridge=
s can
> > use deferred probing, but when a bridge requires a resources (such =
as a
> > clock for instance) provided by the display controller, this will b=
reak.
>=20
> Panel and bridges can support deferred probing without the component
> framework just fine.

Not if the bridge requires a clock provided by the display controller, =
in=20
which case there's a dependency loop.

> > > Without this patchset, you cannot bring an X server based display=
 on
> > > snow and peach_pit. Also, day by day the number of platforms usin=
g
> > > drm_bridge is increasing.
> >=20
> > That's exactly why I'd like to use the component framework now, as =
the
> > conversion will become more complex as time goes by.
>=20
> No it won't. If we ever do decide that component framework is a bette=
r
> fit then the conversion may be more work but it would still be largel=
y
> mechanical.

Are you volunteering to perform the conversion ? :-)

=2D-=20
Regards,

Laurent Pinchart

--nextPart15343923.Pt2zlWJ9ll
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABAgAGBQJUIL7ZAAoJEIkPb2GL7hl1Y10IAIHgZ3pe5TJnn0nedqDD6WTN
8JdqGWYSwx4gLT52kPcis8zEP+e33qQ6SXeg2svxQqmGlt0PkM4YKsCLo0s1b2sX
TZFGbsZfTYjHVq51JVjFmA6PBk+8uUluVOnelsFhCm5El41ob69id8HKXy9UkxC+
JdfnnaAcVAp5xFDHnMkxOXG+Cn5vxLHBr0TM5F95kYMlymbtKGUHTNJ8mlDEOfWs
s/dLca9LErUyGRTvbIxaHQiG6dgEYv53Nr2KeyVw0Cdsa9SA4du3m2uIXwvQjZ4X
u3qURiVz0fk9z/anG/ww8BEQke5fs1Bem1m8wqQQtR/gRxkCm7ZNLLm00L1aP0A=
=1q2G
-----END PGP SIGNATURE-----

--nextPart15343923.Pt2zlWJ9ll--
