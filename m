From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 02/12] ARM: EXYNOS: remove usage of soc_is_exynosMMMM
 from pm.c
Date: Fri, 7 Apr 2017 14:24:12 +0200
Message-ID: <CAJKOXPf0O_3CZY5terJ7Vtu9yhf6AwD5ACOBuCrpTNa9Etd=5Q@mail.gmail.com>
References: <CGME20170330131421epcas5p40b0ad9c1003d3ab807667ae2b05d25bc@epcas5p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
 <1490879826-16754-3-git-send-email-pankaj.dubey@samsung.com>
 <CAJKOXPcDO_4JonsxoywQq_D_AcWQsP8NnAsFMw1VsAhOgjLW0g@mail.gmail.com> <6cf529ca-a28a-6757-39aa-5ef2e5391e16@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:44996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933605AbdDGMYR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 08:24:17 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
        by mail.kernel.org (Postfix) with ESMTP id DD9E92024D
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 12:24:15 +0000 (UTC)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com [209.85.223.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09ACE20279
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 12:24:13 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id b140so48380257iof.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Apr 2017 05:24:13 -0700 (PDT)
In-Reply-To: <6cf529ca-a28a-6757-39aa-5ef2e5391e16@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>

On Fri, Apr 7, 2017 at 2:12 PM, pankaj.dubey <pankaj.dubey@samsung.com> wrote:
>
>
> On Friday 07 April 2017 01:54 PM, Krzysztof Kozlowski wrote:
>> On Thu, Mar 30, 2017 at 3:16 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>>> soc_is_exynosMMMM is staged for removal after adopting to exynos-chipid
>>> driver, so let's remove/minimize usage of any such helper function usage
>>> from pm.c.
>>>
>>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>>> ---
>>>  arch/arm/mach-exynos/pm.c                   | 22 ++++++++++++----------
>>>  include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
>>>  2 files changed, 15 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
>>> index 1a7e5b5..4a73b02 100644
>>> --- a/arch/arm/mach-exynos/pm.c
>>> +++ b/arch/arm/mach-exynos/pm.c
>>> @@ -123,11 +123,13 @@ int exynos_pm_central_resume(void)
>>>  }
>>>
>>>  /* Ext-GIC nIRQ/nFIQ is the only wakeup source in AFTR */
>>> -static void exynos_set_wakeupmask(long mask)
>>> +static void exynos_set_wakeupmask(void)
>>>  {
>>> -       pmu_raw_writel(mask, S5P_WAKEUP_MASK);
>>> -       if (soc_is_exynos3250())
>>> +       if (of_machine_is_compatible("samsung,exynos3250")) {
>>> +               pmu_raw_writel(EXYNOS3_WAKEUP_MASK_VAL, S5P_WAKEUP_MASK);
>>>                 pmu_raw_writel(0x0, S5P_WAKEUP_MASK2);
>>> +       } else
>>> +               pmu_raw_writel(EXYNOS_WAKEUP_MASK_VAL, S5P_WAKEUP_MASK);
>>
>> You need {} around this too. Checkpatch should complain about it as
>> well so be sure to run it.
>>
>
> I ran checkpatch before posting, but it didn't complain about this. Here
> is the result when I ran it again today on the same patch.
>
> ./scripts/checkpatch.pl
> exynos-chipid-v9/0002-ARM-EXYNOS-remove-usage-of-soc_is_exynosMMMM-from-pm.patch
>
> total: 0 errors, 0 warnings, 81 lines checked
>
> exynos-chipid-v9/0002-ARM-EXYNOS-remove-usage-of-soc_is_exynosMMMM-from-pm.patch
> has no obvious style problems and is ready for submission.

Ahh, okay, my bad. :)
But anyway please fix it.

Best regards,
Krzysztof
