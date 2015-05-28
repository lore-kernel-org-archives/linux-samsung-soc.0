From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] ARM: exynos: Fix wake-up interrupts for Exynos3250
Date: Thu, 28 May 2015 10:55:08 +0100
Message-ID: <5566E5FC.6020009@arm.com>
References: <1429724452-26563-1-git-send-email-marc.zyngier@arm.com> <CAJKOXPd45=c5fybCiyExdyRUZcC9p8zdZqZPPYcjiZd5x28sHw@mail.gmail.com> <0d0201d08084$93191f80$b94b5e80$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:54328 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753047AbbE1JzL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 05:55:11 -0400
In-Reply-To: <0d0201d08084$93191f80$b94b5e80$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

On 27/04/15 01:53, Kukjin Kim wrote:
> Krzysztof Kozlowski wrote:
>>
>> 2015-04-23 2:40 GMT+09:00 Marc Zyngier <marc.zyngier@arm.com>:
>>> Commit 8b283c025443 (ARM: exynos4/5: convert pmu wakeup to
>>> stacked domains) changed the Exynos PMU code to use stacked
>>> domains. This has led to a number of interrupt numbers to be
>>> fixed.
>>>
>>> In the meantime, support for Exynos 3250 was added, missing
>>> the required change to this platform. This amounts to revert
>>> ace283a04a4a (ARM: EXYNOS: Fix wrong hwirq of RTC interrupt
>>> for Exynos3250 SoC), as the initial patch was right, just a
>>> bit early...
>>>
>>> Cc: Chanwoo Choi <cw00.choi@samsung.com>
>>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>> Cc: Kukjin Kim <kgene@kernel.org>
>>> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
>>> ---
>>>  arch/arm/mach-exynos/suspend.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
> Thanks and applied.

Looks like this fix never made it to mainline. What happened?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
