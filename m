Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A3F156C76;
	Sun,  5 Jan 2025 16:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736093036; cv=none; b=Rid+/iwtE47KMUKP1ZbN7jeFJ5hM39+Gmap31UcnZuq0n3Kho3kn3Oj4SPBq/XmrsfWfqLBl950jDd/2HtCXfe0LyTDUVMWpopdAI8McB66jvCMQT+J4ekGi9h1IcJQtkqOinOEY0Iew3WBxBVzzAGmQDHqLm47SjuUlY02LrKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736093036; c=relaxed/simple;
	bh=hlTRKuDa9y+wfuuBJw3LWTGz5ejKU3C03zJbk26HZMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPYT8MI+PmVJVNtojxfK/01+vXNdvWAwOGSd00prwrDll17SK0GKNwZ9e3PirRB4zGsgKfZ0vNZXTHTCrsCHFSmicCyfdsieiCeSHcJzJOMrChPYLxJa8al8/xXu9I1ycZOcb95RcCfpUGJ309rNakiMpZqlkSwcbQltsXN/hWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tpi7WeNg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tpi7WeNg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso97440365e9.1;
        Sun, 05 Jan 2025 08:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093033; x=1736697833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qmVtOSWHhzGJr0Y+kskR/DrB7xFafm0zcJLu2D6JbQ=;
        b=Tpi7WeNgMqrTBZe3h9vY4VKXRzYz6OtDyepMlyF6lfXsEn9nF3GFg9QykwMDRg9KHF
         8s6kACMS0gc/u/hwpb7sNAKq09Zsy0t6OM/MOuoENS2gmgXopyomOdS1iBwF/QsG5XPK
         m/RKPYcy7PZx+IE6ylBfr/5AxSPyBNPOiiO84LJjuk/Qt+aOTVwSwFqWjo7D7zixKp31
         qFsDF07WKb7iKk3HKfT8guOvN/oonYHrUXNduTE4P0F32CKTqpwRBXZXzFVMs+fJkxHB
         HeCJf8Le499ssvali7WNHkMezlQDBmocjRFaZGX8bhKPiutBWRP+yGDdh2RJIHuuBsis
         9obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093033; x=1736697833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qmVtOSWHhzGJr0Y+kskR/DrB7xFafm0zcJLu2D6JbQ=;
        b=S0DmClnTUZA3vK7BijgoPlr+UHreLElP44TTNsejEYtMAoq09GYc26j7fjwvScheJe
         8XTKbcpddmVnjN1Yqgo62OzanTu4rUgCZJsFS/Ui6q0Mdg14ydK1leh7vkLeF4LxB7rz
         +5DEopAQb8b6MU7YB0nl+qgefZo5GF+adk40zHwhn8HG4YiZmP7W2eKrbmqToLG47RIL
         cwEr55h1F0zz/Z5+j7MaHHsCfqPE8BGe5ySi9+0w4fjuW+X1jFuQKnosW25IOK9OQqUH
         06OGC5whX1wfBM1Bcjaojw8xQr6jNQAI5kE4kQfqP6IoGnL+ek8PVznyPA+W3sR9eEBS
         zw/A==
X-Forwarded-Encrypted: i=1; AJvYcCWveyiByeZ+um5V74Lg6ysf6biFRo1ZlKYzPwHfBcySF5QcyqT1hYcrsd5mgg7AnRKlWKAsh9hOI38dRXt9dYNzOHg=@vger.kernel.org, AJvYcCX6jQqK/c3CP8GmcRw2U3DOCAEgliXYt6GvqhUfKO2kxbfZTjZCmxCjf/QepdeKtyLklQdYYah++2LgPIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKOnxKb/QM8rgiL3VCyzXld7W4SwYcKdVDVr2ddvDGh47jK3V
	GmZ1t8sUjhjRC7xckVAb1Z2AbciC2Ppu3TTX3rDwW1yrwAyq1rmv
X-Gm-Gg: ASbGncu/VHXcQ5s2tsH5dFgbFXzXa2ZZ+b7whuTHWcz1jVshA2qDJaURmn/HEndJMZN
	7C/u+tINdrclp4ZQ52XlBmuuj9VslYCGnxiG9Q9YHt+yeXR3OTVK/PLGOyjg/zJrsAu5OL9aB4Z
	WBMRgJ4+zuhUL+62sEaHRp4oAcxY9iY5/k7xgkavNB1ptKy71aLp1Cf1uXLyIc90HiB6OAUANc+
	GBMGMNzc7PhPWYpL1LO3seRLYn55Y416AMJjsP2lx5kBXYpwujo2KFaiz4ItBs7AqLjTd4=
X-Google-Smtp-Source: AGHT+IFnesuVVc1Uo46pHvm1AMDioiW9JV4G2NuilRchcYuXNT+MCnGq1an3lKmkDQATX33mCMAZIQ==
X-Received: by 2002:a05:600c:198c:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-43668b5e045mr422215915e9.24.1736093032346;
        Sun, 05 Jan 2025 08:03:52 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm46031925f8f.44.2025.01.05.08.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:03:51 -0800 (PST)
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
Subject: [PATCH v3 2/4] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Sun,  5 Jan 2025 18:03:44 +0200
Message-ID: <20250105160346.418829-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
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

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 107 ++++++++++++------
 include/dt-bindings/soc/samsung,exynos-usi.h  |   3 +
 2 files changed, 74 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index cc92a06a3..d6c39c3e3 100644
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
@@ -64,7 +74,7 @@ properties:
 
   samsung,mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
+    enum: [0, 1, 2, 3, 4, 5, 6]
     description:
       Selects USI function (which serial protocol to use). Refer to
       <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
@@ -101,37 +111,62 @@ required:
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
+              - google,gs101-usi
+              - samsung,exynos850-usi
+              - samsung,exynosautov9-usi
+              - samsung,exynosautov920-usi
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
+
+    then:
+      properties:
+        reg: false
+
+        clocks:
+          items:
+            - description: Bus (APB) clock
+            - description: Operating clock for UART/SPI protocol
+
+        clock-names:
+          maxItems: 2
+
+        samsung,clkreq-on: false
 
-then:
-  properties:
-    reg:
-      maxItems: 1
-
-    clocks:
-      items:
-        - description: Bus (APB) clock
-        - description: Operating clock for UART/SPI/I2C protocol
-
-    clock-names:
-      maxItems: 2
-
-  required:
-    - reg
-    - clocks
-    - clock-names
-
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
 
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index b7c1406f3..aab28176c 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -13,5 +13,8 @@
 #define USI_MODE_UART		1
 #define USI_MODE_SPI		2
 #define USI_MODE_I2C		3
+#define USI_MODE_I2C1		4
+#define USI_MODE_I2C0_1		5
+#define USI_MODE_UART_I2C1	6
 
 #endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */
-- 
2.43.0

