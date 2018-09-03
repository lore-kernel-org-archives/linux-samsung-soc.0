From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: Fix useless O^2 complexity in
 suspend/resume
Date: Mon, 3 Sep 2018 16:09:11 +0100
Message-ID: <20180903150911.GO10302@sirena.org.uk>
References: <20180903144937.16507-1-m.szyprowski@samsung.com>
 <CGME20180903144947eucas1p26391f4de6bd46d18cf51f075e6f22e2a@eucas1p2.samsung.com>
 <20180903144937.16507-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GPOl6LAGMgeiWDic"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180903144937.16507-2-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.chunyan@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--GPOl6LAGMgeiWDic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 03, 2018 at 04:49:36PM +0200, Marek Szyprowski wrote:
> regulator_pm_ops with regulator_suspend and regulator_resume functions are
> assigned to every regulator device registered in the system, so there is no
> need to iterate over all again in them. Replace class_for_each_device()
> construction with direct operation on the rdev embedded in the given
> regulator device. This saves a lots of useless operations in suspend and
> resume paths.

This would've been better as the second patch since it's an optimization
and not so urgent for stable.

--GPOl6LAGMgeiWDic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAluNTpYACgkQJNaLcl1U
h9BGjwgAhqUvyqpcWaCsmLIX1szG4WYuI0Ua2w6alah6E0DCv9DmKhmQIaM1183d
0zl5xuVGz+r5NJs6y0BcBNwBCeZ0hCMjyBAlEGntirc0MPhhtatDhVnbO89yESEK
jrIOTDJPDw1A4pZbBdTQ+6Wlr6HP1nABPEYS0bZXVIPC8W3BLcJPqOtM6t4XVULc
C6eNPp4h54OKLzLVSiiOVx1+NZoF7BMEipOn1KMMTlwjHQVi/foQPO8+pd0j2YSl
UcTkbxXQnCrc0K09ifDpi7b4TRBZOs6eieSZExbd53TeMSCRzcEP464TU11fcTyN
ymaU7JRgZq0GtuQ0E2frYjvkhYOJsw==
=HzOk
-----END PGP SIGNATURE-----

--GPOl6LAGMgeiWDic--
