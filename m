Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C02FB607
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981838; cv=none; b=EeJDecB1XrgHnlJLrlOgMkWLvbQS8blUBvlvD+XJtyu0/z3ZZxCQ6qV3/JaJE4u5rx9vbivwPGsdCee632RGfw9LC9DMDyu7CAlKKHK1KDP0NSaCeuxpftWPDKWtDgNlRMchsYA7AlVKXUcRnZ9KWN5xmQDhXjM2hFPSSV7DF1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981838; c=relaxed/simple;
	bh=XqZM/KQsdfO3rolG8RfG1j5nWIq/V2ytJ2pdiSfU1L0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=LPFTiVrZLe4jhjALYAVcjBGMqD7HJOul0HHflLKvEtz0QvGtbEQP1Gw2tMoP60iRGVpzs+D7ubCfl6J8CHVnyb1ITXLL/zpvKBtMlGhJFEhOhHGIYd4STW54qy2n2lxOYAFrxxmuVIyn1T5huIWdVPbkGs1pSIAZHT1ftzosiBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XQJxjHt2; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XQJxjHt2"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251124105714epoutp034764492584970f34f9bd2e493cb55a7a~67CH94p_e2773327733epoutp03D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:57:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251124105714epoutp034764492584970f34f9bd2e493cb55a7a~67CH94p_e2773327733epoutp03D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763981834;
	bh=j5xDF7/ZDYe+564XyaggT3JcBXJ3ZGQspQYKnmEL6u0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XQJxjHt2cfK0kstRYACLw0PT2vZPl7aILVtD4ApRub7M80dTaJGf0+IaLo8jBDtGc
	 Dym03VmFFlZngHsd5C6NI3UbSKbo+pmGxfankjZXay++KsYd56TnqLjIMz/ZhSMjii
	 aDp9MLoQF80XEU2u0wYGO/tyO9ftxjOH9E34hIsY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251124105713epcas5p24da27bebcc49e9940f51d3c74a9a650b~67CGzc0v-0160201602epcas5p2L;
	Mon, 24 Nov 2025 10:57:13 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dFN7X4HzTz6B9m5; Mon, 24 Nov
	2025 10:57:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251124105711epcas5p244ca87a6ea6ab6d170d10c1f19ccd405~67CFHQZXQ0969809698epcas5p2T;
	Mon, 24 Nov 2025 10:57:11 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251124105702epsmtip27af0e39c362b2cb2f383e57e7ebd456b~67B8NmoQg1792217922epsmtip2G;
	Mon, 24 Nov 2025 10:57:01 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	johan@kernel.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v10 2/6] phy: exynos5-usbdrd: support HS phy for
 ExynosAutov920
Date: Mon, 24 Nov 2025 16:34:49 +0530
Message-Id: <20251124110453.2887437-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251124110453.2887437-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251124105711epcas5p244ca87a6ea6ab6d170d10c1f19ccd405
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251124105711epcas5p244ca87a6ea6ab6d170d10c1f19ccd405
References: <20251124110453.2887437-1-pritam.sutar@samsung.com>
	<CGME20251124105711epcas5p244ca87a6ea6ab6d170d10c1f19ccd405@epcas5p2.samsung.com>

Enable UTMI+ phy support for this SoC which is very similar to what
the existing Exynos850 supports.

Add required change in phy driver to support HS phy for this SoC.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 123 ++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |   2 +
 2 files changed, 125 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 1c8bf80119f1..7416d2e1e358 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -2054,6 +2054,126 @@ static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static int exynosautov920_usbdrd_phy_init(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/* Bypass PHY isol */
+	inst->phy_cfg->phy_isol(inst, false);
+
+	/* UTMI or PIPE3 specific init */
+	inst->phy_cfg->phy_init(phy_drd);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	exynos850_usbdrd_phy_exit(phy);
+
+	/* enable PHY isol */
+	inst->phy_cfg->phy_isol(inst, true);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static int exynosautov920_usbdrd_phy_power_on(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	dev_dbg(phy_drd->dev, "Request to power_on usbdrd_phy phy\n");
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_core_clks,
+				      phy_drd->core_clks);
+	if (ret)
+		return ret;
+
+	/* Enable supply */
+	ret = regulator_bulk_enable(phy_drd->drv_data->n_regulators,
+				    phy_drd->regulators);
+	if (ret) {
+		dev_err(phy_drd->dev, "Failed to enable PHY regulator(s)\n");
+		goto fail_supply;
+	}
+
+	return 0;
+
+fail_supply:
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
+				   phy_drd->core_clks);
+
+	return ret;
+}
+
+static int exynosautov920_usbdrd_phy_power_off(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+
+	dev_dbg(phy_drd->dev, "Request to power_off usbdrd_phy phy\n");
+
+	/* Disable supply */
+	regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+			       phy_drd->regulators);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_core_clks,
+				   phy_drd->core_clks);
+
+	return 0;
+}
+
+static const char * const exynosautov920_usb20_regulators[] = {
+	"dvdd", "vdd18", "vdd33",
+};
+
+static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
+	.init		= exynosautov920_usbdrd_phy_init,
+	.exit		= exynosautov920_usbdrd_phy_exit,
+	.power_on       = exynosautov920_usbdrd_phy_power_on,
+	.power_off      = exynosautov920_usbdrd_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynos850_usbdrd_utmi_init,
+	},
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynosautov920_usb20_regulators,
+	.n_regulators		= ARRAY_SIZE(exynosautov920_usb20_regulators),
+};
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -2260,6 +2380,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos990-usbdrd-phy",
 		.data = &exynos990_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usbdrd-phy",
+		.data = &exynosautov920_usbdrd_phy
 	},
 	{ },
 };
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 532c6c2d1195..ab4d8be0e073 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -1015,4 +1015,6 @@
 #define GS101_GRP2_INTR_BID_UPEND				(0x0208)
 #define GS101_GRP2_INTR_BID_CLEAR				(0x020c)
 
+/* exynosautov920 */
+#define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
-- 
2.34.1

