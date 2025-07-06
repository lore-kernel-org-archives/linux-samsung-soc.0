Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13EC29E11D;
	Sun,  6 Jul 2025 18:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826481; cv=none; b=L6mpRksUoOmJdFQk+zx48FDzQ6urkDIhYYvWR7q4CshXUDWKUzjt1j2qniPOCmbu7ty/Q/wilLErwxTskZAvH0avZey92YTfT4Jh2wq6RmZvC01OzaUwOD1VwUBX7Ls2F12pjT1enbBLU3MDF1dWRjMmNNgfGvOvgsT+sqnb6ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826481; c=relaxed/simple;
	bh=HC29jIb+LJXzNsT5n2KQRnRrUJPZnyBZMVkVyDKqBR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flMHkSdx8EXO0OMHEPzsOnfEciDWs8BwLiux/q6AI3mUg6C/wzYti+r4sX/WsQ3M7rGCAQ012zh6Awug1ZVZII44dGAqK2KPckCrxArx+f5mwt8+1+wiDdUIwVYcY1eklx/RMdCkzOORPXBeyM3NNnCuwNqyX8Ii14vM39fnLxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MmD5zOTl; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MmD5zOTl"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 90C4420E30;
	Sun,  6 Jul 2025 20:27:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBRF9vHUDJv3; Sun,  6 Jul 2025 20:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826477; bh=HC29jIb+LJXzNsT5n2KQRnRrUJPZnyBZMVkVyDKqBR0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MmD5zOTlQUOxZePBVy0kXTSIMhhdYy7n6YIYdfviXEoXs23qo8YkIc8OC5AWaeMy8
	 zvJo6pJMcKdTUWc7Ss81LDO7odeCUSH4xq01Y9pRBIe22Dp8bI1zbFI6q4CFxFbX3E
	 i7bdQCg18pdnICYqbtXj82Ax5sVCXhQFIiLk3WwJFE7L7YpZAS11v6IBaoZm/jBb25
	 opOV40NcH+kvzpO5jodfgAacQiFYes7inJamL5kx8ZmJR0f8PDTwOBi0IDPlOgesc6
	 T4VfTOSnT38c5eGhB/kiY/Ca4Ztie50QmRjfCqsdfFKaMxX4GZQKgQzoRrIM4h8om2
	 yAOshPthlFJgg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:45 +0530
Subject: [PATCH v3 11/13] dt-bindings: samsung,mipi-dsim: document
 exynos7870 DSIM compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-11-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=1787;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=HC29jIb+LJXzNsT5n2KQRnRrUJPZnyBZMVkVyDKqBR0=;
 b=whHG90/xE0mgOXwSxWFwi4YmHLukJm3JjyYoCmZuuMXVgIyxa9aGf1Aw+2jqE1ia4/Na45iGy
 NfCu+wNp2UXBgeEa7IP27ch3ebR+8N2lX/uLcV2ZVmBwyzaynoCCASf
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add compatible string for Exynos7870 DSIM bridge controller. The
device requires four clock sources, in schema they're named as "bus",
"pll", "byte", and "esc".

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

