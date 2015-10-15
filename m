From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3] i2c: s3c2410: enable RuntimePM before registering to
 the core
Date: Thu, 15 Oct 2015 13:44:38 +0200
Message-ID: <20151015114438.GD1546@katana>
References: <1444461874-2841-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444461874-2841-1-git-send-email-wsa@the-dreams.de>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2015 at 08:24:23AM +0100, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> The core may register clients attached to this master which may use
> funtionality from the master. So, RuntimePM must be enabled before, other=
wise
> this will fail. While here, move drvdata, too.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWH5GmAAoJEBQN5MwUoCm2U5gP/R/p48pNNKHAg59QtzTOO8dd
+RwJQIDWWD1HOXz4m0MUMpZBHcsVrIRB5tcmOG1mfuHjCWZJj1NH6uF789iUbSWq
bXGKkNg+znKn9qNhxnxrehrp9cCxLIkuWrcc+zAO6fP3SS9r2LHgrbRfIhmZNeCy
vN0tWYTVUellpYGvCg7Y3aNPO3ikl8owSqp+CN2AIINSkBrqbDbr/ywF9KXMXD8d
DNwDid76j78RFfKh0xJXXp0u2KIjMwE6EwC0SVXHgXVuiIIYLlBsWrzXJwnbLKJT
TPCYw33gNeVpwsG0QEY5WJNCIZ9XWAaayzeWJ95GPFIb/9wXeNYnU7pDRw8HSYhN
3AbpzoZk1+wj1FmMUYF13WImf881pK6p3XAjTKpQU2vdAvSX0n+ZC0SbnORufNG7
oMpqOF4AGOqyK0feR/62DDS6BwlVRmJ5MzyiHGrSoI25OaCgCacTwPIpDybmQJlT
01XyeD8gFlaFds6DvuoXnuk0OAQ2a0LglYL5iBj/EL6gBKBBJmnhJNvvSarEIaAG
qAzqDwCoMelA78R/Ao9p/mEDjFdIV34twThFX4frEk0AIWW7JS5lBq4eH8Bxap/c
F4ZdZUJXEszU1Ug0hCOwChimJmRKV9YbOqbJkt5OvLFU4J9ivDOLDOngqxuntwFX
+P+IrBTG/Wmbd8bMIW50
=4KEj
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--
