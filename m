Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263A72EFD8C;
	Thu, 26 Jun 2025 20:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968871; cv=none; b=Cvx3Yjf39lSCn7AVBZPl8y4kVdlUxXlOmc410NdFP0sq493JSphuBPPtTSKMlFJnAABGCgBjq0CO0/T69V/Q8GP1XHQOx3t54fT88biZv7eowT9HZ7sEwiQiVx68hZHhPp1JuYUQNaFCGQvHEEx28q5uU7m3MSRcy0SE7PKGWx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968871; c=relaxed/simple;
	bh=/qSF7L7luLEiSviSyNY6D/hHKodT+5kgEBURabc71E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/1PJPCF0d4yj+ylicj30a9nF2TTKDvKOG3ULk0wmc0D75XWgsJoonSIS7w8yZ6LflB50Im2w/0DgPUaB+CoohbW5+qe0nQbE7luyqiJFpiM/h7Tw2rA+E/YuzAhweICKaHX1bRK/mV4XrQ5bRXQ0g2OIIBf3hpT/HgfHFnlbZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QJ/1ifXR; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QJ/1ifXR"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A69D825F3C;
	Thu, 26 Jun 2025 22:14:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIk8a1SjmYCl; Thu, 26 Jun 2025 22:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968867; bh=/qSF7L7luLEiSviSyNY6D/hHKodT+5kgEBURabc71E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QJ/1ifXRgToky+vzRXaBpGEr4GwfEFzDf0ByDOjTMwRjXJK8QdYqvpKAwzM4sTDKl
	 H8bbtB4VBXsSfpsBpaLSPBN/t1ophYjj4s9m450afzy4yKEAksMqN+lsdjTzbv2Y17
	 ZyvBmV1SAqMMySzXUNTV42taa+hWa5I0BUcrsEfp4KHkSXpzSE0ErXZ3Wc9t/9sXC2
	 nTTZ/WPobaQnw7xqOPmRiBeqHwuCgWBnJ7ngn0Ie53cigL/XAbcqp+BGobDus+6VQf
	 VrCGjGY2N/iGN5jmVx1IsEOTN6ekw4d8kBl229v6P/mExaTWVruiSlGhUCLj5G7Yca
	 gPlMn3lAQcb2g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:27 +0530
Subject: [PATCH v2 4/6] arm64: dts: exynos7870-on7xelte: enable display
 panel support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-4-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=1963;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=/qSF7L7luLEiSviSyNY6D/hHKodT+5kgEBURabc71E0=;
 b=aHmPaBlIkzPBoxVcVsk166TsubVpviXc5kOwtF14MzZHL+OR8JH/TSwvq9aS8HJQIcdi4zfKG
 XR4R9cFnYGwCaBi6odcn42MLZ/wyMdPBrEqGL4NBL35qsX4HUzZjj8z
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, remove the
simple-framebuffer node in favor of the panel.

This device has a 1080x1920 Synaptics TD4300 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 51 ++++++++++++++++------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
index eb97dcc415423f405d7df9b9869b2db3432fb483..149c72676c3c337388b1e4b631e563362750d4ee 100644
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
@@ -122,6 +109,44 @@ vibrator {
 	};
 };
 
+&decon {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,burst-clock-frequency = <1001000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
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
2.49.0

