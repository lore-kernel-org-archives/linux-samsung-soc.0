From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [2/3] i2c: exynos5: implement bus recovery functionality
Date: Thu, 18 Jan 2018 00:30:39 +0100
Message-ID: <20180117233038.t4jz7k3456siu7ef@ninjato>
References: <20171130143007.30258-3-a.hajda@samsung.com>
 <CGME20180115205258epcas4p10580d705351de6206070a670e9e4caca@epcas4p1.samsung.com>
 <20180115205250.p5mbn3ib2paj53pv@ninjato>
 <8d4c93bf-c27d-7a64-fb4e-3957760ff9b7@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yz3antb73jrtcdjz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54114 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752901AbeAQXak (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jan 2018 18:30:40 -0500
Content-Disposition: inline
In-Reply-To: <8d4c93bf-c27d-7a64-fb4e-3957760ff9b7@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>


--yz3antb73jrtcdjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Really? READ_DATA looks like 8 clock pulses, but you need 9.
>=20
> This is why I have used word 'similar' :) Unfortunately chip does not
> provide method to send exactly 9 pulses.

Pity :(

> But according to [1] it is the worst case scenario, usually less than 9
> pulses is enough.

The I2C specification says "should send nine clock pulses". A recovery
mechanism which "usually works" doesn't sound very attractive.

> Another solution I see is to READ_DATA twice, this way we will have 16
> pulses.

Can't you clock a single pulse when requesting an ACK? Or does READ_DATE
clock an ACK so we might end up with 9 pulses after all?

> > Bus recovery is only defined for stalled busses, i.e. when SDA is stuck
> > low. It is not a suitable method to deal with general timeouts.
>=20
> You are right, I though I do not have precise info that SDA is stuck
> low, but I guess status HSI2C_MASTER_ST_LOSE indicates is, I will check i=
t.

Thank you!

> >> +	i2c_lock_adapter(adap);
> >> +	clk_enable(i2c->clk);
> >> +	exynos5_i2c_recovery(i2c);
> >> +	clk_disable(i2c->clk);
> >> +	i2c_unlock_adapter(adap);
> > Why do you need to lock? Aren't you protected by the call to master_xfer
> > which then detected a problem?
>=20
> If the problem is detected in master_xfer driver uses internal function
> exynos5_i2c_recovery,
> but function exynos5_i2c_recover_bus is called by i2c_recover_bus, and
> the latter can be called from any context,
> this is why I have added locking.

But the wrong one? The adapter lock is for serializing access to the
adapter using the I2C API. If you need to protect register access within
your driver, then you need the lock within struct exynos5_i2c.


--yz3antb73jrtcdjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpf3J4ACgkQFA3kzBSg
KbYhXBAAqquSI37KWPXL5aP7Qp9GenS4ylPQe2A0kYKKFKiqPFODtk6i/9vMG+vV
sgQVgx211hJIZtxjKkgyl/qebyOBnuuqPA9EE8QjDA0y+sBDEU7Q0UzOzKr3s4ni
A+8QG9DQOajtXeQXi/ZAk76TPS+Y8GihwjMr9/hq80UTQ60W6FF4BzDLyoU68r5V
2APUjTBwRqVvLtYNNlijh5DBNwOw/wlcBI4nik4zlSwRtIbptjQpXbRaG+Ak6NCX
aZ91Hu9HTzHLMDcObIPIvnOWGMrChfYpSPqB3YjJTLZDty3ZVcG6xO44NZsvU+/t
71pwM/fbbvzBqfW03uIhbv6JX6zT6K40F1TtwwxbS9wROuMbqre7VVNi+/GHK9A9
hUbLgsof9FHkQB7Nq7TYQm+gFOFCFswJzkuCtjz44+/T4U6j2+qiBCNdCjEZoDri
zJorYwNMg8gsRhgj3ezDQZfZm4DVlSdwPGwi6PbwoXwQKRwhRaf+Ida190m4JQvl
UDIGwGKIFu+tdBE3yL4JqRcp9Nei3runfwuFLuoREJdOAcSPcK2YBDN7UG7MnyTm
60YPWAI9MMT1zeBR6T/n84RT334Z/erNxBiR5uZbZ8qyY1kpRiM/+67XiK/AHPgm
c7KgR+JqziidhZmaK0byrNxOIw99jxDP/Icfi7YX5b3h7LRG0Jk=
=P5Vh
-----END PGP SIGNATURE-----

--yz3antb73jrtcdjz--
