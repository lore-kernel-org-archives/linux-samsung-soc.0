From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: SAMSUNG: Fix compilation error
Date: Wed, 8 Aug 2012 10:27:22 +0530
Message-ID: <CAK9yfHwXFQ2M586AVezpYXBcM=47hrNzK2Yvabib=SMS4F6R_A@mail.gmail.com>
References: <1340165950-8996-1-git-send-email-sachin.kamat@linaro.org>
	<0a1e01cd74fe$14ecc970$3ec65c50$%kim@samsung.com>
	<CAK9yfHx7tC4e0dvyeaMs8J6JJfjZGvvnZoyyc_0JgpOLohPZEA@mail.gmail.com>
	<0a5301cd7522$260e6d70$722b4850$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:53507 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751109Ab2HHE5X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Aug 2012 00:57:23 -0400
Received: by lagy9 with SMTP id y9so186774lag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Aug 2012 21:57:22 -0700 (PDT)
In-Reply-To: <0a5301cd7522$260e6d70$722b4850$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 8 August 2012 10:26, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> On 8 August 2012 06:08, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> > Kukjin Kim wrote:
>> >>
>> >> Sachin Kamat wrote:
>> >> >
>> >> > Fixes the following build error:
>> >> > In file included from arch/arm/mach-exynos/include/mach/dma.h:24:0,
>> >> >                  from
> arch/arm/plat-samsung/include/plat/dma-ops.h:17,
>> >> >                  from arch/arm/plat-samsung/include/plat/dma.h:128,
>> >> >                  from sound/soc/samsung/pcm.c:23:
>> >> > arch/arm/plat-samsung/include/plat/dma-pl330.h:106:8: error:
>> >> redefinition
>> >> > of 'struct s3c2410_dma_client'
>> >> > arch/arm/plat-samsung/include/plat/dma.h:40:8: note: originally
>> defined
>> >> > here
>> >> >
>> >> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> >> > ---
>> >> >  arch/arm/plat-samsung/include/plat/dma.h |    5 +----
>> >> >  1 files changed, 1 insertions(+), 4 deletions(-)
>> >> >
>> >> > diff --git a/arch/arm/plat-samsung/include/plat/dma.h
>> b/arch/arm/plat-
>> >> > samsung/include/plat/dma.h
>> >> > index 7b02143..fdf34bc 100644
>> >> > --- a/arch/arm/plat-samsung/include/plat/dma.h
>> >> > +++ b/arch/arm/plat-samsung/include/plat/dma.h
>> >> > @@ -37,10 +37,7 @@ enum s3c2410_chan_op {
>> >> >     S3C2410_DMAOP_STARTED,          /* indicate channel started */
>> >> >  };
>> >> >
>> >> > -struct s3c2410_dma_client {
>> >> > -   char                *name;
>> >> > -};
>> >> > -
>> >> > +struct s3c2410_dma_client;
>> >> >  struct s3c2410_dma_chan;
>> >> >  enum dma_ch;
>> >> >
>> >> > --
>> >> > 1.7.4.1
>> >>
>> >> Applied, thanks.
>> >>
>> > Oops, this brings following error :(
>> >
>> > drivers/spi/spi-s3c64xx.c:205: error: variable 's3c64xx_spi_dma_client'
>> has initializer but incomplete type
>> > drivers/spi/spi-s3c64xx.c:206: error: unknown field 'name' specified in
>> initializer
>> > drivers/spi/spi-s3c64xx.c:206: warning: excess elements in struct
>> initializer
>> > drivers/spi/spi-s3c64xx.c:206: warning: (near initialization for
>> 's3c64xx_spi_dma_client')
>> >
>> > As you know, the 'struct s3c2410_dma_client' is defined at the
>> <plat/dma-pl330.h>  after applying this patch but S3C24XX and S3C64XX are
>> not including 'plat/dma-pl330.h' so above error happened.
>>
>> So in that case, can we include this header in those files?
>>
> No, the <plat/dma-pl330.h> is only for PL330 not S3C24XX/S3C64XX and it
> means above build error you reported should be fixed with another way.

Ok. Let me test this and see if I can come out with something.


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
