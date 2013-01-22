From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Tue, 22 Jan 2013 10:48:17 +0200
Message-ID: <20130122084817.GC16143@arwen.pp.htv.fi>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
 <20121215072014.2E05E3E0AE3@localhost>
 <CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
 <CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
 <CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
 <016901cde163$6be034c0$43a09e40$@samsung.com>
 <CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
 <50DB811A.8010408@gmail.com>
 <054601cdf862$534a8ad0$f9dfa070$@samsung.com>
 <CAFp+6iGrp8b+T3n+xNha7jMFMgDsFR8E9zCijoUANZgmN4QL_A@mail.gmail.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:59802 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752875Ab3AVIsg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jan 2013 03:48:36 -0500
Content-Disposition: inline
In-Reply-To: <CAFp+6iGrp8b+T3n+xNha7jMFMgDsFR8E9zCijoUANZgmN4QL_A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Doug Anderson <dianders@chromium.org>, balbi@ti.com, Thomas Abraham <thomas.abraham@linaro.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, Alan Stern <stern@rowland.harvard.edu>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, jg1.han@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>, cpgs@samsung.com

--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 22, 2013 at 11:18:55AM +0530, Vivek Gautam wrote:
> On Tue, Jan 22, 2013 at 11:05 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> > Sylwester Nawrocki wrote:
> >>
> >> On 12/24/2012 09:13 AM, Vivek Gautam wrote:
> >> >>>> These two changes look good to me.  For both of them:
> >> >>>>
> >> >>>> Reviewed-by: Doug Anderson<dianders@chromium.org>
> >> >>>
> >> >>> Well, I have another idea. Yes, I know, specific chip name should =
be
> > used.
> >> >> But
> >> >>> you know the specific chip name in compatible can cause another
> >> confusion
> >> >>> on other SoC which has same IP. So I think, we need to consider to=
 use
> >> >>> common name or any specific name not chip in compatible for IP/dri=
ver
> >> like
> >> >>> following?
> >> >>>
> >> >>> -     { .compatible =3D "samsung,exynos-dwc3" },
> >> >>> +     { .compatible =3D "samsung,synopsis-dwc3" },
> >> >>>
> >> >>> Or if any version or something, how about following?
> >> >>>
> >> >>> +     { .compatible =3D "samsung,dwc-v3" },
> >> >>>
> >> > Well, yes the newer SoCs with same IP using the chip name can cause =
some
> >> > confusion, but won't it be fine that -
> >> > "Newer parts using the same core can claim compatibility by
> >> > including the older string in the compatible list" - as quoted by Gr=
ant
> > Likely
> >> >
> >> > Or, can we try another option, using multiple compatible strings for
> >> > SoC specific
> >> > in of_match_table, so that we don't create any confusion by using sa=
me
> >> > compatible for newer SoCs also. Like,
> >> >
> >> > -     { .compatible =3D "samsung,exynos-dwc3" },
> >> > +     { .compatible =3D "samsung,exynos5250-dwc3" },
> >> > +     { .compatible =3D<new SoC using same IP>  },
> >>
> >> Yes, why not just use an SoC name where given IP first appeared ? I
> > believe
> >> IP revision numbers are not always well documented. Also when an IP is
> >> instantiated multiple times in specific SoC, its revision number might=
 not
> >> be sufficient to determine the system integration details for each
> > instance.
> >> I think having version for some devices and SoC name for others just a=
dds
> >> to the confusion. Thus using specific chip name in the compatible prop=
erty
> >> seems more clear to me.
> >>
> > Well, I don't think so. Let's see the DMAC PL330. Its compatible is
> > "arm,pl330" and "arm,primecell" not SoC/Chip name. I think DWC is a same
> > case or at least similar.
> >
> > You know, the DWC is a IP from Synopsis and I _Believe_ it has a kind of
> > version and it can be used for identify.
> >
>=20
> Right, DWC has version number, but that being the kind of USB controller
> (USB 2.0 and USB 3.0)
>=20
> DWC2: USB High Speed controller (as also indicated in the patch from
> Paul: [RFC PATCH 0/6] DWC2 DesignWare HS OTG driver)
> DWC3: USB Super Speed controller
>=20
> Is it fine if we use something like shown below, as suggested by you earl=
ier ?
>=20
> -     { .compatible =3D "samsung,exynos-dwc3" },
> +     { .compatible =3D "samsung,synopsis-dwc3" }

You're both missing a point here. The synopsys IP driver is called
dwc3.ko and that's compatible with synopsys,dwc3. Your glue layer driver
(dwc3-exynos.ko) is compatible with your platform, so
samsung,exynos-dwc3 sounds correct to me.

The glue layer is just to "abstract" away the integration details of the
IP core into a specific platform.

--=20
balbi

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ/lJRAAoJEIaOsuA1yqRE32AQAJQlZdxvlxSDkWSVeHqUwuY/
tYhw5vRMFIf1vR+d3vdef0+W+UZy955hP9IHVYj4AzJzeSKTeEP95vDABkO032pg
sahLoQbgLElkIBNW6yVtnV3tuNchd0WsyWZuLWYg0NtD1e3od++Ei5pxLxMj3S5o
dHMIhVSNzxunYqWOx///urEuoyh93U7hnZR/46kPOLH3bfq9GzUYLvemXaw4cY2V
ptOQCD3xajVpb8VdvCTgwjcdgWZ2XPhkaOjubwo5ImJToQP3HbkFNdBSKStcUp/F
q+3oyztUDOvKoEFD8mQSwwmCK7Pu5qI2CKdv1Og/ZSdZ3NzYWrRO0f8YAymyer1P
NT6cd0DkMOqU6eb56hRrPdF9P0pk76GzfuftZrCJbHtc5cMm+EziM1na8yZ4tBJs
cDTNJXNmNyGgoyl0GYv59nsmhv8KTqba7h5N8R6hc9gdRswBJrXfSdcqGOZnT9if
OvBYOc4JRhpxbWIm4c7ElsHMoDkmJs/za45+og9NVB7Xf8VHTGloLNHHRYLMdAic
S3O423D/SvKZNIvoC9JYaW/+6M5CVqkysLF77NnkPZX1f5hY9DWQYwZ986zpmFP3
8H6gV9t14h64pRwTQLVT2HN/SZa1/OtU8HjUalG2gy/nPeE6FQgunp/SK/18Wi7U
TpbReAfHDZTvQQYPxNg5
=Dfqu
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
