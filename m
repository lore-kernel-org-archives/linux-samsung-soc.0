From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Add clocks for EXYNOS Audio Subsystem.
Date: Wed, 29 Aug 2012 17:37:13 +0530
Message-ID: <503E05F1.8050903@linaro.org>
References: <1343218056-30432-1-git-send-email-padma.v@samsung.com> <031501cd6f98$dd67c550$98374ff0$%kim@samsung.com> <CAAgF-Bdp817_RD3n6Sdo9zi=OrB4-Uiu5PDt4UB1BL-f0M4aJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:47393 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752801Ab2H2MHX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 08:07:23 -0400
Received: by pbbrr13 with SMTP id rr13so1092483pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Aug 2012 05:07:22 -0700 (PDT)
In-Reply-To: <CAAgF-Bdp817_RD3n6Sdo9zi=OrB4-Uiu5PDt4UB1BL-f0M4aJg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rcsekar@samsung.com, sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, olofj@google.com, thutt@chromium.org, joshi@samsung.com

On 08/01/2012 06:39 PM, Padma Venkat wrote:
> Hi,
> 
> On Wed, Aug 1, 2012 at 9:21 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> Padmavathi Venna wrote:
>>>
>>> Audiocdclk frequency is 16.9344MHz in SMDK5250 and this clock is
>>> board specific. So this patch adds a function to set the required
>>> audio codec clk frequency from machine file.
>>>
>>> This patch also adds all the required clock instances for audio
>>> subsystem and adds the clock alias names for i2sclk and busclk.
>>>
>>> Signed-off-by: Taylor Hutt <thutt@chromium.org>
>>> Signed-off-by: sangsu4u.park <sangsu4u.park@samsung.com>
>>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>>> ---
>>>  arch/arm/mach-exynos/clock-exynos5.c           |  129
>>> ++++++++++++++++++++++++
>>>  arch/arm/mach-exynos/common.h                  |    1 +
>>>  arch/arm/mach-exynos/include/mach/regs-audss.h |   12 ++
>>>  arch/arm/mach-exynos/mach-exynos5-dt.c         |    1 +
>>>  4 files changed, 143 insertions(+), 0 deletions(-)
>>>

[...]

>>> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
>>> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
>>> @@ -69,6 +69,7 @@ static void __init exynos5250_dt_machine_init(void)
>>>  {
>>>       of_platform_populate(NULL, of_default_bus_match_table,
>>>                               exynos5250_auxdata_lookup, NULL);
>>> +     exynos5_set_audiocdclk_rate(16934400);
>>
>> As you commented, the value of clock can be changed according to the board,
>> and this file, mach-exynos5-dt.c is not only for smdk5250, now there is no
>> board for exynos5250 though.
> Please suggest me some file where I can call this function then.
>>

Will it be a good idea to split this into two patches, one adding basic
audio subsystem defines and another one adding specific support for EXYNOS5?


>> [...]
>>
>> Thanks.
>>
>> Best regards,
>> Kgene.
> 
> Thanks for your review.
> 
> Best Regards
> Padma
>> --
>> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
>> SW Solution Development Team, Samsung Electronics Co., Ltd.
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Tushar Behera
