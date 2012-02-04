From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add files about definition of C2C
Date: Sat, 4 Feb 2012 18:41:08 +0900
Message-ID: <CAH9JG2UZ5DzR4ReTQSvAcGJVY8HL1mUk-yWEu+KGDMJLtpehgA@mail.gmail.com>
References: <000501cce314$cf9fcff0$6edf6fd0$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:63509 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751435Ab2BDJlJ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 4 Feb 2012 04:41:09 -0500
Received: by obcva7 with SMTP id va7so5168352obc.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Feb 2012 01:41:08 -0800 (PST)
In-Reply-To: <000501cce314$cf9fcff0$6edf6fd0$%lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kisang Lee <kisang80.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <greg@kroah.com>

On Sat, Feb 4, 2012 at 5:13 PM, Kisang Lee <kisang80.lee@samsung.com> w=
rote:
> Cc: Arnd Bergmann <arnd <at> arndb.de>
> Cc: Greg Kroah-Hartman <greg <at> kroah.com>
>
> Following files are added for C2C driver
> c2c.h : Definition of C2C platform data and mode
> regs-c2c.h : Definition of C2C registers
>
> Signed-off-by: Kisang Lee <kisang80.lee@samsung.com>
> ---
Hi,
> =A0arch/arm/mach-exynos/include/mach/c2c.h =A0 =A0 =A0| =A0 65 ++++++=
+++++++++++++++++
One nit. some parts are c2c common and gpio and platform setup codes
are exynos specific.
> =A0arch/arm/mach-exynos/include/mach/regs-c2c.h | =A0 71 ++++++++++++=
++++++++++++++
Are there any reason to put here? I think you can merge with 2/2
patch. I mean you can move it under drivers/misc/c2c.

