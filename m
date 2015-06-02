From: Chanho Park <parkch98@gmail.com>
Subject: Re: [PATCHv3] ARM: dts: add exynos5422-cpus.dtsi to correct cpu order
Date: Tue, 2 Jun 2015 21:49:42 +0900
Message-ID: <CAPTzV1502Z9HS6Njq4v82-DLuSy3s4-CmA8On3PSM-JMCNUnQw@mail.gmail.com>
References: <1433161459-10901-1-git-send-email-chanho61.park@samsung.com>
	<84k2vmwzxc.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f175.google.com ([209.85.160.175]:36682 "EHLO
	mail-yk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753758AbbFBMtn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 08:49:43 -0400
Received: by yked142 with SMTP id d142so53250683yke.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2015 05:49:42 -0700 (PDT)
In-Reply-To: <84k2vmwzxc.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>
Cc: kgene@kernel.org, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, jy0922.shim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, heesub.shin@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, b.zolnierkie@samsung.com, Chanho Park <chanho61.park@samsung.com>

Hi Peter,

On Tue, Jun 2, 2015 at 12:29 PM, Peter Chubb <peter.chubb@nicta.com.au> wrote:
>>>>>> "Chanho" == Chanho Park <parkch98@gmail.com> writes:
>
> Chanho> The odroid-xu3 board which is based on exynos5422 not
> Chanho> exynos5800 is booted from cortex-a7 core unlike
> Chanho> exynos5800. The odroid-xu3's cpu order is quite strange. cpu0
> Chanho> and cpu5-7 are cortex-a7 cores and cpu1-4 are cortex-a15
> Chanho> cores. To correct this mis-odering, I added exynos5422.dtsi
> Chanho> and reversing cpu orders from exynos5420. Now, cpu0-3 are
> Chanho> cortex-a7 and cpu4-7 are cortex-a15.
>
> Does this patch make any difference?  CPUs are numbered in the kernel
> in the order they're enumerated; with this patch or using the old dts
> I see the CPUs numbered the same after boot.  And only 5 of the 8 come
> up: processor 0 is an A7; processors 1 through 4 are A15.

My patch is just reordering cpu order not fix previous Little core problem.
You'll need below patch from previous mail thread[1].

diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c

index a825bca..e803ec5 100644

--- a/arch/arm/mach-exynos/platsmp.c

+++ b/arch/arm/mach-exynos/platsmp.c

@@ -124,6 +124,7 @@ void exynos_cpu_power_up(int cpu)

        if (soc_is_exynos3250())

                core_conf |= S5P_CORE_AUTOWAKEUP_EN;



+       pmu_raw_writel(1, S5P_PMU_SPARE2);

        pmu_raw_writel(core_conf,

                        EXYNOS_ARM_CORE_CONFIGURATION(cpu));

 }

[1]: https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg44023.html


-- 
Best Regards,
Chanho Park
