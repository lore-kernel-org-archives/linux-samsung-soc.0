From: Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: SAMSUNG: Add support for EXYNOS SS USB 3.0 DRD controller
Date: Tue, 7 Feb 2012 07:32:52 +0900
Message-ID: <CAH9JG2XuAR_k9rjREmmmk2XdnFkmPSHAgT8v_gqAGWZ0c1c+0A@mail.gmail.com>
References: <000f01cce4a6$e6e652e0$b4b2f8a0$%tikhomirov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <000f01cce4a6$e6e652e0$b4b2f8a0$%tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Tikhomirov <av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Yulgon Kim <yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 6, 2012 at 5:11 PM, Anton Tikhomirov
<av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Cc: Kukjin Kim <kgene.kim <at> samsung.com>
> Cc: Greg Kroah-Hartman <gregkh <at> suse.de>
> Cc: Felipe Balbi <balbi <at> ti.com>
>
> Adds DRD global register definitions and related platform data.
>
> Signed-off-by: Anton Tikhomirov <av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Hi,

> ---
> =A0.../include/plat/regs-usb3-exynos-drd.h =A0 =A0 =A0 =A0 =A0 =A0| =A0=
305 ++++++++++++++++++++

If special reason, please move to the proper drivers/usb.

Thank you,
Kyungmin Park

