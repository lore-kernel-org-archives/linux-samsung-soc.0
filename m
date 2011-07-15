From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2] ARM: EXYNOS4: Add platform device for dwmci driver.
Date: Fri, 15 Jul 2011 16:04:48 +0900
Message-ID: <CAH9JG2XZ_JLtHGKR-6we1vov+1O8Y7S2hC6f9bMUmz3aTUpvBw@mail.gmail.com>
References: <1310637226-19478-1-git-send-email-tgih.jun@samsung.com>
	<CAH9JG2Vy9OJcrATeKV60X7SjdAR7Z+LDMzgMaps5NKu+M2zxAA@mail.gmail.com>
	<003201cc42bc$a43e4150$ecbac3f0$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:46836 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964776Ab1GOHEt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 03:04:49 -0400
Received: by vws1 with SMTP id 1so699879vws.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Jul 2011 00:04:48 -0700 (PDT)
In-Reply-To: <003201cc42bc$a43e4150$ecbac3f0$%jun@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ByungJae Lee <bjlee@samsung.com>, SeungKwon Ko <skwon.ko@samsung.com>, JaeHun Jung <jh0801.jung@samsung.com>

On Fri, Jul 15, 2011 at 3:58 PM, Seungwon Jeon <tgih.jun@samsung.com> w=
rote:
> Hi,
>
> Kyungmin Park wrote:
>> On Thu, Jul 14, 2011 at 6:53 PM, Seungwon Jeon <tgih.jun@samsung.com=
>
>> wrote:
>> > This patch add platform devices for Synopsys DesignWare Multimedia=
 Card
>> > Interface driver.
>> >
>> > Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
>> > ---
>> > =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 | =A0 12 =
++++
>> > =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 +
>> > =A0arch/arm/mach-exynos4/dev-dwmci.c =A0 =A0 =A0 =A0 | =A0 88
>> +++++++++++++++++++++++++++++
>> > =A0arch/arm/mach-exynos4/include/mach/irqs.h | =A0 =A01 +
>> > =A0arch/arm/mach-exynos4/include/mach/map.h =A0| =A0 =A01 +
>> > =A0arch/arm/plat-samsung/include/plat/devs.h | =A0 =A01 +
>> > =A06 files changed, 104 insertions(+), 0 deletions(-)
>> > =A0create mode 100644 arch/arm/mach-exynos4/dev-dwmci.c
>> >
>> > diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-
>> exynos4/Kconfig
>> > index 5115b90..2ec5b96 100644
>> > --- a/arch/arm/mach-exynos4/Kconfig
>> > +++ b/arch/arm/mach-exynos4/Kconfig
>> > @@ -35,6 +35,11 @@ config EXYNOS4_DEV_SYSMMU
>> > =A0 =A0 =A0 =A0help
>> > =A0 =A0 =A0 =A0 =A0Common setup code for SYSTEM MMU in EXYNOS4
>> >
>> > +config EXYNOS4_DEV_DWMCI
>> > + =A0 =A0 =A0 bool
>> > + =A0 =A0 =A0 help
>> > + =A0 =A0 =A0 =A0 Compile in platform device definitions for DWMCI
>> > +
>> > =A0config EXYNOS4_SETUP_I2C1
>> > =A0 =A0 =A0 =A0bool
>> > =A0 =A0 =A0 =A0help
>> > @@ -200,6 +205,13 @@ comment "Configuration for HSMMC bus width"
>> >
>> > =A0menu "Use 8-bit bus width"
>> >
>> > +config EXYNOS4_DWMCI_8BIT
>> > + =A0 =A0 =A0 bool "DWMCI with 8-bit bus"
>> > + =A0 =A0 =A0 depends on EXYNOS4_DEV_DWMCI
>> > + =A0 =A0 =A0 help
>> > + =A0 =A0 =A0 =A0 Support DWMCI 8-bit bus.
>> > + =A0 =A0 =A0 =A0 If selected, Channel 1 is disabled.
>>
>> No it should be determined at runtime instead of compile time.
>
> Sorry for that I don't understand your meaning.
> Perhaps, you want to decide the width according to the board type at =
runtime?
> I expect the reason and description about your comment.
> Bus width is board-specific information related with capability
> which is not determined in runtime.
> So we should decide and choice bus width considering the board target
> before compiling.
It prohibit to make a single kernel as other platform does.
As you know, now we can select multiple board support at exynos4.
some board want to use 4-bit, other board want to use 8-bit. then how
to select proper bus width?


