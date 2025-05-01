Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BCB221F21;
	Thu,  1 May 2025 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099237; cv=none; b=YJoAoJGlCGq4fBrMmiwNMC+8hhWn5OMqU9/DhzBwNPlrs8ztZ3kCvAZ6aPbHfTz/hzeY6zuj+FLAfIkRWCsKlU66pEhoutNzEopq5smy++xKrE+IgvkmMmfYxlt0eJdUcKi3plyt1T7ttWBc9qf7V4WZI6qaWbClBChG7eT3a94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099237; c=relaxed/simple;
	bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emCsH8iqdx9AOL5Xb1OaZcXyBEisk3kkY41Q/ZGtqYyS1lpbyg0SJXKIbAMt1sUR7FSwcr2qQZhrvaSlZQg7lPKObTaVcgbzsrCVVqjn6XH8ExrfAPAck/jfFi9TxnXwYzLqGNaSh/BkrEkFHFJtwqc2gPvcGD1HnGm9EoTUkxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YFiv6lV8; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YFiv6lV8"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5C71F25B9F;
	Thu,  1 May 2025 13:33:52 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nc7fhaF9XpJn; Thu,  1 May 2025 13:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746099231; bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YFiv6lV8lu+8Sht1wrUjTbb4DyYavZRamoZSVkfmS3JQoMgj5V8CfLecLgn3LzBR8
	 XjMYLrnAQIode/FyXcqZXzZzhqiecgM6GNl5aJC215Techl4ycEKsT+Sa+h9xxXQ4J
	 Rb4YNJWEf2l8lkRIFn2TH4Al7IE/uQU/MuS3cNkh6EprUzSMTQJLof3IZthx2fuSXC
	 cnXTD7ALJl9Pd5GrO7Bi/6jqg9qN68f5rBaa4+LtW49mAtf0zdEEJaQMOTqIPFuNLR
	 hLXaKCTv7Ky/Fui4qWsGBGrlnd0ZHPIyYGq/JhD54PuF3J4qVS8wk75V/4ltwcZ7BK
	 LMXOMLd08itGw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 01 May 2025 17:02:57 +0530
Subject: [PATCH v7 1/5] dt-bindings: arm: samsung: add compatibles for
 exynos7870 devices
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-exynos7870-v7-1-bb579a27e5eb@disroot.org>
References: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
In-Reply-To: <20250501-exynos7870-v7-0-bb579a27e5eb@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746099219; l=1470;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=uzUwV7MCGPgFoaynlKP/SaT802tNGgqv6rxpk5HZMN0=;
 b=cClJaaD9AKPEJa8s4BKtIfkQf0ewkjgPgwoW1VDTDUy/30st1i7Goaqx2hOMMKVYmaOd+AENK
 y+7rH1tCi6mDWx9o2WOvIUWG1tejelepO6DtrpL7vUcPt9RHRiqXBBh
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the compatible string for Exynos7870 - "samsung,exynos7870".

The following devices are also added:
 - Galaxy A2 Core       ("samsung,a2corelte")
 - Galaxy J6            ("samsung,j6lte")
 - Galaxy J7 Prime      ("samsung,on7xelte")

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d8e62f5ea75bb0819a9d514e54f88d3c..b3be184c7e563478aa37eb16a69c08ff7f70af29 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -212,6 +212,14 @@ properties:
               - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
           - const: samsung,exynos7
 
+      - description: Exynos7870 based boards
+        items:
+          - enum:
+              - samsung,a2corelte               # Samsung Galaxy A2 Core
+              - samsung,j6lte                   # Samsung Galaxy J6
+              - samsung,on7xelte                # Samsung Galaxy J7 Prime
+          - const: samsung,exynos7870
+
       - description: Exynos7885 based boards
         items:
           - enum:

-- 
2.49.0

