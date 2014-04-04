From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH V2 02/17] ARM: exynos: cpuidle: use cpuidle_register
Date: Fri, 04 Apr 2014 17:28:08 +0200
Message-ID: <4570358.K4hZOIqT9V@amdc1032>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
 <1396618989-2897-3-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20507 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753777AbaDDP2k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 11:28:40 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3I008KNIZQ1S30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 05 Apr 2014 00:28:38 +0900 (KST)
In-reply-to: <1396618989-2897-3-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

On Friday, April 04, 2014 03:42:54 PM Daniel Lezcano wrote:
> Use the cpuidle generic function 'cpuidle_register'. That saves us from some
> extra lines of code and unneeded variables.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c |   18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
> index 9623a05..b7cd75b 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -59,8 +59,6 @@
>  #define PWR_CTRL2_CORE2_UP_RATIO		(1 << 4)
>  #define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
>  
> -static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_device);
> -
>  /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
>  static void exynos4_set_wakeupmask(void)
>  {
> @@ -211,8 +209,7 @@ static struct cpuidle_driver exynos4_idle_driver = {
>  
>  static int exynos_cpuidle_probe(struct platform_device *pdev)
>  {
> -	int cpu_id, ret;
> -	struct cpuidle_device *device;
> +	int ret;
>  
>  	if (soc_is_exynos5250())
>  		exynos5_core_down_clk();
> @@ -220,23 +217,12 @@ static int exynos_cpuidle_probe(struct platform_device *pdev)
>  	if (soc_is_exynos5440())
>  		exynos4_idle_driver.state_count = 1;
>  
> -	ret = cpuidle_register_driver(&exynos4_idle_driver);
> +	ret = cpuidle_register(&exynos4_idle_driver, NULL);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to register cpuidle driver\n");
>  		return ret;
>  	}
>  
> -	for_each_online_cpu(cpu_id) {

cpuidle_register() does setup for_each_possible_cpu().  This is a good
thing and your patch has a nice bugfix side effect that is worth mentioning
in the patch description IMHO.

> -		device = &per_cpu(exynos4_cpuidle_device, cpu_id);
> -		device->cpu = cpu_id;
> -
> -		ret = cpuidle_register_device(device);
> -		if (ret) {
> -			dev_err(&pdev->dev, "failed to register cpuidle device\n");
> -			return ret;
> -		}
> -	}
> -
>  	return 0;
>  }

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
