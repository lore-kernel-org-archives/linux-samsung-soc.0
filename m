From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH 0/3] ARM: EXYNOS: Add generic PWM lookup support
Date: Wed, 12 Sep 2012 14:17:41 +0200
Message-ID: <20120912121741.GA3491@avionic-0098.mockup.avionic-design.de>
References: <1347449612-382-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:51757 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755024Ab2ILMRq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Sep 2012 08:17:46 -0400
Content-Disposition: inline
In-Reply-To: <1347449612-382-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tushar.behera@linaro.org, patches@linaro.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2012 at 05:03:29PM +0530, Sachin Kamat wrote:
> This series adds support for generic PWM framework which requires
> that the board setup code register a static mapping that can be
> used to match PWM consumers to providers.
>=20
> This series is based on for-next branch of Kukjin's tree.
>=20
> Sachin Kamat (2):
>   ARM: EXYNOS: Add generic PWM lookup support for SMDK4X12
>   ARM: EXYNOS: Add generic PWM lookup support for SMDKV310
>=20
> Tushar Behera (1):
>   ARM: EXYNOS: Use generic pwm driver in Origen board
>=20
>  arch/arm/mach-exynos/Kconfig         |    3 +++
>  arch/arm/mach-exynos/mach-origen.c   |    6 ++++++
>  arch/arm/mach-exynos/mach-smdk4x12.c |    6 ++++++
>  arch/arm/mach-exynos/mach-smdkv310.c |    7 +++++++
>  4 files changed, 22 insertions(+), 0 deletions(-)

These look great. I'm glad somebody's starting to convert boards to use
the lookup tables. Eventually when every board has been converted we can
transition to the new API by getting rid of pwm_request() and pwm_free()
in the user drivers and using only the counterparts from the new API.

All three patches: Reviewed-by: <thierry.reding@avionic-design.de>

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQUH1lAAoJEN0jrNd/PrOhlKAP/ivKIXdb6Wke/7I1oeW8zwXt
BPjRZNq6B3F2CsPn5iBw/mCxDMjgXuixDvBo0OhOVvDbKdnVdGqTudV3hVXa6qk0
TzkcvRSGNsMQ8AEa9FkUqexWgJ3vjBhWUfy0IQLos1leudCweYal5/y02t4gI/Aa
kc5i1y2JgDFOYjy5Bo1tMFtZ/SnROCkyMQOsoNeRZvJjf9oGMgXTlsSkVAh8LmSA
lZElcbpR/K+20ino8+ztzQXb3U9Zuc7H8BPgEjVZKe0H8NOPgycreJKfiusIVNNF
dOkjumJ3ao8ombaA07T8gJLsOHQboD60eIAxXG2H1AFJZ44Cen/D2EjhjAeyyD0e
xIugdCJkHydKBR/pU5r9cXKLcJUWj4eWNqdiGR8/81TuQ3LW6DBcrdbF45hNd/xM
hXLCefO3fFsezoyCDgQhM4GriJqhTRQlzALh0vdvXsziiBZHagn9+mPZSG1UVUUI
qDL59N5Na5hJJmtKrg3z1jr8F3nVWOSj5YNByGTtjy3gUCf5fPUaNeYqKhTpBIyW
X3y8utjTRCRxXlB3EQcZAnhHj6Y81geVNUZEg3qNFFwseDgiavzOsr/EDnMOSeZ8
++Iv1NatYPUrNM7jEdpGc9OE7Q2Qt8NY2Mb7jtfkvo3HeHku0Fka+i5OrLAS8HbZ
Px/tY6kCgm6ZJvmkjZhA
=0R4r
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
