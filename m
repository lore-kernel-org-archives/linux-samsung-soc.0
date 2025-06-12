Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE42D3A98;
	Thu, 12 Jun 2025 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741881; cv=none; b=boAopEgwIctQ2OnEAq7/onEkTzqvfz6pCd64vZWtc5qR4SmtWXtUl/k7Hki8ly5bssLhFjiK1JqJcMDzpoPENfIaAVPjJ68/MIo3AolAjKLAKz9jTQKM+INTgKtCUyhb+aChFcGRYtJGfbwJWe003LGIUkyP5GU4XjbwWDJDww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741881; c=relaxed/simple;
	bh=dM2Z/gryzzHW7j5yS/KndPCdNXBlq15MThiR+9m4HWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jOEa61iWO2zc+XCJu6IGRRGgkJzEcAc9I45XbyTCxU2TBEJpeJKo1iVopCs6US+ljaYIj/TKthBTIWoZORYwiUTyfeSYFEb+KLYAbqOGBGi++AuKV33dXfE3w5klxoNQtRJ+RcG/x1+WwNKO35nzyRC5O7ROYXJ3FmAChFPckLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MEUxKW+d; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MEUxKW+d"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A35D820E0F;
	Thu, 12 Jun 2025 17:24:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLGkYtw-cleb; Thu, 12 Jun 2025 17:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741877; bh=dM2Z/gryzzHW7j5yS/KndPCdNXBlq15MThiR+9m4HWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MEUxKW+dELW/ZrkX5GhpZjCRc1NrBnFp7rE83rXNZ8t3omYW5EvekXVs813GaEArm
	 8WV5gs4T8kXoooSJ6Ah1q+FI0WAUcJfV03MdBysOhLHRTsWw5/2p6qUCvxjwOqDDw/
	 pXm/1kXguFm2cq+pWjNZ7Ecqgyq9gVM1B9eIUhwrjh/wfGjI3kTBnh4q0XnPtx2/xt
	 GO6k/eL2mopUjtMXjujSmn/KVrh3uOzOAIQ+Vw6DKdqga2gTqLenhCNcHqcVuS5wAH
	 0BHV6vuZK3GNLHlhBBmCY74+/fa/Nm8fu6KnEpNfguRof+n5VT9zs32qPhjFrSgiDk
	 iA0ypXpm/gDnQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:53:41 +0530
Subject: [PATCH 5/5] arch: arm64: dts: exynos7870-j6lte: enable display
 panel support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-drm-dts-v1-5-88c0779af6cb@disroot.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
In-Reply-To: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=1663;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=dM2Z/gryzzHW7j5yS/KndPCdNXBlq15MThiR+9m4HWc=;
 b=8GKEVrDaEbt8wAMJvbls5aQ4KOddtwtaGL4CE8aZ2DvLCFjth7SMdPXv5PsNdR2Qiu6TW+0in
 3F6772Ht3jNCFNS/NsdkA+PRxD7zG6Fni5iEh9VyzW/B33jfGj/fVBw
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Enable DECON and DSI nodes, and add the compatible display panel and
appropriate panel timings for this device. Also, disable the
simple-framebuffer node in favor of the panel.

This device has a 720x1480 AMOLED Samsung S6E8AA5X01 display panel.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index 61eec1aff32ef397c69ee3f0cba8050755f74fc6..ad0170d52a7773d5f5e59b4dc0e4a35d9111c43d 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -40,6 +40,8 @@ framebuffer@67000000 {
 			height = <1480>;
 			stride = <(720 * 4)>;
 			format = "a8r8g8b8";
+
+			status = "disabled";
 		};
 	};
 
@@ -133,6 +135,42 @@ vibrator {
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

