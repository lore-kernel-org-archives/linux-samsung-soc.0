Return-Path: <SRS0=/9gS=DK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6EAC41604
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 22:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BB1E206B6
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 22:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgJCWu2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 3 Oct 2020 18:50:28 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:34522 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgJCWu2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 3 Oct 2020 18:50:28 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4C3hsD5LfSz1qs3t;
        Sun,  4 Oct 2020 00:50:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4C3hsD44kyz1qy6R;
        Sun,  4 Oct 2020 00:50:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id vFcNXQFwUaIF; Sun,  4 Oct 2020 00:50:22 +0200 (CEST)
X-Auth-Info: rBmzivWnzWNIJHJiK4FX/DfzXNzYDmve1ZhXiNaeQx8=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sun,  4 Oct 2020 00:50:22 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] phy: exynos-mipi-video: Add support for NXP i.MX8MM
Date:   Sun,  4 Oct 2020 00:50:19 +0200
Message-Id: <20201003225020.164358-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch adds support for MIPI DPHY found in NXP i.MX8MM.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/phy/samsung-phy.txt   |  7 ++++---
 drivers/phy/samsung/Kconfig                   |  6 +++---
 drivers/phy/samsung/phy-exynos-mipi-video.c   | 21 +++++++++++++++++++
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 7510830a79bd..7b9dc361ab0c 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -1,14 +1,15 @@
-Samsung S5P/Exynos SoC series MIPI CSIS/DSIM DPHY
--------------------------------------------------
+Samsung S5P/Exynos and NXP i.MX8MM SoC series MIPI CSIS/DSIM DPHY
+-----------------------------------------------------------------
 
 Required properties:
 - compatible : should be one of the listed compatibles:
 	- "samsung,s5pv210-mipi-video-phy"
 	- "samsung,exynos5420-mipi-video-phy"
 	- "samsung,exynos5433-mipi-video-phy"
+	- "fsl,imx8mm-mipi-video-phy"
 - #phy-cells : from the generic phy bindings, must be 1;
 
-In case of s5pv210 and exynos5420 compatible PHYs:
+In case of s5pv210, exynos5420, imx8mm compatible PHYs:
 - syscon - phandle to the PMU system controller
 
 In case of exynos5433 compatible PHY:
diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index e20d2fcc9fe7..342b75f6e4f6 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -12,14 +12,14 @@ config PHY_EXYNOS_DP_VIDEO
 	  Support for Display Port PHY found on Samsung Exynos SoCs.
 
 config PHY_EXYNOS_MIPI_VIDEO
-	tristate "S5P/Exynos SoC series MIPI CSI-2/DSI PHY driver"
+	tristate "S5P/Exynos/i.MX8MM SoC series MIPI CSI-2/DSI PHY driver"
 	depends on HAS_IOMEM
-	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
+	depends on ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MXC || COMPILE_TEST
 	select GENERIC_PHY
 	default y if ARCH_S5PV210 || ARCH_EXYNOS
 	help
 	  Support for MIPI CSI-2 and MIPI DSI DPHY found on Samsung S5P
-	  and Exynos SoCs.
+	  and Exynos SoCs, and on NXP i.MX8MM SoCs.
 
 config PHY_EXYNOS_PCIE
 	bool "Exynos PCIe PHY driver"
diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index c1df1ef3ee3c..b735b8089cd7 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -214,6 +214,24 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
 	},
 };
 
+static const struct mipi_phy_device_desc imx8mm_mipi_phy = {
+	.num_regmaps = 1,
+	.regmap_names = {"syscon"},
+	.num_phys = 1,
+	.phys = {
+		{
+			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
+			.enable_val = BIT(17),
+			.enable_reg = 8,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(5),
+			.resetn_reg = 0,
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		},
+	},
+};
+
 struct exynos_mipi_video_phy {
 	struct regmap *regmaps[EXYNOS_MIPI_REGMAPS_NUM];
 	int num_phys;
@@ -349,6 +367,9 @@ static const struct of_device_id exynos_mipi_video_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos5433-mipi-video-phy",
 		.data = &exynos5433_mipi_phy,
+	}, {
+		.compatible = "fsl,imx8mm-mipi-video-phy",
+		.data = &imx8mm_mipi_phy,
 	},
 	{ /* sentinel */ },
 };
-- 
2.28.0

