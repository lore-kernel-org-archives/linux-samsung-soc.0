Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084B5255F2D;
	Sun, 28 Sep 2025 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759082265; cv=none; b=OxyGdkSMobHSFJugru+7lKx6H4lZ7GSIXOIaoTvnlMkxLneW5gEj6XUZzemR2KCPEHt4Rb90kXLb33AxY/szuZf1AIju+jKbZVataYtV2DLAWI4cBlan1StGC8DP8NrE/lvaDBaHtJAQDCjMxBJis+pOMdKVRzGvRUaKuMle/4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759082265; c=relaxed/simple;
	bh=dz8G2vASF2vWWKjY26SIIdI778aFDZUdkUwOcUEZZPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tIhUmFRpVlYObRbn/8vPaiqbsSenhnZGRc/SXGqnzbCdoohRnC78tzAfcULifFochqstSfLs5aC0xEmJI4zSzN7/KAtY3DTGHMJuQhHLHM/Xec/ySFd1FRn2pctai7gOrq3dPliJiS/w85ppbKEt8qCr3Ux/0lua7k16U3bbGrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EP+5I8He; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="EP+5I8He"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4925C2609E;
	Sun, 28 Sep 2025 19:57:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Gk7c8tPyBsz; Sun, 28 Sep 2025 19:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759082261; bh=dz8G2vASF2vWWKjY26SIIdI778aFDZUdkUwOcUEZZPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EP+5I8HeLH43b5mBUIEeRuK/JFt/oMBadeORNRnr0dxs95hh1MOPP3R6U7fPb/p6v
	 SkcU613M1ds79+2RNsJeAmuNqmNlygedeL2Zn/AE1mGO4y2f2+zQ0jdpsdA2vhe71V
	 4oOMzWtw7jz7x2aaNdpQQ2ghHqYQPymgXSHHaZEoNxqLvKOstsXGNchExb2MuZxJpu
	 n+TTGdKRjcJvM1zEC0TqBzg9XtjWkvoQtGkfNeNW4OkuDDPvxDKLXKxED6KX7i7vc7
	 2I+SZSEx1GoD+rHk5/5WtTDCNYli431By169VRSCyXw+ZYFL/Syvk/ugKZXi3o9RSl
	 TsBGWUnUnBSig==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 23:26:39 +0530
Subject: [PATCH v3 5/6] arm64: dts: exynos7870-a2corelte: enable display
 panel support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-drm-dts-v3-5-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
In-Reply-To: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759082219; l=2281;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dz8G2vASF2vWWKjY26SIIdI778aFDZUdkUwOcUEZZPk=;
 b=bNbC3slo543CtA0K+jVO0kiPtcdAHWpWIlnaP2b9Jbmndbcn3kA70Jmsf9LhMAP9vCubJE/WC
 I+gYCb5buqjBoa3AmQfeq+EAOjuDyDSSx/rVgYbodHiki6xmZ7tUDiI
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, remove the
simple-framebuffer node in favor of the panel.

This device has a 540x960 Synaptics TD4101 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 57 ++++++++++++++++------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts b/arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
index eb7b48593187409ce6653b7d857b63f6946aa4f7..07dff8809afbd34ed91f7d9cf270a16ce7992539 100644
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
@@ -110,8 +97,9 @@ ramoops@46800000 {
 			pmsg-size = <0x4000>;
 		};
 
-		framebuffer@67000000 {
+		cont_splash_mem: framebuffer@67000000 {
 			reg = <0x0 0x67000000 (540 * 960 * 4)>;
+			iommu-addresses = <&decon 0x67000000 (540 * 960 * 4)>;
 			no-map;
 		};
 	};
@@ -124,6 +112,47 @@ vibrator {
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
2.51.0

