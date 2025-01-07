Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5221E231F;
	Tue,  7 Jan 2025 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249727; cv=none; b=ink/N3UPfSfz7ZFMILIMBuYYoeZXGn8MYfn3c4QtZVNkmsvZspS1PG912lVPmnW2gFxKS/BDlaPH5LYY0I6gCo5+EN+G89oV80aTxByqyF5gJjjWpBg2lB0Foyh4hhgf4iwwC4lw74CmAhwRSMtxoyfk4zBRFeNDzph4Jpxk0So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249727; c=relaxed/simple;
	bh=CPWcHRvrxSTnhnPG0ntAObBtr+/Rdjih0oubzVvv5ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjNCwn5O6RXQ9f1j6IqaPIeGi914Ip7mQJYZA0EchP8Cau9qTuoLYF8UrGH5Yfy3Bq5txuntuqEAI1uMETRPe1DIoRVn4XCgzDSs5q/HHsCe/xFZkuaCsZ0BtQCTrd9AenpwxYPGqrprKYhx+cpuaFxOVinGeDoT9jXZvL+ScFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPG0R6fV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPG0R6fV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso8515069a12.1;
        Tue, 07 Jan 2025 03:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736249723; x=1736854523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8l0lOskXYvZhwje4aevchT16Y0VLUST6xZHj4lRq9c=;
        b=gPG0R6fVfYEKarKIfwpk+UVpolqLSjUh/SZcA9n4KXD4YFTY+TEA+a6s1FUjusledY
         M+xwsa3urAYI4oQyWksFrFYG3q7P/XR5eKBS6XV7npGhC855C2K5ZUb9QNYp4pkb0/md
         +InvNB7hNnMKTsGIy0olk80SeB7GjaRgLFglkRif5/2G5zgnQxp2jFChr9VjSaMZWuwS
         FpyvaTRInG2FU9SEhi/rkFcyUCzRSSwlwwxasdJE2eYTkoXRTiSlUXqCcTj8OyulvHe1
         tXryKhZ1sr02LfYy+y+wGvk1Jyzp7w7vkp7V7ENxFqJk+UvfnPdpe5nDTYmfqiA6UiP7
         B/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249723; x=1736854523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8l0lOskXYvZhwje4aevchT16Y0VLUST6xZHj4lRq9c=;
        b=kbzVqPefl6P29wOKIz3gJ0OrPpnW05nU9+ewrqexhOxqHNbvNjICKuvkackI1nkoGe
         9QLJQLINEJDWa1fNlhTaTA7nN8/bPX4ZgCjAWUv36/if4vXbI2VsAIFeI0UoutBaQGrF
         CnRl1kUc0T6HJlX3q2xq7ACr+zDLdxuTa/92aGXqAUP6P36kxP48i9CabsgOPGT7tEEK
         Ifzr4IgrB8NLD9TfDLM/MB2aayebzzFI+cj7+9JccTVm8bv42MnRG2nJPzDazkDhfKF9
         JViGyiZ5xa0CakpVXBV2bY3uiaIQOJ4XJXMEWIsEZ/jP2SNNZGcS2KKrxk0/o6uj75aA
         2wVg==
X-Forwarded-Encrypted: i=1; AJvYcCWBJEPHPb4syfzbiMgSlY5Kk1nX5YUt2KDSY24nepgIFiTnvKWYZ2iAbXgyQey7lx7hy3bIaBn+jEvQbIU90iSVG5Q=@vger.kernel.org, AJvYcCWzJG8mN4xiBctMdJtRyow0RQGXYf58LaubinmXoJOUj/O/VnBuhzomL/dcn1DVl1O6wLrkeNwNZDFZTxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9FWMrqbBCVeiiYR7uQfDyHBWl/wANrckkzAL+TUVssn72sCRx
	gOyan8RY7DBRUHjIWnvhpa1vpLb9LcYqKRXqqpF5fGiDfP+R7ks1
X-Gm-Gg: ASbGncsrYZPx7MafIzjqI3igpZOnk2oa0M6ja9gN5LbnQQEUAghmbtVBi7TvJ5/EWUe
	xlgn8jBZVkwXZ3QXeh/74YPdAMFimlhkiufgjInw2YWtZt488skKOj5LLhgbI3Mcp6wSxcF8BRu
	BHrz1H02UAXl7YXqtei+i9HZ9FVPlAVZdM3TahdnP3uMwDJVtCvrTD5EQsCuridCDIgNpcJYvh/
	tnZ7xeRaBsdwRvwEd1IRNfWRgIz9AelZumrMrBXc9DldHu2eBjljxlA0Mqn7RrPMIUjWPrpc21l
	A0TNmIePHGuU2SyuEqM=
X-Google-Smtp-Source: AGHT+IEQNVJXbjqos32/nr9HWQMe4iYnDroXJnubL8R3OqgmfEPFZNOLrL9ZLnrbyQqCbOVCn9nbdQ==
X-Received: by 2002:a05:6402:26c3:b0:5d6:37e9:8a93 with SMTP id 4fb4d7f45d1cf-5d81dd5e95amr54322382a12.2.1736249722832;
        Tue, 07 Jan 2025 03:35:22 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f23bsm24881055a12.32.2025.01.07.03.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:22 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Tue,  7 Jan 2025 13:35:10 +0200
