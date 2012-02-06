From: Anton Tikhomirov <av.tikhomirov@samsung.com>
Subject: [PATCH 1/3] ARM: SAMSUNG: Add support for EXYNOS SS USB 3.0 DRD
 controller
Date: Mon, 06 Feb 2012 17:11:17 +0900
Message-ID: <000f01cce4a6$e6e652e0$b4b2f8a0$%tikhomirov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:13837 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752517Ab2BFILU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Feb 2012 03:11:20 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Greg Kroah-Hartman' <gregkh@suse.de>, 'Felipe Balbi' <balbi@ti.com>, 'Anton Tikhomirov' <av.tikhomirov@samsung.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>

Cc: Kukjin Kim <kgene.kim <at> samsung.com>
Cc: Greg Kroah-Hartman <gregkh <at> suse.de>
Cc: Felipe Balbi <balbi <at> ti.com>

Adds DRD global register definitions and related platform data.

Signed-off-by: Anton Tikhomirov <av.tikhomirov@samsung.com>
---
 .../include/plat/regs-usb3-exynos-drd.h            |  305 ++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/udc-ss.h        |   21 ++
 arch/arm/plat-samsung/include/plat/usb-phy.h       |    1 +
 3 files changed, 327 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/plat/regs-usb3-exynos-drd.h
 create mode 100644 arch/arm/plat-samsung/include/plat/udc-ss.h

