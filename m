Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3137EFF0;
	Tue, 23 Jun 2026 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782222840; cv=none; b=cyBcUkq2bEWTDO+eAZ8zqEDzTzlcTY0RLX4brXdmD/GjIzcPtzusPTOtFPgIZG+E7UjM6CwMQEEe+PYUvjtqvFq1lXY15+Qf+qBI1nGeeR0mWZYTvTj2z57cCHknye+RkTQjk7Uf3T9xx/bOWrrK9EgDIzJg5K4ssRh8V+tZUPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782222840; c=relaxed/simple;
	bh=EOUciuhfSqIkeSHkgAgSkJscYMPr0xVuRR0EIPJcoh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QgefjfbFZOStJFKH1m7TP0LYd1JOodp71meSe2fvulVwiwPM+MFdLr2a1ZYlC8AxXOVOG6uL7c2Si3jG5pib53z6GUx7QYb2CGD8nvy98RfkVLwczAH6L2a9TmtnHqHGoad7TMnXeV1h8f8YRsA8+PCElQOMLxHsSt4F7BJWpr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3fADtjzpqzCvYFA--.57255S2;
	Tue, 23 Jun 2026 21:53:49 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Pritam Manohar Sutar <pritam.sutar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
Date: Tue, 23 Jun 2026 21:53:49 +0800
Message-ID: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3fADtjzpqzCvYFA--.57255S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KFW7uw1DGw15tr1xtr13Jwb_yoWDXw47pF
	W7ZryIyrW0qF97tayUtrsxAa15Kw4Ik347XFyfCas2q3WDW3yUW3W8XF10y3Z8KrWkCa4S
	yr40yFW5ZF1UCrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUQZ2fUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The GS101 PIPE3 initialization checks the PMA PLL lock and then checks
the CDR lock. The PLL helper returns an error, but the GS101 PIPE3 init
path dropped that result. The CDR helper only logged a timeout. PHY
initialization could therefore still return success after either the PLL
or the selected receive lane had not locked.

Make the in-file SoC-specific phy_init hook return an int so helpers
with real failure results can propagate them through the existing PHY
init paths. Keep the register-only helpers returning success and use the
new return path to report the GS101 CDR wait failure. Other SoC helper
paths keep their previous success behavior.

Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 78 ++++++++++++++++-------
 1 file changed, 55 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 8711a3b62..5a8e0ce77 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -471,7 +471,7 @@ struct exynos5_usbdrd_phy;
 struct exynos5_usbdrd_phy_config {
 	u32 id;
 	void (*phy_isol)(struct phy_usb_instance *inst, bool isolate);
-	void (*phy_init)(struct exynos5_usbdrd_phy *phy_drd);
+	int (*phy_init)(struct exynos5_usbdrd_phy *phy_drd);
 	unsigned int (*set_refclk)(struct phy_usb_instance *inst);
 };
 
@@ -708,7 +708,7 @@ exynos5_usbdrd_apply_phy_tunes(struct exynos5_usbdrd_phy *phy_drd,
 	}
 }
 
-static void exynos5_usbdrd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
+static int exynos5_usbdrd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	u32 reg;
 
@@ -721,6 +721,8 @@ static void exynos5_usbdrd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
 	reg &= ~PHYTEST_POWERDOWN_SSP;
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+
+	return 0;
 }
 
 static void
@@ -831,7 +833,7 @@ exynos5_usbdrd_usbdp_g2_v4_pma_check_pll_lock(struct exynos5_usbdrd_phy *phy_drd
 	return err;
 }
 
-static void
+static int
 exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(struct exynos5_usbdrd_phy *phy_drd)
 {
 	static const unsigned int timeout_us = 40000;
@@ -857,9 +859,11 @@ exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(struct exynos5_usbdrd_phy *phy_drd
 			((phy_drd->orientation == TYPEC_ORIENTATION_NORMAL)
 			 ? 0
 			 : 2), reg);
+
+	return err;
 }
 
-static void exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+static int exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	u32 reg;
 
@@ -881,6 +885,8 @@ static void exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
 	reg &= ~PHYTEST_POWERDOWN_HSP;
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
+
+	return 0;
 }
 
 static int exynos5_usbdrd_phy_init(struct phy *phy)
@@ -917,7 +923,9 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYUTMICLKSEL);
 
 	/* UTMI or PIPE3 specific init */
-	inst->phy_cfg->phy_init(phy_drd);
+	ret = inst->phy_cfg->phy_init(phy_drd);
+	if (ret)
+		goto disable_clks;
 
 	/* reference clock settings */
 	reg = inst->phy_cfg->set_refclk(inst);
@@ -940,9 +948,10 @@ static int exynos5_usbdrd_phy_init(struct phy *phy)
 	reg &= ~PHYCLKRST_PORTRESET;
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYCLKRST);
 
+disable_clks:
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
-	return 0;
+	return ret;
 }
 
 static int exynos5_usbdrd_phy_exit(struct phy *phy)
@@ -1203,7 +1212,7 @@ static void exynos7870_usbdrd_phy_isol(struct phy_usb_instance *inst,
 			   EXYNOS7870_USB2PHY_ENABLE, val);
 }
 
-static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+static int exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	u32 reg;
 
@@ -1291,6 +1300,8 @@ static void exynos7870_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	if (phy_drd->drv_data->phy_tunes)
 		exynos5_usbdrd_apply_phy_tunes(phy_drd,
 					       PTS_UTMI_POSTINIT);
+
+	return 0;
 }
 
 static int exynos7870_usbdrd_phy_init(struct phy *phy)
