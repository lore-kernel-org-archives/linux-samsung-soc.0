Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0492220371E;
	Thu, 10 Apr 2025 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273943; cv=none; b=Iwh7ZSp+TleFz4/7LbPl0otRGGYpJot7nEzssmUgx2sWdI/DB0ZsW68vRJbP6S2wGciUnUE14EB0Xq1P8/X3eVQ1DwbwkW7cgDWj0Ux+uZLMxu5/nUXoZoz/K8CT7It9/CBJb4xcRZh1xoMuARd+Vzh6ydqMuDUA9N+55qMj9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273943; c=relaxed/simple;
	bh=WPe1sxDRW4Ck8whEWKonZDCvZ3gDCa3iKSd6Shbmxhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFAvS6SwCrigTaee66fpdQ0BcM1KyqNGAjNU0ezesVALqFmqHTq3sga4eEs61QOwxRKwj+XFqHKJ0++l87VYGwI8LCr7e0JZ5+Ob+TFoz2VNIEG2uFn8bz9jEpqGf1PCRMPxqNSmW/JzecQtAoOLMvpMxVlWFrdGLjbiu4Tegro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=FgkLgtHl; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="FgkLgtHl"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6007B2591A;
	Thu, 10 Apr 2025 10:32:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-DXZHkkyRaR; Thu, 10 Apr 2025 10:32:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744273937; bh=WPe1sxDRW4Ck8whEWKonZDCvZ3gDCa3iKSd6Shbmxhg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FgkLgtHl0hs2IU4IIsD64hCGhyXRNvFQKedDzx9aZmvUzVEdLpzM2Up4PZsS0cCo/
	 y5txzpb6bSJt7Me2tQdEvtJYtZgAOxiZ3lPpskBJhrA8Sp+sxl9zOSMIh+KJgJtIEi
	 8bn8sPQfUxPNbXTZDvMccg7TI6KJFEz96MhSwB9ZhgdItfA9BDvP7OJ5JgrRQcPNMy
	 WOYD52L9Hsj7msQPSfT7ljS7gvRFzmkRvn+Pv557a5frChz+I9xScGyjBeu7bHE7qy
	 nYByO9Q1xRNA5C1REvgW/63swu9fXhT/iCPkMMJa8I0VXrpS7vYhjAUD9WNhP3DgQd
	 5xjath69YzYBQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 10 Apr 2025 14:01:13 +0530
Subject: [PATCH RESEND v2 2/3] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos7870-usbdrd-phy compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-exynos7870-usbphy-v2-2-2eb005987455@disroot.org>
References: <20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org>
In-Reply-To: <20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744273913; l=1340;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=WPe1sxDRW4Ck8whEWKonZDCvZ3gDCa3iKSd6Shbmxhg=;
 b=jTKXsnDqVe+aHRgxlxi3cjhFZ8/IkqodvnhJvdmGnCDqMfCDlJe2rlgOS3OjaqXBlxMmK0B3J
 51yQLKU+PGmCjSTYe+6egWhms52klyVK4mrglyGOwxbMc5OZOF55oKL
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add the compatible string "samsung,exynos7870-usbdrd-phy" to the
documentation. The devicetree node requires two clocks, named "phy" and
"ref" (same as clocks required by Exynos5).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 27295acbba7674f6cdc402f18ff4c505bd8760f6..fdddddc7d611364ce17870b5b8963b5a0c0c9668 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
+      - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
 
   clocks:
@@ -184,6 +185,7 @@ allOf:
             enum:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
+              - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
     then:
       properties:

-- 
2.49.0

