Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D524331A4C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915368; cv=none; b=f6RGVH7RpMsv8PonxadHTChE7rHxJZM7rb3nIk7meI+UUSyqsPxbxzTeUG5Wg9HjCfWYbaxabiEp/LrzgClLc+GtjAnl342pMCnV5G3hCB1MvVCzTbYsPphF+pQZrjQOstQjWZbouHAzL/fEELruw2iV7oRkli1HPZ06sXVeWtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915368; c=relaxed/simple;
	bh=52mHw6aKRd81AmHkFdwI5f2O5qzG7/nRl12+OyMNuEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGzHLH/vHB0qgJlKMizImQas3CxDYqZyA105UjdYvo9s/zUl8KlH5ZfsAFK263Scp590bQIeaLYXlNe95c8dqw1gBr/T733hO+BSmF9sMkWqHPBX4rQ+bq+9usJvy7QyfA39OgdfOiqdWzS9gzs8QbhzCMGb1CTAQRC6ln+3B/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6qbk92i; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6qbk92i"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4710022571cso23678725e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915364; x=1762520164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w81C8PO6GyjajvSZnVcib72PAdJ1z5nHo14vlKsXejI=;
        b=g6qbk92iiErU3uxKfLfXvLrkzgZputVtL26LTsivzUDsADma4Ty9cDeW4tEzKEzVZq
         zLgVJAEi1zPzgMFvAsea3qw6eQb3tPSz/61rIVZt1/IYQZGwQMv1/IwHwFYiwZY9Pi3K
         HYaPuj7B2o0i8P9QNO0HabpHQmq6fRKH9KUCy3t4JmZLiC1VUFTtVRhLYQ3AlcCwyGGl
         0s5YHn24eUkYZz7OE+hxfHZ+yDPsP3i4Oxcel7vnEr/qzPoIvFOHjl8GIrQgF+WZz0bK
         czQ8DgMYXxNcu484EWrM+pNS7M42IVBhcpgMm61smy5nTuEm7ZYk2UUQzdzJZPwASakn
         R3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915364; x=1762520164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w81C8PO6GyjajvSZnVcib72PAdJ1z5nHo14vlKsXejI=;
        b=KgziG0/kmN8crIfFtCrNIRj2XXx+T628hYUi8TRZxZwnzRbwVKxazAeBfFoaANl9UY
         wbm8msTZUkS+JF29kRPi7UcmUSw+ObgoQgF9TYgCOJPrxaSMnseA79dEDaxnSVj4qrR/
         wQZKVBrdw2ECKECC8+VsEYGq0l7fWGO6TzKGtR12TmOcF+KJdXohZcq9y6TcSw6PokW9
         5XNUyKZCngwR6odlSfdW7SYG0mndkZ9zSafTpyt8GnhPmEqzWy2qoU7ESe9h+TZjF/9X
         a7NiDuSxeC4vtPovgD9oW/Isz6VxrkpqaLlMlECIqhkoA08JluWrfairnkofHbrKEhT8
         kBeg==
X-Forwarded-Encrypted: i=1; AJvYcCWEy9vHb/kxoBA+h6QyVSkO4hWg6UA/H1Fik7A3qjiixgTGcv5rB7LhD2j9o7yem4ownqiW5ZMGb0n1Ztx//jsFtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAzUUrALcd3b4Rexd+qgiOmRdHqYVYb7klBtre70LqAN+InCIj
	hcfoYwDbGAUPvwaa4ZZ3vJ08DLTZGnwhtEc7ev9uY+wvyDI+T07d0rSPeJs+L2B4mp4=
