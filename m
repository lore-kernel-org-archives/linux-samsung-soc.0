From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v4 1/5] include: dt-bindings: add Performance Monitoring
 Unit for Exynos
Date: Wed,  5 Jun 2019 11:12:32 +0200
Message-ID: <20190605091236.24263-2-l.luba@partner.samsung.com>
References: <20190605091236.24263-1-l.luba@partner.samsung.com>
 <CGME20190605091301eucas1p2f360a867c8df8ba542942d425289f355@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190605091236.24263-1-l.luba@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, willy.mh.wolff.ml@gmail.com, kgene@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, l.luba@partner.samsung.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch add support of a new feature which can be used in DT:
Performance Monitoring Unit with defined event data type.
In this patch the event data types are defined for Exynos PPMU.
The patch also updates the MAINTAINERS file accordingly and
adds the header file to devfreq event subsystem.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 MAINTAINERS                           |  1 +
 include/dt-bindings/pmu/exynos_ppmu.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 include/dt-bindings/pmu/exynos_ppmu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a6954776a37e..4c1bab87ff4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4653,6 +4653,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git
 S:	Supported
 F:	drivers/devfreq/event/
 F:	drivers/devfreq/devfreq-event.c
+F:	include/dt-bindings/pmu/exynos_ppmu.h
 F:	include/linux/devfreq-event.h
 F:	Documentation/devicetree/bindings/devfreq/event/
 
diff --git a/include/dt-bindings/pmu/exynos_ppmu.h b/include/dt-bindings/pmu/exynos_ppmu.h
new file mode 100644
index 000000000000..8724abe130f3
--- /dev/null
+++ b/include/dt-bindings/pmu/exynos_ppmu.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Samsung Exynos PPMU event types for counting in regs
+ *
+ * Copyright (c) 2019, Samsung Electronics
+ * Author: Lukasz Luba <l.luba@partner.samsung.com>
+ */
+
+#ifndef __DT_BINDINGS_PMU_EXYNOS_PPMU_H
+#define __DT_BINDINGS_PMU_EXYNOS_PPMU_H
+
+#define PPMU_RO_BUSY_CYCLE_CNT		0x0
+#define PPMU_WO_BUSY_CYCLE_CNT		0x1
+#define PPMU_RW_BUSY_CYCLE_CNT		0x2
+#define PPMU_RO_REQUEST_CNT		0x3
+#define PPMU_WO_REQUEST_CNT		0x4
+#define PPMU_RO_DATA_CNT		0x5
+#define PPMU_WO_DATA_CNT		0x6
+#define PPMU_RO_LATENCY			0x12
+#define PPMU_WO_LATENCY			0x16
+#define PPMU_V2_RO_DATA_CNT		0x4
+#define PPMU_V2_WO_DATA_CNT		0x5
+#define PPMU_V2_EVT3_RW_DATA_CNT	0x22
+
+#endif
-- 
2.17.1
