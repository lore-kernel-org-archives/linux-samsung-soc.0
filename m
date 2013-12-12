From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH 0/5] Power Related Fixes for Exynos5250
Date: Thu, 12 Dec 2013 08:12:50 +0530
Message-ID: <CAM4voa=Vxy72EzRTNmraRgPz7WeJX1QSU6dC2bLjHi=5t9arHw@mail.gmail.com>
References: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
	<1474895.cu1U1Gy5We@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f176.google.com ([209.85.216.176]:61813 "EHLO
	mail-qc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882Ab3LLCmv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 21:42:51 -0500
Received: by mail-qc0-f176.google.com with SMTP id i8so5818677qcq.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2013 18:42:50 -0800 (PST)
In-Reply-To: <1474895.cu1U1Gy5We@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Yadwinder Singh Brar <yadi.brar@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, jonghwa3.lee@samsung.com, Douglas Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Tomasz,

On Wed, Dec 11, 2013 at 6:11 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Abhilash,
>
> On Wednesday 11 of December 2013 17:27:04 Abhilash Kesavan wrote:
>> Patch 1 prevents the gating of sysreg clock on Exynos5250.
>> Patch 2 is a re-send of an earlier patch.
>> (http://www.spinics.net/lists/linux-samsung-soc/msg15485.html)
>> Patches 3 and 4 are fixes for MAX77686 on Exynos5250 based Snow
>> board (boot-up issues).
>> Patch 5 implements a power-off call-back for Exynos5250 that can
>> be re-used for Exynos5420.
>>
>> The patches have been tested on an SMDK5250 based Chromebook.
>>
>> Abhilash Kesavan (4):
>>   clk: samsung: exynos5250: Add CLK_IGNORE_UNUSED flag for the sysreg
>>     clock
>>   ARM: EXYNOS5: Fix PMU register configuration for local power blocks
>>   clk: max77686: Replace is_enabled() with is_prepared call-back
>>   ARM: dts: Setup the interrupt parent for max77686
>>
>> Olof Johansson (1):
>>   ARM: EXYNOS5250: Implement pm_power_off
>>
>>  arch/arm/boot/dts/cros5250-common.dtsi       |   11 ++++
>>  arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
>>  arch/arm/mach-exynos/pmu.c                   |   86 ++++++++++++++++++++------
>>  drivers/clk/clk-max77686.c                   |    4 +-
>>  drivers/clk/samsung/clk-exynos5250.c         |    3 +-
>>  5 files changed, 86 insertions(+), 21 deletions(-)
>
> You used the old and now invalid address of DT mailing list.
>
> Anyway, there is no need to send patches for .dts* files to DT mailing
> list anymore. Just changes in drivers that affect how they handle data
> from DT and binding documentation (Documentation/devicetree/.*). So
> please drop the DT mailing list in next iteration of the series.

Thanks for the pointer. I'll take care in the future.
>
> Best regards,
> Tomasz
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
