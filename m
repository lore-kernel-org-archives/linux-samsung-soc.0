From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: Exynos : Fix build error with thumb2
Date: Thu, 12 Jun 2014 00:13:53 +0900
Message-ID: <53987231.6080200@samsung.com>
References: <1401119625-11309-1-git-send-email-santosh.shukla@linaro.org>	<20140602101023.GB3855@e103592.cambridge.arm.com> <CA+iXiiO8ED9rdyxXh9ooDhb9OcBRH52acbqA7cgGX9kvgYaCXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:55363 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751049AbaFKPOE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 11:14:04 -0400
Received: by mail-pb0-f45.google.com with SMTP id um1so7581447pbc.32
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jun 2014 08:14:03 -0700 (PDT)
In-Reply-To: <CA+iXiiO8ED9rdyxXh9ooDhb9OcBRH52acbqA7cgGX9kvgYaCXg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Santosh Shukla <santosh.shukla@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux@arm.linux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, "t.figa" <t.figa@samsung.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

On 06/04/14 17:07, Santosh Shukla wrote:
> On 2 June 2014 15:40, Dave Martin<Dave.Martin@arm.com>  wrote:
>> On Mon, May 26, 2014 at 09:23:45PM +0530, Santosh Shukla wrote:
>>> From: santosh shukla<santosh.shukla@linaro.org>
>>>
>>> Add non-global symbol .LLl2x0_regs_phys to avoid build break in thumb2 mode.
>>>
>>> IIUC, arm assembler fail to load value of "global" variable
>>> l2xo_regs_phys for thum2 mode and wrapping it in non-global symbol like
>>> .Ll2x0_regs_phys solves the build break issue.
>>>
>>> arch/arm/mach-exynos/sleep.S: Assembler messages:
>>> arch/arm/mach-exynos/sleep.S:57: Error: invalid immediate for address
>>> calculation (value = 0x00000004)
>>>
>>> fix inspired from [1]
>>>
>>> [1] https://lkml.org/lkml/2010/3/31/235
>>>
>>> Signed-off-by: santosh shukla<santosh.shukla@linaro.org>
>>
>> Reviewed-by: Dave Martin<Dave.Martin@arm.com>
>>
>
> Thanks.
>
> Hi Kukjin, if this patch ok with you then can you pick it up.
>
Sure, I've applied this into fixes for 3.16.

Thanks,
Kukjin


>> The binutils folks insist that this is not a bug in gas.  (I disagreed, but
>> it's a grey area.)  This is the established pattern for working round this
>> issue -- looks fine to me.
>>
>> Cheers
>> ---Dave
