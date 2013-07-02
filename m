From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] drm/exynos: Add missing includes
Date: Tue, 2 Jul 2013 16:04:49 +0100
Message-ID: <20130702150449.GO27646@sirena.org.uk>
References: <1372683355-27460-1-git-send-email-broonie@kernel.org>
 <008a01ce771e$afe02670$0fa07350$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HevQWRStXZ0Cpw2M"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:32986 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752949Ab3GBPFS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jul 2013 11:05:18 -0400
Content-Disposition: inline
In-Reply-To: <008a01ce771e$afe02670$0fa07350$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'David Airlie' <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--HevQWRStXZ0Cpw2M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 02, 2013 at 09:21:32PM +0900, Inki Dae wrote:

> > Ensure that all externally accessed functions are correctly prototyped
> > when defined in each file by making sure the headers with the protoypes
> > are included in the file with the definition.

> I don't see why this patch is needed. it seems like including unnecessary
> headers so it makes the code size enlarged.

Well, aside from it being basic good practice and allowing the compiler
to check for errors in the prototypes this is also something that sparse
warns about.

If the resulting binary size is changed by having the headers included
then that indicates a bug in the headers - they *really* shouldn't be
doing anything substantial here.  None of the headers in question looked
at all worrying.

--HevQWRStXZ0Cpw2M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR0uwOAAoJELSic+t+oim91FUP/ifkB1DzAWrEaKgv74k9IqLB
mYC1OFJTHEwBq1Vp0nftDsUGhPhSW5dxT6iEtu4YyStSSbesBJrGd70cBXudj76B
6S91tbAwLkxx4f3wRXNWzFmBCVwJBcWJJCSE1ms/QLLhWCaGtpFw2D0Yc22B3kOo
lijpTLwo4jYE9kIB3CIPCLR/hBYcu66S/zzGrFXaNLXrhiBeBIs+7UUsdVNPq5rA
rFqyH6c2STTKfApzPZPFbePic/GdEFyu9ycthOOhCIo0AfJTlj6hFnBUMhd6M/tw
dwU6MNjdGzQChCDN1QHUc2Uui6iT2YW21Glg6CptVZ8dGrw4UdcAjFtJjks10JUH
2Kam2a2zPhLbP2vGyoVWlkUfw/oJKc4ffOqhJOXwdFOtXhKMv3CGShZJOT+YFgGu
VCFsVL/zL3V9kI92vwWgcDZ8cqELRixYu9TXlf5RdSB9qbCs8JNzRtqAFh01hhgP
SmVDax4uFZWPp59sJrkZEkH/Jho+a2RSmS/ISrkCwf9pktbd/ccgUQl6RPFgnF5S
OjOClcTlFZsX0O97G9jCceMnE/o9xLbO8o+ZZHZneHfU57nINzdK1V7hSdxp0Je6
pOE6i304RIMA7WqWSs/AvgDCV+ryMCPtbZ7ZgCmVZaZmv6/mk08tGFs4RAq3ShSJ
vdJGaQnFjrf2VuIeYsDv
=R2sJ
-----END PGP SIGNATURE-----

--HevQWRStXZ0Cpw2M--
