From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160607 build: 2 failures 9 warnings (next-20160607)
Date: Tue, 7 Jun 2016 11:58:23 +0100
Message-ID: <20160607105823.GT7510@sirena.org.uk>
References: <E1bABXS-0001YX-Cz@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2wYUONsACSj9OMJp"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E1bABXS-0001YX-Cz@optimist>
Sender: linux-next-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--2wYUONsACSj9OMJp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 07, 2016 at 08:35:02AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h:19:27: fatal error: asm/dma-iommu.h: No such file or directory

introduced by 04f776734c4e (media: s5p-mfc: add iommu support) which
relies on a header which is only available on 32 bit ARM.  I suspect the
driver should be using linux/dma-iommu.h instead.

--2wYUONsACSj9OMJp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXVqjOAAoJECTWi3JdVIfQh4MH/i49Cf1+KPp0cQQ7MH0lkjC8
NFPW96PWovDxABjXujEQdj7CnbGnIYHMelyh48aJ+9kUujC5OGQZEgaPS+X5ikRU
j3gwH3SL58ru3OPl9DzoM+EcMe5yuyqcttVfSeIa+hT67fVlf9iW3L736YriHNw8
e3JXO2z0aWOf4Tu+iPf5mnus4Mz8ZARLiOH7+5Ew8Xt5rMGGio85G/gLHJhnVhPn
yJvC0YYiuq5rqFxqjR1csSapRyPX3R9k1OEpB5Ce0g+M0+nFWWy6/OXKhgaXAvH3
mrJ49+c4fmzW7T9WxYja+omgGFdoNUuxCRFzk288qkgsaakLOR1iH7gNmS8+iv8=
=gFE4
-----END PGP SIGNATURE-----

--2wYUONsACSj9OMJp--
