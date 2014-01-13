From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 5/6] arm: exynos4-dt: statically add platform device for
 cpufreq-cpu0 platform driver
Date: Mon, 13 Jan 2014 11:17:32 +0800
Message-ID: <20140113031730.GE23525@S2101-09.ap.freescale.net>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
 <1389283165-17708-6-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:52802 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751110AbaAMDQO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Jan 2014 22:16:14 -0500
Content-Disposition: inline
In-Reply-To: <1389283165-17708-6-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: cpufreq@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, viresh.kumar@linaro.org

On Thu, Jan 09, 2014 at 09:29:24PM +0530, Thomas Abraham wrote:
> +static struct platform_device cpufreq_device = {
> +	.name		= "cpufreq-cpu0",
> +	.id		= -1,
> +};
> +
>  static void __init exynos4_dt_machine_init(void)
>  {
>  	exynos_cpuidle_init();
>  	exynos_cpufreq_init();
>  
> +	platform_device_register(&cpufreq_device);

It can just be:

	platform_device_register_simple("cpufreq-cpu0", -1, NULL, 0);

Shawn

>  	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
>  }
>  
> -- 
> 1.6.6.rc2
> 
