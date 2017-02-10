From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: fix arbitration lost handling
Date: Fri, 10 Feb 2017 16:49:27 +0100
Message-ID: <20170210154927.wypbqfnfkt52wvnc@ninjato>
References: <CGME20170105120727eucas1p2b9452792b7d13d551974305b478a26e2@eucas1p2.samsung.com>
 <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
 <20170209162736.nfyfd5dpjkjq65w7@ninjato>
 <1b67bbf6-dd31-c473-8284-dba9a0ffe440@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bklvqca5xfslezzy"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:47569 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753115AbdBJPv6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 10:51:58 -0500
Content-Disposition: inline
In-Reply-To: <1b67bbf6-dd31-c473-8284-dba9a0ffe440@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-i2c@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org


--bklvqca5xfslezzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 08:39:58AM +0100, Andrzej Hajda wrote:
> On 09.02.2017 17:27, Wolfram Sang wrote:
> > On Thu, Jan 05, 2017 at 01:06:53PM +0100, Andrzej Hajda wrote:
> >> In case of arbitration lost adequate interrupt sometimes is not signal=
ed. As
> >> a result transfer timeouts and is not retried, as it should. To avoid =
such
> >> cases code is added to check transaction status in case of every inter=
rupt.
> >>
> >> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> >> ---
> >> +
> >> +		switch (trans_status & HSI2C_MASTER_ST_MASK) {
> >> +		case HSI2C_MASTER_ST_LOSE:
> >> +			i2c->state =3D -EAGAIN;
> >> +			goto stop;
> >> +		}
> > Why not using if() instead of switch() as in the rest of the driver?
>=20
> Following reasons (not serious ones):

I see. It is probably a taste thing, but a switch() with just one case
in it looks like something has been forgotten :) We can change it back
to switch() if ever more states need to be added.

Given that I am not super strict with the 80 char limit anyhow and it
will miss the limit by a few chars only, I'd prefer the if statement
actually.

Other than this, I am OK with applying the patch for 4.11. Can you
resend with the above change?

Thanks,

   Wolfram


--bklvqca5xfslezzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlid4QYACgkQFA3kzBSg
KbZRSg//RG4On9zu0kpyrlNo7oPf5weg3sHmUKuMVeIVbLxWuXEO0UAArqAkygjO
T+tZ+2RMSYyqKHC7xe3cpCBt01CyNQLF/PLAPqu/TjOf0ssCI8qFjKuRrbmshqUQ
PQp4IOOi+lFGyDgwA6grMGSz3sJ4LYE1dzZQg7U8eVOrhFVNUQHrSmf6/y5c540+
+umuGynqBZo9QmW9mU+QAx1LPG+3zSshKfg5dclOiwmXoQWQkUOecRtJeg+b0rbh
ptnGePEI+79q4Sr6fdoaabhNpKiPE4PWbWCFGewy3p5R7t2j4jxZsb/8goNW39ZD
MA0+JkasAOU6IVxhsJOKZTPAy4db6w7cKmTs0xun/GYYq5pNlvhs7xyW33JqINVR
Tajr2VL48I9XR6usUlfS1V1gkbmJwlFpzmKay84tvuSHeGFvfgOEAi2qADLTzZR3
qXJ/Gkrom0DkrD0cZ/u6SAZxiIN6V5D0UZIcU9fBCfmVjyAEYdxL2GgIWDnh3Qws
OqeGzTbhNMQa2cC3wS9/51qENprWKUbks4Fiu5CmbmycW+31/r5CwjG1/TklZWXN
VcwzogXSpd3cfYr5VJ16S9eCQWIlDffZiZjVlHad9RYjPLuNl/IdpoVjqnyDVuwC
CZL2HjyvHeqmjwf9OxxWhD85TbG1P1MIDLIHitI4Sqw6oZCAR44=
=7JyP
-----END PGP SIGNATURE-----

--bklvqca5xfslezzy--
