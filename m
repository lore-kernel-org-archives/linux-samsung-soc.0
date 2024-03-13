Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790B464A9B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2024 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710355404; cv=none; b=F5knfQs+zzNaDirOYJUfP7dvrsJnE/iVlSTX326E+K098dyFlS/84vgQegxtBlarvbzy+ZIFQ2va6RWlTsQwXXESD3T6FmW9gHl/rgig+zJi0YiSBN/wZ1LLMVJfrgjWWlyerzM0rnse0NQRQpaPmQoyITFWWF629wmCNPrLU9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710355404; c=relaxed/simple;
	bh=3R4Wjm81M1GFzs4RNpcOl5nGXkLgjelK4w4ezqR/iQk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jHq9soY3oeB6EKDOtGReqk+96BYkHKI7JvR8CgJbrD2wA4cbFoabTOMz6SNI1DF2nttLqOnv3C9L1nuPc4LUP8ZxR8pxfng+QHBq/Qfqk+Etg1w6RtiXY+nnyGH25vCU4hqmIR62GtUkC1ThaLgnx9KFhjpzlHp0zZ9TH+iRALs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rs4LGHbj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rs4LGHbj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e9ba0eadcso72376f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2024 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710355401; x=1710960201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8n0lPlyrShI//8JiMT39EqPm72VEaGOIKCdfE8EEWSU=;
        b=Rs4LGHbjw6VuKzIWp1U7Ox1kYBI5hoz9OXLDPMqeBxdAdbDJQmobsuO64EU0tmDnPM
         NVQ98soonhhMtEElar0o2ZrNN2XJ6gJoAaxlDn7H/wiLdPhul3wL/eGhvT6/cccrrarm
         RNUQxSH/uS1jhADZ2JhyjhDve0CQBafDT2q6D8VnCd4tG0DPrxGihohOW7ZndlN4/qnn
         o1pfg+JSR8/km3U46nzduCB58xS8xYyPSoBLpuZnt4+eKm8NRPEjdmXkX7K5FnGJ54Qb
         IiuCQwioEmfEa1vrPp68acAnS13tdpbtoVhlFGf6DlIWzZvts1FR+UWEZccF5Xdlq4sz
         UKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710355401; x=1710960201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8n0lPlyrShI//8JiMT39EqPm72VEaGOIKCdfE8EEWSU=;
        b=o7hE0RF4Mf77jWczs2GDOa9G++e8Oc7sC7kPqn7+OcyyFPm+pAL3S4zOmeg63E+nvO
         qXa2gXEaiUcKx+mLHrpvHqQTduQ5QSEBxlQfxkmFfTviW0CGKLreWjTZabG6qezuXQ9Q
         xmGgV0y4J8TFw+EYBqWb+DAPWt342R8YJaMdmqMfz9t3fl/HBOXjJoyeq8sm0MYC9Sc/
         ljogNwfXPXkD3qVzXCyX4yh8/p3uzATt5d3+OUrFSNjUP6V9H4yfjhnDFrekmfY5tz+G
         h9Tl8BxoKdkTHPQzyjpsZx3P/yB3QyadSVnuOUMrkSyU/0vzDXGmJRfKqZb0icas6SRE
         K67w==
X-Forwarded-Encrypted: i=1; AJvYcCVMqllLSEZQMDeANMAneYDjCLoj14kif3d77do7wOb1oiHvcehslU1BTxhp4Hv+R4FW5K0qxGPl41Ml2bV0E/C/vB44YZq5N+e25o1lD3SiNA8=
X-Gm-Message-State: AOJu0Yww3zUA7YE2sBEuMY7/y7j9Tw3ivvekXhfhwXMYEUP/7yrCO00A
	pakg36qDhZHJu/Ldr0sTXtasdkzXVJw63agz87oSQGSix+SDVfxh1Ke0O+m1p4Q=
X-Google-Smtp-Source: AGHT+IFh6nC+wEZ5G7Ev14Omc+KYBIzxoV1gKK8YvRLpLLSqwI2dCtd02o4bOiCsIajL1CJFY0t74g==
X-Received: by 2002:a5d:40d0:0:b0:33e:7719:325d with SMTP id b16-20020a5d40d0000000b0033e7719325dmr2575350wrq.2.1710355400836;
        Wed, 13 Mar 2024 11:43:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600012cf00b0033ce727e728sm12192423wrx.94.2024.03.13.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:43:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mtd: Add Samsung S5Pv210 OneNAND
Date: Wed, 13 Mar 2024 19:43:17 +0100
Message-Id: <20240313184317.18466-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document binding for Samsung S5Pv210 SoC OneNAND controller used already
in S5Pv210 DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mtd/samsung,s5pv210-onenand.yaml | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung,s5pv210-onenand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/samsung,s5pv210-onenand.yaml b/Documentation/devicetree/bindings/mtd/samsung,s5pv210-onenand.yaml
new file mode 100644
index 000000000000..e07941b69904
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/samsung,s5pv210-onenand.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/samsung,s5pv210-onenand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5Pv210 SoC OneNAND Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - samsung,s5pv210-onenand
+
+  reg:
+    items:
+      - description: Control registers
+      - description: OneNAND interface nCE[0]
+      - description: OneNAND interface nCE[1]
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: bus
+      - const: onenand
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+allOf:
+  - $ref: nand-controller.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/s5pv210.h>
+
+    nand-controller@b0600000 {
+        compatible = "samsung,s5pv210-onenand";
+        reg = <0xb0600000 0x2000>,
+              <0xb0000000 0x20000>,
+              <0xb0040000 0x20000>;
+        clocks = <&clocks CLK_NANDXL>, <&clocks DOUT_FLASH>;
+        clock-names = "bus", "onenand";
+        interrupt-parent = <&vic1>;
+        interrupts = <31>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+        };
+    };
-- 
2.34.1

