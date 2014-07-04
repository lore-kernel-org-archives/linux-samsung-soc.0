From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Remove unused code in common.h
Date: Fri, 4 Jul 2014 14:25:28 +0530
Message-ID: <CAK5sBcFi9OEpZD-YaXro+OZ9i73YNSNFwrtUYyCn2X6n5oHh7A@mail.gmail.com>
References: <1403524814-14735-1-git-send-email-sachin.kamat@samsung.com>
	<CAK5sBcFjTMjTG=+gAdKh77q=vrRqonfZDe_vJEkyOkE9W0FK7g@mail.gmail.com>
	<53B666E3.4090106@gmail.com>
	<CAK5sBcEd6+hu5jrQTRCNYdhAHS9PSfxmrJyDkAHTLfNwEz=OGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:39917 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754394AbaGDIz3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 04:55:29 -0400
Received: by mail-lb0-f169.google.com with SMTP id l4so974044lbv.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jul 2014 01:55:28 -0700 (PDT)
In-Reply-To: <CAK5sBcEd6+hu5jrQTRCNYdhAHS9PSfxmrJyDkAHTLfNwEz=OGA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Tomasz,

On Fri, Jul 4, 2014 at 2:13 PM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
> Hi Tomasz,
>
> On Fri, Jul 4, 2014 at 2:03 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Sachin,
>>
>> On 04.07.2014 10:29, Sachin Kamat wrote:
>>> On Mon, Jun 23, 2014 at 5:30 PM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
>>>> PINCTRL_EXYNOS is always selected by Exynos platform in its
>>>> machine Kconfig. Thus the code in the else part is never used.
>>>> Remove it.
>>>>
>>>> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>>>> ---
>>>>  arch/arm/mach-exynos/common.h |    4 ----
>>>>  1 file changed, 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
>>>> index 1ee91763fa7c..3371669dabc6 100644
>>>> --- a/arch/arm/mach-exynos/common.h
>>>> +++ b/arch/arm/mach-exynos/common.h
>>>> @@ -125,11 +125,7 @@ void exynos_init_late(void);
>>>>
>>>>  void exynos_firmware_init(void);
>>>>
>>>> -#ifdef CONFIG_PINCTRL_EXYNOS
>>>>  extern u32 exynos_get_eint_wake_mask(void);
>>>> -#else
>>>> -static inline u32 exynos_get_eint_wake_mask(void) { return 0xffffffff; }
>>>> -#endif
>>>>
>>>>  #ifdef CONFIG_PM_SLEEP
>>>>  extern void __init exynos_pm_init(void);
>>>> --
>>>> 1.7.9.5
>>>>
>>>
>>> Ping..
>>>
>>
>> For this change alone:
>>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
> Thanks.
>
>>
>> However I can see much more unused code in that header, more
>> specifically prototypes of mct_init() (replaced with DT-based init) and
>> most of other *init*() functions (which are now all in one file). Do you
>> plan to remove them as well?
>
> Sure. I will remove those too.

Some of the things that you suggested are already taken care of in the
patch at [1].
So will keep my patch in the current format and later if something else is
needed will send separate patch to avoid merge conflicts. What say?

[1] https://lkml.org/lkml/2014/6/25/375

Regards,
Sachin.
