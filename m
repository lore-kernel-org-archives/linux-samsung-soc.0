From: Mark Brown <broonie@kernel.org>
Subject: Re: mainline boot: 8 passed 1 failed (mainline/v4.14)
Date: Fri, 24 Nov 2017 11:14:27 +0000
Message-ID: <20171124111427.zzfi6dw27fm6y2rb@sirena.org.uk>
References: <5a16144d.0be9620a.4490d.4375@mx.google.com>
 <CAK8P3a1OWob9We9zfvhBRN=fQYsw+nkZpqMJ9z6Q_A-N9_V3rQ@mail.gmail.com>
 <CAOesGMgdqNrZbF5dOEdHKmuNVZiiFoV0_ipsPBi5HkGZUgYm_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="64quzi4ovsxljnew"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52730 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752848AbdKXLOi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Nov 2017 06:14:38 -0500
Content-Disposition: inline
In-Reply-To: <CAOesGMgdqNrZbF5dOEdHKmuNVZiiFoV0_ipsPBi5HkGZUgYm_g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>


--64quzi4ovsxljnew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 23, 2017 at 11:40:21AM -0800, Olof Johansson wrote:

> Looks like kernelci doesn't cover CONFIG_SMP=n boots, so I guess this
> might be a new issue.

We turned it off because it was constantly broken and nobody really
cared - personally I'm not sure it's worth doing on systems that aren't
actually uniprocessor.

--64quzi4ovsxljnew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloX/w8ACgkQJNaLcl1U
h9C2XQf5AdimcbsGprSxqT2rppWQSK9WvYKAnTVQg0Ky1Oz82u1HnLqr0cV3qxcr
iaJlDUkDF4f+5eIFXrqe2bxDuYYC23ASIZzucqBD2L/kEia+EMATASLPjl3KsfQi
1qS+BxFvXb+CgULRIV+JtAv7v6oXuzozh7URkJ66H/DSXq8WCHZcdu8DAwrfQ9TB
2KeapV7EhivYJOunht1BQV+4f6FT9tcW0fiubkfSh0rRxK+M0D63HJPOD4G3rNFY
v4hahl4eBVs8edDqxp4pZ+WTUUe4SJMHoPAlpXlY45YNjsRDCm0Qz9COrCD1zSg8
zAcaW1F+fPKBBJfbidM1Qq8N75uS9A==
=kyGh
-----END PGP SIGNATURE-----

--64quzi4ovsxljnew--
