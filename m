Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620DE14A89
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708067164; cv=none; b=FOrT3/JTV+TNPRn9jMjyTs3VvZMAhjjDx/xksDFRdvtQzotGdCzDxAOzTiG8t++2LwLbr7pWgHILvCBUSpXNa3cu9SQiDOgDt5AzaP0FmMLrL8sKi58XGLag6YHyKen/sXfsUDHOlif1N23uONnB1K7xqrxCTjkUc0S3v6rSylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708067164; c=relaxed/simple;
	bh=F3yQsq2MS2bkjotNZ+laXHazoBfJq/kHzLHG+U6tCvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XszA7pB/CZjSwCC/cZLcAPiQboIU/SGWSO4XIdeEyKfT86HJYz0yaia7yunEkdw6F5IabXETkW1NN75iMP4MikMMLntxpWWcQ2I1z6K/ViU4XOWT4eFGGdU+7b//tXPZgv4kGD9HN7CuxdvNoKJVbqN5Y+l4gizh7/4Jxjq5R2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MPS2SDTF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MPS2SDTF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41242adfdd7so1911775e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Feb 2024 23:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708067160; x=1708671960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8D7ZEx/LF+mDksAYVmzVu5K6Rxew4tV88XlD+DBkpGU=;
        b=MPS2SDTFiv3uSdXsveGVKrMvih9bWjyNLhoebluADbHI0vmIxjD2ErWWhexTBKWMW+
         TQ3ZuQELoiMYN9BalhVZryV2gKEd/yOXJnrrSuq8fObfKhLmZMWzK3Csbx3zZ55AgjLD
         BTWBM2sCZXkrCOhWWxeVEosNAP32NaMSChiyGhAI6aah2yfp4qyDeXUZu5JheYuICbma
         O889Yt3P/FGpVEMPoKQUZyGpRsYXYGMOdJMALD+hBFRYcloiKS7ePxbRSdYbWDFzEq7j
         Fn/Qb1+QfjX7gtNTOGWLzmCyoX21MuLPue59V3ZlCi9XGdowaimrpjCiYbDRrRNvV0Do
         KZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708067160; x=1708671960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8D7ZEx/LF+mDksAYVmzVu5K6Rxew4tV88XlD+DBkpGU=;
        b=ShcirqI4LH3P7/8sFt9O0dMGcCmKnBTaZ340fI8FphDTAgRFzFHaCBBf0As0ndv4dt
         M1t2GV34IX5XxVANAEQnZxk6G/QEN8zwxKwPgQCQmC3hFaaw/Yg6wbCCeevLbjkXDF/L
         pV1hyM34tZbrHHY3BIGwplCW8gFuMk8P3FxyPBwBk/x9NgbXeFlO3BjMIfiQsPg9/t0G
         N5sQgM8Hc0NTrYpk8N/rCTdqeg9PZnZZi99VAMCg5AbZePae63xvNZmeIhiR0JH1WN04
         IDO3aif10r5LgE9+Dwk4wf8iC+hDm+6ujAE5XZHRaI1QYeqmrqrd8Uaaoj03ERV/FWg9
         ua9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0t9/tJxgND3MbA0Xn6vD7698afEJ0u0qjtLkZ+UWctA0bJTEPUfHLeEAXwmh8XQhjJwyuStrw/vMYqriUd+DqdrF3H2DWNPHJJUYkwNdvEno=
X-Gm-Message-State: AOJu0YwCLBvZfSirT+RQpV7EgE8pdl+qalq/Tlxc5Q6jTg/ahsy1tRCy
	wDSqRdtAffhHN32wYNS6/b0WHKWcPMMco+2R5s5SdylBlhW7OeiG6k1xvHLcZOE=
X-Google-Smtp-Source: AGHT+IEaVVo8epQKUlxIIvLhi2Q03wenfAIfbN8GFZX4RL21UNSksOlgMTjHKy944oORUJuiWp4u+Q==
X-Received: by 2002:a5d:5387:0:b0:33d:13b6:1dd6 with SMTP id d7-20020a5d5387000000b0033d13b61dd6mr1938422wrv.39.1708067160583;
        Thu, 15 Feb 2024 23:06:00 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d66d2000000b0033940016d6esm1298839wrw.93.2024.02.15.23.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 23:05:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org,
	andi.shyti@kernel.org,
	krzysztof.kozlowski@linaro.org,
	semen.protsenko@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 01/12] spi: dt-bindings: introduce FIFO depth properties
Date: Fri, 16 Feb 2024 07:05:44 +0000
Message-ID: <20240216070555.2483977-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240216070555.2483977-1-tudor.ambarus@linaro.org>
References: <20240216070555.2483977-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are SPI IPs that can be configured by the integrator with a
specific FIFO depth depending on the system's capabilities. For example,
the samsung USI SPI IP can be configured by the integrator with a TX/RX
FIFO from 8 byte to 256 bytes.

Introduce the ``fifo-depth`` property for such instances of IPs where the
same FIFO depth is used for both RX and TX. Introduce ``rx-fifo-depth``
and ``tx-fifo-depth`` properties for cases where the RX FIFO depth is
different from the TX FIFO depth.

Make the dedicated RX/TX properties dependent on each other and mutual
exclusive with the other.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/spi/spi-controller.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 524f6fe8c27b..093150c0cb87 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -69,6 +69,21 @@ properties:
          Should be generally avoided and be replaced by
          spi-cs-high + ACTIVE_HIGH.
 
+  fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Size of the RX and TX data FIFOs in bytes.
+
+  rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Size of the RX data FIFO in bytes.
+
+  tx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Size of the TX data FIFO in bytes.
+
   num-cs:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -116,6 +131,10 @@ patternProperties:
       - compatible
       - reg
 
+dependencies:
+  rx-fifo-depth: [ tx-fifo-depth ]
+  tx-fifo-depth: [ rx-fifo-depth ]
+
 allOf:
   - if:
       not:
@@ -129,6 +148,14 @@ allOf:
       properties:
         "#address-cells":
           const: 0
+  - not:
+      required:
+        - fifo-depth
+        - rx-fifo-depth
+  - not:
+      required:
+        - fifo-depth
+        - tx-fifo-depth
 
 additionalProperties: true
 
-- 
2.44.0.rc0.258.g7320e95886-goog

