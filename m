Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F23256C87;
	Sun, 28 Sep 2025 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759082271; cv=none; b=nWMB6F6dI93ksZ1GYkZKwIriqr4KlhRmCA8NR6lJohpmk3iNd6f5cnX9ypfBvEIf0F9koQ9HMuPeXwdd1XbUyAEwdc9HY+9V5yYZ/A1dXD9OMW4N8YBbRhfrm/43PusTcHxyXpyvB0cN5dAUSe/4BrwTFmvs5Wdc962OJQhyagY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759082271; c=relaxed/simple;
	bh=G8POg89qhc3YFRtRay2TG6zhQ5wGIWVmGavGeCYc1jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JoiVo+XHK7TM5B9KlUcbE7sVG8++m19OAO7+aLeksAuKBRqj5yOJ4d2e7dcrCQVKJnKV79SiiwqWdgLunMNj3LpxiC04T1i+5GR0PZDTtD18zj5IfVrqdnEGc54TjYi/piqOusy93QMvkv3oEVcQ4aUnfOsgaaT2KW1eozSmNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=avOpMxva; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="avOpMxva"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 311BD26151;
	Sun, 28 Sep 2025 19:57:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jDSkinZ6OKr; Sun, 28 Sep 2025 19:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082267; bh=G8POg89qhc3YFRtRay2TG6zhQ5wGIWVmGavGeCYc1jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=avOpMxvagnWapndS0g6pkU9rOzu32Ge0/JqVNiSg3Mhadtw5QIjgH0FnmGeTHnVoN
	 VLEV6c/dT/+UWJB9GpOgjebZVJtq1KldJs01HTIUD910mxozBOeND+w1yd3WLz4OO2
	 B/GGCP6EqjBiutggRBWs/CBFE+GkU2keCncqJfxmicNmlbtZjoP+b/pfB7s2A/stLs
	 WilxswbPT2xx6tNvaquQ+LzAAkGc+HoHkpFY9lDBcVgFqIOCFXH3NN4UI8+GTidGO+
	 aGZgiVMl47a3/SqGsYduly+ZJLo3fTeDoiYSZ5Vg6582JbLXp/7y3CZZoHa9DyUGB9
	 kk/Ki9vyra6ow==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:40 +0530
Subject: [PATCH v3 6/6] arm64: dts: exynos7870-j6lte: enable display panel
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-6-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=1965;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=G8POg89qhc3YFRtRay2TG6zhQ5wGIWVmGavGeCYc1jg=;
 b=yWWgBnadulfkxT6DEECzwI8LcB08R6butKr1fh8Ucd/eC0QfgCDlbARd9CHx+0r8IKeV4b1Gx
 zUpkQ9zSo+lAnwbGwQky/XHHTa110+oGWMw/zmHwFA3XAXUvXQkHZpi
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
index b8ce433b93b1b488da31bbe4846f8092243611ad..f92e1f8fabf3e01b69583f82cf842178a21002a2 100644
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

