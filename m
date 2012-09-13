From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/5] ARM: Add interface for registering and calling
 firmware-specific operations
Date: Thu, 13 Sep 2012 10:13:35 +0200
Message-ID: <1347524018-19301-3-git-send-email-t.figa@samsung.com>
References: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12903 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416Ab2IMIOQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Sep 2012 04:14:16 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAA00L2C46GO2V0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 17:14:09 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAA00F0A477MEF1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 17:14:08 +0900 (KST)
In-reply-to: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, t.figa@samsung.com

Some boards are running with secure firmware running in TrustZone secur=
e
world, which changes the way some things have to be initialized.

This patch adds an interface for platforms to specify available firmwar=
e
operations and call them.

A wrapper macro, call_firmware_op(), checks if the operation is provide=
d
and calls it if so, otherwise returns 0.

By default no operations are provided.

This is a follow-up on the patch by Kyungmin Park:
[PATCH v5 1/2] ARM: Make a compile firmware conditionally
http://thread.gmane.org/gmane.linux.ports.arm.kernel/183607/focus=3D183=
988

Example of use:

In code using firmware ops:

	__raw_writel(virt_to_phys(exynos4_secondary_startup),
		CPU1_BOOT_REG);

	/* Call Exynos specific smc call */
	do_firmware_op(cpu_boot, cpu);

	gic_raise_softirq(cpumask_of(cpu), 1);

In board-/platform-specific code:

	static int platformX_do_idle(void)
	{
		/* tell platformX firmware to enter idle */
	        return 0;
	}

	static void platformX_cpu_boot(int i)
	{
		/* tell platformX firmware to boot CPU i */
	}

	static const struct firmware_ops platformX_firmware_ops __initdata =3D=
 {
		.do_idle	=3D exynos_do_idle,
		.cpu_boot	=3D exynos_cpu_boot,
		/* cpu_boot_reg not available on platformX */
	};

	static void __init board_init_early(void)
	{
	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0register_firmware_ops(=
&platformX_firmware_ops);
	}

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/common/Makefile        |  2 ++
 arch/arm/common/firmware.c      | 18 ++++++++++++++++++
 arch/arm/include/asm/firmware.h | 30 ++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 arch/arm/common/firmware.c
 create mode 100644 arch/arm/include/asm/firmware.h

diff --git a/arch/arm/common/Makefile b/arch/arm/common/Makefile
index e8a4e58..55d4182 100644
--- a/arch/arm/common/Makefile
+++ b/arch/arm/common/Makefile
@@ -2,6 +2,8 @@
 # Makefile for the linux kernel.
 #
=20
+obj-y +=3D firmware.o
+
 obj-$(CONFIG_ARM_GIC)		+=3D gic.o
 obj-$(CONFIG_ARM_VIC)		+=3D vic.o
 obj-$(CONFIG_ICST)		+=3D icst.o
diff --git a/arch/arm/common/firmware.c b/arch/arm/common/firmware.c
new file mode 100644
index 0000000..27ddccb
--- /dev/null
+++ b/arch/arm/common/firmware.c
@@ -0,0 +1,18 @@
+/*
+ * Copyright (C) 2012 Samsung Electronics.
+ * Kyungmin Park <kyungmin.park@samsung.com>
+ * Tomasz Figa <t.figa@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/suspend.h>
+
+#include <asm/firmware.h>
+
+static const struct firmware_ops default_firmware_ops;
+
+const struct firmware_ops *firmware_ops =3D &default_firmware_ops;
diff --git a/arch/arm/include/asm/firmware.h b/arch/arm/include/asm/fir=
mware.h
new file mode 100644
index 0000000..ed51b02
--- /dev/null
+++ b/arch/arm/include/asm/firmware.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright (C) 2012 Samsung Electronics.
+ * Kyungmin Park <kyungmin.park@samsung.com>
+ * Tomasz Figa <t.figa@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __ASM_ARM_FIRMWARE_H
+#define __ASM_ARM_FIRMWARE_H
+
+struct firmware_ops {
+	int (*do_idle)(void);
+	void (*cpu_boot)(int cpu);
+	void __iomem *(*cpu_boot_reg)(int cpu);
+};
+
+extern const struct firmware_ops *firmware_ops;
+
+#define call_firmware_op(op, ...)					\
+	((firmware_ops->op) ? firmware_ops->op(__VA_ARGS__) : 0)
+
+static inline void register_firmware_ops(const struct firmware_ops *op=
s)
+{
+	firmware_ops =3D ops;
+}
+
+#endif
--=20
1.7.12
