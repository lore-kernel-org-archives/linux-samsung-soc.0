Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF82FCE12;
	Thu, 26 Jun 2025 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966894; cv=none; b=QDWo2RXJYlNBFOrSEFgjf9MzesMdSYNJ5edpOJ6AKTT/jovIBCmXyO3PRc9qgje2SroSW/jY8zCU2l+ABKh8dnKiXhC/R+KSrqzYQmTKONPZ/hM7WzSVEmue9ae1XkIcLMtZPAWUE/BXLun4xk3U4TSi8tQKxnbmvvRvPMS08WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966894; c=relaxed/simple;
	bh=H8pHmtJhKvCu7fZ5/7YHY1g192cqpSliEgZa4tl8geA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYsoPmLl/FuWXBrdHEXiwSW+5UOFYBOJn8MZ0sJNXCK/heY87+G9jMf1GFUnN4KqOxZtYl339nwJyfAtgrE0RCtKk7xNiG7CWdSM41SCaS4hDPTyvdZFaemknq8JSnpegUDSggHzzvw5LmLbDDrdZQInqqZY3+Xd6aN7SVjB20Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=e/5q7fki; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="e/5q7fki"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 63F4E25AFA;
	Thu, 26 Jun 2025 21:41:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnEja1qB4Et0; Thu, 26 Jun 2025 21:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966890; bh=H8pHmtJhKvCu7fZ5/7YHY1g192cqpSliEgZa4tl8geA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e/5q7fki7A42uIFYthIewv9iyjE1RgWHJPmGukfftjco8fGxWl2Gd/a7XUnmi+HKb
	 hBsX+za+yAO983nS2qHkS+m1cuq6aHn48OqnKshJ7UUDer39svADAKORK//+zrViXx
	 pTn2z/A5y/nrY3LDaYpCeLx3+HvnpJ2YvoHiV5edQnJQvDSAPemJXz5R+mdt2gy+67
	 bZEDp4k8O0EuwvFUjNDHHS+V238uwkYlfoVm0nXUlK6eJA01mg9Eitkyzkvq3vmsol
	 kGq9qD6yvcjg93mEabJHkAurIFsxBF17BpX5Zg/9N6CDFiE1V6tc62ujDzkBbva6/Z
	 thqZEsaeK1xQg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:09:00 +0530
Subject: [PATCH v2 11/13] dt-bindings: samsung,mipi-dsim: document
 exynos7870 DSIM compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-11-1433b67378d3@disroot.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=1737;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=H8pHmtJhKvCu7fZ5/7YHY1g192cqpSliEgZa4tl8geA=;
 b=OaXjaLdr1Bcq92HtOib5JAJE9K+vzrQX882KqIGdIm792/fzivVyPndNPR/JbHCYYnO5Fje70
 qkgyw7uBIKfBXEBKgsUnxRLQ+6ZaD+d11QRtzNn/SEYPDutEaOBobxh
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add compatible string for Exynos7870 DSIM bridge controller. The
device requires four clock sources, in schema they're named as "bus",
"pll", "byte", and "esc".

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/display/bridge/samsung,mipi-dsim.yaml | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 1acad99f396527192b6853f0096cfb8ae5669e6b..ad279f0993fa108b312126b112174f10f2b8c3d0 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -24,6 +24,7 @@ properties:
           - samsung,exynos5410-mipi-dsi
           - samsung,exynos5422-mipi-dsi
           - samsung,exynos5433-mipi-dsi
+          - samsung,exynos7870-mipi-dsi
           - fsl,imx8mm-mipi-dsim
           - fsl,imx8mp-mipi-dsim
       - items:
@@ -144,6 +145,32 @@ required:
 
 allOf:
   - $ref: ../dsi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+
+        clock-names:
+          items:
+            - const: bus
+            - const: pll
+            - const: byte
+            - const: esc
+
+        ports:
+          required:
+            - port@0
+
+      required:
+        - ports
+
   - if:
       properties:
         compatible:

-- 
2.49.0