> =A0arch/arm/plat-samsung/include/plat/udc-ss.h =A0 =A0 =A0 =A0| =A0 2=
1 ++
> =A0arch/arm/plat-samsung/include/plat/usb-phy.h =A0 =A0 =A0 | =A0 =A0=
1 +
> =A03 files changed, 327 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/plat-samsung/include/plat/regs-usb3-ex=
ynos-drd.h
> =A0create mode 100644 arch/arm/plat-samsung/include/plat/udc-ss.h
>
> diff --git a/arch/arm/plat-samsung/include/plat/regs-usb3-exynos-drd.=
h b/arch/arm/plat-samsung/include/plat/regs-usb3-exynos-drd.h
> new file mode 100644
> index 0000000..7006dc4
> --- /dev/null
> +++ b/arch/arm/plat-samsung/include/plat/regs-usb3-exynos-drd.h
> @@ -0,0 +1,305 @@
> +/* arch/arm/plat-samsung/include/plat/regs-usb3-exynos-drd.h
> + *
> + * Copyright (c) 2011 Samsung Electronics Co. Ltd
> + * Author: Anton Tikhomirov <av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + *
> + * Exynos SuperSpeed USB 3.0 DRD Controller Global registers
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __SAMSUNG_PLAT_REGS_USB3_EXYNOS_DRD_H
> +#define __SAMSUNG_PLAT_REGS_USB3_EXYNOS_DRD_H __FILE__
> +
> +#define EXYNOS_USB3_REG(x) (x)
> +
> +#define EXYNOS_USB3_GSBUSCFG0 =A0 =A0 =A0 =A0 =A0EXYNOS_USB3_REG(0xC=
100)
> +#define EXYNOS_USB3_GSBUSCFG0_SBusStoreAndForward =A0 =A0 =A0(1 << 1=
2)
> +#define EXYNOS_USB3_GSBUSCFG0_DatBigEnd =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(1 << 11)
> +#define EXYNOS_USB3_GSBUSCFG0_INCR256BrstEna =A0 =A0 =A0 =A0 =A0 (1 =
<< 7)
> +#define EXYNOS_USB3_GSBUSCFG0_INCR128BrstEna =A0 =A0 =A0 =A0 =A0 (1 =
<< 6)
> +#define EXYNOS_USB3_GSBUSCFG0_INCR64BrstEna =A0 =A0 =A0 =A0 =A0 =A0(=
1 << 5)
> +#define EXYNOS_USB3_GSBUSCFG0_INCR32BrstEna =A0 =A0 =A0 =A0 =A0 =A0(=
1 << 4)
> +#define EXYNOS_USB3_GSBUSCFG0_INCR16BrstEna =A0 =A0 =A0 =A0 =A0 =A0(=
1 << 3)
> +#define EXYNOS_USB3_GSBUSCFG0_INCR8BrstEna =A0 =A0 =A0 =A0 =A0 =A0 (=
1 << 2)
> +#define EXYNOS_USB3_GSBUSCFG0_INCR4BrstEna =A0 =A0 =A0 =A0 =A0 =A0 (=
1 << 1)
> +#define EXYNOS_USB3_GSBUSCFG0_INCRBrstEna =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(1 << 0)
> +
> +#define EXYNOS_USB3_GSBUSCFG1 =A0 =A0 =A0 =A0 =A0EXYNOS_USB3_REG(0xC=
104)
> +#define EXYNOS_USB3_GSBUSCFG1_EN1KPAGE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1 << 12)
> +#define EXYNOS_USB3_GSBUSCFG1_BREQLIMIT_MASK =A0 =A0 =A0 =A0 =A0 (0x=
f << 8)
> +#define EXYNOS_USB3_GSBUSCFG1_BREQLIMIT_SHIFT =A0 =A0 =A0 =A0 =A08
> +#define EXYNOS_USB3_GSBUSCFG1_BREQLIMIT(_x) =A0 =A0 =A0 =A0 =A0 =A0(=
(_x) << 8)
> +
> +
> +#define EXYNOS_USB3_GTXTHRCFG =A0 =A0 =A0 =A0 =A0EXYNOS_USB3_REG(0xC=
108)
> +#define EXYNOS_USB3_GTXTHRCFG_USBTxPktCntSel =A0 =A0 =A0 =A0 =A0 (1 =
<< 29)
> +#define EXYNOS_USB3_GTXTHRCFG_USBTxPktCnt_MASK =A0 =A0 =A0 =A0 (0xf =
<< 24)
> +#define EXYNOS_USB3_GTXTHRCFG_USBTxPktCnt_SHIFT =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A024
> +#define EXYNOS_USB3_GTXTHRCFG_USBTxPktCnt(_x) =A0 =A0 =A0 =A0 =A0((_=
x) << 24)
> +#define EXYNOS_USB3_GTXTHRCFG_USBMaxTxBurstSize_MASK =A0 (0xff << 16=
)
> +#define EXYNOS_USB3_GTXTHRCFG_USBMaxTxBurstSize_SHIFT =A016
> +#define EXYNOS_USB3_GTXTHRCFG_USBMaxTxBurstSize(_x) =A0 =A0((_x) << =
16)
> +
> +
> +#define EXYNOS_USB3_GRXTHRCFG =A0 =A0 =A0 =A0 =A0EXYNOS_USB3_REG(0xC=
10C)
> +#define EXYNOS_USB3_GRXTHRCFG_USBRxPktCntSel =A0 =A0 =A0 =A0 =A0 (1 =
<< 29)
> +#define EXYNOS_USB3_GRXTHRCFG_USBRxPktCnt_MASK =A0 =A0 =A0 =A0 (0xf =
<< 24)
> +#define EXYNOS_USB3_GRXTHRCFG_USBRxPktCnt_SHIFT =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A024
> +#define EXYNOS_USB3_GRXTHRCFG_USBRxPktCnt(_x) =A0 =A0 =A0 =A0 =A0((_=
x) << 24)
> +#define EXYNOS_USB3_GRXTHRCFG_USBMaxRxBurstSize_MASK =A0 (0x1f << 19=
)
> +#define EXYNOS_USB3_GRXTHRCFG_USBMaxRxBurstSize_SHIFT =A019
> +#define EXYNOS_USB3_GRXTHRCFG_USBMaxRxBurstSize(_x) =A0 =A0((_x) << =
19)
> +
> +
> +#define EXYNOS_USB3_GCTL =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG=
(0xC110)
> +#define EXYNOS_USB3_GCTL_PwrDnScale_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (0x1fff << 19)
> +#define EXYNOS_USB3_GCTL_PwrDnScale_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
19
> +#define EXYNOS_USB3_GCTL_PwrDnScale(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0((_x) << 19)
> +#define EXYNOS_USB3_GCTL_U2RSTECN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0(1 << 16)
> +#define EXYNOS_USB3_GCTL_FRMSCLDWN_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x3 << 14)
> +#define EXYNOS_USB3_GCTL_FRMSCLDWN_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 14
> +#define EXYNOS_USB3_GCTL_FRMSCLDWN(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 ((_x) << 14)
> +#define EXYNOS_USB3_GCTL_PrtCapDir_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x3 << 12)
> +#define EXYNOS_USB3_GCTL_PrtCapDir_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 12
> +#define EXYNOS_USB3_GCTL_PrtCapDir(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 ((_x) << 12)
> +#define EXYNOS_USB3_GCTL_CoreSoftReset =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1 << 11)
> +#define EXYNOS_USB3_GCTL_LocalLpBkEn =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (1 << 10)
> +#define EXYNOS_USB3_GCTL_LpbkEn =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << 9)
> +#define EXYNOS_USB3_GCTL_DebugAttach =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (1 << 8)
> +#define EXYNOS_USB3_GCTL_RAMClkSel_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x3 << 6)
> +#define EXYNOS_USB3_GCTL_RAMClkSel_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 6
> +#define EXYNOS_USB3_GCTL_RAMClkSel(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 ((_x) << 6)
> +#define EXYNOS_USB3_GCTL_ScaleDown_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(0x3 << 4)
> +#define EXYNOS_USB3_GCTL_ScaleDown_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 4
> +#define EXYNOS_USB3_GCTL_ScaleDown(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 ((_x) << 4)
> +#define EXYNOS_USB3_GCTL_DisScramble =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (1 << 3)
> +#define EXYNOS_USB3_GCTL_SsPwrClmp =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (1 << 2)
> +#define EXYNOS_USB3_GCTL_HsFsLsPwrClmp =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1 << 1)
> +#define EXYNOS_USB3_GCTL_DsblClkGtng =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (1 << 0)
> +
> +#define EXYNOS_USB3_GEVTEN =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0=
xC114)
> +#define EXYNOS_USB3_GEVTEN_I2CEvtEn =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(1 << 1)
> +#define EXYNOS_USB3_GEVTEN_ULPICKEvtEn =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1 << 0)
> +#define EXYNOS_USB3_GEVTEN_I2CCKEvtEn =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(1 << 0)
> +
> +#define EXYNOS_USB3_GSTS =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG=
(0xC118)
> +#define EXYNOS_USB3_GSTS_CBELT_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xfff << 20)
> +#define EXYNOS_USB3_GSTS_CBELT_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 20
> +#define EXYNOS_USB3_GSTS_CBELT(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ((_x) << 20)
> +#define EXYNOS_USB3_GSTS_OTG_IP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << 10)
> +#define EXYNOS_USB3_GSTS_BC_IP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (1 << 9)
> +#define EXYNOS_USB3_GSTS_ADP_IP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << 8)
> +#define EXYNOS_USB3_GSTS_Host_IP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 (1 << 7)
> +#define EXYNOS_USB3_GSTS_Device_IP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (1 << 6)
> +#define EXYNOS_USB3_GSTS_CSRTimeout =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(1 << 5)
> +#define EXYNOS_USB3_GSTS_BusErrAddrVld =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1 << 4)
> +#define EXYNOS_USB3_GSTS_CurMod_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (0x3 << 0)
> +#define EXYNOS_USB3_GSTS_CurMod_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A00
> +#define EXYNOS_USB3_GSTS_CurMod(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0((_x) << 0)
> +
> +#define EXYNOS_USB3_GSNPSID =A0 =A0 =A0 =A0 =A0 =A0EXYNOS_USB3_REG(0=
xC120)
> +
> +#define EXYNOS_USB3_GGPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS_USB3_REG=
(0xC124)
> +#define EXYNOS_USB3_GGPIO_GPO_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (0xffff << 16)
> +#define EXYNOS_USB3_GGPIO_GPO_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A016
> +#define EXYNOS_USB3_GGPIO_GPO(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0((_x) << 16)
> +#define EXYNOS_USB3_GGPIO_GPI_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (0xffff << 0)
> +#define EXYNOS_USB3_GGPIO_GPI_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A00
> +#define EXYNOS_USB3_GGPIO_GPI(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0((x) << 0)
> +
> +#define EXYNOS_USB3_GUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG=
(0xC128)
> +
> +#define EXYNOS_USB3_GUCTL =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS_USB3_REG=
(0xC12C)
> +#define EXYNOS_USB3_GUCTL_SprsCtrlTransEn =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(1 << 17)
> +#define EXYNOS_USB3_GUCTL_ResBwHSEPS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (1 << 16)
> +#define EXYNOS_USB3_GUCTL_CMdevAddr =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(1 << 15)
> +#define EXYNOS_USB3_GUCTL_USBHstInAutoRetryEn =A0 =A0 =A0 =A0 =A0(1 =
<< 14)
> +#define EXYNOS_USB3_GUCTL_USBHstInMaxBurst_MASK =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x7 << 11)
> +#define EXYNOS_USB3_GUCTL_USBHstInMaxBurst_SHIFT =A0 =A0 =A0 11
> +#define EXYNOS_USB3_GUCTL_USBHstInMaxBurst(_x) =A0 =A0 =A0 =A0 ((_x)=
 << 11)
> +#define EXYNOS_USB3_GUCTL_DTCT_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x3 << 9)
> +#define EXYNOS_USB3_GUCTL_DTCT_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 9
> +#define EXYNOS_USB3_GUCTL_DTCT(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ((_x) << 9)
> +#define EXYNOS_USB3_GUCTL_DTFT_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0x1ff << 0)
> +#define EXYNOS_USB3_GUCTL_DTFT_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 0
> +#define EXYNOS_USB3_GUCTL_DTFT(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ((_x) << 0)
> +
> +/* TODO: Not finished */
> +#define EXYNOS_USB3_GBUSERRADDR_31_0 =A0 EXYNOS_USB3_REG(0xC130)
> +#define EXYNOS_USB3_GBUSERRADDR_63_32 =A0EXYNOS_USB3_REG(0xC134)
> +#define EXYNOS_USB3_GPRTBIMAP_31_0 =A0 =A0 EXYNOS_USB3_REG(0xC138)
> +#define EXYNOS_USB3_GPRTBIMAP_63_32 =A0 =A0EXYNOS_USB3_REG(0xC13C)
> +
> +#define EXYNOS_USB3_GHWPARAMS0 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC14=
0)
> +#define EXYNOS_USB3_GHWPARAMS1 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC14=
4)
> +#define EXYNOS_USB3_GHWPARAMS2 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC14=
8)
> +#define EXYNOS_USB3_GHWPARAMS3 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC14=
C)
> +#define EXYNOS_USB3_GHWPARAMS4 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC15=
0)
> +#define EXYNOS_USB3_GHWPARAMS5 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC15=
4)
> +#define EXYNOS_USB3_GHWPARAMS6 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC15=
8)
> +#define EXYNOS_USB3_GHWPARAMS7 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC15=
C)
> +
> +#define EXYNOS_USB3_GDBGFIFOSPACE =A0 =A0 =A0EXYNOS_USB3_REG(0xC160)
> +#define EXYNOS_USB3_GDBGLTSSM =A0 =A0 =A0 =A0 =A0EXYNOS_USB3_REG(0xC=
164)
> +
> +#define EXYNOS_USB3_GDBGLSPMUX =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC17=
0)
> +#define EXYNOS_USB3_GDBGLSP =A0 =A0 =A0 =A0 =A0 =A0EXYNOS_USB3_REG(0=
xC174)
> +#define EXYNOS_USB3_GDBGEPINFO0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNO=
S_USB3_REG(0xC178)
> +#define EXYNOS_USB3_GDBGEPINFO1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNO=
S_USB3_REG(0xC17C)
> +
> +#define EXYNOS_USB3_GPRTBIMAP_HS_31_0 =A0EXYNOS_USB3_REG(0xC180)
> +#define EXYNOS_USB3_GPRTBIMAP_HS_63_32 EXYNOS_USB3_REG(0xC184)
> +#define EXYNOS_USB3_GPRTBIMAP_FS_31_0 =A0EXYNOS_USB3_REG(0xC188)
> +#define EXYNOS_USB3_GPRTBIMAP_FS_63_32 EXYNOS_USB3_REG(0xC18C)
> +/****************/
> +
> +#define EXYNOS_USB3_GUSB2PHYCFG(_a) =A0 =A0EXYNOS_USB3_REG(0xC200 + =
((_a) * 0x04))
> +#define EXYNOS_USB3_GUSB2PHYCFGx_PHYSoftRst =A0 =A0 =A0 =A0 =A0 =A0(=
1 << 31)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_PhyIntrNum_MASK =A0 =A0 =A0 (0x3f <=
< 19)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_PhyIntrNum_SHIFT =A0 =A0 =A019
> +#define EXYNOS_USB3_GUSB2PHYCFGx_PhyIntrNum(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0((_x) << 19)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_ULPIExtVbusIndicator =A0(1 << 18)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_ULPIExtVbusDrv =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(1 << 17)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_ULPIClkSusM =A0 =A0 =A0 =A0 =A0 (1 =
<< 16)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_ULPIAutoRes =A0 =A0 =A0 =A0 =A0 (1 =
<< 15)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_PhyLPwrClkSel =A0 =A0 =A0 =A0 (1 <<=
 14)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_USBTrdTim_MASK =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0xf << 10)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_USBTrdTim_SHIFT =A0 =A0 =A0 10
