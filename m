From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix soft reboot hang after suspend/resume
Date: Fri, 14 Sep 2012 10:44:25 +0530
Message-ID: <CAG17yqQC5Sbcia1xUtWGJJQq0KVSW=HJrwRAFjJN8Ht-R3r3Dw@mail.gmail.com>
References: <1332929866-31489-1-git-send-email-inderpal.singh@linaro.org>
	<065f01cd31a9$c5f38f80$51daae80$%kim@samsung.com>
	<CAG17yqQ8o3mDCP2k0OE5PG2SXWTyWDh+_xbvKjnvmrgkxqKgZg@mail.gmail.com>
	<4FB10BEE.1010302@samsung.com>
	<CAG17yqR3v=UpT0cb4797CTLhDv5Wxe=NvB84LkMfRixv0206BA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:33128 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884Ab2INFO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Sep 2012 01:14:26 -0400
Received: by vcbfo13 with SMTP id fo13so3451451vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Sep 2012 22:14:26 -0700 (PDT)
In-Reply-To: <CAG17yqR3v=UpT0cb4797CTLhDv5Wxe=NvB84LkMfRixv0206BA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: samsung@lists.linaro.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

Hi Kukjin,

On 15 May 2012 10:01, Inderpal Singh <inderpal.singh@linaro.org> wrote:
> Hi Kukjin,
>
> On 14 May 2012 19:13, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> On 05/14/12 17:42, Inderpal Singh wrote:
>>>
>>> Hi Kukjin,
>>>
>>> On 14 May 2012 13:45, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>>>>
>>>> Inderpal Singh wrote:
>>>>>
>>>>>
>>>>> Upon wake-up, clear the sleep mode set in INFORM1 register.
>>>>>
>>>> Is this for wake-up or _really_ software reset? And is this available on
>>>> all
>>>> of EXYNOS4 SoCs?
>>>
>>>
>>> This is for soft reboot hang after one cycle of suspend/resume is
>>> complete.
>>> And yes this is applicable for all exynos SOCs.
>>>
>> Hi,
>>
>> As I know, we don't need it for all of EXYNOS SoCs but let me check about
>> the situation you said with hardware engineer tomorrow. If any updates, let
>> you know.
>>
>

Any updates on this ?
As i mentioned below, Its applicable for Origen, Pegasus and 5250 as well.

> The issue happens because u-boot checks INFROM1 register to know if
> its wake-up from sleep. Hence if INFORM1 is not cleared, the soft
> reboot after one suspend/resume cycle will be understood by u-boot as
> wake-up from sleep, so it will try to resume and will hang up.
>
> I have faced this issue on Origen, Pegasus SMDK and 5250 SMDK.
>
> Thanks,
> Inder
>
>>
>> Thanks.
>>
>> Best regards,
>> Kgene.
>> --
>> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
>> SW Solution Development Team, Samsung Electronics Co., Ltd.

With Regards,
Inder
