Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04BDC6379F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 08:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 383B422404
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 08:57:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KrCOI2hK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgKTI5P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Nov 2020 03:57:15 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44153 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbgKTI5O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 03:57:14 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201120085702euoutp022cbaf083c899b3e4f99efa68529f88b0~JK4wI1_4y2877128771euoutp02H
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Nov 2020 08:57:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201120085702euoutp022cbaf083c899b3e4f99efa68529f88b0~JK4wI1_4y2877128771euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1605862622;
        bh=ZS+TcsDMTikioff1ofG/0NpYP6i9Gsc1IYmWXwJtzkY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KrCOI2hKdSfdpahx5wH3w8b/iqO0hq2DXb2RkfSOF5v49EpTFsnjvIeIcTAykxapp
         iF0vQLQESFkTMjHLIbFnPf7qrkV5Wbt0NTjgS64WRKuIJKKOLrO76kCJGuvdyqJiqu
         5dorM668DPw6VXJgkA+lcO2TEnUb5WMcTn2XPpeo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201120085652eucas1p2b738064301085be407e528555b649ef1~JK4mgts1k0073800738eucas1p26;
        Fri, 20 Nov 2020 08:56:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 36.AA.44805.3D487BF5; Fri, 20
        Nov 2020 08:56:52 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201120085651eucas1p1d30223968745e93e6177892b400a7773~JK4mEDe332817128171eucas1p1X;
        Fri, 20 Nov 2020 08:56:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201120085651eusmtrp2a14ed03a55a42adf4435777a0aec8098~JK4mDBuoL2124121241eusmtrp2U;
        Fri, 20 Nov 2020 08:56:51 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-5a-5fb784d38a15
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 40.3E.21957.3D487BF5; Fri, 20
        Nov 2020 08:56:51 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201120085651eusmtip17a6b71fe12b45f00b76054cc711e7f09~JK4lh5eoK0135701357eusmtip1i;
        Fri, 20 Nov 2020 08:56:51 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH 1/2] phy: samsung: Add support for the Exynos5420 variant of
 the USB2 PHY
Date:   Fri, 20 Nov 2020 09:56:36 +0100
Message-Id: <20201120085637.7299-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120085637.7299-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsWy7djPc7pXWrbHGxz9x2qxccZ6VosLT3vY
        LM6f38BucXnXHDaLGef3MVmsPXKX3WL9tJ+sFofftLNa7Lxzgtni24lHjA5cHjtn3WX32LSq
        k82jb8sqRo/jN7YzeXzeJBfAGsVlk5Kak1mWWqRvl8CV8ev+acaC27oVO+YsYmpgvKbWxcjJ
        ISFgItH28itrFyMXh5DACkaJrt8LoZwvjBI/V3eyQDifGSVWrXzEBNPSvXMiM0RiOVBi4yUm
        uJZrN9YxglSxCRhKdL3tYgOxRQRUJT63LWAHsZkF/jNJ3NzACWILC0RL3Dr0B6yeBajm6sSZ
        YDW8AjYSVz5NYYHYJi+xesMBZhCbU8BWYsuky+wgyyQEVnJI/Pl8nxWiyEWi5c9zqAZhiVfH
        t7BD2DIS/3fOZ4JoaGaUeHhuLVR3D6PE5aYZjBBV1hJ3zv0COpUD6DxNifW79CHCjhJdPxtZ
        QMISAnwSN94KQjzAJzFp23RmiDCvREebEES1msSs4+vg1h68cIkZwvaQaN22lQ0SQBMYJc49
        esw+gVF+FsKyBYyMqxjFU0uLc9NTi43yUsv1ihNzi0vz0vWS83M3MQLTyOl/x7/sYFz+6qPe
        IUYmDsZDjBIczEoivGs1t8YL8aYkVlalFuXHF5XmpBYfYpTmYFES503asiZeSCA9sSQ1OzW1
        ILUIJsvEwSnVwFQZlFJ3Jk5z+oej1gbhD6aztAvesFGzEFu8X5rzfdbJDXeOCOrZGaYXTry7
        s/C70b318ot6LboFWKeuMHYsm1it13T02IoYT/ZDV/8mFBZqK8XevX+k/s1Tuaml3pwFHWdT
        P8/NnDZduWGdwoRbNndVd/C9F1RZtCRu43cujzsX9gYXzF7vJHXkvtSbov3/XB83rVYVNcnb
        oeqZM+ne+nlz3xz96RnXEXCTPWrxk8mvEnbZeSzwDN+wtqxXVbzzygz9cztswudsYhIUDAm0
        UtRoevV7Z/Kr0kd3Ji73dGlaGb8lgm/biV73N6nf/PedV+jUXJYge/cre5uH7haG/Tu31uyL
        SnrjPqlozwGehEVKLMUZiYZazEXFiQBw7EPHkgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsVy+t/xu7qXW7bHG3y4qmGxccZ6VosLT3vY
        LM6f38BucXnXHDaLGef3MVmsPXKX3WL9tJ+sFofftLNa7Lxzgtni24lHjA5cHjtn3WX32LSq
        k82jb8sqRo/jN7YzeXzeJBfAGqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSq
        pG9nk5Kak1mWWqRvl6CX8ev+acaC27oVO+YsYmpgvKbWxcjJISFgItG9cyJzFyMXh5DAUkaJ
        b9OOM0IkZCROTmtghbCFJf5c62KDKPrEKLFv6XqwIjYBQ4mutyAJTg4RAVWJz20L2EFsZoFW
        Zok/XVYgtrBApMSrGf/B6lmAaq5OnAlWwytgI3Hl0xQWiAXyEqs3HGAGsTkFbCW2TLoMViME
        VPPq+DrGCYx8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgSG9LZjPzfvYJz36qPeIUYm
        DsZDjBIczEoivGs1t8YL8aYkVlalFuXHF5XmpBYfYjQFumMis5Rocj4wqvJK4g3NDEwNTcws
        DUwtzYyVxHm3zl0TLySQnliSmp2aWpBaBNPHxMEp1cC0IcGOMU/2zLWKWyI25T/Tq9YpPl0R
        zx7/gX1y/8GptRtiVrBW87Pz6Ec+nnYo7orBrpS94U9zHskuSjt+PkRkx8H0Z9eeq6b0eJbP
        fhuibJ3aqlT0aqWpqLRRgWXU3wudUbwHe03jrpqKc8gxPrPZvzqI/9k+h/1G3jOnCCrdy5Gx
        jFCUTX3i0z03OX75OgNRBomi1G8uKmcjfu1/raTqy6rIy3K0PeVf19zcyze+sGsV7lhxOEv9
        V4BgnCdHyGZWc+Gmj83lkZ8mtkkoGu24azf1T1DxnyumMyIKXzQJ+khwfvqkd15dxXGf7gfG
        uuTmSvWunOVnJC/fELdf8kzdcpVxxcYitsXa217zKbEUZyQaajEXFScCAJcaCYXyAgAA
