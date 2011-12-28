From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Re: [PATCH 2/2] ARM: Exynos: Hook up power domains to generic power
 domain infrastructure
Date: Wed, 28 Dec 2011 12:09:07 +0100
Message-ID: <4EFAF8D3.9050204@gmail.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>	<1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>	<1323704789-23923-3-git-send-email-thomas.abraham@linaro.org>	<4EFA5154.9060606@gmail.com> <CAJuYYwTPqCdgzK+bcikNiowHxq33yAuf6B695ZZfCp2pYooxEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:60548 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753615Ab1L1LJO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 06:09:14 -0500
In-Reply-To: <CAJuYYwTPqCdgzK+bcikNiowHxq33yAuf6B695ZZfCp2pYooxEw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, patches@linaro.org

Hi Thomas,

On 12/28/2011 06:25 AM, Thomas Abraham wrote:
>>> +
>>> +static struct exynos4_pm_domain exynos4_pd_gps = {
>>> +     .base = (void __iomem *)S5P_PMU_GPS_CONF,
>>> +     .name = "pd-gps",
>>> +     .pd = {
>>> +             .power_off = exynos4_pd_power_off,
>>> +             .power_on = exynos4_pd_power_on,
>>> +     },
>>> +};
>>
>> I'm not sure if arch/arm/mach-exynos/pm.c is the right place to add this.
>> IMHO it would be much better to put PD in separate file, pm-runtime.c
>> or something like this.
> 
> Ok. I will move this to a new file pm-runtime.c.

Thanks.

>> Can we assume various exynos versions will have same S5P_PMU_*_CONF
>> addresses? For old s3c64xx SoCs such assumption could be valid but I'm
>> a bit uncertain about Exynos series.
> 
> The addresses could be different, but it can be mapped to a
> S5P_PMU_*_CONF. Maybe I did not understand your question here.

I meant that for handling the newer SoCs (e.g. exynos5) at runtime we might need
to create new power domain definitions. That's why I suggested new file
for runtime PM. mach-shmobile has even separate compilation unit per SoC,
with register definitions put directly in C file. I'm not sure we need separate
pm-exynos4.c, pm-exynos5.c... For now your patch looks good.

--

Regards,
Sylwester
