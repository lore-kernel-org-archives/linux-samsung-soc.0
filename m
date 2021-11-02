Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4BAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 23:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0B9A60EFF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 23:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhKAXry (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 19:47:54 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:53391 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbhKAXrx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 19:47:53 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211101234515epoutp02848314f9e6089690819d4c69867066f0~zkNCpsYFp1653416534epoutp023
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Nov 2021 23:45:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211101234515epoutp02848314f9e6089690819d4c69867066f0~zkNCpsYFp1653416534epoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635810315;
        bh=Q9acwNyIHBjNMe2d4k5M7/r1xqjrFd7u2s29i8saCJc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=laEmKifBi0/UXLxHBI60pMPJmkVzAtrFp+1TU6GsmbKQV5EfPYAIfmOx6EYGpkVfv
         p3+dMowpdSXhQW1SaWktyy3nRottvniCgRy7R7kaHnKcH0/SKxg4KQSAzLRDA6WEmH
         EAosQhlgWQqx2ktOKpijqAHZaB4EIBKdrKD3koFE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211101234514epcas2p4965b1b9e5b0c763f6c0d7ebea6543d71~zkNB7fjsR2721627216epcas2p4W;
        Mon,  1 Nov 2021 23:45:14 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.89]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4HjqQW6f2cz4x9QX; Mon,  1 Nov
        2021 23:45:07 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        5D.41.12141.DFB70816; Tue,  2 Nov 2021 08:45:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5~zkM03fJBs2872328723epcas2p2V;
        Mon,  1 Nov 2021 23:45:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211101234500epsmtrp12460ad65be6c902a825e07e2093c7538~zkM02o3FL0970709707epsmtrp1M;
        Mon,  1 Nov 2021 23:45:00 +0000 (GMT)
X-AuditID: b6c32a48-d5dff70000002f6d-01-61807bfde343
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        47.9C.08738.CFB70816; Tue,  2 Nov 2021 08:45:00 +0900 (KST)
Received: from localhost.localdomain (unknown [12.36.155.123]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211101234500epsmtip112463df092ee7035766d003a96d269a9~zkM0oJS6v2203822038epsmtip13;
        Mon,  1 Nov 2021 23:45:00 +0000 (GMT)
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     krzysztof.kozlowski@canonical.com, will@kernel.org,
        mark.rutland@arm.com, daniel.lezcano@linaro.org
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org,
        Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v2 1/2] clocksource/drivers/exynos_mct_v2: introduce Exynos
 MCT version 2 driver for next Exynos SoC
