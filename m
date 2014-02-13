From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: remove unneeded s3c24xx_init_cpu()
Date: Fri, 14 Feb 2014 07:19:19 +0900
Message-ID: <52FD44E7.3080004@samsung.com>
References: <3865198.Kyn1P03kbU@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:58947 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751252AbaBMWT1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Feb 2014 17:19:27 -0500
Received: by mail-pa0-f48.google.com with SMTP id kx10so11357131pab.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2014 14:19:26 -0800 (PST)
In-Reply-To: <3865198.Kyn1P03kbU@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 01/13/14 05:34, Heiko St=FCbner wrote:
> The function is nearly empty and samsung_cpu_rev is static so already=
 0
> making the function obsolete, therefore remove it.
>
> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> ---
>   arch/arm/mach-s3c24xx/common.c           |    1 -
>   arch/arm/plat-samsung/cpu.c              |    7 -------
>   arch/arm/plat-samsung/include/plat/cpu.h |    1 -
>   3 files changed, 9 deletions(-)
>
> diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/c=
ommon.c
> index bf57d4c..97edd4d 100644
> --- a/arch/arm/mach-s3c24xx/common.c
> +++ b/arch/arm/mach-s3c24xx/common.c
> @@ -232,7 +232,6 @@ void __init s3c24xx_init_io(struct map_desc *mach=
_desc, int size)
>   	} else {
>   		samsung_cpu_id =3D s3c24xx_read_idcode_v4();
>   	}
> -	s3c24xx_init_cpu();
>
>   	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
>
> diff --git a/arch/arm/plat-samsung/cpu.c b/arch/arm/plat-samsung/cpu.=
c
> index 46b426e..364963a 100644
> --- a/arch/arm/plat-samsung/cpu.c
> +++ b/arch/arm/plat-samsung/cpu.c
> @@ -28,13 +28,6 @@ unsigned int samsung_rev(void)
>   }
>   EXPORT_SYMBOL(samsung_rev);
>
> -void __init s3c24xx_init_cpu(void)
> -{
> -	/* nothing here yet */
> -
> -	samsung_cpu_rev =3D 0;
> -}
> -
>   void __init s3c64xx_init_cpu(void)
>   {
>   	samsung_cpu_id =3D __raw_readl(S3C_VA_SYS + 0x118);
> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat=
-samsung/include/plat/cpu.h
> index 8f09488..262ef86 100644
> --- a/arch/arm/plat-samsung/include/plat/cpu.h
> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
> @@ -207,7 +207,6 @@ extern void s5p_init_irq(u32 *vic, u32 num_vic);
>
>   extern void s3c24xx_init_io(struct map_desc *mach_desc, int size);
>
> -extern void s3c24xx_init_cpu(void);
>   extern void s3c64xx_init_cpu(void);
>   extern void s5p_init_cpu(void __iomem *cpuid_addr);
>

Applied, thanks.
- Kukjin
