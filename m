Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44994973B8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727576; cv=none; b=raRSAprh43oKfzf/HCTKOuudxwpn6Mle7SaHaanQieiqROrySdQi1rGoQymuafc1+aDKeI73iHvZPYVSo1oQOt3tLtVu3yszvUApzEtKYtYgMMnqyp/L4TiSNoLDzijikrDrI0yKqs+GhSofcPcdqCN/2r/wPl6JMiuBh4nmfac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727576; c=relaxed/simple;
	bh=aBbgqH7iUq0TjB4Ev/jowkIaT+djFNlSXLBGCQgd3oc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=Ls+AoI2HYdBOarzkegeJrmPhQvQ7gPpWhfxwYOVJZaj6eSoZdPQ8hE974WBkEhKl13cMShPaOC6Q/2sD/9LtD/E1KHCLTZHcwVxB0NvGNoSxY24aAYPl8KhbHVjzARh1naiJZmacTq3XQjBiHtOcWl4e6m9EvxqT19hfIqmV4w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SPcxMw5W; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SPcxMw5W"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260918103251epoutp04b51ebc9d562c486f735b2d88e79cc540~WY75nf6sb2744827448epoutp04Q
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 10:32:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260918103251epoutp04b51ebc9d562c486f735b2d88e79cc540~WY75nf6sb2744827448epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789727571;
	bh=G/fO5FlRuEocHNQCmGx71FcmWAbH2HBbMkGQ6JIB1n0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=SPcxMw5Wj2fUsgclY0yoANRSZ/kKgABR9Eo7W1UEkrf0wbY5NJ3thqoAzBxXHWus8
	 0lo6eE2UKl2INlHUG+1Tk4x2VjsK4SYn9I2Hhm1t1lIckVvSKK/DZGilqPQEZAkj3t
	 otCuc5JQ7dLDWLP5NLyvSGo+p/Vck+W+PKO6Jo80=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260918103250epcas5p12ea5e88ac36103898712ab45eeedd8cf~WY75Fn9oV2545625456epcas5p1n;
	Fri, 18 Sep 2026 10:32:50 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hmTTs67L8z6B9m8; Fri, 18 Sep
	2026 10:32:49 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6~WY73wwcaF2951229512epcas5p4l;
	Fri, 18 Sep 2026 10:32:49 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260918103246epsmtip21d5c7565d73ad5927a1fd761e7fb625e~WY70toq-q0288802888epsmtip2s;
	Fri, 18 Sep 2026 10:32:45 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
	krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	pritam.sutar@samsung.com, andre.draszik@linaro.org, kernel@lvkasz.us,
	pengpeng@iscas.ac.cn, selvarasu.g@samsung.com,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v2] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent
 OOB access
Date: Fri, 18 Sep 2026 16:01:47 +0530
Message-Id: <20260918103147.2628614-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6
References: <CGME20260918103249epcas5p49c9b4bf6fd60c28f5f09f0b7b69828b6@epcas5p4.samsung.com>

The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
creating both UTMI and PIPE3 PHY instances regardless of the SoC
capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
and ExynosAutoV920) provide phy_cfg arrays containing only a single
element.

On these SoCs, when the loop reaches index 1, the driver reads past the
end of the rodata array, populating the second PHY instance with garbage
data. Since the configuration structure contains critical function
pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.

Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
store the actual size of the phy_cfg array for each SoC. Update the
probe loop and the xlate function to bound their access against this
value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.

Assisted-by: LLM
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---

Changes in V2:
- Updated 'Assisted-by' tag to follow the proper kernel documentation
  format.
- Link to v1:
  https://lore.kernel.org/all/20260831070309.158069-1-selvarasu.g@samsung.com/
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 087d552eb511..f10cf7b6e0aa 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -477,6 +477,7 @@ struct exynos5_usbdrd_phy_config {
 
 struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
+	int n_phy_cfg;
 	const struct exynos5_usbdrd_phy_tuning **phy_tunes;
 	const struct phy_ops *phy_ops;
 	const char * const *clk_names;
@@ -1173,7 +1174,7 @@ static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
 {
 	struct exynos5_usbdrd_phy *phy_drd = dev_get_drvdata(dev);
 
-	if (WARN_ON(args->args[0] >= EXYNOS5_DRDPHYS_NUM))
+	if (WARN_ON(args->args[0] >= phy_drd->drv_data->n_phy_cfg))
 		return ERR_PTR(-ENODEV);
 
 	return phy_drd->phys[args->args[0]].phy;
@@ -2021,6 +2022,7 @@ static const char * const exynos5_regulator_names[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
 	.phy_cfg		= phy_cfg_exynos2200,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos2200),
 	.phy_ops		= &exynos2200_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS2200_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2034,6 +2036,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5420_USBDRD1_PHY_CONTROL,
@@ -2047,6 +2050,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2059,6 +2063,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5433_USBHOST30_PHY_CONTROL,
@@ -2072,6 +2077,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2084,6 +2090,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos7870,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos7870),
 	.phy_tunes		= exynos7870_tunes,
 	.phy_ops		= &exynos7870_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
@@ -2097,6 +2104,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2125,6 +2133,7 @@ static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.phy_tunes		= exynos990_tunes,
 	.pmu_offset_usbdrd0_phy	= EXYNOS990_PHY_CTRL_USB20,
@@ -2661,6 +2670,7 @@ static const struct phy_ops exynosautov920_usb31drd_combo_ssphy_ops = {
 static const
 struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_combo_ssphy = {
 	.phy_cfg		= usb31drd_phy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(usb31drd_phy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usb31drd_combo_ssphy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB31,
 	.clk_names		= exynos5_clk_names,
@@ -2691,6 +2701,7 @@ exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
 static const
 struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_combo_hsphy = {
 	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(usbdrd_hsphy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usbdrd_combo_hsphy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2719,6 +2730,7 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2895,6 +2907,7 @@ static const char * const gs101_regulator_names[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata gs101_usbd31rd_phy = {
 	.phy_cfg			= phy_cfg_gs101,
+	.n_phy_cfg			= ARRAY_SIZE(phy_cfg_gs101),
 	.phy_tunes			= gs101_tunes,
 	.phy_ops			= &gs101_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy		= GS101_PHY_CTRL_USB20,
@@ -3052,7 +3065,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
 
-	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
+	for (i = 0; i < drv_data->n_phy_cfg; i++) {
 		struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
 
 		if (IS_ERR(phy))
-- 
2.17.1

