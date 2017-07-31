From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: use dev_get_drvdata() to get private data in
 suspend/resume hooks
Date: Mon, 31 Jul 2017 17:04:33 +0200
Message-ID: <20170731150433.hokceynz2j6eiu6j@ninjato>
References: <1501172184-17102-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yqs2ydd2qtzdnjvf"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501172184-17102-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-i2c@vger.kernel.org, =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Scott Branden <sbranden@broadcom.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joachim Eastwood <manabian@gmail.com>, Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Krzysztof Kozlowski <krzk@kernel.org>, Barry Song <baohua@kernel.org>, Jon Mason <jonmason@broadcom.com>, Kevin Hilman <khilman@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-samsung-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Patrice Chotard <patrice.chota>
List-Id: linux-samsung-soc@vger.kernel.org


--yqs2ydd2qtzdnjvf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 01:16:24AM +0900, Masahiro Yamada wrote:
> Several drivers call to_platform_device() to get platform_device
> and pass it to platform_get_drvdata().  In platform_get_drvdata(),
> the platform_device is converted back to struct device again.
>=20
> Use dev_get_drvdata() to avoid platform_device/device dance.

'dance' :D

>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to for-next, and thanks for doing it subsystem wide!


--yqs2ydd2qtzdnjvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAll/Rv0ACgkQFA3kzBSg
KbaSOw//WZL3subUwK0Alv62/Zv114VWGbXSWs3KZE8q3V09uVSmWCvn830YJhuZ
1fZSfJg25dOHTfhhAuZu/ww8Dqx/u3hbnTclQ3gHqVckhfsy1iwAALRynaStW4jk
mRtLIHoFXv0rnnoO+9h7O6rgStUppEJiCIEL2AK2aq+M8mTsXJhvDTk1z6zXMQ67
IDfnaY3Ywp+leZjK8//r2TlHWRs0Qecke8VqyNMO+ZmK0vHuxPaobRNJWKGJmIpV
icAvn8lzmVsZovL0pvtdQuto2MivHAgLJ0Y1AUjvBk4NdafyKlC1VzTRKcZXNzwF
TMFw7fsKXdBNaYIPE8VQMaU2Y+80/2rhng+zf9Q71ogYp4bnfmjhVsE+Prk8LvM+
NLWRf8eVbMphEjfNKB8hX3litaY16Hpf/cRBsqC8bMUYTSe0JqvaHqh36bD6V2uM
4tpQ8So63hc1MmAHQHLGRPENwS5XkXZSoOlisO9J5yKFVw1emcGg4wvtNlg6F8a/
CO/GSgDXS5T6Wa7ZUI7c6HL0X9ML+7fOpO4D31MRnJ7oXntVhVPLiY4BNfnTiMiN
SXaYuc9w0GC4MdDaZRg9qYgTOJmVZxsH2OlIdBTIzZrmlMiaL0kZCPkKKqpymTVU
8saaQiVbUpETtQOR7uXuLN+u12rN4kDN57yAemcio+rjRKtYHwc=
=sjfX
-----END PGP SIGNATURE-----

--yqs2ydd2qtzdnjvf--
