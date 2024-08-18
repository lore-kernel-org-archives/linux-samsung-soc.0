Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5551EB36
	for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002094; cv=none; b=odgD0IT3yNSYH76EuekGYKOSbYTNbptePolHKZqtwoSm7j88ur/oT04e3pDD3WC6cu54Ic5jDJf3d8yNhVNcPLmJWkYMr8H0pNfl2DMctI8VxfdHy59d/cMetSeHCHhUIzEih0PdIALWCdXWxXr/0iiHTV8hji3TILODVW/pzK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002094; c=relaxed/simple;
	bh=SPkydbo04Wml8XphaO8qESnZXyNX30IBsQj8MDV21ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSpEaPXJH2tG1Pa9MIPq7hxIDQ7RLD+a5byyvPZAnBzl5m48umeayyH3nWgcSqvl36cXRwiyhi2UBhvV6e/9WapLTk4YyA8w8snbOrg07Y/zLXt8FBDUObuiuS+WuB56dALaqMfs3BAabkNFOuIaFyUdz+qZ/nIS+k/7m//dG7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jj2KxZMh; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jj2KxZMh"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a83856c6f51so159661366b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002089; x=1724606889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q59A+6D918l2lKSIhGvv/s3xlwF7brT45paCG30NALE=;
        b=Jj2KxZMhzSiFwid7XVwojQKwBv3kDXQ8jKmt/cIrKSW4ZvADWqPcUb9azWSHJ2sTj1
         AFBhpYpnjHkGlBSlHiQ3KZ1XC06b0oBT0V//sY/kWl4TqJpOq8QM9qrhCt1gTiwOnMG3
         X9zuHvfN+Nkc24eL+zaktNiL+XTWUpzgnqu0nl8bYDctcVksab4aHZrid6sPF+8pGcFd
         WmGdZz1RA7ooO0qgHwXJMr29MDYdUUxHmTshIExeny4VXq4BTanmD3D8T9xzS8XnOOzl
         A7U4x/RbyShHVj6fOUA2JJXO67TxLZUG3IF06VNj1wbZuymsx98KFkT6XnBcK9sKDhuN
         lnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002089; x=1724606889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q59A+6D918l2lKSIhGvv/s3xlwF7brT45paCG30NALE=;
        b=UoTKwZvzdtl+YtcMg4i24jwgGRjmJTz3dnX47myR4yqpW+BLXQDa/52SXzKoLH7OFt
         uow26q7yAu+0k3eEl9F+6MyIWHvGfUz36YysxX8yVgmC4C+UbNbaPU91KAuhmPvvhYH5
         lA94EsUEMlg/X7rS4yo0jsFFnEEBagnPif4JDqH17i7wBrNoy3iEcrq9a6O7LCmMSAf2
         P+LSV8Fq1n+uv9w5E9IjWPrePkmIgQNccozu72pVSa13VhSFDna9UKxmR7jCOLjC//Ji
         TMkg0VWB91Y4vOORQ1n/efnVZbEn7P2I7bYIiAJYS9DNVPte0EwkX8QxMUCwmR4YFo3U
         UkDA==
X-Forwarded-Encrypted: i=1; AJvYcCXeZ0jSf3Mv2zzs/QN545gItzFfxPPGymDVs9QTVleNcv4WrwCjF5v/pq+MD93UxncGJ8rla6eAy0P8rYB8/wIQ6494QpzVfaQ8GATvkOImOQ8=
X-Gm-Message-State: AOJu0YzHYBWKJGMnmGg3jRMWTNYkUfoCedCvhvA/NYPg5priJeF/rMmT
	mP7Xi+QjUuTMsL+7UA23gyVD+wgYOe3FkU8GsxwFFkHsvJvuUclX+jgh72cnHRo=
X-Google-Smtp-Source: AGHT+IF5Ibf/nk6PUhm+E8+bOs4tnaUPacfd7eLVpRUlGv7rXXuA/hyDfTTfa9/bpUwrZwlwn4UnZA==
X-Received: by 2002:a05:6402:278f:b0:5be:f112:b34 with SMTP id 4fb4d7f45d1cf-5bef1120fb8mr1822689a12.9.1724002089337;
        Sun, 18 Aug 2024 10:28:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc081bbdsm4609599a12.92.2024.08.18.10.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:28:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: samsung: exynos-usi: add missing constraints
Date: Sun, 18 Aug 2024 19:28:04 +0200
Message-ID: <20240818172804.121666-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for reg, clocks and clock-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/samsung/exynos-usi.yaml          | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 8b478d6cdc30..f80fcbc3128b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -32,11 +32,16 @@ properties:
       - enum:
           - samsung,exynos850-usi
 
-  reg: true
+  reg:
+    maxItems: 1
 
-  clocks: true
+  clocks:
+    maxItems: 2
 
-  clock-names: true
+  clock-names:
+    items:
+      - const: pclk
+      - const: ipclk
 
   ranges: true
 
@@ -113,9 +118,7 @@ then:
         - description: Operating clock for UART/SPI/I2C protocol
 
     clock-names:
-      items:
-        - const: pclk
-        - const: ipclk
+      maxItems: 2
 
   required:
     - reg
-- 
2.43.0

