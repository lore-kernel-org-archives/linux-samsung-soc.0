From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: Exynos5250: Enabling dwc3-exynos driver
Date: Wed, 7 Nov 2012 18:43:22 +0200
Message-ID: <20121107164322.GC12714@arwen.pp.htv.fi>
References: <1352215729-11703-1-git-send-email-gautam.vivek@samsung.com>
 <1352215729-11703-2-git-send-email-gautam.vivek@samsung.com>
 <20121106164304.GD3993@arwen.pp.htv.fi>
 <CAFp+6iGFwTAvhamhoQszBL8QUau64XtDWGR1yX0azbuw1iWgVA@mail.gmail.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iGFwTAvhamhoQszBL8QUau64XtDWGR1yX0azbuw1iWgVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 07, 2012 at 06:55:03PM +0530, Vivek Gautam wrote:
> Hi,
>=20
>=20
> On Tue, Nov 6, 2012 at 10:13 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> > On Tue, Nov 06, 2012 at 08:58:49PM +0530, Vivek Gautam wrote:
> >> Adding DWC3 device tree node for Exynos5250 along with the
> >> device address and clock support needed for the controller.
> >>
> >> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/exynos5250.dtsi       |    6 ++++++
> >>  arch/arm/mach-exynos/clock-exynos5.c    |   24 ++++++++++++++++++++++=
++
> >>  arch/arm/mach-exynos/include/mach/map.h |    1 +
> >>  arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
> >>  drivers/usb/Kconfig                     |    1 +
> >>  5 files changed, 34 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exy=
nos5250.dtsi
> >> index cf6a02d..52bca54 100644
> >> --- a/arch/arm/boot/dts/exynos5250.dtsi
> >> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> >> @@ -68,6 +68,12 @@
> >>               interrupts =3D <0 96 0>;
> >>       };
> >>
> >> +     dwc3 {
> >
> > shouldn't this be usb@12000000 ??
> >
> Kept this in accordance with controller's name, similar to the change
> in following:
> http://www.mail-archive.com/linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg12800.ht=
ml
>=20
> Needs to be changed ?

I'll leave it to DT experts, but I was under the impression that we
should be using generic functionality names (usb, i2c, spi, uart, gpio,
etc) instead of the IP name. IP name is something more for compatible
flag.

Don't take my word for it though :-) DT experts are the ones with final
saying

--=20
balbi

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQmo+qAAoJEIaOsuA1yqRE/j0P/09yh/3wN6/h/wqOeCrJmQsq
F6L1ypz7+FyB+2kt0Wx2faPTNfHYOG3nm9HozLT/VUJ6X6xRKmx0RNnVw5/AEdML
f34rOa9AhbpXzoF+sG4J173ZBPpfnshayXUCTvE3hPiJEohXvsKX4E1dtK/o1gSW
iuDy9dm5UISDNj03WpxqJq9/QmYCMu+rc0nszp6WfxmYpEZ2cI8wyxOF+MR9X5UD
KtEL4ZLsRdcs6ZBtZpytOp4YATkWJV1yYSPiNWdI/XoADSrv1HZPnLROZrz1h2g8
Pz7kmqGU8vkJs4e5BTgg6agcWJ8WUntxeiOV5I8L9Hk7YtBJJrJq3IfdOpCeiqf8
A82iXPnRBHSeI4sFlhggzKrdVqqUeNcIgbpr+LrSTxonNr5w1pfV3NcicnGpCYU6
/rKZdSchWiyMRyU7Yb5oknlbRohbgpm0tb5kK4zopOeUb5/gPZMO7Xtpvq+YlPw9
v6NfyIXNwCQ51PC1OrnyjUPc2xDq/mCHCwhRvPybwPhZaXrSN2RS9psJTIMj5hXr
52b2lDMCvrL5jkdwTtZ5Y4BOVQWiDCfZ5G3sgAgY9YLrTvhGEssYDJFzyyMjFgbw
wnhLh41aF073ULMwB9kIhpG3gIOOnF5eJF+stvYekeW22xMYfzQ+nEn0hJLPaPU4
7duVZsOsil+wSGeBOcN5
=YOGI
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
