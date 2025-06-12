Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D73628937C;
	Thu, 12 Jun 2025 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741010; cv=none; b=N6vBIfe1Q0zjZMvhisO57yFYVkWlUHCKLPAHpMByGoI64P6Ef/vswRibbNzo31wJJC84/xElUMledTEmWp8EriEjx2uuNmzzGcSEaNyAP6dEHGTs4sAvkdgZXNkXVi8GBoCCHh39ocy4nN7QyImSkR2rTYlrekS/OCKnY3zZUN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741010; c=relaxed/simple;
	bh=RMxlZZIAVYR4kFgqtNMLrm8uGrSLXC1YGwxamWZ4Tu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pg27iXU+Z1ExG6XDvGYutXLbvEZqPtcL51uGA6HbLWS69OkvfQcAasPs7eCKp4aAxxF1Lp8XveRcQWL/PQZrB7OmdIkgdpvpHv4imUBRtU2Q5tLjboHuugVhjs2BsGIACTJebd9rXSOK/JHu8e3lHoeFKIaH6upe2nZqVS91BJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XJJvut2N; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XJJvut2N"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9A73725F83;
	Thu, 12 Jun 2025 17:10:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCDNXuUrQhRX; Thu, 12 Jun 2025 17:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741005; bh=RMxlZZIAVYR4kFgqtNMLrm8uGrSLXC1YGwxamWZ4Tu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XJJvut2Nqxgv5QH6VeFlqM99M21FIhHh9IxSlNC9w8j8Z04KIoio6U1AAs3mqU+KG
	 Y0d6Lljvv7DZ7YUhNQ2e5HzI6xTM4nIBheXyIeM5Umdw4/sGJNvQC5a9AMJCQWnDvi
	 dX/5NT24myz0uqGUSjal7pA9A2ESPqb8YXe+nHaNfoIp3WUJhvZvCndUb78HPkkUog
	 mDRqkElnYcK1wdRgQM0gtgzu287qwX3oLH5phaXsCvPyThxNwH4uQQbmox+PnbF5EG
	 22KAtHj705UOvGXB6Gz8zvMOPnlmWB9u+sBI9YiE5bRh6+TRm9iP7VGfLSvjDpaxev
	 KXqSpKUj9oc7w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:39:29 +0530
Subject: [PATCH 1/2] dt-bindings: phy: samsung,mipi-video-phy: document
 exynos7870 MIPI phy
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-mipi-phy-v1-1-3fff0b62d9d3@disroot.org>
References: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
In-Reply-To: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740994; l=2809;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=RMxlZZIAVYR4kFgqtNMLrm8uGrSLXC1YGwxamWZ4Tu0=;
 b=+ZD2EOrD3CDxuxegEi1OGwEkGg/XPUjn7pPHdiUH0RUqH6lcZCchYpML9KIwI0/d/zmacidOy
 UI6jdjNReHOCee17/3SG4SqsNnDWkq781DtwX2/OOseiDCri/zAewfy
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

The Exynos7870 MIPI PHY device contains one DSIM PHY block and three
CSIS PHY blocks. It also requires two sysregs, one for display, and the
other for cameras. Document this device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/phy/samsung,mipi-video-phy.yaml       | 29 +++++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
index b2250e4a6b1b1ae072bc8e10e53528a4ca0e4a5e..16967ef8e9ecc09e24a995fc041ae3735334d98d 100644
--- a/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - samsung,s5pv210-mipi-video-phy
       - samsung,exynos5420-mipi-video-phy
       - samsung,exynos5433-mipi-video-phy
+      - samsung,exynos7870-mipi-video-phy
 
   "#phy-cells":
     const: 1
@@ -46,19 +47,20 @@ properties:
     deprecated: true
     description:
       Phandle to PMU system controller interface, valid for
-      samsung,exynos5433-mipi-video-phy (if not a child of PMU).
+      samsung,exynos5433-mipi-video-phy and samsung,exynos7870-mipi-video-phy
+      (if not a child of PMU).
 
   samsung,disp-sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to DISP system controller interface, valid for
-      samsung,exynos5433-mipi-video-phy.
+      samsung,exynos5433-mipi-video-phy and samsung,exynos7870-mipi-video-phy.
 
   samsung,cam0-sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to CAM0 system controller interface, valid for
-      samsung,exynos5433-mipi-video-phy.
+      samsung,exynos5433-mipi-video-phy and samsung,exynos7870-mipi-video-phy.
 
   samsung,cam1-sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -84,7 +86,13 @@ allOf:
         samsung,disp-sysreg: false
         samsung,cam0-sysreg: false
         samsung,cam1-sysreg: false
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos5433-mipi-video-phy
+    then:
       properties:
         syscon: false
       required:
@@ -92,6 +100,19 @@ allOf:
         - samsung,cam0-sysreg
         - samsung,cam1-sysreg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-mipi-video-phy
+    then:
+      properties:
+        syscon: false
+        samsung,cam1-sysreg: false
+      required:
+        - samsung,disp-sysreg
+        - samsung,cam0-sysreg
+
 additionalProperties: false
 
 examples:

-- 
2.49.0

