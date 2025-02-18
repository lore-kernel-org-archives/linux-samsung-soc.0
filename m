Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3071E51E9;
	Tue, 18 Feb 2025 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904988; cv=none; b=p7Dx+ew0ALK1dkrwF0LZ5dftmv37Exr9FvADgXxvYA9LJ+yCgqwZwG3tiEetkfR6rrbBYSKI7eU4b7dt3iNho9TRKbOqtJZoChqYH1/XkWfjmZSjlqHC3YVHUe5EKVOs6hEW5HpqnfM0fldh0rEZuDx/N7A14x4DdJirW8/yREM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904988; c=relaxed/simple;
	bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJSCrEm4gep8Xbnn/XuLqMjiKURUC7wsB2kVjInKzCU5ZVtkXEa24KO+MWBgHIHNVBsWZrOz+FYTyoXZfOT6mnEg0rweep1pBU4YvUpAJZXd0kyuMEe47F2tAyOjDuovKFWfocpnc+mnS+WNYE7MHgV0GAFujxnyrYjJPgHm46Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NmOv0rML; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NmOv0rML"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DCB54234ED;
	Tue, 18 Feb 2025 19:56:25 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgTc3t3JTpUC; Tue, 18 Feb 2025 19:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904985; bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NmOv0rMLzLKJ0t4ajPMdCYXOiFebxZDE1UbU3VGbK+58hT2+1cDEfYi0Pc1gEwDKT
	 o7kzvn8eVbfhp7mZAR7MDOeHucLkidIx/D5VTua1DfHXlaFTKWETK7E0TUNj2idl4E
	 DYOIFrd8pbCxb3++1vn2UBUDkYIRFVxLbyRNBfopexx4vQCltw68wuduxphUN1NeJB
	 lYrAaJ11f2HYlzj/HG7YCUFUbbqWXQxQo5qjcilYn+pupKBAW/8vO2XTiZPjtepEbj
	 t47h2S8fC1kuCXNZxTTMFcBYCgUU2aVooQOVu3oe9yKUBhmQPhBVtgivjKx9pyicCc
	 OMyTWh6611exQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:25:39 +0530
Subject: [PATCH v2 2/3] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos7870-usbdrd-phy compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-usbphy-v2-2-b8ba4e7a72e9@disroot.org>
References: <20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org>
In-Reply-To: <20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904968; l=1340;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
 b=FzjRkqLCgmuuUp/L0aAr50PIiGfxzbyKAXwYztUOKuIlz4Kxs4ZG/eoWZtSN40WhTZhuYqsmp
 7zV5bLbW569BMX3JuOr+lx1VrMzdmfcIazYPg8lvswRxRiucKyf64lE
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

