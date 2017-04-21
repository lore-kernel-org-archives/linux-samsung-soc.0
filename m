From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: use core helper to get driver data
Date: Fri, 21 Apr 2017 14:04:24 +0200
Message-ID: <20170421120424.octcteilpvqcwwvf@ninjato>
References: <CGME20170224133606eucas1p2c3c6afb60b9e39ad501c1ddbdbfc180f@eucas1p2.samsung.com>
 <1487943360-6421-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2wsistkgdkisvz3j"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55326 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1038154AbdDUME0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Apr 2017 08:04:26 -0400
Content-Disposition: inline
In-Reply-To: <1487943360-6421-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>


--2wsistkgdkisvz3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2017 at 02:36:00PM +0100, Andrzej Hajda wrote:
> Driver core provides of_device_get_match_data which can be used
> to get driver data instead of custom helper.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Applied to for-next, thanks!


--2wsistkgdkisvz3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlj59UgACgkQFA3kzBSg
KbbypxAAiV49RwoUQq17RtQZEopMLHKVnDBSDiJJCENLKDKN5cCMDG9i/gOrTjR5
B42MMj8bbfxMynP0Ck5WnHuQumFuRt7y4Jqfs5pB2PBsFcWQHnwPfuRapb6T90sW
pybTCNdEuBOD0wFBlmXGi9XnK5HF9XAS9inRngeNMAfq6MnHmqsVO9xe3KeHteUb
p3O7KE7y11sILsv15oJlKcPb4y7BH77b+q1trJ4rPiAbxHzlPUbLM9104zfIiBp0
T3E+hKQyY2tjLRoCizkf8B0ywGBhK1oalSxq0GqbPgIwxLGrlHE8SKhzUxetqlNS
GaUYU534kTQdatchWmkLKcrTTHH3N+g0GXal8TjMaTdAi2EZExVXuGU3C6oOEzdw
TozGSgMja+c7WwY4YqDLm6x+YUETxUenKhxh7lUAJJ8Nd9RAeHGcL1IjKxtHU6qX
YxvjPDIkwB+qeF40em/NrgpJsMMGJNAyl+iFV9idL/f85ExcfZIz1uiuhgERhRrh
80TdWp186qn91cuo8YjmckboPhIUd/xJT5ma7YrhsOWnq/WTSSZ3RHC3UiIH5M6L
SV3XTRbIj1uxQkZXKzAzqrhBqCaVx/lFYE7PawBWIhbyB8SUkZD9w52ndY9U8quH
c1w5HIXJON98sJ2VH6fOXOcbEkxOXVslvaiZoiSlDzZvp2lDCo4=
=T88p
-----END PGP SIGNATURE-----

--2wsistkgdkisvz3j--
