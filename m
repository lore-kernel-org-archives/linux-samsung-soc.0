From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c-s3c2410: Leave the bus disabled unless it is in use
Date: Wed, 12 Mar 2014 20:27:14 +0100
Message-ID: <20140312192714.GE28891@katana>
References: <1354165536-18529-2-git-send-email-ch.naveen@samsung.com>
 <1391763249-28964-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="phCU5ROyZO6kBE05"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57203 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750736AbaCLT1R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Mar 2014 15:27:17 -0400
Content-Disposition: inline
In-Reply-To: <1391763249-28964-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, naveenkrishna.ch@gmail.com, ben-linux@fluff.org, cpgs@samsung.com, sjg@chromium.org, grundler@chromium.org


--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2014 at 02:24:09PM +0530, Naveen Krishna Chatradhi wrote:
> From: Simon Glass <sjg@chromium.org>
>=20
> There is a rather odd feature of the exynos i2c controller that if it
> is left enabled, it can lock itself up with the clk line held low.
> This makes the bus unusable.
>=20
> Unfortunately, the s3c24xx_i2c_set_master() function does not notice
> this, and reports a timeout. From then on the bus cannot be used until
> the AP is rebooted.
>=20
> The problem happens when any sort of interrupt occurs (e.g. due to a
> bus transition) when we are not in the middle of a transaction. We
> have seen many instances of this when U-Boot leaves the bus apparently
> happy, but Linux cannot access it.
>=20
> The current code is therefore pretty fragile.
>=20
> This fixes things by leaving the bus disabled unless we are actually
> in a transaction. We enable the bus at the start of the transaction and
> disable it at the end. That way we won't get interrupts and will not
> lock up the bus.
>=20
> It might be possible to clear pending interrupts on start-up, but this
> seems to be a more robust solution. We can't service interrupts when
> we are not in a transaction, and anyway would rather not lock up the
> bus while we try.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Cc: Grant Grundler <grundler@chromium.org>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Applied to for-next, thanks!


--phCU5ROyZO6kBE05
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJTILUSAAoJEBQN5MwUoCm2NL8P/0Zn0P3ySKQ5L3nMyguCDbx6
HEAx5VsO4GdEHs03f8LzdoEK05QJ8vquaArx39mmPKcKH49GOgk/X9gk2FWLgdpu
3wW3MaMYZEce2Odt2DYF5gnCQdu9v7O/VwXl8UHCxMkD444Rg5M3M2F1Hpbjr/s3
Ubi/9kSTkUixLLPULeMByIgXVEk8KjJ6LQY8M2KutIGERN0/ENq4LmTqnUwuUDm4
DNElK+wFnz2yREsWGngxYsX50mg3cSGCDeeQ3GBEY0tmLwO2SLNkMKmbFWgknTMs
6MKKCIjJT1oJOK+OYCFbVA+wXg0O0Z/ZrmP6D52Q0ep7el3UsY/cR+tki+Lxf7fm
xHcqkzXOa0c73QC8ubCQyJ1sTHN/YrjN0uRkMQCIlnPWZCL/FAoekefrcrQYpl0z
AhTJ+d14irhLHCavGVRxelCGjr38ktFd5OV6g0BpXoozgAslOFrpWKNgzL81FRgG
lvMzh8MPIrs9q+HNbhg8h12At7ceCAkv5f14GjgsWrVQJHqPQz1T8UZzrUcKJCyT
ISy+cpi0Epi8ub20zOXyPu0PQS1//elIVTPzHsCITRIeFuSs6Y0JHIkjR5/r4ylP
Sp5Kja1g6LGzhQmACQyl0KVgTCd2J5+rpGyLrl6zUZ0BrSIthhqriCr4c2ZthxMj
wXAt5afQ9KsjjtWf8oR7
=k9Ph
-----END PGP SIGNATURE-----

--phCU5ROyZO6kBE05--
