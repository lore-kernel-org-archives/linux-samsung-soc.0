Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E438C274B40;
	Thu, 30 Oct 2025 19:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852059; cv=none; b=LTDV1jX3haVEMOiJIJb1M5THc0YJWUzjAzsXREARVcPe7Z5d6vdeRNU67yIdVfDVD9qvQjcSopBnTplD5OU47mxrTWTwZRQpdcOdwYWMpKTH2plVDuLHBKqDVDEQBrt9SDoIg6wbuXS81Ez/lrXFBVbbepECcDB4F/oI7bTAvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852059; c=relaxed/simple;
	bh=q0Ub59ZAEdYr+waJdvNVnGcxWOdPZwHebmm7+h4GM0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S9lHe+Wns9Vhbdvb6uqJEeMJZq/z6dQ3Hx7y2m5BAgVLsyxzmENpZCY57KWDKUYdc7g9X+Qr9G3b3WrLxro1KXykzzRSZk89sDqiq+/4kzbeQXDuE6glO2dRwK3nk2wVXRH8fiSCGiNWW+gpDuldy0G9d/mzYg/X8bvchQQq2v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=N1gtAPWP; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="N1gtAPWP"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 23FA125EC4;
	Thu, 30 Oct 2025 20:20:56 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGHbm5yo8muT; Thu, 30 Oct 2025 20:20:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852055; bh=q0Ub59ZAEdYr+waJdvNVnGcxWOdPZwHebmm7+h4GM0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N1gtAPWPCkaL83FeRN3Rv+iM0voU1Tq0OL0POyzA+HqqR9cZylV9Q1DmcqjoqODKs
	 3Mb8COznHaIrAa/xArCIRgkC61ckiqarnDDbzXgjF2depx/orpSAbx8PHE1WJE7M+4
	 6YQc43gU1f2yO0eS6Blq4B7nOSqCESDB57fq9cUYASpmomH9dmVpXvK4BLjEuvwWfX
	 g6izYcD3t3o8/TexLVwQZZ4l/1qD3rb07VZryNhppoatQLFa9MVNq+m6T64X7EemdZ
	 W2zn8Ks7zQvkpzzdcz2A1wCJp4PtAckPuouZcRQDbkxEHH/Y35UCK3VhV+tqORvlNo
	 0Y1LhKdI5gOlw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Oct 2025 00:50:17 +0530
Subject: [PATCH v4 3/5] arm64: dts: exynos7870-on7xelte: enable display
 panel support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-exynos7870-drm-dts-v4-3-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
In-Reply-To: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=2290;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=q0Ub59ZAEdYr+waJdvNVnGcxWOdPZwHebmm7+h4GM0I=;
 b=bFV8U08tpx1eoePV1qg30Le+zARNiee3fgjoNvyl4g0pCeR2pYOHqFNgSECEVCUoBy3XzBd3W
 R+PumpW/U6GCFlizYKagz3SyTr5tnRVu3niPokSwMvNX+pQ7m1RdoX5
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, remove the
simple-framebuffer node in favor of the panel.

This device has a 1080x1920 Synaptics TD4300 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 57 ++++++++++++++++------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index 2a3d91d390ec7a6e0c49dde493a99e5b18ea2235..29e124c72e9d25f05705909a981477f46a86efcf 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
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
-			reg = <0x0 0x67000000 (1080 * 1920 * 4)>;
-			width = <1080>;
-			height = <1920>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	gpio-keys {
@@ -108,8 +95,9 @@ ramoops@46e00000 {
 			pmsg-size = <0x4000>;
 		};
 
-		framebuffer@67000000 {
+		cont_splash_mem: framebuffer@67000000 {
 			reg = <0x0 0x67000000 (1080 * 1920 * 4)>;
+			iommu-addresses = <&decon 0x67000000 (1080 * 1920 * 4)>;
 			no-map;
 		};
 	};
@@ -122,6 +110,47 @@ vibrator {
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
+	samsung,burst-clock-frequency = <1001000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "syna,td4300-panel";
+		reg = <0>;
+
+		backlight-gpios = <&gpd3 5 GPIO_ACTIVE_LOW>;
+
+		width-mm = <68>;
+		height-mm = <121>;
+
+		panel-timing {
+			clock-frequency = <144389520>;
+
+			hactive = <1080>;
+			hsync-len = <4>;
+			hfront-porch = <120>;
+			hback-porch = <32>;
+
+			vactive = <1920>;
+			vsync-len = <2>;
+			vfront-porch = <21>;
+			vback-porch = <4>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.51.0

