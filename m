From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 1/2] ARM: S5P: Add support for system mmu
Date: Mon,  3 Jan 2011 19:48:56 +0900
Message-ID: <1294051737-4278-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45993 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753213Ab1ACLKS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jan 2011 06:10:18 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Donguk Ryu <du.ryu@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Donguk Ryu <du.ryu@samsung.com>

This patch implements system mmu driver.
system mmu support address transition from virtual address to physical address.
IP connected system mmu can use directly vitrual address
when IP access physical memory not using physical address

Signed-off-by: Donguk Ryu <du.ryu@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/irqs.h        |   18 ++
 arch/arm/mach-s5pv310/include/mach/map.h         |   19 ++
 arch/arm/mach-s5pv310/include/mach/regs-sysmmu.h |   33 +++
 arch/arm/mach-s5pv310/include/mach/sysmmu.h      |  119 ++++++++
 arch/arm/plat-s5p/Kconfig                        |   16 +
 arch/arm/plat-s5p/Makefile                       |    1 +
 arch/arm/plat-s5p/include/plat/sysmmu.h          |   23 ++
 arch/arm/plat-s5p/sysmmu.c                       |  331 ++++++++++++++++++++++
 8 files changed, 560 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/include/mach/regs-sysmmu.h
 create mode 100644 arch/arm/mach-s5pv310/include/mach/sysmmu.h
 create mode 100644 arch/arm/plat-s5p/include/plat/sysmmu.h
 create mode 100644 arch/arm/plat-s5p/sysmmu.c

diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-s5pv310/include/mach/irqs.h
index 1dd130a..536b0b5 100644
--- a/arch/arm/mach-s5pv310/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
@@ -55,6 +55,24 @@
 #define COMBINER_GROUP(x)	((x) * MAX_IRQ_IN_COMBINER + IRQ_SPI(64))
 #define COMBINER_IRQ(x, y)	(COMBINER_GROUP(x) + y)
 
+#define IRQ_SYSMMU_MDMA0_0	COMBINER_IRQ(4, 0)
+#define IRQ_SYSMMU_SSS_0	COMBINER_IRQ(4, 1)
+#define IRQ_SYSMMU_FIMC0_0	COMBINER_IRQ(4, 2)
+#define IRQ_SYSMMU_FIMC1_0	COMBINER_IRQ(4, 3)
+#define IRQ_SYSMMU_FIMC2_0	COMBINER_IRQ(4, 4)
+#define IRQ_SYSMMU_FIMC3_0	COMBINER_IRQ(4, 5)
+#define IRQ_SYSMMU_JPEG_0	COMBINER_IRQ(4, 6)
+#define IRQ_SYSMMU_2D_0		COMBINER_IRQ(4, 7)
+
+#define IRQ_SYSMMU_ROTATOR_0	COMBINER_IRQ(5, 0)
+#define IRQ_SYSMMU_MDMA1_0	COMBINER_IRQ(5, 1)
+#define IRQ_SYSMMU_LCD0_M0_0	COMBINER_IRQ(5, 2)
+#define IRQ_SYSMMU_LCD1_M1_0	COMBINER_IRQ(5, 3)
+#define IRQ_SYSMMU_TV_M0_0	COMBINER_IRQ(5, 4)
+#define IRQ_SYSMMU_MFC_M0_0	COMBINER_IRQ(5, 5)
+#define IRQ_SYSMMU_MFC_M1_0	COMBINER_IRQ(5, 6)
+#define IRQ_SYSMMU_PCIE_0	COMBINER_IRQ(5, 7)
+
 #define IRQ_PDMA0		COMBINER_IRQ(21, 0)
 #define IRQ_PDMA1		COMBINER_IRQ(21, 1)
 
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 44af3e8..71de19f 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -106,6 +106,25 @@
 #define S5PV310_PA_SDRAM		(0x40000000)
 #define S5P_PA_SDRAM			S5PV310_PA_SDRAM
 
