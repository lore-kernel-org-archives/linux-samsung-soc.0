From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 3/6] gpio: samsung: Skip legacy GPIO registration if
 pinctrl-s3c64xx is present
Date: Tue, 16 Apr 2013 17:27:50 +0100
Message-ID: <20130416162750.GO26958@opensource.wolfsonmicro.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
 <1366060483-20342-4-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RHdRtM27np9fZUoh"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:40536 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S935469Ab3DPQ1z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 12:27:55 -0400
Content-Disposition: inline
In-Reply-To: <1366060483-20342-4-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>


--RHdRtM27np9fZUoh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 15, 2013 at 11:14:40PM +0200, Tomasz Figa wrote:

>  		{ .compatible = "samsung,exynos4x12-pinctrl", },
>  		{ .compatible = "samsung,exynos5250-pinctrl", },
>  		{ .compatible = "samsung,exynos5440-pinctrl", },
> +		{ },

Strictly speaking this is a separate bug fix (though I see that's
already in -next separately anyway so whatever).

--RHdRtM27np9fZUoh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRbXv/AAoJELSic+t+oim9okoP/iOfcBgxgwXavwPmLNmnGv3C
qRThvoppUHayvybzpMnjag9DfZsqlLpI3Eq7Ww0F5kTJgeBxzTh3s4q9zvVPWABq
pHvC6cSzGvhsWTr8Bf/ONyzTr67NuxcAj2l5TocLcUqPj+kdkUWXT9wnfwC3rorP
7d1kAEe7wgUAEGhQyaLjqI+LNLu68nI3/5tUcrcxLIl0fUNYUJsP1eX9wxNDvQrf
LUxWQ/1amIG4a7lpeqVnCVTBM7M63422EiGXhcIeoZxAbndh3p8t68RstEdCzzmy
eRoZQxlunqbOEbjfRj+ggTjGaRDQYG91pnAlU7sOG95xm1vJ2bEI02M6BQ/IEziO
KFKP00cTFhyF88cH0lHXjTJ3ZF/BGUxcHaq68kzeYKQGDt5XUqdqA0UQzsC477Ox
0q+I49P3+fNoKLNtQ5oB4dJVU+jc0TS5CbUHvOXJ5ygTmH+fR0/2usGVZiOJEFiw
34cIk47VsAMdP7JU0RO0ZfHUS8Oz66jcPzFw++fCMIPfJpykVi7wnc1GDB6B7uB3
79m+H3RF82H/NDSiOz5FrCQj2zO7lIH8J435mAb3vfVFN9Rz6y3zFDJqYYtZVRrG
jI3U0/QwmqtQaWMaieGhGGeHLWTyB80u5/tNlLrN+sqCgFf+xxrP/HkAsTp0p7q1
+Zy0JPgqhH3bFG8+gHeO
=Vjau
-----END PGP SIGNATURE-----

--RHdRtM27np9fZUoh--