@@ -1304,11 +1315,11 @@ static int exynos7870_usbdrd_phy_init(struct phy *phy)
 		return ret;
 
 	/* UTMI or PIPE3 specific init */
-	inst->phy_cfg->phy_init(phy_drd);
+	ret = inst->phy_cfg->phy_init(phy_drd);
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
-	return 0;
+	return ret;
 }
 
 static int exynos7870_usbdrd_phy_exit(struct phy *phy)
@@ -1355,10 +1366,12 @@ static const struct phy_ops exynos7870_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static void exynos2200_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+static int exynos2200_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	/* Configure non-Samsung IP PHY, responsible for UTMI */
-	phy_init(phy_drd->hs_phy);
+	phy_init(phy_drd->hs_phy);
+
+	return 0;
 }
 
 static void exynos2200_usbdrd_link_init(struct exynos5_usbdrd_phy *phy_drd)
@@ -1458,11 +1469,11 @@ static int exynos2200_usbdrd_phy_init(struct phy *phy)
 	exynos2200_usbdrd_link_attach_detach_pipe3_phy(inst);
 
 	/* UTMI or PIPE3 specific init */
-	inst->phy_cfg->phy_init(phy_drd);
+	ret = inst->phy_cfg->phy_init(phy_drd);
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
-	return 0;
+	return ret;
 }
 
 static int exynos2200_usbdrd_phy_exit(struct phy *phy)
@@ -1516,7 +1538,7 @@ exynos5_usbdrd_usb_v3p1_pipe_override(struct exynos5_usbdrd_phy *phy_drd)
 	writel(reg, regs_base + EXYNOS850_DRD_SECPMACTL);
 }
 
-static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+static int exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	void __iomem *regs_base = phy_drd->reg_phy;
 	u32 reg;
@@ -1622,6 +1644,8 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 
 	if (ss_ports)
 		exynos5_usbdrd_usb_v3p1_pipe_override(phy_drd);
+
+	return 0;
 }
 
 static int exynos850_usbdrd_phy_init(struct phy *phy)
@@ -1635,12 +1659,13 @@ static int exynos850_usbdrd_phy_init(struct phy *phy)
 		return ret;
 
 	/* UTMI or PIPE3 specific init */
+	ret = 0;
 	scoped_guard(mutex, &phy_drd->phy_mutex)
-		inst->phy_cfg->phy_init(phy_drd);
+		ret = inst->phy_cfg->phy_init(phy_drd);
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
-	return 0;
+	return ret;
 }
 
 static int exynos850_usbdrd_phy_exit(struct phy *phy)
@@ -1689,11 +1714,12 @@ static const struct phy_ops exynos850_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static void exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
+static int exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	void __iomem *regs_pma = phy_drd->reg_pma;
 	void __iomem *regs_phy = phy_drd->reg_phy;
 	u32 reg;
+	int ret;
 
 	exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(phy_drd);
 
@@ -1715,8 +1741,11 @@ static void exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 		 SECPMACTL_PMA_INIT_SW_RST);
 	writel(reg, regs_phy + EXYNOS850_DRD_SECPMACTL);
 
-	if (!exynos5_usbdrd_usbdp_g2_v4_pma_check_pll_lock(phy_drd))
-		exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
+	ret = exynos5_usbdrd_usbdp_g2_v4_pma_check_pll_lock(phy_drd);
+	if (ret)
+		return ret;
+
+	return exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
 }
 
 static int exynos5_usbdrd_gs101_phy_init(struct phy *phy)
@@ -1741,7 +1770,15 @@ static int exynos5_usbdrd_gs101_phy_init(struct phy *phy)
 	 */
 	exynos5_usbdrd_phy_isol(inst, false);
 
-	return exynos850_usbdrd_phy_init(phy);
+	ret = exynos850_usbdrd_phy_init(phy);
+	if (ret) {
+		exynos5_usbdrd_phy_isol(inst, true);
+		if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
+			regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+					       phy_drd->regulators);
+	}
+
+	return ret;
 }
 
 static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
@@ -2277,7 +2314,7 @@ exynosautov920_usb31drd_lane0_reset(struct exynos5_usbdrd_phy *phy_drd, int val)
 	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_RST_CTRL);
 }
 
-static void
+static int
 exynosautov920_usb31drd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	void __iomem *reg_phy = phy_drd->reg_phy;
@@ -2335,6 +2372,8 @@ exynosautov920_usb31drd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 
 	/* override values for level settings */
 	exynosautov920_usb31drd_cr_write(phy_drd, 0x22, 0x00F5);
+
+	return 0;
 }
 
 static void
@@ -2353,7 +2392,7 @@ exynosautov920_usb31drd_ssphy_disable(struct exynos5_usbdrd_phy *phy_drd)
 	writel(reg, reg_phy + EXYNOSAUTOV920_USB31DRD_PHY_CONFIG7);
 }
 
-static void
+static int
 exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	void __iomem *reg_phy = phy_drd->reg_phy;
@@ -2457,6 +2496,8 @@ exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
 	reg |= EXYNOS2200_CLKRST_LINK_PCLK_SEL;
 	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
+
+	return 0;
 }
 
 static void
@@ -2504,11 +2545,11 @@ static int exynosautov920_usbdrd_phy_init(struct phy *phy)
 	inst->phy_cfg->phy_isol(inst, false);
 
 	/* UTMI or PIPE3 specific init */
-	inst->phy_cfg->phy_init(phy_drd);
+	ret = inst->phy_cfg->phy_init(phy_drd);
 
 	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
-	return 0;
+	return ret;
 }
 
 static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
-- 
2.50.1 (Apple Git-155)