+#define S5PV310_PA_SYSMMU_MDMA		0x10A40000
+#define S5PV310_PA_SYSMMU_SSS		0x10A50000
+#define S5PV310_PA_SYSMMU_FIMC0		0x11A20000
+#define S5PV310_PA_SYSMMU_FIMC1		0x11A30000
+#define S5PV310_PA_SYSMMU_FIMC2		0x11A40000
+#define S5PV310_PA_SYSMMU_FIMC3		0x11A50000
+#define S5PV310_PA_SYSMMU_JPEG		0x11A60000
+#define S5PV310_PA_SYSMMU_FIMD0		0x11E20000
+#define S5PV310_PA_SYSMMU_FIMD1		0x12220000
+#define S5PV310_PA_SYSMMU_PCIe		0x12620000
+#define S5PV310_PA_SYSMMU_G2D		0x12A20000
+#define S5PV310_PA_SYSMMU_ROTATOR	0x12A30000
+#define S5PV310_PA_SYSMMU_MDMA2		0x12A40000
+#define S5PV310_PA_SYSMMU_TV		0x12E20000
+#define S5PV310_PA_SYSMMU_MFC_L		0x13620000
+#define S5PV310_PA_SYSMMU_MFC_R		0x13630000
+#define S5PV310_SYSMMU_TOTAL_IPNUM	16
+#define S5P_SYSMMU_TOTAL_IPNUM		S5PV310_SYSMMU_TOTAL_IPNUM
+
 /* compatibiltiy defines. */
 #define S3C_PA_UART			S5PV310_PA_UART
 #define S3C_PA_HSMMC0			S5PV310_PA_HSMMC(0)
