From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/8] s3c-hsudc: move platform_data struct to global header
Date: Wed, 21 Dec 2011 13:25:44 +0200
Message-ID: <20111221112541.GC9605@legolas.emea.dhcp.ti.com>
References: <201112191938.22254.heiko@sntech.de>
 <201112191939.16542.heiko@sntech.de>
 <20111220112458.GG31842@legolas.emea.dhcp.ti.com>
 <201112201236.37581.heiko@sntech.de>
 <061801ccbf95$e1df4580$a59dd080$%kim@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog121.obsmtp.com ([74.125.149.145]:36287 "EHLO
	na3sys009aog121.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751176Ab1LULZs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Dec 2011 06:25:48 -0500
Content-Disposition: inline
In-Reply-To: <061801ccbf95$e1df4580$a59dd080$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Heiko =?iso-8859-1?Q?St=FCbner'?= <heiko@sntech.de>, balbi@ti.com, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Linux USB Mailing List' <linux-usb@vger.kernel.org>


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2011 at 01:06:14PM +0900, Kukjin Kim wrote:
> Heiko St=FCbner wrote:
> >=20
> > Am Dienstag, 20. Dezember 2011, 12:25:00 schrieb Felipe Balbi:
> > > Hi,
> > >
> > > On Mon, Dec 19, 2011 at 07:39:15PM +0100, Heiko St=FCbner wrote:
> > > > Gadget drivers should be compilable on all architectures.
> > > > This patch removes one dependency on architecture-specific code.
> > > >
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > ---
> > > >
> > > >  arch/arm/mach-s3c2416/mach-smdk2416.c    |    1 +
> > > >  arch/arm/plat-samsung/devs.c             |    1 +
> > > >  arch/arm/plat-samsung/include/plat/udc.h |   15 +------------
> > >
> > > I would like to have ack from Ben and/or Kukjin before applying this
> > > one. Ben are you ok with this patch ?
> > I think Kukjin does more acking if this stuff currently, so hopefully h=
e will
> > see this mail.
> >=20
>=20
> Hi Felipe,
>=20
> Looks ok to me, you can go ahead with my ack.
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

--=20
balbi

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO8cI1AAoJEIaOsuA1yqREYAgP/3Z/y4P5Zd2jD3Jmzmkn7vdW
OYGh2bhmfPo+rcV5RVRT/aRJP/zftSTU1r8l36R9oJXRuQ1PRhUpJVF3Z+F3C7zn
R4K5HVxCux03nH//1wgqWQVtnkJ99U9zt4spD6pR/83obOf22BgJL2k4Uq4LbfeV
/743en6nCa27d4uWQXiGOS+2tC+8Wv3FrQ/TtwAxGSekNwOhV6f22LVN8XvI7p/r
vjcnJputU8Qc0PiduQe8X4a/boH4A8iJOT7ysT1Xm9SwksQoAQ04TqrMH9Dw0WIT
T9rEUACQeHHYTgLbOA0OJvVY8Kw6wsj/B8VcVuN9HmJSU3XoMYEct5NZd7o1/g1h
LsAY6qSC26a6Q8LjegE8nzwc1o0dt1zDDqbq9EBqlGHmZ6gyouJy1VLTQGTpOSDO
KPz0U+2Ltdk77wBQAAX0eYGohUgO0kpROBNtf3DmVDw9uLBFu/JUoHOnSIxmbKj7
NEJpjTy0n77ewXxJI7hvLAcCGLBVLQpnhAN8baCvU7pnFdhuPYnY9kVezTKWOqbT
hXJSK1JAI2gYbwa4m76cF7sh+ntbBFbNjlLtYAGr92cfaRSysXrqCOy86e2cy8ml
ZyAdAw5MCJSblg9MzoKFEMcxDqqE5uROXmhkanpDjglq0CUhBKJs9N+lU5aI4UM4
/2mo+zjdPyKatWuox+g9
=dZky
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--
