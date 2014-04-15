From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv2 3/8] ARM: EXYNOS: Add IO mapping for PMU of Exynos3250
Date: Tue, 15 Apr 2014 17:51:15 +0900
Message-ID: <534CF303.6050100@samsung.com>
References: <1397527192-21988-1-git-send-email-cw00.choi@samsung.com>
 <4788081.xvaJfdGTMu@wuerfel> <534CEEA8.6020800@samsung.com>
 <5677551.At1Foxml9e@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64723 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750911AbaDOIvS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 04:51:18 -0400
In-reply-to: <5677551.At1Foxml9e@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, t.figa@samsung.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, chanho61.park@samsung.com, olof@lixom.net, marc.zyngier@arm.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

On 04/15/2014 05:46 PM, Arnd Bergmann wrote:
> On Tuesday 15 April 2014 17:32:40 Chanwoo Choi wrote:
>> On 04/15/2014 05:11 PM, Arnd Bergmann wrote:
>>> On Tuesday 15 April 2014 10:59:47 Chanwoo Choi wrote:
>>
>>> I don't think we have a patch for the PMU yet, Sachin was looking at the SYSRAM
>>> only.
>>
>> You are right. Sachin's patch only included the solution of SYSRAM memory mapping.
>> I set out the plan that I would implment proper driver for PMU memory mapping
>> instead of static method after merged Sachin's patch for SYSRAM.
>>
>> But,
>> If you'd like me to implment PMU memory mapping instead of static mapping right now,
>> I'll implement it for PMU such as Sachin's patch on next posting(v3).
> 
> I don't really want to merge a new SoC type until these are resolved, so
> it would definitely be better to implement this for v3.
> 

OK,
I'll rebase this patch on following patch which support PMU memory mapping through DT.

[1] http://www.spinics.net/lists/arm-kernel/msg316013.html

Thanks for your review.

Best Regards,
Chanwoo Choi
