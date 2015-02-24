From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 2/8] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Tue, 24 Feb 2015 21:15:41 +0900
Message-ID: <54EC6B6D.3050301@samsung.com>
References: <1424755011-15999-1-git-send-email-cw00.choi@samsung.com>
 <19309272.tlWX2xvTnx@wuerfel> <54EC3DE7.7070306@samsung.com>
 <5937606.zM91rlE7sS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21881 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbbBXMPn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 07:15:43 -0500
In-reply-to: <5937606.zM91rlE7sS@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: kgene@kernel.org, mark.rutland@arm.com, marc.zyngier@arm.com, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, a.kesavan@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/24/2015 06:50 PM, Arnd Bergmann wrote:
> On Tuesday 24 February 2015 18:01:27 Chanwoo Choi wrote:
>> On 02/24/2015 05:33 PM, Arnd Bergmann wrote:
>>> On Tuesday 24 February 2015 14:16:45 Chanwoo Choi wrote:
>>>> This patch adds new Exynos5433 dtsi to support 64-bit Exynos5433 SoC based on
>>>> Octal core CPUs (quad Cortex-A57 and quad Cortex-A53). And Exynos5433 supports
>>>> PSCI (Power State Coordination Interface) v0.1.
>>>>
>>>> This patch includes following dt node to support Exynos5433 SoC:
>>>> 1. Octa core for big.LITTLE architecture
>>>> - Cortex-A53 LITTLE Quad-core
>>>> - Cortex-A57 big Quad-core
>>>> - Support PSCI v0.1
>>>
>>> Should we try to come up with a way to better share parts of this with the
>>> exynos5 dtsi files you already have in arm32? I suspect that there is a
>>> significant overlap.
>>
>> Currently, 32-bit Exynos5 SoC (which is included in arch/arm/boot/dts)
>> didn't support the Cortex-A53/A57 and PSCI.
>>
>> The 32-bit Exynos5 SoC support the Coretex-A7 or A15 and big.LITTLE Exynos5 SoC
>> use the MCPM (Multi-Cluster PM) driver for secondary cpu on/off instead of PSCI.
>>
> 
> Yes, I understand that. What I meant is sharing the nodes that are identical
> between e.g. all exynos54xx by using a common .dtsi file that can be included
> by 5420, 5433 and 5440.

Exynos5433 use the quite different base address of each IP from Exynos5250/5420/5800.
Exynos5433 SoC cannot use the devicetree node in Exynos5 dtsi (arch/arm/boot/dts/exynos5.dtsi).

Thanks,
Chanwoo Choi
