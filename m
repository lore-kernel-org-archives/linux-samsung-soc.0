From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: let S3C2412_PM select S3C2412_PM_SLEEP
Date: Fri, 08 Feb 2013 14:47:50 -0800
Message-ID: <1a5f01ce064e$53fc1c10$fbf45430$@samsung.com>
References: <201302052251.17152.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59465 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1947094Ab3BHWsH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 17:48:07 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHX00G09BC2YJ60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:48:06 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHX00DMVBC4AEB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:48:05 +0900 (KST)
In-reply-to: <201302052251.17152.heiko@sntech.de>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> The code to enter sleep is used by both the s3c2412 and s3c2416 and
> was thus factored out into an extra config option.
>=20
> But it seems it was forgotten to add the appropriate select to the
> s3c2412 pm option, resulting in breakage when only compiling s3c2412
> support.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/mach-s3c24xx/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-
> s3c24xx/Kconfig
> index 5e17e1d..ac61bb7 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -301,6 +301,7 @@ config S3C2412_DMA
>=20
>  config S3C2412_PM
>  	bool
> +	select S3C2412_PM_SLEEP
>  	help
>  	  Internal config node to apply S3C2412 power management
>=20
> --
> 1.7.10.4

Looks good to me, applied.

Thanks

- Kukjin
