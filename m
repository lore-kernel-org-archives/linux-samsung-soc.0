From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add platform resource definitions for
 FIMC-LITE
Date: Tue, 08 May 2012 09:35:37 +0200
Message-ID: <4FA8CCC9.9030601@samsung.com>
References: <1336148260-19952-1-git-send-email-s.nawrocki@samsung.com>
 <017b01cd2cdd$4e4ff570$eaefe050$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37609 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752699Ab2EHHfk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 03:35:40 -0400
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M3P00C5D136O1@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 08:35:30 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M3P00AQ713DV6@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 08:35:38 +0100 (BST)
In-reply-to: <017b01cd2cdd$4e4ff570$eaefe050$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

On 05/08/2012 07:42 AM, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> Add the gate clocks and register region address definition for
>> FIMC-LITE devices available in Exynos4x12 and Exynos5 SoCs.
>>
> This is right description? I can't find your changes for EXYNOS4412 and
> EXYNOS5 here. Only this is for EXYNOS4212 SoC.

Sorry, I wasn't precise enough. EXYNOS4_PA_FIMC_LITE is for EXYNOS4212
and EXYNOS4412 though. Please note it is initially needed for DT platforms,
until we get proper clock DT bindings for EXYNOS. Is there, BTW, anyone 
known to work on converting EXYNOS to the common clock framework ?

This patch was intended for EXYNOS4212/4412. AFAICS clock code in
mach-exynos/clock-exynos4412.c is a subset of the EXYNOS4412 platform:

static void __init exynos4_init_clocks(int xtal)
{
	...
	if (soc_is_exynos4210())
		exynos4210_register_clocks();
	else if (soc_is_exynos4212() || soc_is_exynos4412())
		exynos4212_register_clocks();
	
	exynos4_register_clocks();
	...
}

Should I resend the patch or could you remove " and Exynos5 SoCs"
from the description ?

--

Regards,
Sylwester Nawrocki
