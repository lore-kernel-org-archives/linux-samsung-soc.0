From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v2] ARM: EXYNOS: Use MCPM call-backs to support S2R on
 Exynos5420
Date: Tue, 1 Jul 2014 00:19:09 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1407010012150.16842@knanqh.ubzr>
References: <1403780312-22885-1-git-send-email-a.kesavan@samsung.com> <1404152927-11168-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:62422 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbaGAETL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 00:19:11 -0400
Received: by mail-qg0-f43.google.com with SMTP id z60so2855137qgd.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 21:19:10 -0700 (PDT)
In-Reply-To: <1404152927-11168-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, abrestic@chromium.org, dianders@chromium.org, kesavan.abhilash@gmail.com

On Mon, 30 Jun 2014, Abhilash Kesavan wrote:

> Use the MCPM layer to handle core suspend/resume on Exynos5420.
> Also, restore the entry address setup code post-resume.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
[...]

Could you tell me more about this?

> @@ -150,7 +153,13 @@ static void exynos_power_down(void)
>  	BUG_ON(__mcpm_cluster_state(cluster) != CLUSTER_UP);
>  	cpu_use_count[cpu][cluster]--;
>  	if (cpu_use_count[cpu][cluster] == 0) {
> -		exynos_cpu_power_down(cpunr);
> +		/*
> +		 * Bypass power down for CPU0 during suspend. This is being
> +		 * taken care by the SYS_PWR_CFG bit in CORE0_SYS_PWR_REG.
> +		 */
> +		if ((cpunr != 0) ||
> +		(__raw_readl(pmu_base_addr + S5P_INFORM1) != S5P_CHECK_SLEEP))
> +			exynos_cpu_power_down(cpunr);

What happens if CPU0 is the first in the cluster to be idled?  Will it 
remain powered up until all the others have gone idle too?


Nicolas
