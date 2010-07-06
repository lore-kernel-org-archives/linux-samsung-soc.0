From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] ARM: S5P: Add PMU device
Date: Tue, 06 Jul 2010 10:48:01 +0900
Message-ID: <4C328B51.5000500@samsung.com>
References: <1278294411-5104-1-git-send-email-jy0922.shim@samsung.com>
 <4C31C47C.1050905@gmail.com> <006c01cb1c41$a0af5c10$e20e1430$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31407 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752051Ab0GFBsE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jul 2010 21:48:04 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5400KSJ501YW30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Jul 2010 10:48:01 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L54007KU5018H@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Jul 2010 10:48:01 +0900 (KST)
In-reply-to: <006c01cb1c41$a0af5c10$e20e1430$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Maurus Cuelenaere' <mcuelenaere@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org

On 7/5/2010 9:57 PM, Kukjin Kim wrote:
> Maurus Cuelenaere wrote:
>>  Op 05-07-10 03:46, Joonyoung Shim schreef:
>>> This patch adds an initcall for the s5p platforms so that they register
>>> their PMU IRQs with the PMU framework in the Kernel.
>>>
>>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>>> ---
>>>  arch/arm/mach-s5p6442/include/mach/irqs.h |    2 +-
>>>  arch/arm/mach-s5pc100/include/mach/irqs.h |    1 +
>>>  arch/arm/mach-s5pv210/include/mach/irqs.h |    1 +
>>>  arch/arm/plat-s5p/Makefile                |    1 +
>>>  arch/arm/plat-s5p/dev-pmu.c               |   37
>> +++++++++++++++++++++++++++++
>>>  5 files changed, 41 insertions(+), 1 deletions(-)
>>>  create mode 100644 arch/arm/plat-s5p/dev-pmu.c
>> Wouldn't it be better if this was in plat-samsung? I can see that the S3C6410
>> datasheet mentions a PMU_IRQ_ENABLE bit in SYS_OTHERS so I suspect that it
>> has
>> the same functionality (even though there's no mention of which interrupt this
>> is).
>>
> Yes, I also found PMU_IRQ_ENABLE bit in System Others register of S3C6410 datasheet. But as your comments, could not found the interrupt number and any description...Actually, need to check whether it's available or not.
> 

Right, please check it, i cannot do it.

> And S5P6440 has it.
> So Joonyoung, it would be helpful if you could add 6440 PMUIRQ (VIC1[23]) in this patch.
> 

It already was added.

> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> 
> 
