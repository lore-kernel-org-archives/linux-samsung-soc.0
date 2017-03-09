From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: Avoid transaction timeouts due
 TRANSFER_DONE_AUTO not set
Date: Thu, 9 Mar 2017 16:37:48 +0100
Message-ID: <20170309153748.tayxxf44cru7nlo6@ninjato>
References: <20170309140533.24618-1-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5327461751460324174=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170309140533.24618-1-javier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============5327461751460324174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="roax3oy4uiuvtcm5"
Content-Disposition: inline


--roax3oy4uiuvtcm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2017 at 11:05:33AM -0300, Javier Martinez Canillas wrote:
> After commit 7999eecb7e56 ("i2c: exynos5: fix arbitration lost handling"),
> some I2C transactions are failing because the TRANSFER_DONE_AUTO field is
> not set in the I2C_TRANS_STATUS register so the i2c->status value is left
> to -EINVAL causing the i2c->msg_complete completion to never be signaled.
>=20
> For example, when reading the time of an I2C rtc on an Exynos5800 machine:
>=20
> $ cat /sys/class/rtc/rtc0/time
> [   25.924594] exynos5-hsi2c 12e10000.i2c: rx timeout
> [   65.028365] max77686-rtc max77802-rtc: Fail to read time reg(-22)
> cat: /sys/class/rtc/rtc0/time: Invalid argument
>=20
> The Exynos5422 manual states clearly that most I2C_TRANS_STATUS reg bits
> (including TRANSFER_DONE_AUTO) are cleared after the register is read. So
> reading has side effects and should only be done if HSI2C_INT_I2C was set.
>=20
> Fixes: 7999eecb7e56 ("i2c: exynos5: fix arbitration lost handling")
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
>=20

Applied to for-current, thanks!


--roax3oy4uiuvtcm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAljBdssACgkQFA3kzBSg
KbaLmw/+JVgx/lMoPt9MOnWiAy+4Yhw5IKR9PLqpaiSjAB1l9VP1+B6FRsvTMJpc
zN1aUC++f9jCvS7O6DCYVDMcrk4w+nywvpe3hAVpOoJkY8N2EjhUOFL3MGPC++58
myT2bf2hLesyt67b3IP0gG1dfzL4iXok5fStHC4i0SxmneuiolTQwW5MJa8Zu17m
0tVp4espvuv+eAPR6b3uMI3ctEu+Rz8fyZiqhRWQYkUY0qNKISh3soNse3pGUedn
R5+3+VrGNr2I4AUZ9xWU9GK7fU9fzVmtCDnDUhX7oIjx9ULDRSqnyD4dVQWJwT8J
9CEJzGAGuYJH5RPrikuTbT19t5ksG12YHvKpL3cIyh68AxM9ksIRI01vUYd6d2Ix
ptLWhwPj2cdPhKTv5P5b328FIph4t+CiAg7pzP4sFvKZvPAQkt0wrIdLjahHe+Qz
7jNAUFzTTTP5JFrXuei0JANkM77Jn1oOrPbJZd3lb8FnEpfGYbNYBTPC9bWIv32U
iSLGeG1SdhZcPyvsMz9yOTCivuUTKzu6l91fz27jXUXlfU4VKyamsTQQNThelIDR
0/mI1pmcvSRy7kNxvvOz5RiOtitnuno3HC8ESIUxJW8VFz2lggHrTukS2Ed88K4G
DAioKi7WrxaHh6/iQFzJrQa+gTE8jlSKRfK9PThKlUBRXsULm2w=
=PFZj
-----END PGP SIGNATURE-----

--roax3oy4uiuvtcm5--


--===============5327461751460324174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5327461751460324174==--