X-Gm-Gg: ASbGnctL/X/mCRJPhc2GeYLMuTBHnpGGn5ACSIHePqzz6IrO5Yig5nasFDXdbhb7b78
	yP5PqKjYfNg6yn4esFmoQiW5cwtYSe4Oq2vwYtxKH8J6yDdUXTfP+7ZZryDLeKIVXU4qYuj1UcG
	ZdgeVM16nBq13RGgNB485gpql/A71QLf8Ajlzf/Be6PjUwkJ8+R1nWvG+CG6iGzGzCvpxvVACiY
	BrKbJaEe44V2RBNVNPkDVaVu0kAuWk0D0KpeMB275Y1bqlrno2pcuCKFHLUUs6fxfWQYila++Md
	EAbUwCTh3aeMV63n36zSTrFULXlAq+opZFpxSnWLX8Lep6fyqL3gJfQyurweuvZXDpzIZn+pcWx
	HVmS4LokoAcmuYSL4yWv+73bK/5tXR5jcBJdddkhtn8mRGugfeafkR1F6+4nEZ+fe6Z1ZHRrBsm
	9Rg8H/aEkdXiCTD036y3U8vgyAqF2V0EodhKCxZxXpfaqMKWd0HKNdAbkJAk1RfXk=
X-Google-Smtp-Source: AGHT+IE5HT8zyhO+x64QxgSYjKr7L7F+qcefl5D+0FWEsp9ZQtU+HT7k2Pn+gFUE7dvYr1UxapCqpw==
X-Received: by 2002:a05:600c:19d1:b0:471:747:2116 with SMTP id 5b1f17b1804b1-477308b943dmr32724215e9.41.1761915364051;
        Fri, 31 Oct 2025 05:56:04 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:00 +0000
Subject: [PATCH 01/11] dt-bindings: hwinfo: samsung,exynos-chipid: add
 google,gs101 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-1-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=2586;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=52mHw6aKRd81AmHkFdwI5f2O5qzG7/nRl12+OyMNuEs=;
 b=vpkvnaAKzBlUYUyJicoR7s8ZIonwBdHpBvPXSHqnML9kKehWnWDt6lXVGE1gK30tPNuHSi6tz
 tYeAfPhVfVCDtbiE6EMzCUWvpiA6l7oT7wpXfT4MIUlK7O4ZKhTeT4t
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Google GS101 Chip ID references the nvmem cells from the OTP controller,
it doesn't need a reg space. Add the google,gs101-chipid compatible.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/hwinfo/samsung,exynos-chipid.yaml     | 51 +++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index b9cdfe52b62ff3a365d61368c39db21facff6565..6d6260be02d47712ebf1e4d31973802e8340cdfe 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -33,6 +33,16 @@ properties:
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid
           - const: samsung,exynos850-chipid
+      - items:
+          - const: google,gs101-chipid
+
+  nvmem-cells:
+    maxItems: 2
+
+  nvmem-cell-names:
+    items:
+      - const: product-id
+      - const: chip-id
 
   reg:
     maxItems: 1
@@ -47,7 +57,46 @@ properties:
 
 required:
   - compatible
-  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            oneOf:
+              - enum:
+                  - samsung,exynos4210-chipid
+                  - samsung,exynos850-chipid
+              - items:
+                  - enum:
+                      - samsung,exynos5433-chipid
+                      - samsung,exynos7-chipid
+                      - samsung,exynos7870-chipid
+                      - samsung,exynos8890-chipid
+                  - const: samsung,exynos4210-chipid
+              - items:
+                  - enum:
+                      - samsung,exynos2200-chipid
+                      - samsung,exynos7885-chipid
+                      - samsung,exynos8895-chipid
+                      - samsung,exynos9610-chipid
+                      - samsung,exynos9810-chipid
+                      - samsung,exynos990-chipid
+                      - samsung,exynosautov9-chipid
+                      - samsung,exynosautov920-chipid
+                  - const: samsung,exynos850-chipid
+    then:
+      required:
+        - reg
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-chipid
+    then:
+      required:
+        - nvmem-cells
+        - nvmem-cell-names
 
 additionalProperties: false
 

-- 
2.51.1.930.gacf6e81ea2-goog

