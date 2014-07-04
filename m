From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Remove unused code in common.h
Date: Fri, 04 Jul 2014 10:33:39 +0200
Message-ID: <53B666E3.4090106@gmail.com>
References: <1403524814-14735-1-git-send-email-sachin.kamat@samsung.com> <CAK5sBcFjTMjTG=+gAdKh77q=vrRqonfZDe_vJEkyOkE9W0FK7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:51797 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbaGDId7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 04:33:59 -0400
Received: by mail-wi0-f171.google.com with SMTP id n15so12648046wiw.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jul 2014 01:33:58 -0700 (PDT)
In-Reply-To: <CAK5sBcFjTMjTG=+gAdKh77q=vrRqonfZDe_vJEkyOkE9W0FK7g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>

Hi Sachin,

On 04.07.2014 10:29, Sachin Kamat wrote:
> On Mon, Jun 23, 2014 at 5:30 PM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
>> PINCTRL_EXYNOS is always selected by Exynos platform in its
>> machine Kconfig. Thus the code in the else part is never used.
>> Remove it.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>> ---
>>  arch/arm/mach-exynos/common.h |    4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
>> index 1ee91763fa7c..3371669dabc6 100644
>> --- a/arch/arm/mach-exynos/common.h
>> +++ b/arch/arm/mach-exynos/common.h
>> @@ -125,11 +125,7 @@ void exynos_init_late(void);
>>
>>  void exynos_firmware_init(void);
>>
>> -#ifdef CONFIG_PINCTRL_EXYNOS
>>  extern u32 exynos_get_eint_wake_mask(void);
>> -#else
>> -static inline u32 exynos_get_eint_wake_mask(void) { return 0xffffffff; }
>> -#endif
>>
>>  #ifdef CONFIG_PM_SLEEP
>>  extern void __init exynos_pm_init(void);
>> --
>> 1.7.9.5
>>
> 
> Ping..
> 

For this change alone:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

However I can see much more unused code in that header, more
specifically prototypes of mct_init() (replaced with DT-based init) and
most of other *init*() functions (which are now all in one file). Do you
plan to remove them as well?

Best regards,
Tomasz
