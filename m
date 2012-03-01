From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] Move S3C2412_PM_SLEEP to common platform code
Date: Thu, 01 Mar 2012 13:10:30 +0900
Message-ID: <076c01ccf761$3d92a1d0$b8b7e570$%kim@samsung.com>
References: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com>
 <1329346545-16373-9-git-send-email-kgene.kim@samsung.com>
 <201202282234.17056.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37744 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754991Ab2CAEKc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:10:32 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M0600IL8U98K560@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:10:31 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M0600ACKU9ICA70@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:10:31 +0900 (KST)
In-reply-to: <201202282234.17056.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Heiko St=FCbner wrote:
>=20
> S3C2412_PM_SLEEP is also used by the S3C2416, so move it out of the
> if CPU_S3C2412 block to the common platform code to prevent warnings
> when S3C2416_PM is selected but not CPU_S3C2412.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> this should probably be folded into the S3C2412 move patch
>=20
>  arch/arm/mach-s3c24xx/Kconfig |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kc=
onfig
> index 599e025..158958c 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -83,6 +83,12 @@ config CPU_S3C2443
>=20
>  comment "S3C24XX base platform code"
>=20
> +config S3C2412_PM_SLEEP
> +	bool
> +	help
> +	  Internal config node to apply sleep for S3C2412 power management.
> +	  Can be selected by another SoCs with similar sleep procedure.
> +
>  config S3C24XX_DMA
>  	bool "S3C2410 DMA support"
>  	depends on ARCH_S3C24XX
> @@ -253,12 +259,6 @@ config S3C2412_PM
>  	help
>  	  Internal config node to apply S3C2412 power management
>=20
> -config S3C2412_PM_SLEEP
> -	bool
> -	help
> -	  Internal config node to apply sleep for S3C2412 power management.
> -	  Can be selected by another SoCs with similar sleep procedure.
> -
>  comment "S3C2412 Boards"
>=20
>  #
> --
> 1.7.2.3

Looks good to me and will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
