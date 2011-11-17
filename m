From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 1/6] ARM: SAMSUNG: Consolidation of SPI platform devices
 to plat-samsung
Date: Thu, 17 Nov 2011 07:09:02 +0530
Message-ID: <CAAgF-Bcs+ycmN2-McrXiZ4n3dXs5vM9oYxnkCF1G6-c+H84Nvg@mail.gmail.com>
References: <1320410634-10788-1-git-send-email-padma.v@samsung.com>
	<1320410634-10788-2-git-send-email-padma.v@samsung.com>
	<003301cca365$6e8758d0$4b960a70$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:64742 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755112Ab1KQBjE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Nov 2011 20:39:04 -0500
Received: by wyh11 with SMTP id 11so1324182wyh.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2011 17:39:02 -0800 (PST)
In-Reply-To: <003301cca365$6e8758d0$4b960a70$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux@arm.linux.org.uk, broonie@opensource.wolfsonmicro.com, ian@opensource.wolfsonmicro.com, dp@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com

Hi Kukjin,

On Tue, Nov 15, 2011 at 12:38 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Padmavathi Venna wrote:
>>
>> SPI platform device definitions consolidated from respective machine
>> folder to plat-samsung
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---
>> =A0arch/arm/mach-s3c64xx/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 -
>> =A0arch/arm/mach-s3c64xx/dev-spi.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0172 -----------------
>> =A0arch/arm/mach-s5p64x0/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 -
>> =A0arch/arm/mach-s5p64x0/dev-spi.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0218
> ---------------------
>> =A0arch/arm/mach-s5pc100/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 -
>> =A0arch/arm/mach-s5pc100/dev-spi.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0220
> ----------------------
>> =A0arch/arm/mach-s5pv210/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 -
>> =A0arch/arm/mach-s5pv210/dev-spi.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0169 -----------------
>> =A0arch/arm/plat-samsung/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 14 ++-
>> =A0arch/arm/plat-samsung/devs.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0112 +++++++++++
>> =A0arch/arm/plat-samsung/include/plat/devs.h =A0 =A0 =A0 =A0| =A0 =A0=
8 +-
>> =A0arch/arm/plat-samsung/include/plat/s3c64xx-spi.h | =A0 13 +-
>> =A012 files changed, 133 insertions(+), 797 deletions(-)
>> =A0delete mode 100644 arch/arm/mach-s3c64xx/dev-spi.c
>> =A0delete mode 100644 arch/arm/mach-s5p64x0/dev-spi.c
>> =A0delete mode 100644 arch/arm/mach-s5pc100/dev-spi.c
>> =A0delete mode 100644 arch/arm/mach-s5pv210/dev-spi.c
>>
>
> Hi Padma,
>
> Basically, looks good and there are some comments below.
>
> (snip)
>
>> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/K=
config
>> index 313eb26..8a2b23a 100644
>> --- a/arch/arm/plat-samsung/Kconfig
>> +++ b/arch/arm/plat-samsung/Kconfig
>> @@ -226,7 +226,19 @@ config SAMSUNG_DEV_IDE
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Compile in platform device definitions for IDE
>>
>> -config S3C64XX_DEV_SPI
>> +config S3C64XX_DEV_SPI0
>> + =A0 =A0 bool
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Compile in platform device definitions for S3C64XX's t=
ype
>> + =A0 =A0 =A0 SPI controllers.
>> +
>> +config S3C64XX_DEV_SPI1
>> + =A0 =A0 bool
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Compile in platform device definitions for S3C64XX's t=
ype
>> + =A0 =A0 =A0 SPI controllers.
>> +
>> +config S3C64XX_DEV_SPI2
>
> Yeah, needs above config to check the channel now...but I'm thinking =
need to
> sort out it anyway.
>
>> =A0 =A0 =A0 bool
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Compile in platform device definitions for S3C64XX's=
 type
>> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/de=
vs.c
>> index 4ca8b57..76e374d 100644
>> --- a/arch/arm/plat-samsung/devs.c
>> +++ b/arch/arm/plat-samsung/devs.c
>> @@ -61,6 +61,7 @@
>> =A0#include <plat/regs-iic.h>
>> =A0#include <plat/regs-serial.h>
>> =A0#include <plat/regs-spi.h>
>> +#include <plat/s3c64xx-spi.h>
>>
>> =A0static u64 samsung_device_dma_mask =3D DMA_BIT_MASK(32);
>>
>> @@ -1461,3 +1462,114 @@ struct platform_device s3c_device_wdt =3D {
>> =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D s3c_wdt_resource,
>> =A0};
>> =A0#endif /* CONFIG_S3C_DEV_WDT */
>> +
>> +#ifdef CONFIG_S3C64XX_DEV_SPI0
>> +static struct resource s3c64xx_spi0_resource[] =3D {
>> + =A0 =A0 [0] =3D DEFINE_RES_MEM(S3C_PA_SPI0, SZ_256),
>> + =A0 =A0 [1] =3D DEFINE_RES_DMA(DMACH_SPI0_TX),
>> + =A0 =A0 [2] =3D DEFINE_RES_DMA(DMACH_SPI0_RX),
>> + =A0 =A0 [3] =3D DEFINE_RES_IRQ(IRQ_SPI0),
>> +};
>> +
>> +struct platform_device s3c64xx_device_spi0 =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s3c64xx-spi",
>> + =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
>> + =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(s3c64xx_spi0_resource),
>> + =A0 =A0 .resource =A0 =A0 =A0 =3D s3c64xx_spi0_resource,
>> + =A0 =A0 .dev =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .dma_mask =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D =
&samsung_device_dma_mask,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .coherent_dma_mask =A0 =A0 =A0=3D DMA_BIT_=
MASK(32),
>> + =A0 =A0 },
>> +};
>> +
>> +void __init s3c64xx_spi0_set_info(struct s3c64xx_spi_info *pd,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 int src_clk_nr, int num_cs)
>
> How about 's3c64xx_spi_set_platdata' like others in plat-samsung/devs=
=2Ec?
>
>> +{
>> + =A0 =A0 if (!pd) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_err("%s:Need to pass platform data\n", =
__func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>> + =A0 =A0 }
>
> Needs empty line here.
Okey.
>
>> + =A0 =A0 /* Reject invalid configuration */
>> + =A0 =A0 if (!num_cs || src_clk_nr < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_err("%s: Invalid SPI configuration\n", =
__func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>> + =A0 =A0 }
>
> Same as above.
Okey.
>
>> + =A0 =A0 pd->num_cs =3D num_cs;
>> + =A0 =A0 pd->src_clk_nr =3D src_clk_nr;
>> + =A0 =A0 s3c_set_platdata(pd, sizeof(*pd), &s3c64xx_device_spi0);
>
> If we know the SPI controller number here, we can merge this function=
 to
> just one. So how about to add it to the 'struct s3c64xx_spi_info'?
Yes. It is good to have the controller number in the SPI Controller
defining structure.
So I will rebase the patches based on latest for-next branch and
submit the patches.

Thanks&Regards
Padma
>> +}
>
> (snip)
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
