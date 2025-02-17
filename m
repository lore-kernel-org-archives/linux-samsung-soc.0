Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44991AF0A7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 21:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739827965; cv=none; b=t5V/+mHBiHj82ylUz9ysD4v0KksThc7UV4ez2ywTG8O+wsJ5FN+oh4e2D0DRbutSHzwyjtOynmdwi7J6H0ciObjMzn6lVlKn+/Ck8bm00uq/3yTzuYnlIVPGSslSXgCpRoijeDRB6f/OTimfubIOd4hwTpXHv5edV1WXiJ54OxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739827965; c=relaxed/simple;
	bh=RujWy5FU1WCa/8rts2CXrRAZV0s0wmf4pJU9jEL4iK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rxqVFToXrA6exG74C7GS9nVQw53WQv1OxcIeDDGVnsZsli78Y7p7xz6UN+bwJOwf7bQVWhyJX9kxYThNdtw9KJMDXmvJPUyYFBGZrebOGdsjv5QmnvqbdKVgGg0TzcE0WgTCFILt6TNGjIPGargSjIWtRbCebSHquX2o/U+wf4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=SLWwuPCU; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="SLWwuPCU"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=SLWwuPCUbrEIR1Wrs83suedPkUIgjYtCpYfJ2+OVRW1VLYaRF7KCdEfwovjAMPsjGiX1zNLPHSUVxHWDKqWEhw5LWvVOMOXV2f6UCvMQ4a3Z70Hb3eKckGsUNQTyj1dM4/yO+VAK+3dXdEds4G4oXOJ0Nbo0iHRn2RdXQNjkcpi9YfhGL18bhjHksGPSAlFSwFES26rCUTc+wC1wV1ehXvKiLkcYMYrIvfR2iROM3f8Lahz/9BSxl+fScDaAydxq5l1eYqQ0HqLiP6Yh53LdLs0q00YNyZoFr+m3rTU9MAVZDGXuaaecmMTOQE0EB0zH/5PDBhCe+OV/qCClUYJgyA==; s=purelymail3; d=purelymail.com; v=1; bh=RujWy5FU1WCa/8rts2CXrRAZV0s0wmf4pJU9jEL4iK0=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 42194286;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 21:32:35 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 22:32:04 +0100
Subject: [PATCH 2/5] arm64: dts: exynos990: Add USB nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-dt-changes-febuary-v1-2-99935218cbf4@mentallysanemainliners.org>
References: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739827951; l=1950;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=RujWy5FU1WCa/8rts2CXrRAZV0s0wmf4pJU9jEL4iK0=;
 b=y68Za606iO3ebmQoVh25l7jjW2Yb/6o2h0KljE4oZEhNbhTn+31w6h9WQ0MZxplRsMxMMlLvK
 d6UC1vHfSgDAobwTzh20xbWR2tyD6T0deWvmRRXW6/HnEBbd83tsrD/
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Add USB controller and USB PHY controller nodes for use in
the Exynos990 SoC.

This SoC supports USB full-speed, high-speed and super-speed modes.

Due to the inability to test PIPE3, USB super-speed is not enabled, and
the USB PHY is only configured for UTMI+ operation for now.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 4446a1a54ba2de56879353c9c4a898b1d697fc13..b5239472be40a164d496ca4564f5270132012c0e 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -278,6 +278,37 @@ cmu_hsi0: clock-controller@10a00000 {
 				      "dpgtc";
 		};
 
+		usbdrd: usb@10e00000 {
+			compatible = "samsung,exynos990-dwusb3",
+				     "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x10e00000 0x10000>;
+			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_CLK_EARLY>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_USB31DRD_REF_CLK_40>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+			};
+		};
+
+		usbdrd_phy: phy@10c00000 {
+			compatible = "samsung,exynos990-usbdrd-phy";
+			reg = <0x10c00000 0x100>;
+			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_ACLK_PHYCTRL>,
+				 <&oscclk>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		pinctrl_hsi1: pinctrl@13040000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x13040000 0x1000>;

-- 
2.47.2

