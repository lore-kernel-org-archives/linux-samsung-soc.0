From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Setup consistent dma size at boot time
Date: Tue, 13 Sep 2011 09:00:01 +0530
Message-ID: <4E6ECE39.2030300@linaro.org>
References: <1315806945-3102-1-git-send-email-tushar.behera@linaro.org> <4E6E1F08.7030407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:47042 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753801Ab1IMDaD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Sep 2011 23:30:03 -0400
Received: by gyg10 with SMTP id 10so99341gyg.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Sep 2011 20:30:02 -0700 (PDT)
In-Reply-To: <4E6E1F08.7030407@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Subash Patel <subashrp@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, Jon Medhurst <tixy@yxit.co.uk>

Hi Subash,

On Monday 12 September 2011 08:32 PM, Subash Patel wrote:
> Hi Tushar,
>
> On 09/12/2011 11:25 AM, Tushar Behera wrote:
>> Some of the boards under mach-exynos4 initialize frame-buffers
>> for which the memory requirement is more than 2MB (Nuri board requires
>> around 4MB, Origen requires around 2.6MB), hence the default dma pool
>> allocation size of 2MB is not sufficient. The consistent dma size is
>> hence increased to successfully allocate memory for those boards.
>>
>> Depends on "ARM: Add init_consistent_dma_size()"
>> by Jon Medhurst (99d1717dd7fecf2b10195b0d864323b952b4eba0).
>>
>> CC: Jon Medhurst<tixy@yxit.co.uk>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>> arch/arm/mach-exynos4/cpu.c | 2 ++
>> 1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
>> index 2d8a40c..45d8bfa 100644
>> --- a/arch/arm/mach-exynos4/cpu.c
>> +++ b/arch/arm/mach-exynos4/cpu.c
>> @@ -10,6 +10,7 @@
>>
>> #include<linux/sched.h>
>> #include<linux/sysdev.h>
>> +#include<linux/dma-mapping.h>
>>
>> #include<asm/mach/map.h>
>> #include<asm/mach/irq.h>
>> @@ -136,6 +137,7 @@ static void exynos4_idle(void)
>> void __init exynos4_map_io(void)
>> {
>> iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
>> + init_consistent_dma_size(SZ_8M);
>>
>
> I think CMA is being used to allocate the FB in origen machine. In that
> case, increasing the consistent memory is not useful. If the memory is
> increased in the consistent DMA area, how can that be useful to s3cfb?
>
We are using dma_alloc_writecombine to allocate frame buffer memory.
Ref: linux/drivers/video/s3c-fb.c:s3c_fb_alloc_memory().

CMA is not yet part of the mainline kernel and hence there is no way the 
FB can use CMA for memory allocation.
> Regards,
> Subash
>
>
>> /* initialize device information early */
>> exynos4_default_sdhci0();


-- 
Tushar Behera