>
> Best regards,
> Seungwon Jeon.
>
>>
>> > +
>> > =A0config EXYNOS4_SDHCI_CH0_8BIT
>> > =A0 =A0 =A0 =A0bool "Channel 0 with 8-bit bus"
>> > =A0 =A0 =A0 =A0help
>> > diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-
>> exynos4/Makefile
>> > index 60fe5ec..eeeaada 100644
>> > --- a/arch/arm/mach-exynos4/Makefile
>> > +++ b/arch/arm/mach-exynos4/Makefile
>> > @@ -43,6 +43,7 @@ obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 +=3D dev-audio.o
>> > =A0obj-$(CONFIG_EXYNOS4_DEV_AHCI) =A0 =A0 =A0 =A0 +=3D dev-ahci.o
>> > =A0obj-$(CONFIG_EXYNOS4_DEV_PD) =A0 =A0 =A0 =A0 =A0 +=3D dev-pd.o
>> > =A0obj-$(CONFIG_EXYNOS4_DEV_SYSMMU) =A0 =A0 =A0 +=3D dev-sysmmu.o
>> > +obj-$(CONFIG_EXYNOS4_DEV_DWMCI) =A0 =A0 =A0 =A0+=3D dev-dwmci.o
>> >
>> > =A0obj-$(CONFIG_EXYNOS4_SETUP_FIMC) =A0 =A0 =A0 +=3D setup-fimc.o
>> > =A0obj-$(CONFIG_EXYNOS4_SETUP_I2C1) =A0 =A0 =A0 +=3D setup-i2c1.o
>> > diff --git a/arch/arm/mach-exynos4/dev-dwmci.c b/arch/arm/mach-
>> exynos4/dev-dwmci.c
>> > new file mode 100644
>> > index 0000000..a0defa4
>> > --- /dev/null
>> > +++ b/arch/arm/mach-exynos4/dev-dwmci.c
>> > @@ -0,0 +1,88 @@
>> > +/*
>> > + * linuxarch/arm/mach-exynos4/dev-dwmci.c
>> > + *
>> > + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>> > + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
>> > + *
>> > + * Platform device for Synopsys DesignWare Mobile Storage IP
>> > + *
>> > + * This program is free software; you can redistribute it and/or =
modify
>> > + * it under the terms of the GNU General Public License as publis=
hed by
>> > + * the Free Software Foundation; either version 2 of the License,=
 or
>> > + * (at your option) any later version.
>> > + */
>> > +
>> > +#include <linux/kernel.h>
>> > +#include <linux/dma-mapping.h>
>> > +#include <linux/platform_device.h>
>> > +#include <linux/interrupt.h>
>> > +#include <linux/mmc/dw_mmc.h>
>> > +#include <linux/mmc/host.h>
>> > +#include <linux/io.h>
>> > +#include <linux/gpio.h>
>> > +
>> > +#include <plat/devs.h>
>> > +#include <plat/cpu.h>
>> > +#include <plat/gpio-cfg.h>
>> > +
>> > +#include <mach/map.h>
>> > +
>> > +#ifdef EXYNOS4_DWMCI_8BIT
>> > +#define BUS_WIDTH 8
>> > +#else
>> > +#define BUS_WIDTH 4
>> > +#endif
>>
>> Right, each board can modify the bus width. so it needs the helper
>> function to setup.
>> > +
>> > +static int exynos4_dwmci_get_ocr(u32 slot_id)
>> > +{
>> > + =A0 =A0 =A0 return MMC_VDD_32_33 | MMC_VDD_33_34;
>> > +}
>> > +
>> > +static int exynos4_dwmci_get_bus_wd(u32 slot_id)
>> > +{
>> > + =A0 =A0 =A0 return BUS_WIDTH;
>> > +}
>> > +
>> > +static int exynos4_dwmci_init(u32 slot_id, irq_handler_t handler,=
 void
>> *data)
>> > +{
>> > + =A0 =A0 =A0 return 0;
>> > +}
>> > +
>> > +static struct resource exynos4_dwmci_resource[] =3D {
>> > + =A0 =A0 =A0 [0] =3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D EXYNOS4_PA_DWMCI,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =3D EXYNOS4_PA_DWMCI + SZ_4=
K - 1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 [1] =3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D IRQ_DWMCI,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =3D IRQ_DWMCI,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_IRQ,
>> > + =A0 =A0 =A0 }
>> > +};
>> > +
>> > +static struct dw_mci_board exynos4_dwci_pdata =3D {
>> > + =A0 =A0 =A0 .num_slots =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D 1,
>> > + =A0 =A0 =A0 .quirks =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =3D DW_MCI_QUIRK_BROKEN_CARD_DETECTION,
>> > + =A0 =A0 =A0 .bus_hz =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =3D 80*1000*1000,
>> > + =A0 =A0 =A0 .detect_delay_ms =A0 =A0 =A0 =A0=3D 200,
>> > + =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =3D exynos4_dwmci_init,
>> > + =A0 =A0 =A0 .get_ocr =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=3D exynos4_dwmci_get_ocr,
>> > + =A0 =A0 =A0 .get_bus_wd =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=3D exynos4_dwmci_get_bus_wd,
>> > + =A0 =A0 =A0 .select_slot =A0 =A0 =A0 =A0 =A0 =A0=3D NULL,
>> > +};
>> > +
>> > +static u64 exynos4_dwmci_dmamask =3D DMA_BIT_MASK(32);
>> > +
>> > +struct platform_device exynos4_device_dwmci =3D {
>> > + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "dw_mmc",
>> > + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(exynos4_dwmci_resou=
rce),
>> > + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D exynos4_dwmci_resource,
>> > + =A0 =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .dma_mask =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D &exynos4_dwmci_dmamask,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .coherent_dma_mask =A0 =A0 =A0=3D DM=
A_BIT_MASK(32),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =A0=3D &exynos4_dwci_=
pdata,
>> > + =A0 =A0 =A0 },
>> > +};
>> > +
>> > diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/=
mach-
>> exynos4/include/mach/irqs.h
>> > index 5d03730..b720246 100644
>> > --- a/arch/arm/mach-exynos4/include/mach/irqs.h
>> > +++ b/arch/arm/mach-exynos4/include/mach/irqs.h
>> > @@ -107,6 +107,7 @@
>> > =A0#define IRQ_HSMMC1 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 1)
>> > =A0#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 2)
>> > =A0#define IRQ_HSMMC3 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 3)
>> > +#define IRQ_DWMCI =A0 =A0 =A0 =A0 =A0 =A0 =A0COMBINER_IRQ(29, 4)
>> >
>> > =A0#define IRQ_MIPI_CSIS0 =A0 =A0 =A0 =A0 COMBINER_IRQ(30, 0)
>> > =A0#define IRQ_MIPI_CSIS1 =A0 =A0 =A0 =A0 COMBINER_IRQ(30, 1)
>> > diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/m=
ach-
>> exynos4/include/mach/map.h
>> > index 0009e77..352e500 100644
>> > --- a/arch/arm/mach-exynos4/include/mach/map.h
>> > +++ b/arch/arm/mach-exynos4/include/mach/map.h
>> > @@ -94,6 +94,7 @@
>> > =A0#define EXYNOS4_PA_MIPI_CSIS1 =A0 =A0 =A0 =A0 =A00x11890000
>> >
>> > =A0#define EXYNOS4_PA_HSMMC(x) =A0 =A0 =A0 =A0 =A0 =A0(0x12510000 =
+ ((x) * 0x10000))
>> > +#define EXYNOS4_PA_DWMCI =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x12550000
>> >
>> > =A0#define EXYNOS4_PA_SATA =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A00x12560000
>> > =A0#define EXYNOS4_PA_SATAPHY =A0 =A0 =A0 =A0 =A0 =A0 0x125D0000
>> > diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/=
plat-
>> samsung/include/plat/devs.h
>> > index e3b31c2..29fa1cf 100644
>> > --- a/arch/arm/plat-samsung/include/plat/devs.h
>> > +++ b/arch/arm/plat-samsung/include/plat/devs.h
>> > @@ -112,6 +112,7 @@ extern struct platform_device exynos4_device_i=
2s2;
>> > =A0extern struct platform_device exynos4_device_spdif;
>> > =A0extern struct platform_device exynos4_device_pd[];
>> > =A0extern struct platform_device exynos4_device_ahci;
>> > +extern struct platform_device exynos4_device_dwmci;
>> >
>> > =A0extern struct platform_device s5p6440_device_pcm;
>> > =A0extern struct platform_device s5p6440_device_iis;
>> > --
>> > 1.7.2.3
>> >
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe linux-sa=
msung-
>> soc" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>> >
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-
>> soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
