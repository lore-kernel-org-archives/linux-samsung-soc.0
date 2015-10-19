From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 0/7] Switch to generic syscon regmap based drivers
Date: Mon, 19 Oct 2015 13:10:14 +0530
Message-ID: <56249E5E.80405@samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
 <562493BF.9080301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41430 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784AbbJSHuR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 03:50:17 -0400
In-reply-to: <562493BF.9080301@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org



On 10/19/2015 12:24 PM, Krzysztof Kozlowski wrote:
> On 19.10.2015 15:03, Alim Akhtar wrote:
> ...
>
> Hi,
>
> I am happy to see more contributions from your side! Keep it up. :)
>
Thank you! will keep finding time and doing it.

> However this empty space in your cover letter is the place for
> description of the patchset. What do you want to achieve here? What kind
> of problem are you solving? What features are you adding? Any dependencies?
>
Ah, my bad, I used --compose option with git-send-email and did composed 
the message, somehow it got missed. Will take care.

The motivation came when I tried to used reboot/poweroff on exynos7, and 
since exynos7 has not added/enabled PMU and does not have access to 
arch/arm/mach-exynos, so option are to have a reboot/restart driver or 
we move pmu.c out of mach-exynos. I know there where some effort in past 
to move pmu.c to drivers, but I feel that is still WIP.
And then I came across this generic syscon regmap based driver which are 
already in place, so just used it.
Hope that helps.

> Best regards,
> Krzysztof
>
>> Alim Akhtar (7):
>>    arm: dts: Add syscon-{reboot, poweroff} nodes for exynos3250 SoCs
>>    arm: dts: Add syscon-{reboot, poweroff} nodes for exynos4
>>    arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5
>>    arm: dts: Add syscon-{reboot, poweroff} nodes for exynos5410 SoC
>>    ARM: exynos_defconfig: Normalize exynos defconfig
>>    ARM: exynos_defconfig: Enable generic syscon-{reboot, poweroff}
>>      drivers
>>    ARM: EXYNOS: Remove code for restart and poweroff for exynos SoCs
>>
>>   arch/arm/boot/dts/exynos3250.dtsi |   14 ++++++++++++
>>   arch/arm/boot/dts/exynos4.dtsi    |   14 ++++++++++++
>>   arch/arm/boot/dts/exynos5.dtsi    |   14 ++++++++++++
>>   arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++
>>   arch/arm/configs/exynos_defconfig |   11 +++++-----
>>   arch/arm/mach-exynos/pmu.c        |   43 -------------------------------------
>>   6 files changed, 61 insertions(+), 49 deletions(-)
>>
>
>
