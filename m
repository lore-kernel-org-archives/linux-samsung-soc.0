Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3220A134AB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 00:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718671069; cv=none; b=Hkdu8KY9v0ECEaRbvw11+uko8k6z1Hl/PYa0xY/gkJz31Vudm4t9CYjQK7WaPs2nhcf4+4rz8+R6hQRJAloFQ/5JXAtfVVPOvP+7ZzGY1jQwWdqqXaQjCj3zu3M1YZncZv04PUoF///DRqo/iFkHSOZgh9lBUgmSiylBJK+Djls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718671069; c=relaxed/simple;
	bh=FPECna8QubWZJWyI17d+5QqMeSrVSngVEd37TbVrJY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WfQQiLeJUaeRqcrlxRI2RymzHdYDRMjfoyeuLXGbup5qUvhiZg4O5/uheZzGqdLxD8d7CWtu2gDvwLqOi31Zzf0hP5DtdWL+PL0CpfCFrd930CgipUrFv3eW8hJb8T4YWAB1x0H+mGRCyl4xNldJ2E2pp5pa9omC2EWfrUwPYmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjmu609N; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjmu609N"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5b97a9a9b4bso2384224eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 17:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718671065; x=1719275865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQ++MWratnfX3umvtaDdV/3AZjItAbPo3zx0EZywnGo=;
        b=bjmu609NqRv2L4oqh1Xkunfp6nAsjqQpmjr/ey7aFBMEIrDCIJGs+jh9zEz+QHopjI
         +ZKbjYNR/dY3KI84v3A9SokmLRgxbmjOCJ66ECiwU5hrGQmz+Htp8gx+bsOMq4yQLRKM
         rsMgC0z13xT/5D7xBtWQQsKWUhp5V791J4ejNltPij8KY22NHoVVxQBr5q/+0CEPu7ho
         KIZDvQMvqKUQzOxakoH2x3D1djnHLQdzHP/1niUePtBCo2eGrbs3botTSCeUcHy4yLSD
         je78RJbCkBVjaM4etU9mNvsMjJgU/JyRLULZQqXnQOXMRgYP8t94Yw5y8kPOQ55XCAsL
         4wzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718671065; x=1719275865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQ++MWratnfX3umvtaDdV/3AZjItAbPo3zx0EZywnGo=;
        b=AeEzzDWtz7RZTffb3RRDeyB5TmZoVk4S6IvkuY45NuQicljKPif7kCxGqSkWJTxTpn
         HSIu6PlvwdyUqzRVPldH/JToNo4R9tJulXuqBlFcniYh7fRdjPIJOm99KM5Gj75/Jz3/
         pc4AodWVBbB5li9i9+3v5HwWTWP440ucnheuy++t4OJdepbEBxGVIDoC2obGMmOuJAjC
         qTzS4vrwfgYutwoWhs746i/O25J4Qzy5UMY9kmSt1fo+R80lNqyFPzjdR0RznXZ+eGXe
         R6YNTeOKgrncj/wBZGZ+LwkbW2CwIGz8ODYq/gCBEeNiIAURwYBhfcS/fwNbjQaovJrV
         3Wjw==
X-Forwarded-Encrypted: i=1; AJvYcCVw4lhNLB08DKc5uRQnq6UUwnZjDers20NWUonkfJrGElwEbhw0sduUoj9m2RtTm8H1qSAoKbS0Iuon4ub+GY4tjFKZRQVUFHELeD684aPNbxM=
X-Gm-Message-State: AOJu0YyHBrVXVfMHnj7zj3cOqYZMWRwQwK4MkTFLWuEY78cnt75LdWIi
	8B+Yq9mVMG/cAroWfGCzUpbjGsNyCqKQ8beiVCaBCtWOZHzX98ks1RzWtYytc/4=
X-Google-Smtp-Source: AGHT+IFuFpjdFpuLvIdaYw3w/WCr1/gHlrImp8DoWkXpIxzm220GdkXoQwm/XTk+jxZ+CH+KzmX0Xg==
X-Received: by 2002:a05:6820:161e:b0:5bb:2d23:8aeb with SMTP id 006d021491bc7-5bdadb68eb5mr13265376eaf.2.1718671065156;
        Mon, 17 Jun 2024 17:37:45 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd5e19e943sm1229935eaf.23.2024.06.17.17.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 17:37:44 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: rng: Add Exynos850 support to exynos-trng
Date: Mon, 17 Jun 2024 19:37:38 -0500
Message-Id: <20240618003743.2975-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240618003743.2975-1-semen.protsenko@linaro.org>
References: <20240618003743.2975-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TRNG block in Exynos850 is pretty much the same as in Exynos5250,
but there are two clocks that has to be controlled to make it work:
  1. Functional (operating) clock: called ACLK in Exynos850, the same as
     "secss" clock in Exynos5250
  2. Interface (bus) clock: called PCLK in Exynos850. It has to be
     enabled in order to access TRNG registers

Document Exynos850 compatible and the related clock changes, and provide
a corresponding example for Exynos850 TRNG node with ACLK and PCLK
clocks.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../bindings/rng/samsung,exynos-trng.yaml     | 49 +++++++++++++++++--
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos-trng.yaml b/Documentation/devicetree/bindings/rng/samsung,exynos-trng.yaml
index 99c382d25c11..e57310fa89c7 100644
--- a/Documentation/devicetree/bindings/rng/samsung,exynos-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/samsung,exynos-trng.yaml
@@ -12,14 +12,17 @@ maintainers:
 
 properties:
   compatible:
-    const: samsung,exynos5250-trng
+    enum:
+      - samsung,exynos5250-trng
+      - samsung,exynos850-trng
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    items:
-      - const: secss
+    minItems: 1
+    maxItems: 2
 
   reg:
     maxItems: 1
@@ -30,6 +33,35 @@ required:
   - clock-names
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-trng
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: SSS (Security Sub System) operating clock
+            - description: SSS (Security Sub System) bus clock
+
+        clock-names:
+          items:
+            - const: secss
+            - const: pclk
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: SSS (Security Sub System) operating clock
+
+        clock-names:
+          items:
+            - const: secss
+
 additionalProperties: false
 
 examples:
@@ -42,3 +74,12 @@ examples:
         clocks = <&clock CLK_SSS>;
         clock-names = "secss";
     };
+  - |
+    #include <dt-bindings/clock/exynos850.h>
+
+    rng@12081400 {
+        compatible = "samsung,exynos850-trng";
+        reg = <0x12081400 0x100>;
+        clocks = <&cmu_core CLK_GOUT_SSS_ACLK>, <&cmu_core CLK_GOUT_SSS_PCLK>;
+        clock-names = "secss", "pclk";
+    };
-- 
2.39.2

