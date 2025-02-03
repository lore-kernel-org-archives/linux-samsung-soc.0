Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0CA20FA8E;
	Mon,  3 Feb 2025 20:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615025; cv=none; b=V0pIJoVGMqVmvMoJf2EsM18ReIu5cJ4qQ2cgKBuc5bxJMEMaYnTLzllc2jcSpc1yW5CV+cYvklNzYn9uROsOT7Ce78yoQDwf+efFrXU/04xIokX+r+3OaarKBojApoklOwb0pj1VsIJ+6ca/D0z96wZVhcGT1C3puH2kgMnO81k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615025; c=relaxed/simple;
	bh=fK71DFpTRzxbkAhjS6lPFVqITohBrsB1knOO6JRF+GM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQucOjC5hIEucjmjLl2ZdzwaJZ5U1EIJXh8izUyRCrMecK74hvZ6lYRga9v+nCKOzstEV5jBDfys/0An4RFQVINgJW5YDiGuovD/WjexC3WkoxPVhZDsComaOp6/a1QT5Dc126anVvVZGgJk+dIg8unslID98fzI8RIxbcPESGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=LZ4LUny7; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="LZ4LUny7"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4A38E25908;
	Mon,  3 Feb 2025 21:37:02 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9t2zrK4kzNQA; Mon,  3 Feb 2025 21:37:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615021; bh=fK71DFpTRzxbkAhjS6lPFVqITohBrsB1knOO6JRF+GM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LZ4LUny7YqbKGTTIeQahjqb9ohXVaJlDf0SZA0OZhAvJEOR68mMHonDB8t1gfZcCP
	 CWAsifMlPWd+PGR7u12zMuGWz1egkBCM5NJYOCmnB7Thz5cc00fT2Ov93NahFS7oC0
	 vkZQOJbUp/rbNINVxj/EF2J0YTItdc/y/SYhLlWoS5HSoqujZ79DGBmyA0iWIrHYz2
	 fS0UBYje3uNjCvwrl8WslPj1lj+25Rfc4OlruVfEsNcq+/exTlStb4y5uma3Rz6DRY
	 GqJuPPt49U5zik1AZbj9cyFHL+/Szkoi+kJv906FcrVZbKcG8emXl9nDk5B0Fvah2Q
	 C84C2aadfsuXw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:06:27 +0530
Subject: [PATCH 2/4] dt-bindings: mfd: samsung,s2mps11: add compatible for
 s2mpu05-pmic
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pmic-regulators-v1-2-05adad38102c@disroot.org>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614996; l=1516;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=fK71DFpTRzxbkAhjS6lPFVqITohBrsB1knOO6JRF+GM=;
 b=jEKPnKEoyqjgzOep5UMBo4iYZynu3QAVZg7YH4GcNDGNRCRa8ZEnokp1JWtZiXLWQVRthFT3m
 2XxS/HjVmmvDLgrEv5cIvEoEHcPCi73fji4t/pCo7zy1rZAy6RjJJ5C
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

S2MPU05 is a PMIC present in Samsung's Exynos7870 devices. It houses
voltage regulators (21 LDOs and 5 BUCKs), and an RTC module. Add the
compatible string "samsung,s2mpu05-pmic" to the PMIC documentation.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index a4be642de33ce6b987fe011adfe4f6b938c20c19..ac5d0c149796b6a4034b5d4245bfa8be0433cfab 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ properties:
       - samsung,s2mps14-pmic
       - samsung,s2mps15-pmic
       - samsung,s2mpu02-pmic
+      - samsung,s2mpu05-pmic
 
   clocks:
     $ref: /schemas/clock/samsung,s2mps11.yaml
@@ -125,6 +126,18 @@ allOf:
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpu05-pmic
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mpu05.yaml
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>

-- 
2.48.1

