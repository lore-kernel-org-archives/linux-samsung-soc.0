Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B8286426;
	Wed, 18 Jun 2025 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242129; cv=none; b=cJAWGYxMAO21IEjK12MC3lFHUydmsNkYc0PiiHFEScLIUVU0YenyewT+Shx6Pcq6x4J2IXgsd9B6/2ob6mr/8bZ8ivgYZ8DRJHLFny+clBCduEVAOydY3QZoXko3VG5nym/6zjq4U6/zw6YN+UxNGjvApJ9a5V+ayyrII738Dhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242129; c=relaxed/simple;
	bh=2WxueDVq+T8ZRhlskupBTyxUnIZ16kRiWx2tZYUMy/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tk/CUZBEz199BHYXNKpq6rl2jmF/YDV78h7RcEJ9uK/bgQdCQi+F10C0UwzK27VCC8Rdy65sH25sA35YGQFyS2HhLD/BWzrGMf3LeuDsqWUpKmF8atjISzCt+ywZJ92OKcE2l5/WfMB9Te/eVcRVk91sBQO7Tm7eVpfDXTiENcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6pFzL6R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6pFzL6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F7DC4CEE7;
	Wed, 18 Jun 2025 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750242128;
	bh=2WxueDVq+T8ZRhlskupBTyxUnIZ16kRiWx2tZYUMy/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M6pFzL6RwLxuAmmUnQO/BbPUMTnUfNXDYyPuDNhE2skkmba0Qp6XhOCH4t5TfF5hl
	 SZvEiBSAVuiyqr9aCEOy1vu5HZK2OV6kmRHfCwFuUvtTWKASYnndsUaFWzqcy6KBJD
	 o9UmJ8lQmHmjoLBZiNirmiUTq75hRkOSadpLeQM+kGh3hfb5TQnCBfVbPPKQB2UGSc
	 evEjzFz0OsML+AMfz66yBMoLS6MKhdwGGr3lo3l2nlodIvAthzMUaBf90LqIgPNCH3
	 JRW3EJ7LsdFEOuJ7UmB+kIoN1mFVusrpYxx+5LoJmXMK89tRylC+YBKG7ESEOsdYEW
	 lkj3GpkmT6ESw==
Message-ID: <4e827037-1bde-4eb3-a6f2-6416dace10b5@kernel.org>
Date: Wed, 18 Jun 2025 12:22:03 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: samsung: exynos-pmu: Enable CPU Idle for
 gs101
To: Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: William Mcvicker <willmcvicker@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com
References: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
 <20250611-gs101-cpuidle-v2-2-4fa811ec404d@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250611-gs101-cpuidle-v2-2-4fa811ec404d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2025 11:34, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn
> program the ACPM hint. This is required to actually
> enter the idle state.
> 
> A couple of corner cases are handled, namely when the
> system is rebooting or suspending we ignore the request.
> Additionally the request is ignored if the CPU is in
> CPU hot plug.
> 
> Note: this patch has a runtime dependency on adding
> 'local-timer-stop' dt property to the CPU nodes. This
> informs the time framework to switch to a broadcast timer
> as the local timer will be shutdown. Without that DT
> property specified the system hangs in early boot with
> this patch applied.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v2
>  * Add ifdef CONFIG_PM_SLEEP to avoid
>    Fix warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable] (0-day)
> ---
>  drivers/soc/samsung/exynos-pmu.c | 137 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 133 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index a77288f49d249f890060c595556708334383c910..7f72ecd60994f18bb639dd8e09e1c6ff6158066b 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -8,6 +8,7 @@
>  #include <linux/array_size.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/cpuhotplug.h>
> +#include <linux/cpu_pm.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/mfd/core.h>
> @@ -15,6 +16,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/delay.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
>  
>  #include <linux/soc/samsung/exynos-regs-pmu.h>
> @@ -35,6 +37,10 @@ struct exynos_pmu_context {
>  	const struct exynos_pmu_data *pmu_data;
>  	struct regmap *pmureg;
>  	struct regmap *pmuintrgen;
> +	spinlock_t cpupm_lock;	/* serialization lock */

serialization of what? Or rather, can it be not a serialization lock? Is
it possible? It's as useful as saying "protection against concurrent
accesses lock". No, you need to be explicit which members and/or code
are protected.

> +	bool __percpu *hotplug_ing;
> +	atomic_t sys_suspended;

Why re-implementing own refcnt of pm suspend status?
pm_runtime_suspended() and others?

> +	atomic_t sys_rebooting;
>  };
>  
>  void __iomem *pmu_base_addr;
> @@ -336,7 +342,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>  #define CPU_INFORM_CLEAR	0
>  #define CPU_INFORM_C2		1
>  
> -static int gs101_cpuhp_pmu_online(unsigned int cpu)
> +static int gs101_cpu_pmu_online(unsigned int cpu)
>  {
>  	unsigned int cpuhint = smp_processor_id();
>  	u32 reg, mask;
> @@ -358,10 +364,26 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
>  	return 0;
>  }
>  
> -static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> +static int gs101_cpuhp_pmu_online(unsigned int cpu)

This needs either renaming or comments. One is cpu_pmu_online other is
cpuhp_pmu_online. Sounds the same to me.


