From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Should check for IS_ERR(clk) instead of NULL
Date: Fri, 20 Apr 2012 12:25:01 +0200
Message-ID: <4F91397D.6090509@samsung.com>
References: <1334722134-14545-1-git-send-email-jhbird.choi@samsung.com>
 <4F8F586C.3020401@samsung.com> <4F8FCC00.10807@samsung.com>
 <20120419090325.GC24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41725 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754294Ab2DTKZE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Apr 2012 06:25:04 -0400
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M2R00FNBWXMYU@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Apr 2012 11:24:58 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M2R00BJEWXN1F@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Apr 2012 11:25:00 +0100 (BST)
In-reply-to: <20120419090325.GC24211@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, jhbird.choi@gmail.com, linux-samsung-soc@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>

On 04/19/2012 11:03 AM, Russell King - ARM Linux wrote:
> On Thu, Apr 19, 2012 at 10:25:36AM +0200, Sylwester Nawrocki wrote:
>> On 04/19/2012 02:12 AM, Kukjin Kim wrote:
>>>> --- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
>>>> +++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
>>>> @@ -25,7 +25,7 @@ static inline void arch_wdt_reset(void)
>>>>
>>>>   	__raw_writel(0, S3C2410_WTCON);	  /* disable watchdog, to be safe  */
>>>>
>>>> -	if (s3c2410_wdtclk)
>>>> +	if (!IS_ERR(s3c2410_wdtclk))
>>>
>>> Yeah, right. BTW don't we need to check NULL here?
>>
>> It might make sense to check for NULL as well, but only if it happens
>> that a clock entry is ever added to clkdev with null struct clk_lookup:clk
>> member.
> 
> Not quite the correct answer.  The correct answer is:
> 
> Drivers have no business interpreting anything but IS_ERR() values from
> clk_get() as errors.  Everything else they _MUST_ assume is valid for
> the rest of the clk API.
> 
> The clue: struct clk is an opaque cookie as far as drivers are concerned.
> The only interpretation drivers are allowed to make is that IS_ERR()
> values indicate an error.  Everything else is potentially valid.

Thanks for the clarification. I stand corrected.
