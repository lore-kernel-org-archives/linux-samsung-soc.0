From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 2/6] ARM: s3c64xx: Skip legacy EINT setup if
 pinctrl-s3c64xx driver is present
Date: Tue, 16 Apr 2013 17:26:43 +0100
Message-ID: <20130416162642.GN26958@opensource.wolfsonmicro.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
 <1366060483-20342-3-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p1Od3smaOkJqivj4"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:40522 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S935469Ab3DPQ0r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 12:26:47 -0400
Content-Disposition: inline
In-Reply-To: <1366060483-20342-3-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>


--p1Od3smaOkJqivj4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 15, 2013 at 11:14:39PM +0200, Tomasz Figa wrote:

> +	* This gpio driver includes support for device tree support and there
> +	* are platforms using it. In order to maintain compatibility with those
> +	* platforms, and to allow non-dt Exynos4210 platforms to use this
> +	* gpiolib support, a check is added to find out if there is a active

Cut'n'paste error here.

--p1Od3smaOkJqivj4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRbXu1AAoJELSic+t+oim9y/8P/224LMQfrOik+F9mutaNRheZ
x//GsxFncIGULQeAMCZ6CGw6y/AHVIVDfdABuTlBLwyQ2yiE97PmagTeVzVZvU28
O7Ln6EH27ipNUu7xg1mzP2CaowGFjKD1fgSY5S+zUbU5nksdrmhAdSNKD10Vyyj2
MJdb3VrYfQngHNWs81AOMWwQsJgkuAcEatlzFEWBkIrJW/6VuXc2otGbBTRwxxDx
VDIZtylsR9c+1okZ19S8ksvlUy+Sc8p86fTo2EntYYe6G5vykHMekiJGuSEvgky8
QJ6dm9YoV5TfmoKY/yNUD3Ilb4koc4BgzSXGRWyJPFOMjKQm2LotmPfNSlxbpToN
tX9DpGYKyLoxnKo84wgMu2I6nd7NENK4FVotaoej04fq96p84twj+Kd/bL8GyCu4
4YEm7+KyFLYDjsIoVttseOUcJ8Kf0uD9MGF4lH+/XaOOtqyuv5XqV6TlBeK2hUzH
3aLkqfBSRd6XGPbKStRZzUszNkhbRnsULkdfRk/GXGpbT+u//hd+Wo9USqysiUUB
wiMAomC7C6y8D17anwc6/8JQGoaTj/KT9IuPOB4/DJlRr7sHfTdX7VKHjCCHuyN8
QYEFflLLcWLEIXn0v94Q9yftJ3/dihrHhClXv7Acmj1qLlle0fGjNhVenMHEQCoz
/Q4Qd9L7i6B7uTjBDwRa
=mIH1
-----END PGP SIGNATURE-----

--p1Od3smaOkJqivj4--
