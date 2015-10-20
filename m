From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 7/7] ARM: EXYNOS: Remove code for restart and poweroff for
 exynos SoCs
Date: Tue, 20 Oct 2015 09:20:32 +0900
Message-ID: <562588D0.4030404@samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
 <1445234635-3950-8-git-send-email-alim.akhtar@samsung.com>
 <562494F8.6070003@samsung.com> <5624BE39.7020605@osg.samsung.com>
 <CAJKOXPcvKeDNwof5eyD5XjzUiZrHoyShD8gOPGo7uUxEyypQbw@mail.gmail.com>
 <CAGOxZ50nH1UtRrA4nJTvYdsiydNWUvY413gY0q7tRaDFaX_T1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20375 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751993AbbJTAUi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 20:20:38 -0400
In-reply-to: <CAGOxZ50nH1UtRrA4nJTvYdsiydNWUvY413gY0q7tRaDFaX_T1Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, kgene <kgene@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 20.10.2015 01:06, Alim Akhtar wrote:
>>>
>>>> Previously this code was always compiled in for ARCH_EXYNOS. Now it is
>>>> not so I am thinking about selecting necessary drivers from main exynos
>>>> Kconfig symbol. That could be tricky though, because "select" should be
>>>> used only for non-visible symbols.
>>>>
>>>> Any ideas how to solve that?
>>>>
>>>
>>> Is true that select should only be used for non-visible symbols but there
>>> are others user visible symbols that are selected by ARCH_EXYNOS such as
>>> EXYNOS_THERMAL. So I think selecting the regmap syscon reset stuff there
>>> is a sensible option.
>>
>> Selecting from defconfig is not sufficient... since I do not have
>> other idea than selecting then ovak, but Alim please check it whether
>> it does not create circular dependencies on various configs.
>>
> I checked in multi_v7_defconfig SYSCON_RESET is already enabled by
> default. so I doubt we are going to run into any circular
> dependencies, will check again..thanks.

The circular dependency does not happen when some defconfig selects it.
Instead it could happen when some other Kconfig symbol selects such (and
there are more dependencies).

So what I am saying here, after adding "select SYSCON_RESET" in
mach-exynos/Kconfig, please build configs:
1. allyes
2. allmod,
3. multi_v7,
4. (and of course) exynos.

Best regards,
Krzysztof
