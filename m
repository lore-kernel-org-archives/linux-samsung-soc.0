Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AAE2F0E5B;
	Thu, 26 Jun 2025 20:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968877; cv=none; b=eVPtLYlHL4kyc4bd4k9qieDQipss1CH+OhSdxFxlYM3x9orfHVrrud3vjLcU4JeSpcAdMeQt3vTe145L7PgzpmPMh1jQH1rcVQbyJrBdd7K9LFLq1nVeFOmS3zR6Fjrri8/k6KWflKXld+VUho2/IxjOiru9zyYKAIx+WPxbg6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968877; c=relaxed/simple;
	bh=DwGlECXqMmhEMkOyKKhzxLoU57auUmzPgkRlX6Wyt/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oI8U92M6MF+KVkfQKkqT5HpGme6nuAq9FG4wquGDq6uzFYeD1/x7rtXm2ID4oRHWDIZkqUhsqF+FWJ5y6kp82TA3bQNGfJ348z1paGXk9XEYjvpnPdKXmhuJd0vWpcs/4lsXbuQq9/02fFsrIrrSYVGVq0me/5zDhMV8rSi7d0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XaazRoPR; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XaazRoPR"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4945C25DB0;
	Thu, 26 Jun 2025 22:14:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEQsEzve_yRw; Thu, 26 Jun 2025 22:14:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968874; bh=DwGlECXqMmhEMkOyKKhzxLoU57auUmzPgkRlX6Wyt/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XaazRoPRZkGBScYdqG6jSpaQBi0ye2beGgmatu6pLO81dATCAFNOuv+o6qLlmeVk4
	 hPyjkQAFUx3cNhCHLJTwCuRVj4yXTt/BUFr6YuDYZ5euJ2fPwoPG+nB311wI8iyesg
	 vcTWtehJKmyTIU4oB0mZJQ/d1cTvQ6wIoWhHa+322SKSFaGHT80Cf2yYJv7KniyZil
	 4X5zw5LVgPzlH8cOM0gUOStP5l6KqW1FTFb+jT+QSMWm2qGtQIKMHw0ZfESJIU8Dlo
	 lsVYIUtSBGeixlDOegZ6jdVD0w9dxxZZ/cYBI5zsXcSydkRhp4fyRMxvdAtmQ0PDak
	 xMdWj4OSFVQkA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:28 +0530
Subject: [PATCH v2 5/6] arm64: dts: exynos7870-a2corelte: enable display
 panel support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-5-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=1961;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=DwGlECXqMmhEMkOyKKhzxLoU57auUmzPgkRlX6Wyt/I=;
 b=d4XHZ0N6TAbSf0AoCWYuxZd8YSq9RCR3p0wFPd7f86/IabovTwv7ISjiwjvA/fLZwPzbVSgIi
 Qk2XQIFCfleANOF6Vs0Xn4Z0x1Wu61rOO5dxmp8qsPz9ZK4iyDCHn9y
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, remove the
simple-framebuffer node in favor of the panel.

This device has a 540x960 Synaptics TD4101 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 52 ++++++++++++++++------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index eb7b48593187409ce6653b7d857b63f6946aa4f7..577c34b798438b2ed70f01b4f954dfa074e97941 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
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
-			reg = <0x0 0x67000000 (540 * 960 * 4)>;
-			width = <540>;
-			height = <960>;
-			stride = <(540 * 4)>;
-			format = "a8r8g8b8";
-		};
 	};
 
 	gpio-keys {
@@ -124,6 +111,45 @@ vibrator {
 	};
 };
 
+&decon {
+	status = "okay";
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <836000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "syna,td4101-panel";
+		reg = <0>;
+
+		backlight-gpios = <&gpd3 7 GPIO_ACTIVE_LOW>;
+
+		width-mm = <62>;
+		height-mm = <110>;
+
+		panel-timing {
+			clock-frequency = <69336720>;
+
+			hactive = <540>;
+			hsync-len = <4>;
+			hfront-porch = <364>;
+			hback-porch = <40>;
+
+			vactive = <960>;
+			vsync-len = <2>;
+			vfront-porch = <244>;
+			vback-porch = <13>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.49.0

