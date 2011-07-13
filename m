From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Add platform device for dwmci driver.
Date: Wed, 13 Jul 2011 17:20:17 +0900
Message-ID: <CAH9JG2VpLBACx2Ym3G65=oAPqUtJO3CXbXsuQGJTmKaqML8ANw@mail.gmail.com>
References: <1310541479-32252-1-git-send-email-tgih.jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:47752 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964995Ab1GMIUR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jul 2011 04:20:17 -0400
Received: by vxb39 with SMTP id 39so4009123vxb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jul 2011 01:20:17 -0700 (PDT)
In-Reply-To: <1310541479-32252-1-git-send-email-tgih.jun@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ByungJae Lee <bjlee@samsung.com>, SeungKwon Ko <skwon.ko@samsung.com>, JaeHun Jung <jh0801.jung@samsung.com>, =?UTF-8?B?7KCV7J6s7ZuI?= <jh80.chung@samsung.com>

On Wed, Jul 13, 2011 at 4:17 PM, Seungwon Jeon <tgih.jun@samsung.com> w=
rote:
> This patch add platform devices for Synopsys DesignWare Multimedia Ca=
rd
> Interface driver.
>
> Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A05 +=
+
> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0arch/arm/mach-exynos4/dev-dwmci.c =A0 =A0 =A0 =A0 | =A0 86 +++++++=
++++++++++++++++++++++
> =A0arch/arm/mach-exynos4/include/mach/irqs.h | =A0 =A01 +
> =A0arch/arm/mach-exynos4/include/mach/map.h =A0| =A0 =A01 +
> =A0arch/arm/plat-samsung/include/plat/devs.h | =A0 =A01 +
> =A06 files changed, 95 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos4/dev-dwmci.c
>
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kc=
onfig
> index 5115b90..c82674a 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -35,6 +35,11 @@ config EXYNOS4_DEV_SYSMMU
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Common setup code for SYSTEM MMU in EXYNOS4
>
> +config EXYNOS4_DEV_DWMCI
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Compile in platform device definitions for DWMCI
> +
> =A0config EXYNOS4_SETUP_I2C1
> =A0 =A0 =A0 =A0bool
> =A0 =A0 =A0 =A0help
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/M=
akefile
> index 60fe5ec..eeeaada 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -43,6 +43,7 @@ obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 +=3D dev-audio.o
> =A0obj-$(CONFIG_EXYNOS4_DEV_AHCI) =A0 =A0 =A0 =A0 +=3D dev-ahci.o
> =A0obj-$(CONFIG_EXYNOS4_DEV_PD) =A0 =A0 =A0 =A0 =A0 +=3D dev-pd.o
> =A0obj-$(CONFIG_EXYNOS4_DEV_SYSMMU) =A0 =A0 =A0 +=3D dev-sysmmu.o
> +obj-$(CONFIG_EXYNOS4_DEV_DWMCI) =A0 =A0 =A0 =A0+=3D dev-dwmci.o
>
> =A0obj-$(CONFIG_EXYNOS4_SETUP_FIMC) =A0 =A0 =A0 +=3D setup-fimc.o
> =A0obj-$(CONFIG_EXYNOS4_SETUP_I2C1) =A0 =A0 =A0 +=3D setup-i2c1.o
> diff --git a/arch/arm/mach-exynos4/dev-dwmci.c b/arch/arm/mach-exynos=
4/dev-dwmci.c
> new file mode 100644
> index 0000000..6b69707
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/dev-dwmci.c
> @@ -0,0 +1,86 @@
> +/*
> + * linuxarch/arm/mach-exynos4/dev-dwmci.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * Platform device for Synopsys DesignWare Mobile Storage IP
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/mmc/dw_mmc.h>
> +#include <linux/mmc/host.h>
> +#include <linux/io.h>
> +
> +#include <mach/map.h>
> +#include <mach/gpio.h>
> +
> +#include <plat/devs.h>
> +#include <plat/cpu.h>
> +#include <plat/gpio-cfg.h>
> +
> +static int exynos4_dwmci_init(u32 slot_id, irq_handler_t handler, vo=
id *data);
> +static int exynos4_dwmci_get_ocr(u32 slot_id);
> +static int exynos4_dwmci_get_bus_wd(u32 slot_id);
No need to declare it at here.
Just put the exynos4_dwci_pdata at last.
> +
> +static struct resource exynos4_dwmci_resource[] =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D EXYNOS4_PA_DWMCI,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =3D EXYNOS4_PA_DWMCI + SZ_4K -=
 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D IRQ_DWMCI,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =3D IRQ_DWMCI,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_IRQ,
> + =A0 =A0 =A0 }
> +};
> +
> +static struct dw_mci_board exynos4_dwci_pdata =3D {
> + =A0 =A0 =A0 .num_slots =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D=
 1,
> + =A0 =A0 =A0 .quirks =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D DW_MCI_QUIRK_BROKEN_CARD_DETECTION,
> + =A0 =A0 =A0 .bus_hz =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D 80*1000*1000,
Does it correct value?
> + =A0 =A0 =A0 .detect_delay_ms =A0 =A0 =A0 =A0=3D 200,
> + =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =3D exynos4_dwmci_init,
> + =A0 =A0 =A0 .get_ocr =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
=3D exynos4_dwmci_get_ocr,
> + =A0 =A0 =A0 .get_bus_wd =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D=
 exynos4_dwmci_get_bus_wd,
> + =A0 =A0 =A0 .select_slot =A0 =A0 =A0 =A0 =A0 =A0=3D NULL,
> +};
> +
> +static u64 exynos4_dwmci_dmamask =3D DMA_BIT_MASK(32);
> +
> +struct platform_device exynos4_device_dwmci =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "dw_mmc",
> + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(exynos4_dwmci_resource=
),
> + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D exynos4_dwmci_resource,
> + =A0 =A0 =A0 .dev =A0 =A0 =A0 =A0 =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .dma_mask =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D=
 &exynos4_dwmci_dmamask,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .coherent_dma_mask =A0 =A0 =A0=3D DMA_B=
IT_MASK(32),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =A0=3D &exynos4_dwci_pda=
ta,
> + =A0 =A0 =A0 },
> +};
> +
> +static int exynos4_dwmci_get_ocr(u32 slot_id)
> +{
> + =A0 =A0 =A0 return MMC_VDD_32_33 | MMC_VDD_33_34;
> +}
> +
> +static int exynos4_dwmci_get_bus_wd(u32 slot_id)
> +{
> + =A0 =A0 =A0 return 4;
It's platform dependent value. Please give also platform helper
function to setup at each platform.
> +}
> +
> +static int exynos4_dwmci_init(u32 slot_id, irq_handler_t handler, vo=
id *data)
> +{
> + =A0 =A0 =A0 return 0;
> +}
> +
> diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mac=
h-exynos4/include/mach/irqs.h
> index 5d03730..b720246 100644
> --- a/arch/arm/mach-exynos4/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos4/include/mach/irqs.h
> @@ -107,6 +107,7 @@
> =A0#define IRQ_HSMMC1 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 1)
> =A0#define IRQ_HSMMC2 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 2)
> =A0#define IRQ_HSMMC3 =A0 =A0 =A0 =A0 =A0 =A0 COMBINER_IRQ(29, 3)
> +#define IRQ_DWMCI =A0 =A0 =A0 =A0 =A0 =A0 =A0COMBINER_IRQ(29, 4)
>
> =A0#define IRQ_MIPI_CSIS0 =A0 =A0 =A0 =A0 COMBINER_IRQ(30, 0)
> =A0#define IRQ_MIPI_CSIS1 =A0 =A0 =A0 =A0 COMBINER_IRQ(30, 1)
> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach=
-exynos4/include/mach/map.h
> index 0009e77..352e500 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos4/include/mach/map.h
> @@ -94,6 +94,7 @@
> =A0#define EXYNOS4_PA_MIPI_CSIS1 =A0 =A0 =A0 =A0 =A00x11890000
>
> =A0#define EXYNOS4_PA_HSMMC(x) =A0 =A0 =A0 =A0 =A0 =A0(0x12510000 + (=
(x) * 0x10000))
> +#define EXYNOS4_PA_DWMCI =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x12550000
>
> =A0#define EXYNOS4_PA_SATA =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A00x12560000
> =A0#define EXYNOS4_PA_SATAPHY =A0 =A0 =A0 =A0 =A0 =A0 0x125D0000
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/pla=
t-samsung/include/plat/devs.h
> index e3b31c2..29fa1cf 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -112,6 +112,7 @@ extern struct platform_device exynos4_device_i2s2=
;
> =A0extern struct platform_device exynos4_device_spdif;
> =A0extern struct platform_device exynos4_device_pd[];
> =A0extern struct platform_device exynos4_device_ahci;
> +extern struct platform_device exynos4_device_dwmci;
>
> =A0extern struct platform_device s5p6440_device_pcm;
> =A0extern struct platform_device s5p6440_device_iis;
> --
> 1.7.2.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
