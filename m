From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 3/6] usb: phy: samsung: Consolidate reference clock rate
 handling
Date: Wed, 27 Mar 2013 15:31:49 +0200
Message-ID: <20130327133149.GI4626@arwen.pp.htv.fi>
References: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
 <1364309595-16102-4-git-send-email-t.figa@samsung.com>
 <20130327131958.GH4626@arwen.pp.htv.fi>
 <1418529.52pdDLWkRZ@amdc1227>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/D3X8sky0X3AmG5"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418529.52pdDLWkRZ@amdc1227>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--W/D3X8sky0X3AmG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 27, 2013 at 02:26:08PM +0100, Tomasz Figa wrote:
> Hi Felipe,
>=20
> On Wednesday 27 of March 2013 15:19:58 Felipe Balbi wrote:
> > Hi,
> >=20
> > On Tue, Mar 26, 2013 at 03:53:12PM +0100, Tomasz Figa wrote:
> > > @@ -307,6 +310,7 @@ static int samsung_usb3phy_remove(struct
> > > platform_device *pdev)>=20
> > >  static struct samsung_usbphy_drvdata usb3phy_exynos5 =3D {
> > > =20
> > >  	.cpu_type		=3D TYPE_EXYNOS5250,
> > >  	.devphy_en_mask		=3D EXYNOS_USBPHY_ENABLE,
> > >=20
> > > +	.rate_to_clksel		=3D samsung_usbphy_rate_to_clksel_4x12,
> >=20
> > why isn't this just a clk_get_rate() ???
>=20
> As the name suggests, this is a function to get appropriate CLKSEL value =
to=20
> write into PHYCLK register for reference clock rate on particular platfor=
m=20
> (clk_get_rate is used inside to get the rate).

alright, then you don't need this function pointer at all, look at both
your rate_to_clksel functions (quoted below):

| +int samsung_usbphy_rate_to_clksel_64xx(struct samsung_usbphy *sphy,
| +                                                       unsigned long rat=
e)
| +{
| +       unsigned int clksel;
| +
| +       switch (rate) {
| +       case 12 * MHZ:
| +               clksel =3D PHYCLK_CLKSEL_12M;
| +               break;
| +       case 24 * MHZ:
| +               clksel =3D PHYCLK_CLKSEL_24M;
| +               break;
| +       case 48 * MHZ:
| +               clksel =3D PHYCLK_CLKSEL_48M;
| +               break;
| +       default:
| +               dev_err(sphy->dev,
| +                       "Invalid reference clock frequency: %lu\n", rate);
| +               return -EINVAL;
| +       }
| +
| +       return clksel;
| +}
| +EXPORT_SYMBOL_GPL(samsung_usbphy_rate_to_clksel_64xx);
| +
| +int samsung_usbphy_rate_to_clksel_4x12(struct samsung_usbphy *sphy,
| +                                                       unsigned long rat=
e)
| +{
| +       unsigned int clksel;
| +
| +       switch (rate) {
| +       case 9600 * KHZ:
| +               clksel =3D FSEL_CLKSEL_9600K;
| +               break;
| +       case 10 * MHZ:
| +               clksel =3D FSEL_CLKSEL_10M;
| +               break;
| +       case 12 * MHZ:
| +               clksel =3D FSEL_CLKSEL_12M;
| +               break;
| +       case 19200 * KHZ:
| +               clksel =3D FSEL_CLKSEL_19200K;
| +               break;
| +       case 20 * MHZ:
| +               clksel =3D FSEL_CLKSEL_20M;
| +               break;
| +       case 24 * MHZ:
| +               clksel =3D FSEL_CLKSEL_24M;
| +               break;
| +       case 50 * MHZ:
| +               clksel =3D FSEL_CLKSEL_50M;
| +               break;
| +       default:
| +               dev_err(sphy->dev,
| +                       "Invalid reference clock frequency: %lu\n", rate);
| +               return -EINVAL;
| +       }
| +
| +       return clksel;
| +}
| +EXPORT_SYMBOL_GPL(samsung_usbphy_rate_to_clksel_4x12);

They both return the same thing and test the same thing. You clearly
don't need this function pointer. The only thing you need to be careful
is that different platforms will have different clock rates, but that
can just as easily be turned into a generic check.

I don't see the need for $SUBJECT.

--=20
balbi

--W/D3X8sky0X3AmG5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRUvTFAAoJEIaOsuA1yqREYN8P/RRVo3QJpKM9h0DoMTCLQ6w2
qojOMaMQIaB+Cit769AbdwT7GIcjLyfBr2iyHjqfnUa2G3ZqU52KiB+OvQwWIRLj
L8Q4lwyNAqATrX2VYa5Q0qNZ6mi/EvkoeuKBpXvUWY2Psoo7DQiHhOTMavxGuIvo
ndQ6ZrtPvose8v9ZYUbO01Zi+tcXo8bzMZPcaqP4DTdDztXn/LZphTydOLV8OZEg
v3IWWnWD3xxixhUtcCgdd6m26gk2bIQQ0bq8o3r8g8DVjNC2e8P5pz/JUYv2D1H3
ozUwdzrqjSaI3isbYjsic9f1RpGi+95TBuhkWufLr0r0FVaKube6VZKpYZNufpQ1
QQt7x/yChBCywG2xJe3hIPl2gYUY5msXttiR0m4pLe+TbXugdeYeDgtRuURWD9GU
G0co2s+YrVTZups3c5RtE1TJZm+1dud4xDuhXhUF9Tl6hLF1scBVGG4zXTA2kCbk
R5WhjrrGe4hxj4R6g1ovqH9gGfrOSk7E9E5RSlkhLh+Zc7xajlzjnpJtZtzxBTMo
RqOy2wDBDWBWlx460+viHFQxrXlBbh7k93HBn9XO5aMzgq8Xw1sq82rLWRPkcrOO
MhjsLhtDAH1too9/+hWC6lQKX7+rENH3Pc/Mi7hOTNSpgm1ykjYJjIVI3z5Zl19F
KD+QI5zWB/HzT6pKMYGY
=Wkxt
-----END PGP SIGNATURE-----

--W/D3X8sky0X3AmG5--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
