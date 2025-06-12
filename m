Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A632989B5;
	Thu, 12 Jun 2025 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741016; cv=none; b=rBoIyJf+Pkl1YhrzSgPCocW02VWzqTwwEwcHLrQTvU6aNpeAk0ciMRdmdKv/UvOg8NIXzGNmhGBsoVAZJHj85CN3H2veYcJpuMZ5L0xgWloGQOjOCWDDOT2ezrtAQ8Z6V7jy32LYp8vR1niPDOSyTkSntiJVO/4SHw16Omx6vIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741016; c=relaxed/simple;
	bh=ZBf5elUyhBLG4hiQ5P/eKSJ7k0IszZpiLUbpxTJh6Sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xhrb3KxKCTL3rXmt9sB6U6KOFt0jtxpX+767tY2r2tlSOmUxG5DodVPfK4Z5MBSpfjIJSRdU/4vO9R3ep4hQ6wiXVlT8bBl5yVoaptL+QhhxVMbTxgtHJJU5HM3HZLIgyjfTQhKoMYutBM6HlhWYIBhfBeaRPEK/Q3D4gxGFCkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=VJ//WEXo; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="VJ//WEXo"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8F02C25FB2;
	Thu, 12 Jun 2025 17:10:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJ1Bprx92anx; Thu, 12 Jun 2025 17:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741011; bh=ZBf5elUyhBLG4hiQ5P/eKSJ7k0IszZpiLUbpxTJh6Sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VJ//WEXoj5tcbY6u8jcO4SiNyrxXIh70qSxzK5lO9WwYES8a/PyEkhjOOsX1tvIWd
	 gy5kIx3qo5V1ZaMWwItCReEuGLmaNfXMqODhec28RaThJwgxvjZxYPnKIxskNa3buk
	 jC0BxMxb/oHy/xK7YUcc/7iO5wOG0FwGkRmlY44qX5PIjo8VTfxo6y4z+syicSVyVU
	 PVzh0capKDSXB2l47OTLiL7rQGXQXAJ7xrioQzEunJ/fJ46rOUoLrqt6hVAagg9cpR
	 mFwif402Y9t5+RS127rMIVQav27r8Bban5zk3L0M1j71Au9jIfjzN11j++TumXI44L
	 mSD3no75ED78Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:39:30 +0530
Subject: [PATCH 2/2] phy: exynos-mipi-video: introduce support for
 exynos7870
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-mipi-phy-v1-2-3fff0b62d9d3@disroot.org>
References: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
In-Reply-To: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740994; l=3417;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ZBf5elUyhBLG4hiQ5P/eKSJ7k0IszZpiLUbpxTJh6Sg=;
 b=Z6Xp4WEDseNWyIADRgljEU9FgbZ0ED9ByLA7aPhS8sodMygivmbuAE+5yMrlFX5hdZe6jkNoZ
 HTap08GpmE9BJKrbSBCuWgN+iOx4RHJ7GSvrK7//L2zRCdHtmD8o+YX
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add support for Exynos7870 in the existing MIPI CSIS/DSIM driver. The
SoC has one DSIM phy and three CSIS phys.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/phy/samsung/phy-exynos-mipi-video.c | 52 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 +++
 2 files changed, 57 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index f6756a609a9a0774ecb6e27cf96726891683636c..b184923b9b400f0d536a913bdf32f3156c0a1854 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -213,6 +213,55 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
 	},
 };
 
+static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
+	.num_regmaps = 3,
+	.regmap_names = {
+		"samsung,pmu-syscon",
+		"samsung,disp-sysreg",
+		"samsung,cam-sysreg"
+	},
+	.num_phys = 4,
+	.phys = {
+		{
+			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
+			.enable_val = EXYNOS4_PHY_ENABLE,
+			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(0),
+			.resetn_reg = 0,
+			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
+			.enable_val = EXYNOS4_PHY_ENABLE,
+			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(0),
+			.resetn_reg = 0,
+			.resetn_map = EXYNOS_MIPI_REGMAP_DISP,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
+			.enable_val = EXYNOS4_PHY_ENABLE,
+			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL1,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(1),
+			.resetn_reg = 0,
+			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_CSIS2 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
+			.enable_val = EXYNOS4_PHY_ENABLE,
+			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL2,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(2),
+			.resetn_reg = 0,
+			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
+		},
+	},
+};
+
 struct exynos_mipi_video_phy {
 	struct regmap *regmaps[EXYNOS_MIPI_REGMAPS_NUM];
 	int num_phys;
@@ -351,6 +400,9 @@ static const struct of_device_id exynos_mipi_video_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos5433-mipi-video-phy",
 		.data = &exynos5433_mipi_phy,
+	}, {
+		.compatible = "samsung,exynos7870-mipi-video-phy",
+		.data = &exynos7870_mipi_phy,
 	},
 	{ /* sentinel */ },
 };
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 1a2c0e0838f99821151661878f022f2129a0c19b..8fd59994bca76a6bf21306337f0b47ccb5a22adc 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -662,6 +662,11 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For Exynos7870 */
+#define EXYNOS7870_MIPI_PHY_CONTROL0				(0x070c)
+#define EXYNOS7870_MIPI_PHY_CONTROL1				(0x0714)
+#define EXYNOS7870_MIPI_PHY_CONTROL2				(0x0734)
+
 /* For Tensor GS101 */
 /* PMU ALIVE */
 #define GS101_SYSIP_DAT0					(0x810)

-- 
2.49.0

