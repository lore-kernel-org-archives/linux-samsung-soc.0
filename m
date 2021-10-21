Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D280FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 05:51:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B27F4610FF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 05:51:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhJUFxk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 01:53:40 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:40168 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhJUFxj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 01:53:39 -0400
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211021055122epoutp02cf7de84c21e080f6142c29cf424c8bbb~v9dR-D-Ue2437124371epoutp027
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 05:51:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211021055122epoutp02cf7de84c21e080f6142c29cf424c8bbb~v9dR-D-Ue2437124371epoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634795482;
        bh=bg1aPGXJI22ihBBW9V8lDJJ5mXnbSpFIW+bCNEXe1nk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l5WKkUFqQ1ntfLh2c1wiCZ6QVe6VwpNNNZHYNUfl8S5yoosVdgm73Ks2A2wmOduCP
         ynoMC4bXSM0Z3LLnqkcqfrf2fQc9Q4mqmrXtDjajrz578DAaYV1UT2zlaGnH89AurY
         pPVWQ7+unt+k454mYeO1RLbXZ0v4L0aF7LKBeIz0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211021055122epcas2p4c9e643ef28106f0d643545fb12d632c0~v9dRWdGRW2629626296epcas2p4U;
        Thu, 21 Oct 2021 05:51:22 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.101]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HZc6Y0dnKz4x9QJ; Thu, 21 Oct
        2021 05:51:17 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        8F.E3.10014.1DFF0716; Thu, 21 Oct 2021 14:51:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407~v9dIt2XbF2748727487epcas2p2S;
        Thu, 21 Oct 2021 05:51:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211021055112epsmtrp283a5fbfae449dcdc6dec4dfb2e2ba63a~v9dIs--oj1931519315epsmtrp2J;
        Thu, 21 Oct 2021 05:51:12 +0000 (GMT)
