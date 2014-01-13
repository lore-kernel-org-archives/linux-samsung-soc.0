From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/6] cpufreq: cpufreq-cpu0: allow optional safe voltage
 during frequency transitions
Date: Mon, 13 Jan 2014 11:14:59 +0800
Message-ID: <20140113031457.GD23525@S2101-09.ap.freescale.net>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
 <1389283165-17708-2-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]:27554
	"EHLO va3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751110AbaAMDNo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Jan 2014 22:13:44 -0500
Content-Disposition: inline
In-Reply-To: <1389283165-17708-2-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: cpufreq@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, viresh.kumar@linaro.org

Hi Thomas,

On Thu, Jan 09, 2014 at 09:29:20PM +0530, Thomas Abraham wrote:
> @@ -19,6 +19,10 @@ Optional properties:
>  - cooling-min-level:
>  - cooling-max-level:
>       Please refer to Documentation/devicetree/bindings/thermal/thermal.txt.
> +- safe-opp-index: Certain platforms require that during a opp transition,
> +  a system should not go below a particular opp level. For such systems,
> +  this property specifies the minimum opp to be maintained during the
> +  opp transitions.

<snip>

> @@ -165,13 +196,27 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
>  		goto out_put_node;
>  	}
>  
> +	if (!of_property_read_u32(np, "safe-opp-index", &safe_opp_index)) {
> +		rcu_read_lock();
> +		opp = dev_pm_opp_find_freq_exact(cpu_dev,
> +			freq_table[safe_opp_index].frequency * 1000, true);

The property safe_opp_index is directly used to index freq_table here.
It only works when the opp table in device tree is defined in increasing
order.  But we have nothing in opp binding bindings/power/opp.txt to
enforce it.  That said, opp table in device tree could be in arbitrary
order, and thus safe_opp_index gives you nothing reliable.

Shawn

> +		if (IS_ERR(opp)) {
> +			rcu_read_unlock();
> +			pr_err("safe opp index %d is invalid\n",
> +							safe_opp_index);
> +			goto out_free_table;
> +		}
> +		safe_voltage = dev_pm_opp_get_voltage(opp);
> +		safe_frequency = freq_table[safe_opp_index].frequency;
> +		rcu_read_unlock();
> +	}
> +
>  	of_property_read_u32(np, "voltage-tolerance", &voltage_tolerance);
>  
>  	if (of_property_read_u32(np, "clock-latency", &transition_latency))
>  		transition_latency = CPUFREQ_ETERNAL;
>  
>  	if (!IS_ERR(cpu_reg)) {
> -		struct dev_pm_opp *opp;
>  		unsigned long min_uV, max_uV;
>  		int i;
>  
> -- 
> 1.6.6.rc2
> 