> +#define EXYNOS_USB3_GUSB2PHYCFGx_USBTrdTim(_x) =A0 =A0 =A0 =A0 ((_x)=
 << 10)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_EnblSlpM =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(1 << 8)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_PHYSel =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(1 << 7)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_SusPHY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(1 << 6)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_FSIntf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(1 << 5)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_ULPI_UTMI_Sel =A0 =A0 =A0 =A0 (1 <<=
 4)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_PHYIf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1 << 3)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_TOutCal_MASK =A0 =A0 =A0 =A0 =A0(0x=
7 << 0)
> +#define EXYNOS_USB3_GUSB2PHYCFGx_TOutCal_SHIFT =A0 =A0 =A0 =A0 0
> +#define EXYNOS_USB3_GUSB2PHYCFGx_TOutCal(_x) =A0 =A0 =A0 =A0 =A0 ((_=
x) << 0)
> +
> +/* Reserved for future use */
> +#define EXYNOS_USB3_GUSB2I2CCTL(_a) =A0 =A0EXYNOS_USB3_REG(0xC240 + =
((_a) * 0x04))
> +
> +#define EXYNOS_USB3_GUSB2PHYACC(_a) =A0 =A0EXYNOS_USB3_REG(0xC280 + =
((_a) * 0x04))
> +#define EXYNOS_USB3_GUSB2PHYACCx_DisUlpiDrvr =A0 =A0 =A0 =A0 =A0 (1 =
<< 26)
> +#define EXYNOS_USB3_GUSB2PHYACCx_NewRegReq =A0 =A0 =A0 =A0 =A0 =A0 (=
1 << 25)
> +#define EXYNOS_USB3_GUSB2PHYACCx_VStsDone =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(1 << 24)
> +#define EXYNOS_USB3_GUSB2PHYACCx_VStsBsy =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1 << 23)
> +#define EXYNOS_USB3_GUSB2PHYACCx_RegWr =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1 << 22)
> +#define EXYNOS_USB3_GUSB2PHYACCx_RegAddr_MASK =A0 =A0 =A0 =A0 =A0(0x=
3f << 16)
> +#define EXYNOS_USB3_GUSB2PHYACCx_RegAddr_SHIFT =A0 =A0 =A0 =A0 16
> +#define EXYNOS_USB3_GUSB2PHYACCx_RegAddr(_x) =A0 =A0 =A0 =A0 =A0 ((_=
x) << 16)
> +/* Next 2 fields are overlaping. Is it error in user manual? */
> +#define EXYNOS_USB3_GUSB2PHYACCx_VCtrl_MASK =A0 =A0 =A0 =A0 =A0 =A0(=
0xff << 8)
> +#define EXYNOS_USB3_GUSB2PHYACCx_VCtrl_SHIFT =A0 =A0 =A0 =A0 =A0 8
> +#define EXYNOS_USB3_GUSB2PHYACCx_VCtrl(_x) =A0 =A0 =A0 =A0 =A0 =A0 (=
(_x) << 8)
> +/*---*/
> +#define EXYNOS_USB3_GUSB2PHYACCx_ExtRegAddr_MASK =A0 =A0 =A0 (0x3f <=
< 8)
> +#define EXYNOS_USB3_GUSB2PHYACCx_ExtRegAddr_SHIFT =A0 =A0 =A08
> +#define EXYNOS_USB3_GUSB2PHYACCx_ExtRegAddr(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0((_x) << 8)
> +/*---*/
> +#define EXYNOS_USB3_GUSB2PHYACCx_RegData_MASK =A0 =A0 =A0 =A0 =A0(0x=
ff << 0)
> +#define EXYNOS_USB3_GUSB2PHYACCx_RegData_SHIFT =A0 =A0 =A0 =A0 0
> +#define EXYNOS_USB3_GUSB2PHYACCx_RegData(_x) =A0 =A0 =A0 =A0 =A0 ((_=
x) << 0)
> +
> +#define EXYNOS_USB3_GUSB3PIPECTL(_a) =A0 EXYNOS_USB3_REG(0xC2C0 + ((=
_a) * 0x04))
> +#define EXYNOS_USB3_GUSB3PIPECTLx_PHYSoftRst =A0 =A0 =A0 =A0 =A0 (1 =
<< 31)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_request_p1p2p3 =A0 =A0 =A0 (1 << 2=
4)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_StartRxdetU3RxDet =A0 =A0(1 << 23)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_DisRxDetU3RxDet =A0 =A0 =A0(1 << 2=
2)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_delay_p1p2p3_MASK =A0 =A0(0x7 << 1=
9)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_delay_p1p2p3_SHIFT =A0 19
> +#define EXYNOS_USB3_GUSB3PIPECTLx_delay_p1p2p3(_x) =A0 =A0 ((_x) << =
19)
> +/* TODO: Check naming for the next 2 fields */
> +#define EXYNOS_USB3_GUSB3PIPECTLx_delay_phy_pwr_p1p2p3 (1 << 18)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_SuspSSPhy =A0 =A0 =A0 =A0 =A0 =A0(=
1 << 17)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_DatWidth_MASK =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x3 << 15)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_DatWidth_SHIFT =A0 =A0 =A0 15
> +#define EXYNOS_USB3_GUSB3PIPECTLx_DatWidth(_x) =A0 =A0 =A0 =A0 ((_x)=
 << 15)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_AbortRxDetInU2 =A0 =A0 =A0 (1 << 1=
4)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_SkipRxDet =A0 =A0 =A0 =A0 =A0 =A0(=
1 << 13)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_LFPSP0Algn =A0 =A0 =A0 =A0 =A0 (1 =
<< 12)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_P3P2TranOK =A0 =A0 =A0 =A0 =A0 (1 =
<< 11)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_LFPSFilt =A0 =A0 =A0 =A0 =A0 =A0 (=
1 << 9)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_TxSwing =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(1 << 6)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_TxMargin_MASK =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(0x7 << 3)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_TxMargin_SHIFT =A0 =A0 =A0 3
> +#define EXYNOS_USB3_GUSB3PIPECTLx_TxMargin(_x) =A0 =A0 =A0 =A0 ((_x)=
 << 3)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_TxDeemphasis_MASK =A0 =A0(0x3 << 1=
)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_TxDeemphasis_SHIFT =A0 1
> +#define EXYNOS_USB3_GUSB3PIPECTLx_TxDeemphasis(_x) =A0 =A0 ((_x) << =
1)
> +#define EXYNOS_USB3_GUSB3PIPECTLx_ElasticBufferMode =A0 =A0(1 << 0)
> +
> +#define EXYNOS_USB3_GTXFIFOSIZ(_a) =A0 =A0 EXYNOS_USB3_REG(0xC300 + =
((_a) * 0x04))
> +#define EXYNOS_USB3_GTXFIFOSIZx_TxFStAddr_n_MASK =A0 =A0 =A0 (0xffff=
 << 16)
