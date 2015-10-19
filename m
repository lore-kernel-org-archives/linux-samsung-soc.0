From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 7/7] ARM: EXYNOS: Remove code for restart and poweroff for
 exynos SoCs
Date: Mon, 19 Oct 2015 15:53:51 +0530
Message-ID: <5624C4B7.30507@samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
 <1445234635-3950-8-git-send-email-alim.akhtar@samsung.com>
 <562494F8.6070003@samsung.com> <5624BE39.7020605@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58055 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752970AbbJSKdE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 06:33:04 -0400
In-reply-to: <5624BE39.7020605@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org



On 10/19/2015 03:26 PM, Javier Martinez Canillas wrote:
> Hello,
>
> On 10/19/2015 09:00 AM, Krzysztof Kozlowski wrote:
>> On 19.10.2015 15:03, Alim Akhtar wrote:
>>> Now we can use the generic syscon-{reboot/poweroff} drivers,
>>> so we don't need special handling for reboot/poweroff in
>>> exynos pmu driver. This patch remove the same.
>>>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>>   arch/arm/mach-exynos/pmu.c |   43 -------------------------------------------
>>>   1 file changed, 43 deletions(-)
>>
>> I think that removal of this stuff will effectively remove the
>> restart/poweroff handlers from:
>> 1. Other defconfigs, like multi_v7
>> 2. Custom configs.
>>
>
> This will also break old DTBs that don't have a "syscon-poweroff" device
> node that contains the necessary PMU regmap, offset and mask information.
>
>> Previously this code was always compiled in for ARCH_EXYNOS. Now it is
>> not so I am thinking about selecting necessary drivers from main exynos
>> Kconfig symbol. That could be tricky though, because "select" should be
>> used only for non-visible symbols.
>>
>> Any ideas how to solve that?
>>
>
> Is true that select should only be used for non-visible symbols but there
> are others user visible symbols that are selected by ARCH_EXYNOS such as
> EXYNOS_THERMAL. So I think selecting the regmap syscon reset stuff there
> is a sensible option.
>
Yes, another example is MFD_SYSYCON which is selected from Kconfig.
Also CONFIG_POWER_RESET_SYSCON is enable in arch/arm64/config/defconfig.
So both approaches are taken here.
will go with maintainer suggestion here.
>> Best regards,
>> Krzysztof
>>
>
> Best regards,
>