diff --git a/arch/arm/mach-s5pv310/include/mach/regs-sysmmu.h b/arch/arm/mach-s5pv310/include/mach/regs-sysmmu.h
new file mode 100644
index 0000000..e5acfc3
--- /dev/null
+++ b/arch/arm/mach-s5pv310/include/mach/regs-sysmmu.h
@@ -0,0 +1,33 @@
+/* linux/arch/arm/mach-s5pv310/include/mach/regs-sysmmu.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * S5PV310 - System MMU register
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARCH_REGS_SYSMMU_H
+#define __ASM_ARCH_REGS_SYSMMU_H __FILE__
+
+#define S5P_MMU_CTRL			0x000
+#define S5P_MMU_CFG			0x004
+#define S5P_MMU_STATUS			0x008
+#define S5P_MMU_FLUSH			0x00C
+#define S5P_MMU_FLUSH_ENTRY		0x010
+#define S5P_PT_BASE_ADDR		0x014
+#define S5P_INT_STATUS			0x018
+#define S5P_INT_CLEAR			0x01C
+#define S5P_INT_MASK			0x020
+#define S5P_PAGE_FAULT_ADDR		0x024
+#define S5P_AW_FAULT_ADDR		0x028
+#define S5P_AR_FAULT_ADDR		0x02C
+#define S5P_DEFAULT_SLAVE_ADDR		0x030
+#define S5P_MMU_VERSION			0x034
+#define S5P_TLB_READ			0x038
+#define S5P_TLB_DATA			0x03C
+
+#endif /* __ASM_ARCH_REGS_SYSMMU_H */
diff --git a/arch/arm/mach-s5pv310/include/mach/sysmmu.h b/arch/arm/mach-s5pv310/include/mach/sysmmu.h
new file mode 100644
index 0000000..28f4cf4
--- /dev/null
+++ b/arch/arm/mach-s5pv310/include/mach/sysmmu.h
@@ -0,0 +1,119 @@
+/* linux/arch/arm/mach-s5pv310/include/mach/sysmmu.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * Samsung sysmmu driver for S5PV310
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARM_ARCH_SYSMMU_H
+#define __ASM_ARM_ARCH_SYSMMU_H __FILE__
+
+enum s5pv310_sysmmu_ips {
+	SYSMMU_MDMA,
+	SYSMMU_SSS,
+	SYSMMU_FIMC0,
+	SYSMMU_FIMC1,
+	SYSMMU_FIMC2,
+	SYSMMU_FIMC3,
+	SYSMMU_JPEG,
+	SYSMMU_FIMD0,
+	SYSMMU_FIMD1,
+	SYSMMU_PCIe,
+	SYSMMU_G2D,
+	SYSMMU_ROTATOR,
+	SYSMMU_MDMA2,
+	SYSMMU_TV,
+	SYSMMU_MFC_L,
+	SYSMMU_MFC_R,
+};
+
+static char *sysmmu_ips_name[S5P_SYSMMU_TOTAL_IPNUM] = {
+	"SYSMMU_MDMA"	,
+	"SYSMMU_SSS"	,
+	"SYSMMU_FIMC0"	,
+	"SYSMMU_FIMC1"	,
+	"SYSMMU_FIMC2"	,
+	"SYSMMU_FIMC3"	,
+	"SYSMMU_JPEG"	,
+	"SYSMMU_FIMD0"	,
+	"SYSMMU_FIMD1"	,
+	"SYSMMU_PCIe"	,
+	"SYSMMU_G2D"	,
+	"SYSMMU_ROTATOR",
+	"SYSMMU_MDMA2"	,
+	"SYSMMU_TV"	,
+	"SYSMMU_MFC_L"	,
+	"SYSMMU_MFC_R"	,
+};
+
+typedef enum s5pv310_sysmmu_ips sysmmu_ips;
+
+struct sysmmu_tt_info {
+	unsigned long *pgd;
+	unsigned long pgd_paddr;
+	unsigned long *pte;
+};
+
+struct sysmmu_controller {
+	const char		*name;
+
+	/* channels registers */
+	void __iomem		*regs;
+
+	/* channel irq */
+	unsigned int		irq;
+
+	sysmmu_ips		ips;
+
+	/* Translation Table Info. */
+	struct sysmmu_tt_info	*tt_info;
+
+	struct resource		*mem;
+	struct device		*dev;
+
+	/* SysMMU controller enable - true : enable */
+	bool			enable;
+};
+
+/**
+ * s5p_sysmmu_enable() - enable system mmu of ip
+ * @ips: The ip connected system mmu.
+ *
+ * This function enable system mmu to transfer address
+ * from virtual address to physical address
+ */
+int s5p_sysmmu_enable(sysmmu_ips ips);
+
+/**
+ * s5p_sysmmu_disable() - disable sysmmu mmu of ip
+ * @ips: The ip connected system mmu.
+ *
+ * This function disable system mmu to transfer address
+ * from virtual address to physical address
+ */
+int s5p_sysmmu_disable(sysmmu_ips ips);
+
+/**
+ * s5p_sysmmu_set_tablebase_pgd() - set page table base address to refer page table
+ * @ips: The ip connected system mmu.
+ * @pgd: The page table base address.
+ *
+ * This function set page table base address
+ * When system mmu transfer address from virtaul address to physical address,
+ * system mmu refer address information from page table
+ */
+int s5p_sysmmu_set_tablebase_pgd(sysmmu_ips ips, unsigned long pgd);
+
+/**
+ * s5p_sysmmu_tlb_invalidate() - flush all TLB entry in system mmu
+ * @ips: The ip connected system mmu.
+ *
+ * This function flush all TLB entry in system mmu
+ */
+int s5p_sysmmu_tlb_invalidate(sysmmu_ips ips);
+#endif /* __ASM_ARM_ARCH_SYSMMU_H */
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 6a161f3..deb3995 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -66,3 +66,19 @@ config S5P_DEV_CSIS1
 	bool
 	help
 	  Compile in platform device definitions for MIPI-CSIS channel 1
+
+menuconfig S5P_SYSMMU
+	bool "SYSMMU support"
+	depends on ARCH_S5PV310
+	help
+	  This is a System MMU driver for Samsung ARM based Soc.
+
+if S5P_SYSMMU
+
+config S5P_SYSMMU_DEBUG
+	bool "Enables debug messages"
+	depends on S5P_SYSMMU
+	help
+	  This enables SYSMMU driver debug massages.
+
+endif
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 2b73173..92efe1a 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -30,3 +30,4 @@ obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
 obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
