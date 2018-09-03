From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/2] regualtors: Fix suspend/resume issues since v4.16
Date: Mon, 3 Sep 2018 16:16:43 +0100
Message-ID: <20180903151643.GP10302@sirena.org.uk>
References: <CGME20180903144947eucas1p2039e13961d8bfd21edcf1f1d152a5a12@eucas1p2.samsung.com>
 <20180903144937.16507-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FbmEh7Ek6NM6xKh/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180903144937.16507-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.chunyan@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--FbmEh7Ek6NM6xKh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 03, 2018 at 04:49:35PM +0200, Marek Szyprowski wrote:

> I've been really surprised that no-one noticed those issues for almost
> 4 kernel releases. Please review my fixes and apply to v4.19-rcX if
> possible.

I suspect this is down to relatively few systems having devices with
suspend operations, and fewer actually ever suspending in use.

--FbmEh7Ek6NM6xKh/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluNUFoACgkQJNaLcl1U
h9CNpAf+P2OEKKAyn9WshbzavcLbwFirZi2c86bl4YldaC4/rhA5hNqE7VLVoFGP
FBon9ZFY9yrtDsHYwICL4kCtM3dVp4Ku0p6ylnoWHpl+1DPCLRGYeSnCzbvUQkgJ
z97OyDJn9M/rVu5Ma4BblVL/2JiyIei99FRZRIFXQslJy8kKCsd5oCwnTUvfq8JT
OrdEvs2rVuXL8zQs48UQnd4CJ+G+QwVgwseg/iAlxNAzXAtjMed/Z2fSkIev6GrZ
jo8TMTTkQ6hzsmse5yoo8UQ/UV+roVzrqZGfMOTnsQM08qByAfBCL1BdQ5vd6G6R
vWcTsR0QToJHc6kUE5Hrkmytpii5tg==
=Cumb
-----END PGP SIGNATURE-----

--FbmEh7Ek6NM6xKh/--
