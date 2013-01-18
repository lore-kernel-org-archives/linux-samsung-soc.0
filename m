From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] cpufreq: exynos: Get booting freq value in
 exynos_cpufreq_init
Date: Thu, 17 Jan 2013 20:34:30 -0800
Message-ID: <00e201cdf535$1ce7d680$56b78380$@samsung.com>
References: <00b801cdecb1$57d55e20$07801a60$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8223 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753038Ab3AREer (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 23:34:47 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGT00FE70PBT270@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 13:34:43 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGT00MPQ0PSEJA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jan 2013 13:34:43 +0900 (KST)
In-reply-to: <00b801cdecb1$57d55e20$07801a60$%choi@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

Jonghwan Choi wrote:
> 
> Boot_freq is for saving booting freq. But exynos_cpufreq_cpu_init
> is called in hotplug. If boot_freq is existed in exynos_cpufreq_cpu_init,
> boot_freq could be changed.
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  drivers/cpufreq/exynos-cpufreq.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/exynos-cpufreq.c
> b/drivers/cpufreq/exynos-cpufreq.c
> index 7012ea8..41fc550 100644
> --- a/drivers/cpufreq/exynos-cpufreq.c
> +++ b/drivers/cpufreq/exynos-cpufreq.c
> @@ -222,8 +222,6 @@ static int exynos_cpufreq_cpu_init(struct
> cpufreq_policy
> *policy)
> 
>  	cpufreq_frequency_table_get_attr(exynos_info->freq_table,
> policy->cpu);
> 
> -	locking_frequency = exynos_getspeed(0);
> -
>  	/* set the transition latency value */
>  	policy->cpuinfo.transition_latency = 100000;
> 
> @@ -288,6 +286,8 @@ static int __init exynos_cpufreq_init(void)
>  		goto err_vdd_arm;
>  	}
> 
> +	locking_frequency = exynos_getspeed(0);
> +
>  	register_pm_notifier(&exynos_cpufreq_nb);
> 
>  	if (cpufreq_register_driver(&exynos_driver)) {
> --
> 1.7.4.1

Applied, thanks.

- Kukjin
