From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 12:12:46 +0200
Message-ID: <20120124101245.GG27414@legolas.emea.dhcp.ti.com>
References: <201201082156.44142.heiko@sntech.de>
 <201201241050.14405.heiko@sntech.de>
 <20120124095130.GA27414@legolas.emea.dhcp.ti.com>
 <201201241109.48749.heiko@sntech.de>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5szWch92WbdldFR4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog103.obsmtp.com ([74.125.149.71]:43841 "EHLO
	na3sys009aog103.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755361Ab2AXKMv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 05:12:51 -0500
Content-Disposition: inline
In-Reply-To: <201201241109.48749.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: balbi@ti.com, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--5szWch92WbdldFR4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 11:09:48AM +0100, Heiko St=FCbner wrote:
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
>=20
> ok, I will pester Kukjin Kim more about it to get the needed ack :-) .
>=20
> If changes are requested to this third patch should I only resubmit this =
one=20
> or all of them again - i.e. will you still keep the first two patches?

first two are already applied so no need to resend them :-)

--=20
balbi

--5szWch92WbdldFR4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHoQdAAoJEIaOsuA1yqREUI8P/RkubEv/vJm6yl6yERcAy5xk
slWvWtMiJ4O+66KRexh8COybwrg/tFASoMMQIrfjPADArpHwLo7qWv2Pl6mvwb2+
zhGlLVCgqTupa6QLplydCahv/zQDjp21Xy6wCOl/CjngzoKS30xTmMgy1KtSn4Nz
YtfFpWq6jXIlT/25SI8us8ddiZ9wTrtlypTcB0oqpz/1u1f4DcrQ9ZMMoBhptTdw
HtcG9LCyoYBIj/5TMpTV7J+Q5utJ3TpjFPzRr4oFdeDtj1UbCDtvj0POSSln3SMM
wiCeEBfbM7xv16Wb5SpwxksSCeBz3rYAsU3V+Q+NVqQzYQ86PtyzmbgOVeqcNTte
rTwyeQuIeEMfuygpYYHWcYT0/0NlVrvt4hJx8P4mQFFJgF/FcL7qQoD0Xbq8nbFq
8MXBZZVN+NuX13fzddOp9M+pOU3ZnbpCjTzCJbwKxh2Wh1FpgM66jQJwOXOa3RAp
2zIybMNdf9Y0q2PO4RXljaSVr/bV2Vpr+nj96KnLzxLRpKsnZsAy0eIyKivsVpIa
pGGwXBzaWsGGW06mVA/kB1hKlAyxarICZczCSQUHD6hvAJPV45t0yxhioOBm24iA
8LCaiaNQCp1jZZhrkNgcFk+zuSqhptR7PS/RQQAsdRG7JB2zOEAgat8/2O8DLpkn
RgfEO47HxxQs2XEhgbxe
=RWIP
-----END PGP SIGNATURE-----

--5szWch92WbdldFR4--