diff --git a/arch/arm/plat-samsung/include/plat/regs-usb3-exynos-drd.h b/arch/arm/plat-samsung/include/plat/regs-usb3-exynos-drd.h
new file mode 100644
index 0000000..7006dc4
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/regs-usb3-exynos-drd.h
@@ -0,0 +1,305 @@
+/* arch/arm/plat-samsung/include/plat/regs-usb3-exynos-drd.h
+ *
+ * Copyright (c) 2011 Samsung Electronics Co. Ltd
+ * Author: Anton Tikhomirov <av.tikhomirov@samsung.com>
+ *
+ * Exynos SuperSpeed USB 3.0 DRD Controller Global registers
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __SAMSUNG_PLAT_REGS_USB3_EXYNOS_DRD_H
+#define __SAMSUNG_PLAT_REGS_USB3_EXYNOS_DRD_H __FILE__
+
+#define EXYNOS_USB3_REG(x) (x)
+
+#define EXYNOS_USB3_GSBUSCFG0		EXYNOS_USB3_REG(0xC100)
+#define EXYNOS_USB3_GSBUSCFG0_SBusStoreAndForward	(1 << 12)
+#define EXYNOS_USB3_GSBUSCFG0_DatBigEnd			(1 << 11)
+#define EXYNOS_USB3_GSBUSCFG0_INCR256BrstEna		(1 << 7)
+#define EXYNOS_USB3_GSBUSCFG0_INCR128BrstEna		(1 << 6)
+#define EXYNOS_USB3_GSBUSCFG0_INCR64BrstEna		(1 << 5)
+#define EXYNOS_USB3_GSBUSCFG0_INCR32BrstEna		(1 << 4)
+#define EXYNOS_USB3_GSBUSCFG0_INCR16BrstEna		(1 << 3)
+#define EXYNOS_USB3_GSBUSCFG0_INCR8BrstEna		(1 << 2)
+#define EXYNOS_USB3_GSBUSCFG0_INCR4BrstEna		(1 << 1)
+#define EXYNOS_USB3_GSBUSCFG0_INCRBrstEna		(1 << 0)
+
+#define EXYNOS_USB3_GSBUSCFG1		EXYNOS_USB3_REG(0xC104)
+#define EXYNOS_USB3_GSBUSCFG1_EN1KPAGE			(1 << 12)
+#define EXYNOS_USB3_GSBUSCFG1_BREQLIMIT_MASK		(0xf << 8)
+#define EXYNOS_USB3_GSBUSCFG1_BREQLIMIT_SHIFT		8
+#define EXYNOS_USB3_GSBUSCFG1_BREQLIMIT(_x)		((_x) << 8)
+
+
+#define EXYNOS_USB3_GTXTHRCFG		EXYNOS_USB3_REG(0xC108)
+#define EXYNOS_USB3_GTXTHRCFG_USBTxPktCntSel		(1 << 29)
+#define EXYNOS_USB3_GTXTHRCFG_USBTxPktCnt_MASK		(0xf << 24)
+#define EXYNOS_USB3_GTXTHRCFG_USBTxPktCnt_SHIFT		24
+#define EXYNOS_USB3_GTXTHRCFG_USBTxPktCnt(_x)		((_x) << 24)
+#define EXYNOS_USB3_GTXTHRCFG_USBMaxTxBurstSize_MASK	(0xff << 16)
+#define EXYNOS_USB3_GTXTHRCFG_USBMaxTxBurstSize_SHIFT	16
+#define EXYNOS_USB3_GTXTHRCFG_USBMaxTxBurstSize(_x)	((_x) << 16)
+
+
+#define EXYNOS_USB3_GRXTHRCFG		EXYNOS_USB3_REG(0xC10C)
+#define EXYNOS_USB3_GRXTHRCFG_USBRxPktCntSel		(1 << 29)
+#define EXYNOS_USB3_GRXTHRCFG_USBRxPktCnt_MASK		(0xf << 24)
+#define EXYNOS_USB3_GRXTHRCFG_USBRxPktCnt_SHIFT		24
+#define EXYNOS_USB3_GRXTHRCFG_USBRxPktCnt(_x)		((_x) << 24)
+#define EXYNOS_USB3_GRXTHRCFG_USBMaxRxBurstSize_MASK	(0x1f << 19)
+#define EXYNOS_USB3_GRXTHRCFG_USBMaxRxBurstSize_SHIFT	19
+#define EXYNOS_USB3_GRXTHRCFG_USBMaxRxBurstSize(_x)	((_x) << 19)
+
+
+#define EXYNOS_USB3_GCTL		EXYNOS_USB3_REG(0xC110)
+#define EXYNOS_USB3_GCTL_PwrDnScale_MASK		(0x1fff << 19)
+#define EXYNOS_USB3_GCTL_PwrDnScale_SHIFT		19
+#define EXYNOS_USB3_GCTL_PwrDnScale(_x)			((_x) << 19)
+#define EXYNOS_USB3_GCTL_U2RSTECN			(1 << 16)
+#define EXYNOS_USB3_GCTL_FRMSCLDWN_MASK			(0x3 << 14)
+#define EXYNOS_USB3_GCTL_FRMSCLDWN_SHIFT		14
+#define EXYNOS_USB3_GCTL_FRMSCLDWN(_x)			((_x) << 14)
+#define EXYNOS_USB3_GCTL_PrtCapDir_MASK			(0x3 << 12)
+#define EXYNOS_USB3_GCTL_PrtCapDir_SHIFT		12
+#define EXYNOS_USB3_GCTL_PrtCapDir(_x)			((_x) << 12)
+#define EXYNOS_USB3_GCTL_CoreSoftReset			(1 << 11)
+#define EXYNOS_USB3_GCTL_LocalLpBkEn			(1 << 10)
+#define EXYNOS_USB3_GCTL_LpbkEn				(1 << 9)
+#define EXYNOS_USB3_GCTL_DebugAttach			(1 << 8)
+#define EXYNOS_USB3_GCTL_RAMClkSel_MASK			(0x3 << 6)
+#define EXYNOS_USB3_GCTL_RAMClkSel_SHIFT		6
+#define EXYNOS_USB3_GCTL_RAMClkSel(_x)			((_x) << 6)
+#define EXYNOS_USB3_GCTL_ScaleDown_MASK			(0x3 << 4)
+#define EXYNOS_USB3_GCTL_ScaleDown_SHIFT		4
+#define EXYNOS_USB3_GCTL_ScaleDown(_x)			((_x) << 4)
+#define EXYNOS_USB3_GCTL_DisScramble			(1 << 3)
+#define EXYNOS_USB3_GCTL_SsPwrClmp			(1 << 2)
+#define EXYNOS_USB3_GCTL_HsFsLsPwrClmp			(1 << 1)
+#define EXYNOS_USB3_GCTL_DsblClkGtng			(1 << 0)
+
+#define EXYNOS_USB3_GEVTEN		EXYNOS_USB3_REG(0xC114)
+#define EXYNOS_USB3_GEVTEN_I2CEvtEn			(1 << 1)
+#define EXYNOS_USB3_GEVTEN_ULPICKEvtEn			(1 << 0)
+#define EXYNOS_USB3_GEVTEN_I2CCKEvtEn			(1 << 0)
+
+#define EXYNOS_USB3_GSTS		EXYNOS_USB3_REG(0xC118)
+#define EXYNOS_USB3_GSTS_CBELT_MASK			(0xfff << 20)
+#define EXYNOS_USB3_GSTS_CBELT_SHIFT			20
+#define EXYNOS_USB3_GSTS_CBELT(_x)			((_x) << 20)
+#define EXYNOS_USB3_GSTS_OTG_IP				(1 << 10)
+#define EXYNOS_USB3_GSTS_BC_IP				(1 << 9)
+#define EXYNOS_USB3_GSTS_ADP_IP				(1 << 8)
+#define EXYNOS_USB3_GSTS_Host_IP			(1 << 7)
+#define EXYNOS_USB3_GSTS_Device_IP			(1 << 6)
+#define EXYNOS_USB3_GSTS_CSRTimeout			(1 << 5)
+#define EXYNOS_USB3_GSTS_BusErrAddrVld			(1 << 4)
+#define EXYNOS_USB3_GSTS_CurMod_MASK			(0x3 << 0)
+#define EXYNOS_USB3_GSTS_CurMod_SHIFT			0
+#define EXYNOS_USB3_GSTS_CurMod(_x)			((_x) << 0)
+
+#define EXYNOS_USB3_GSNPSID		EXYNOS_USB3_REG(0xC120)
+
+#define EXYNOS_USB3_GGPIO		EXYNOS_USB3_REG(0xC124)
+#define EXYNOS_USB3_GGPIO_GPO_MASK			(0xffff << 16)
+#define EXYNOS_USB3_GGPIO_GPO_SHIFT			16
+#define EXYNOS_USB3_GGPIO_GPO(_x)			((_x) << 16)
+#define EXYNOS_USB3_GGPIO_GPI_MASK			(0xffff << 0)
+#define EXYNOS_USB3_GGPIO_GPI_SHIFT			0
+#define EXYNOS_USB3_GGPIO_GPI(_x)			((x) << 0)
+
+#define EXYNOS_USB3_GUID		EXYNOS_USB3_REG(0xC128)
+
+#define EXYNOS_USB3_GUCTL		EXYNOS_USB3_REG(0xC12C)
+#define EXYNOS_USB3_GUCTL_SprsCtrlTransEn		(1 << 17)
+#define EXYNOS_USB3_GUCTL_ResBwHSEPS			(1 << 16)
+#define EXYNOS_USB3_GUCTL_CMdevAddr			(1 << 15)
+#define EXYNOS_USB3_GUCTL_USBHstInAutoRetryEn		(1 << 14)
+#define EXYNOS_USB3_GUCTL_USBHstInMaxBurst_MASK		(0x7 << 11)
+#define EXYNOS_USB3_GUCTL_USBHstInMaxBurst_SHIFT	11
+#define EXYNOS_USB3_GUCTL_USBHstInMaxBurst(_x)		((_x) << 11)
+#define EXYNOS_USB3_GUCTL_DTCT_MASK			(0x3 << 9)
+#define EXYNOS_USB3_GUCTL_DTCT_SHIFT			9
+#define EXYNOS_USB3_GUCTL_DTCT(_x)			((_x) << 9)
+#define EXYNOS_USB3_GUCTL_DTFT_MASK			(0x1ff << 0)
+#define EXYNOS_USB3_GUCTL_DTFT_SHIFT			0
+#define EXYNOS_USB3_GUCTL_DTFT(_x)			((_x) << 0)
+
+/* TODO: Not finished */
+#define EXYNOS_USB3_GBUSERRADDR_31_0	EXYNOS_USB3_REG(0xC130)
+#define EXYNOS_USB3_GBUSERRADDR_63_32	EXYNOS_USB3_REG(0xC134)
+#define EXYNOS_USB3_GPRTBIMAP_31_0	EXYNOS_USB3_REG(0xC138)
+#define EXYNOS_USB3_GPRTBIMAP_63_32	EXYNOS_USB3_REG(0xC13C)
+
+#define EXYNOS_USB3_GHWPARAMS0		EXYNOS_USB3_REG(0xC140)
+#define EXYNOS_USB3_GHWPARAMS1		EXYNOS_USB3_REG(0xC144)
+#define EXYNOS_USB3_GHWPARAMS2		EXYNOS_USB3_REG(0xC148)
+#define EXYNOS_USB3_GHWPARAMS3		EXYNOS_USB3_REG(0xC14C)
+#define EXYNOS_USB3_GHWPARAMS4		EXYNOS_USB3_REG(0xC150)
+#define EXYNOS_USB3_GHWPARAMS5		EXYNOS_USB3_REG(0xC154)
+#define EXYNOS_USB3_GHWPARAMS6		EXYNOS_USB3_REG(0xC158)
+#define EXYNOS_USB3_GHWPARAMS7		EXYNOS_USB3_REG(0xC15C)
+
+#define EXYNOS_USB3_GDBGFIFOSPACE	EXYNOS_USB3_REG(0xC160)
+#define EXYNOS_USB3_GDBGLTSSM		EXYNOS_USB3_REG(0xC164)
+
+#define EXYNOS_USB3_GDBGLSPMUX		EXYNOS_USB3_REG(0xC170)
+#define EXYNOS_USB3_GDBGLSP		EXYNOS_USB3_REG(0xC174)
+#define EXYNOS_USB3_GDBGEPINFO0		EXYNOS_USB3_REG(0xC178)
+#define EXYNOS_USB3_GDBGEPINFO1		EXYNOS_USB3_REG(0xC17C)
+
+#define EXYNOS_USB3_GPRTBIMAP_HS_31_0	EXYNOS_USB3_REG(0xC180)
+#define EXYNOS_USB3_GPRTBIMAP_HS_63_32	EXYNOS_USB3_REG(0xC184)
+#define EXYNOS_USB3_GPRTBIMAP_FS_31_0	EXYNOS_USB3_REG(0xC188)
+#define EXYNOS_USB3_GPRTBIMAP_FS_63_32	EXYNOS_USB3_REG(0xC18C)
+/****************/
+
+#define EXYNOS_USB3_GUSB2PHYCFG(_a)	EXYNOS_USB3_REG(0xC200 + ((_a) * 0x04))
+#define EXYNOS_USB3_GUSB2PHYCFGx_PHYSoftRst		(1 << 31)
+#define EXYNOS_USB3_GUSB2PHYCFGx_PhyIntrNum_MASK	(0x3f << 19)
+#define EXYNOS_USB3_GUSB2PHYCFGx_PhyIntrNum_SHIFT	19
+#define EXYNOS_USB3_GUSB2PHYCFGx_PhyIntrNum(_x)		((_x) << 19)
+#define EXYNOS_USB3_GUSB2PHYCFGx_ULPIExtVbusIndicator	(1 << 18)
+#define EXYNOS_USB3_GUSB2PHYCFGx_ULPIExtVbusDrv		(1 << 17)
+#define EXYNOS_USB3_GUSB2PHYCFGx_ULPIClkSusM		(1 << 16)
+#define EXYNOS_USB3_GUSB2PHYCFGx_ULPIAutoRes		(1 << 15)
+#define EXYNOS_USB3_GUSB2PHYCFGx_PhyLPwrClkSel		(1 << 14)
+#define EXYNOS_USB3_GUSB2PHYCFGx_USBTrdTim_MASK		(0xf << 10)
+#define EXYNOS_USB3_GUSB2PHYCFGx_USBTrdTim_SHIFT	10
+#define EXYNOS_USB3_GUSB2PHYCFGx_USBTrdTim(_x)		((_x) << 10)
+#define EXYNOS_USB3_GUSB2PHYCFGx_EnblSlpM		(1 << 8)
+#define EXYNOS_USB3_GUSB2PHYCFGx_PHYSel			(1 << 7)
+#define EXYNOS_USB3_GUSB2PHYCFGx_SusPHY			(1 << 6)
+#define EXYNOS_USB3_GUSB2PHYCFGx_FSIntf			(1 << 5)
+#define EXYNOS_USB3_GUSB2PHYCFGx_ULPI_UTMI_Sel		(1 << 4)
+#define EXYNOS_USB3_GUSB2PHYCFGx_PHYIf			(1 << 3)
+#define EXYNOS_USB3_GUSB2PHYCFGx_TOutCal_MASK		(0x7 << 0)
+#define EXYNOS_USB3_GUSB2PHYCFGx_TOutCal_SHIFT		0
+#define EXYNOS_USB3_GUSB2PHYCFGx_TOutCal(_x)		((_x) << 0)
+
+/* Reserved for future use */
+#define EXYNOS_USB3_GUSB2I2CCTL(_a)	EXYNOS_USB3_REG(0xC240 + ((_a) * 0x04))
+
+#define EXYNOS_USB3_GUSB2PHYACC(_a)	EXYNOS_USB3_REG(0xC280 + ((_a) * 0x04))
+#define EXYNOS_USB3_GUSB2PHYACCx_DisUlpiDrvr		(1 << 26)
+#define EXYNOS_USB3_GUSB2PHYACCx_NewRegReq		(1 << 25)
+#define EXYNOS_USB3_GUSB2PHYACCx_VStsDone		(1 << 24)
+#define EXYNOS_USB3_GUSB2PHYACCx_VStsBsy		(1 << 23)
+#define EXYNOS_USB3_GUSB2PHYACCx_RegWr			(1 << 22)
+#define EXYNOS_USB3_GUSB2PHYACCx_RegAddr_MASK		(0x3f << 16)
+#define EXYNOS_USB3_GUSB2PHYACCx_RegAddr_SHIFT		16
+#define EXYNOS_USB3_GUSB2PHYACCx_RegAddr(_x)		((_x) << 16)
+/* Next 2 fields are overlaping. Is it error in user manual? */
+#define EXYNOS_USB3_GUSB2PHYACCx_VCtrl_MASK		(0xff << 8)
+#define EXYNOS_USB3_GUSB2PHYACCx_VCtrl_SHIFT		8
+#define EXYNOS_USB3_GUSB2PHYACCx_VCtrl(_x)		((_x) << 8)
+/*---*/
+#define EXYNOS_USB3_GUSB2PHYACCx_ExtRegAddr_MASK	(0x3f << 8)
+#define EXYNOS_USB3_GUSB2PHYACCx_ExtRegAddr_SHIFT	8
+#define EXYNOS_USB3_GUSB2PHYACCx_ExtRegAddr(_x)		((_x) << 8)
+/*---*/
+#define EXYNOS_USB3_GUSB2PHYACCx_RegData_MASK		(0xff << 0)
+#define EXYNOS_USB3_GUSB2PHYACCx_RegData_SHIFT		0
+#define EXYNOS_USB3_GUSB2PHYACCx_RegData(_x)		((_x) << 0)
+
+#define EXYNOS_USB3_GUSB3PIPECTL(_a)	EXYNOS_USB3_REG(0xC2C0 + ((_a) * 0x04))
+#define EXYNOS_USB3_GUSB3PIPECTLx_PHYSoftRst		(1 << 31)
+#define EXYNOS_USB3_GUSB3PIPECTLx_request_p1p2p3	(1 << 24)
+#define EXYNOS_USB3_GUSB3PIPECTLx_StartRxdetU3RxDet	(1 << 23)
+#define EXYNOS_USB3_GUSB3PIPECTLx_DisRxDetU3RxDet	(1 << 22)
+#define EXYNOS_USB3_GUSB3PIPECTLx_delay_p1p2p3_MASK	(0x7 << 19)
+#define EXYNOS_USB3_GUSB3PIPECTLx_delay_p1p2p3_SHIFT	19
+#define EXYNOS_USB3_GUSB3PIPECTLx_delay_p1p2p3(_x)	((_x) << 19)
+/* TODO: Check naming for the next 2 fields */
+#define EXYNOS_USB3_GUSB3PIPECTLx_delay_phy_pwr_p1p2p3	(1 << 18)
+#define EXYNOS_USB3_GUSB3PIPECTLx_SuspSSPhy		(1 << 17)
+#define EXYNOS_USB3_GUSB3PIPECTLx_DatWidth_MASK		(0x3 << 15)
+#define EXYNOS_USB3_GUSB3PIPECTLx_DatWidth_SHIFT	15
+#define EXYNOS_USB3_GUSB3PIPECTLx_DatWidth(_x)		((_x) << 15)
+#define EXYNOS_USB3_GUSB3PIPECTLx_AbortRxDetInU2	(1 << 14)
+#define EXYNOS_USB3_GUSB3PIPECTLx_SkipRxDet		(1 << 13)
+#define EXYNOS_USB3_GUSB3PIPECTLx_LFPSP0Algn		(1 << 12)
+#define EXYNOS_USB3_GUSB3PIPECTLx_P3P2TranOK		(1 << 11)
+#define EXYNOS_USB3_GUSB3PIPECTLx_LFPSFilt		(1 << 9)
+#define EXYNOS_USB3_GUSB3PIPECTLx_TxSwing		(1 << 6)
+#define EXYNOS_USB3_GUSB3PIPECTLx_TxMargin_MASK		(0x7 << 3)
+#define EXYNOS_USB3_GUSB3PIPECTLx_TxMargin_SHIFT	3
+#define EXYNOS_USB3_GUSB3PIPECTLx_TxMargin(_x)		((_x) << 3)
+#define EXYNOS_USB3_GUSB3PIPECTLx_TxDeemphasis_MASK	(0x3 << 1)
+#define EXYNOS_USB3_GUSB3PIPECTLx_TxDeemphasis_SHIFT	1
+#define EXYNOS_USB3_GUSB3PIPECTLx_TxDeemphasis(_x)	((_x) << 1)
+#define EXYNOS_USB3_GUSB3PIPECTLx_ElasticBufferMode	(1 << 0)
+
+#define EXYNOS_USB3_GTXFIFOSIZ(_a)	EXYNOS_USB3_REG(0xC300 + ((_a) * 0x04))
+#define EXYNOS_USB3_GTXFIFOSIZx_TxFStAddr_n_MASK	(0xffff << 16)
+#define EXYNOS_USB3_GTXFIFOSIZx_TxFStAddr_n_SHIFT	16
+#define EXYNOS_USB3_GTXFIFOSIZx_TxFStAddr_n(_x)		((_x) << 16)
+#define EXYNOS_USB3_GTXFIFOSIZx_TxFDep_n_MASK		(0xffff << 0)
+#define EXYNOS_USB3_GTXFIFOSIZx_TxFDep_n_SHIFT		0
+#define EXYNOS_USB3_GTXFIFOSIZx_TxFDep_n(_x)		((_x) << 0)
+
+#define EXYNOS_USB3_GRXFIFOSIZ(_a)	EXYNOS_USB3_REG(0xC380 + ((_a) * 0x04))
+#define EXYNOS_USB3_GRXFIFOSIZx_RxFStAddr_n_MASK	(0xffff << 16)
+#define EXYNOS_USB3_GRXFIFOSIZx_RxFStAddr_n_SHIFT	16
+#define EXYNOS_USB3_GRXFIFOSIZx_RxFStAddr_n(_x)		((_x) << 16)
+#define EXYNOS_USB3_GRXFIFOSIZx_RxFDep_n_MASK		(0xffff << 0)
+#define EXYNOS_USB3_GRXFIFOSIZx_RxFDep_n_SHIFT		0
+#define EXYNOS_USB3_GRXFIFOSIZx_RxFDep_n(_x)		((_x) << 0)
+
+#define EXYNOS_USB3_GEVNTADR_31_0(_a)	EXYNOS_USB3_REG(0xC400 + ((_a) * 0x10))
+
+#define EXYNOS_USB3_GEVNTADR_63_32(_a)	EXYNOS_USB3_REG(0xC404 + ((_a) * 0x10))
+
+#define EXYNOS_USB3_GEVNTSIZ(_a)	EXYNOS_USB3_REG(0xC408 + ((_a) * 0x10))
+#define EXYNOS_USB3_GEVNTSIZx_EvntIntMask		(1 << 31)
+#define EXYNOS_USB3_GEVNTSIZx_EVNTSiz_MASK		(0xffff << 0)
+#define EXYNOS_USB3_GEVNTSIZx_EVNTSiz_SHIFT		0
+#define EXYNOS_USB3_GEVNTSIZx_EVNTSiz(x)		((_x) << 0)
+
+#define EXYNOS_USB3_GEVNTCOUNT(_a)	EXYNOS_USB3_REG(0xC40C + ((_a) * 0x10))
+#define EXYNOS_USB3_GEVNTCOUNTx_EVNTCount_MASK		(0xffff << 0)
+#define EXYNOS_USB3_GEVNTCOUNTx_EVNTCount_SHIFT		0
+#define EXYNOS_USB3_GEVNTCOUNTx_EVNTCount(_x)		((_x) << 0)
+
+/* Event Buffer Content for Device Endpoint-Specific Events (DEPEVT) */
+#define EXYNOS_USB3_DEPEVT_EventParam_MASK		(0xffff << 16)
+#define EXYNOS_USB3_DEPEVT_EventParam_SHIFT		16
+#define EXYNOS_USB3_DEPEVT_EventParam(_x)		((_x) << 16)
+#define EXYNOS_USB3_DEPEVT_EventStatus_MASK		(0xf << 12)
+#define EXYNOS_USB3_DEPEVT_EventStatus_SHIFT		12
+#define EXYNOS_USB3_DEPEVT_EVENT_MASK			(0xf << 6)
+#define EXYNOS_USB3_DEPEVT_EVENT_SHIFT			6
+#define EXYNOS_USB3_DEPEVT_EVENT_EPCmdCmplt		(7 << 6)
+#define EXYNOS_USB3_DEPEVT_EVENT_StreamEvt		(6 << 6)
+#define EXYNOS_USB3_DEPEVT_EVENT_RxTxfifoEvt		(4 << 6)
+#define EXYNOS_USB3_DEPEVT_EVENT_XferNotReady		(3 << 6)
+#define EXYNOS_USB3_DEPEVT_EVENT_XferInProgress		(2 << 6)
+#define EXYNOS_USB3_DEPEVT_EVENT_XferComplete		(1 << 6)
+#define EXYNOS_USB3_DEPEVT_EPNUM_MASK			(0x1f << 1)
+#define EXYNOS_USB3_DEPEVT_EPNUM_SHIFT			1
+#define EXYNOS_USB3_DEPEVT_EPNUM(_x)			((_x) << 1)
+
+/* Event Buffer Content for Device-Specific Events (DEVT) */
+#define EXYNOS_USB3_DEVT_EventParam_MASK		(0xf << 16)
+#define EXYNOS_USB3_DEVT_EventParam_SHIFT		16
+#define EXYNOS_USB3_DEVT_EventParam_SS			(1 << 20)
+#define EXYNOS_USB3_DEVT_EventParam(_x)			((_x) << 16)
+#define EXYNOS_USB3_DEVT_EVENT_MASK			(0xf << 8)
+#define EXYNOS_USB3_DEVT_EVENT_SHIFT			8
+#define EXYNOS_USB3_DEVT_EVENT_VndrDevTstRcved		(12 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_EvntOverflow		(11 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_CmdCmplt			(10 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_ErrticErr		(9 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_Sof			(7 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_EOPF			(6 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_WkUpEvt			(4 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_ULStChng			(3 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_ConnectDone		(2 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_USBRst			(1 << 8)
+#define EXYNOS_USB3_DEVT_EVENT_DisconnEvt		(0 << 8)
+
+#define EXYNOS_USB3_GHWPARAMS8		EXYNOS_USB3_REG(0xC600)
+
+#endif /* __SAMSUNG_PLAT_REGS_USB3_EXYNOS_DRD_H */
diff --git a/arch/arm/plat-samsung/include/plat/udc-ss.h b/arch/arm/plat-samsung/include/plat/udc-ss.h
new file mode 100644
index 0000000..911d48a
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/udc-ss.h
@@ -0,0 +1,21 @@
+/* arch/arm/plat-samsung/include/plat/udc-ss.h
+ *
+ * Copyright (c) 2011 Samsung Electronics Co. Ltd
+ * Author: Anton Tikhomirov <av.tikhomirov@samsung.com>
+ *
+ * EXYNOS SuperSpeed USB 3.0 DRD Controller platform information
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/**
+ * struct exynos_ss_udc_plat - platform data for EXYNOS USB 3.0 UDC
+ */
+struct exynos_ss_udc_plat {
+	int (*phy_init)(struct platform_device *pdev, int type);
+	int (*phy_exit)(struct platform_device *pdev, int type);
+};
+
+extern void exynos_ss_udc_set_platdata(struct exynos_ss_udc_plat *pd);
diff --git a/arch/arm/plat-samsung/include/plat/usb-phy.h b/arch/arm/plat-samsung/include/plat/usb-phy.h
index 959bcdb..f784101 100644
--- a/arch/arm/plat-samsung/include/plat/usb-phy.h
+++ b/arch/arm/plat-samsung/include/plat/usb-phy.h
@@ -14,6 +14,7 @@
 enum s5p_usb_phy_type {
 	S5P_USB_PHY_DEVICE,
 	S5P_USB_PHY_HOST,
+	S5P_USB_PHY_DRD,
 };
 
 extern int s5p_usb_phy_init(struct platform_device *pdev, int type);
-- 
1.7.1
