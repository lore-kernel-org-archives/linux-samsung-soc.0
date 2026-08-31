Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3103C3425
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Aug 2026 07:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159844; cv=none; b=Dv1tX6AG8PnKARI1qGEOtR8mJxi8+wClTrZEYdULu9pdnxKXUpWBvVhmw3bwTUdK7x5fShSTjwKlJR9+Ru8pUynvV+YUYr28NHf8lym9G572zBYO/Udc9ojkS67rAI8TDIUbmAH/iuFxu6OJx61O9nxqKjI7sond92n4KJssO5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159844; c=relaxed/simple;
	bh=pcMWMmjLnn8DUrHK9s+VZ8ZoC360Bv0DvW4lp2EBBg8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=fch7DdQNuxVF6CqIcZZ8br+PaB6hbLoSrosvq/2mixWJETVMOgOWM8snkmHnRup6+kP6qxIO/TbC4BAvoMCX0AV1xFUAmEGkKR9Qbh0fyRCEaATJ0OcM6ZkMBOFAFWLmDumvGRpJLtf5GyYQMEhjGfuIlM5/YWhZ0ltz6RDZnYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HpEkP/DH; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HpEkP/DH"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260831070352epoutp029a1b37003742d10771b141bbbab4fb1c~Q0eTSQNqo2913929139epoutp02D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Aug 2026 07:03:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260831070352epoutp029a1b37003742d10771b141bbbab4fb1c~Q0eTSQNqo2913929139epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788159832;
	bh=Dgb1ngpCR4vwZb6TG7VDqdD3XYLGgbrQsP5sDw19djY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=HpEkP/DH2n3xOOnopyTG0qva57RbDbJxtyXz9+oOxmY8Iyh9gDXTw3bAC7n8LAUDg
	 DAqiynEYOZ3p/3o9xt4zC6d/NleFHw0K9c4qxtESdhu5WwJaCu6qIyOZZj6BxRGyPE
	 rh2L8c8kc0EvfNz9jnqg5UZp/OCp4ph4RV4lnZAo=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260831070351epcas5p46018d94a0c2ca993ee8680a5e0628591~Q0eSQ4KUS1551015510epcas5p4m;
	Mon, 31 Aug 2026 07:03:51 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4hYKj24Kvvz3hhT4; Mon, 31 Aug
	2026 07:03:50 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0~Q0eQsfTZ_1106911069epcas5p4l;
	Mon, 31 Aug 2026 07:03:49 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260831070346epsmtip1c4aeecb2495ffbcfc6ef1ee7dbfb8368~Q0eNxrS9g0914309143epsmtip1D;
	Mon, 31 Aug 2026 07:03:46 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, pritam.sutar@samsung.com,
	andre.draszik@linaro.org, kernel@lvkasz.us, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com, Selvarasu Ganesan
	<selvarasu.g@samsung.com>
Subject: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent
 OOB access
Date: Mon, 31 Aug 2026 12:33:09 +0530
Message-Id: <20260831070309.158069-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

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

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 8711a3b62c8e..311d1c25eb3e 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -477,6 +477,7 @@ struct exynos5_usbdrd_phy_config {
 
 struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
+	int n_phy_cfg;
 	const struct exynos5_usbdrd_phy_tuning **phy_tunes;
 	const struct phy_ops *phy_ops;
 	const char * const *clk_names;
@@ -1164,7 +1165,7 @@ static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
 {
 	struct exynos5_usbdrd_phy *phy_drd = dev_get_drvdata(dev);
 
-	if (WARN_ON(args->args[0] >= EXYNOS5_DRDPHYS_NUM))
+	if (WARN_ON(args->args[0] >= phy_drd->drv_data->n_phy_cfg))
 		return ERR_PTR(-ENODEV);
 
 	return phy_drd->phys[args->args[0]].phy;
@@ -1993,6 +1994,7 @@ static const char * const exynos5_regulator_names[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
 	.phy_cfg		= phy_cfg_exynos2200,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos2200),
 	.phy_ops		= &exynos2200_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS2200_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2006,6 +2008,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5420_USBDRD1_PHY_CONTROL,
@@ -2019,6 +2022,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2031,6 +2035,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.pmu_offset_usbdrd1_phy	= EXYNOS5433_USBHOST30_PHY_CONTROL,
@@ -2044,6 +2049,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos5),
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2056,6 +2062,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos7870,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos7870),
 	.phy_tunes		= exynos7870_tunes,
 	.phy_ops		= &exynos7870_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
@@ -2069,6 +2076,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOS5_USBDRD_PHY_CONTROL,
 	.clk_names		= exynos5_clk_names,
@@ -2097,6 +2105,7 @@ static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos850,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),
 	.phy_ops		= &exynos850_usbdrd_phy_ops,
 	.phy_tunes		= exynos990_tunes,
 	.pmu_offset_usbdrd0_phy	= EXYNOS990_PHY_CTRL_USB20,
@@ -2629,6 +2638,7 @@ static const struct phy_ops exynosautov920_usb31drd_combo_ssphy_ops = {
 static const
 struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_combo_ssphy = {
 	.phy_cfg		= usb31drd_phy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(usb31drd_phy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usb31drd_combo_ssphy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB31,
 	.clk_names		= exynos5_clk_names,
@@ -2659,6 +2669,7 @@ exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
 static const
 struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_combo_hsphy = {
 	.phy_cfg		= usbdrd_hsphy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(usbdrd_hsphy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usbdrd_combo_hsphy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2687,6 +2698,7 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynosautov920,
+	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynosautov920),
 	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy	= EXYNOSAUTOV920_PHY_CTRL_USB20,
 	.clk_names		= exynos5_clk_names,
@@ -2863,6 +2875,7 @@ static const char * const gs101_regulator_names[] = {
 
 static const struct exynos5_usbdrd_phy_drvdata gs101_usbd31rd_phy = {
 	.phy_cfg			= phy_cfg_gs101,
+	.n_phy_cfg			= ARRAY_SIZE(phy_cfg_gs101),
 	.phy_tunes			= gs101_tunes,
 	.phy_ops			= &gs101_usbdrd_phy_ops,
 	.pmu_offset_usbdrd0_phy		= GS101_PHY_CTRL_USB20,
@@ -3020,7 +3033,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 
 	dev_vdbg(dev, "Creating usbdrd_phy phy\n");
 
-	for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
+	for (i = 0; i < drv_data->n_phy_cfg; i++) {
 		struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
 
 		if (IS_ERR(phy))
-- 
2.17.1

