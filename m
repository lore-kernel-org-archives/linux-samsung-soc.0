Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881212571A0;
	Sun, 28 Sep 2025 17:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759082257; cv=none; b=u+alUmELBsU+w/ee/uQcaGHkXlieS1rWroqw8iPqEvOfNAXfANDebm9RH9+Tz6mdoYteHPiOGgrnrpCaM6R6pTQwTQ9VOLxVoKaANRinP3/qOUfhHvtNSBBAGAMVKdqd16o95VagDZLR5uouFcTatHOD9GoZJGXcRIsOu8kcGbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759082257; c=relaxed/simple;
	bh=dhrg79bBl6ieRfQSPcVxwYo7HoSzJSn6NNEps6jJUiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xjqbg0FFSXxuuwNqVu0Y2VTnEdxs/h5KjWTgYWKbYpTDthukUzEBNlHt/Vhuo1y5MZM1UwwZtuViMBdrVs3E8vn6phXUaSrnCsoM8fTz6rYnvSzQ/AVTC5lujEmlFmUdyutiU+y0pHTDRM6C48lFAF14uA/bTTKOj1oTuSsesVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jjZf5GIN; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jjZf5GIN"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0E8152609E;
	Sun, 28 Sep 2025 19:57:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0w0NM-CvF_W; Sun, 28 Sep 2025 19:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082253; bh=dhrg79bBl6ieRfQSPcVxwYo7HoSzJSn6NNEps6jJUiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jjZf5GINZo5YqNeKA2iSyZyCDhJjJP3Blvfjvyxa/Wks0ZiIE0Lra9ACt7xQ+BBPz
	 beX0HkJHn6MslbdSxsOdK+dmx6lgnsTaMtNTeV3BE9/EzKLlYx3oIOUrMz0sNCjs+i
	 S6aXCvzLVOm2L1cKy4qmsWrqxf8AoH9vknHu5qiWIN5jxDj01fp56qHvTQRf9UvRKU
	 7yG7gTzQvXTg8aKno+Kb79L5RFB1mVJBySwMJjQIrwwOs5faaHnsWGaKWiNR6etOge
	 v79HWJhtlfiSoJLpzgim6p9vpSWDbVdoe5KFNfdDgvourdpxnwKG0ylzR7DMFOvxo1
	 8Auq5DWazJJ5w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:38 +0530
Subject: [PATCH v3 4/6] arm64: dts: exynos7870-on7xelte: enable display
 panel support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-4-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=2290;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dhrg79bBl6ieRfQSPcVxwYo7HoSzJSn6NNEps6jJUiQ=;
 b=Yq+9eLHxenA8cmacsmj/yEGxt03LtVmx7QLg6qkDH7kxN4YpC3Vxv4Ifx/hn23UbdUB5m3LcF
 ENHARYYL54SAfuQ94uy3VtQDL14op8pHej115XvEzOgm2ypzgcrE5SL
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
index b1d9eff5a82702cd7c9797b2124486207e03ad89..18d9dd55161b6ed4f28848d920ef229c83509442 100644
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