Message-ID: <20250107113512.525001-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new constants for choosing the additional USIv1 configuration modes
in device tree. Those are further used in the USI driver to figure out
which value to write into SW_CONF register. Modify the current USI IP-core
bindings to include information about USIv1 and a compatible for
exynos8895.

In the original bindings commit, protocol mode definitions were named
with the version of the supported USI (in this case, V2) with the idea of
leaving enough room in the future for other versions of this block. This,
however, is not how the modes should be modelled. The modes are not
version specific and you should not be able to tell USI which version of
a mode to use - that has to be handled in the driver - thus encoding this
information in the binding is meaningless. Only one constant per mode is
needed, so while we're at it, add new constants with the prefix USI_MODE
and mark the old ones as depracated.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 99 ++++++++++++-------
 include/dt-bindings/soc/samsung,exynos-usi.h  | 17 +++-
 2 files changed, 79 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b046932f..f711e23c0 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -11,11 +11,21 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description: |
-  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
-  USI shares almost all internal circuits within each protocol, so only one
-  protocol can be chosen at a time. USI is modeled as a node with zero or more
-  child nodes, each representing a serial sub-node device. The mode setting
-  selects which particular function will be used.
+  The USI IP-core provides configurable support for serial protocols, enabling
+  different serial communication modes depending on the version.
+
+  In USIv1, configurations are available to enable either one or two protocols
+  simultaneously in select combinations - High-Speed I2C0, High-Speed
+  I2C1, SPI, UART, High-Speed I2C0 and I2C1 or both High-Speed
+  I2C1 and UART.
+
+  In USIv2, only one protocol can be active at a time, either UART, SPI, or
+  High-Speed I2C.
+
+  The USI core shares internal circuits across protocols, meaning only the
+  selected configuration is active at any given time. USI is modeled as a node
+  with zero or more child nodes, each representing a serial sub-node device. The
+  mode setting selects which particular function will be used.
 
 properties:
   $nodename:
@@ -31,6 +41,7 @@ properties:
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi
+          - samsung,exynos8895-usi
 
   reg:
     maxItems: 1
@@ -64,7 +75,7 @@ properties:
 
   samsung,mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
+    enum: [0, 1, 2, 3, 4, 5, 6]
     description:
       Selects USI function (which serial protocol to use). Refer to
       <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
@@ -101,37 +112,59 @@ required:
   - samsung,sysreg
   - samsung,mode
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - samsung,exynos850-usi
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-usi
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        clocks:
+          items:
+            - description: Bus (APB) clock
+            - description: Operating clock for UART/SPI/I2C protocol
+
+        clock-names:
+          maxItems: 2
+
+        samsung,mode:
+          enum: [0, 1, 2, 3]
+
+      required:
+        - reg
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos8895-usi
 
-then:
-  properties:
-    reg:
-      maxItems: 1
+    then:
+      properties:
+        reg: false
 
-    clocks:
-      items:
-        - description: Bus (APB) clock
-        - description: Operating clock for UART/SPI/I2C protocol
+        clocks:
+          items:
+            - description: Bus (APB) clock
+            - description: Operating clock for UART/SPI protocol
 
-    clock-names:
-      maxItems: 2
+        clock-names:
+          maxItems: 2
 
-  required:
-    - reg
-    - clocks
-    - clock-names
+        samsung,clkreq-on: false
 
-else:
-  properties:
-    reg: false
-    clocks: false
-    clock-names: false
-    samsung,clkreq-on: false
+      required:
+        - clocks
+        - clock-names
 
 additionalProperties: false
 
@@ -144,7 +177,7 @@ examples:
         compatible = "samsung,exynos850-usi";
         reg = <0x138200c0 0x20>;
         samsung,sysreg = <&sysreg_peri 0x1010>;
-        samsung,mode = <USI_V2_UART>;
+        samsung,mode = <USI_MODE_UART>;
         samsung,clkreq-on; /* needed for UART mode */
         #address-cells = <1>;
         #size-cells = <1>;
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index a01af169d..b46de214d 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -9,9 +9,18 @@
 #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 
-#define USI_V2_NONE		0
-#define USI_V2_UART		1
-#define USI_V2_SPI		2
-#define USI_V2_I2C		3
+#define USI_MODE_NONE		0
+#define USI_MODE_UART		1
+#define USI_MODE_SPI		2
+#define USI_MODE_I2C		3
+#define USI_MODE_I2C1		4
+#define USI_MODE_I2C0_1		5
+#define USI_MODE_UART_I2C1	6
+
+/* Deprecated */
+#define USI_V2_NONE		USI_MODE_NONE
+#define USI_V2_UART		USI_MODE_UART
+#define USI_V2_SPI		USI_MODE_SPI
+#define USI_V2_I2C		USI_MODE_I2C
 
 #endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */
-- 
2.43.0

