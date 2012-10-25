From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v3 1/6] ARM: Add interface for registering and calling
 firmware-specific operations
Date: Thu, 25 Oct 2012 17:22:35 +0200
Message-ID: <1351178560-19188-2-git-send-email-t.figa@samsung.com>
References: <1351178560-19188-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44562 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821Ab2JYPW4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Oct 2012 11:22:56 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCG00L3YG23WU40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 00:22:55 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCG008XQG1VUL00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Oct 2012 00:22:54 +0900 (KST)
In-reply-to: <1351178560-19188-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

Some boards are running with secure firmware running in TrustZone secur=
e
world, which changes the way some things have to be initialized.

This patch adds an interface for platforms to specify available firmwar=
e
operations and call them.

A wrapper macro, call_firmware_op(), checks if the operation is provide=
d
and calls it if so, otherwise returns -ENOSYS to allow fallback to
legacy operation..

By default no operations are provided.

Example of use:

In code using firmware ops:

	__raw_writel(virt_to_phys(exynos4_secondary_startup),
		CPU1_BOOT_REG);

	/* Call Exynos specific smc call */
	if (call_firmware_op(cpu_boot, cpu) =3D=3D -ENOSYS)
		cpu_boot_legacy(...); /* Try legacy way */

	gic_raise_softirq(cpumask_of(cpu), 1);

In board-/platform-specific code:

	static int platformX_do_idle(void)
	{
		/* tell platformX firmware to enter idle */
	        return 0;
	}

	static int platformX_cpu_boot(int i)
	{
		/* tell platformX firmware to boot CPU i */
		return 0;
	}

	static const struct firmware_ops platformX_firmware_ops =3D {
		.do_idle	=3D exynos_do_idle,
		.cpu_boot	=3D exynos_cpu_boot,
		/* other operations not available on platformX */
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
 arch/arm/include/asm/firmware.h | 31 +++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
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
index 0000000..5d87d8e
--- /dev/null
+++ b/arch/arm/include/asm/firmware.h
@@ -0,0 +1,31 @@
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
+	int (*cpu_boot)(int cpu);
+	int (*cpu_boot_reg)(int cpu, void __iomem **ptr);
+	int (*l2x0_init)(void);
+};
+
+extern const struct firmware_ops *firmware_ops;
+
+#define call_firmware_op(op, ...)					\
+	((firmware_ops->op) ? firmware_ops->op(__VA_ARGS__) : (-ENOSYS))
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
