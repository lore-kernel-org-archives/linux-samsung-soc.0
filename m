From: Joonyoung Shim <dofmind@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Remove the L2 cache latency setting for EXYNOS5
Date: Tue, 26 Jun 2012 16:11:36 +0900
Message-ID: <CAPLVkLsgi3ST622ZhRusJz5OHV6MJYP7SNkj2Mh-QPos1AWyhQ@mail.gmail.com>
References: <038301cd4f47$8202b420$86081c60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:57117 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753804Ab2FZHLh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jun 2012 03:11:37 -0400
Received: by vbbff1 with SMTP id ff1so2462665vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jun 2012 00:11:37 -0700 (PDT)
In-Reply-To: <038301cd4f47$8202b420$86081c60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Boojin Kim <boojin.kim@samsung.com>

Hi,

2012/6/21 Kukjin Kim <kgene.kim@samsung.com>:
> From: Boojin Kim <boojin.kim@samsung.com>
>
> Since SYSRAM set the L2 cache latency on EXYNOS5 SoCs,

I don't understand this. Do you mean that BL1 codes do it?
I also wonder how enable L2 cache at the exynos5.

> no longer need that in the kernel. It helps to reduce
> booting time (no need cache disable and cache enable).
>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos/common.c | =A0 25 -------------------------
> =A01 files changed, 0 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/com=
mon.c
> index 742edd3..0ec1a91 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -712,31 +712,6 @@ static int __init exynos4_l2x0_cache_init(void)
> =A0early_initcall(exynos4_l2x0_cache_init);
> =A0#endif
>
> -static int __init exynos5_l2_cache_init(void)
> -{
> - =A0 =A0 =A0 unsigned int val;
> -
> - =A0 =A0 =A0 if (!soc_is_exynos5250())
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> -
> - =A0 =A0 =A0 asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"bic %0, %0, #(1 << 2)\n" =A0=
/* cache disable */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mcr p15, 0, %0, c1, c0, 0\n=
"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mrc p15, 1, %0, c9, c0, 2\n=
"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "=3Dr"(val));
> -
> - =A0 =A0 =A0 val |=3D (1 << 9) | (1 << 5) | (2 << 6) | (2 << 0);
> -
> - =A0 =A0 =A0 asm volatile("mcr p15, 1, %0, c9, c0, 2\n" : : "r"(val)=
);
> - =A0 =A0 =A0 asm volatile("mrc p15, 0, %0, c1, c0, 0\n"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"orr %0, %0, #(1 << 2)\n" =A0=
/* cache enable */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mcr p15, 0, %0, c1, c0, 0\n=
"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: : "r"(val));
> -
> - =A0 =A0 =A0 return 0;
> -}
> -early_initcall(exynos5_l2_cache_init);
> -
> =A0static int __init exynos_init(void)
> =A0{
> =A0 =A0 =A0 =A0printk(KERN_INFO "EXYNOS: Initializing architecture\n"=
);
> --
> 1.7.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



--=20
- Joonyoung Shim
