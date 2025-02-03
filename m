Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9567D2116E1;
	Mon,  3 Feb 2025 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615266; cv=none; b=rmlJFRASB4wUCjeWzsVibLlhPKqCChC/Xpb2Z4Fpxi7NZdqpdfIXkJs5IzOoeuxw7KA24I9QuEYc0km/aTrEmjwskNVT8bx4rpDcFdqFpK5VhvMjXM1T7lMxwvwteLDrcot6k0zskAky0ZYWehOFl3a3wuxABRvG2ZYRTGkPxsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615266; c=relaxed/simple;
	bh=21d+Jc9d+gADlgNHYfQOcBVdXDZGzdPTgv991qDeWLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFd/Q70v8dYbOSN434348DqPyS1cDS/T9Pay9e4zLEcg6q1Qci2K97ctesQKc9VZW0cSJZBRK+ameUdS0n398UO/d2tktS9+E8dm79iacZvVVrsyYw76CHrsRm7bpIDY+wM4VPiL37WpQvlGv+GmDLt2KvLESOELS1viiF2ZYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Iy8uyQW2; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Iy8uyQW2"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 65EA925888;
	Mon,  3 Feb 2025 21:41:03 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UT50sK67Dgox; Mon,  3 Feb 2025 21:41:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615262; bh=21d+Jc9d+gADlgNHYfQOcBVdXDZGzdPTgv991qDeWLc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Iy8uyQW2ecHHSezrfBWohAKMPT86crMNu0Wy2hsDziRO4MYK1C4vhlcm2kAEIrhce
	 dvvWMf6lL1mySTW1vlp0mfZDvKnA1pEfT7Dk9aHyGonSC2fdX5Ut9UcKhc0f8GLLWC
	 i8zl6GhkP/GTJxt8ELePkZ5Yxpet8RQ3zAU5+2YC/eIwxGYjqs4WDmbU/kxBd9R/hZ
	 XaQM1ND8tbrTyz7Sq9qcJg2jGnb9Pz9mrtM/9EgqYlDaIyWhaQJDIj4qehy631JBLF
	 4Fr83K3v1PBBLec58jGCpFXOMeJDXoSo8l59BpSm9vPKDUegkX48ksNFBpm8VS9JlY
	 qaQyl4CM+9C6A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:10:14 +0530
Subject: [PATCH 3/4] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos7870-usbdrd-phy compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-usbphy-v1-3-f30a9857efeb@disroot.org>
References: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
In-Reply-To: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Vivek Gautam <gautam.vivek@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615219; l=1273;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=21d+Jc9d+gADlgNHYfQOcBVdXDZGzdPTgv991qDeWLc=;
 b=Ty//xTV9hK1qCqbudwOVKRV+hkVzgreRn07PhMeBrKHhifOKk26G39SAXIQPadp3oylN34uVK
 6I+R+Cbr2wrAdrZ7n8ozLoMOFKmgwwegCkUVMWtBALQF24h8lhyb/9D
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add the compatible string "samsung,exynos7870-usbdrd-phy" to the
documentation. The devicetree node requires two clocks, named "phy" and
"ref" (same as clocks required by Exynos5).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 16321cdd4919cd00228c35e3c1676e7954077591..3b5881e7e5bc403ef2b379668584a8379effc256 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
+      - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
 
   clocks:
@@ -168,6 +169,7 @@ allOf:
             enum:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
+              - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
     then:
       properties:

-- 
2.48.1

