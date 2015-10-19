From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 0/7] Switch to generic syscon regmap based drivers
Date: Mon, 19 Oct 2015 22:06:25 +0530
Message-ID: <CAGOxZ53YiHjdMNhvu4YMwaOEg+Kt2iOW5M9u_pj-0BUpMbgDdA@mail.gmail.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com> <56251561.4010209@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:35663 "EHLO
	mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985AbbJSQhF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 12:37:05 -0400
In-Reply-To: <56251561.4010209@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, kgene <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Tobias,

On Mon, Oct 19, 2015 at 9:38 PM, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> Hello Alim,
>
> I tested the Exynos4 bits on a Odroid-X2 and I can confirm that
> poweroff/reboot (still) work.
>
Thanks for helping out in testing, will add your Tested-by of patch 2/7.

> With best wishes,
> Tobias
>
>
> Alim Akhtar wrote:
>> Alim Akhtar (7):
>>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos3250 SoCs
>>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos4
>>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5
>>   arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5410 SoC
>>   ARM: exynos_defconfig: Normalize exynos defconfig
>>   ARM: exynos_defconfig: Enable generic syscon-{reboot, poweroff}
>>     drivers
>>   ARM: EXYNOS: Remove code for restart and poweroff for exynos SoCs
>>
>>  arch/arm/boot/dts/exynos3250.dtsi |   14 ++++++++++++
>>  arch/arm/boot/dts/exynos4.dtsi    |   14 ++++++++++++
>>  arch/arm/boot/dts/exynos5.dtsi    |   14 ++++++++++++
>>  arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++
>>  arch/arm/configs/exynos_defconfig |   11 +++++-----
>>  arch/arm/mach-exynos/pmu.c        |   43 -------------------------------------
>>  6 files changed, 61 insertions(+), 49 deletions(-)
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
