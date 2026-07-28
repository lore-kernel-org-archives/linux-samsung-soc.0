Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E680142D775
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239578; cv=none; b=Me0xI+vL7YBMdW/s5FuuebldCtMsSBEi3x2OLLW1LUIVQI1epLoT9jg8plkGV7sbOYGicIItjnPLxleHwr5xCoDdiIYMR03I7D3EOhFts/9JzNd/txYCmge8zMbhOFPXYLSVxffqLMo1xNrNwzchkKTzHfmKIu/t2c8Q1HUQOQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239578; c=relaxed/simple;
	bh=eXP5hO1BTYClsmzfEVAFO58GneS/HoHzlbx2F4nhORA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=R7TNt/QQg7RL1T3QKUtH1NsBIHa508pmIa2SCRhV07rV+PDZlnUrnhIRKS8ZJNoXN1n0u4/b2NyqY1mTksGT1Y0WXNOvw3ADtIthBYbsG/wKU8Zshdq1YGkHlDmoXpp3NRjzpSIP/8vb8AZSdGy8vhgiy1c0bC+DH5Zgyh8U/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QYkqt5iI; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QYkqt5iI"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260728115254epoutp01737f1d4543b55577a22bb50bd4df4069~Gce8fqAPD1113611136epoutp01L
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:52:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260728115254epoutp01737f1d4543b55577a22bb50bd4df4069~Gce8fqAPD1113611136epoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239574;
	bh=4zAs40bFhQhCemP/dM8lnvLHyZ2owbc7ZyQEVmrvgEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYkqt5iIcmVMAjp5ly5sAq7JAXgGiDlGwlGTcdfKS9TPlIhsWPzjk6xTzJ0dV0nbC
	 PojKJFQObWVCwyNeWb5569y+xhkzhZ6gIpWYpyLS5t2lMf8BiisTrbK32MgyBSss0V
	 6iRedmDcyaxpi5xy1y7wR0HotQLlLUfsI1CmCsmg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260728115253epcas5p3e5c5d0d07cf00aa85cf82178c62aedfc~Gce7yC8vd1684116841epcas5p3p;
	Tue, 28 Jul 2026 11:52:53 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4h8YkD3Btvz2SSKY; Tue, 28 Jul
	2026 11:52:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a~Gce6foXdd0078500785epcas5p1F;
	Tue, 28 Jul 2026 11:52:51 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115248epsmtip15e0f7c179addb3e0f356d398ec3861e3~Gce3huKl_2232022320epsmtip1j;
	Tue, 28 Jul 2026 11:52:48 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
Date: Tue, 28 Jul 2026 17:41:01 +0530
Message-Id: <20260728121111.2077860-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a@epcas5p1.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_TOP & CMU_PERIC, these provide clocks for TOP & PERIC

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 drivers/clk/samsung/Makefile         |   1 +
 drivers/clk/samsung/clk-exynos8855.c | 420 +++++++++++++++++++++++++++
 2 files changed, 421 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-exynos8855.c

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index b3c4ef4e0dbf..29a11f5de121 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8895.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov920.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos8855.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-gs101.o
 obj-$(CONFIG_EXYNOS_ACPM_CLK)		+= clk-acpm.o
 obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
