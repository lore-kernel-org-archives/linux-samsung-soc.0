From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: Describe the hardware variant for
 readability
Date: Sat, 21 Jul 2018 00:15:46 +0200
Message-ID: <20180720221546.obccridrqavnlzfn@ninjato>
References: <20180718195404.5095-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oatmdfrkwn3xz6o5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180718195404.5095-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Andi Shyti <andi@etezian.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--oatmdfrkwn3xz6o5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2018 at 09:54:04PM +0200, Krzysztof Kozlowski wrote:
> The driver supports multiple hardware variants of Exynos I2C controller
> which differ in FIFO depth, handling of interrupts and bus recovery in
> HSI2C_MASTER_ST_LOSE state.
>=20
> The difference in variant was a single bit set for Exynos7 variants and
> implicit lack of this bit for other variants.
>=20
> Make each variant explicit which also fixes the GCC warning about
> documentation:
>=20
>     drivers/i2c/busses/i2c-exynos5.c:223: warning: Function parameter or =
member 'hw' not described in 'exynos_hsi2c_variant'
>=20
> No change in functionality.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--oatmdfrkwn3xz6o5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltSXxIACgkQFA3kzBSg
KbbZEg//U/7Dkb2+soICmo8FPQ0EACtptQsv3c2oAfk6yCaIvTsw64toYaVl/oGL
aRPyks3pQyS9PDOooY7I/EwRx0cfIQgYoRrCbAqOazJc15PJMex8OaLibuvJHy/S
W/S3r2RJdrVyKQjksaYR3HpDia7r42eLuuqWDwRMPSheLMXRRSbYRzHeG6WaVywZ
ePQFQ8tGXkADB6w78YOAE81afAEKJTjoZMnBrIpSrmQZF2d14JwbZoQEcXQlysl7
A7gFSoS7FxCmVYaic/O7UIdA0JkuDNdIbibscLOKTTsprJW2Or+V6sEYviLXc7FQ
aRnpT+mAQBVnQAVEMPN8oJspYvAVdM/2ksOhVPCLNL6EBrW0I8zbNelOh1uYYefF
GCfuJjtvMfrbPzJFFQr694DMa8xY7ZdRc/xUgIIJkLfgh9uCWvZLQDI2ftpLkG/K
+wSywiOGGehAYACjHWQ0yKDAXGH6IIN1yAwEAShW7BaFhFuso8Tn+bwzrhpR5fSz
SNXiNeyzxN6kYzgQmlI6PpIW3jKaqkMogLIDvDB9tXZdMRBWjr1u76fCIgpEzbZv
zd6SccUNfzIr0I0HPNqDvLRn3FUYNv+oT5I2VvgVZXVmSYJMk+as4WmiJ2zD0l94
ifdaLTJgYvfSpAGStDY/g0rhVDh+UJWbZctHa2XFKJpzMBNcysE=
=a3fE
-----END PGP SIGNATURE-----

--oatmdfrkwn3xz6o5--
