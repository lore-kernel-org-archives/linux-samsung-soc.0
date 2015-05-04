From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 1/3] ARM: s3c24xx: add dma_coherent_mask for DMA devices
Date: Mon, 4 May 2015 20:54:47 +0300
Message-ID: <CA+E=qVf5MLsdV+U82Smv-weKQ3eJAEob7J+hdbhtZ-E1qrOsYw@mail.gmail.com>
References: <1430676910-30657-1-git-send-email-anarsoul@gmail.com> <CAJKOXPfbF0RDPisY-PvKKKVT1kHDrR60b7VmcjTkco5UPm-WTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:35778 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750887AbbEDRzJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 13:55:09 -0400
Received: by lbbuc2 with SMTP id uc2so110448705lbb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2015 10:55:08 -0700 (PDT)
In-Reply-To: <CAJKOXPfbF0RDPisY-PvKKKVT1kHDrR60b7VmcjTkco5UPm-WTg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Mon, May 4, 2015 at 6:42 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2015-05-04 3:15 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
>> Otherwise dma_alloc_coherent() fails.
>
> Could you say few more words about the failure?
> Also the patch looks like a candidate for CC-stable along with Fixes tag.

Hm, any call of dma_alloc_coherent() will fail for s3c24xx-dmac
device. For example, asoc dmaengine driver. What exactly do
you want me to precise?

>>
>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> ---
>>  arch/arm/mach-s3c24xx/common.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
>> index bf50328..7ed0853 100644
>> --- a/arch/arm/mach-s3c24xx/common.c
>> +++ b/arch/arm/mach-s3c24xx/common.c
>> @@ -355,6 +355,7 @@ struct platform_device s3c2410_device_dma = {
>>         .resource       = s3c2410_dma_resource,
>>         .dev    = {
>>                 .platform_data  = &s3c2410_dma_platdata,
>> +               .coherent_dma_mask = ~0,
>
> DMA_BIT_MASK(32)?
>
>>         },
>>  };
>>  #endif
>> @@ -452,6 +453,7 @@ struct platform_device s3c2440_device_dma = {
>>         .resource       = s3c2410_dma_resource,
>>         .dev    = {
>>                 .platform_data  = &s3c2440_dma_platdata,
>> +               .coherent_dma_mask = ~0,
>
> Ditto.
>
> Best regards,
> Krzysztof
