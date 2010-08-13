From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ARM: S3C2410: Fix on build warning about dependency in
	mach-s3c2440/Kconfig
Date: Fri, 13 Aug 2010 10:39:01 +0200
Message-ID: <20100813083901.GA20285@pengutronix.de>
References: <1281687307-2421-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:32960 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761354Ab0HMIjG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Aug 2010 04:39:06 -0400
Content-Disposition: inline
In-Reply-To: <1281687307-2421-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Fri, Aug 13, 2010 at 05:15:07PM +0900, Kukjin Kim wrote:
> This patch fixes on following build warnings.
>=20
> warning: (CPU_S3C2440 && ARCH_S3C2410 && S3C2410_DMA) selects S3C2440=
_DMA which
>              has unmet direct dependencies (ARCH_S3C2410 && CPU_S3C24=
405B)
> warning: (CPU_S3C2440 && ARCH_S3C2410 || CPU_S3C2442 && ARCH_S3C2410)=
 selects
>              CPU_S3C244X which has unmet direct dependencies (!ARCH_S=
3C2410)
>=20
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> ---
>  arch/arm/mach-s3c2440/Kconfig |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c2440/Kconfig b/arch/arm/mach-s3c2440/Kc=
onfig
> index cd8e7de..f60a370 100644
> --- a/arch/arm/mach-s3c2440/Kconfig
> +++ b/arch/arm/mach-s3c2440/Kconfig
> @@ -30,7 +30,7 @@ config CPU_S3C2442
> =20
>  config CPU_S3C244X
>  	bool
> -	depends on ARCH_S3C2410 && (CPU_S3C2440 || CPU_S3C2442)
> +	depends on (CPU_S3C2440 || CPU_S3C2442)
>  	help
>  	  Support for S3C2440 and S3C2442 Samsung Mobile CPU based systems.
> =20
> @@ -72,7 +72,7 @@ config S3C2440_PLL_16934400
> =20
>  config S3C2440_DMA
>  	bool
> -	depends on ARCH_S3C2410 && CPU_S3C24405B
> +	depends on (ARCH_S3C2410 || CPU_S3C24405B)
>  	help
>  	  Support for S3C2440 specific DMA code5A
all parenthesis in your +lines are superflous.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
