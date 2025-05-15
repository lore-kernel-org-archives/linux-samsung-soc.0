Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B31F4CBE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320228; cv=none; b=oLHmQ7QvrVF7NGE5w1aijHJtKm5ZX31+5U85FYMFn6SGIXiXKenrdO43m1G1aCnQBzC2xQO1o/Gms0w5mNfPhfpuYw7WdQacz5gnYHaDKE5rH71JVuS6uXNaemHAk6wYVkoT7Z7+SfixR2AihVfabyn56DV+Gl2sAC4fKalkp44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320228; c=relaxed/simple;
	bh=WVPCoGGyfPmMmWEeShsNZG/xt1N7me7E3wbQwMdON+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yn/MrJ+Ds8UHdcikoM7bMdQZNtKMWIbwiwHlBJqawVRI3XO1Nka/ACd/EVOrtZV2fJEuFR6yFgYXSOmik9Sv23pfcuDfJ2ud2LGcs5IaSUHxbj1XStufyxH3T5doDeus6C3pJddtJEj02HZ6LpUzJuCcsChXFrxAksiEgMt6WIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=p3S5oL+l; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="p3S5oL+l"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=p3S5oL+l/Cpv09A2UkCSL/Lz/Q3hRzM3CDYT2Ts3UPEdsD0+kNqmoumyQQXTPZDWLrhdruTrKzEjehFfU5iQwG3NdQtKizno3k8CHX/Ab/wDrvOd7vQcXZ/w1Z/lXZamBwEKTYKMwqspY9IcRNwmD/E9Xk8uDRsMVrFwL1OzN8iUt7oW1//B6WIgsuifGdjNDfZE1vHjq0H4LOwvuuZMHaKtDuiqGtjB/t8RPixIDsHfVT2ioVRWzfPwIQ32UCJ+tjXMMQSDjcBfcfIj0uA+zzawepw7doh+dqy3peqta6aHXluepT6J0PGioidfm7oZRW34aGx+Ii/djOnvyUewgQ==; s=purelymail1; d=purelymail.com; v=1; bh=WVPCoGGyfPmMmWEeShsNZG/xt1N7me7E3wbQwMdON+Q=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1985443548;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 15 May 2025 14:43:11 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Thu, 15 May 2025 16:43:02 +0200
Subject: [PATCH v3 2/2] phy: exynos5-usbdrd: Add support for the Exynos990
 usbdrd phy
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-usb-resends-may-15-v3-2-ad33a85b6cee@mentallysanemainliners.org>
References: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
In-Reply-To: <20250515-usb-resends-may-15-v3-0-ad33a85b6cee@mentallysanemainliners.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747320182; l=3097;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=WVPCoGGyfPmMmWEeShsNZG/xt1N7me7E3wbQwMdON+Q=;
 b=Yz61+U+8P1tH3DzDCZgtCDCblx9usfa2Uyd5GUgxBLzmBXPk5GjHxcULalzJyOqd7m55pZsWt
 R29Pnv8SWwlCVsVL87dJ1Y+famYNT4y0zVNrFqg4Tuve7OQ/sHBQctS
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
index 917a76d584f0856f1e445630e2cf97b3c3e46b13..dd660ebe80458a13413ca9735339b4e1095af8ea 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -2025,6 +2025,35 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
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
@@ -2228,6 +2257,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
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
index 1a2c0e0838f99821151661878f022f2129a0c19b..7754697e581077ec0fd60b63649728896ca145c9 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -662,6 +662,9 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For Exynos990 */
+#define EXYNOS990_PHY_CTRL_USB20				(0x72C)
+
 /* For Tensor GS101 */
 /* PMU ALIVE */
 #define GS101_SYSIP_DAT0					(0x810)

-- 
2.47.2

