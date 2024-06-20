Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB213777F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 23:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718925223; cv=none; b=eQbdnkf5n1IVkWGO/4ypWJJ0wylSe4A30Jczp4DAQ3Y0dx+PWZCpUEIC/CvOFJgiFXgia7UHugED+v2AqhJX2y6DNsB1vWvUUkDalmRmqFRYfO9QwTRYmYqhqIkpXdxc2slTI8o3CvjtvNIISNUHK5Lrgz/ddKozqfCvaLlvIPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718925223; c=relaxed/simple;
	bh=Whyoeq1D7SDxvcUKI5XVEFUK8fYb5jRbVCwFDw72hvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HkJHJ14/kPx35Ua50lo+V8y3ovL1JW5N+a5LKA4daRgYKBdAk4Iiwk9nV5eZ7vmjzQyC+mMYs3B0KN7UVfOwXnYUDhZXC4sZME+jOauFNbvbh/aWC76Na3JN1sBWhkM2l0/lDlofSJEwGfRkN44f0986A82ldEDCobX5JqM3ZGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YOd1sVAK; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YOd1sVAK"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6f9b4d69f53so761283a34.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 16:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718925221; x=1719530021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgnmbN5MPz4u6HwtpTU4Zp3I0CSg6ni7gpmRecQhhsc=;
        b=YOd1sVAKkcjQTszfoc0vyasf1TmpK3wGhbTM5TIIKFTP/NSF3Azs+6R136sCQrO24X
         6Z8wtidK9T7bgdc8OcLs4jVua49ESNvXtrb+7R26+tA6FGDQfkEC+eBiWIfTdP8dvp0D
         rNfu8TK5j3VvKbNUGgwo1BR2pkf4CkT2cGviZ/yWJ78djxFzmJzUtsu0nt4DMLmRYjH1
         nMirQA7DrHCLaXGJa2cA9VIKwqCL5GwCTuw3eqF/tuI1ZmbmeeDdKl09BbPsoCLuI9a1
         aYm2Cchq4doGKrdqQ48P+wziQgvn2UZc4PBue+b5pbVeESBk9gdHXOXPDySqJlCiC1AU
         1TJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718925221; x=1719530021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgnmbN5MPz4u6HwtpTU4Zp3I0CSg6ni7gpmRecQhhsc=;
        b=XjkzFy2rqOouz0fHUEGGtHUrZFsfmM3167DcclXhGty8aLlXzx5x2Hmx627qst8W1F
         R7+QQowlP2vB0kQsxxrfaTf9MdHmmy5KWQNOZFib2CebjUBuB8NiybQBtKwhqxNhiFrX
         1UySzN4GpQ1mwklQXrQ42GC6+Q3kxLlN0TE7jZI9HVdC2LDPO2GPQy/j5zgJJuoJgxp9
         Xhm0QYttDYltj2a+EWZhYY+fLqaU6pGmXbmTTITFTz+7jNNH6b3xhfr/egT0PF7ILJpS
         iWQobhaOl1knyS9TTHrX8ZDFS0seNEhe5GtJ9aepaTRaaaieyetNAk2EtfvCAObXFNj+
         fdjw==
X-Forwarded-Encrypted: i=1; AJvYcCXMx5svh0c/YY++JCjafHnisbHHFJ0QAi5pCc5VKj0ngtyuECBumnIOz86dshJ8RSBRlZ4BlimGnFdoZzB+z0VZifreqYyCaJRQ/TpLW0nFaIA=
X-Gm-Message-State: AOJu0YyZEO2MFpIz7lDwvyF8HmooVvOw58ufvWIX3jLJJCi93MmHCrXF
	/NmWFiOpVChY55ct8VI9WpXCLw9ThMv+sydLHXV+4xzwN3qhcRn4Ct2d1sroQw8=
X-Google-Smtp-Source: AGHT+IGcflyEPj6w5naITQ8Pm+V6zs8OQmKJmr+51gTiWQ/prs82vRgY/sUN5+lTjL9xSd1p6OXsXA==
X-Received: by 2002:a05:6830:1018:b0:6f9:a5bc:fae9 with SMTP id 46e09a7af769-700748c96ccmr7378826a34.10.1718925220685;
        Thu, 20 Jun 2024 16:13:40 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7009c5df247sm89737a34.6.2024.06.20.16.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 16:13:40 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: rng: Add Exynos850 support to exynos-trng
Date: Thu, 20 Jun 2024 18:13:34 -0500
Message-Id: <20240620231339.1574-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620231339.1574-1-semen.protsenko@linaro.org>
References: <20240620231339.1574-1-semen.protsenko@linaro.org>
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

Document Exynos850 compatible and the related clock changes.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3:
  - Added R-b tag from Krzysztof

Changes in v2:
  - Removed example added in v1

 .../bindings/rng/samsung,exynos5250-trng.yaml | 40 +++++++++++++++++--
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
index 765d9f9edd6e..1a71935d8a19 100644
--- a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
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
-- 
2.39.2

