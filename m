From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Wed, 23 Jan 2013 11:50:21 +0200
Message-ID: <20130123095021.GB22054@arwen.pp.htv.fi>
References: <CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
 <CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
 <CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
 <016901cde163$6be034c0$43a09e40$@samsung.com>
 <CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
 <50DB811A.8010408@gmail.com>
 <054601cdf862$534a8ad0$f9dfa070$@samsung.com>
 <CAFp+6iGrp8b+T3n+xNha7jMFMgDsFR8E9zCijoUANZgmN4QL_A@mail.gmail.com>
 <20130122084817.GC16143@arwen.pp.htv.fi>
 <063e01cdf8ec$85e637c0$91b2a740$@samsung.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <063e01cdf8ec$85e637c0$91b2a740$@samsung.com>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, 'Vivek Gautam' <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Sylwester Nawrocki' <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Doug Anderson' <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, 'Thomas Abraham' <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 22, 2013 at 02:04:56PM -0800, Kukjin Kim wrote:
> Felipe Balbi wrote:
> > Hi,
> >=20
> Hi Felipe,
>=20
> [...]
>=20
> > > Right, DWC has version number, but that being the kind of USB control=
ler
> > > (USB 2.0 and USB 3.0)
> > >
> > > DWC2: USB High Speed controller (as also indicated in the patch from
> > > Paul: [RFC PATCH 0/6] DWC2 DesignWare HS OTG driver)
> > > DWC3: USB Super Speed controller
> > >
> > > Is it fine if we use something like shown below, as suggested by you
> earlier ?
> > >
> > > -     { .compatible =3D "samsung,exynos-dwc3" },
> > > +     { .compatible =3D "samsung,synopsis-dwc3" }
> >=20
> > You're both missing a point here. The synopsys IP driver is called
> > dwc3.ko and that's compatible with synopsys,dwc3. Your glue layer driver
> > (dwc3-exynos.ko) is compatible with your platform, so
> > samsung,exynos-dwc3 sounds correct to me.
> >=20
> Hmm...yeah, you're right and agreed.
>=20
> However, we need to use more clear name there like "samsung,exynos-dwusb3"
> in compatible, because you know there are lots of other IPs in Synopsis
> Design Ware brand. So we have to include usb in compatible for that.

fair enough.

--=20
balbi

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ/7JcAAoJEIaOsuA1yqRE/z4QAJmZxDQrpOhfgSWJgy1KnB0Z
a2Dpuv5lTlNZwjBrS1PolmuTH+gxMDKhjP/9QjH8fqOtUxGe6pD+c5kfhhMvAuQt
svBS/ItRCWk+h3jXnYE8M8Od67mn9t4RVUjgrFAMz7at7jb+3mqvYDYSHIOcO2Hw
Fc4wDxrWP6rQhlxQaYH23VHHHr0UIrW6mns5QeXHbAAAizFtBW9k/FwZkeKF/VW7
Zka6Y1eLqg6coWPMmH4/ZgzLpBOKRPsPbzGlXjifi/HJ6NYwCfUZ8oonntUUbm+9
KdBC9UfBJSVkwHpqXdkDGW3zkCzZ5DvWE6Aj1FHzXVJg420trC+z5Jjf8EuuB53o
9p8daFQOjr5+sfzJD9YYnTOU7k+gNck1p59BaAVY3VdhRAZaa8+bGgIo3vDlBvdF
hA5kqFuOSHHUVTvrYd+/mOvRYaQaC7tUiPybi1l0XRmRTMN/lD/Wr8gqwojYup3z
uiSzFHQU3cH2fTtTnJ/SybmFfCA2TAXcyxgBXPgRs/WDdTVUvoWdvnPvVXaQNHra
OeoqOBbtPQQI1YzRYW/lzrvFEhM+oe28ubSZl5o2SKX6EEiImsnDy9qaDNXKM2dC
oAVVdudxewZ5TJuOr8JZ0cMpTC2Aq+9VHurXZk4DS793eUncCoz495qyNiFihL0n
vehsrcANGO++jVFsBT6o
=1SJS
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
