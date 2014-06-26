From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Restore the entry address setup code post-resume
Date: Thu, 26 Jun 2014 17:55:30 +0530
Message-ID: <CAM4voa=AYDkHG49EEnr0097Dw4eS__T95oDrhswcfHEzY=PTcw@mail.gmail.com>
References: <1403780312-22885-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:36193 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752955AbaFZMZb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 08:25:31 -0400
Received: by mail-qg0-f52.google.com with SMTP id f51so2922888qge.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2014 05:25:30 -0700 (PDT)
In-Reply-To: <1403780312-22885-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Me2 <kesavan.abhilash@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, Douglas Anderson <dianders@chromium.org>, Abhilash Kesavan <a.kesavan@samsung.com>

Hi,

On Thu, Jun 26, 2014 at 4:28 PM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
> Setup the mcpm entry address again on system resume as the
> iRAM contents are lost across an s2r cycle.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
> This has been tested after applying the Exynos5420 S2R support series
> along with Nicolas Pitre's boot cluster CCI enablement patches on Peach
> Pit.
>
>  arch/arm/mach-exynos/mcpm-exynos.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
> index 8c610e2..0bf734d 100644
> --- a/arch/arm/mach-exynos/mcpm-exynos.c
> +++ b/arch/arm/mach-exynos/mcpm-exynos.c
> @@ -15,6 +15,7 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/of_address.h>
> +#include <linux/syscore_ops.h>
>
>  #include <asm/cputype.h>
>  #include <asm/cp15.h>
> @@ -26,6 +27,7 @@
>  #define EXYNOS5420_CPUS_PER_CLUSTER    4
>  #define EXYNOS5420_NR_CLUSTERS         2
>
> +static void __iomem *ns_sram_base_addr;
>  /*
>   * The common v7_exit_coherency_flush API could not be used because of the
>   * Erratum 799270 workaround. This macro is the same as the common one (in
> @@ -308,10 +310,26 @@ static const struct of_device_id exynos_dt_mcpm_match[] = {
>         {},
>  };
>
> +static void exynos_mcpm_setup_entry_point(void)
> +{
> +       /*
> +        * U-Boot SPL is hardcoded to jump to the start of ns_sram_base_addr
> +        * as part of secondary_cpu_start().  Let's redirect it to the
> +        * mcpm_entry_point(). This is done during both secondary boot-up as
> +        * well as system resume.
> +        */
> +       __raw_writel(0xe59f0000, ns_sram_base_addr);     /* ldr r0, [pc, #0] */
> +       __raw_writel(0xe12fff10, ns_sram_base_addr + 4); /* bx  r0 */
> +       __raw_writel(virt_to_phys(mcpm_entry_point), ns_sram_base_addr + 8);
> +}
> +
> +static struct syscore_ops exynos_mcpm_syscore_ops = {
> +       .resume = exynos_mcpm_setup_entry_point,
> +};
> +
>  static int __init exynos_mcpm_init(void)
>  {
>         struct device_node *node;
> -       void __iomem *ns_sram_base_addr;
>         int ret;
>
>         node = of_find_matching_node(NULL, exynos_dt_mcpm_match);
> @@ -357,16 +375,9 @@ static int __init exynos_mcpm_init(void)
>
>         pr_info("Exynos MCPM support installed\n");
>
> -       /*
> -        * U-Boot SPL is hardcoded to jump to the start of ns_sram_base_addr
> -        * as part of secondary_cpu_start().  Let's redirect it to the
> -        * mcpm_entry_point().
> -        */
> -       __raw_writel(0xe59f0000, ns_sram_base_addr);     /* ldr r0, [pc, #0] */
> -       __raw_writel(0xe12fff10, ns_sram_base_addr + 4); /* bx  r0 */
> -       __raw_writel(virt_to_phys(mcpm_entry_point), ns_sram_base_addr + 8);
> +       exynos_mcpm_setup_entry_point();
>
> -       iounmap(ns_sram_base_addr);
> +       register_syscore_ops(&exynos_mcpm_syscore_ops);
>
>         return ret;
>  }

This patch alone is not enough to bring the 8 cores back up post
resume on exynos5420, We need to enable the boot cluster snoops as
well.

Nicolas, if I add code to enable the boot cluster CCI in
mach-exynos/sleep.S, all 8 cores come up. However, if I use
mcpm_loopback as part of the newly added resume function to do the
same, I get a hang on resume.
Is there anything else that I need to take care of while doing this ?

Regards,
Abhilash
> --
> 1.8.3.2
>
