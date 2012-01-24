From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 12:15:11 +0200
Message-ID: <20120124101510.GH27414@legolas.emea.dhcp.ti.com>
References: <201201082156.44142.heiko@sntech.de>
 <201201241050.14405.heiko@sntech.de>
 <20120124095130.GA27414@legolas.emea.dhcp.ti.com>
 <201201241113.00387.heiko@sntech.de>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xU0InBYDQy8cK3qi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog103.obsmtp.com ([74.125.149.71]:44132 "EHLO
	na3sys009aog103.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754982Ab2AXKPR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 05:15:17 -0500
Content-Disposition: inline
In-Reply-To: <201201241113.00387.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: balbi@ti.com, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--xU0InBYDQy8cK3qi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 11:13:00AM +0100, Heiko St=FCbner wrote:
> sorry for mail spam :-)
>=20
> Am Dienstag, 24. Januar 2012, 10:51:31 schrieb Felipe Balbi:
> > On Tue, Jan 24, 2012 at 10:50:14AM +0100, Heiko St=FCbner wrote:
> > > Hi Felipe,
> > >=20
> > > Am Dienstag, 24. Januar 2012, 10:38:32 schrieb Felipe Balbi:
> > > > Hi,
> > > >=20
> > > > On Sun, Jan 08, 2012 at 09:59:02PM +0100, Heiko St=FCbner wrote:
> > > > > The phy-power-handling is common to S3C2443/2416/2450, so introdu=
ce a
> > > > > s3c2443-pm-common.c to handle this for all of them.
> > > > >=20
> > > > > This makes it possible to remove the raw write to the PWRCFG-regi=
ster
> > > > > from the s3c-hsudc driver.
> > > > >=20
> > > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > >=20
> > > > I believe this doesn't really depend on previous patches (??) In th=
at
> > >=20
> > > > case, it can be carried with s3c's tree:
> > > it does depend on the previous patch [2/3], as the device power domai=
n is
> > > controlled through the runtime-pm subsystem whose calls were added in=
 it.
> >=20
> > then I will need proper acks to carry this patch.
> another possibility would be to have patch 2 and 3 get in through the sam=
sung=20
> tree, as the majority of the change lies on this side (i.e. introducing a=
 new=20
> file in plat-s3c24xx)

yet another one, would be to defer patch 3/3 by one merge window ;-)

--=20
balbi

--xU0InBYDQy8cK3qi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHoSuAAoJEIaOsuA1yqREurIQAJiZl9M5rHS96zsWgpaMN39h
CijvIky/7aBgsIDD5VVdXf6fh8T3U4Xl5nfBHlEiqvFdde3U8PGy0ZurSdzIvapq
GG0XIAhGQYssGpm2k98kLLe2T15+RazABk8YYowXz5fkYrtbu8NOSmq+N2vUqL4H
CQGAaA3azaHNT9LGYX92/xgPllJctUy4IK6+vEnoowvlun1lZ8VJQ2blr5crpQDr
c8+Si9bCR5hz0rI6uG8oqM7NhOMogCWRsoJJNhX1SdvsE2HbyHoUJL5VKVp09dqM
r0BiJhzSXxW4f20oX2kySE1XdaQIB7Cyj0UpmUqnXWQfLbXjM4mrbyfNWr21Cyyl
o6JOSorJ0f/BjiN2PiJEGAMTjSMSrTMekVdybudG6nhBR6tr8+Pe0/3C7SNhT/XS
4+PBz2rwcXP85Tza4CR06iWnxdsWJYUYgEe3XA0UcbfIsqaotZhucMdhHwA18jkc
TXxDXFNBLTWSPbMhA173W0hl0Eg3DIHAiiuXNNtkuvJ4bdD9QO2brQZyLa4bA43Z
rxdEWdgBNaWOM5f6CtdTGkZVEi/USW2CrPcCfO/PIk5byxF05TTd5dqwzxX6BYbQ
he2BHCtl5u7X1r4f1FJFCvdT1kF+EQlQyAgRWbOBj86vZ6jJBOJ5O9hzqZ0ILCdR
YEoe0tEcd/7It465gjRf
=DCiN
-----END PGP SIGNATURE-----

--xU0InBYDQy8cK3qi--
