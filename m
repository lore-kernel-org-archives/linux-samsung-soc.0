From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH] ARM: EXYNOS: Use generic pwm driver in Origen board
Date: Thu, 9 Aug 2012 11:15:26 +0200
Message-ID: <20120809091526.GA693@avionic-0098.mockup.avionic-design.de>
References: <1344503035-18127-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:51178 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758Ab2HIJPe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Aug 2012 05:15:34 -0400
Content-Disposition: inline
In-Reply-To: <1344503035-18127-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org, Jingoo Han <jg1.han@samsung.com>


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 09, 2012 at 02:33:55PM +0530, Tushar Behera wrote:
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-origen.c |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/ma=
ch-origen.c
> index 5ca8030..4c4048d 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
[...]
> @@ -613,6 +614,10 @@ static struct platform_device origen_lcd_hv070wsa =
=3D {
>  	.dev.platform_data	=3D &origen_lcd_hv070wsa_data,
>  };
> =20
> +static struct pwm_lookup origen_pwm_lookup[] =3D {
> +	PWM_LOOKUP("s3c24xx-pwm.0", 0, "pwm-backlight.0", NULL),
> +};
> +

This might conflict with some other patches that Jingoo (Cc'ed) is
working on. His patches were going to rework the Samsung PWM driver to
register multiple PWM devices per chip. In that case the s3c24xx-pwm
device should probably be modified to use .id =3D -1 and then the .0 can
be dropped from the provider name above.

Otherwise this patch looks good to me.

Thierry

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQI3+uAAoJEN0jrNd/PrOhCOYP/RmZVeyBNbq0lHPVNxOQTIST
Fjv6SlL6Nfp06J0uJ6bb650x4w2z+NBdS2jVhqOKiOoHe7ap/OUSVP2muX7tW/Ax
YxXmHSMNGycSX7x4C64nxBD/8aowNVHttKxd2MVLxW4LmWaL9Rg1yrpgEkQPxJ77
a8gz5QyJ02v+Hn2icLh1SE0gzhaTZF6YymQ0im5msRDDdo1w+mbWV90doa0HtWxF
R55cYTCxylFw+7BKqyraISt8NVdxL79gUx1OVCKDrvGSgQCzjNkur4XkXIRsoRId
pd5lc/tfQweAD97sHzqO8poyfZcy5GyjFmfi9ZNKhuP6PqlsfBqZZdFR8WairKev
969LQVGHdKE0AfQ6JcESSwUWsXFcQkan+96XOZ/Hk3Zs6/A6GFwRONmTfjPUrbsg
1KnInCn6hOj7o8XMF7y6yO+Kz6ZxhCTt3xiO8KKPq4iT2tIdBhwG6pFzTJdRX3op
tP+BbamMop3QEFWcCICOQNpBkV+YXqZ96V+NhkF5iH2e/IFRvXFMFLQFxtF6jN6N
7BQJhYI7ywH9VGT9M9SWzQjxesToj22Aq96cLqVi5DImC22M8kw5q2PdoLTu0OoX
HCZ1r9sUyHmR8ABstVche2QgpMZy0CnYH5MdugtYjOvpf7eu+unbuxPpSPSKAsdR
3kP/x/aHHVHc0ZenRuP3
=iSsz
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
