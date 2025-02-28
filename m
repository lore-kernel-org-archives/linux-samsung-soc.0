Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB471F874C;
	Fri, 28 Feb 2025 19:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771678; cv=none; b=X+wliM1cE+jpHrwaUx+lqz7pLxPXz4lwZ40U9eDtmXZgEv4hJdno6INIhDemQnBndpQ64qbKeiHVwXrfGnzPkiAh3UEGKZRHJAKTEm7H3658Ex9d7fv3jbtqAPDHijrmOsfXqp7kqxi9bdEGVVO5H0XwPmKJaRKyC09SwWUFMDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771678; c=relaxed/simple;
	bh=0gZvk08A4uXW8YubS0cw+KR0q7k/aUDRmlE/RE8l5TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXQBvkZaFnzGwL/AYA46w7etn/48xeEvVwuvQMl8Z0fTLF9Z8gZuaVNTrhJuJJfsZT9K/+X4287p4eMltfChD4XSAB4Wyv04hDOri7xTuSCcb5afk8YNm+JSqJwcYjBN1LkJfsMGyTkQrE+7sWN6vqMP5AKAShDXVLu0qe5g1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PYDpPl9w; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="PYDpPl9w"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7F25C25B0A;
	Fri, 28 Feb 2025 20:41:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WW11N-AUo2ZJ; Fri, 28 Feb 2025 20:41:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771659; bh=0gZvk08A4uXW8YubS0cw+KR0q7k/aUDRmlE/RE8l5TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PYDpPl9wawqHtedO7/Mkent6nhRsqa3gJtOF+cgAs9SN+yZrYAJa9WbcvjGYkFG0e
	 WS2uQShN7uwLlVKS8JP6wNpcqqmEgSea1jWLiM30IM/U9JQcIYGi0MuUq8pk0y2NnI
	 phrOcqf4OMEGM0SnSGdFAJsa5tZV3dLe7FB3k856IcpecLVFtO0mHZ+d0+VwCDRAB8
	 H7HYehsFMM/2Dv3ssSUTHM+5CeympYW/Vq6VnNE/Y7cxwRSB0h2cqAUv8Buux/kQeW
	 1kNaq+dPKTbwe2XemEn9Udh1W6/wiRP4zfXeT50iSnt9JrDNxIJjCLfTgibivOIWqt
	 Ae2o4bYcpt+JA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 01 Mar 2025 01:10:33 +0530
Subject: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos7870 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-exynos7870-usb-v3-1-f01697165d19@disroot.org>
References: <20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org>
In-Reply-To: <20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771646; l=2708;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=0gZvk08A4uXW8YubS0cw+KR0q7k/aUDRmlE/RE8l5TU=;
 b=vWh1dTGJB0Dk6aLitTsvCuVoYsLglWrIpKD72GbNL9Ju8t3FBxDcTEFT7mtMpH5e7OF1TO8S2
 zOqxS4fAy9OAi6k/UBNpcRR0Lk5x1uLwHQrRSDnoQZJ5TZvZ3kjZ3Sj
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document compatible string for Exynos7870 DWC3-compatible USB 2.0
driver. The devicetree node requires three clocks, named "bus_early",
"ref", and "ctrl".

Unlike other variants, Exynos7870's USB controller requires a single
3.0V regulator. Assert that the other 1.0V regulator requirement is
enforced on variants individually other than Exynos7870's.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml          | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index f11e767a8abe1d2fb7faa6d6b5be09970c5c9b37..256bee2a03ca189f360e2b677f101dce25a0f368 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -17,6 +17,7 @@ properties:
           - samsung,exynos5250-dwusb3
           - samsung,exynos5433-dwusb3
           - samsung,exynos7-dwusb3
+          - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
@@ -56,7 +57,6 @@ required:
   - clock-names
   - ranges
   - '#size-cells'
-  - vdd10-supply
   - vdd33-supply
 
 allOf:
@@ -76,6 +76,8 @@ allOf:
             - const: susp_clk
             - const: link_aclk
             - const: link_pclk
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -90,6 +92,8 @@ allOf:
         clock-names:
           items:
             - const: usbdrd30
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -107,6 +111,8 @@ allOf:
             - const: susp_clk
             - const: phyclk
             - const: pipe_pclk
+      required:
+        - vdd10-supply
 
   - if:
       properties:
@@ -123,6 +129,24 @@ allOf:
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
+            - const: ref
+            - const: ctrl
 
   - if:
       properties:
@@ -138,6 +162,8 @@ allOf:
           items:
             - const: bus_early
             - const: ref
+      required:
+        - vdd10-supply
 
 additionalProperties: false
 

-- 
2.48.1