X-CMS-MailID: 20201120085651eucas1p1d30223968745e93e6177892b400a7773
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201120085651eucas1p1d30223968745e93e6177892b400a7773
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201120085651eucas1p1d30223968745e93e6177892b400a7773
References: <20201120085637.7299-1-m.szyprowski@samsung.com>
        <CGME20201120085651eucas1p1d30223968745e93e6177892b400a7773@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos5420 differs a bit from Exynos5250 in USB2 PHY related registers in
the PMU region. Add a variant for the Exynos5420 case. Till now, USB2 PHY
worked only because the bootloader enabled the PHY, but then driver messed
USB 3.0 DRD related registers during the suspend/resume cycle.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../devicetree/bindings/phy/samsung-phy.txt   |  1 +
 drivers/phy/samsung/Kconfig                   |  7 ++-
 drivers/phy/samsung/phy-exynos5250-usb2.c     | 48 +++++++++++++------
 drivers/phy/samsung/phy-samsung-usb2.c        |  6 +++
 drivers/phy/samsung/phy-samsung-usb2.h        |  1 +
 5 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 7510830a79bd..8f51aee91101 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -47,6 +47,7 @@ Required properties:
 	- "samsung,exynos4210-usb2-phy"
 	- "samsung,exynos4x12-usb2-phy"
 	- "samsung,exynos5250-usb2-phy"
+	- "samsung,exynos5420-usb2-phy"
 	- "samsung,s5pv210-usb2-phy"
 - reg : a list of registers used by phy driver
 	- first and obligatory is the location of phy modules registers
diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index e20d2fcc9fe7..0f51d3bf38cc 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -64,7 +64,12 @@ config PHY_EXYNOS4X12_USB2
 config PHY_EXYNOS5250_USB2
 	bool
 	depends on PHY_SAMSUNG_USB2
-	default SOC_EXYNOS5250 || SOC_EXYNOS5420
+	default SOC_EXYNOS5250
+
+config PHY_EXYNOS5420_USB2
+	bool
+	depends on PHY_SAMSUNG_USB2
+	default SOC_EXYNOS5420
 
 config PHY_S5PV210_USB2
 	bool "Support for S5PV210"
diff --git a/drivers/phy/samsung/phy-exynos5250-usb2.c b/drivers/phy/samsung/phy-exynos5250-usb2.c
index 4f53b711fd6f..e198010e1bfd 100644
--- a/drivers/phy/samsung/phy-exynos5250-usb2.c
+++ b/drivers/phy/samsung/phy-exynos5250-usb2.c
@@ -117,9 +117,9 @@
 
 /* Isolation, configured in the power management unit */
 #define EXYNOS_5250_USB_ISOL_OTG_OFFSET		0x704
-#define EXYNOS_5250_USB_ISOL_OTG		BIT(0)
 #define EXYNOS_5250_USB_ISOL_HOST_OFFSET	0x708
