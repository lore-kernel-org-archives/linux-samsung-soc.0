Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDA446BF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763727411; cv=none; b=u7HvNoUi6+pnaA9pOFkkXr3vLimUs9OSo9i5vPaC8kdfc4uNMN7LhlEjd6g2N+eAOdoSqJuOUWyWll/9MJLFN0zCFOgkw77V5XtU1fCsM3ZgihM86OV1psrbMD9D3rCU87HIFirpDoamwHmklOkLytyc7g+kUfw3DN+MCXFhJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763727411; c=relaxed/simple;
	bh=pYGeCrdyt27PhilJEtumyd8gpgw9wkAYKQ6jKk97U0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=MeiT1KeQ5g4hHuhIqqsJ6rzqsorTtvooZuxy1Qv2BESQG3E2viINYgChf1RTKaJDszYdYh0Ri0TvwsgzeFwFIXqdJFYil2i+EC7MA9ndUwQbmSYdN6C6Ci5oWsAHxFE6slzwB1/NyxiK+ibFSZnoWBjGmvu579wMooT4loT1N+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=N/mnyrvJ; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="N/mnyrvJ"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251121121646euoutp01f539d9f8f1089455f2dca37713d9b343~6BLs9t2fZ3202432024euoutp01Q
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Nov 2025 12:16:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251121121646euoutp01f539d9f8f1089455f2dca37713d9b343~6BLs9t2fZ3202432024euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763727406;
	bh=UjHhJGIAC9ACfZdzl+a0sh7VEg935VcUUd1+5PZGvGE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=N/mnyrvJLfliUKMvo22G6w0gdto6R8S+4k6pJM9amxLSNzQMZlzd1gSl9/sVQ0n9x
	 OIz58tPzbD5qUKPrvagdbfwv1Fod0lU11qm2T8u5hIgT+9VdIgTE0QsXaeF/L5lkpM
	 7d0/PcO5pqy/+DDa+PtDjOSIr371DFmC7BYIJ9fo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251121121645eucas1p12dd30c192405728ec413d4acb98ce092~6BLsdBTd13162331623eucas1p1d;
	Fri, 21 Nov 2025 12:16:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251121121644eusmtip19a898de384c5ea010a269f3050f82b2a~6BLrQslbf0867308673eusmtip1D;
	Fri, 21 Nov 2025 12:16:44 +0000 (GMT)
Message-ID: <691f464e-1c91-4752-8218-74b9ebf49018@samsung.com>
Date: Fri, 21 Nov 2025 13:16:43 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v6 0/6] Add module support for Arm64 Exynos MCT driver
To: Will McVicker <willmcvicker@google.com>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
	Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
	Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, John
	Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, Peter
	Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251121121645eucas1p12dd30c192405728ec413d4acb98ce092
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251120184253eucas1p17d9dea24d56e4eefc283a738a94f2634
X-EPHeader: CA
X-CMS-RootMailID: 20251120184253eucas1p17d9dea24d56e4eefc283a738a94f2634
References: <CGME20251120184253eucas1p17d9dea24d56e4eefc283a738a94f2634@eucas1p1.samsung.com>
	<20251120184242.1625820-1-willmcvicker@google.com>

On 20.11.2025 19:42, Will McVicker wrote:
> This series adds support to build the Arm64 Exynos MCT driver as a module.
> This is only possible on Arm64 SoCs since they can use the Arm architected
> timer as the clocksource. Once the Exynos MCT module is loaded and the
> device probes, the MCT is used as the wakeup source for the arch_timer to
> ensure the device can wakeup from the "c2" idle state.
>
> These patches are originally from the downstream Pixel 6 (gs101) kernel
> found at [1] and have been adapted for upstream. Not only has the Exynos MCT
> driver been shipping as a module in the field with Android, but I've also
> tested this series with the upstream kernel on my Pixel 6 Pro.
>
> To verify the module on Pixel 6 Pro is used and the arch_timer is used as the
> main clocksource, I ran these tests:
>
> # lsmod | grep exynos_mct
> exynos_mct             24576  9 [permanent]
>
> $ cat /proc/interrupts | grep -E "mct|arch_timer"
>   23:        222        171        211        139        184        124        825        378    GICv3  30 Level     arch_timer
> 117:          1          0          0          0          0          0          0          0    GICv3 785 Level     mct_comp_irq
> 118:        228          0          0          0          0          0          0          0    GICv3 789 Level     mct_tick0
> 119:          0        351          0          0          0          0          0          0    GICv3 790 Level     mct_tick1
> 120:          0          0       1490          0          0          0          0          0    GICv3 791 Level     mct_tick2
> 121:          0          0          0        325          0          0          0          0    GICv3 792 Level     mct_tick3
> 122:          0          0          0          0         97          0          0          0    GICv3 793 Level     mct_tick4
> 123:          0          0          0          0          0        150          0          0    GICv3 794 Level     mct_tick5
> 124:          0          0          0          0          0          0        188          0    GICv3 795 Level     mct_tick6
> 125:          0          0          0          0          0          0          0        157    GICv3 796 Level     mct_tick7
>
> # cat /sys/devices/system/clocksource/clocksource0/current_clocksource
> arch_sys_counter
>
> I also compile tested for ARCH=ARM DEFCONFIG=multi_v7_defconfig with the
> following debug configs to ensure the section mismatches are fixed:
>    CONFIG_DEBUG_SECTION_MISMATCH=y
>    # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>
> Any additional testing is much appreciated!

Works fine on 32bit Exynos systems in my test farm!

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> Thanks,
> Will
>
> Note1, instructions to build and flash a Pixel 6 device with the upstream
> kernel can be found at [2].
>
> Note2, this series is based off of krzk/for-next commit 870f6ca955ea ("Merge
> branch 'next/clk' into for-next").
>
> [1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-raviole-5.10-android12-d1
> [2] https://gitlab.com/LinaroLtd/googlelt/pixelscripts/-/blob/clo/main/README.md?ref_type=heads
>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Donghoon Yu <hoony.yu@samsung.com>
> Cc: Hosung Kim <hosung0.kim@samsung.com>
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
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: kernel-team@android.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
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
> Donghoon Yu (2):
>    clocksource/drivers/exynos_mct: Don't register as a sched_clock on
>      arm64
>    clocksource/drivers/exynos_mct: Add module support for ARM64
>
> Hosung Kim (1):
>    clocksource/drivers/exynos_mct: Set percpu local timer interrupts for
>      ARM64
>
> Will McVicker (3):
>    ARM: make register_current_timer_delay() accessible after init
>    clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
>    arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
>
>   arch/arm/lib/delay.c             |  2 +-
>   arch/arm64/Kconfig.platforms     |  1 -
>   drivers/clocksource/Kconfig      |  3 +-
>   drivers/clocksource/exynos_mct.c | 87 +++++++++++++++++++++++++++-----
>   4 files changed, 78 insertions(+), 15 deletions(-)
>
>
> base-commit: 870f6ca955ea3f23b4d7824c815c81180a6d7c48

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

