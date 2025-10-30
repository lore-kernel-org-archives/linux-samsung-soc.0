Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FC72D249E;
	Thu, 30 Oct 2025 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852076; cv=none; b=uw6U4vseHC0Ko3CvLqSXlwqYoeKA523SsPNIWOmaNOSp3Pc3mvil4HWCgxZyiPo28tIEWdOapAnCJphQjpZ1rEnC7x8BBsjbATNa/df0HKhiAosx5e3TPN2+tfUhMYBkbLN9msuFfFd6czpYOtqbmob/SSnutFA3OiL4tTehXGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852076; c=relaxed/simple;
	bh=Lje3S1Cd+e65j5HWB+pO5sm3BW9jU4cXFc+79FHD8VM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvcQMgLO71PvVZJODFgvnTl+2ojpRmfvHdDOpck5U6FXJLHWzfiRAzbksUuYFERm1NL6zHJQngBw0Zc+qX/mnE0iTChp/z1q1lKY2Yduz/i9SBdlU+G5PmW7wS28WaERtnjL0lLcHz33Zg7rtcsyUe3EV/dXJWRPdZ+SRChnLCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=DZE+XdfC; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="DZE+XdfC"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E6AE825C4A;
	Thu, 30 Oct 2025 20:21:12 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYlr5GNEC9O2; Thu, 30 Oct 2025 20:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852072; bh=Lje3S1Cd+e65j5HWB+pO5sm3BW9jU4cXFc+79FHD8VM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DZE+XdfCUdZZEaRriPfY1gyDgc38Tagc4ZuWc4zaABBUVk3H/+jaGE7zf+Ze4fzeh
	 oIxPTqI2AxFgthVSIzjwEL4Mk53dSNZNip/1say71X1RrJ/wm7IpHZDCsfsNcvIBDW
	 5GPykKCPCl/nCXYiOHFF39FDEL+dyYkc7lkQkzJUSPDDxP8ELAt2bLhex3rxAPNf5I
	 QZ5xhoXnv45BN6tyk2Hd6cSCS/g6BVSnKcu4y5ug+/2k+B8veXFhrfSTP50mwN2UJA
	 48lbmA+VuqeF+6Mi3u3VXzzwMQOdWC985rDUas8BwgBXOxraX57Wei567f3bW7UBZI
	 Lr1/UvLYpeVtA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Oct 2025 00:50:19 +0530
Subject: [PATCH v4 5/5] arm64: dts: exynos7870-j6lte: enable display panel
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-exynos7870-drm-dts-v4-5-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
In-Reply-To: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=1965;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=Lje3S1Cd+e65j5HWB+pO5sm3BW9jU4cXFc+79FHD8VM=;
 b=bokrh+Ct0WkAsgVGoodJr+oOoQpG+p1LgELJVR03bASNgGTEldGNk8XeVvuo4eF74SGNWC3az
 7AYbr624DaPDiK1fBrexzuBiHwhLkddfsgA7VBdGiRCYxECxjvTrppw
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, remove the
simple-framebuffer node in favor of the panel.

This device has a 720x1480 AMOLED Samsung AMS561RA01 panel with
S6E8AA5X01 controller.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 38 ++++++++++++++++---------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index eb4701dbafc5d1f30dddbb05d929c722f69a1a93..09f2367cfec9385cb5539a66f97d9148877c9e80 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -27,20 +27,7 @@ aliases {
 	};
 
 	chosen {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges;
-
 		stdout-path = &serial2;
-
-		framebuffer@67000000 {
-			compatible = "simple-framebuffer";
-			reg = <0x0 0x67000000 (720 * 1480 * 4)>;
-			width = <720>;
-			height = <1480>;
-			stride = <(720 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	gpio-hall-effect-sensor {
@@ -119,8 +106,9 @@ ramoops@46e00000 {
 			pmsg-size = <0x4000>;
 		};
 
-		framebuffer@67000000 {
+		cont_splash_mem: framebuffer@67000000 {
 			reg = <0x0 0x67000000 (720 * 1480 * 4)>;
+			iommu-addresses = <&decon 0x67000000 (720 * 1480 * 4)>;
 			no-map;
 		};
 	};
@@ -133,6 +121,28 @@ vibrator {
 	};
 };
 
+&decon {
+	memory-region = <&cont_splash_mem>;
+
+	status = "okay";
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <500000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e8aa5x01-ams561ra01";
+		reg = <0>;
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.51.0

