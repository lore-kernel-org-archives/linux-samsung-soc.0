Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A9E2749CB
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375294; cv=none; b=KjuzGpg0d3ylXtTdxD40ER2Hq2Q7eiS81w3/qASb7heh2X8i2ItNjq9h+Sl8Q8seU8obPEOm/StW4hh3T3wnUzq/IBBjLlWgpIdvqwl7q75mJhyqv2cpZQPFR3Gwb/iQCLf6i0EPEgkPm6QMoKR0oVzB5N0diKwrQt8sCMd1BGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375294; c=relaxed/simple;
	bh=vs9W3rgstivY7xP5VrWM8hnl9oWGwLHJmx91xXqYOV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=mQJfL+aP72N1o5TjvOJqk25aoVI5vcDYrnmphB0ghVPEJv9+iCSpb3oIY4DxJcElpypKhMp4l/Gy66xvF4SF8L6olJlERCMhZFHIbCgILMH1MPndLBe8E3v79PJmlIuJsXr8p+C1AUUXbwHzCfifT54OPj+kOzNwSQaNFBM+7Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UFW9uTot; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UFW9uTot"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250701130809epoutp02403a5557b34218c4cafe5ad3da235630~OIovvuJCE0599205992epoutp02P
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:08:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250701130809epoutp02403a5557b34218c4cafe5ad3da235630~OIovvuJCE0599205992epoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751375289;
	bh=pvoHxXvlrlKde8j+ma+r7GZr6pK2wxjLK7jGp5m/Tr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UFW9uTotF5JNcXZqMUxLXpPYNe2VF0PhCDzUbqiVrQleH4Fvr/e1fc9TiYt0Qx43f
	 Lzv4Tm0/LXOmz7MH7odGsJNAHtiwFT8vQHJW/zfpkPwAJnibqrrW1h4cnvC38cAXcQ
	 Yy4OQq/UTzcHjiJdZZvVYpWQLORVyG5oCMzp02s0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250701130808epcas5p141519839fbd01223fd53a85cccefabee~OIouvWza11094810948epcas5p1p;
	Tue,  1 Jul 2025 13:08:08 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.182]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bWjxy3lmFz3hhT7; Tue,  1 Jul
	2025 13:08:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250701120005epcas5p24a8cfb5037524127416756fb723ccae7~OHtUl4_WI0527505275epcas5p2u;
	Tue,  1 Jul 2025 12:00:05 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701120002epsmtip1963c41750682632818c9ba20a18b8e5e~OHtRvKFrW1373213732epsmtip15;
	Tue,  1 Jul 2025 12:00:02 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	neil.armstrong@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v4 4/6] phy: exynos5-usbdrd: support HS combo phy for
 ExynosAutov920
Date: Tue,  1 Jul 2025 17:37:04 +0530
Message-Id: <20250701120706.2219355-5-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701120706.2219355-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250701120005epcas5p24a8cfb5037524127416756fb723ccae7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701120005epcas5p24a8cfb5037524127416756fb723ccae7
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701120005epcas5p24a8cfb5037524127416756fb723ccae7@epcas5p2.samsung.com>

This SoC has a single USB 3.1 DRD combo phy that supports both
UTMI+ (HS) and PIPE3 (SS) and three USB2.0 DRD HS phy controllers
those only support the UTMI+ (HS) interface.

Support UTMI+ combo phy for this SoC which is somewhat simmilar to
what the existing Exynos850 support does. The difference is that
some register offsets and bit fields are defferent from Exynos850.

Add required change in phy driver to support combo HS phy for this SoC.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 212 +++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 64f3316f6ad4..8a1cd63b29ce 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -41,6 +41,13 @@
 #define EXYNOS2200_CLKRST_LINK_PCLK_SEL		BIT(1)
 
 #define EXYNOS2200_DRD_UTMI			0x10
+
+/* ExynosAutov920 bits */
+#define UTMICTL_FORCE_UTMI_SUSPEND		BIT(13)
+#define UTMICTL_FORCE_UTMI_SLEEP		BIT(12)
+#define UTMICTL_FORCE_DPPULLDOWN		BIT(9)
+#define UTMICTL_FORCE_DMPULLDOWN		BIT(8)
+
 #define EXYNOS2200_UTMI_FORCE_VBUSVALID		BIT(1)
 #define EXYNOS2200_UTMI_FORCE_BVALID		BIT(0)
 