new file mode 100644
index 000000000000..93528f0077a4
--- /dev/null
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Samsung Electronics Co., Ltd.
+ * Author: Raghav Sharma <raghav.s@samsung.com>
+ *
+ * Common Clock Framework support for Exynos 8855 SoC.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/samsung,exynos8855.h>
+
+#include "clk.h"
+#include "clk-exynos-arm64.h"
+
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_TOP                     (FOUT_MMC_PLL_DIV2 + 1)
+#define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK + 1)
+
+/* ---- CMU_TOP --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_TOP (0x13900000) */
+/* PLL */
+#define PLL_LOCKTIME_PLL_SHARED0		             0x8
+#define PLL_LOCKTIME_PLL_SHARED1		             0x10
+#define PLL_LOCKTIME_PLL_SHARED2		             0x18
+#define PLL_LOCKTIME_PLL_MMC                                 0x20
+#define PLL_LOCKTIME_PLL_SHARED3		             0x28
+#define PLL_LOCKTIME_PLL_SHARED4		             0x38
+#define PLL_CON0_PLL_MMC			             0x1c0
+#define PLL_CON3_PLL_MMC			             0x1cc
+#define PLL_CON0_PLL_SHARED0			             0x100
+#define PLL_CON3_PLL_SHARED0			             0x10c
+#define PLL_CON0_PLL_SHARED1			             0x140
+#define PLL_CON3_PLL_SHARED1			             0x14c
+#define PLL_CON0_PLL_SHARED2			             0x180
+#define PLL_CON3_PLL_SHARED2			             0x18c
+#define PLL_CON0_PLL_SHARED3			             0x200
+#define PLL_CON3_PLL_SHARED3			             0x20c
+#define PLL_CON0_PLL_SHARED4			             0x280
+#define PLL_CON3_PLL_SHARED4			             0x28c
+
+/* MUX */
+#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC                 0x1078
+#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD            0x107c
+#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP                  0x1080
+
+/* DIV */
+#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC                 0x1878
+#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD            0x187c
+#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP                  0x1880
+
+static const unsigned long top_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_MMC,
+	PLL_LOCKTIME_PLL_SHARED0,
+	PLL_LOCKTIME_PLL_SHARED1,
+	PLL_LOCKTIME_PLL_SHARED2,
+	PLL_LOCKTIME_PLL_SHARED3,
+	PLL_LOCKTIME_PLL_SHARED4,
+	PLL_CON0_PLL_MMC,
+	PLL_CON3_PLL_MMC,
+	PLL_CON0_PLL_SHARED0,
+	PLL_CON3_PLL_SHARED0,
+	PLL_CON0_PLL_SHARED1,
+	PLL_CON3_PLL_SHARED1,
+	PLL_CON0_PLL_SHARED2,
+	PLL_CON3_PLL_SHARED2,
+	PLL_CON0_PLL_SHARED3,
+	PLL_CON3_PLL_SHARED3,
+	PLL_CON0_PLL_SHARED4,
+	PLL_CON3_PLL_SHARED4,
+	CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC,
+	CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD,
+	CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP,
+	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC,
+	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD,
+	CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP,
+};
+
+static const struct samsung_pll_clock top_pll_clks[] __initconst = {
+	PLL(pll_4313, FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),
+	PLL(pll_4313, FOUT_SHARED1_PLL, "fout_shared1_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED1, PLL_CON3_PLL_SHARED1, NULL),
+	PLL(pll_4313, FOUT_SHARED2_PLL, "fout_shared2_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED2, PLL_CON3_PLL_SHARED2, NULL),
+	PLL(pll_4313, FOUT_SHARED3_PLL, "fout_shared3_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3, NULL),
+	PLL(pll_4313, FOUT_SHARED4_PLL, "fout_shared4_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_SHARED4, PLL_CON3_PLL_SHARED4, NULL),
+	PLL(pll_4313, FOUT_MMC_PLL, "fout_mmc_pll", "oscclk",
+	    PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, NULL),
+};
+
+/* List of parent clocks for Muxes in CMU_TOP */
+PNAME(mout_shared0_pll_p) = { "oscclk", "fout_shared0_pll" };
+PNAME(mout_shared1_pll_p) = { "oscclk", "fout_shared1_pll" };
+PNAME(mout_shared2_pll_p) = { "oscclk", "fout_shared2_pll" };
+PNAME(mout_shared3_pll_p) = { "oscclk", "fout_shared3_pll" };
+PNAME(mout_shared4_pll_p) = { "oscclk", "fout_shared4_pll" };
+PNAME(mout_mmc_pll_p) = { "oscclk", "fout_mmc_pll" };
+
+PNAME(mout_clkcmu_peric_noc_p)            = { "dout_shared0_div2", "dout_shared0_div3",
+						"dout_shared1_div2", "dout_shared1_div3",
+						"dout_shared2_div2", "dout_shared2_div3",
+						"fout_mmc_pll_div2", "dout_shared3_div3"};
+PNAME(mout_clkcmu_peric_mmc_card_p)       = { "oscclk", "dout_shared0_div2",
+						"fout_mmc_pll_div1", "dout_shared1_div2",
+						"dout_shared2_div2", "dout_shared2_div3",
+						"dout_shared3_div2", "dout_shared3_div3"};
+PNAME(mout_clkcmu_peric_ip_p)            = { "dout_shared0_div4", "dout_shared1_div4"};
+
+static const struct samsung_mux_clock top_mux_clks[] __initconst = {
+	MUX(MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_p,
+	    PLL_CON0_PLL_SHARED0, 4, 1),
+	MUX(MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_p,
+	    PLL_CON0_PLL_SHARED1, 4, 1),
+	MUX(MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_p,
+	    PLL_CON0_PLL_SHARED2, 4, 1),
+	MUX(MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_p,
+	    PLL_CON0_PLL_SHARED3, 4, 1),
+	MUX(MOUT_SHARED4_PLL, "mout_shared4_pll", mout_shared4_pll_p,
+	    PLL_CON0_PLL_SHARED4, 4, 1),
+	MUX(MOUT_MMC_PLL, "mout_mmc_pll", mout_mmc_pll_p,
+	    PLL_CON0_PLL_MMC, 4, 1),
+	MUX(CLKCMU_MOUT_PERIC_NOC, "mout_clkcmu_peric_noc",
+	    mout_clkcmu_peric_noc_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC, 0, 3),
+	MUX(CLKCMU_MOUT_PERIC_MMC_CARD, "mout_clkcmu_peric_mmc_card",
+	    mout_clkcmu_peric_mmc_card_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD, 0, 3),
+	MUX(CLKCMU_MOUT_PERIC_IP, "mout_clkcmu_peric_ip",
+	    mout_clkcmu_peric_ip_p, CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP, 0, 1),
+};
+
+static const struct samsung_div_clock top_div_clks[] __initconst = {
+	DIV(CLKCMU_DOUT_PERIC_NOC, "dout_clkcmu_peric_noc",
+	    "mout_clkcmu_peric_noc", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC,
+	    0, 4),
+	DIV(CLKCMU_DOUT_PERIC_MMC_CARD, "dout_clkcmu_peric_mmc_card",
+	    "mout_clkcmu_peric_mmc_card", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD,
+	    0, 10),
+	DIV(CLKCMU_DOUT_PERIC_IP, "dout_clkcmu_peric_ip",
+	    "mout_clkcmu_peric_ip", CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP,
+	    0, 4),
+
+};
+
+static const struct samsung_fixed_factor_clock top_fixed_factor_clks[] __initconst = {
+	FFACTOR(DOUT_SHARED0_DIV1, "dout_shared0_div1",
+		"mout_shared0_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED0_DIV2, "dout_shared0_div2",
+		"mout_shared0_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED0_DIV3, "dout_shared0_div3",
+		"mout_shared0_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED0_DIV4, "dout_shared0_div4",
+		"mout_shared0_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED1_DIV1, "dout_shared1_div1",
+		"mout_shared1_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED1_DIV2, "dout_shared1_div2",
+		"mout_shared1_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED1_DIV3, "dout_shared1_div3",
+		"mout_shared1_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED1_DIV4, "dout_shared1_div4",
+		"mout_shared1_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED2_DIV1, "dout_shared2_div1",
+		"mout_shared2_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED2_DIV2, "dout_shared2_div2",
+		"mout_shared2_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED2_DIV3, "dout_shared2_div3",
+		"mout_shared2_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED2_DIV4, "dout_shared2_div4",
+		"mout_shared2_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED3_DIV1, "dout_shared3_div1",
+		"mout_shared3_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED3_DIV2, "dout_shared3_div2",
+		"mout_shared3_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED3_DIV3, "dout_shared3_div3",
+		"mout_shared3_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED3_DIV4, "dout_shared3_div4",
+		"mout_shared3_pll", 1, 4, 0),
+	FFACTOR(DOUT_SHARED4_DIV1, "dout_shared4_div1",
+		"mout_shared4_pll", 1, 1, 0),
+	FFACTOR(DOUT_SHARED4_DIV2, "dout_shared4_div2",
+		"mout_shared4_pll", 1, 2, 0),
+	FFACTOR(DOUT_SHARED4_DIV3, "dout_shared4_div3",
+		"mout_shared4_pll", 1, 3, 0),
+	FFACTOR(DOUT_SHARED4_DIV4, "dout_shared4_div4",
+		"mout_shared4_pll", 1, 4, 0),
+	FFACTOR(FOUT_MMC_PLL_DIV1, "fout_mmc_pll_div1",
+		"mout_mmc_pll", 1, 1, 0),
+	FFACTOR(FOUT_MMC_PLL_DIV2, "fout_mmc_pll_div2",
+		"mout_mmc_pll", 1, 2, 0),
+
+};
+
+static const struct samsung_cmu_info top_cmu_info __initconst = {
+	.pll_clks		= top_pll_clks,
+	.nr_pll_clks		= ARRAY_SIZE(top_pll_clks),
+	.mux_clks               = top_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(top_mux_clks),
+	.div_clks               = top_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(top_div_clks),
+	.fixed_factor_clks	= top_fixed_factor_clks,
+	.nr_fixed_factor_clks	= ARRAY_SIZE(top_fixed_factor_clks),
+	.nr_clk_ids             = CLKS_NR_TOP,
+	.clk_regs               = top_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(top_clk_regs),
+};
+
+static void __init exynos8855_cmu_top_init(struct device_node *np)
+{
+	exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
+}
+
+/* Register CMU_TOP early, as it's a dependency for other early domains */
+CLK_OF_DECLARE(exynos8855_cmu_top, "samsung,exynos8855-cmu-top",
+	       exynos8855_cmu_top_init);
+
+/* ---- CMU_PERIC --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC (0x15400000) */
+#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_IP_USER            0x600
+#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_MMC_CARD_USER      0x610
+#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_NOC_USER           0x620
+#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_I2C                    0x1000
+#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_UART_DBG               0x1004
+#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI00                  0x1008
+#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI01                  0x100c
+#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI02                  0x1010
+#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI03                  0x1014
+#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI04                  0x1018
+#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI09_USI_OIS          0x101c
+#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI10_USI_OIS          0x1020
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_NOCP                   0x1800
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_UART_DBG               0x1804
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI00_USI              0x1808
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI01_USI              0x180c
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI02_USI              0x1810
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI03_USI              0x1814
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI04_USI              0x1818
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI09_USI_OIS          0x181c
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI10_USI_OIS          0x1820
+#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI_I2C                0x1824
+#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK    0x2004
+#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK 0x2060
+#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK     0x2064
+#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK    0x206c
+
+static const unsigned long peric_clk_regs[] __initconst = {
+	CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_IP_USER,
+	CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_MMC_CARD_USER,
+	CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_NOC_USER,
+	CMU_PERIC_CLK_CON_MUX_CLK_PERIC_I2C,
+	CMU_PERIC_CLK_CON_MUX_CLK_PERIC_UART_DBG,
+	CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI00,
+	CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI01,
+	CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI02,
+	CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI03,
+	CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI04,
+	CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI09_USI_OIS,
+	CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI10_USI_OIS,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_NOCP,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_UART_DBG,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI00_USI,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI01_USI,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI02_USI,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI03_USI,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI04_USI,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI09_USI_OIS,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI10_USI_OIS,
+	CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI_I2C,
+	CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK,
+	CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK,
+	CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK,
+	CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIC */
+PNAME(mout_clkcmu_peric_ip_user_p) = { "oscclk", "dout_clkcmu_peric_ip" };
+PNAME(mout_clkcmu_peric_mmc_card_user_p) = { "oscclk", "dout_clkcmu_peric_mmc_card" };
+PNAME(mout_clkcmu_peric_noc_user_p) = { "oscclk", "dout_clkcmu_peric_noc" };
+PNAME(mout_clkcmu_peric_i2c_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
+PNAME(mout_clkcmu_peric_uart_dbg_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
+PNAME(mout_clkcmu_peric_usi0n_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
+PNAME(mout_clkcmu_peric_usi09_usi_ois_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
+PNAME(mout_clkcmu_peric_usi10_usi_ois_p) = { "oscclk", "mout_clkcmu_peric_ip_user" };
+
+static const struct samsung_mux_clock peric_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC_IP_USER, "mout_clkcmu_peric_ip_user",
+	    mout_clkcmu_peric_ip_user_p, CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_IP_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC_MMC_CARD_USER, "mout_clkcmu_peric_mmc_card_user",
+	    mout_clkcmu_peric_mmc_card_user_p, CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_MMC_CARD_USER,
+		4, 1),
+	MUX(CLK_MOUT_PERIC_NOC_USER, "mout_clkcmu_peric_noc_user",
+	    mout_clkcmu_peric_noc_user_p, CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC_I2C, "mout_clkcmu_peric_i2c",
+	    mout_clkcmu_peric_i2c_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_I2C, 0, 1),
+	MUX(CLK_MOUT_PERIC_UART_DBG, "mout_clkcmu_peric_uart_dbg",
+	    mout_clkcmu_peric_uart_dbg_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_UART_DBG, 0, 1),
+	MUX(CLK_MOUT_PERIC_USI00, "mout_clkcmu_peric_usi00",
+	    mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI00, 0, 1),
+	MUX(CLK_MOUT_PERIC_USI01, "mout_clkcmu_peric_usi01",
+	    mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI01, 0, 1),
+	MUX(CLK_MOUT_PERIC_USI02, "mout_clkcmu_peric_usi02",
+	    mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI02, 0, 1),
+	MUX(CLK_MOUT_PERIC_USI03, "mout_clkcmu_peric_usi03",
+	    mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI03, 0, 1),
+	MUX(CLK_MOUT_PERIC_USI04, "mout_clkcmu_peric_usi04",
+	    mout_clkcmu_peric_usi0n_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI04, 0, 1),
+	MUX(CLK_MOUT_PERIC_USI09_USI_OIS, "mout_clkcmu_peric_usi09_usi_ois",
+	    mout_clkcmu_peric_usi09_usi_ois_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI09_USI_OIS, 0, 1),
+	MUX(CLK_MOUT_PERIC_USI10_USI_OIS, "mout_clkcmu_peric_usi10_usi_ois",
+	    mout_clkcmu_peric_usi10_usi_ois_p, CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI10_USI_OIS, 0, 1),
+};
+
+static const struct samsung_div_clock peric_div_clks[] __initconst = {
+	DIV(CLK_DOUT_PERIC_NOCP, "dout_clkcmu_peric_nocp",
+	    "mout_clkcmu_peric_noc_user", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_NOCP,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC_UART_DBG, "dout_clkcmu_peric_uart_dbg",
+	    "mout_clkcmu_peric_uart_dbg", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_UART_DBG,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC_USI00_USI, "dout_clkcmu_peric_usi00_usi",
+	    "mout_clkcmu_peric_usi00", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI00_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC_USI01_USI, "dout_clkcmu_peric_usi01_usi",
+	    "mout_clkcmu_peric_usi01", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI01_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC_USI02_USI, "dout_clkcmu_peric_usi02_usi",
+	    "mout_clkcmu_peric_usi02", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI02_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC_USI03_USI, "dout_clkcmu_peric_usi03_usi",
+	    "mout_clkcmu_peric_usi03", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI03_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC_USI04_USI, "dout_clkcmu_peric_usi04_usi",
+	    "mout_clkcmu_peric_usi04", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI04_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC_USI09_USI_OIS, "dout_clkcmu_peric_usi09_usi_ois",
+	    "mout_clkcmu_peric_usi09_usi_ois", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI09_USI_OIS,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC_USI10_USI_OIS, "dout_clkcmu_peric_usi10_usi_ois",
+	    "mout_clkcmu_peric_usi10_usi_ois", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI10_USI_OIS,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC_USI_I2C, "dout_clkcmu_peric_usi_i2c",
+	    "mout_clkcmu_peric_i2c", CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI_I2C,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock peric_gate_clks[] __initconst = {
+	/* System will hang if this critical clock is gated */
+	GATE(CLK_GOUT_CMU_PERIC_IPCLKPORT_PCLK, "gout_cmu_peric_ipclkport_pclk",
+	     "dout_clkcmu_peric_nocp",
+	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_SYSREG_PERIC_IPCLKPORT_PCLK, "gout_sysreg_peric_ipclkport_pclk",
+	     "dout_clkcmu_peric_nocp",
+	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	/* System will hang if this critical clock is gated */
+	GATE(CLK_GOUT_UART_DBG_PERIC_IPCLKPORT_PCLK, "gout_uart_dbg_peric_ipclkport_pclk",
+	     "dout_clkcmu_peric_uart_dbg",
+	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK,
+	     21, CLK_IS_CRITICAL, 0),
+	GATE(CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK, "gout_usi_peric_ipclkport_pclk",
+	     "dout_clkcmu_peric_nocp",
+	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info peric_cmu_info __initconst = {
+	.mux_clks               = peric_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(peric_mux_clks),
+	.div_clks               = peric_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(peric_div_clks),
+	.gate_clks              = peric_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(peric_gate_clks),
+	.nr_clk_ids             = CLKS_NR_PERIC,
+	.clk_regs               = peric_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(peric_clk_regs),
+	.clk_name               = "bus",
+};
+
+static int __init exynos8855_cmu_probe(struct platform_device *pdev)
+{
+	const struct samsung_cmu_info *info;
+	struct device *dev = &pdev->dev;
+
+	info = of_device_get_match_data(dev);
+	exynos_arm64_register_cmu(dev, dev->of_node, info);
+
+	return 0;
+}
+
+static const struct of_device_id exynos8855_cmu_of_match[] = {
+	{
+		.compatible = "samsung,exynos8855-cmu-peric",
+		.data = &peric_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8855-cmu-top",
+		.data = &top_cmu_info,
+	},
+	{ }
+};
+
+static struct platform_driver exynos8855_cmu_driver __refdata = {
+	.driver = {
+		.name = "exynos8855-cmu",
+		.of_match_table = exynos8855_cmu_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = exynos8855_cmu_probe,
+};
+
+static int __init exynos8855_cmu_init(void)
+{
+	return platform_driver_register(&exynos8855_cmu_driver);
+}
+core_initcall(exynos8855_cmu_init);
-- 
2.34.1

