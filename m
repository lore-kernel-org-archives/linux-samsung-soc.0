Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DACA286415;
	Thu, 30 Oct 2025 19:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852043; cv=none; b=GR0kYbaZVeA40gm2ud/GDO+ydBrRuLFcdYHl/snW6rmYz5VUJM0bXYNgAnJWjgI457CKLmc5E1/IE1JBwVH1wId5/VZEhehbL2ZAjY6drjJVQn6H5LefocCHLZVGrJUo18mUfz4hFrUcE4XZC4PeZpitUtOjcgTlhJGrmD2h0EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852043; c=relaxed/simple;
	bh=eWAhpOP3tW5TGqxzO8umGaIxutrPDC/am6PDJA0iz90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIQFtjcpzH/lOH8bVwsCBT0PO09WEVxRj6F54jIxYpRDILp+6KXDPZ5JmYz2aniIknRSxrzfceQtSKIc0bgsGQqXsueu+LNbUtjaYj9pUXooexJuBLNbm+D3WM6RLtShyv5oH7RgtuM6Qa28q1Le9kdWDyxRTzvlLpitj+JnPls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TXDvFSGj; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TXDvFSGj"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 720BE25EE0;
	Thu, 30 Oct 2025 20:20:39 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_GFZq4rWBXP; Thu, 30 Oct 2025 20:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761852038; bh=eWAhpOP3tW5TGqxzO8umGaIxutrPDC/am6PDJA0iz90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TXDvFSGjFPgYTm8P6IuZkyFjZcm8fxhFzgfYxWKWSOgFOePUKIQmPiUk/VsNJmOJz
	 oEG9hQmfx7SL4Zf+bEbtAAyhPbXs29AXigcBZavsUlt+HvuKVnHOueTULaX5UaLmJp
	 ysTVtlF5L21HKScdwm8nDZKZvY8G6/zGAM8fVcTnbzZfnhfidrJjt/PfkcAM15sFt+
	 6weezTb+uVQZMHspGB+zp9W6HVyLTJHk5cUh0LiI8anr6UAWD5+2mFXwllnaINqrtE
	 ucYIkZMeHW5jW0EiWC92dAnig07It++0wLZf1fGPGm8IEaGNEcsueJzntgOEGbsy/3
	 E7Gkx16y0TsGg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Oct 2025 00:50:15 +0530
Subject: [PATCH v4 1/5] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode for Exynos7870 PMU
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
In-Reply-To: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761852020; l=947;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=eWAhpOP3tW5TGqxzO8umGaIxutrPDC/am6PDJA0iz90=;
 b=Kd4Mx5ujS7haC/eKtrb0dT8FuDJlpey+ZiV+3hTyCIovoLYDZPHcPJwWA0o6fycG4F1IaceAC
 DcpnVhlYrh7A+NpVSLFJ3swKVt2B7U1RNZBIEO+q0lprzHk3SFnJArI
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870 PMU is already documented in schema. Add Exynos7870's PMU
compatible to the list of nodes which allow a MIPI PHY driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index be1441193feeea1c12d0d5370168e9316c8dcf76..6de47489ee42f429b46835af563112f5bbc1ac65 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -173,6 +173,7 @@ allOf:
               - samsung,exynos5250-pmu
               - samsung,exynos5420-pmu
               - samsung,exynos5433-pmu
+              - samsung,exynos7870-pmu
     then:
       properties:
         mipi-phy: true

-- 
2.51.0

