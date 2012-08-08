From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: SAMSUNG: Fix compilation error
Date: Wed, 8 Aug 2012 08:54:43 +0530
Message-ID: <CAK9yfHx7tC4e0dvyeaMs8J6JJfjZGvvnZoyyc_0JgpOLohPZEA@mail.gmail.com>
References: <1340165950-8996-1-git-send-email-sachin.kamat@linaro.org>
	<0a1e01cd74fe$14ecc970$3ec65c50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:40514 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752324Ab2HHDYo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 23:24:44 -0400
Received: by vbbff1 with SMTP id ff1so322619vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Aug 2012 20:24:43 -0700 (PDT)
In-Reply-To: <0a1e01cd74fe$14ecc970$3ec65c50$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 8 August 2012 06:08, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Kukjin Kim wrote:
>>
>> Sachin Kamat wrote:
>> >
>> > Fixes the following build error:
>> > In file included from arch/arm/mach-exynos/include/mach/dma.h:24:0=
,
>> >                  from arch/arm/plat-samsung/include/plat/dma-ops.h=
:17,
>> >                  from arch/arm/plat-samsung/include/plat/dma.h:128=
,
>> >                  from sound/soc/samsung/pcm.c:23:
>> > arch/arm/plat-samsung/include/plat/dma-pl330.h:106:8: error:
>> redefinition
>> > of =91struct s3c2410_dma_client=92
>> > arch/arm/plat-samsung/include/plat/dma.h:40:8: note: originally de=
fined
>> > here
>> >
>> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> > ---
>> >  arch/arm/plat-samsung/include/plat/dma.h |    5 +----
>> >  1 files changed, 1 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/arch/arm/plat-samsung/include/plat/dma.h b/arch/arm/p=
lat-
>> > samsung/include/plat/dma.h
>> > index 7b02143..fdf34bc 100644
>> > --- a/arch/arm/plat-samsung/include/plat/dma.h
>> > +++ b/arch/arm/plat-samsung/include/plat/dma.h
>> > @@ -37,10 +37,7 @@ enum s3c2410_chan_op {
>> >     S3C2410_DMAOP_STARTED,          /* indicate channel started */
>> >  };
>> >
>> > -struct s3c2410_dma_client {
>> > -   char                *name;
>> > -};
>> > -
>> > +struct s3c2410_dma_client;
>> >  struct s3c2410_dma_chan;
>> >  enum dma_ch;
>> >
>> > --
>> > 1.7.4.1
>>
>> Applied, thanks.
>>
> Oops, this brings following error :(
>
> drivers/spi/spi-s3c64xx.c:205: error: variable 's3c64xx_spi_dma_clien=
t' has initializer but incomplete type
> drivers/spi/spi-s3c64xx.c:206: error: unknown field 'name' specified =
in initializer
> drivers/spi/spi-s3c64xx.c:206: warning: excess elements in struct ini=
tializer
> drivers/spi/spi-s3c64xx.c:206: warning: (near initialization for 's3c=
64xx_spi_dma_client')
>
> As you know, the 'struct s3c2410_dma_client' is defined at the <plat/=
dma-pl330.h>  after applying this patch but S3C24XX and S3C64XX are not=
 including 'plat/dma-pl330.h' so above error happened.

So in that case, can we include this header in those files?

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>



--=20
With warm regards,
Sachin
