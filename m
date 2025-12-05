Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D71030FF30
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928542; cv=none; b=ecFnFwrrAKEzXIMID9DS7SXP8ecyzaUVM0lcKAc46F+Qo4hD/KS7s4VPZPVt3FhFHhrkKk4xmfsNOVUhBbl7nKeQx0dwCkuzOhKruOlsmZ1fLcjZpW2cYVhHSVwLmdUPnLcwOyEuSOA9Mg16Ler8qtGClURCkYdkO60ajBlNYng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928542; c=relaxed/simple;
	bh=qeq1qeVNiTWcW+ifjVUFDSx11aCp8cvIw+ibrb5M9JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Vx5Cz7d69NvwUneYqGtWI3C/+vsbtTX3JbRYywcPafi4YLOD31YBnZhAlExcOfgPjzowHQMLM+IyyHpkqlP/e75HD8yVyccT88H574k28kbuAzQybdgMqdArEJh9YTzalCo019CzphWL/fXWn0JwT2Wsjnu9K3I/Q36670aNGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rjzlEPSs; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rjzlEPSs"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251205095524euoutp01a276d0e085428e935ea4438058535e85~_SSR0_ttK1464014640euoutp01H
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Dec 2025 09:55:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251205095524euoutp01a276d0e085428e935ea4438058535e85~_SSR0_ttK1464014640euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764928524;
	bh=oG/e/R0PPkHFkI16XoV2QWWbc7zrzT3YMNu3HZYjOic=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rjzlEPSsHHG8uoafhi2ejOyAj4OELE5NqS6odMWOQ6JKvpAMJ2z/deM/NLCeAceyN
	 FkFzcaKBfl4YUtvbqEunNz2SInCMmDW/Z5v+EbuF7qfeAOGzBy6cCsxNb+awTWgjuu
	 rjuAhz+zyxRsXvfoHSTekBm/Kkl+rwelBQCynlZM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251205095524eucas1p185064dd92492fc4a6cc45221d660a74b~_SSRM4e5W2892728927eucas1p1Q;
	Fri,  5 Dec 2025 09:55:24 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251205095522eusmtip1651c1628e115cd65bbb8e9696d67370b~_SSPT2f-b2241422414eusmtip16;
	Fri,  5 Dec 2025 09:55:22 +0000 (GMT)
Message-ID: <b81adc49-6e8a-49a6-9377-acd304ccfbc4@samsung.com>
Date: Fri, 5 Dec 2025 10:55:20 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v7 0/6] Add module support for Arm64 Exynos MCT driver
To: Will McVicker <willmcvicker@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof
	Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, John
	Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, Peter
	Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Russell
 King (Oracle)" <linux@armlinux.org.uk>, linux-samsung-soc@vger.kernel.org,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251205095524eucas1p185064dd92492fc4a6cc45221d660a74b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251205011037eucas1p2bfaec27d78550b53099ebb0ca8713b2f
X-EPHeader: CA
X-CMS-RootMailID: 20251205011037eucas1p2bfaec27d78550b53099ebb0ca8713b2f
References: <CGME20251205011037eucas1p2bfaec27d78550b53099ebb0ca8713b2f@eucas1p2.samsung.com>
	<20251205011027.720512-1-willmcvicker@google.com>

