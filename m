From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: fix arbitration lost handling
Date: Thu, 9 Feb 2017 17:27:36 +0100
Message-ID: <20170209162736.nfyfd5dpjkjq65w7@ninjato>
References: <CGME20170105120727eucas1p2b9452792b7d13d551974305b478a26e2@eucas1p2.samsung.com>
 <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hhrdxy2zlc3n2zmi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:45414 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753170AbdBIQ1j (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2017 11:27:39 -0500
Content-Disposition: inline
In-Reply-To: <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-i2c@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org


--hhrdxy2zlc3n2zmi
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
> ---

> +
> +		switch (trans_status & HSI2C_MASTER_ST_MASK) {
> +		case HSI2C_MASTER_ST_LOSE:
> +			i2c->state =3D -EAGAIN;
> +			goto stop;
> +		}

Why not using if() instead of switch() as in the rest of the driver?

And there is arbitration lost checking already with int_status &
HSI2C_INT_TRANS_ABORT. Any guess why it doesn't trigger?


--hhrdxy2zlc3n2zmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlicmHQACgkQFA3kzBSg
KbaDRg/+J990Pm2kGlvCqAsO9axyl+mWrgSBtbi720pZhqEzkaGEjw5TpIHlW+SZ
7p8VskscILQ+QvXCRbb4xY7+SzafAZsUmrfJz+c6WM8XIZ4JN3Gli712CoRmolVU
+fgUIqIpmsPwKyIXzFaQvDzrOoSgOtrgraTlxJcwZ+zyaevwMEaySGAU/f7IhB8o
4HK6EeVfxbdz/lfIZkHIY56cvJjaHwJvVt4CxypaeC9EZ7VKth/WpyX0x+Drg+C2
vpZqQqs/YmXfihYqcdnBjC4pGgUjgKLz0VbBCppoHeOQSg3R+0cxK8RZY2PCcJvI
sTHi+6c7l24CTK96LknIiXT2DSrA2Tztb+lm+Q2nlnV/48KTBUJjzTkHnTRihv1b
ka4se9Ug+FCy6e7FOIFuBH3I25QvYersGcdmRiYrTS53CN1Fn/4HF7S/mRsqjTPq
uVskxQbGBPEUoebhyyfWELJqMCMWvtndsGn0wDSMP+nDJ/SqiQl0kYA5VgduN1L/
MZb0o+VJ857Z8mJTtWBn8iAb0Rdxg/XmiM8EuEpIi/RLaUt70DvxQXbATehBEGDc
R8FIaRQoGZcXIeqpO3cxfCU+zyIWHrp5K2EyczQ5D7D0g7/a8FhDJ7FP0O/PEA5W
4OHjjehFVHOoJuyQ7BJgJN5oF45ReUtP4N+a6soui6ZggicHXRs=
=egU6
-----END PGP SIGNATURE-----

--hhrdxy2zlc3n2zmi--
