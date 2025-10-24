Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB2332EC4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 16:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761321725; cv=none; b=OKgNNUfTl5bEuPe2KmGyLfofBolegJ7bYzuCG3k76bWLrDU/E//wEryoGAwXR3dv3QVk0xtpjhY29snow7+lddD/IufLZsiwsAq4pXMtO35WCTeREwKi3OrXSArAUursr1zQyNRi9YKJ79lea9dhCqmwVoyOx7CoDWyWcdW2l5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761321725; c=relaxed/simple;
	bh=1ug7A3mOZrGeWd/Rzt+yJHRcpIvwTYP5BB9SnW7CpnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Ykh2KIYZXHq3WQZia24lYX0Y2+4+Gj6p2E1aRhiWBSpWUnzwBHQHXT0KlFClN72bQmBrJmJDFZB97NZTwA4gFGXpHKt7mMvuHK2e4fxRCoolder6BBdPscyBhqYAYdg39m+E861Y5gjVZ1PWcdbiMFmgp+s0XY94Wrz+RUvwil4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=V/mLSGd+; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="V/mLSGd+"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251024160155euoutp01dc9a28a918c5dbdcdb1d78b62f2b9764~xeMTH6gz12395023950euoutp01d
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 16:01:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251024160155euoutp01dc9a28a918c5dbdcdb1d78b62f2b9764~xeMTH6gz12395023950euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761321715;
	bh=Z2YCwLGa2MhaukmLh5mLstroKMu1Oe9RmJGj54Raf4U=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=V/mLSGd+PNgYjzt8A8U4GzwRVcjLqZGhmZ3I7otCWaIKsf/ympw+J2E9+CZUg+Z2H
	 n302pwdFA1NYz0fqMnzH7p2JW1HvlpeEvg/7Ut6E04D8buEGqmne87BSClR+urERtu
	 l7qkn1xTBVkPG6xaRRMgccIzKCwjqAgoGBLWeP2I=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251024160155eucas1p22cf28a5bc04ac9ea6bd32260abf32112~xeMSctpLS0527105271eucas1p24;
	Fri, 24 Oct 2025 16:01:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251024160153eusmtip2ce7463592396f996413bf3cd359e5ae4~xeMRY8Nyc1017610176eusmtip2B;
	Fri, 24 Oct 2025 16:01:53 +0000 (GMT)
Message-ID: <6fc8731e-6e8c-4c45-9b3b-509a1fb71a1a@samsung.com>
Date: Fri, 24 Oct 2025 18:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 6/7] clocksource/drivers/exynos_mct: Add module
 support
To: William McVicker <willmcvicker@google.com>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof
	Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Ingo
	Molnar <mingo@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>, Donghoon Yu <hoony.yu@samsung.com>,
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, John
	Stultz <jstultz@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <aPuhDFKINM9iXOKb@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251024160155eucas1p22cf28a5bc04ac9ea6bd32260abf32112
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251023205319eucas1p24eb9821bbcb2d59e2cb1e01c4366faab
X-EPHeader: CA
X-CMS-RootMailID: 20251023205319eucas1p24eb9821bbcb2d59e2cb1e01c4366faab
References: <20251023205257.2029526-1-willmcvicker@google.com>
	<CGME20251023205319eucas1p24eb9821bbcb2d59e2cb1e01c4366faab@eucas1p2.samsung.com>
	<20251023205257.2029526-7-willmcvicker@google.com>
	<40d3f3c9-7526-440b-9dbd-7ead22c8562a@samsung.com>
	<aPuhDFKINM9iXOKb@google.com>

