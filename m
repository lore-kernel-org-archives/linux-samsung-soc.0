From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 2/6] ARM: SAMSUNG: Fix memory size for hsotg
Date: Thu, 08 Mar 2012 08:20:26 +0530
Message-ID: <4F581E72.5040005@linaro.org>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com> <1328870146-20312-3-git-send-email-l.majewski@samsung.com> <077101ccf765$69bea0c0$3d3be240$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:60609 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751347Ab2CHCug (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 21:50:36 -0500
Received: by pbcun15 with SMTP id un15so1094519pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 18:50:35 -0800 (PST)
In-Reply-To: <077101ccf765$69bea0c0$3d3be240$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Lukasz Majewski' <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

On 03/01/2012 10:10 AM, Kukjin Kim wrote:
> Lukasz Majewski wrote:
>>
>> From: Joonyoung Shim <jy0922.shim@samsung.com>
>>
>> The device link core registers for hsotg is base + 0000h ~ base +
>> 11000h.
>>
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> [Rebased on the newest git/kgene/linux-samsung #for-next]
>> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
>> ---
>>  arch/arm/plat-samsung/devs.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
>> index 21168ea..7ca0875 100644
>> --- a/arch/arm/plat-samsung/devs.c
>> +++ b/arch/arm/plat-samsung/devs.c
>> @@ -1436,7 +1436,7 @@ void __init s5p_ehci_set_platdata(struct
>> s5p_ehci_platdata *pd)
>>
>>  #ifdef CONFIG_S3C_DEV_USB_HSOTG
>>  static struct resource s3c_usb_hsotg_resources[] = {
>> -	[0] = DEFINE_RES_MEM(S3C_PA_USB_HSOTG, SZ_16K),
>> +	[0] = DEFINE_RES_MEM(S3C_PA_USB_HSOTG, SZ_128K),
>>  	[1] = DEFINE_RES_IRQ(IRQ_OTG),

As defined in arch/arm/mach-exynos/include/mach/irqs.h, should the IRQ
resource be DEFINE_RES_IRQ(IRQ_USB_HSOTG)?

>>  };
>>
>> --
>> 1.7.2.3
> 
> OK, will apply.
> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Tushar Behera
