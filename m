Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7F617625D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 20:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718743528; cv=none; b=FuNeVKDO9tnh4TRnM2JYrv9/xek1f0wxDIAeo8OmaLgoLpuUpqvCyOKHdtBNkbjXYPQsaQIgE3/28LFdqp4/W9tfXsvPACsE2AIJ5F/qivYc65IgO9MA1PmT2BoRh2zMBkBujCirQ+2ZYaq5x2dLsgZcXPfi8tkEeZe5qIfmp08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718743528; c=relaxed/simple;
	bh=jCr2PSyk+QzA3n1KIeezmKnsRWEIq76Xr/2/3wqo+Ho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oljCRTP044Bw/C1Gvj09R6tiLwGMyiXrf+uD5AuSXzrkEy4G3noSfQdjvtwgOZBcD0hqkrjD/hnvs3GjoWhyjii372a9zHjPAhECPsk6YvdbPJpscszqCE7hNU8COFg1PzidjF7rZ6XdR0cE3gP/7u32kh17wAbqloJ5OTTG0hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SkwesoYg; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SkwesoYg"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f8ef63714cso3484965a34.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718743525; x=1719348325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlbvvMZMqGqL9+iJm7HJUKaP51agxlDWROSsJ57jie8=;
        b=SkwesoYg7VwJrx3rP2Davq8TCBbyBLRbJ7Fgaac4j/4oN9bzcc6stGTcoxzkuJZu8y
         lLrw1vhOvW2hhSTG66fwsyk6jG206ziommkub0nqko6V2bN6Gf8ekxJi2rO/Ko7cQUa8
         eHb+TyTtQ6dNg95qrA1A79LoVXsP542WTD56cOqoJWCAFsfueRD62b879GkDE7iM4URQ
         tN4syU3DJQGUCjKzbIuXn3lhDoynNPxwfj+qxUCWDNPVweHsvhZJbmMFpO/2sc//Klc2
         ccbKrc5rXrUOShPnoK1+y6g8FnptpkHppq3PulPeH0wsN/uBa22NklYFfvvRv41U8YKC
         CHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718743525; x=1719348325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlbvvMZMqGqL9+iJm7HJUKaP51agxlDWROSsJ57jie8=;
        b=Z+XNX9EPIkFG+WJ2vJci1P2oH+NBDqRQot43oPNOXdpVEnzVrvq/1D/bqAqBZEgj4a
         piYHx+L06nxCFXVWQ19xY3gDe/h+xEmpOJTIhk1y6YzM/FRHHAaTJ4pOr+U1phntk9QL
         vGwWY6cT4s9tXlKGjxB4izEqLIR95VRkCIKTsIb68OolWig+o2u/eNRT0QyKT1sMRPVU
         m/WQk/dDYUyIHC/NyTFkQJWiHWFqaSsqb1iT2IFzNnjIcRYHgFWikO4yEsOM9dT6bts7
         qHqgAiIy7kw5+++cJasfdzAOrXHOG/+MNaD7fS0GGMYBfa+bBU4wr+/iXZWvmXKIwWs+
         5xHg==
X-Forwarded-Encrypted: i=1; AJvYcCXB9q4QfG7wvD0ZZbARnq56IBK5ToVSg8YLxpeSdgFSYyRbm4CP/+ELhrgHl+4ZA5dbZoWndDnQIs6dT5VJ63fSDd15DfU4lyOfDC2etOPaSLo=
X-Gm-Message-State: AOJu0YxLp3RbqRuilYU+brne8vxCDR/NjjBYxufy7tyneBqnJUjZpH5b
	Vo/8N9wbs2JzPJ1aWDoWqnID9MmYsQqMLCYIdg/PJa1nCUsvNSgOwA2eIyY9/So=
X-Google-Smtp-Source: AGHT+IHtQ4jPiGwmE6Fqz4f+T054gfg7HjueTuRrzz7pHpWmzy4tU4cMlClLNNSm5wif6dmg4G42uA==
X-Received: by 2002:a9d:7841:0:b0:6fe:858a:8d4a with SMTP id 46e09a7af769-700771e7314mr874352a34.35.1718743525201;
        Tue, 18 Jun 2024 13:45:25 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5afab892sm1937125a34.7.2024.06.18.13.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 13:45:24 -0700 (PDT)
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
Subject: [PATCH v2 1/7] dt-bindings: rng: Add Exynos850 support to exynos-trng
Date: Tue, 18 Jun 2024 15:45:17 -0500
Message-Id: <20240618204523.9563-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240618204523.9563-1-semen.protsenko@linaro.org>
References: <20240618204523.9563-1-semen.protsenko@linaro.org>
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
---
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