On 05.12.2025 02:10, Will McVicker wrote:
> This series adds support to build the Arm64 Exynos MCT driver as a module.
> This is only possible on Arm64 SoCs since they can use the Arm architected
> timer as the clocksource. Once the Exynos MCT module is loaded and the device
> probes, the MCT is used as the wakeup source for the arch_timer to ensure the
> device can wakeup from the "c2" idle state.
>
> These patches are originally from the downstream Pixel 6 (gs101) kernel found
> at [1] and have been adapted for upstream. Not only has the Exynos MCT driver
> been shipping as a module in the field with Android, but I've also tested this
> series with the upstream kernel on my Pixel 6 Pro.
>
> To the driver changes (both as built-in and as module) on Pixel 6 Pro, I ran
> these tests:
>
> # cat /proc/interrupts | grep -E "mct|arch_timer"
>   23:       6823      10938       7795       5607       8935      12828      21947       2200    GICv3  30 Level     arch_timer
> 104:          1          0          0          0          0          0          0          0    GICv3 785 Level     mct_comp_irq
> 105:        547          0          0          0          0          0          0          0    GICv3 789 Level     mct_tick0
> 106:          0       1333          0          0          0          0          0          0    GICv3 790 Level     mct_tick1
> 107:          0          0       1467          0          0          0          0          0    GICv3 791 Level     mct_tick2
> 108:          0          0          0        583          0          0          0          0    GICv3 792 Level     mct_tick3
> 109:          0          0          0          0        206          0          0          0    GICv3 793 Level     mct_tick4
> 110:          0          0          0          0          0        153          0          0    GICv3 794 Level     mct_tick5
> 111:          0          0          0          0          0          0         13          0    GICv3 795 Level     mct_tick6
> 112:          0          0          0          0          0          0          0         87    GICv3 796 Level     mct_tick7
>
> # cat /sys/devices/system/clocksource/clocksource0/current_clocksource
> arch_sys_counter
>
> When built and loaded as a module, you can verify via:
>
> # lsmod | grep exynos_mct
> exynos_mct             20480  9
>
> I also compile tested for ARCH=ARM DEFCONFIG=multi_v7_defconfig with the
> following debug configs to ensure the section mismatches are fixed:
>    CONFIG_DEBUG_SECTION_MISMATCH=y
>    # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>
> Any additional testing is much appreciated!
>
> Thanks,
> Will
>
> Note1, instructions to build and flash a Pixel 6 device with the upstream
> kernel can be found at [2].
>
> Note2, this series is based off of krzk/for-next commit bca42080637c (Merge
> branch 'next/drivers-late' into for-next).
>
> [1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-raviole-5.10-android12-d1
> [2] https://gitlab.com/LinaroLtd/googlelt/pixelscripts/-/blob/clo/main/README.md?ref_type=heads
>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Donghoon Yu <hoony.yu@samsung.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Youngmin Nam <youngmin.nam@samsung.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: André Draszik <andre.draszik@linaro.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Works fine on ARM Exynos 32bit based boards.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>
> Changes in v7:
> - Dropped v6 patch 1/6 that removed __init from register_current_timer_delay()
> - Refactored the init function in patch 4/7 to handle the case of registering
>    the timer delay function for ARM 32-bit systems from an __init tagged function.
>    This addresses the original section mismatch issues reported in v4.
> - Rebased series onto base commit bca42080637c (Merge branch
>    'next/drivers-late' into for-next).
>
> Changes in v6:
> - Updated module support to only register the MCT driver as a platform driver
>    for ARM64 to ensure ARM 32-bit SoCs continue to probe the MCT driver very
>    early.
> - Squashed the percpu fix suggested by Marek Szyprowski in
>    https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/
>    together with patch 3/6.
>
> Changes in v5:
> - Fixed section mismatch issues.
> - Addressed Arnd's concerns regarding potential issues with unloading and/or
>    unbinding the driver.
> - Fixed SoB concerns to clarify the development chain from AOSP to Linux.
> - Pulled in https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/
>    to limit percpu interrupts only for ARM64.
>
> Changes in v4:
> - Missed the "v3" string in the previous series for the actual patches
> - Re-generated patches with --base a15edf91668beefdb5171c53fa698c9b43dd1e0d
>    for kernel test robot.
>
> Changes in v3:
> - Rebased on top of Daniel's timer modularization prep series [3] and
>    krzk/for-next commit a15edf91668b ("Merge branch 'next/dt64' into
>    for-next")
> - Added owner references to Exynos MCT clocksource and clockevent objects.
> - Dropped #ifdef MODULE conditional section in favor of just using
>    module_platform_driver() which will properly handle setting up the
>    of_device_id table based on if the driver is built-in or a module.
> - Update commit message for patch 2 based on John's feedback.
> - Dropped DT change from v2 as it was picked up by Krzysztof for CPU Idle.
>
> Changes in v2:
> - Re-worked patch v1 5 based on Rob Herring's review to use the compatible
>    data for retrieving the mct_init function pointer.
> - Updated the Kconfig logic to disallow building the Exynos MCT driver as
>    a module for ARM32 configurations based on Krzysztof Kozlowski's findings.
> - Added comments and clarified commit messages in patches 1 and 2 based on
>    reviews from John Stultz and Youngmin Nam.
> - Fixed an issue found during testing that resulted in the device getting
>    stuck on boot. This is included in v2 as patch 5.
> - Collected *-by tags
> - Rebased to the latest linux-next/master.
> ---
>
> Donghoon Yu (1):
>    clocksource/drivers/exynos_mct: Don't register as a sched_clock on
>      arm64
>
> Hosung Kim (1):
>    clocksource/drivers/exynos_mct: Set percpu local timer interrupts for
>      ARM64
>
> Will McVicker (4):
>    clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
>    clocksource/drivers/exynos_mct: Refactor driver init
>    clocksource/drivers/exynos_mct: Add module support for ARM64
>    arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
>
>   arch/arm64/Kconfig.platforms     |   1 -
>   drivers/clocksource/Kconfig      |   3 +-
>   drivers/clocksource/exynos_mct.c | 255 ++++++++++++++++++++++---------
>   3 files changed, 182 insertions(+), 77 deletions(-)
>
>
> base-commit: bca42080637ce3a21092fc0f7d5411e853b0c3b3

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

