From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/6] ARM: EXYNOS: Staticize exynos_subsys
Date: Thu, 10 Apr 2014 14:32:04 +0200
Message-ID: <53468F44.3050109@samsung.com>
References: <1397118296-6846-1-git-send-email-sachin.kamat@linaro.org>
 <1397118296-6846-3-git-send-email-sachin.kamat@linaro.org>
 <534661C7.9090304@samsung.com>
 <CAK9yfHwAM0d5JsrhKGP0gkrjQLxGFE0+oEjv26N5jsFnvYku9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:63025 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030371AbaDJMcL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 08:32:11 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3T006RJETJ9190@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Apr 2014 13:32:07 +0100 (BST)
In-reply-to: <CAK9yfHwAM0d5JsrhKGP0gkrjQLxGFE0+oEjv26N5jsFnvYku9A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene.kim@samsung.com>

On 10.04.2014 11:22, Sachin Kamat wrote:
> Hi Tomasz,
>
> On 10 April 2014 14:47, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Sachin,
>>
>>
>> On 10.04.2014 10:24, Sachin Kamat wrote:
>>>
>>> 'exynos_subsys' is now local to this file. Make it static
>>> and remove the declaration from header file.
>>>
>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>> ---
>>>    arch/arm/mach-exynos/exynos.c            |    2 +-
>>>    arch/arm/plat-samsung/include/plat/cpu.h |    1 -
>>>    2 files changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>>> index 6a5fe18ec9b1..0ef42b9efd36 100644
>>> --- a/arch/arm/mach-exynos/exynos.c
>>> +++ b/arch/arm/mach-exynos/exynos.c
>>> @@ -284,7 +284,7 @@ void __init exynos_init_io(void)
>>>          of_scan_flat_dt(exynos_fdt_map_sysram, NULL);
>>>    }
>>>
>>> -struct bus_type exynos_subsys = {
>>> +static struct bus_type exynos_subsys = {
>>>          .name           = "exynos-core",
>>>          .dev_name       = "exynos-core",
>>>    };
>>> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h
>>> b/arch/arm/plat-samsung/include/plat/cpu.h
>>> index 5992b8dd9b89..930b4be832cd 100644
>>> --- a/arch/arm/plat-samsung/include/plat/cpu.h
>>> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
>>> @@ -239,7 +239,6 @@ extern struct bus_type s3c2443_subsys;
>>>    extern struct bus_type s3c6410_subsys;
>>>    extern struct bus_type s5p64x0_subsys;
>>>    extern struct bus_type s5pv210_subsys;
>>> -extern struct bus_type exynos_subsys;
>>>
>>>    extern void (*s5pc1xx_idle)(void);
>>>
>>>
>>
>> This struct and registration of it do not seem to be needed for anything
>> anymore. Would you consider removing it instead?
>
> I had considered removing that while I was doing other code consolidation
> of this file. However I found that without this, the system failed to boot. I
> did not look much into it then. Probably I can revisit it and if it
> doesn't cause
> any boot issue, will remove it.
>

Hmm, I don't see why it could break anything as I can't find any users 
of it. Anyway I just tested removing this code on Exynos4412-trats2 
board and didn't find any problems.

Best regards,
Tomasz
