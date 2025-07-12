Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135E19ABC3;
	Sat, 12 Jul 2025 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752342173; cv=none; b=p8xrothBixWLjXgG8rAy7qPZ5dCDVCJqs1JQysmFcdjt9MX84KH1ICPSFB3qb9dcwE5eM9clbMhDuYEcTaspKaXfAro2krdIAVCqOFMdWI0efeOEb3CJBbg337H1ceX+qWX3L+3iRZmlcFv6O4S9f8QO0aa2qj+dTIIkQS7Qq9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752342173; c=relaxed/simple;
	bh=+pGZw3FTFYX0NdM3RCCNoB5wrejY5dMIea8ed3laJNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLwuYKUfP+AMUtvNjSDLE30eNM4IrzHp8qbd/86onKzaYvyXUP75599W67FJOQ/PDAOcQi42vQPqrxM7vtMSMQQbZjGNt0oU5Sg3gECQHyeQ4818S7+byJbxJCBldmcouDruhMyy/BrHgXGxEyzYlRp3Mes68H1vXrFMYpPbJuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XT62ffBK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XT62ffBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51ECC4CEEF;
	Sat, 12 Jul 2025 17:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752342172;
	bh=+pGZw3FTFYX0NdM3RCCNoB5wrejY5dMIea8ed3laJNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XT62ffBKtI8kHsasgFZRrTXV2FoYIF00anz3mzwIUPSg23g43di1Sbg16J69x2H8L
	 +fdWwnE9gd5aPDM+lnyDgTH5bBUY96RVtlywez5XaEUKfbNJ31T6gNwKegnstU2gkO
	 x2nrg6rLaZnTAUHVXXYkX3u8xxbu+dofZ+44iVA9Q3iX3csXw5WZrur+IionzMEEWC
	 QNuQcmuIypAt8qFgDGDrp2C+4WGSb2qj18dkR+odhFwssedcyi3eCL63Zyj0hOdrEv
	 rrSAQFCEG31MHS2Er6RmvrUNMDv+XRCyXXycFQ3XMnjhglK6nu9zvXeHgMRbAkZ5GO
	 xS83pg4EURufA==
Message-ID: <5597644b-267d-40d0-aa33-a8a665cebd70@kernel.org>
Date: Sat, 12 Jul 2025 19:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
To: Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: William Mcvicker <willmcvicker@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com, sudeep.holla@arm.com
References: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250711-gs101-cpuidle-v6-1-503ec55fc2f9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/07/2025 15:50, Peter Griffin wrote:
>  
>  #include <linux/soc/samsung/exynos-regs-pmu.h>
> @@ -35,6 +37,14 @@ struct exynos_pmu_context {
>  	const struct exynos_pmu_data *pmu_data;
>  	struct regmap *pmureg;
>  	struct regmap *pmuintrgen;
> +	/*
> +	 * Serialization lock for CPU hot plug and cpuidle ACPM hint
> +	 * programming. Also protects the in_hotplug flag.
> +	 */
> +	raw_spinlock_t cpupm_lock;
> +	bool *in_hotplug;

This should be bitmap - more obvious code.

> +	atomic_t sys_suspended;
> +	atomic_t sys_rebooting;
>  };
>  
>  void __iomem *pmu_base_addr;
> @@ -221,6 +231,15 @@ static const struct regmap_config regmap_smccfg = {
>  	.reg_read = tensor_sec_reg_read,
>  	.reg_write = tensor_sec_reg_write,
>  	.reg_update_bits = tensor_sec_update_bits,
> +	.use_raw_spinlock = true,
> +};
> +
> +static const struct regmap_config regmap_pmu_intr = {
> +	.name = "pmu_intr_gen",
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.use_raw_spinlock = true,
>  };
>  
>  static const struct exynos_pmu_data gs101_pmu_data = {
> @@ -330,13 +349,19 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
>  EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>  


...

> +/* Called from CPU PM notifier (CPUIdle code path) with IRQs disabled */
> +static int gs101_cpu_pmu_offline(void)
> +{
> +	int cpu;
> +
> +	raw_spin_lock(&pmu_context->cpupm_lock);
> +	cpu = smp_processor_id();
> +
> +	if (pmu_context->in_hotplug[cpu]) {
> +		raw_spin_unlock(&pmu_context->cpupm_lock);
> +		return NOTIFY_BAD;
> +	}
> +
> +	__gs101_cpu_pmu_offline(cpu);
> +	raw_spin_unlock(&pmu_context->cpupm_lock);
> +
> +	return NOTIFY_OK;
> +}
> +
> +/* Called from CPU hot plug callback with IRQs enabled */
> +static int gs101_cpuhp_pmu_offline(unsigned int cpu)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&pmu_context->cpupm_lock, flags);
> +	/*
> +	 * Mark this CPU as entering hotplug. So as not to confuse
> +	 * ACPM the CPU entering hotplug should not enter C2 idle state.
> +	 */
> +	pmu_context->in_hotplug[cpu] = true;
> +	__gs101_cpu_pmu_offline(cpu);
> +
> +	raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int gs101_cpu_pm_notify_callback(struct notifier_block *self,
> +					unsigned long action, void *v)
> +{
> +	switch (action) {
> +	case CPU_PM_ENTER:
> +		/*
> +		 * Ignore CPU_PM_ENTER event in reboot or
> +		 * suspend sequence.
> +		 */
> +
> +		if (atomic_read(&pmu_context->sys_suspended) ||
> +		    atomic_read(&pmu_context->sys_rebooting))

I don't get exactly why you need here atomics. You don't have here
barriers, so ordering is not kept (non-RMW atomics are unordered), so
maybe ordering was not the problem to be solved here. But then you don't
use these at all as RMW and this is even explicitly described in atomic doc!

"Therefore, if you find yourself only using the Non-RMW operations of
atomic_t, you do not in fact need atomic_t at all and are doing it wrong."

And it is right. READ/WRITE_ONCE gives you the same.

The question is whether you need ordering or barriers in general
(atomics don't give you these) - you have here control dependency
if-else, however it is immediately followed with gs101_cpu_pmu_offline()
which will use spin-lock (so memory barrier).

Basically you should have here comment explaining why there is no
barrier - you rely on barrier from spin lock in next calls.

And if my reasoning is correct, then you should use just READ/WRITE_ONCE.


> +			return NOTIFY_OK;
> +
> +		return gs101_cpu_pmu_offline();
> +
> +	case CPU_PM_EXIT:
> +
> +		if (atomic_read(&pmu_context->sys_rebooting))
> +			return NOTIFY_OK;
> +
> +		return gs101_cpu_pmu_online();
> +	}
> +
> +	return NOTIFY_OK;
> +}

The rest looked fine.


Best regards,
Krzysztof