> +#define EXYNOS_USB3_GTXFIFOSIZx_TxFStAddr_n_SHIFT =A0 =A0 =A016
> +#define EXYNOS_USB3_GTXFIFOSIZx_TxFStAddr_n(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0((_x) << 16)
> +#define EXYNOS_USB3_GTXFIFOSIZx_TxFDep_n_MASK =A0 =A0 =A0 =A0 =A0(0x=
ffff << 0)
> +#define EXYNOS_USB3_GTXFIFOSIZx_TxFDep_n_SHIFT =A0 =A0 =A0 =A0 0
> +#define EXYNOS_USB3_GTXFIFOSIZx_TxFDep_n(_x) =A0 =A0 =A0 =A0 =A0 ((_=
x) << 0)
> +
> +#define EXYNOS_USB3_GRXFIFOSIZ(_a) =A0 =A0 EXYNOS_USB3_REG(0xC380 + =
((_a) * 0x04))
> +#define EXYNOS_USB3_GRXFIFOSIZx_RxFStAddr_n_MASK =A0 =A0 =A0 (0xffff=
 << 16)
> +#define EXYNOS_USB3_GRXFIFOSIZx_RxFStAddr_n_SHIFT =A0 =A0 =A016
> +#define EXYNOS_USB3_GRXFIFOSIZx_RxFStAddr_n(_x) =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0((_x) << 16)
> +#define EXYNOS_USB3_GRXFIFOSIZx_RxFDep_n_MASK =A0 =A0 =A0 =A0 =A0(0x=
ffff << 0)
> +#define EXYNOS_USB3_GRXFIFOSIZx_RxFDep_n_SHIFT =A0 =A0 =A0 =A0 0
> +#define EXYNOS_USB3_GRXFIFOSIZx_RxFDep_n(_x) =A0 =A0 =A0 =A0 =A0 ((_=
x) << 0)
> +
> +#define EXYNOS_USB3_GEVNTADR_31_0(_a) =A0EXYNOS_USB3_REG(0xC400 + ((=
_a) * 0x10))
> +
> +#define EXYNOS_USB3_GEVNTADR_63_32(_a) EXYNOS_USB3_REG(0xC404 + ((_a=
) * 0x10))
> +
> +#define EXYNOS_USB3_GEVNTSIZ(_a) =A0 =A0 =A0 EXYNOS_USB3_REG(0xC408 =
+ ((_a) * 0x10))
> +#define EXYNOS_USB3_GEVNTSIZx_EvntIntMask =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(1 << 31)
> +#define EXYNOS_USB3_GEVNTSIZx_EVNTSiz_MASK =A0 =A0 =A0 =A0 =A0 =A0 (=
0xffff << 0)
> +#define EXYNOS_USB3_GEVNTSIZx_EVNTSiz_SHIFT =A0 =A0 =A0 =A0 =A0 =A00
> +#define EXYNOS_USB3_GEVNTSIZx_EVNTSiz(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 ((_x) << 0)
> +
> +#define EXYNOS_USB3_GEVNTCOUNT(_a) =A0 =A0 EXYNOS_USB3_REG(0xC40C + =
((_a) * 0x10))
> +#define EXYNOS_USB3_GEVNTCOUNTx_EVNTCount_MASK =A0 =A0 =A0 =A0 (0xff=
ff << 0)
> +#define EXYNOS_USB3_GEVNTCOUNTx_EVNTCount_SHIFT =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A00
> +#define EXYNOS_USB3_GEVNTCOUNTx_EVNTCount(_x) =A0 =A0 =A0 =A0 =A0((_=
x) << 0)
> +
> +/* Event Buffer Content for Device Endpoint-Specific Events (DEPEVT)=
 */
