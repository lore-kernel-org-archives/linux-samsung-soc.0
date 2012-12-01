From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] ASoC: Samsung: WM8994: Add basic device tree support
 for machine file
Date: Sat, 1 Dec 2012 22:49:38 +0900
Message-ID: <20121201134937.GD17981@opensource.wolfsonmicro.com>
References: <1354356447-16784-1-git-send-email-padma.v@samsung.com>
 <1354356447-16784-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59789 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751796Ab2LANtn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Dec 2012 08:49:43 -0500
Content-Disposition: inline
In-Reply-To: <1354356447-16784-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, padma.kvr@gmail.com, sbkim73@samsung.com, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org, kgene.kim@samsung.com


--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 01, 2012 at 03:37:26PM +0530, Padmavathi Venna wrote:
> Add the basic device tree based lookup.
>=20
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  sound/soc/samsung/smdk_wm8994.c |   23 +++++++++++++++++++++++

Any new device tree bindings need binding documentation.

Your subject line is also very misleading here...  it should say that
it's talking about the SMDK.  There's at least two other WM8994 based
Samsung boards in mainline.

--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQugrPAAoJELSic+t+oim9Ee8P/iKFTT8W+i1DyObTrPh+EVZP
Eq18+acCJycFyBm/Y4J0bKoVxhInwNKzryje8PecIctQ9bVFvKdEL4us/JGiPiNS
akbHEOY7edOnL5KkG7bSdpHrXibLDZP+OgJyVPGiJFb7fZJZTNVJyk7TLX6cfKeF
Hd/qY6WiKt9+o2Lr2ZnzoPOX2eRbRXU4O57dsQyYM0qmXO8Edfiqt0+/0NKNbJT+
NDH0ltYzgjbaQd0ZLIiLbHevc8On3EX5zjI/1W1gPsGR2SCoOFJjCAuBzkn3fC5+
bIuBrcPPrSqE6fwtNX6APkH90TJIrICPjIYSGBeVaZsDtpBPg+ew0wL9uqjAdWDD
HEc6JarC5lx3/M/nDoA+4Hju+4lsHhnkAk8V6Xdb4vqvanHZ4ZVCoXRVrseOajfr
vyEG9s4YRVEUtg5IF3eoLuh2DpoLAD8mXhc3ywruzpEMPPzCIcXR3bbMc18RdWBT
QpSA7rjapA3aQYj7Nh0WbBpr1YYWM3co98UEJ6z1FP25txy6ZmJnxq8npUnSf0tY
+AbQoD6b1AvIJo/LavDPvaUUBYqYgX99wTe/Csw0w6J87L6Edq1jlZEuOfjuPrym
UXh79THk6KXfIVt8oMPNLEYtvtiOWMCOCbAyEE2fHLb7LULoyGBLMhjw5sLzZCD4
6eIdrNG+u8owrNFeYTC9
=B3tt
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
