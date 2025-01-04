Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5901CCEDB;
	Sat,  4 Jan 2025 16:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736008165; cv=none; b=eYIYz5EMMCYMd9uH0n8wj3cVet50iMVtpFjGE+cp0OZLR3XJ9YfncUHMv6APNPWJy81CAD274P5TXXxizf4uvK2ED59/y4s6ZcrAkUqsKqsV737ZheH6X2Kc819sQYWQAIa4nrpj8MGtsUdJKpLbmiUrjuRFDLoXxXbvGEb76vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736008165; c=relaxed/simple;
	bh=ODlV2Q4tJsr+/oG7xoASDLbV4TIoQXWVLUXzcpX7TT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLHQ8/9DSv2i5RCeH/OQ+xgGYW/AqwEX6yoWYpyaMFnDvzFdxY6K0++QY0WHSMWcJS014EiR3dfZoDy64HTFBWdaeCeb9IWslSc5RyplqNzFc+1ZUw38qlO2rojVeyIlJOVK9rqQ1SUfw1ZtMINiSsfYCe4wMKKlzTZY2nq7J9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vzdj4L+q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vzdj4L+q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso89674765e9.0;
        Sat, 04 Jan 2025 08:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736008162; x=1736612962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfGLfZYLKNWeiwn293mIzstgMi7rArSmekfdXqxMqP8=;
        b=Vzdj4L+qyYH92+kgoV26mpwaX1YoxEq0U1CevCxSiADWeeJShhCrvGPH4e7e9vnqTX
         CmrLJQeuIjZVaeSCyFz01mCb7fjwMU3dTR6Iphwo8elSzLC5xMk3J+BdX+mlk4IurhEU
         bkAMGClJiqO7q3nLoJ/PJpKmvhZW0VNrYM1d1rWRw7oxjRrFQBpldUdDAzr8Oe6XdRTW
         UiYu8ggW3zveTGaj85enLdWEY4ioVxKlTpZIVzcHUpdhRKRzY/CnNMZdHL0z0eYyWBMW
         zF4EaH/WYKX9L2pae6zUtjNU6d1cWSqayqvLGfuWMeap/eQzi2klI5hXvesigGHO0N68
         TD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736008162; x=1736612962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfGLfZYLKNWeiwn293mIzstgMi7rArSmekfdXqxMqP8=;
        b=WbandEZAIuaghCxDDHk+4sKWpyeqhHDyHddDqAzBqBpRPR+HEkm/52WEg/DYJC4fYz
         uQPLbHcJ3yq2HWDKIRc7oo5JRHIknbgbentWXlyE49z5oaFazRJbxyt3r3gDlGD0g+d1
         m2I+OWo9Qp/b6y74XQjdWldSzTOrHEIi4TN0KCU6uE6GYjWj+b+bgdMK0zXkAZb0VOS3
         qBU0fzCUDC1SitfFZpyn03q1VSNQCJd+Es52jis4rJnJ6w3mXhctWnbAwRy5lqRx8dwX
         csumEm9D1EiEyzSXsgYejGMfTAJDLyiquqNI0h+Et0ekC+F3oSF+Hd7gQv62Ci3LPUq/
         jJVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnkzcfJHeR/avZUwUlU/EUDLSJ0J8PcVK52JQ+TukT+3oKId+ceFJortmCQmIjviuUHY96dVwhf7iMmMQ=@vger.kernel.org, AJvYcCX8oQ3gT6qLdJbkuMMWzaXjh4WcWNoSbtmAdf1ejJjrfKiVMR2L2WtyonU9FGG/Y2DQ/PR07iOZVLkdhBuV4oukVAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbGBCUho5wkYtMUisKljofc0FsB+A1IF1px9Uw6GspNuK2EXM6
	8Y2vg4bJGfXvZ3EpOlIT9ZbNbTX4ey0XtDy2sNXu0ZJaJfV/dPnB
X-Gm-Gg: ASbGncttD9TUfLMNe0+kh6v9R8zWHLHvJ1R4dNbHXY571AlVE/2Zos1gWcgTuEyzKVz
	wLVMqhJRu7/Ucth7OvJmhIMxrQeeYnwciCsPpyfS+3d5k+YIpZWtfVtbPhCNhzktpHYHv23KrBw
	ZPYy9M+n45e02Hq7Thf5LPIFA8eTJj6XwWUwAlXu6SiSC8SvQ5gEylrufBgBgtzXn+GM4Eqc1QZ
	uZora8Lx2dAIMZkwst+TanqiVJI+Y1TzRkNVV95qvACNoO7bbzUVwS4AYgMicpmtv1IPkk=
X-Google-Smtp-Source: AGHT+IH07GBjjt9BqWjOYTGsRV1i6VjGwkhH7oHXvw9cMBRKIIt1LWtpsbwakdr5+eFk7uWUpTXDmQ==
X-Received: by 2002:a05:600c:4f94:b0:434:f953:efb with SMTP id 5b1f17b1804b1-43668b785d2mr394969645e9.32.1736008161587;
        Sat, 04 Jan 2025 08:29:21 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4fcsm522807895e9.29.2025.01.04.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:29:20 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Sat,  4 Jan 2025 18:29:14 +0200
Message-ID: <20250104162915.332005-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add constants for choosing USIv1 configuration mode in device tree.
Those are further used in the USI driver to figure out which value to
write into SW_CONF register. Modify the current USI IP-core
bindings to include information about USIv1 and a compatible for
exynos8895.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 55 +++++++++++++++----
 include/dt-bindings/soc/samsung,exynos-usi.h  |  7 +++
 2 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b046932f..6e32daa45 100644
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
@@ -64,7 +75,6 @@ properties:
 
   samsung,mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
     description:
       Selects USI function (which serial protocol to use). Refer to
       <include/dt-bindings/soc/samsung,exynos-usi.h> for valid USI mode values.
@@ -101,18 +111,42 @@ required:
   - samsung,sysreg
   - samsung,mode
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-usi
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        samsung,mode:
+          enum: [0, 1, 2, 3]
+
+      required:
+        - reg
+
+    else:
+      properties:
+        reg: false
+        samsung,clkreq-on: false
+
+        samsung,mode:
+          enum: [4, 5, 6, 7, 8, 9, 10]
+
 if:
   properties:
     compatible:
       contains:
         enum:
           - samsung,exynos850-usi
+          - samsung,exynos8895-usi
 
 then:
   properties:
-    reg:
-      maxItems: 1
-
     clocks:
       items:
         - description: Bus (APB) clock
@@ -122,16 +156,13 @@ then:
       maxItems: 2
 
   required:
-    - reg
     - clocks
     - clock-names
 
 else:
   properties:
-    reg: false
     clocks: false
     clock-names: false
-    samsung,clkreq-on: false
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index a01af169d..4c077c9a8 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -13,5 +13,12 @@
 #define USI_V2_UART		1
 #define USI_V2_SPI		2
 #define USI_V2_I2C		3
+#define USI_V1_NONE		4
+#define USI_V1_I2C0		5
+#define USI_V1_I2C1		6
+#define USI_V1_I2C0_1		7
+#define USI_V1_SPI		8
+#define USI_V1_UART		9
+#define USI_V1_UART_I2C1	10
 
 #endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */
-- 
2.43.0

