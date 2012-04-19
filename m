From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Should check for IS_ERR(clk) instead of NULL
Date: Thu, 19 Apr 2012 10:25:36 +0200
Message-ID: <4F8FCC00.10807@samsung.com>
References: <1334722134-14545-1-git-send-email-jhbird.choi@samsung.com>
 <4F8F586C.3020401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56043 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753946Ab2DSIZj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Apr 2012 04:25:39 -0400
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M2P005B2WQL1I@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Apr 2012 09:25:33 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M2P00641WQN0Y@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Apr 2012 09:25:35 +0100 (BST)
In-reply-to: <4F8F586C.3020401@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: jhbird.choi@gmail.com, linux-samsung-soc@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>

On 04/19/2012 02:12 AM, Kukjin Kim wrote:
>> --- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
>> +++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
>> @@ -25,7 +25,7 @@ static inline void arch_wdt_reset(void)
>>
>>   	__raw_writel(0, S3C2410_WTCON);	  /* disable watchdog, to be safe  */
>>
>> -	if (s3c2410_wdtclk)
>> +	if (!IS_ERR(s3c2410_wdtclk))
> 
> Yeah, right. BTW don't we need to check NULL here?

It might make sense to check for NULL as well, but only if it happens
that a clock entry is ever added to clkdev with null struct clk_lookup:clk
member. This in turn seems impossible with the current clock code at
plat-samsung/clock.c.

>>   		clk_enable(s3c2410_wdtclk);
>>
>>   	/* put initial values into count and data */

--
Regards,
Sylwester
