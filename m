Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F742E2663;
	Thu, 30 Oct 2025 19:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852066; cv=none; b=mj7lhmgzGQ/eE/+HiIuExwRb6vIJnYRirw/HyFzHislqSgVi1+7+hsqT3HiQ784wFW0mXSM4mWRm6ZUrJzPfL/IPdiVzZWuEIW5jsxaIeCCNc49B2TEaZlyIRX0RoS3W+Hjhvy3s12OBxpX1p7IlgFWzTjIbGjtBNzBCVuZxY4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852066; c=relaxed/simple;
	bh=gCZC2hfr3oNwXsihsbr7So/902BJGZg/qBfw2mGaraY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ms3/cagkcg7kbBJmNr8FJd33KhXZn6h41571GTyDhOBbEKVPf0QyXEXyagzWhktiiLXJFwMzI6j79pMtUf62UtzMaT8jIUPAPMu41H3qCXQiuiwNkUkIWnqvu+PPJg5wyfOsO14FbATNHZmaBEtYubHKUdLb0T6O5UsJK/Cz12g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jSmiYUcR; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jSmiYUcR"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1726125CE1;
	Thu, 30 Oct 2025 20:21:04 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPcBtd3wO5oj; Thu, 30 Oct 2025 20:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852063; bh=gCZC2hfr3oNwXsihsbr7So/902BJGZg/qBfw2mGaraY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jSmiYUcRMVvbeMGHiL1iiLoDF8cBo2SJqZzk5XYUUuVbSZR+91g0ELKGk+daUhJ8V
	 MRAMRoAUiEdlU/mbPnAx2U/AequTnRCdE+E1IuzAa/es1/OwUZRxm94fb7nexcPN/j
	 oyk9qVTB58sTGovmg3hZqfge930jaXTbFjNiQAwDHlS4x0jztjv/mtSM54UpgoIpmj
	 pbw++bV78ErF7bwRVBpXSiP477iQ+oqPAOncA1imNV2cubl/2dydQoAU8te4bUjTDp
	 tSNxuz2rKN4sfD1j2YXHe7SEu78dfOKdAxwwhkYBnnxSTn92AfLDDszZH8E/5zST6h
	 eFaW6hyr9CR+A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Oct 2025 00:50:18 +0530
Subject: [PATCH v4 4/5] arm64: dts: exynos7870-a2corelte: enable display
 panel support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-exynos7870-drm-dts-v4-4-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
In-Reply-To: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=2281;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=gCZC2hfr3oNwXsihsbr7So/902BJGZg/qBfw2mGaraY=;
 b=O4+V9VOCvcV6kL/33xJ9HqNwn/B3q3l+lxMdfIRV5RATyKeuCbegysgtjkKqIQbU16khyJw4O
 Bw7A2/M9TubBP661CRiRsE9K9uWUXqcTu0931F+Fk2QpTVZXU8ZikYO
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
index 07467158ee6a37e17402fb50554184c4c93f77d5..6f40ca4350ed72b57e511165e53f00e77f8978f3 100644
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