> +#define EXYNOS_USB3_DEPEVT_EventParam_MASK =A0 =A0 =A0 =A0 =A0 =A0 (=
0xffff << 16)
> +#define EXYNOS_USB3_DEPEVT_EventParam_SHIFT =A0 =A0 =A0 =A0 =A0 =A01=
6
> +#define EXYNOS_USB3_DEPEVT_EventParam(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
((_x) << 16)
> +#define EXYNOS_USB3_DEPEVT_EventStatus_MASK =A0 =A0 =A0 =A0 =A0 =A0(=
0xf << 12)
> +#define EXYNOS_USB3_DEPEVT_EventStatus_SHIFT =A0 =A0 =A0 =A0 =A0 12
> +#define EXYNOS_USB3_DEPEVT_EVENT_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0xf << 6)
> +#define EXYNOS_USB3_DEPEVT_EVENT_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 6
> +#define EXYNOS_USB3_DEPEVT_EVENT_EPCmdCmplt =A0 =A0 =A0 =A0 =A0 =A0(=
7 << 6)
> +#define EXYNOS_USB3_DEPEVT_EVENT_StreamEvt =A0 =A0 =A0 =A0 =A0 =A0 (=
6 << 6)
> +#define EXYNOS_USB3_DEPEVT_EVENT_RxTxfifoEvt =A0 =A0 =A0 =A0 =A0 (4 =
<< 6)
> +#define EXYNOS_USB3_DEPEVT_EVENT_XferNotReady =A0 =A0 =A0 =A0 =A0(3 =
<< 6)
> +#define EXYNOS_USB3_DEPEVT_EVENT_XferInProgress =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0(2 << 6)
> +#define EXYNOS_USB3_DEPEVT_EVENT_XferComplete =A0 =A0 =A0 =A0 =A0(1 =
<< 6)
> +#define EXYNOS_USB3_DEPEVT_EPNUM_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(0x1f << 1)
> +#define EXYNOS_USB3_DEPEVT_EPNUM_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 1
> +#define EXYNOS_USB3_DEPEVT_EPNUM(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 ((_x) << 1)
> +
> +/* Event Buffer Content for Device-Specific Events (DEVT) */
> +#define EXYNOS_USB3_DEVT_EventParam_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (0xf << 16)
> +#define EXYNOS_USB3_DEVT_EventParam_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0=
16
> +#define EXYNOS_USB3_DEVT_EventParam_SS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (1 << 20)
> +#define EXYNOS_USB3_DEVT_EventParam(_x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0((_x) << 16)
> +#define EXYNOS_USB3_DEVT_EVENT_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(0xf << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 8
> +#define EXYNOS_USB3_DEVT_EVENT_VndrDevTstRcved =A0 =A0 =A0 =A0 (12 <=
< 8)
> +#define EXYNOS_USB3_DEVT_EVENT_EvntOverflow =A0 =A0 =A0 =A0 =A0 =A0(=
11 << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_CmdCmplt =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(10 << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_ErrticErr =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (9 << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_Sof =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (7 << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_EOPF =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0(6 << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_WkUpEvt =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 (4 << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_ULStChng =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0(3 << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_ConnectDone =A0 =A0 =A0 =A0 =A0 =A0 (=
2 << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_USBRst =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(1 << 8)
> +#define EXYNOS_USB3_DEVT_EVENT_DisconnEvt =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(0 << 8)
> +
> +#define EXYNOS_USB3_GHWPARAMS8 =A0 =A0 =A0 =A0 EXYNOS_USB3_REG(0xC60=
0)
> +
> +#endif /* __SAMSUNG_PLAT_REGS_USB3_EXYNOS_DRD_H */
> diff --git a/arch/arm/plat-samsung/include/plat/udc-ss.h b/arch/arm/p=
lat-samsung/include/plat/udc-ss.h
> new file mode 100644
> index 0000000..911d48a
> --- /dev/null
> +++ b/arch/arm/plat-samsung/include/plat/udc-ss.h
> @@ -0,0 +1,21 @@
> +/* arch/arm/plat-samsung/include/plat/udc-ss.h
> + *
> + * Copyright (c) 2011 Samsung Electronics Co. Ltd
> + * Author: Anton Tikhomirov <av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + *
> + * EXYNOS SuperSpeed USB 3.0 DRD Controller platform information
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/**
> + * struct exynos_ss_udc_plat - platform data for EXYNOS USB 3.0 UDC
> + */
> +struct exynos_ss_udc_plat {
> + =A0 =A0 =A0 int (*phy_init)(struct platform_device *pdev, int type)=
;
> + =A0 =A0 =A0 int (*phy_exit)(struct platform_device *pdev, int type)=
;
> +};
> +
> +extern void exynos_ss_udc_set_platdata(struct exynos_ss_udc_plat *pd=
);
> diff --git a/arch/arm/plat-samsung/include/plat/usb-phy.h b/arch/arm/=
plat-samsung/include/plat/usb-phy.h
> index 959bcdb..f784101 100644
> --- a/arch/arm/plat-samsung/include/plat/usb-phy.h
> +++ b/arch/arm/plat-samsung/include/plat/usb-phy.h
> @@ -14,6 +14,7 @@
> =A0enum s5p_usb_phy_type {
> =A0 =A0 =A0 =A0S5P_USB_PHY_DEVICE,
> =A0 =A0 =A0 =A0S5P_USB_PHY_HOST,
> + =A0 =A0 =A0 S5P_USB_PHY_DRD,
> =A0};
>
> =A0extern int s5p_usb_phy_init(struct platform_device *pdev, int type=
);
> --
> 1.7.1
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
