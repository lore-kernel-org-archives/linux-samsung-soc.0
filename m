From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add secure firmware support for Exynos5420
Date: Mon, 19 May 2014 17:40:34 +0530
Message-ID: <5379F4BA.9040509@linaro.org>
References: <1400497757-18991-1-git-send-email-tushar.behera@linaro.org> <5379EBE4.9010704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:49009 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499AbaESMKj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 08:10:39 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so5652362pab.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 05:10:38 -0700 (PDT)
In-Reply-To: <5379EBE4.9010704@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>

On 05/19/2014 05:02 PM, Tomasz Figa wrote:
> Hi Tushar, Sachin,
> 
> On 19.05.2014 13:09, Tushar Behera wrote:
>> From: Sachin Kamat <sachin.kamat@linaro.org>
>>
>> Updated secondary boot register offset for Exynos5420 in case of
>> secure booting.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> ---
>>
>> The patches are based on top of next-20140519. With these two patches applied,
>> we can get all A15 cores booting up on Arndale-Octa board.
>>
>>  arch/arm/mach-exynos/firmware.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
>> index 739bdc8..5e0902e 100644
>> --- a/arch/arm/mach-exynos/firmware.c
>> +++ b/arch/arm/mach-exynos/firmware.c
>> @@ -50,7 +50,7 @@ static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
>>  
>>  	boot_reg = sysram_ns_base_addr + 0x1c;
>>  
>> -	if (!soc_is_exynos4212())
>> +	if (!soc_is_exynos4212() && !soc_is_exynos5420())
>>  		boot_reg += 4*cpu;
> 
> I think it is safe to change this simply to if (soc_is_exynos4412()),
> since this seems to be the only SoC on which the firmware requires this
> offset.
> 
> Best regards,
> Tomasz
> 

Fair enough. Even Exynos3250 doesn't require this. I will resend this patch.

-- 
Tushar Behera
