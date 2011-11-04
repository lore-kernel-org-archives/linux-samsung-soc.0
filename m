From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Enable write full line for zeros mode
Date: Fri, 4 Nov 2011 13:45:03 +0900
Message-ID: <CAH9JG2XWPrrWWvnwmbbqixsN72P=Y87KBw3Skgsp_aiYx66XCg@mail.gmail.com>
References: <1320373056-11718-1-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:61798 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810Ab1KDEpE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 00:45:04 -0400
Received: by ywf7 with SMTP id 7so2101828ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Nov 2011 21:45:04 -0700 (PDT)
In-Reply-To: <1320373056-11718-1-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@samsung.com>

Hi,

On 11/4/11, Boojin Kim <boojin.kim@samsung.com> wrote:
> This patch enables the 'write full line for zeros mode' feature of
> cortex-A9.
> The performance of memset() with zero is increased about 10% with this
> patch.

It seems CA9 common parts, does other SoC require same feature?
>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> ---
>  arch/arm/mach-exynos4/platsmp.c |   18 ++++++++++++++++++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/platsmp.c
> b/arch/arm/mach-exynos4/platsmp.c
> index d5f0f29..edf7054 100644
> --- a/arch/arm/mach-exynos4/platsmp.c
> +++ b/arch/arm/mach-exynos4/platsmp.c
> @@ -90,6 +90,16 @@ static void __cpuinit exynos4_gic_secondary_init(void)
>  	__raw_writel(1, cpu_base + GIC_CPU_CTRL);
>  }
>
> +static void enable_foz(void)
> +{
> +	u32 val;
> +	asm volatile(
> +	"mrc   p15, 0, %0, c1, c0, 1\n"
> +	"orr   %0, %0, #(1 << 3)\n"
> +	"mcr   p15, 0, %0, c1, c0, 1"
> +	: "=r" (val));
> +}
> +
>  void __cpuinit platform_secondary_init(unsigned int cpu)
>  {
>  	/*
> @@ -106,6 +116,14 @@ void __cpuinit platform_secondary_init(unsigned int
> cpu)
>  	write_pen_release(-1);
>
>  	/*
> +	* Enable write full line for zeros mode
> +	*/
> +	if (soc_is_exynos4210() | soc_is_exynos4212() | soc_is_exynos4412()) {
Now CA15 is not ready so this if statement is meaningless.
> +		enable_foz();
> +		smp_call_function((void (*)(void *))enable_foz, NULL, 0);
> +	}
> +
> +	/*
>  	 * Synchronise with the boot thread.
>  	 */
>  	spin_lock(&boot_lock);
Thank you,
Kyungmin Park