Date:   Tue,  2 Nov 2021 09:11:21 +0900
Message-Id: <20211102001122.27516-2-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102001122.27516-1-youngmin.nam@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmhe7f6oZEgx+XLSzmfZa1aNp/idni
        +NrXrBb9j18zW2x8+4PJYtPja6wWl3fNYbOYcX4fk8XS6xeZLBY/XsFk8a/3IKPF5k1TmS1a
        7phaLD7wid2Bz2PNvDWMHrMaetk8Nq3qZPO4c20Pm8e7c+fYPTYvqffo27KK0ePzJrkAjqhs
        m4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygq5UUyhJz
        SoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RmX
        3kUWHMmqOPm+ha2B8V9kFyMnh4SAicTrh78Yuxi5OIQEdjBK/H27jxnC+cQocX3lBxYI5zOj
        xNKDx5hgWjb8mcAKYgsJ7GKUOLbeE6Ho5TNGkASbgK7EthP/wGwRgUyJD18+sYIUMQssYJK4
        cPgpO0hCWKBM4tja98wgNouAqsTpJd/BpvIK2Epc39DJArFNXuLIr06wGk4BO4lbf5tYIGoE
        JU7OfAJmMwPVNG+dDXa3hMBKDolDb7ZDneoicWHGZmYIW1ji1fEt7BC2lMTL/jYou15i8bal
        UM0TGCXmb/oAlTCWmPWsHegFDqANmhLrd+mDmBICyhJHbkHt5ZPoOPyXHSLMK9HRJgTRqCbx
        a8oGRghbRmL34hVQF3hI9C5bwAYJrImMElsaFrBNYFSYheSdWUjemYWweAEj8ypGsdSC4tz0
        1GKjAhN4DCfn525iBKdiLY8djLPfftA7xMjEwXiIUYKDWUmEN+JCTaIQb0piZVVqUX58UWlO
        avEhRlNgYE9klhJNzgdmg7ySeEMTSwMTMzNDcyNTA3MlcV5L0exEIYH0xJLU7NTUgtQimD4m
        Dk6pBqZTyVdds0+7P7F2b7MpuPb0RbpL0lPlTPaO87tVFvubfTC7EPNhn/5M6Yj3iaoNzlp8
        2uu1+Nhb3dZ7CPv/UlCWEV+0sUw4Rzl97pPZqvfz3vWv3Xqp5ajDzUVNydUrryd9Ddu3KZVV
        vsBbgTP/xcT9rwyFtuRbHf/pX8l+4KOv/YFFlpneh6+zZPxb46ezXv6Gt0pr1Z9eV+EfTfNy
        ZqzrD46d93TnWcUJjNtbDK6xpzpuOzWJ59L6cpHN2T9L1jFfTNtRyyImct6ct2ObQHZ8yYzH
        ty+XHSgqfqlSbLozNNjk2byTm8Ivrnh04L3r43BdnhMRchnP/61efXha4mEmiZ1Cr8/v+hMq
        eMnH6rASS3FGoqEWc1FxIgD+v5zjTgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSnO6f6oZEg5l3lS3mfZa1aNp/idni
        +NrXrBb9j18zW2x8+4PJYtPja6wWl3fNYbOYcX4fk8XS6xeZLBY/XsFk8a/3IKPF5k1TmS1a
        7phaLD7wid2Bz2PNvDWMHrMaetk8Nq3qZPO4c20Pm8e7c+fYPTYvqffo27KK0ePzJrkAjigu
        m5TUnMyy1CJ9uwSujEvvIguOZFWcfN/C1sD4L7KLkZNDQsBEYsOfCaxdjFwcQgI7GCUm3zrM
        DJGQkbi98jIrhC0scb/lCFTRR0aJ/ld/2UASbAK6EttO/GMEsUUEciU6DsxhBCliFljFJPGk
        4xQLSEJYoESi+cxnsCIWAVWJ00u+g03lFbCVuL6hkwVig7zEkV+dYJs5Bewkbv1tAosLAdU8
        aL/ACFEvKHFy5hOwODNQffPW2cwTGAVmIUnNQpJawMi0ilEytaA4Nz232LDAKC+1XK84Mbe4
        NC9dLzk/dxMjOGq0tHYw7ln1Qe8QIxMH4yFGCQ5mJRHeiAs1iUK8KYmVValF+fFFpTmpxYcY
        pTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwtSz8Fbc+7+UeE9tUm7Aaw6n//exeHzGd
        Fhv5K9JX5me0VLSRjcOuCXskD/JzKk6TPCZ0ceaPb60NlW33DKPW67w6tuzMqqt74nijRFbv
        yXjoOCNeVjT17KLexUHigjlOB/eyBbXu1eb/miXpe1liql5uytq6Ra9P265s5pmwfdYFju3t
        M55f4Pz47czRCJG+ky8/elk1NWzbFPPsRJCCyQHXchEb2dMV7ULzJk36n2Lwe0Hm3rVHs8/3
        2ahfOemz4H+sjGKQPatTadi+wrbKF/nOzj1iTgWsO//FHI2Y9rqT4YeVhI3IyqMuW/7ZmNf+
        bctUu+x2ql+EQdr8c8ibppKQuO2tyzlfLdmcsZNJiaU4I9FQi7moOBEAM1j+oQkDAAA=
X-CMS-MailID: 20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5
References: <20211102001122.27516-1-youngmin.nam@samsung.com>
        <CGME20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
There are no global timer and local timer anymore.
The 1 of 64bit FRC serves as "up-counter"(not "comparators").
The 12 comaprators(not "counter") can be used as per-cpu event timer
so that it can support upto 12 cores.
And a RTC source can be used as backup clock source.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
---
 drivers/clocksource/Kconfig         |   7 +
 drivers/clocksource/Makefile        |   1 +
 drivers/clocksource/exynos_mct_v2.c | 298 ++++++++++++++++++++++++++++
 drivers/clocksource/exynos_mct_v2.h |  71 +++++++
 4 files changed, 377 insertions(+)
 create mode 100644 drivers/clocksource/exynos_mct_v2.c
 create mode 100644 drivers/clocksource/exynos_mct_v2.h

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 0f5e3983951a..4d8f62ef1c7f 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -421,6 +421,13 @@ config CLKSRC_EXYNOS_MCT
 	help
 	  Support for Multi Core Timer controller on Exynos SoCs.
 
