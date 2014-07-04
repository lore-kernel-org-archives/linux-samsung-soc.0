From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Remove unused code in common.h
Date: Sat, 05 Jul 2014 06:53:56 +0900
Message-ID: <53B72274.1040305@samsung.com>
References: <1403524814-14735-1-git-send-email-sachin.kamat@samsung.com> <CAK5sBcFjTMjTG=+gAdKh77q=vrRqonfZDe_vJEkyOkE9W0FK7g@mail.gmail.com> <53B666E3.4090106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:56639 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755939AbaGDVyC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 17:54:02 -0400
Received: by mail-pa0-f47.google.com with SMTP id kq14so2431867pab.20
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jul 2014 14:54:01 -0700 (PDT)
In-Reply-To: <53B666E3.4090106@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On 07/04/14 17:33, Tomasz Figa wrote:
> Hi Sachin,
>
> On 04.07.2014 10:29, Sachin Kamat wrote:
>> On Mon, Jun 23, 2014 at 5:30 PM, Sachin Kamat<sachin.kamat@samsung.com>  wrote:
>>> PINCTRL_EXYNOS is always selected by Exynos platform in its
>>> machine Kconfig. Thus the code in the else part is never used.
>>> Remove it.
>>>
>>> Signed-off-by: Sachin Kamat<sachin.kamat@samsung.com>
>>> ---
>>>   arch/arm/mach-exynos/common.h |    4 ----
>>>   1 file changed, 4 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
>>> index 1ee91763fa7c..3371669dabc6 100644
>>> --- a/arch/arm/mach-exynos/common.h
>>> +++ b/arch/arm/mach-exynos/common.h
>>> @@ -125,11 +125,7 @@ void exynos_init_late(void);
>>>
>>>   void exynos_firmware_init(void);
>>>
>>> -#ifdef CONFIG_PINCTRL_EXYNOS
>>>   extern u32 exynos_get_eint_wake_mask(void);
>>> -#else
>>> -static inline u32 exynos_get_eint_wake_mask(void) { return 0xffffffff; }
>>> -#endif
>>>
>>>   #ifdef CONFIG_PM_SLEEP
>>>   extern void __init exynos_pm_init(void);
>>> --
>>> 1.7.9.5
>>>
>>
>> Ping..
>>
>
> For this change alone:
>
> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>
Applied, thanks.

- Kukjin


> However I can see much more unused code in that header, more
> specifically prototypes of mct_init() (replaced with DT-based init) and
> most of other *init*() functions (which are now all in one file). Do you
> plan to remove them as well?
