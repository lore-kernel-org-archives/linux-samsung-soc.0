From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/6] usb: phy: samsung: Consolidate reference clock rate
 handling
Date: Wed, 27 Mar 2013 15:43:22 +0200
Message-ID: <20130327134322.GL4626@arwen.pp.htv.fi>
References: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
 <1418529.52pdDLWkRZ@amdc1227>
 <20130327133149.GI4626@arwen.pp.htv.fi>
 <3457341.kfl8pm1NLi@amdc1227>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BHMq0+oGliEfCAkH"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:50327 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751142Ab3C0Nn1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 09:43:27 -0400
Content-Disposition: inline
In-Reply-To: <3457341.kfl8pm1NLi@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: balbi@ti.com, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, p.paneri@samsung.com, gautam.vivek@samsung.com, m.szyprowski@samsung.com

--BHMq0+oGliEfCAkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 27, 2013 at 02:39:08PM +0100, Tomasz Figa wrote:
> On Wednesday 27 of March 2013 15:31:49 Felipe Balbi wrote:
> > Hi,
> >=20
> > On Wed, Mar 27, 2013 at 02:26:08PM +0100, Tomasz Figa wrote:
> > > Hi Felipe,
> > >=20
> > > On Wednesday 27 of March 2013 15:19:58 Felipe Balbi wrote:
> > > > Hi,
> > > >=20
> > > > On Tue, Mar 26, 2013 at 03:53:12PM +0100, Tomasz Figa wrote:
> > > > > @@ -307,6 +310,7 @@ static int samsung_usb3phy_remove(struct
> > > > > platform_device *pdev)>
> > > > >=20
> > > > >  static struct samsung_usbphy_drvdata usb3phy_exynos5 =3D {
> > > > > =20
> > > > >  	.cpu_type		=3D TYPE_EXYNOS5250,
> > > > >  	.devphy_en_mask		=3D EXYNOS_USBPHY_ENABLE,
> > > > >=20
> > > > > +	.rate_to_clksel		=3D samsung_usbphy_rate_to_clksel_4x12,
> > > >=20
> > > > why isn't this just a clk_get_rate() ???
> > >=20
> > > As the name suggests, this is a function to get appropriate CLKSEL va=
lue
> > > to
> > > write into PHYCLK register for reference clock rate on particular pla=
tform
> > > (clk_get_rate is used inside to get the rate).
> >=20
> > alright, then you don't need this function pointer at all, look at both
> >=20
> > your rate_to_clksel functions (quoted below):
> > | +int samsung_usbphy_rate_to_clksel_64xx(struct samsung_usbphy *sphy,
> > | +                                                       unsigned long
> > | rate)
> > | +{
> > | +       unsigned int clksel;
> > | +
> > | +       switch (rate) {
> > | +       case 12 * MHZ:
> > | +               clksel =3D PHYCLK_CLKSEL_12M;
>=20
> Please note the PHYCLK_CLKSEL_ prefix here...
>=20
> > | +               break;
> > | +       case 24 * MHZ:
> > | +               clksel =3D PHYCLK_CLKSEL_24M;
> > | +               break;
> > | +       case 48 * MHZ:
> > | +               clksel =3D PHYCLK_CLKSEL_48M;
> > | +               break;
> > | +       default:
> > | +               dev_err(sphy->dev,
> > | +                       "Invalid reference clock frequency: %lu\n", r=
ate);
> > | +               return -EINVAL;
> > | +       }
> > | +
> > | +       return clksel;
> > | +}
> > | +EXPORT_SYMBOL_GPL(samsung_usbphy_rate_to_clksel_64xx);
> > | +
> > | +int samsung_usbphy_rate_to_clksel_4x12(struct samsung_usbphy *sphy,
> > | +                                                       unsigned long
> > | rate)
> > | +{
> > | +       unsigned int clksel;
> > | +
> > | +       switch (rate) {
> > | +       case 9600 * KHZ:
> > | +               clksel =3D FSEL_CLKSEL_9600K;
> > | +               break;
> > | +       case 10 * MHZ:
> > | +               clksel =3D FSEL_CLKSEL_10M;
> > | +               break;
> > | +       case 12 * MHZ:
> > | +               clksel =3D FSEL_CLKSEL_12M;
>=20
> ..and then FSEL_CLKSEL_ here. They have different values. (Their names ar=
e a=20
> bit unfortunate, though...)

indeed, my eyes failed there. So I agree with the patch :-)

sorry for the noise.

--=20
balbi

--BHMq0+oGliEfCAkH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRUvd5AAoJEIaOsuA1yqREH/0P/jT0FyE3jRJ4JR2eo56TSWta
YPT/QrWE0KXlMNX96qfiYbgZnupyoGLBlEotnm0jw7GOTldZ0LmiQCSzNQS+gVem
LLBWtWJ6xM7q4a2uUq9lBmioF/XNRoGue+1Ti1ROUFqqyKtiCCrZkxRIZGYH2dLp
D5VR9m/U0fKKHzE/pyLoAMUjGme6YZA24CVMiK/F391kdkJk7IQrgT/lKRnwvG4X
VRnoz9VKVpJgYiC0i4mRz1T6ty9XV9QC+vKNuNt98E9F71+cYU+3pHFmpe+S456j
Fu6cDFgcHGOGl0r5aJKDH0BlgoyDhzJ2cN2rB+OKePPJhxQdsJrAZ3/gVG39qqFM
6Fq/hVdax76kuLo917NC4pNETm7OLKqlO+mVuyJ27TBr9wwYrHCYmWOowNjMhX6J
r+u+cWss6ndw6yaeLcPEVggQRlGIHP2yt3VxmLQsm5dQJKET+Y3dpMBNvOSUd99w
J81hsiOIeE0+vcEAa320G4NULjTuMorj5ThhkM8CUYfXXrRUN3iGRnPpbKHrppry
qJt7tR5LWvOVn9uiMEqWrgy8QgusYHsU47F2C11gdE6gQHQrgJrVcLhnnqh7s3ve
1mcju66pGTzgJ/QF0OcNCYZAL2R6INK5ovjz8yml8JUmx4nrzvxlpiPgKHwha2Nc
LXhBFixoXxj6VRoi3a1s
=1RJq
-----END PGP SIGNATURE-----

--BHMq0+oGliEfCAkH--