+obj-$(CONFIG_S5P_SYSMMU)	+= sysmmu.o
diff --git a/arch/arm/plat-s5p/include/plat/sysmmu.h b/arch/arm/plat-s5p/include/plat/sysmmu.h
new file mode 100644
index 0000000..f6d8625
--- /dev/null
+++ b/arch/arm/plat-s5p/include/plat/sysmmu.h
@@ -0,0 +1,23 @@
+/* linux/arch/arm/plat-s5p/include/plat/sysmmu.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * Samsung sysmmu driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_PLAT_S5P_SYSMMU_H
+#define __ASM_PLAT_S5P_SYSMMU_H __FILE__
+
+/* debug macro */
+#ifdef CONFIG_S5P_SYSMMU_DEBUG
+#define sysmmu_debug(fmt, arg...)	printk(KERN_INFO "[%s] " fmt, __func__, ## arg)
+#else
+#define sysmmu_debug(fmt, arg...)	do { } while (0)
+#endif
+
+#endif /* __ASM_PLAT_S5P_SYSMMU_H */
diff --git a/arch/arm/plat-s5p/sysmmu.c b/arch/arm/plat-s5p/sysmmu.c
new file mode 100644
index 0000000..c22b2f2
--- /dev/null
+++ b/arch/arm/plat-s5p/sysmmu.c
@@ -0,0 +1,331 @@
+/* linux/arch/arm/plat-s5p/sysmmu.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+
+#include <mach/map.h>
+#include <mach/regs-sysmmu.h>
+#include <mach/sysmmu.h>
+
+#include <plat/sysmmu.h>
+#include <plat/map-s5p.h>
+
+struct sysmmu_controller s5p_sysmmu_cntlrs[S5P_SYSMMU_TOTAL_IPNUM];
+
+void s5p_sysmmu_register(struct sysmmu_controller *sysmmuconp)
+{
+	unsigned int reg_mmu_ctrl;
+	unsigned int reg_mmu_status;
+	unsigned int reg_pt_base_addr;
+	unsigned int reg_int_status;
+	unsigned int reg_page_ft_addr;
+
+	reg_int_status = __raw_readl(sysmmuconp->regs + S5P_INT_STATUS);
+	reg_mmu_ctrl = __raw_readl(sysmmuconp->regs + S5P_MMU_CTRL);
+	reg_mmu_status = __raw_readl(sysmmuconp->regs + S5P_MMU_STATUS);
+	reg_pt_base_addr = __raw_readl(sysmmuconp->regs + S5P_PT_BASE_ADDR);
+	reg_page_ft_addr = __raw_readl(sysmmuconp->regs + S5P_PAGE_FAULT_ADDR);
+
+	printk(KERN_INFO "%s: ips:%s\n", __func__, sysmmuconp->name);
+	printk(KERN_INFO "%s: MMU_CTRL:0x%X, ", __func__, reg_mmu_ctrl);
+	printk(KERN_INFO "MMU_STATUS:0x%X, PT_BASE_ADDR:0x%X\n", reg_mmu_status, reg_pt_base_addr);
+	printk(KERN_INFO "%s: INT_STATUS:0x%X, PAGE_FAULT_ADDR:0x%X\n", __func__, reg_int_status, reg_page_ft_addr);
+
+	switch (reg_int_status & 0xFF) {
+	case 0x1:
+		printk(KERN_INFO "%s: Page fault\n", __func__);
+		printk(KERN_INFO "%s: Virtual address causing last page fault or bus error : 0x%x\n", __func__ , reg_page_ft_addr);
+		break;
+	case 0x2:
+		printk(KERN_INFO "%s: AR multi-hit fault\n", __func__);
+		break;
+	case 0x4:
+		printk(KERN_INFO "%s: AW multi-hit fault\n", __func__);
+		break;
+	case 0x8:
+		printk(KERN_INFO "%s: Bus error\n", __func__);
+		break;
+	case 0x10:
+		printk(KERN_INFO "%s: AR Security protection fault\n", __func__);
+		break;
+	case 0x20:
+		printk(KERN_INFO "%s: AR Access protection fault\n", __func__);
+		break;
+	case 0x40:
+		printk(KERN_INFO "%s: AW Security protection fault\n", __func__);
+		break;
+	case 0x80:
+		printk(KERN_INFO "%s: AW Access protection fault\n", __func__);
+		break;
+	}
+}
+
+static irqreturn_t s5p_sysmmu_irq(int irq, void *dev_id)
+{
+	unsigned int i;
+	unsigned int reg_int_status;
+	struct sysmmu_controller *sysmmuconp;
+
+	for (i = 0; i < S5P_SYSMMU_TOTAL_IPNUM; i++) {
+		sysmmuconp = &s5p_sysmmu_cntlrs[i];
+
+		if (sysmmuconp->enable == true) {
+			reg_int_status = __raw_readl(sysmmuconp->regs + S5P_INT_STATUS);
+
+			if (reg_int_status & 0xFF)
+				s5p_sysmmu_register(sysmmuconp);
+		}
+	}
+	return IRQ_HANDLED;
+}
+
+int s5p_sysmmu_set_tablebase_pgd(sysmmu_ips ips, unsigned long pgd)
+{
+	struct sysmmu_controller *sysmmuconp = NULL;
+
+	sysmmuconp = &s5p_sysmmu_cntlrs[ips];
+
+	if (sysmmuconp == NULL) {
+		printk(KERN_ERR "failed to get ip's sysmmu info\n");
+		return 1;
+	}
+
+	/* Set sysmmu page table base address */
+	__raw_writel(pgd, sysmmuconp->regs + S5P_PT_BASE_ADDR);
+
+	if (s5p_sysmmu_tlb_invalidate(ips) != 0)
+		printk(KERN_ERR "failed s5p_sysmmu_tlb_invalidate\n");
+
+	return 0;
+}
+
+static int s5p_sysmmu_set_tablebase(sysmmu_ips ips)
+{
+	unsigned int pg;
+	struct sysmmu_controller *sysmmuconp;
+
+	sysmmuconp = &s5p_sysmmu_cntlrs[ips];
+
+	if (sysmmuconp == NULL) {
+		printk(KERN_ERR "failed to get ip's sysmmu info\n");
+		return 1;
+	}
+
+	__asm__("mrc	p15, 0, %0, c2, c0, 0"	\
+		: "=r" (pg) : : "cc");		\
+		pg &= ~0x3fff;
+
+	sysmmu_debug("CP15 TTBR0 : 0x%x\n", pg);
+
+	/* Set sysmmu page table base address */
+	__raw_writel(pg, sysmmuconp->regs + S5P_PT_BASE_ADDR);
+
+	return 0;
+}
+
+int s5p_sysmmu_enable(sysmmu_ips ips)
+{
+	unsigned int reg;
+
+	struct sysmmu_controller *sysmmuconp;
+
+	sysmmuconp = &s5p_sysmmu_cntlrs[ips];
+
+	if (sysmmuconp == NULL) {
+		printk(KERN_ERR "failed to get ip's sysmmu info\n");
+		return 1;
+	}
+
+	s5p_sysmmu_set_tablebase(ips);
+
+	/* replacement policy : LRU */
+	reg = __raw_readl(sysmmuconp->regs + S5P_MMU_CFG);
+	reg |= 0x1;
+	__raw_writel(reg, sysmmuconp->regs + S5P_MMU_CFG);
+
+	/* Enable interrupt, Enable MMU */
+	reg = __raw_readl(sysmmuconp->regs + S5P_MMU_CTRL);
+	reg |= (0x1 << 2) | (0x1 << 0);
+
+	__raw_writel(reg, sysmmuconp->regs + S5P_MMU_CTRL);
+
+	sysmmuconp->enable = true;
+
+	return 0;
+}
+
+int s5p_sysmmu_disable(sysmmu_ips ips)
+{
+	unsigned int reg;
+
+	struct sysmmu_controller *sysmmuconp = NULL;
+
+	if (ips > S5P_SYSMMU_TOTAL_IPNUM)
+		printk(KERN_ERR "failed to get ips parameter\n");
+
+	sysmmuconp = &s5p_sysmmu_cntlrs[ips];
+
+	if (sysmmuconp == NULL) {
+		printk(KERN_ERR "failed to get ip's sysmmu info\n");
+		return 1;
+	}
+
+	reg = __raw_readl(sysmmuconp->regs + S5P_MMU_CFG);
+
+	/* replacement policy : LRU */
+	reg |= 0x1;
+	__raw_writel(reg, sysmmuconp->regs + S5P_MMU_CFG);
+
+	reg = __raw_readl(sysmmuconp->regs + S5P_MMU_CTRL);
+
+	/* Disable MMU */
+	reg &= ~0x1;
+	__raw_writel(reg, sysmmuconp->regs + S5P_MMU_CTRL);
+
+	sysmmuconp->enable = false;
+
+	return 0;
+}
+
+int s5p_sysmmu_tlb_invalidate(sysmmu_ips ips)
+{
+	unsigned int reg;
+	struct sysmmu_controller *sysmmuconp = NULL;
+
+	sysmmuconp = &s5p_sysmmu_cntlrs[ips];
+
+	if (sysmmuconp == NULL) {
+		printk(KERN_ERR "failed to get ip's sysmmu info\n");
+		return 1;
+	}
+
+	/* set Block MMU for flush TLB */
+	reg = __raw_readl(sysmmuconp->regs + S5P_MMU_CTRL);
+	reg |= 0x1<<1;
+	__raw_writel(reg, sysmmuconp->regs + S5P_MMU_CTRL);
+
+	/* flush all TLB entry */
+	__raw_writel(0x1, sysmmuconp->regs + S5P_MMU_FLUSH);
+
+	/* set Un-block MMU after flush TLB */
+	reg = __raw_readl(sysmmuconp->regs + S5P_MMU_CTRL);
+	reg &= ~(0x1<<1);
+	__raw_writel(reg, sysmmuconp->regs + S5P_MMU_CTRL);
+
+	return 0;
+}
+
+static int s5p_sysmmu_probe(struct platform_device *pdev)
+{
+	int i;
+	int ret;
+	struct resource *res;
+	struct sysmmu_controller *sysmmuconp;
+	sysmmu_ips ips;
+
+	for (i = 0; i < S5P_SYSMMU_TOTAL_IPNUM; i++) {
+		sysmmuconp = &s5p_sysmmu_cntlrs[i];
+		if (sysmmuconp == NULL) {
+			printk(KERN_ERR "failed to get ip's sysmmu info\n");
+			ret = -ENOENT;
+			goto err_res;
+		}
+
+		sysmmuconp->name = sysmmu_ips_name[i];
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+
+		if (!res) {
+			printk(KERN_ERR "failed to get sysmmu resource\n");
+			ret = -ENODEV;
+			goto err_res;
+		}
+
+		sysmmuconp->mem = request_mem_region(res->start,
+				((res->end) - (res->start)) + 1, pdev->name);
+		if (!sysmmuconp->mem) {
+			pr_err("failed to request sysmmu memory region\n");
+			ret = -EBUSY;
+			goto err_res;
+		}
+
+		sysmmuconp->regs = ioremap(res->start, res->end - res->start + 1);
+		if (!sysmmuconp->regs) {
+			pr_err("failed to sysmmu ioremap\n");
+			ret = -ENXIO;
+			goto err_reg;
+		}
+
+		sysmmuconp->irq = platform_get_irq(pdev, i);
+		if (sysmmuconp->irq <= 0) {
+			pr_err("failed to get sysmmu irq resource\n");
+			ret = -ENOENT;
+			goto err_map;
+		}
+
+		ret = request_irq(sysmmuconp->irq, s5p_sysmmu_irq, IRQF_DISABLED, pdev->name, sysmmuconp);
+		if (ret) {
+			pr_err("failed to request irq\n");
+			ret = -ENOENT;
+			goto err_map;
+		}
+
+		ips = (sysmmu_ips)i;
+
+		sysmmuconp->ips = ips;
+	}
+
+	return 0;
+
+err_reg:
+	release_mem_region((resource_size_t)sysmmuconp->mem, (resource_size_t)((res->end) - (res->start) + 1));
+err_map:
+	iounmap(sysmmuconp->regs);
+err_res:
+	return ret;
+}
+
+static int s5p_sysmmu_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+int s5p_sysmmu_runtime_suspend(struct device *dev)
+{
+	return 0;
+}
+
+int s5p_sysmmu_runtime_resume(struct device *dev)
+{
+	return 0;
+}
+
+const struct dev_pm_ops s5p_sysmmu_pm_ops = {
+	.runtime_suspend	= s5p_sysmmu_runtime_suspend,
+	.runtime_resume		= s5p_sysmmu_runtime_resume,
+};
+
+/* pdev */
+static struct platform_driver s5p_sysmmu_driver = {
+	.probe		= s5p_sysmmu_probe,
+	.remove		= s5p_sysmmu_remove,
+	.driver		= {
+		.owner		= THIS_MODULE,
+		.name		= "s5p-sysmmu",
+		.pm		= &s5p_sysmmu_pm_ops,
+	}
+};
+
+static int __init s5p_sysmmu_init(void)
+{
+	return platform_driver_register(&s5p_sysmmu_driver);
+}
+arch_initcall(s5p_sysmmu_init);
-- 
1.6.3.3
