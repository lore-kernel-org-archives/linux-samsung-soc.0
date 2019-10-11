From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 20/36] ASoC: samsung: s3c2412-i2s: avoid hardcoded
 S3C2410_PA_IIS
Date: Fri, 11 Oct 2019 11:50:01 +0100
Message-ID: <20191011105001.GG4741@sirena.org.uk>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-20-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191010203043.1241612-20-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 10, 2019 at 10:30:04PM +0200, Arnd Bergmann wrote:
> The constant requires indirectly including a machine header file,
> but it's not actually used any more since commit 87b132bc0315 ("ASoC:
> samsung: s3c24{xx,12}-i2s: port to use generic dmaengine API"), so
> remove it completely.

Acked-by: Mark Brown <broonie@kernel.org>

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2gXlgACgkQJNaLcl1U
h9DRDwf/Z97B2zjL3Z9O+QU4Fp9jlers2KrllaRLXhvKAvYYwb8JNWOGuedCmQDi
C6Gj9aBSXHmzjjFCM08/QJMG8u6TcM5H2gCjEVFOiRCMqP5DPX5qCIiiQ0SnBrdi
G78NJlKJRTR9kLnVYFd8DRx4fOHelhaH0X7n5EPUliwMpydcV81iL9zttP39m5+h
bTSe5rNrUxE6oNaq/1Ud7YFogrTUUSHQugLgRHDwsGakNFIYpP7HYvd9lYfAlX0C
dz+DUqy/Yq8FJMN3SUlsUyNx3X1LVOkKbKCiKbcwoYIaXy+YyNCPAja8eRtrWVZU
tdnsAgWDN5OszUmItgS481uI9UwV6Q==
=6yUg
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--
