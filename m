Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11B514375D
	for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jan 2025 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075858; cv=none; b=GkjPCgIUA1a6G+b/eADE726nySDwdrPVPHmFZi2tLZw4z0WVQcHY7hdCUsnVj85OXxDy+ukpRpYAwL2wzRF+4dvhKGechqntVvY19IBvaExYbzKFqFRTLv4mQNKmMTZ/BGY+W0puCWd5pvigFCNWt504YjjkEhSwofGMXgubTZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075858; c=relaxed/simple;
	bh=ihccTKagyfOXUt72u6sJq5P8m6g06t7vUfHKvBhxIfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O6Jr8gzLBIq28oa8UbRQdpen6A6dDIqBJDwY70iScc/fWVpfY/cabY3rEZQIbT42AyAaV4shzWxmbA8RTR2Sg4pt+ScxBSypwtWZIY4yPRN9xwmSFWLr9jVtGPQxSJfieMnNLxIcyvC11LSfsi3JnafPECaGoS3Mq1bb6ujRXuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=SM6yMRd3; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="SM6yMRd3"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=SM6yMRd3Hqtj0r2xYpEIYXlc91x+C2N52mU8JPCbBEX16cExNWDnvZhtrGJeopLEdi2jLDOuF7MrzCsZ1Bit5lVG2sJiuPQtta5rGvNVJkirPMrj5lPOwZkj+C38pPMKLsDrKQOQZ69KhE3d3SBhqxxlvJ6AEruIsasTWkNL2scmhRkoMoJ2iYNVqFso4lMY9PlG5c5IRt/KnB021wgXk1yxRzjTO+3tYlaZ7Os9gxZhxHLMX2vcUSZbw6dAKKSlFMsXu9W90pk7vbY6Yzx4PlDog+VfM3ihz9MfQ8jLuUwb+G6IoBq5WY3BD4PuoMF+E6Xh0ctycNLXduSJnBsysA==; s=purelymail3; d=purelymail.com; v=1; bh=ihccTKagyfOXUt72u6sJq5P8m6g06t7vUfHKvBhxIfE=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 785472672;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 05 Jan 2025 11:17:13 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sun, 05 Jan 2025 12:16:03 +0100
Subject: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
X-B4-Tracking: v=1; b=H4sIAPJpemcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwNT3YLcUt3i/KKSzLx03dRkM0tTkySzJDNTSyWgjoKi1LTMCrBp0bG
 1tQBMP4PPXQAAAA==
X-Change-ID: 20250105-pmu-sorting-ec6954b6b659
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736075832; l=2748;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=ihccTKagyfOXUt72u6sJq5P8m6g06t7vUfHKvBhxIfE=;
 b=djFv+D0LC/0LU7YAQlvFmm1QzIGBu5KXkOnfENoAQncUpXjP2wpa5OozY7dHC2GqAKs4u/8Eh
 PwWZTnJ1OF4AJD0rJbkry67MhrQqYmFhyi2D3I9ueNQNK9+T/1xqNh/
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

These nodes were sorted by name, but it's nice to have the same class of
devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
This keeps consistency between other Exynos SoCs too.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 62 +++++++++++++++----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 9d017dbed9523e874891f13258d331c3e829ca03..fc2c5049d764c3f50be7337bc777bb9561f88790 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -25,37 +25,6 @@ aliases {
 		pinctrl6 = &pinctrl_vts;
 	};
 
-	arm-a55-pmu {
-		compatible = "arm,cortex-a55-pmu";
-		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-affinity = <&cpu0>,
-				     <&cpu1>,
-				     <&cpu2>,
-				     <&cpu3>;
-	};
-
-	arm-a76-pmu {
-		compatible = "arm,cortex-a76-pmu";
-		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-affinity = <&cpu4>,
-				     <&cpu5>;
-	};
-
-	mongoose-m5-pmu {
-		compatible = "samsung,mongoose-pmu";
-		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
-
-		interrupt-affinity = <&cpu6>,
-				     <&cpu7>;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -163,6 +132,37 @@ oscclk: clock-osc {
 		clock-output-names = "oscclk";
 	};
 
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	pmu-a76 {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>;
+	};
+
+	pmu-mongoose-m5 {
+		compatible = "samsung,mongoose-pmu";
+		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+
+		interrupt-affinity = <&cpu6>,
+				     <&cpu7>;
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "hvc";

---
base-commit: 7c19e0e190aebd1c879a3913f1a8855a88d73a2a
change-id: 20250105-pmu-sorting-ec6954b6b659

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>

