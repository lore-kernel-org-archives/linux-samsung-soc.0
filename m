From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Hook up G2D PD to generic PD infrastructure
Date: Thu, 8 Mar 2012 17:04:30 +0530
Message-ID: <CAK9yfHxBO2CgmpF0dSUTHW=iMCTbOmW85yzt-N4Co+vfYCOGOw@mail.gmail.com>
References: <1329278462-30851-1-git-send-email-sachin.kamat@linaro.org>
	<4F3CF765.4040802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:48301 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754885Ab2CHLea (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 06:34:30 -0500
Received: by qcqw6 with SMTP id w6so244537qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Mar 2012 03:34:30 -0800 (PST)
In-Reply-To: <4F3CF765.4040802@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, rjw@sisk.pl, thomas.abraham@linaro.org, patches@linaro.org

Hi Kukjin,

This patch is also missed in your tree. Other G2D patches in arch/arm
are already there.
Please check.

Regards
Sachin


On 16/02/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 02/15/12 13:01, Sachin Kamat wrote:
>> Add G2D power domain (PD) to generic power domain infrastructure.
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> ---
>>   arch/arm/mach-exynos/pm_domains.c |    3 +++
>>   1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/pm_domains.c
>> b/arch/arm/mach-exynos/pm_domains.c
>> index 0b04af2..a84df72 100644
>> --- a/arch/arm/mach-exynos/pm_domains.c
>> +++ b/arch/arm/mach-exynos/pm_domains.c
>> @@ -183,6 +183,9 @@ static __init int exynos4_pm_init_power_domain(void)
>>   #ifdef CONFIG_S5P_DEV_CSIS1
>>   	exynos_pm_add_dev_to_genpd(&s5p_device_mipi_csis1,&exynos4_pd_cam);
>>   #endif
>> +#ifdef CONFIG_S5P_DEV_G2D
>> +	exynos_pm_add_dev_to_genpd(&s5p_device_g2d,&exynos4_pd_lcd0);
>> +#endif
>>   	return 0;
>>   }
>>   arch_initcall(exynos4_pm_init_power_domain);
>
> Hi Sachin,
>
> OK, will apply after pick up other regarding G2D patches for arch/arm/
> Samsung stuff.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>


-- 
With warm regards,
Sachin
