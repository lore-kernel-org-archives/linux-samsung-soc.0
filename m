From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 3/7] spi: s3c64xx: Do not use platform_data for DMA
 parameters
Date: Fri, 4 Nov 2016 11:12:18 -0600
Message-ID: <20161104171218.bnd6vahvvdttexxi@sirena.org.uk>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
 <1478276094-19135-5-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ipqiyristzcjm4w4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58796 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756888AbcKDRMo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 13:12:44 -0400
Content-Disposition: inline
In-Reply-To: <1478276094-19135-5-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, kgene@kernel.org, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com


--ipqiyristzcjm4w4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 04, 2016 at 05:14:50PM +0100, Sylwester Nawrocki wrote:
> All related platforms use either devicetree or the DMA slave
> map API for mapping DMA channels to DMA slaves so we can now
> stop using platform_data for passing DMA details.

Acked-by: Mark Brown <broonie@kernel.org>

--ipqiyristzcjm4w4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYHMFxAAoJECTWi3JdVIfQ2HMH/iI9PAyAVvRYBMd8+dPwU1y9
etRe/Zp87RSt3Hoovmdwu+BoY5P5u7rdWArrXxXIfbXYIYUmMDbSEBo7NmNqhPig
VR2+80x0rLCaflx6iwtJGvjeTfDzM9YfOowQNHje2XK2ledBv1OEKYHS0dMzt+ma
MwH3gPql/60t2a617zocCCJ6s8BzLzjIm7yGtln3BdbVRSyS+gbOchP7uMlDiHya
DdEuJhtp3OrfzoBj7ORr8/Jgc3Pi/a1DEXjOQvIL7MwhNeFjbGx1f8BVC5mYi+hf
kye18E35DYGbI/e+8BIoYBHwy2/3+zHZILPoA3c0Mpig4bLrQsTQr3K9w568XmE=
=ErZN
-----END PGP SIGNATURE-----

--ipqiyristzcjm4w4--