On 24.10.2025 17:53, William McVicker wrote:
> On 10/24/2025, Marek Szyprowski wrote:
>> On 23.10.2025 22:52, Will McVicker wrote:
>>> From: Donghoon Yu <hoony.yu@samsung.com>
>>>
>>> On Arm64 platforms the Exynos MCT driver can be built as a module. On
>>> boot (and even after boot) the arch_timer is used as the clocksource and
>>> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
>>> source for the arch_timer.
>>>
>>> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
>>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> Signed-off-by: Will McVicker <willmcvicker@google.com>
>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>> [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
>>> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
>>> Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
>>> ---
>>>    drivers/clocksource/Kconfig      |  3 +-
>>>    drivers/clocksource/exynos_mct.c | 56 +++++++++++++++++++++++++++-----
>>>    2 files changed, 49 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>>> index ffcd23668763..9450cfaf982f 100644
>>> --- a/drivers/clocksource/Kconfig
>>> +++ b/drivers/clocksource/Kconfig
>>> @@ -451,7 +451,8 @@ config ATMEL_TCB_CLKSRC
>>>    	  Support for Timer Counter Blocks on Atmel SoCs.
>>>    
>>>    config CLKSRC_EXYNOS_MCT
>>> -	bool "Exynos multi core timer driver" if COMPILE_TEST
>>> +	tristate "Exynos multi core timer driver" if ARM64
>>> +	default y if ARCH_EXYNOS || COMPILE_TEST
>>>    	depends on ARM || ARM64
>>>    	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
>>>    	help
>>> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
>>> index fece6bbc190e..a87caf3928ef 100644
>>> --- a/drivers/clocksource/exynos_mct.c
>>> +++ b/drivers/clocksource/exynos_mct.c
>>> @@ -15,9 +15,11 @@
>>>    #include <linux/cpu.h>
>>>    #include <linux/delay.h>
>>>    #include <linux/percpu.h>
>>> +#include <linux/module.h>
>>>    #include <linux/of.h>
>>>    #include <linux/of_irq.h>
>>>    #include <linux/of_address.h>
>>> +#include <linux/platform_device.h>
>>>    #include <linux/clocksource.h>
>>>    #include <linux/sched_clock.h>
>>>    
>>> @@ -217,6 +219,7 @@ static struct clocksource mct_frc = {
>>>    	.mask		= CLOCKSOURCE_MASK(32),
>>>    	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
>>>    	.resume		= exynos4_frc_resume,
>>> +	.owner		= THIS_MODULE,
>>>    };
>>>    
>>>    /*
>>> @@ -241,7 +244,7 @@ static cycles_t exynos4_read_current_timer(void)
>>>    }
>>>    #endif
>>>    
>>> -static int __init exynos4_clocksource_init(bool frc_shared)
>>> +static int exynos4_clocksource_init(bool frc_shared)
>>>    {
>>>    	/*
>>>    	 * When the frc is shared, the main processor should have already
>>> @@ -336,6 +339,7 @@ static struct clock_event_device mct_comp_device = {
>>>    	.set_state_oneshot	= mct_set_state_shutdown,
>>>    	.set_state_oneshot_stopped = mct_set_state_shutdown,
>>>    	.tick_resume		= mct_set_state_shutdown,
>>> +	.owner			= THIS_MODULE,
>>>    };
>>>    
>>>    static irqreturn_t exynos4_mct_comp_isr(int irq, void *dev_id)
>>> @@ -476,6 +480,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
>>>    	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT |
>>>    			CLOCK_EVT_FEAT_PERCPU;
>>>    	evt->rating = MCT_CLKEVENTS_RATING;
>>> +	evt->owner = THIS_MODULE;
>>>    
>>>    	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
>>>    
>>> @@ -511,7 +516,7 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
>>>    	return 0;
>>>    }
>>>    
>>> -static int __init exynos4_timer_resources(struct device_node *np)
>>> +static int exynos4_timer_resources(struct device_node *np)
>>>    {
>>>    	struct clk *mct_clk, *tick_clk;
>>>    
>>> @@ -539,7 +544,7 @@ static int __init exynos4_timer_resources(struct device_node *np)
>>>     * @local_idx: array mapping CPU numbers to local timer indices
>>>     * @nr_local: size of @local_idx array
>>>     */
>>> -static int __init exynos4_timer_interrupts(struct device_node *np,
>>> +static int exynos4_timer_interrupts(struct device_node *np,
>>>    					   unsigned int int_type,
>>>    					   const u32 *local_idx,
>>>    					   size_t nr_local)
>>> @@ -653,7 +658,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
>>>    	return err;
>>>    }
>>>    
>>> -static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
>>> +static int mct_init_dt(struct device_node *np, unsigned int int_type)
>>>    {
>>>    	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
>>>    	u32 local_idx[MCT_NR_LOCAL] = {0};
>>> @@ -701,15 +706,48 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
>>>    	return exynos4_clockevent_init();
>>>    }
>>>    
>>> -
>>> -static int __init mct_init_spi(struct device_node *np)
>>> +static int mct_init_spi(struct device_node *np)
>>>    {
>>>    	return mct_init_dt(np, MCT_INT_SPI);
>>>    }
>>>    
>>> -static int __init mct_init_ppi(struct device_node *np)
>>> +static int mct_init_ppi(struct device_node *np)
>>>    {
>>>    	return mct_init_dt(np, MCT_INT_PPI);
>>>    }
>>> -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>>> -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
>>> +
>>> +static int exynos4_mct_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	int (*mct_init)(struct device_node *np);
>>> +
>>> +	mct_init = of_device_get_match_data(dev);
>>> +	if (!mct_init)
>>> +		return -EINVAL;
>>> +
>>> +	return mct_init(dev->of_node);
>>> +}
>>> +
>>> +static const struct of_device_id exynos4_mct_match_table[] = {
>>> +	{ .compatible = "samsung,exynos4210-mct", .data = &mct_init_spi, },
>>> +	{ .compatible = "samsung,exynos4412-mct", .data = &mct_init_ppi, },
>>> +	{}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
>>> +
>>> +static struct platform_driver exynos4_mct_driver = {
>>> +	.probe		= exynos4_mct_probe,
>>> +	.driver		= {
>>> +		.name	= "exynos-mct",
>>> +		.of_match_table = exynos4_mct_match_table,
>>> +	},
>>> +};
>>> +
>>> +static __init int exynos_mct_init(void)
>>> +{
>>> +  return platform_driver_register(&exynos4_mct_driver);
>>> +}
>>> +module_init(exynos_mct_init);
>>> +
>>> +MODULE_DESCRIPTION("Exynos Multi Core Timer Driver");
>>> +MODULE_LICENSE("GPL");
>> Sorry, but this still won't work on legacy ARM 32bit systems with MCT as
>> the only clocksource, which needs a driver available very early (that's
>> why it used TIMER_OF_DECLAREmacro). You need to make it conditional
>> under CONFIG_ARM:
> Can we rely on the bootloader to setup the MCT timer and then hand-off at boot
> once the driver is initialized?

I'm not sure if we can expect anything from the legacy bootloaders and 
kernel requires timer quite early during boot, much earlier than kernel 
modules get initialized.


> Daniel was working on a solution to transparently handle calling
> TIMER_OF_DECLARE() when a timer driver can be configured as both a module or
> built-in here:
>
>    https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/
>
> Daniel, do you have plans to finish that? In the meantime, can we go with the
> `#if CONFIG_ARM` solution?
>
> Thanks,
> Will
>
> <snip>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

