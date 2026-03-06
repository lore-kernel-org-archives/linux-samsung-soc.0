Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D982E37C11B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792999; cv=none; b=q7W7an5rvZ017QEYv6O0vFr6ult9DY6UgoznD9VVxKQMKVAUGjyw6e1ie4RnINvPRfup2yofmhkf9pRuNPxmbRWVwPDC1ArPueIIzP5NK6Cj42pNE9FN1G3gOOnMNfi2i908ZGqy8RhVLZBGCvGAqIqXvbby8HxmK/ki4qdRf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792999; c=relaxed/simple;
	bh=VXqNGlqX3hZoD8cv8P59wyGVL5FoVdrO7llV2dEVFW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvndeE0ZJ5q2b5lp4gffOCnTXavLNw5/EA1v2HdkAC+Npgu4WAdAOAlh6at3RmaAeMM//CqhRZVJiyLasK0opdWFN6HFzcFoEWIGLbundz+vOtayh52IIK3NDkvqW0N7OUXkPyahQXRQXUxl52Gjw1LjCIhOYi5jpd5IG/nwY/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aycb3yD5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aycb3yD5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8f97c626aaso1559895866b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772792995; x=1773397795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=;
        b=Aycb3yD5XIvxzGgghnjxETlzPRDnEKrqZc9X9CHGhewxeFsVVNUv9mTWZzB+u6Rmb3
         /q9o21jyb9akjFBlv+2ouG9AQHwLZwehQFeBmLj+CdtCjSSrXeM+CHOPLXMZ0xWNU0h6
         Etia5m4dywRX+lmWpxMmhfsvQG2WSXI4mzflHoLJ5fDnwpHRIzygPta5IYr7k9xY9Q3u
         bos6wGrb5eZqN/Djxoq4ewVx3QmnpzM8bVv8H6CfCuhPX87FlpKwyQBD2eIAJuqVCk4/
         v04b/vumoDigrgQDQ6XonFSLgrxBdm+ifWmd2Rv4QLB6T1MAVAPaP3nxXeKihM9KIo/1
         GrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792995; x=1773397795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4gPeJxyuGY5/8F9b5AqNdyg2EFBWflmTDpqYPujzuFU=;
        b=wDmclMuIjJRRHoXT/4vpuMMpVGMUg2c/GTsgQInOp6Uygq8BJ+cBfWfE853mpPY/Ya
         OyNc0QAkCyxSCkhR2+8gc6R3hq4nu7sEbZjPmorz0UhnldUSvT2MU67pzbuZj02Vn2NO
         7+et9sTv8EBNBWvGwHHa8OEfEtx/nyy4jHaSlFDiFGdjkN3EspS5cEZIfLTxoG3rAJb3
         QvauIpiiuZ7/9wE5h6MfwfoOyExWu8CTFYb/tkIjH8F8bb2S8sT5r2vnD5XtzRsgmaWF
         WaDxXnwCcn8x/5sqeN//7LSF9mAetMqdiC0tJ/3i8qPTCkCAfxnE+EmtvgiLLoUGYrMM
         nKfw==
X-Forwarded-Encrypted: i=1; AJvYcCW033tU0wU9xQ2s3iUyp03isCYEkTYfOUJutigFT/1zZoW62Zoo5My/XA2aQyDw0qC+8n9G5XqswHts/OY6GqFHdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAV2WGyD2eoEf9PQrySWA9kgz1BT0LwpRLMpT5jTXW+w4aYzzl
	0RU37aZr35J6IIDp/hnTDy2TpEamBN5rEGEOCu8iMaIBPl+hD6QX2A6C5DApvU2/PvhCE+z9DMb
	7tBeHryNYcQ==
X-Gm-Gg: ATEYQzxBTw7Zbbn3VkYZB7h2ei2aREgRTWLIy9jHLqfKCKbisKCN+Cq5ZQfiNMyssnR
	EyUHHRHehc/m79AeShVr2Rn1E0xSlRPuK0kUhO1Xd5uH8FSQN8CT6Q2sgNGr6fxmaOXpfA/SErL
	5NrBr6ujb2i8POT7ZQf1h69tkf081EHZC1MjdCfXNF2B3daF1S/1vXiO8syIZ4h3DBLCM86riXG
	U0praOWRAOdxe8IoG6xtNhJhBCR6j1BeE/EcDYbrXxc0hWiTkKHiQskO93VGzzPQn/TcjRrRCm/
	8Jz3LkKCkRFxaO/LOUWAvNLqEoJfwJO49Pnt2XI36daaaGaKhUzU+uenfrAkK4Ap00ym3TohCJd
	UZTSC2CnUKw4LvooVZx+/ouhqQsxl8u43Blgm1UIHhZbOYIMWg/tfvWA/w4x9xLYJXpJnBDEDBE
	KuoZsZGwLvo9AC1LsGevVgM1kG8F20x7Ec7k5bB+zufsMNyb2x9/u28294cHEfTEK8fP0Pq6YZs
	aEvMZ3m2IbtaUMUtMxWaPOOEQ==
X-Received: by 2002:a17:907:3d8b:b0:b43:b7ec:b8a1 with SMTP id a640c23a62f3a-b942dcee05cmr89065966b.24.1772792995144;
        Fri, 06 Mar 2026 02:29:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8c95csm42907266b.21.2026.03.06.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:29:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Mar 2026 10:29:52 +0000
Subject: [PATCH v7 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260306-gs101-pd-v7-1-03f7c7965ba5@linaro.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
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

