From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm/pl111: add ARM_AMBA dependency
Date: Mon, 22 May 2017 09:23:36 -0700
Message-ID: <878tlolv1z.fsf@eliezer.anholt.net>
References: <20170522152058.3346428-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0972504370=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170522152058.3346428-1-arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============0972504370==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Arnd Bergmann <arnd@arndb.de> writes:

> The driver is written in a way to enable compile-testing without CONFIG_ARM_AMBA,
> but it just causes needless warnings:
>
> drivers/gpu/drm/pl111/pl111_drv.c:149:26: error: 'pl111_drm_driver' defined but not used [-Werror=unused-variable]
> drivers/gpu/drm/pl111/pl111_drv.c:81:12: error: 'pl111_modeset_init' defined but not used [-Werror=unused-function]
>
> This removes the #ifdef instead, and adds a dependency on ARM_AMBA to
> only let us build the driver when the base support is enabled.
>
> Unfortunately, this requires removing one redundant 'select ARM_AMBA'
> line from mach-s3c64xx to avoid a circular dependency.
>
> It might be good to allow manually enabling ARM_AMBA when COMPILE_TEST
> is turned on, but that should be a separate patch and may cause other
> build regressions.

If I understand the Kconfig, you're effectively disabling the build on
COMPILE_TEST && !ARM.  I'd rather that we just fix up the warnings, so
that people can keep build-testing DRM drivers:

https://patchwork.kernel.org/patch/9737857/

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkjEIgACgkQtdYpNtH8
nujnVhAAh+4VgXq9RCRFMbTU6W1A/lQt1/jR4qx9jv4p+kbDA0pk1Y3h1lhsb6oK
NIdNNz555kLEN8OxDqlD0CqyS8zMKjnsvv0iw2E9yoQ1XnvyOEDwsDASZiw2V4AX
zPn8pPLYHF+aOcmrAJLPTsJb3nu+Dqq0qQYMEWPrgHa45k5yRXL2X7RbS90Bw3B1
KzV/GBqKdT9PflNHYCt+ZugQQFC+gUbkGaVZGn5+oYS8zrwozRZ8QEAmk3lDZruj
2K+jbwuXjuN4oGUsc5LsXB2NJBVBqgdH810Fo7Eh+lod6jKklhciugXs1qyUD69+
UYgg3+G+GZubRdxPQqUJj+u+FncwtSWJ8S/e9qmkogbro+FMgFo7JWQ3uw15Ff14
ocWnv4VUqKaqIDlklHYltpg1elOycaxbdSl9ULvo5dTuDIbxnL7/vKQtlY207k31
5xySr7+AM6KStuOlpfNqNTt7I5OAqFqL0R8piFWCo4K6EGpmY7Bhtgpm8b83NC+C
gITe+KZvjJBLnhczsQVYv8nPTDr3+F3DzN/2/0x7Dm1jrqnR87L4dLjIU4BJU8NG
EE4GCzDxIE9aghlvCAmoWd158lZZtfSLH4aa62B1SS7VTfOmd+xyYfkMqt8rKr4n
OJb/4Ew+W4Z2225JDdp3SgtnQbsqXZT2v918Wx6ZOqljBqU95Ag=
=tQO2
-----END PGP SIGNATURE-----
--=-=-=--

--===============0972504370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0972504370==--