> +{
> +	gs101_cpu_pmu_online(cpu);
> +
> +	/*
> +	 * Mark this CPU as having finished the hotplug.
> +	 * This means this CPU can now enter C2 idle state.
> +	 */
> +	*per_cpu_ptr(pmu_context->hotplug_ing, cpu) = false;

Quoting docs: "Per cpu data structures are designed to be used by one
cpu exclusively".

... and further about write access. Adding standard driver code using
"highly discouraged" practice is not something expected.


> +
> +	return 0;
> +}
> +
> +static int gs101_cpu_pmu_offline(unsigned int cpu)
>  {
>  	u32 reg, mask;
> -	unsigned int cpuhint = smp_processor_id();
> +	unsigned int cpuhint;
> +
> +	spin_lock(&pmu_context->cpupm_lock);

This does not disable interrupts...

> +	cpuhint	= smp_processor_id();

... which is a requirement here, according to docs, no? Maybe the
original code had an issue, though.

>  
>  	/* set cpu inform hint */
>  	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> @@ -379,16 +401,89 @@ static int gs101_cpuhp_pmu_offline(unsigned int cpu)
>  	regmap_read(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_UPEND, &reg);
>  	regmap_write(pmu_context->pmuintrgen, GS101_GRP1_INTR_BID_CLEAR,
>  		     reg & mask);
> +
> +	spin_unlock(&pmu_context->cpupm_lock);
>  	return 0;
>  }
>  
> +static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> +{
> +	/*
> +	 * Mark this CPU as entering hotplug. So as not to confuse
> +	 * ACPM the CPU entering hotplug should not enter C2 idle state.
> +	 */
> +	*per_cpu_ptr(pmu_context->hotplug_ing, cpu) = true;
> +
> +	gs101_cpu_pmu_offline(cpu);
> +
> +	return 0;
> +}
> +
> +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> +					unsigned long action, void *v)
> +{
> +	int cpu = smp_processor_id();
> +
> +	switch (action) {
> +	case CPU_PM_ENTER:
> +		/*
> +		 * Ignore CPU_PM_ENTER event in reboot or
> +		 * suspend sequence.
> +		 */
> +
> +		if (atomic_read(&pmu_context->sys_suspended) ||
> +		    atomic_read(&pmu_context->sys_rebooting))
> +			return NOTIFY_OK;
> +
> +		if (*per_cpu_ptr(pmu_context->hotplug_ing, cpu))
> +			return NOTIFY_BAD;
> +
> +		gs101_cpu_pmu_offline(cpu);
> +
> +		break;
> +	case CPU_PM_EXIT:
> +
> +		if (atomic_read(&pmu_context->sys_rebooting))
> +			return NOTIFY_OK;
> +
> +		gs101_cpu_pmu_online(cpu);
> +
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block gs101_cpu_pm_notifier = {
> +	.notifier_call = gs101_cpu_pm_notify_callback,
> +	.priority = INT_MAX	/* we want to be called first */

You should say why. Everyone wants to be the first.

> +};
> +
> +static int exynos_cpupm_reboot_notifier(struct notifier_block *nb,
> +					unsigned long event, void *v)
> +{
> +	switch (event) {
> +	case SYS_POWER_OFF:
> +	case SYS_RESTART:
> +		atomic_set(&pmu_context->sys_rebooting, 1);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block exynos_cpupm_reboot_nb = {
> +	.priority = INT_MAX,
> +	.notifier_call = exynos_cpupm_reboot_notifier,
> +};
> +
>  static int exynos_pmu_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct regmap_config pmu_regmcfg;
>  	struct regmap *regmap;
>  	struct resource *res;
> -	int ret;
> +	int ret, cpu;
>  
>  	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(pmu_base_addr))
> @@ -444,6 +539,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
>  			 */
>  			dev_warn(&pdev->dev, "pmu-intr-gen syscon unavailable\n");
>  		} else {
> +			pmu_context->hotplug_ing = alloc_percpu(bool);
> +
> +			/* set PMU to power on */
> +			for_each_online_cpu(cpu)
> +				gs101_cpuhp_pmu_online(cpu);
> +
>  			cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,
>  					  "soc/exynos-pmu:prepare",
>  					  gs101_cpuhp_pmu_online, NULL);
> @@ -451,6 +552,12 @@ static int exynos_pmu_probe(struct platform_device *pdev)
>  			cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>  					  "soc/exynos-pmu:online",
>  					  NULL, gs101_cpuhp_pmu_offline);
> +
> +			cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
> +			spin_lock_init(&pmu_context->cpupm_lock);
> +			atomic_set(&pmu_context->sys_rebooting, 0);
> +			atomic_set(&pmu_context->sys_suspended, 0);
> +			register_reboot_notifier(&exynos_cpupm_reboot_nb);
>  		}
>  	}
>  
> @@ -471,10 +578,32 @@ static int exynos_pmu_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int exynos_cpupm_suspend_noirq(struct device *dev)
> +{
> +	atomic_set(&pmu_context->sys_suspended, 1);
> +	return 0;
> +}
> +
> +static int exynos_cpupm_resume_noirq(struct device *dev)
> +{
> +	atomic_set(&pmu_context->sys_suspended, 0);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops cpupm_pm_ops = {
> +	.suspend_noirq = exynos_cpupm_suspend_noirq,
> +	.resume_noirq = exynos_cpupm_resume_noirq,

SET_LATE_SYSTEM_SLEEP_PM_OPS or one of other wrappers.

> +};
> +#endif
> +
>  static struct platform_driver exynos_pmu_driver = {
>  	.driver  = {
>  		.name   = "exynos-pmu",
>  		.of_match_table = exynos_pmu_of_device_ids,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm = &cpupm_pm_ops,

pm_ptr
> +#endif
>  	},
>  	.probe = exynos_pmu_probe,
>  };
> 


Best regards,
Krzysztof