Thank you,
Kyungmin Park
> =A02 files changed, 136 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos/include/mach/c2c.h
> =A0create mode 100644 arch/arm/mach-exynos/include/mach/regs-c2c.h
>
> diff --git a/arch/arm/mach-exynos/include/mach/c2c.h b/arch/arm/mach-=
exynos/include/mach/c2c.h
> new file mode 100644
> index 0000000..c3d6131
> --- /dev/null
> +++ b/arch/arm/mach-exynos/include/mach/c2c.h
> @@ -0,0 +1,65 @@
> +/* linux/arch/arm/mach-exynos/include/mach/c2c.h
> + *
> + * Copyright 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Platform header file for Samsung C2C Interface driver
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +#ifndef __ASM_PLAT_C2C_H
> +#define __ASM_PLAT_C2C_H __FILE__
> +
> +#define C2C_SHAREDMEM_BASE 0x60000000
> +
> +enum c2c_opp_mode {
> + =A0 =A0 =A0 C2C_OPP0 =3D 0,
> + =A0 =A0 =A0 C2C_OPP25 =3D 1,
> + =A0 =A0 =A0 C2C_OPP50 =3D 2,
> + =A0 =A0 =A0 C2C_OPP100 =3D 3,
> +};
> +
> +enum c2c_buswidth {
> + =A0 =A0 =A0 C2C_BUSWIDTH_8 =3D 0,
> + =A0 =A0 =A0 C2C_BUSWIDTH_10 =3D 1,
> + =A0 =A0 =A0 C2C_BUSWIDTH_16 =3D 2,
> +};
> +
> +enum c2c_shrdmem_size {
> + =A0 =A0 =A0 C2C_MEMSIZE_4 =3D 0,
> + =A0 =A0 =A0 C2C_MEMSIZE_8 =3D 1,
> + =A0 =A0 =A0 C2C_MEMSIZE_16 =3D 2,
> + =A0 =A0 =A0 C2C_MEMSIZE_32 =3D 3,
> + =A0 =A0 =A0 C2C_MEMSIZE_64 =3D 4,
> + =A0 =A0 =A0 C2C_MEMSIZE_128 =3D 5,
> + =A0 =A0 =A0 C2C_MEMSIZE_256 =3D 6,
> + =A0 =A0 =A0 C2C_MEMSIZE_512 =3D 7,
> +};
> +
> +struct exynos_c2c_platdata {
> + =A0 =A0 =A0 void (*setup_gpio)(enum c2c_buswidth rx_width,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum c2c_buswidth tx_wi=
dth);
> +
> + =A0 =A0 =A0 u32 shdmem_addr;
> + =A0 =A0 =A0 enum c2c_shrdmem_size shdmem_size;
> +
> + =A0 =A0 =A0 void __iomem *ap_sscm_addr;
> + =A0 =A0 =A0 void __iomem *cp_sscm_addr;
> +
> + =A0 =A0 =A0 enum c2c_buswidth rx_width;
> + =A0 =A0 =A0 enum c2c_buswidth tx_width;
> + =A0 =A0 =A0 u32 clk_opp100; /* clock of OPP100 mode */
> + =A0 =A0 =A0 u32 clk_opp50; =A0/* clock of OPP50 mode */
> + =A0 =A0 =A0 u32 clk_opp25; =A0/* clock of OPP25 */
> + =A0 =A0 =A0 enum c2c_opp_mode default_opp_mode;
> +
> + =A0 =A0 =A0 void __iomem *c2c_sysreg; =A0 =A0 =A0 /* System Registe=
r address for C2C */
> + =A0 =A0 =A0 char *c2c_clk;
> +};
> +
> +extern void exynos_c2c_set_platdata(struct exynos_c2c_platdata *pd);
> +extern void exynos_c2c_cfg_gpio(enum c2c_buswidth rx_width,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum c2=
c_buswidth tx_width);
> +#endif /*__ASM_PLAT_C2C_H */
> diff --git a/arch/arm/mach-exynos/include/mach/regs-c2c.h b/arch/arm/=
mach-exynos/include/mach/regs-c2c.h
> new file mode 100644
> index 0000000..0c3d005
> --- /dev/null
> +++ b/arch/arm/mach-exynos/include/mach/regs-c2c.h
> @@ -0,0 +1,71 @@
> +/* linux/arch/arm/mach-exynos/include/mach/regs-c2c.h
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * http://www.samsung.com/
> + *
> + * Register definition file for Samsung C2C
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARM_REGS_S5P_C2C_H
> +#define __ASM_ARM_REGS_S5P_C2C_H
> +
> +/***************************************************************/
> +/* C2C Registers part =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0*/
> +/***************************************************************/
> +#define EXYNOS_C2C_REVISION =A0 =A0 =A0 =A0 =A0 =A00x0
> +#define EXYNOS_C2C_SYSCONFIG =A0 =A0 =A0 =A0 =A0 0x4
> +#define EXYNOS_C2C_SYSSTATUS =A0 =A0 =A0 =A0 =A0 0x8
> +#define EXYNOS_C2C_PORTCONFIG =A0 =A0 =A0 =A0 =A00xc
> +#define EXYNOS_C2C_MIRRORMODE =A0 =A0 =A0 =A0 =A00x10
> +#define EXYNOS_C2C_IRQ_RAW_STAT0 =A0 =A0 =A0 0x14
> +#define EXYNOS_C2C_IRQ_RAW_STAT1 =A0 =A0 =A0 0x18
> +#define EXYNOS_C2C_IRQ_EN_STAT0 =A0 =A0 =A0 =A00x1c
> +#define EXYNOS_C2C_IRQ_EN_STAT1 =A0 =A0 =A0 =A00x20
> +#define EXYNOS_C2C_IRQ_EN_SET0 =A0 =A0 =A0 =A0 0x24
> +#define EXYNOS_C2C_IRQ_EN_SET1 =A0 =A0 =A0 =A0 0x28
> +#define EXYNOS_C2C_IRQ_EN_CLEAR0 =A0 =A0 =A0 0x2c
> +#define EXYNOS_C2C_IRQ_EN_CLEAR1 =A0 =A0 =A0 0x30
> +#define EXYNOS_C2C_IRQ_EOI =A0 =A0 =A0 =A0 =A0 =A0 0x34
> +
> +#define EXYNOS_C2C_FCLK_FREQ =A0 =A0 =A0 =A0 =A0 0x40
> +#define EXYNOS_C2C_RX_MAX_FREQ =A0 =A0 =A0 =A0 0x44
> +#define EXYNOS_C2C_TX_MAX_FREQ =A0 =A0 =A0 =A0 0x48
> +#define EXYNOS_C2C_RX_MAX_FREQ_ACK =A0 =A0 0x4c
> +#define EXYNOS_C2C_WAKE_REQ =A0 =A0 =A0 =A0 =A0 =A00x50
> +#define EXYNOS_C2C_WAKE_ACK =A0 =A0 =A0 =A0 =A0 =A00x54
> +#define EXYNOS_C2C_STANDBY =A0 =A0 =A0 =A0 =A0 =A0 0x60
> +#define EXYNOS_C2C_STANDBY_IN =A0 =A0 =A0 =A0 =A00x64
> +#define EXYNOS_C2C_WAIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x68
> +#define EXYNOS_C2C_GENI_CONTROL =A0 =A0 =A0 =A00x70
> +#define EXYNOS_C2C_GENI_MASK =A0 =A0 =A0 =A0 =A0 0x74
> +#define EXYNOS_C2C_GENO_STATUS =A0 =A0 =A0 =A0 0x80
> +
> +#define EXYNOS_C2C_GENO_INT =A0 =A0 =A0 =A0 =A0 =A00x84
> +#define EXYNOS_C2C_GENO_LEVEL =A0 =A0 =A0 =A0 =A00x88
> +
> +/***************************************************************/
> +/* C2C Bit definition part =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> +/***************************************************************/
> +/* SYSREG Bit definition */
> +#define C2C_SYSREG_CG =A0 =A0 =A0 =A0 =A0(31) /* C2C Clock Gating [3=
1] */
> +#define C2C_SYSREG_MO =A0 =A0 =A0 =A0 =A0(30) /* Master On [30] */
> +#define C2C_SYSREG_FCLK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(20) /* Defau=
lt Functional Clock Freq [29:20] */
> +#define C2C_SYSREG_TXW =A0 =A0 =A0 =A0 (18) /* Default Tx Width [19:=
18] */
> +#define C2C_SYSREG_RXW =A0 =A0 =A0 =A0 (16) /* Default Rx Width [17:=
16] */
> +#define C2C_SYSREG_RST =A0 =A0 =A0 =A0 (15) /* Reset [15] */
> +#define C2C_SYSREG_MD =A0 =A0 =A0 =A0 =A0(14) /* Master On [14] */
> +#define C2C_SYSREG_RTRST =A0 =A0 =A0 (13) /* Reset retention registe=
rs [13] */
> +#define C2C_SYSREG_BASE_ADDR =A0 (3) =A0/* DRAM Base Address [12:3] =
*/
> +#define C2C_SYSREG_DRAM_SIZE =A0 (0) =A0/* DRAM Size [2:0] */
> +
> +#define C2C_GENIO_LATENCY_INT =A0(26)
> +#define C2C_GENIO_OPP_INT =A0 =A0 =A0(27)
> +#define C2C_GENIO_OPP_MODE0 =A0 =A0(28)
> +#define C2C_GENIO_OPP_MODE1 =A0 =A0(29)
> +#define C2C_GENIO_LATENCY0 =A0 =A0 (30)
> +#define C2C_GENIO_LATENCY1 =A0 =A0 (31)
> +#endif /* __ASM_ARM_REGS_S5P_C2C_H */
> --
> 1.7.1
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
