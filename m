From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ARM: S3C64XX: Use fixed IRQ bases to avoid conflicts on
 Cragganmore
Date: Sun, 22 Mar 2015 16:03:16 +0000
Message-ID: <20150322160316.GB6643@sirena.org.uk>
References: <1427020841-24189-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427020841-24189-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: kgene@kernel.org, linux@arm.linux.org.uk, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2015 at 10:40:41AM +0000, Charles Keepax wrote:
> There are two PMICs on Cragganmore, currently one dynamically assign
> its IRQ base and the other uses a fixed base. It is possible for the
> statically assigned PMIC to fail if its IRQ is taken by the dynamically
> assigned one. Fix this by statically assigning both the IRQ bases.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Reviwed-by: Mark Brown <broonie@kernel.org>

This probably wants to go to stable as well.

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVDufDAAoJECTWi3JdVIfQfOsH/A4B8myIe4Psnshp0yF532/S
ppfHZ5QoOc2vMY+MeHHl1UPLawYn+8nPIrUh6cq1ypMI+qx+Bt7QeI3U6Hlsbzlo
HuyeK47GxAgDQ3ohgR3oO4bODVIjq5C2suCO9iYZMqP0z7KaTYb3ONImS/fcQb9+
uE7DLVlvqzeu4AL8xNa09uqhQTKKOQdNKI9O8DApo1cyLRsTVF0LbE6uybe+CBrZ
v0CRDiaQqzUpVXL6qPtuPy6rlu0SBmniOlKgYDCSNLQVy7Mej9s+82uo0LBSz3qp
Ifbr7xprrB3N9i2O0E0gM68LpjaGTrQ0vDSZyZ2qXLnehpuLKkpsZOWhlOz4kLE=
=7Knz
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
