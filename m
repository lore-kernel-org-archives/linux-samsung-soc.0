From: Shaik Ameer Basha <shaik.samsung@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Set clock parent if provided
Date: Fri, 15 Mar 2013 14:30:23 +0530
Message-ID: <CAOD6ATqK5crLc2nzz1rf856Lw48j2hOw_YRpjS4y8g7OzaLgSQ@mail.gmail.com>
References: <1362634301-9706-1-git-send-email-shaik.ameer@samsung.com>
	<5138B3BA.9040303@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f173.google.com ([209.85.216.173]:55481 "EHLO
	mail-qc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753895Ab3COJAZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Mar 2013 05:00:25 -0400
Received: by mail-qc0-f173.google.com with SMTP id b12so1438294qca.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Mar 2013 02:00:23 -0700 (PDT)
In-Reply-To: <5138B3BA.9040303@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Sylwester,

On Thu, Mar 7, 2013 at 9:05 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 03/07/2013 06:31 AM, Shaik Ameer Basha wrote:
>> s3c_set_clksrc() updates the clock source as per u-boot settings.
>> This patch adds the functionality to overwrite u-boot settings,
>> if user provides the clock parent field. In case of wrong source
>> provided by the user, it will retain the u-boot settings.
>>
>> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
>> ---
>>  arch/arm/plat-samsung/clock-clksrc.c |    7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
>> index 786a410..4fecd80 100644
>> --- a/arch/arm/plat-samsung/clock-clksrc.c
>> +++ b/arch/arm/plat-samsung/clock-clksrc.c
>> @@ -150,7 +150,12 @@ void __init_or_cpufreq s3c_set_clksrc(struct clksrc_clk *clk, bool announce)
>>               return;
>>       }
>>
>> -     clk->clk.parent = srcs->sources[clksrc];
>> +     if (clk->clk.parent) {
>> +             if (s3c_setparent_clksrc(&clk->clk, clk->clk.parent))
>> +                     clk->clk.parent = srcs->sources[clksrc];
>> +     } else {
>> +             clk->clk.parent = srcs->sources[clksrc];
>> +     }
>
> May I ask what do you need this for ? This code won't be used for
> Exynos4 and Exynos5 SoCs starting from 3.10. And it is going to be
> removed once other platforms are converted to the new Samsung clocks
> driver.

I had some issues in exynos5 with out this implementation.
But yes... you are right, once we move to common clock framework (CCF)
we don't require this change, as CCF doesn't use this (for exynos 4/5).

What about all old non-dt based platforms?
Cant they use this change until they move to DT and CCF?

Regards,
Shaik Ameer Basha

>
> Regards,
> Sylwester
