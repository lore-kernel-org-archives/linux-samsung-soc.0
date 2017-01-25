From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: fix arbitration lost handling
Date: Wed, 25 Jan 2017 21:55:54 +0100
Message-ID: <20170125205554.m7vmhs4tq6bzti52@ninjato>
References: <CGME20170105120727eucas1p2b9452792b7d13d551974305b478a26e2@eucas1p2.samsung.com>
 <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="epoparvazvjnwfxq"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-i2c@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--epoparvazvjnwfxq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 05, 2017 at 01:06:53PM +0100, Andrzej Hajda wrote:
> In case of arbitration lost adequate interrupt sometimes is not signaled.=
 As
> a result transfer timeouts and is not retried, as it should. To avoid such
> cases code is added to check transaction status in case of every interrup=
t.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Looks good to me, but I'd like some review from one of the Samsung
people?

> ---
> Hi,
>=20
> I am not I2C specialist, this patch is a result of debugging issues
> with SiI8620 MHL driver on TM2 device. I guess the main problem is
> with SiI8620 chip, but exynos5 i2c is also guilty - with i2c-gpio driver
> it works correctly - there is only one arbitration lost at 1st transaction
> (which is properly handled - transfer is repeated succesfully). In case
> of exynos5 there are much more arbitration losts. Lowering bus speed
> decreases frequency of losts but do not eliminate them.
> Any help/hint, what could cause such issues?
>=20
> I guess increasing adap.retries should also decrease fail probability,
> currently for exynos5 it is set to 3.
>=20
> Regards
> Andrzej
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-ex=
ynos5.c
> index bea6071..a01c1ae 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -130,12 +130,32 @@
>  /* I2C_TRANS_STATUS register bits */
>  #define HSI2C_MASTER_BUSY			(1u << 17)
>  #define HSI2C_SLAVE_BUSY			(1u << 16)
> +
> +/* I2C_TRANS_STATUS register bits for Exynos5 variant */
>  #define HSI2C_TIMEOUT_AUTO			(1u << 4)
>  #define HSI2C_NO_DEV				(1u << 3)
>  #define HSI2C_NO_DEV_ACK			(1u << 2)
>  #define HSI2C_TRANS_ABORT			(1u << 1)
>  #define HSI2C_TRANS_DONE			(1u << 0)
> =20
> +/* I2C_TRANS_STATUS register bits for Exynos7 variant */
> +#define HSI2C_MASTER_ST_MASK			0xf
> +#define HSI2C_MASTER_ST_IDLE			0x0
> +#define HSI2C_MASTER_ST_START			0x1
> +#define HSI2C_MASTER_ST_RESTART			0x2
> +#define HSI2C_MASTER_ST_STOP			0x3
> +#define HSI2C_MASTER_ST_MASTER_ID		0x4
> +#define HSI2C_MASTER_ST_ADDR0			0x5
> +#define HSI2C_MASTER_ST_ADDR1			0x6
> +#define HSI2C_MASTER_ST_ADDR2			0x7
> +#define HSI2C_MASTER_ST_ADDR_SR			0x8
> +#define HSI2C_MASTER_ST_READ			0x9
> +#define HSI2C_MASTER_ST_WRITE			0xa
> +#define HSI2C_MASTER_ST_NO_ACK			0xb
> +#define HSI2C_MASTER_ST_LOSE			0xc
> +#define HSI2C_MASTER_ST_WAIT			0xd
> +#define HSI2C_MASTER_ST_WAIT_CMD		0xe
> +
>  /* I2C_ADDR register bits */
>  #define HSI2C_SLV_ADDR_SLV(x)			((x & 0x3ff) << 0)
>  #define HSI2C_SLV_ADDR_MAS(x)			((x & 0x3ff) << 10)
> @@ -437,6 +457,7 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *d=
ev_id)
> =20
>  	int_status =3D readl(i2c->regs + HSI2C_INT_STATUS);
>  	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
> +	trans_status =3D readl(i2c->regs + HSI2C_TRANS_STATUS);
> =20
>  	/* handle interrupt related to the transfer status */
>  	if (i2c->variant->hw =3D=3D HSI2C_EXYNOS7) {
> @@ -460,8 +481,13 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *=
dev_id)
>  			i2c->state =3D -ETIMEDOUT;
>  			goto stop;
>  		}
> +
> +		switch (trans_status & HSI2C_MASTER_ST_MASK) {
> +		case HSI2C_MASTER_ST_LOSE:
> +			i2c->state =3D -EAGAIN;
> +			goto stop;
> +		}
>  	} else if (int_status & HSI2C_INT_I2C) {
> -		trans_status =3D readl(i2c->regs + HSI2C_TRANS_STATUS);
>  		if (trans_status & HSI2C_NO_DEV_ACK) {
>  			dev_dbg(i2c->dev, "No ACK from device\n");
>  			i2c->state =3D -ENXIO;
> --=20
> 2.7.4
>=20

--epoparvazvjnwfxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAliJENkACgkQFA3kzBSg
KbZGfQ/9FGcgpLbk0kFe3PTEW7oipqRHgu09pckpygYNuquoY9A1UmTr8PiF6/26
iY+7Scy0xvErJuzihqnBvZvHu4CR3oNz4s/ku5pT4dLE1V78gqvA4JCc/pJu9S1J
c57yg/mF8GaS4hjdOwGRnR6s5LuohM8g++R1jQ2dl6o3ZNZtwyDz2RpM5/1HcHGf
kmJKafM4fNEXXpvVqYxiRFrTL6sOWbYhrpcqUjDLvvvbhon4A/iObVIRurnXjN+o
XhwSsSDE3lsXbbnyJij316OmSCWGi/MsglM1XziJadZD2argr7WbMn23WjLDTQ9n
Zhk2t3IPi3Qh5fg5BtGzm6mpWzTP2neibNYD0sXLB3UfhQqXvw8hwsVn5V7HLbhj
mRcFpxO00yPdPG2daz7r1eH6rWG/BJtDoYgLsEzRwzx1BWyFBWsG45hxIH+Nrrdt
XjGM77SicNi3BposQkfXnRRV6Pb3ljzyG6OFyvWz4dkkzrPMhl+vEOui8fIu4xPD
Ez39yNoLpH6C19HdMn1fi0aC62Bn6m/sXA6BY+vovLme5CJNxOarWzQIv4FLVFuJ
Jc30wiDCzTp8/UAvmWS4I6Rlj43SzmME32Bc89h6xjQnb5+yjqWWuY1TQ9KXM/5G
Oip/3cOPtvllZS9tEYEiI7v1Q32YKtsTCnc8EEkzRMDD9n6M1VI=
=GiHJ
-----END PGP SIGNATURE-----

--epoparvazvjnwfxq--
