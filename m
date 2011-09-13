From: Subash Patel <subashrp@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Setup consistent dma size at boot time
Date: Tue, 13 Sep 2011 10:12:49 +0530
Message-ID: <4E6EDF49.2000708@gmail.com>
References: <1315806945-3102-1-git-send-email-tushar.behera@linaro.org> <4E6E1F08.7030407@gmail.com> <4E6ECE39.2030300@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:34607 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983Ab1IMEmz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Sep 2011 00:42:55 -0400
Received: by pzk37 with SMTP id 37so319494pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Sep 2011 21:42:54 -0700 (PDT)
In-Reply-To: <4E6ECE39.2030300@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, Jon Medhurst <tixy@yxit.co.uk>

My bad. I am still referring to drivers/video/samsung/s3cfb_main.c in 
Linaro-3.0 kernel. Thanks for the pointer. This makes sense now.

Also, we will not be able to use CMA directly, even after it gets 
mainlined. It needs to be called from the dma_alloc_*() with appropriate 
attributes.

Regards,
Subash

On 09/13/2011 09:00 AM, Tushar Behera wrote:
> Hi Subash,
>
> On Monday 12 September 2011 08:32 PM, Subash Patel wrote:
>> Hi Tushar,
>>
>> On 09/12/2011 11:25 AM, Tushar Behera wrote:
>>> Some of the boards under mach-exynos4 initialize frame-buffers
>>> for which the memory requirement is more than 2MB (Nuri board requires
>>> around 4MB, Origen requires around 2.6MB), hence the default dma pool
>>> allocation size of 2MB is not sufficient. The consistent dma size is
>>> hence increased to successfully allocate memory for those boards.
>>>
>>> Depends on "ARM: Add init_consistent_dma_size()"
>>> by Jon Medhurst (99d1717dd7fecf2b10195b0d864323b952b4eba0).
>>>
>>> CC: Jon Medhurst<tixy@yxit.co.uk>
>>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>>> ---
>>> arch/arm/mach-exynos4/cpu.c | 2 ++
>>> 1 files changed, 2 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
>>> index 2d8a40c..45d8bfa 100644
>>> --- a/arch/arm/mach-exynos4/cpu.c
>>> +++ b/arch/arm/mach-exynos4/cpu.c
>>> @@ -10,6 +10,7 @@
>>>
>>> #include<linux/sched.h>
>>> #include<linux/sysdev.h>
>>> +#include<linux/dma-mapping.h>
>>>
>>> #include<asm/mach/map.h>
>>> #include<asm/mach/irq.h>
>>> @@ -136,6 +137,7 @@ static void exynos4_idle(void)
>>> void __init exynos4_map_io(void)
>>> {
>>> iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
>>> + init_consistent_dma_size(SZ_8M);
>>>
>>
>> I think CMA is being used to allocate the FB in origen machine. In that
>> case, increasing the consistent memory is not useful. If the memory is
>> increased in the consistent DMA area, how can that be useful to s3cfb?
>>
> We are using dma_alloc_writecombine to allocate frame buffer memory.
> Ref: linux/drivers/video/s3c-fb.c:s3c_fb_alloc_memory().
>
> CMA is not yet part of the mainline kernel and hence there is no way the
> FB can use CMA for memory allocation.
>> Regards,
>> Subash
>>
>>
>>> /* initialize device information early */
>>> exynos4_default_sdhci0();
>
>
