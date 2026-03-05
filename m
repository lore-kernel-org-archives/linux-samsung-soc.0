Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDCB225397
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 06:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691117; cv=none; b=VSK/iJo3bRN+kFV/r3GRbM9tksB5pnmEurofBEq0PeHuWOkK2sHH8pW3do4rq6XbWulabfVeyyMPK0aFumo/9Z67VdklpU5MDiwViY+/eTNrDUnlRQ5fMLmhiEPP3wEMbcSQfbHKxbNpqy2l+UEhCm4I0Yo1XfV7LJmHMwgbzBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691117; c=relaxed/simple;
	bh=VXqNGlqX3hZoD8cv8P59wyGVL5FoVdrO7llV2dEVFW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3eLoZFJ6MPZi8Q6Q1AzxAV208/ct2t/iy/bNs/6SjYxNI8hNRjb0nrTXV7tKgeA6rKoOQy2aUAZdJvzyswIlX7XpGg4TaaMD6yoGi21I/MNrrvLRGF7AiTEmxAfIIvRUaNxNOpXMx7A8pGWAQiY+kLAWDTivqUtp88sqULNwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3Kz3SJr; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3Kz3SJr"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b93695f7cdcso976855466b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 22:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772691113; x=1773295913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=;
        b=C3Kz3SJrqqMDzFHma2oUYgsEw7i1exAQFHIJ19ZxXh/DPLmTNanpfy46sWA/llsLpf
         rbzwTG0BKjN19O9FTEnVJxai/eX8gS6tGLPsgdA49ihfa4dZ6L7ovdYONKW/uqKZS4Rj
         vLiZVqEK1WqwAJl4c5KY8WDPf5pCztb7BNaKu0eCVv81b2sOizm6MbP52mIiZWqUbe+7
         d9+pzsQRwj81nl8PYXJlCJmcyuLggsdZ+LSnih8KOXmYdsadsYzgo1DSAIy7taHEegdw
         /gTQGwbJuFTe0m/kJC9xhXrVgb4H0OQ9fxKS10RG10FRq8a64DmFZRWKEb37pvsHTz6g
         N1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691113; x=1773295913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=;
        b=o16Qmx9TTw52e9+F5LNwIR5Ic0Dd4EC/xGA9p85lXTabSkTKsNNvuqOwGK7pYup9CR
         ITw+uleggIYszp+YwgcTsl5h9QKyTJlUJCeE/isLoflMi+2CLcSDq7YKt+u0Gl6lYblM
         jCygY3Av1R8uguv7x6h/FrDhMVP6S2ka/6mYtv9j0W1zKYGZXnqsOig3Rt4te9FOSUS3
         bmZupvHWhoM7NIDiJem/emXKV9aHAIxkUta9ETeXLSLfo7LcIHv3pb6sMWfACyUFw5+u
         h0ODhGHGLAFo3ZZqO74jHrmEoTRbA5CBdLPnzFvX8MWWyDNGj5wRm/KUj4LOt9FMATFN
         2jrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9xRan4uSvuWIzZvvZ3et65R8lPiqJ4b3TLXcLV2r5TEZ/oqdMmXSfzhYHIHwFt1si6UoDwAw8/D+adMwMUlKmjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOdDXvTqoTR2jPRpiL15P+u7Q1KJ/9Is9bvCIBkEkIi16Y1ERt
	RGUbolTCOxTk6a4tCjHrww0w/lAV/UMx0jzj9pIWEtJaURtm2x5lmy6wtr/6oqvopso=
X-Gm-Gg: ATEYQzyi/U084wSio/SVPpRteSVvTLcFe4JT0XfzcOvI4biM8Xrzy7XZSA/QMXzVHCS
	eWTiQt/h6pYMAWWb05vfsBjrwM4YxOKzO65/uzIoSyawtELgkr/+Q5Y9ILjbQzddTyavvDCyrEF
	zsZSK078G8joZAizokEys/w+bObHWL1T7NB8q73v9LbEfhXRB6t6jT4fk4SGAURgCoNA8M/pzRn
	2JQNeDH39YmUeH7njTCdObUlX+tkVWnP/5qxiPJ1yAuvIthCotVz1kwUfzk7RLwiPqGqr51XkQY
	i8milyhEqJ+o1QYCcgXTROljBcpGHAU6LG8wMODpOSipMAnlQjAVxddwxbU8oVv8ig9oFe9/Myg
	D4FiO8ZxvWMrRdIw5r/j3c2NxKpcdWJQQUyRbqHjmIrr4d7/tStOG/pesAeKSeaPOhuO6NcBp6e
	ZuO3fKkH/kbZjdDh/maihrloPan5Eg/hSOrccKWlAN7vBld5YXMPD0BIJ0zHvnEPAmOHtUDNdjW
	i2WgWVG+k2H23s=
X-Received: by 2002:a17:907:6d28:b0:b88:47b4:7626 with SMTP id a640c23a62f3a-b93f11c65e4mr280686866b.27.1772691113364;
        Wed, 04 Mar 2026 22:11:53 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec3243sm849355966b.53.2026.03.04.22.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:11:53 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Mar 2026 06:11:50 +0000
Subject: [PATCH v6 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-gs101-pd-v6-1-8cb953c1a723@linaro.org>
References: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
In-Reply-To: <20260305-gs101-pd-v6-0-8cb953c1a723@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
an interface to the protection bits that are included in the TrustZone
design in a secure system. It configures each area of the memory as
secure or non-secure.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
new file mode 100644
index 000000000000..a8c61ce069d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Distributed TruztZone Protection Control.
+
+description:
+  Distributed TrustZone Protection Control (D_TZPC) provides an interface to the
+  protection bits that are included in the TrustZone design in a secure system.
+  It configures each area of the memory as secure or non-secure.
+
+maintainers:
+  - André Draszik <andre.draszik@linaro.org>
+
+properties:
+  compatible:
+    const: google,gs101-dtzpc
+
+  clocks:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+
+    dtzpc_hsi0: dtzpc@11010000 {
+      compatible = "google,gs101-dtzpc";
+      reg = <0x11010000 0x10000>;
+      clocks = <&cmu_hsi0 CLK_GOUT_HSI0_D_TZPC_HSI0_PCLK>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f0b879760b6e..611fa8fb9f8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10883,6 +10883,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/

-- 
2.53.0.473.g4a7958ca14-goog

