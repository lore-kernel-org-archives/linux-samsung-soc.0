From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH V2 2/2] ARM: EXYNOS: cpuidle: Allow C1 state only in
 supported SOC's.
Date: Wed, 24 Jul 2013 11:29:51 +0530
Message-ID: <CADGdYn5uY7A9OB=xGi_oKS3DX6+wRhbKBnTfxjkFY5OtUX3hXg@mail.gmail.com>
References: <1371036526-16589-1-git-send-email-amit.daniel@samsung.com>
	<1371036526-16589-3-git-send-email-amit.daniel@samsung.com>
	<0e2301ce882c$d39021a0$7ab064e0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:54249 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750883Ab3GXF7w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 01:59:52 -0400
Received: by mail-oa0-f51.google.com with SMTP id i4so13502707oah.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2013 22:59:52 -0700 (PDT)
In-Reply-To: <0e2301ce882c$d39021a0$7ab064e0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>

Hi,

On Wed, Jul 24, 2013 at 10:45 AM, Kukjin Kim <kgene@kernel.org> wrote:
> Amit Daniel Kachhap wrote:
>>
>> This patch registers the basic C0 state for all exynos SOC's but
>> limits the C1(AFTR -Arm off top running) state in only the supported
>> SOC's(ie. EXYNOS 4210, 4212, 4412 and 5250).
>>
>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>> ---
>>  arch/arm/mach-exynos/cpuidle.c |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-
>> exynos/cpuidle.c
>> index 2d071c6..ccb2b48 100644
>> --- a/arch/arm/mach-exynos/cpuidle.c
>> +++ b/arch/arm/mach-exynos/cpuidle.c
>> @@ -176,7 +176,9 @@ static int __init exynos4_init_cpuidle(void)
>>               device->cpu = cpu_id;
>>
>>               /* Support IDLE only */
>> -             if (cpu_id != 0)
>> +             if (!(soc_is_exynos4210() || soc_is_exynos4212() ||
>> +                     soc_is_exynos4412() || soc_is_exynos5250()) ||
>> +                     cpu_id != 0)
>
> How about exynos5420?
>
> So...
>
> +               if (soc_is_exynos5440() || cpu_id !=0) ?
This is fine.

Thanks,
Amit
>
>>                       device->state_count = 1;
>>
>>               ret = cpuidle_register_device(device);
>> --
>> 1.7.1
>
> - Kukjin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
