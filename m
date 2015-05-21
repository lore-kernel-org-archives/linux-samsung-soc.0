From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [GIT PULL] ARM: EXYNOS: Improvements for 4.2, second try
Date: Thu, 21 May 2015 14:32:57 +0900
Message-ID: <555D6E09.60001@kernel.org>
References: <1431314064-17118-1-git-send-email-k.kozlowski@samsung.com> <CAJKOXPdyvQoEdxh6QPYA4r5GXq5LSGFu4=4kTasDmFMVf10S=A@mail.gmail.com> <555AD671.7050202@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37413 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751186AbbEUFdG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 01:33:06 -0400
In-Reply-To: <555AD671.7050202@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Sergiy Kibrik <sakib@meta.ua>

On 05/19/15 15:21, Kukjin Kim wrote:
> On 05/17/15 17:52, Krzysztof Kozlowski wrote:
>> 2015-05-11 12:14 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
>>> Dear Kukjin,
>>>
>>> Updated pull request, replacing also the usage of soc_is_exynos4()
>>> with of_machine_is_compatible(). You requested this in comments
>>> for "ARM: EXYNOS: Fix failed second suspend on Exynos4".
>>>
>>> This adds coupled cpuidle for Exynos3250 and improves the Exynos
>>> code in few places. Everything for upcoming 4.2 merge window.
>>> Description along with a tag.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>>
>>> The following changes since commit b82f3a05ff0b5eaf2c9900eeb34e58a6624db8d9:
>>>
>>>   ARM: EXYNOS: Fix failed second suspend on Exynos4 (2015-05-11 11:03:09 +0900)
>>>
>>> are available in the git repository at:
>>>
>>>   https://github.com/krzk/linux.git tags/samsung-for-next-4.2-2
>>>
>>> for you to fetch changes up to c91889378098ff0bb5fe6f422a3c0eb554b34930:
>>>
>>>   ARM: plat-samsung: Constify platform_device_id (2015-05-11 11:05:31 +0900)
>>>
>>> ----------------------------------------------------------------
>>> Extending cpuidle driver and improvements for Exynos based boards:
>>> 1. Replace soc_is_exynos4() with of_machine_is_compatible().
>>> 2. Add missing return-value checks and of_node_put() for power domain
>>>    driver.
>>> 3. Fix missing clk_prepare in S3C24XX ADC driver.
>>> 4. Rework clock handling when switching power domains on/off. Instead
>>>    of settting fixed parent in DTS we grab the parent clock before
>>>    turning the domain off.
>>> 5. Add coupled cpuidle support for Exynos3250 to an existing
>>>    cpuidle-exynos driver. As a result it enables AFTR mode
>>>    (ARM-Off Top-Running) to be used by default on Exynos3250
>>>    without the need to hot unplug CPU1 first.
>>> 6. Constify irq_domain_ops and platform_device_id.
>>
>> Dear Kukjin,
>>
>> Just humbly reminding - this stuff still waits for you :).
>>
> Sure, why not. I'll update it soon ;-)
> 
Done, thanks.

- Kukjin
