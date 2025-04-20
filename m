Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2071A8407
	for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Apr 2025 19:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745177358; cv=none; b=gPqV+gcJQOl76nhCcUfAw5AuXO740aWCnqQaadevoDeuDwSVej9lCH5G5BzmvfrFlgvgzZ99y/t6HFzsAZk7aG+jjtYqsU0Mths4gDlB8K6DLq8BmvXVJJh0uXLOu8+yE0b+NXyp2Su9l/Z63ckUiRIW77WTSlqRFqAxTqGgaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745177358; c=relaxed/simple;
	bh=EwXfegid+u0rfimMuzEv2fMKlM7NHYAdAaD9YvLtoeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LREmjtKx0MFuEpkxo8G5wy1j+HWmmO5H/R5y2C8au3q+MuXDVTEGS2HmRCxveNrppe03FYlFSrDpLP4viFBpZCJhkLl5eMux1v/V+7AdY/R5tBsYZXcprcnZthIHOvqd1JS5IfYhzLJOY5hb/Lv1Cpt57+N510rBBPmgtrv6VAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=PGBIyvIL; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="PGBIyvIL"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=PGBIyvILbohuCAWqhewyirZ6/1kG9gjQTvrRJgClORzU6fw/s6+Kw18RTM8iTnh4os4gjOejDlPs1F8IH+mlBjgSDCoAcshxqThKU3oOR8bZ0OZFxXSC9ul0C91tMjM84sc0DRkd7QLt75CQ6QDCYfXQVsEovA1OpoREWfHuhyEwzGQkkILJtlrsf6pDI3IbnR+eX3raXweGA3fLX/Jh9aYrQg1KrTxgamb8j1cRiy56SQNh5/1TR3oJZYH+B82keLvIOp0EQBpjVG9pI2+zIc0nviGpK2NIomvSx5f3wMergPN0I2/m3HgbPwZmjFKjkiUiYrqmg2BfgXPZKS5CIw==; s=purelymail3; d=purelymail.com; v=1; bh=EwXfegid+u0rfimMuzEv2fMKlM7NHYAdAaD9YvLtoeY=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1149203934;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 20 Apr 2025 19:28:46 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sun, 20 Apr 2025 21:28:22 +0200
Subject: [PATCH v2 2/2] phy: exynos5-usbdrd: Add support for the Exynos990
 usbdrd phy
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-usb-resends-april-v2-2-25dc7d2e6dd4@mentallysanemainliners.org>
References: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
In-Reply-To: <20250420-usb-resends-april-v2-0-25dc7d2e6dd4@mentallysanemainliners.org>
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
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745177319; l=3128;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=EwXfegid+u0rfimMuzEv2fMKlM7NHYAdAaD9YvLtoeY=;
 b=JlbNghL1+PYBIxXzPse73+kyh9UkqLqOxD7lCM4/ZvRIGZkEIQ9YzWpzhGBOPQhONcqzcmBSU
 2z73GgxFaajBEwg/5WdrZHz8Ld68NiUJPkTmNnVgVXinwRppeDb9JTD
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

The Exynos990 usbdrd PHY is a combo PHY which supports USB SS, HS and
DisplayPort outputs. This commit adds support only for UTMI+ (USB HS).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 32 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 634c4310c660a50e5d0869645506ab1b64fffd4b..9136752ab15f034059069b2607e47c5f72c04e2a 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1847,6 +1847,35 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_tuning exynos990_tunes_utmi_postinit[] = {
+	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
+			     (HSPPARACON_TXVREF |
+			      HSPPARACON_TXPREEMPAMP | HSPPARACON_SQRX |
+			      HSPPARACON_COMPDIS),
+			     (FIELD_PREP_CONST(HSPPARACON_TXVREF, 7) |
+			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPAMP, 3) |
+			      FIELD_PREP_CONST(HSPPARACON_SQRX, 5) |
+			      FIELD_PREP_CONST(HSPPARACON_COMPDIS, 7))),
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
+	[PTS_UTMI_POSTINIT] = exynos990_tunes_utmi_postinit,
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
+	.phy_cfg		= phy_cfg_exynos850,
+	.phy_ops		= &exynos850_usbdrd_phy_ops,
+	.phy_tunes		= exynos990_tunes,
+	.pmu_offset_usbdrd0_phy	= EXYNOS990_PHY_CTRL_USB20,
+	.clk_names		= exynos5_clk_names,
+	.n_clks			= ARRAY_SIZE(exynos5_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names	= exynos5_regulator_names,
+	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
+};
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -2047,6 +2076,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynos990-usbdrd-phy",
+		.data = &exynos990_usbdrd_phy
 	},
 	{ },
 };
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index cde299a85384a70d04dae49ee9a4e2daa88fbbf6..6a1f50c2a2942ea3d14fdc779feb2e3ecabc84ea 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -659,6 +659,9 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For Exynos990 */
+#define EXYNOS990_PHY_CTRL_USB20				(0x72C)
+
 /* For Tensor GS101 */
 #define GS101_SYSIP_DAT0					(0x810)
 #define GS101_SYSTEM_CONFIGURATION				(0x3A00)

-- 
2.47.2