@@ -250,6 +257,22 @@
 #define EXYNOS850_DRD_HSP_TEST			0x5c
 #define HSP_TEST_SIDDQ				BIT(24)
 
+#define EXYNOSAUTOV920_DRD_HSP_CLKRST		0x100
+#define HSPCLKRST_PHY20_SW_PORTRESET		BIT(3)
+#define HSPCLKRST_PHY20_SW_POR			BIT(1)
+#define HSPCLKRST_PHY20_SW_POR_SEL		BIT(0)
+
+#define EXYNOSAUTOV920_DRD_HSPCTL		0x104
+#define HSPCTRL_VBUSVLDEXTSEL			BIT(13)
+#define HSPCTRL_VBUSVLDEXT			BIT(12)
+#define HSPCTRL_EN_UTMISUSPEND			BIT(9)
+#define HSPCTRL_COMMONONN			BIT(8)
+
+#define EXYNOSAUTOV920_DRD_HSP_TEST		0x10c
+
+#define EXYNOSAUTOV920_DRD_HSPPLLTUNE		0x110
+#define HSPPLLTUNE_FSEL				GENMASK(18, 16)
+
 /* Exynos9 - GS101 */
 #define EXYNOS850_DRD_SECPMACTL			0x48
 #define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
@@ -2056,6 +2079,139 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static void
+exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	/*
+	 * Disable HWACG (hardware auto clock gating control). This
+	 * forces QACTIVE signal in Q-Channel interface to HIGH level,
+	 * to make sure the PHY clock is not gated by the hardware.
+	 */
+	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
+	reg |= LINKCTRL_FORCE_QACT;
+	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+
+	/* De-assert link reset */
+	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
+	reg &= ~CLKRST_LINK_SW_RST;
+	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
+
+	/* Set PHY POR High */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+	reg |= HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_POR_SEL;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+
+	/* Enable UTMI+ */
+	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
+	reg &= ~(UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP |
+		UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
+	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
+
+	/* set phy clock & control HS phy */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
+	reg |= HSPCTRL_EN_UTMISUSPEND | HSPCTRL_COMMONONN;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
+
+	fsleep(100);
+
+	/* Set VBUS Valid and DP-Pull up control by VBUS pad usage */
+	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
+	reg |= FIELD_PREP_CONST(LINKCTRL_BUS_FILTER_BYPASS, 0xf);
+	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+
+	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
+	reg |= EXYNOS2200_UTMI_FORCE_VBUSVALID | EXYNOS2200_UTMI_FORCE_BVALID;
+	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
+
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
+	reg |= HSPCTRL_VBUSVLDEXTSEL | HSPCTRL_VBUSVLDEXT;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPCTL);
+
+	/* Setting FSEL for refference clock */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
+	reg &= ~HSPPLLTUNE_FSEL;
+	switch (phy_drd->extrefclk) {
+	case EXYNOS5_FSEL_50MHZ:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 7);
+		break;
+	case EXYNOS5_FSEL_26MHZ:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 6);
+		break;
+	case EXYNOS5_FSEL_24MHZ:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 2);
+		break;
+	case EXYNOS5_FSEL_20MHZ:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 1);
+		break;
+	case EXYNOS5_FSEL_19MHZ2:
+		reg |= FIELD_PREP(HSPPLLTUNE_FSEL, 0);
+		break;
+	default:
+		dev_warn(phy_drd->dev, "unsupported ref clk: %#.2x\n",
+			 phy_drd->extrefclk);
+		break;
+	}
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSPPLLTUNE);
+
+	/* Enable PHY Power Mode */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
+	reg &= ~HSP_TEST_SIDDQ;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
+
+	/* before POR low, 10us delay is needed to Finish PHY reset */
+	fsleep(10);
+
+	/* Set PHY POR Low */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+	reg |= HSPCLKRST_PHY20_SW_POR_SEL;
+	reg &= ~(HSPCLKRST_PHY20_SW_POR | HSPCLKRST_PHY20_SW_PORTRESET);
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_CLKRST);
+
+	/* after POR low and delay 75us, PHYCLOCK is guaranteed. */
+	fsleep(75);
+
+	/* force pipe3 signal for link */
+	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
+	reg |= LINKCTRL_FORCE_PIPE_EN;
+	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
+	reg |= LINKCTRL_FORCE_RXELECIDLE;
+	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+}
+
+static void
+exynosautov920_usbdrd_hsphy_disable(struct exynos5_usbdrd_phy *phy_drd)
+{
+	u32 reg;
+	void __iomem *reg_phy = phy_drd->reg_phy;
+
+	/* set phy clock & control HS phy */
+	reg = readl(reg_phy + EXYNOS2200_DRD_UTMI);
+	reg |= UTMICTL_FORCE_UTMI_SUSPEND | UTMICTL_FORCE_UTMI_SLEEP;
+	reg &= ~(UTMICTL_FORCE_DPPULLDOWN | UTMICTL_FORCE_DMPULLDOWN);
+	writel(reg, reg_phy + EXYNOS2200_DRD_UTMI);
+
+	/* Disable PHY Power Mode */
+	reg = readl(reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
+	reg |= HSP_TEST_SIDDQ;
+	writel(reg, reg_phy + EXYNOSAUTOV920_DRD_HSP_TEST);
+
+	/* clear force q-channel */
+	reg = readl(reg_phy + EXYNOS850_DRD_LINKCTRL);
+	reg &= ~LINKCTRL_FORCE_QACT;
+	writel(reg, reg_phy + EXYNOS850_DRD_LINKCTRL);
+
+	/* link sw reset is need for USB_DP/DM high-z in host mode */
+	reg = readl(reg_phy + EXYNOS2200_DRD_CLKRST);
+	reg |= CLKRST_LINK_SW_RST;
+	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
+	fsleep(10);
+	reg &= ~CLKRST_LINK_SW_RST;
+	writel(reg, reg_phy + EXYNOS2200_DRD_CLKRST);
+}
+
 static int exynosautov920_usbdrd_phy_init(struct phy *phy)
 {
 	struct phy_usb_instance *inst = phy_get_drvdata(phy);
@@ -2103,6 +2259,29 @@ static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
 	return 0;
 }
 
+static int exynosautov920_usbdrd_combo_phy_exit(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret = 0;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		exynosautov920_usbdrd_hsphy_disable(phy_drd);
+
+		/* enable PHY isol when all USBs are powered off */
+		if (atomic_dec_and_test(&usage_count))
+			inst->phy_cfg->phy_isol(inst, true);
+	}
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
 static int exynosautov920_usbdrd_phy_power_on(struct phy *phy)
 {
 	int ret;
@@ -2154,6 +2333,36 @@ static const char * const exynosautov920_regulator_names[] = {
 	"avdd075_usb", "avdd18_usb20", "avdd33_usb20",
 };
 
+static const struct phy_ops exynosautov920_usbdrd_combo_hsphy_ops = {
+	.init		= exynosautov920_usbdrd_phy_init,
+	.exit		= exynosautov920_usbdrd_combo_phy_exit,
+	.power_on	= exynosautov920_usbdrd_phy_power_on,
+	.power_off	= exynosautov920_usbdrd_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static const struct
+exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynosautov920_usbdrd_utmi_init,
+	},
+};
+
+static const
+struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_combo_hsphy = {
+	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usbdrd_combo_hsphy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynosautov920_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynosautov920_regulator_names),
+};
+
 static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
 	.init		= exynosautov920_usbdrd_phy_init,
 	.exit		= exynosautov920_usbdrd_phy_exit,
@@ -2388,6 +2597,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos990-usbdrd-phy",
 		.data = &exynos990_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usbdrd-combo-hsphy",
+		.data = &exynosautov920_usbdrd_combo_hsphy
 	}, {
 		.compatible = "samsung,exynosautov920-usbdrd-phy",
 		.data = &exynosautov920_usbdrd_phy
-- 
2.34.1

