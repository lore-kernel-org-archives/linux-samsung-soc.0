Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5581E832F;
	Mon, 17 Mar 2025 19:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742239956; cv=none; b=RNXXJB242cMHh3a91QtNYugtueSt3bhmuGCXOm7cpiyho0+THf4/tMHMnmKIxz4GildHDzd7+J4ZSElPOjcS97HzJiSQbs7JZRDhcYxs0uP37HI5CDPb6p/eHcwjvXunXx3/z8xQ3lA7cx5O8R3bBxkSb02HdIOfMU/BLdwBmfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742239956; c=relaxed/simple;
	bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtUdnwCrCVAQavZrWAjAQkL6cNTB74lGC3PbATlQO8C7DstOdg17SYlVee0kMjp9Rqw/Dk/pipK/F1PU8n+1XEVLjgxQ5wBPIQbqRxUdyj21dMqWYwzXxCFPb57CwGudlcBUNQgQzp6FV+086GkBSKijqUOOzUSrMo6kiF8uxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Ssw9b4Eo; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Ssw9b4Eo"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A691025B04;
	Mon, 17 Mar 2025 20:32:33 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4UYrp3MsgJb; Mon, 17 Mar 2025 20:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1742239953; bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ssw9b4EoFYYLM4IJZFbeNpVc6ZWkqnKj41E+gRdEqCfiX9xJUNWtglC9EKaUDtzV+
	 cEx+7mX8ijTifWJhSZuXnNbPwq7foYYbjfPGkXcDxlPDABaRqQjBkSPUo5RPxGOhLr
	 +QyNas7LFmutPjjZJ5NSxs7ZNOH5jMGlX7TAhqke6Suuw2SB0V4f27PNbqw/TzKnss
	 hhx0IgTnO9DMYVdi/mOBRh5o7mGBuamzuQGUXsuhyvL2Z3/VXcUM66IqDYcwm6Ziio
	 3s51xalbx8g9M0765hJU+lLjYQBlvcNkurzcGZUYeI23/8STvwUwolUWPc1NPdZIAE
	 z0ALRacLmueog==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 18 Mar 2025 01:01:42 +0530
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
Message-Id: <20250318-exynos7870-usbphy-v2-2-551433b1b27c@disroot.org>
References: <20250318-exynos7870-usbphy-v2-0-551433b1b27c@disroot.org>
In-Reply-To: <20250318-exynos7870-usbphy-v2-0-551433b1b27c@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742239924; l=1340;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
 b=KGzHYuNPjdssAqPwyWTyQ84K0J/g3cwuPdpFDLXAzdA5wHg73uQcncHxjkPMB+z87tEBCg4r8
 iiDITp649+uCcZ+AN2mj4K+ElCU8DdRvKmurhDa0iX5V5+nRdnCaQIG
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
2.48.1