-#define EXYNOS_5250_USB_ISOL_HOST		BIT(0)
+#define EXYNOS_5420_USB_ISOL_HOST_OFFSET	0x70C
+#define EXYNOS_5250_USB_ISOL_ENABLE		BIT(0)
 
 /* Mode swtich register */
 #define EXYNOS_5250_MODE_SWITCH_OFFSET		0x230
@@ -132,7 +132,6 @@ enum exynos4x12_phy_id {
 	EXYNOS5250_HOST,
 	EXYNOS5250_HSIC0,
 	EXYNOS5250_HSIC1,
-	EXYNOS5250_NUM_PHYS,
 };
 
 /*
@@ -176,20 +175,19 @@ static void exynos5250_isol(struct samsung_usb2_phy_instance *inst, bool on)
 {
 	struct samsung_usb2_phy_driver *drv = inst->drv;
 	u32 offset;
-	u32 mask;
+	u32 mask = EXYNOS_5250_USB_ISOL_ENABLE;
 
-	switch (inst->cfg->id) {
-	case EXYNOS5250_DEVICE:
+	if (drv->cfg == &exynos5250_usb2_phy_config &&
+	    inst->cfg->id == EXYNOS5250_DEVICE)
 		offset = EXYNOS_5250_USB_ISOL_OTG_OFFSET;
-		mask = EXYNOS_5250_USB_ISOL_OTG;
-		break;
-	case EXYNOS5250_HOST:
+	else if (drv->cfg == &exynos5250_usb2_phy_config &&
+		 inst->cfg->id == EXYNOS5250_HOST)
 		offset = EXYNOS_5250_USB_ISOL_HOST_OFFSET;
-		mask = EXYNOS_5250_USB_ISOL_HOST;
-		break;
-	default:
+	else if (drv->cfg == &exynos5420_usb2_phy_config &&
+		 inst->cfg->id == EXYNOS5250_HOST)
+		offset = EXYNOS_5420_USB_ISOL_HOST_OFFSET;
+	else
 		return;
-	}
 
 	regmap_update_bits(drv->reg_pmu, offset, mask, on ? 0 : mask);
 }
@@ -390,9 +388,31 @@ static const struct samsung_usb2_common_phy exynos5250_phys[] = {
 	},
 };
 
+static const struct samsung_usb2_common_phy exynos5420_phys[] = {
+	{
+		.label		= "host",
+		.id		= EXYNOS5250_HOST,
+		.power_on	= exynos5250_power_on,
+		.power_off	= exynos5250_power_off,
+	},
+	{
+		.label		= "hsic",
+		.id		= EXYNOS5250_HSIC0,
+		.power_on	= exynos5250_power_on,
+		.power_off	= exynos5250_power_off,
+	},
+};
+
 const struct samsung_usb2_phy_config exynos5250_usb2_phy_config = {
 	.has_mode_switch	= 1,
-	.num_phys		= EXYNOS5250_NUM_PHYS,
+	.num_phys		= ARRAY_SIZE(exynos5250_phys),
 	.phys			= exynos5250_phys,
 	.rate_to_clk		= exynos5250_rate_to_clk,
 };
+
+const struct samsung_usb2_phy_config exynos5420_usb2_phy_config = {
+	.has_mode_switch	= 1,
+	.num_phys		= ARRAY_SIZE(exynos5420_phys),
+	.phys			= exynos5420_phys,
+	.rate_to_clk		= exynos5250_rate_to_clk,
+};
diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
index f79f605cff79..3908153f2ce5 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.c
+++ b/drivers/phy/samsung/phy-samsung-usb2.c
@@ -128,6 +128,12 @@ static const struct of_device_id samsung_usb2_phy_of_match[] = {
 		.data = &exynos5250_usb2_phy_config,
 	},
 #endif
+#ifdef CONFIG_PHY_EXYNOS5420_USB2
+	{
+		.compatible = "samsung,exynos5420-usb2-phy",
+		.data = &exynos5420_usb2_phy_config,
+	},
+#endif
 #ifdef CONFIG_PHY_S5PV210_USB2
 	{
 		.compatible = "samsung,s5pv210-usb2-phy",
diff --git a/drivers/phy/samsung/phy-samsung-usb2.h b/drivers/phy/samsung/phy-samsung-usb2.h
index 77fb23bc218f..ebaf43bfc5a2 100644
--- a/drivers/phy/samsung/phy-samsung-usb2.h
+++ b/drivers/phy/samsung/phy-samsung-usb2.h
@@ -66,5 +66,6 @@ extern const struct samsung_usb2_phy_config exynos3250_usb2_phy_config;
 extern const struct samsung_usb2_phy_config exynos4210_usb2_phy_config;
 extern const struct samsung_usb2_phy_config exynos4x12_usb2_phy_config;
 extern const struct samsung_usb2_phy_config exynos5250_usb2_phy_config;
+extern const struct samsung_usb2_phy_config exynos5420_usb2_phy_config;
 extern const struct samsung_usb2_phy_config s5pv210_usb2_phy_config;
 #endif
-- 
2.17.1

