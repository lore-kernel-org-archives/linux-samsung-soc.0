Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97D2EFD8C;
	Thu, 26 Jun 2025 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968883; cv=none; b=JyywXdQscM8/PbgKjjhQcmyTyDJneODfFljsRitL+Alu1AVlRGs1+etHZdbzK8jHyeE4sY9lw/zApFYoV15TvGxlr950+vxxqkAKGuNj/U7I9RqnT0ymQ1TBTDaxZUNezjqCF/hX6qTeta1FFYzJVUPt2XcKsYyy85uV34w7AgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968883; c=relaxed/simple;
	bh=cg7s6ZiVvmErjdj1DTXd7oxh6Zhi0Y1dn8W/u4K8qBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVP2Vv+xY9FAzUUpmRukQ3ZeHvLst/RUqpPd9SLAoDdEIJczyBUfCt5WK0qvKGfDQbl+wnvvUr3S941BGXEmTbgHh8J8rP9rokyy17pVRb23/KxxfuCN7o21kQrdUG89OobnEUPrDtqGoDyqhP+e72wBE3g/uT7/1ByctgOl3/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UVaRZlgG; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UVaRZlgG"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F33CC25F8C;
	Thu, 26 Jun 2025 22:14:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROlUM-guIM2E; Thu, 26 Jun 2025 22:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968879; bh=cg7s6ZiVvmErjdj1DTXd7oxh6Zhi0Y1dn8W/u4K8qBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UVaRZlgG9nWYsZtd+jxjqxzTwkGvROfDUUMR780HiuU6G3dbVIKviaEvSMWhypouh
	 OOfzEMv/cCmp+ozPpOGlea0q4rIcFlnTA6eAGKxt0Z4ePRRsdI0NNGwZaCy5RCmVuA
	 NGBrY6nJK2vxE8A986TmFZBXVZRvnlURjE9nxMbfHozyB1dY5iXGQ+2qpn4VCbLX5H
	 m29Mu9QLBoaioXBXAqoSg82dcU76oo7i7tU87tCGadL7uElhTfZX5SMKqkbV9DeWvF
	 0EF7b/TMv18b93fE9rmw0IAsuWLVQDxEDQwVVhPpsBCIhtoz2L1Fzd9hK+S+x7oqQt
	 1Zhu1Rkduaf/Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:43:29 +0530
Subject: [PATCH v2 6/6] arm64: dts: exynos7870-j6lte: enable display panel
 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-drm-dts-v2-6-d4a59207390d@disroot.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
In-Reply-To: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968815; l=1916;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=cg7s6ZiVvmErjdj1DTXd7oxh6Zhi0Y1dn8W/u4K8qBE=;
 b=pqzZ0zpa9IlCWMHbS2c9JInserNn+o8T+yBmHd8KRENeWQfhVP3CCni/c0jioa1iZn/kjJvHg
 0BO5isJX0MOD5qO3IqlUcew7aAyB/kk8e0ROSIrMxEQenW54uhd6Nxq
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, remove the
simple-framebuffer node in favor of the panel.

This device has a 720x1480 AMOLED Samsung S6E8AA5X01 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 49 ++++++++++++++++++-------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index 61eec1aff32ef397c69ee3f0cba8050755f74fc6..6d57f583d687003850f0b03bd19fa9e2f6e33332 100644
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
@@ -133,6 +120,42 @@ vibrator {
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
+	samsung,burst-clock-frequency = <500000000>;
+	samsung,esc-clock-frequency = <16000000>;
+	samsung,pll-clock-frequency = <26000000>;
+
+	panel@0 {
+		compatible = "samsung,s6e8aa5x01";
+		reg = <0>;
+
+		width-mm = <62>;
+		height-mm = <128>;
+
+		panel-timing {
+			clock-frequency = <73094400>;
+
+			hactive = <720>;
+			hsync-len = <2>;
+			hfront-porch = <62>;
+			hback-porch = <26>;
+
+			vactive = <1480>;
+			vsync-len = <2>;
+			vfront-porch = <12>;
+			vback-porch = <10>;
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };

-- 
2.49.0

