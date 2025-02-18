Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10744270EB1;
	Tue, 18 Feb 2025 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904924; cv=none; b=iPl46SrfLbaVP2AteWZLNyeKDsoYph3t/Ziq5WB1Ug53XAsuChPjd5JuVqFF1fEoXjnsp4tW1lfVOBhnqDHDAi+46kRXAargmf4GbKboeF2tDQFsoE9WZH1VNvoBGEHjVSvTdQNUYaFmvzxMoKD+bNhnsmz5b/yfy3RRR69laLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904924; c=relaxed/simple;
	bh=WITcutnlYOmj5SGNO+C9ILJDBUpbYgAcvrKAmXZ6d/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rduaLY5nZ5FQ7Do+E5JoPnmx9VVhR8JkkXWRCBXJ00yyzpu4EEyFIhUBOMTT5Cis+9b3Oh7xvWgkDuilnvUIppYblU5eBFg9MgEkQl7ZzhH5Z1pskwak+VW2q68Ns98P+BYhFEBwbp91luxmfwsJg76ZRvrLQC1B7rSiEseM/Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YlzYKEkn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YlzYKEkn"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7A68125A2E;
	Tue, 18 Feb 2025 19:55:21 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQguXP7GJjuX; Tue, 18 Feb 2025 19:55:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904917; bh=WITcutnlYOmj5SGNO+C9ILJDBUpbYgAcvrKAmXZ6d/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YlzYKEkn4K8YIwO7FmntNmsd0swPw5Bo+eAK9WDKhtnSgv5ZN9nFTlA90XPkzFI4B
	 ZKZqi0PoqfAaYz/zi7oKCBQjZZTqDapFpESiHzR9No1Nr+kU5Kkb3dcuwbLbl2H1vE
	 zNq7nNxdOIWTZo2pF0dkxYJwWtd/BH/sSATTpokheFVlJkC4E2VCIvyvrRcsWwharY
	 dPBUZO98JqpYoeUy/8jNFMiFjLttZHhecZNyYVhconaknuXPMzzTIrf0AjTwDgPz/c
	 ftr8KKdMsFoR4Ce/iYQ9Z4zdg7CeGc/lXPMcQNjTz0MlGVxu6xGp2ILf6sjz9o29uS
	 9m+grkyZuPwNg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:24:42 +0530
Subject: [PATCH v2 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos7870 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-usb-v2-1-1de41a89c9d4@disroot.org>
References: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
In-Reply-To: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904902; l=2650;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=WITcutnlYOmj5SGNO+C9ILJDBUpbYgAcvrKAmXZ6d/I=;
 b=d8qUFE4iYY6uVdcqi5nmQrJiKVkMuvleIcai/6k9fuz6RDrcDyYSWTbQC2oXNfMf0EDNNHsFd
 hcBciT8NuJyDaAv9XZ87lY8T5ONpOo5cCG9QjuzMlF13iV3sFgDvk/u
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document compatible string for Exynos7870 DWC3-compatible USB 2.0
driver. The devicetree node requires three clocks, named "bus_early",
"ctrl", and "ref".

Unlike other variants, Exynos7870's USB controller requires a single
3.0V regulator. Assert that the other 1.0V regulator requirement is
enforced on variants individually other than Exynos7870's.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430cebe99106f3b6201ab31d4d9e3fcc55627..b034b5f553491d2ea253c5f7bba18739219c6f61 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -16,6 +16,7 @@ properties:
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
+      - samsung,exynos7870-dwusb3
       - samsung,exynos850-dwusb3
 
   '#address-cells':
@@ -52,7 +53,6 @@ required:
   - clock-names
   - ranges
   - '#size-cells'
-  - vdd10-supply
   - vdd33-supply
 
 allOf:
@@ -72,6 +72,8 @@ allOf:
             - const: susp_clk
             - const: link_aclk
             - const: link_pclk
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -86,6 +88,8 @@ allOf:
         clock-names:
           items:
             - const: usbdrd30
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -103,6 +107,8 @@ allOf:
             - const: susp_clk
             - const: phyclk
             - const: pipe_pclk
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -119,6 +125,24 @@ allOf:
             - const: usbdrd30
             - const: usbdrd30_susp_clk
             - const: usbdrd30_axius_clk
+      required:
+        - vdd10-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-dwusb3
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: bus_early
+            - const: ctrl
+            - const: ref
 
   - if:
       properties:
@@ -134,6 +158,8 @@ allOf:
           items:
             - const: bus_early
             - const: ref
+      required:
+        - vdd10-supply
 
 additionalProperties: false
 

-- 
2.48.1

