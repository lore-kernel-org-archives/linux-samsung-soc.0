From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C64XX: Add basic cpuidle driver
Date: Fri, 30 Mar 2012 10:35:56 +0100
Message-ID: <20120330093556.GA21950@opensource.wolfsonmicro.com>
References: <1323117169-9817-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <201112061231.22570.heiko@sntech.de>
 <20111222181359.GA19259@sirena.org.uk>
 <201203301032.54739.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58002 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755181Ab2C3Jf7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Mar 2012 05:35:59 -0400
Content-Disposition: inline
In-Reply-To: <201203301032.54739.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 10:32:54AM +0200, Heiko St=FCbner wrote:
> Am Donnerstag, 22. Dezember 2011, 19:13:59 schrieb Mark Brown:

> > My plan there for the s3c64xx was to use pm_domain to figure out if the
> > system is idle enough to drop down, I've been adding some pm_runtime
> > support to provide the information to the core to let it figure this ou=
t.

> sorry for digging this up again, but do you happen to have some prelimina=
ry=20
> code laying around for this, that I could "borrow"?

No, sorry.  The big problem is putting all the devices in power domains
since the Samsung port always has every single machine driver directly
register devices.  Until that problem is solved it's not possible to
figure out if we're idle.

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPdX5CAAoJEBus8iNuMP3d7U0P/RPtMNg6qVcsiAj/RM+dS36p
fWE0iMT6q/FHC7OTxBVvKX7HiZYS7iav0F3BF56gpod4WSLFcfalA3j7PQ05YBD7
Dxlg0mLVyIJyE1yrH1tuqoNPDnFk7RqlU+RcqMA49+1SJdP64vShsQOBBi31QweT
lhFj8MEPYqvepvO/e8lgDM/yIaILiDVKXapCPGE6AztsEJy0dFoqyC/0srhdD1F6
dpPu/ZyMiLscdyOir2t2STGwltFH1AU6mC4hgIllpQfQygxMSeGtMg3W8SEafO16
/XIezhPyDIVuuXUdFzBCMkskEsSuSW1Mv2At+PzhuadJQveomKWbAOyHr7GwofQF
4jsoDo+jdO3nWzdF9Df8wAWMWiHRDDYHIsH4pWfngKFpCwkaY9nkotPGCkv6betw
ZTHTN+4OOZzmYFcljv3eGVIETd977ycaJwY5b6LbtkhXnKMgUfhuAUyBiX6R162Y
qsbxj/Js2Ph1XWid8tjaNSIlNWw6IaVjiyey1vP0NN6300aD21RwA+R2fRFEtdhd
F/dTzDxWAUld+0ZzMt2Ox+AbkajHmVsMpijppjRtpQzu2p2wBKKpaAYJo/Nyd9ln
MKci3c51Do+oC2HgiZ63d8lKLQ7RyJL7mxSM/jgd8QTBdyR5DBJ4kciREnU8uLnt
ZqqeTOjxscqngWvUZSU2
=yhJT
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
