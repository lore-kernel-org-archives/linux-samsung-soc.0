From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] S3C2443: Add devname for hsmmc1 pclk
Date: Fri, 14 Oct 2011 16:14:25 +0900
Message-ID: <086101cc8a40$e79edd30$b6dc9790$%kim@samsung.com>
References: <201109282159.35240.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40253 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755068Ab1JNHO0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Oct 2011 03:14:26 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LT1007K4O3RQG30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:14:25 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LT100GG4O41W720@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:14:25 +0900 (KST)
In-reply-to: <201109282159.35240.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> S3C2443 uses hsmmc1 as its only hsmmc device and for S3C2416/2450 it'=
s
> the second hsmmc channel with the same PCLKCON bit.
> The hsmmc-if clocks on both systems already got a devname, as did the
> hsmmc pclk for hsmmc0 on the S3C2416.
> So to make it possible to identify the hsmmc1 pclk on S3C2416 add the
> correct devname for it. The sclk name on S3C2443 also is s3c-sdhci.1.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/plat-s3c24xx/s3c2443-clock.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/plat-s3c24xx/s3c2443-clock.c b/arch/arm/plat-
> s3c24xx/s3c2443-clock.c
> index b4b2fa1..6408650 100644
> --- a/arch/arm/plat-s3c24xx/s3c2443-clock.c
> +++ b/arch/arm/plat-s3c24xx/s3c2443-clock.c
> @@ -416,6 +416,7 @@ static struct clk init_clocks[] =3D {
>  		.ctrlbit	=3D S3C2443_HCLKCON_DMA5,
>  	}, {
>  		.name		=3D "hsmmc",
> +		.devname	=3D "s3c-sdhci.1",
>  		.parent		=3D &clk_h,
>  		.enable		=3D s3c2443_clkcon_enable_h,
>  		.ctrlbit	=3D S3C2443_HCLKCON_HSMMC,
> --
> 1.7.2.3

Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