X-AuditID: b6c32a47-489ff7000000271e-58-6170ffd122a6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CA.7B.08902.0DFF0716; Thu, 21 Oct 2021 14:51:12 +0900 (KST)
Received: from localhost.localdomain (unknown [12.36.155.123]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211021055112epsmtip28bb121a9eabdebe6065c2244a87fb697~v9dId1Dqt2936729367epsmtip2f;
        Thu, 21 Oct 2021 05:51:12 +0000 (GMT)
From:   Youngmin Nam <youngmin.nam@samsung.com>
To:     krzysztof.kozlowski@canonical.com
Cc:     daniel.lezcano@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, Youngmin Nam <youngmin.nam@samsung.com>
Subject: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce Exynos
 MCT version 2 driver for next Exynos SoC
Date:   Thu, 21 Oct 2021 15:18:03 +0900
Message-Id: <20211021061804.39118-2-youngmin.nam@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021061804.39118-1-youngmin.nam@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEJsWRmVeSWpSXmKPExsWy7bCmqe7F/wWJBk3fhSzmfZa1aNp/idni
        +NrXrBYb3/5gstj0+BqrxeVdc9gsZpzfx2Sx+PEKJot/vQcZLTZvmspssfjAJ3YHbo9ZDb1s
        Hneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pm
        YKhraGlhrqSQl5ibaqvk4hOg65aZA3SdkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUg
        JafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE74/2d/ywFvUUVnS/msTQwtiV0MXJySAiYSEw9
        MIe9i5GLQ0hgB6PE8k9PmSCcT4wSq/6uZINwvjFKrH57gLWLkQOs5eT/RIj4XkaJ89vPMUI4
        nxklFj4/yQIyl01AV2LbiX+MILaIgKrEvB2dbCA2s8BKJokX051AbGGBMomJK/oYQYayANVc
        uO8BEuYVsJWYsvAFG8R58hJHfnUyg9icAnYS9z9NZoWoEZQ4OfMJC8RIeYnmrbOZQW6QEOjl
        kLj49SwrRLOLRNvF5YwQtrDEq+Nb2CFsKYnP7/ZCLaiXWLxtKVTzBEaJ+Zs+QBUZS8x61g52
        HLOApsT6XfoQzytLHLkFtZdPouPwX3aIMK9ER5sQRKOaxK8pG6C2ykjsXryCGcL2kNi15SA0
        qCYySpy5u4h1AqPCLCTvzELyziyExQsYmVcxiqUWFOempxYbFRjDIzg5P3cTIzixarnvYJzx
        9oPeIUYmDsZDjBIczEoivLsr8hOFeFMSK6tSi/Lji0pzUosPMZoCw3ois5Rocj4wteeVxBua
        WBqYmJkZmhuZGpgrifNaimYnCgmkJ5akZqemFqQWwfQxcXBKNTC1zdY/+me5xv+3B1bNPPjG
        6+i9xd1vLbi5O/Ytuv2tdjfTxHvPfxTEChhINb/r4HSWe+fQz20UGWasckBTnyvhjeiyj1Mu
        Hz4elGxwU09K/PwOgzllsq8NWyf7r7Td+nqp1kd/5o6yTTvtpbizkrwcfCd+cGjjslOIm7+R
        13HtdJONM0s2LOw/Y7nBZMK9fIkiDsO8S5/u7fjr6Ca0Q/rS0Z+LSj8mXMyL0mO8KXZiNn9N
        iHHEjClO/ZcOu+VOMd6+7SxLrXns4Rsbr/MfvSRZuWDydu2lrbp+l9Q+bNh78c8tx6wJdu2H
        fI2nGxn9Mb9eJ2Npd1f5AveUzG6mDVue2n9pVrQ3fec0fVt1kOAXJZbijERDLeai4kQA2Vxp
        yjUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsWy7bCSvO6F/wWJBjcvaFrM+yxr0bT/ErPF
        8bWvWS02vv3BZLHp8TVWi8u75rBZzDi/j8li8eMVTBb/eg8yWmzeNJXZYvGBT+wO3B6zGnrZ
        PO5c28Pm8e7cOXaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugSvj/Z3/LAW9RRWdL+ax
        NDC2JXQxcnBICJhInPyf2MXIxSEksJtR4uvsnyxdjJxAcRmJ2ysvs0LYwhL3W46wQhR9ZJT4
        9uk5E0iCTUBXYtuJf4wgtoiAqsS8HZ1sIEXMApuZJK68ncAGkhAWKJE4e20zK8g2FqCiC/c9
        QMK8ArYSUxa+YINYIC9x5FcnM4jNKWAncf/TZLByIaCa+2+4IcoFJU7OfAJ2GzNQefPW2cwT
        GAVmIUnNQpJawMi0ilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOAK0NHcwbl/1Qe8Q
        IxMH4yFGCQ5mJRHe3RX5iUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1I
        LYLJMnFwSjUwLYt3eLHL7NIJ/eni0+IWzn5yLV+LocF1VuL7qzsTzT//+fB0WumFO8nLry+Y
        4hEu6G44zepr7dT4Q5JXQzPvbvnlelXvRiN3fo59whafM4ZL5oputj9/1W7qrM7Kw+zZyXuP
        +PNlCQQYce66f+GPsm1t1Rb2Uwr/H5oKMVjdvLCRfaJf8/IkTo45TybNzs5/9UvLnTul/R7j
        IWMVnZs/ctuDv/2ZIKL+PUGTh1Gf6cLjKOVEhkrdsz/7mHYVTt1QXxjF6cB6z0LbrXijomaM
        tMv0rn8tPMxz3zLzyvmxv894vjmfq3HhB54tZ1v1GVne/il+/8FPcIuoTdOnVRt8Qhd0s75y
        6lDd8avo81dpJZbijERDLeai4kQA27pSae8CAAA=
X-CMS-MailID: 20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
        <CGME20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
The 12 comparators can produces interrupts independently,
so they can be used as local timer of each CPU.

Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
---
 drivers/clocksource/Kconfig         |   6 +
 drivers/clocksource/Makefile        |   1 +
 drivers/clocksource/exynos_mct_v2.c | 336 ++++++++++++++++++++++++++++
 drivers/clocksource/exynos_mct_v2.h |  74 ++++++
 4 files changed, 417 insertions(+)
 create mode 100644 drivers/clocksource/exynos_mct_v2.c
 create mode 100644 drivers/clocksource/exynos_mct_v2.h

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 0f5e3983951a..8ac04dd7f713 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -421,6 +421,12 @@ config CLKSRC_EXYNOS_MCT
 	help
 	  Support for Multi Core Timer controller on Exynos SoCs.
 
+config CLKSRC_EXYNOS_MCT_V2
+	bool "Exynos multi core timer (ver 2) driver" if COMPILE_TEST
+	depends on ARM64
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
index 000000000000..2da6d5401629
--- /dev/null
+++ b/drivers/clocksource/exynos_mct_v2.c
@@ -0,0 +1,336 @@
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
+	pr_info("MCT: osc-%lu rtc-%lu incr_rtcclk:0x%08x compen_val:0x%08x\n",
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
+/**
+ * exynos_read_count_32 - Read the lower 32-bits of the global counter
+ *
+ * This will read just the lower 32-bits of the global counter.
+ *
+ * Returns the number of cycles in the global counter (lower 32 bits).
+ */
+static u32 exynos_read_count_32(void)
+{
+	return readl_relaxed(reg_base + EXYNOS_MCT_CNT_L);
+}
+
+static u64 exynos_frc_read(struct clocksource *cs)
+{
+	return exynos_read_count_32();
+}
+
+static struct clocksource mct_frc = {
+	.name		= "mct-frc",
+	.rating		= 350,	/* use value lower than ARM arch timer */
+	.read		= exynos_frc_read,
+	.mask		= CLOCKSOURCE_MASK(32),
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+};
+
+static int __init exynos_clocksource_init(void)
+{
+	if (clocksource_register_hz(&mct_frc, osc_clk_rate))
+		panic("%s: can't register clocksource\n", mct_frc.name);
+
+	return 0;
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
+	pr_info("## exynos_timer_resources\n");
+	ret = exynos_timer_resources(np, of_iomap(np, 0));
+	if (ret)
+		return ret;
+
+	pr_info("## exynos_clocksource_init\n");
+	ret = exynos_clocksource_init();
+
+	return ret;
+}
+
+TIMER_OF_DECLARE(s5e99xx, "samsung,s5e99xx-mct", mct_init_dt);
diff --git a/drivers/clocksource/exynos_mct_v2.h b/drivers/clocksource/exynos_mct_v2.h
new file mode 100644
index 000000000000..377421803bbe
--- /dev/null
+++ b/drivers/clocksource/exynos_mct_v2.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * exynos_mct_v2.h - Samsung Exynos MCT(Multi-Core Timer) Driver Header file
+ *
+ * Copyright (C) 2021 Samsung Electronics Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
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
+#define DEFAULT_RTC_CLK_RATE		32768 // 32.768Khz
+#define DEFAULT_CLK_DIV			3     // 1/3
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

