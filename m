Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478784;
	b=qFlmMoyKsng08l0iaMA7spn5IwFZ6k6HA8dXWBqAXlHhv3OxTBwyGxxEeIPWjc1yOiBb
	 MV0uL2YoDCgjYpvBunX+Ev2j7OCCuU1BotA3G/hiKrX4b96tDZOdR5MlbaYGyC+U/MDXv
	 mpVBU4z5kPmnLTZTZGXCwb/Tg2YcU6HUdAEOcsaMM8mOM2uWtUvyL0D1YqFkrC6ikeQwI
	 hTBkG/5qzmcBMpzjrDzfxr572UbJ3Yg5rob3vrr+YZWT7PRtA68GUaemYGRGhKAaAKK1B
	 SfrebIFcnztlznCKU7ueKsYYiWTJof27MqsCNcIcMdOJaN2caoFemtqTt/oNa98lgHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478784;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=m2hCcThmFXYB/OeCygofrgjQSQPNYsGUPZd5pmVcOqM=;
	b=X2ZE6yjJNqwn9tkocrQOulmj0568hIAbr9jdzZv1yrDl+Pki5PVdh4/jPDGM5Z/bl8GW
	 LdZJrmwnsqTKNH6GehUw9pKcytvtzaTPOMTe7oV7Ap+iKRPo/Zsmv/UB7I0R9/EYtnYP9
	 Tf4er4v1UtjuJvh40/XlGTfCRb6l5XGNDBH27NtfuRNc9T/rlY86e8ZZ+BzJZCiODhhZg
	 gX1Gg++fCHyhJqIRd4JMYFbfZJLW3GllJ4QelA0zWDZj78nMyKvhdt18+JUZaXq2n2b6t
	 m0BQdkukzHTNZL/q7AgtQCfqLlwCUzAVLFZgJ75jFoVeYDnvuPZq8V+ggoDxhwXJkLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=QAc7BVDe;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E459606A327
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E459606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=QAc7BVDe
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261020064621epoutp03949c36fa10a9bcd5c188e581598263c2~gKfSJuAq-0139001390epoutp03Q
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:46:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261020064621epoutp03949c36fa10a9bcd5c188e581598263c2~gKfSJuAq-0139001390epoutp03Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478781;
	bh=m2hCcThmFXYB/OeCygofrgjQSQPNYsGUPZd5pmVcOqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QAc7BVDeP+mMXPM/5K9rb7tojN7iwDLqMEBbvs+l5GeRdLXA58xC0+IGRYO6fUzvL
	 67Oxt0sDD9alCWkAgflKNqz+oFSGmGGgLDooAYa0UbXDZAdqSxjRhgS9X19/d9DxhN
	 VJkdFRCK3TtxPZFcvyL6WEvJQEJSyQNp+mQz/hms=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261020064621epcas5p23e6fac4625b3d926002e89105727e31d~gKfRpnxRR0679706797epcas5p2J;
	Tue, 20 Oct 2026 06:46:21 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j82xm2d8cz2SSKf; Tue, 20 Oct
	2026 06:46:20 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261020063821epcas5p330286779382151f2cadea1e1e0b447f1~gKYSyEj7i1901819018epcas5p3V;
	Tue, 20 Oct 2026 06:38:21 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063819epsmtip1b9d0f5b3a443078838d012bd1392f65c~gKYQazFrt3255232552epsmtip1E;
	Tue, 20 Oct 2026 06:38:18 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 08/14] clk: samsung: exynos8855: add block peris clock
 support
Date: Tue, 20 Oct 2026 12:25:52 +0530
Message-Id: <20261020065558.1829402-9-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261020063821epcas5p330286779382151f2cadea1e1e0b447f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063821epcas5p330286779382151f2cadea1e1e0b447f1
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063821epcas5p330286779382151f2cadea1e1e0b447f1@epcas5p3.samsung.com>

Register compatible and cmu_info data to support clocks.
CMU_PERIS, this provides clocks for PERIS

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index dcf58f2459b0..12b5ae54b560 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -18,7 +18,9 @@
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
+#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
 
+#define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
 
@@ -1092,6 +1094,98 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
 	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
 };
 
+/* ---- CMU_PERIS --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIS (0x10030000) */
+#define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER           0x600
+#define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x1000
+#define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER              0x610
+#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x1800
+#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x1804
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK     0x201c
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK  0x2040
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK          0x2048
+#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK          0x204c
+#define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
+
+static const unsigned long peris_clk_regs[] __initconst = {
+	CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
+	CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
+	CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
+	CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
+	CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
+	CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
+	CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIS */
+PNAME(mout_clkcmu_peris_noc_user_p) = { "oscclk", "dout_clkcmu_peris_noc" };
+PNAME(mout_clk_peris_gic_p) = { "oscclk", "mout_clkcmu_peris_gic_user" };
+PNAME(mout_clkcmu_peris_gic_user_p) = { "oscclk", "dout_clkcmu_peris_gic" };
+
+static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIS_NOC_USER, "mout_clkcmu_peris_noc_user",
+	    mout_clkcmu_peris_noc_user_p, CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_PERIS_GIC, "mout_clk_peris_gic",
+	    mout_clk_peris_gic_p, CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
+	MUX(CLK_MOUT_PERIS_GIC_USER, "mout_clkcmu_peris_gic_user",
+	    mout_clkcmu_peris_gic_user_p, CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock peris_div_clks[] __initconst = {
+	DIV(CLK_DOUT_PERIS_NOCP, "dout_clkcmu_peris_nocp",
+	    "mout_clkcmu_peris_noc_user", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
+	    0, 4),
+	DIV(CLK_DOUT_PERIS_OTP, "dout_clkcmu_peris_otp",
+	    "oscclk", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_PERIS, "gout_sysreg_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT0_PERIS, "gout_wdt0_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_WDT1_PERIS, "gout_wdt1_peris",
+	     "dout_clkcmu_peris_nocp",
+	     CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const unsigned long dcrg_sysreg[] __initconst = {
+	EXYNOS8855_DRCG_EN_OFFSET,
+};
+
+static const struct samsung_cmu_info peris_cmu_info __initconst = {
+	.mux_clks               = peris_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(peris_mux_clks),
+	.div_clks               = peris_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(peris_div_clks),
+	.gate_clks              = peris_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(peris_gate_clks),
+	.nr_clk_ids             = CLKS_NR_PERIS,
+	.clk_regs               = peris_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(peris_clk_regs),
+	.sysreg_clk_regs	= dcrg_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_sysreg),
+	.clk_name               = "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = EXYNOS8855_PERIS_GATE_DBG_OFFSET,
+	.option_offset          = CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
+	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1107,6 +1201,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
 	{
 		.compatible = "samsung,exynos8855-cmu-peric",
 		.data = &peric_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8855-cmu-peris",
+		.data = &peris_cmu_info,
 	}, {
 		.compatible = "samsung,exynos8855-cmu-top",
 		.data = &top_cmu_info,
-- 
2.34.1

