From: Tushar Behera <trblinux@gmail.com>
Subject: Re: [PATCH 3/3] ARM: exynos: activate the CCI on boot CPU/cluster
 with the MCPM loopback
Date: Tue, 24 Jun 2014 13:52:59 +0530
Message-ID: <53A93563.2050409@gmail.com>
References: <1403583071-5650-1-git-send-email-nicolas.pitre@linaro.org> <1403583071-5650-4-git-send-email-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:35488 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751365AbaFXIXF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jun 2014 04:23:05 -0400
Received: by mail-pa0-f46.google.com with SMTP id eu11so6893978pac.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2014 01:23:05 -0700 (PDT)
In-Reply-To: <1403583071-5650-4-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Doug Anderson <dianders@google.com>, Andrew Bresticker <abrestic@chromium.org>
Cc: Kevin Hilman <khilman@linaro.org>, Olof Johansson <olof@lixom.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org

On 06/24/2014 09:41 AM, Nicolas Pitre wrote:
> The Chromebook firmware doesn't enable the CCI for the boot cpu, and
> arguably it shouldn't have to either. Let's have the kernel handle the
> CCI on its own for the boot CPU the same way it does it for secondary CPUs
> by using the MCPM loopback.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---

Tested on top of next-20140623. Verified that all 8 cores are coming up
on Exynos5800 based Peach-pi board.

Tested-by: Tushar Behera <tushar.b@samsung.com>

>  arch/arm/mach-exynos/mcpm-exynos.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/mcpm-exynos.c b/arch/arm/mach-exynos/mcpm-exynos.c
> index 0498d0b887..0c839f94ec 100644
> --- a/arch/arm/mach-exynos/mcpm-exynos.c
> +++ b/arch/arm/mach-exynos/mcpm-exynos.c
> @@ -290,6 +290,19 @@ static void __naked exynos_pm_power_up_setup(unsigned int affinity_level)
>  	"b	cci_enable_port_for_self");
>  }
>  
> +static void __init exynos_cache_off(void)
> +{
> +	if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A15) {
> +		/* disable L2 prefetching on the Cortex-A15 */
> +		asm volatile(
> +		"mcr	p15, 1, %0, c15, c0, 3\n\t"
> +		"isb\n\t"
> +		"dsb"
> +		: : "r" (0x400));
> +	}
> +	exynos_v7_exit_coherency_flush(all);
> +}
> +
>  static const struct of_device_id exynos_dt_mcpm_match[] = {
>  	{ .compatible = "samsung,exynos5420" },
>  	{ .compatible = "samsung,exynos5800" },
> @@ -333,6 +346,8 @@ static int __init exynos_mcpm_init(void)
>  	ret = mcpm_platform_register(&exynos_power_ops);
>  	if (!ret)
>  		ret = mcpm_sync_init(exynos_pm_power_up_setup);
> +	if (!ret)
> +		ret = mcpm_loopback(exynos_cache_off); /* turn on the CCI */
>  	if (ret) {
>  		iounmap(ns_sram_base_addr);
>  		return ret;
> 


-- 
Tushar Behera
