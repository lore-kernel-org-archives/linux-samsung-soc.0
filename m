From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [RFC PATCH 2/4] ARM: EXYNOS4: Fix to work with origen boards.
Date: Fri, 19 Aug 2011 22:59:34 +0900
Message-ID: <CAH9JG2XbTub+TR_Pbi8ZqedD78HsDzMAY581XQbcWYF6aP82aQ@mail.gmail.com>
References: <1313759340-31319-1-git-send-email-amit.kachhap@linaro.org>
	<1313759400-31347-2-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:52870 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685Ab1HSN7f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 09:59:35 -0400
Received: by qyk34 with SMTP id 34so1119325qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Aug 2011 06:59:34 -0700 (PDT)
In-Reply-To: <1313759400-31347-2-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On Fri, Aug 19, 2011 at 10:09 PM, Amit Daniel Kachhap
<amit.kachhap@linaro.org> wrote:
> This adds a function to get the revision id.
>
> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 10 ++=
++++++++
> =A0arch/arm/plat-s5p/include/plat/exynos4.h | =A0 =A01 +
> =A02 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.=
c
> index 2d8a40c..8b106b8 100644
> --- a/arch/arm/mach-exynos4/cpu.c
> +++ b/arch/arm/mach-exynos4/cpu.c
> @@ -234,6 +234,16 @@ static int __init exynos4_l2x0_cache_init(void)
> =A0early_initcall(exynos4_l2x0_cache_init);
> =A0#endif
>
> +int exynos4_subrev(void)
> +{
> + =A0 =A0 =A0 static int subrev =3D -1;
> +
> + =A0 =A0 =A0 if (unlikely(subrev < 0))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 subrev =3D readl(S5P_VA_CHIPID) & 0xf;
How about to add the clock control here?
1. Register chipid clk
2. Get the chipid clk
3. Read CHPIID,
4. Put tht chipid clk.

Then you can save some power.

Thank you,
Kyungmin Park
> +
> + =A0 =A0 =A0 return subrev;
> +}
> +
> =A0int __init exynos4_init(void)
> =A0{
> =A0 =A0 =A0 =A0printk(KERN_INFO "EXYNOS4: Initializing architecture\n=
");
> diff --git a/arch/arm/plat-s5p/include/plat/exynos4.h b/arch/arm/plat=
-s5p/include/plat/exynos4.h
> index 907caab..d62f7f7 100644
> --- a/arch/arm/plat-s5p/include/plat/exynos4.h
> +++ b/arch/arm/plat-s5p/include/plat/exynos4.h
> @@ -15,6 +15,7 @@
> =A0extern void exynos4_common_init_uarts(struct s3c2410_uartcfg *cfg,=
 int no);
> =A0extern void exynos4_register_clocks(void);
> =A0extern void exynos4_setup_clocks(void);
> +extern int exynos4_subrev(void);
>
> =A0#ifdef CONFIG_CPU_EXYNOS4210
>
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
