From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 3/7] ARCH: EXYNOS: split up exynos3250 SoC specific PMU
 data
Date: Fri, 06 Nov 2015 09:35:46 +0900
Message-ID: <563BF5E2.60902@samsung.com>
References: <1445864143-25695-1-git-send-email-pankaj.dubey@samsung.com>
 <1445864143-25695-4-git-send-email-pankaj.dubey@samsung.com>
 <563813F8.6000201@samsung.com> <563AE9B5.2020808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25800 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965328AbbKFAfx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 19:35:53 -0500
In-reply-to: <563AE9B5.2020808@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com

On 05.11.2015 14:31, Pankaj Dubey wrote:
> Hi Krzysztof,
> 
> On Tuesday 03 November 2015 07:25 AM, Krzysztof Kozlowski wrote:
>> On 26.10.2015 21:55, Pankaj Dubey wrote:
>>> This patch splits up mach-exynos/pmu.c file, and moves exynos3250 PMU
>>> configuration data and functions handing those data into exynos3250
>>> SoC specific PMU file mach-exynos/exynos3250-pmu.c.
>>>
>>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>>> ---
>>>   arch/arm/mach-exynos/Makefile         |   2 +-
>>>   arch/arm/mach-exynos/exynos-pmu.h     |  47 +++++++++
>>>   arch/arm/mach-exynos/exynos3250-pmu.c | 175
>>> +++++++++++++++++++++++++++++++
>>>   arch/arm/mach-exynos/pmu.c            | 189
>>> +---------------------------------
>>>   4 files changed, 224 insertions(+), 189 deletions(-)
>>>   create mode 100644 arch/arm/mach-exynos/exynos-pmu.h
>>>   create mode 100644 arch/arm/mach-exynos/exynos3250-pmu.c
>>>

I spotted it now - please fix subject prefix in patches 3-6.
ARM: EXYNOS:

BR