+config CLKSRC_EXYNOS_MCT_V2
+	bool "Exynos multi core timer (ver 2) driver" if COMPILE_TEST
+	depends on ARM64
+	depends on ARCH_EXYNOS
+	help
+	  Support for Multi Core Timer controller on Exynos SoCs.
+
 config CLKSRC_SAMSUNG_PWM
 	bool "PWM timer driver for Samsung S3C, S5P" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index c17ee32a7151..dc7d5cf27516 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
 obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
 obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
 obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
+obj-$(CONFIG_CLKSRC_EXYNOS_MCT_V2)	+= exynos_mct_v2.o
 obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
 obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
 obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)	+= samsung_pwm_timer.o
diff --git a/drivers/clocksource/exynos_mct_v2.c b/drivers/clocksource/exynos_mct_v2.c
new file mode 100644
index 000000000000..a61fcdf9e6c9
--- /dev/null
+++ b/drivers/clocksource/exynos_mct_v2.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * Exynos MCT(Multi-Core Timer) version 2 support
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/cpu.h>
+#include <linux/delay.h>
+#include <linux/percpu.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/clocksource.h>
+#include "exynos_mct_v2.h"
+
+static void __iomem *reg_base;
+static unsigned long osc_clk_rate;
+static int mct_irqs[MCT_NR_COMPS];
+
+static void exynos_mct_set_compensation(unsigned long osc, unsigned long rtc)
+{
+	unsigned int osc_rtc;
+	unsigned int incr_rtcclk;
+	unsigned int compen_val;
+
+	osc_rtc = (unsigned int)(osc * 1000 / rtc);
+
+	/* MCT_INCR_RTCCLK is integer part of (OSCCLK frequency/RTCCLK frequency). */
+	incr_rtcclk = (osc / rtc) + ((osc % rtc) ? 1 : 0);
+
+	/* MCT_COMPENSATE_VALUE is decimal part of (OSCCLK frequency/RTCCLK frequency). */
+	compen_val = ((osc_rtc + 5) / 10) % 100;
+	if (compen_val)
+		compen_val = 100 - compen_val;
+
+	pr_info("exynos-mct-v2: osc-%lu rtc-%lu incr_rtcclk:0x%08x compen_val:0x%08x\n",
+		osc, rtc, incr_rtcclk, compen_val);
+
+	writel_relaxed(incr_rtcclk, reg_base + EXYNOS_MCT_MCT_INCR_RTCCLK);
+	writel_relaxed(compen_val, reg_base + EXYNOS_MCT_COMPENSATE_VALUE);
+}
+
+/* Clocksource handling */
+static void exynos_mct_frc_start(void)
+{
+	writel_relaxed(MCT_FRC_ENABLE, reg_base + EXYNOS_MCT_MCT_FRC_ENABLE);
+}
+
+static void exynos_mct_comp_stop(struct mct_clock_event_device *mevt)
+{
+	unsigned int index = mevt->comp_index;
+	unsigned int comp_enable;
+	unsigned int loop_cnt = 0;
+
+	writel_relaxed(MCT_COMP_DISABLE, reg_base + EXYNOS_MCT_COMP_ENABLE(index));
+
+	/* Wait maximum 1 ms until COMP_ENABLE_n = 0 */
+	do {
+		comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
+		loop_cnt++;
+	} while (comp_enable != MCT_COMP_DISABLE && loop_cnt < WAIT_LOOP_CNT);
+
+	if (loop_cnt == WAIT_LOOP_CNT)
+		panic("MCT(comp%d) disable timeout\n", index);
+
+	writel_relaxed(MCT_COMP_NON_CIRCULAR_MODE, reg_base + EXYNOS_MCT_COMP_MODE(index));
+	writel_relaxed(MCT_INT_DISABLE, reg_base + EXYNOS_MCT_INT_ENB(index));
+	writel_relaxed(MCT_CSTAT_CLEAR, reg_base + EXYNOS_MCT_INT_CSTAT(index));
+}
+
+static void exynos_mct_comp_start(struct mct_clock_event_device *mevt,
+				  bool periodic, unsigned long cycles)
+{
+	unsigned int index = mevt->comp_index;
+	unsigned int comp_enable;
+	unsigned int loop_cnt = 0;
+
+	comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
+	if (comp_enable == MCT_COMP_ENABLE)
+		exynos_mct_comp_stop(mevt);
+
+	if (periodic)
+		writel_relaxed(MCT_COMP_CIRCULAR_MODE, reg_base + EXYNOS_MCT_COMP_MODE(index));
+
+	writel_relaxed(cycles, reg_base + EXYNOS_MCT_COMP_PERIOD(index));
+	writel_relaxed(MCT_INT_ENABLE, reg_base + EXYNOS_MCT_INT_ENB(index));
+	writel_relaxed(MCT_COMP_ENABLE, reg_base + EXYNOS_MCT_COMP_ENABLE(index));
+
+	/* Wait maximum 1 ms until COMP_ENABLE_n = 1 */
+	do {
+		comp_enable = readl_relaxed(reg_base + EXYNOS_MCT_COMP_ENABLE(index));
+		loop_cnt++;
+	} while (comp_enable != MCT_COMP_ENABLE && loop_cnt < WAIT_LOOP_CNT);
+
+	if (loop_cnt == WAIT_LOOP_CNT)
+		panic("MCT(comp%d) enable timeout\n", index);
+}
+
+static int exynos_comp_set_next_event(unsigned long cycles, struct clock_event_device *evt)
+{
+	struct mct_clock_event_device *mevt;
+
+	mevt = container_of(evt, struct mct_clock_event_device, evt);
+
+	exynos_mct_comp_start(mevt, false, cycles);
+
+	return 0;
+}
+
+static int mct_set_state_shutdown(struct clock_event_device *evt)
+{
+	struct mct_clock_event_device *mevt;
+
+	mevt = container_of(evt, struct mct_clock_event_device, evt);
+
+	exynos_mct_comp_stop(mevt);
+
+	return 0;
+}
+
+static int mct_set_state_periodic(struct clock_event_device *evt)
+{
+	unsigned long cycles_per_jiffy;
+	struct mct_clock_event_device *mevt;
+
+	mevt = container_of(evt, struct mct_clock_event_device, evt);
+
+	cycles_per_jiffy = (((unsigned long long)NSEC_PER_SEC / HZ * evt->mult) >> evt->shift);
+	exynos_mct_comp_start(mevt, true, cycles_per_jiffy);
+
+	return 0;
+}
+
+static irqreturn_t exynos_mct_comp_isr(int irq, void *dev_id)
+{
+	struct mct_clock_event_device *mevt = dev_id;
+	struct clock_event_device *evt = &mevt->evt;
+	unsigned int index = mevt->comp_index;
+
+	writel_relaxed(MCT_CSTAT_CLEAR, reg_base + EXYNOS_MCT_INT_CSTAT(index));
+
+	evt->event_handler(evt);
+
+	return IRQ_HANDLED;
+}
+
+static DEFINE_PER_CPU(struct mct_clock_event_device, percpu_mct_tick);
+
+static int exynos_mct_starting_cpu(unsigned int cpu)
+{
+	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
+	struct clock_event_device *evt = &mevt->evt;
+
+	snprintf(mevt->name, sizeof(mevt->name), "mct_comp%d", cpu);
+
+	evt->name = mevt->name;
+	evt->cpumask = cpumask_of(cpu);
+	evt->set_next_event = exynos_comp_set_next_event;
+	evt->set_state_periodic = mct_set_state_periodic;
+	evt->set_state_shutdown = mct_set_state_shutdown;
+	evt->set_state_oneshot = mct_set_state_shutdown;
+	evt->set_state_oneshot_stopped = mct_set_state_shutdown;
+	evt->tick_resume = mct_set_state_shutdown;
+	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
+	evt->rating = 500;	/* use value higher than ARM arch timer */
+
+	if (evt->irq == -1)
+		return -EIO;
+
+	irq_force_affinity(evt->irq, cpumask_of(cpu));
+	enable_irq(evt->irq);
+	clockevents_config_and_register(evt, osc_clk_rate, 0xf, 0x7fffffff);
+
+	return 0;
+}
+
+static int exynos_mct_dying_cpu(unsigned int cpu)
+{
+	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
+	struct clock_event_device *evt = &mevt->evt;
+	unsigned int index = mevt->comp_index;
+
+	evt->set_state_shutdown(evt);
+	if (evt->irq != -1)
+		disable_irq_nosync(evt->irq);
+
+	writel_relaxed(MCT_CSTAT_CLEAR, reg_base + EXYNOS_MCT_INT_CSTAT(index));
+
+	return 0;
+}
+
+static int __init exynos_timer_resources(struct device_node *np, void __iomem *base)
+{
+	int err, cpu;
+
+	struct clk *mct_clk, *tick_clk,  *rtc_clk;
+	unsigned long rtc_clk_rate;
+	int div;
+	int ret;
+
+	ret = of_property_read_u32(np, "div", &div);
+	if (ret || !div) {
+		pr_warn("MCT: fail to get the div value. set div to the default\n");
+		div = DEFAULT_CLK_DIV;
+	}
+
+	tick_clk = of_clk_get_by_name(np, "fin_pll");
+	if (IS_ERR(tick_clk))
+		panic("%s: unable to determine tick clock rate\n", __func__);
+	osc_clk_rate = clk_get_rate(tick_clk) / div;
+
+	mct_clk = of_clk_get_by_name(np, "mct");
+	if (IS_ERR(mct_clk))
+		panic("%s: unable to retrieve mct clock instance\n", __func__);
+	clk_prepare_enable(mct_clk);
+
+	rtc_clk = of_clk_get_by_name(np, "rtc");
+	if (IS_ERR(rtc_clk)) {
+		pr_warn("MCT: fail to get rtc clock. set to the default\n");
+		rtc_clk_rate = DEFAULT_RTC_CLK_RATE;
+	} else {
+		rtc_clk_rate = clk_get_rate(rtc_clk);
+	}
+
+	reg_base = base;
+	if (!reg_base)
+		panic("%s: unable to ioremap mct address space\n", __func__);
+
+	exynos_mct_set_compensation(osc_clk_rate, rtc_clk_rate);
+	exynos_mct_frc_start();
+
+	for_each_possible_cpu(cpu) {
+		int mct_irq = mct_irqs[cpu];
+		struct mct_clock_event_device *pcpu_mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
+
+		pcpu_mevt->evt.irq = -1;
+		pcpu_mevt->comp_index = cpu;
+
+		irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
+		if (request_irq(mct_irq,
+				exynos_mct_comp_isr,
+				IRQF_TIMER | IRQF_NOBALANCING | IRQF_PERCPU,
+				"exynos-mct", pcpu_mevt)) {
+			pr_err("exynos-mct: cannot register IRQ (cpu%d)\n", cpu);
+			continue;
+		}
+		pcpu_mevt->evt.irq = mct_irq;
+	}
+
+	/* Install hotplug callbacks which configure the timer on this CPU */
+	err = cpuhp_setup_state(CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
+				"clockevents/exynos/mct_timer_v2:starting",
+				exynos_mct_starting_cpu,
+				exynos_mct_dying_cpu);
+	if (err)
+		goto out_irq;
+
+	return 0;
+
+out_irq:
+	for_each_possible_cpu(cpu) {
+		struct mct_clock_event_device *pcpu_mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
+
+		if (pcpu_mevt->evt.irq != -1) {
+			free_irq(pcpu_mevt->evt.irq, pcpu_mevt);
+			pcpu_mevt->evt.irq = -1;
+		}
+	}
+	return err;
+}
+
+static int __init mct_init_dt(struct device_node *np)
+{
+	u32 nr_irqs = 0, i;
+	int ret;
+
+	/*
+	 * Find out the total number of irqs which can be produced by comparators.
+	 */
+	nr_irqs = of_irq_count(np);
+
+	for (i = MCT_COMP0; i < nr_irqs; i++)
+		mct_irqs[i] = irq_of_parse_and_map(np, i);
+
+	pr_info("exynos-mct-v2: initializing timer resources\n");
+	ret = exynos_timer_resources(np, of_iomap(np, 0));
+
+	return ret;
+}
+
+TIMER_OF_DECLARE(s5e99xx, "samsung,s5e99xx-mct", mct_init_dt);
diff --git a/drivers/clocksource/exynos_mct_v2.h b/drivers/clocksource/exynos_mct_v2.h
new file mode 100644
index 000000000000..59b3675b86a7
--- /dev/null
+++ b/drivers/clocksource/exynos_mct_v2.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * Exynos MCT(Multi-Core Timer) version 2 support
+ */
+
+#ifndef __EXYNOS_MCT_V2_H__
+#define __EXYNOS_MCT_V2_H__
+
+#define EXYNOS_MCTREG(x)		(x)
+#define EXYNOS_MCT_MCT_CFG		EXYNOS_MCTREG(0x000)
+#define EXYNOS_MCT_MCT_INCR_RTCCLK	EXYNOS_MCTREG(0x004)
+#define EXYNOS_MCT_MCT_FRC_ENABLE	EXYNOS_MCTREG(0x100)
+#define EXYNOS_MCT_CNT_L		EXYNOS_MCTREG(0x110)
+#define EXYNOS_MCT_CNT_U		EXYNOS_MCTREG(0x114)
+#define EXYNOS_MCT_CLKMUX_SEL		EXYNOS_MCTREG(0x120)
+#define EXYNOS_MCT_COMPENSATE_VALUE	EXYNOS_MCTREG(0x124)
+#define EXYNOS_MCT_VER			EXYNOS_MCTREG(0x128)
+#define EXYNOS_MCT_DIVCHG_ACK		EXYNOS_MCTREG(0x12C)
+#define EXYNOS_MCT_COMP_L(i)		EXYNOS_MCTREG(0x200 + ((i) * 0x100))
+#define EXYNOS_MCT_COMP_U(i)		EXYNOS_MCTREG(0x204 + ((i) * 0x100))
+#define EXYNOS_MCT_COMP_MODE(i)		EXYNOS_MCTREG(0x208 + ((i) * 0x100))
+#define EXYNOS_MCT_COMP_PERIOD(i)	EXYNOS_MCTREG(0x20C + ((i) * 0x100))
+#define EXYNOS_MCT_COMP_ENABLE(i)	EXYNOS_MCTREG(0x210 + ((i) * 0x100))
+#define EXYNOS_MCT_INT_ENB(i)		EXYNOS_MCTREG(0x214 + ((i) * 0x100))
+#define EXYNOS_MCT_INT_CSTAT(i)		EXYNOS_MCTREG(0x218 + ((i) * 0x100))
+
+#define MCT_FRC_ENABLE			(0x1)
+#define MCT_COMP_ENABLE			(0x1)
+#define MCT_COMP_DISABLE		(0x0)
+
+#define MCT_COMP_CIRCULAR_MODE		(0x1)
+#define MCT_COMP_NON_CIRCULAR_MODE	(0x0)
+
+#define MCT_INT_ENABLE			(0x1)
+#define MCT_INT_DISABLE			(0x0)
+
+#define MCT_CSTAT_CLEAR			(0x1)
+
+#define DEFAULT_RTC_CLK_RATE		32768
+#define DEFAULT_CLK_DIV			3
+
+#define WAIT_LOOP_CNT			(loops_per_jiffy / 1000 * HZ)
+
+enum {
+	/* There are 12 comparators which can produce interrupts */
+	MCT_COMP0,
+	MCT_COMP1,
+	MCT_COMP2,
+	MCT_COMP3,
+	MCT_COMP4,
+	MCT_COMP5,
+	MCT_COMP6,
+	MCT_COMP7,
+	MCT_COMP8,
+	MCT_COMP9,
+	MCT_COMP10,
+	MCT_COMP11,
+
+	MCT_NR_COMPS,
+};
+
+struct mct_clock_event_device {
+	struct clock_event_device evt;
+	char name[10];
+	unsigned int comp_index;
+};
+
+#endif /* __EXYNOS_MCT_V2_H__ */
-- 
2.33.0

