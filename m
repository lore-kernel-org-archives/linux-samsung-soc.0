Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082F213E9A;
	Tue,  4 Feb 2025 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690148; cv=none; b=AWU3ks81jQY5DV2rLKF9jw3ifgiW9gAM9pUm1zjSBF3ZCADeQ3YG2On3WCPNkL/82+qw6WUMD1gUxvs4xc37CGh3P73yBz2B5VxqLHa6JUK/u6pAWObG1PMqC9YJ8BYMEDdjODsbKspIMb8D3HYw+plBmQW7++S9OECHgiY5zV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690148; c=relaxed/simple;
	bh=xILKK43P/LIFgLwxGh1CuOmcQnxZi6EiysvJsh83kbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXx1Y58MY2Q2xu10gAZE47QRpu1VyTFTUMlKyLa6gF7nyxFzDtesTLL40sUU1MM/Y6nH9rDI17GuuWa28c6SGOsZ/RNF+WHejB4teFpUM2K5TMRFWBNItZm91nrsfQHkbXcu31KePDSe6jllo/g6Xd4jI6ysBe4lukJtgD1MQTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbXSRxUg; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbXSRxUg"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d982de9547so11338546a12.2;
        Tue, 04 Feb 2025 09:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690145; x=1739294945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=;
        b=HbXSRxUgaDYmJwswRluiLHjsbXhgeQicUmW3GbVy1X8m+88rZmaDRrdpVKE/qEp6JI
         knCb9rGgYRdtV2em61wOg9wUCYl5L1TpQs0zSSGI4GuFkuDXRfPKtq/24yjsoFFDFMKA
         99GxtojSRkRzjKn/S6HH1jaqw6Y1WmHdw3MIFtpnWM+z1FpF6LCLHPpjrx+nH7xvRCFI
         zB2LKQvxtctqugDG7BYpNutZZlqpMcGylaVHaZDNcykKCN0LichKqie1swAwg23ZLT39
         9qVapAjG5sk3lw/8v4jyQU8AHRST+H7OAY8scydOa3I4LnRgyo6h3KPSl7qIsxrTM0XD
         OJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690145; x=1739294945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AATmeIywhPXpmS9/RGfjUbh+83T1nTe0P9ZqfpWyPjs=;
        b=WDyBdxZfmpaVov+HHBl5RQBUUSnlnz/PI+nBx+0qvIW3E/Ds5RIKbygkwfq/jASKOg
         2FuNIZtrd+vMGPUUtjCddaVdhy2HYprBHN78FsjdrE+oX3G84Vhp4iU7IkzoyBVqGZEd
         fxGWa8ulBFa3kb8Jj2n8RB+0a5VdMWXjcbDtNC0fMgrErkaQXVEhM8BEYMCBqZjHP6tL
         xyz2cdOpCp0RIU/dHaf48D7B2/LiIJiM7AvHFW5ukAsX0pz4s0Z8ZKMlP+0HRvUkwqwe
         0G+UMeBmLRQ9xmCU6kSlO866btED1dFCnyCTBgv0Ync1xt/NcmruwN0OY6HzFm87Gkj/
         tQwA==
X-Forwarded-Encrypted: i=1; AJvYcCULbPadAha7A0HOgvmje7iSovZk0P19nP1Sm4BOEohoazlISbWCIum88/Wh1KrvenpEHM+JQYvxqEKbPFc=@vger.kernel.org, AJvYcCXgKUppjLsbpFL1ZdFIyut36ffDLnA9BQ8W/WOCfDsATAGRZjztJ1HIkmFr3Aw5TbfPB7rzuJd4zE6DaTXro4F+U/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZOY83zo6zzLBCYKxePw6VfkLg2Q6wz6hwk4OewcHuQSgSSXY
	aRb24Xz6lykTNrUPb6LfMvejEHwh3rxoWXWRyelRkKkXMePS2tyx
X-Gm-Gg: ASbGncv3Dz4aV2xrLuPxoEBfURTHZICJ4EbOiZ5lnD7AN+2FdiXBWThH5WZ7Xz9Rh58
	q8Hkvr+5SwZsU1s+qV0bnzNLE2wMsaDqHsR+t2+/otosEQRv0YhwnIvC9EkeYGypVDGgRcl5n9T
	bWK2DI9BcfcwqUGPmQ8pPZM5ceBo+nqgHhPYN31TGNfrrsPFn+UqfajO7aOYVoSaiZzhEODZDxm
	GYyATwTvhrC95LkbZaf4S7+RYavdKQaX/sZBmj2vgJ+aeGLWx3ibNcirW56YArTiBQit/tnCfkM
	a4juAa5W3UhnTxBI9JnW4bQ/wj3Bm4pwzvMXi/6gH/Enoh9ugqN8xRCZapApvm+rOCQ=
X-Google-Smtp-Source: AGHT+IGrzVxahP7DJr8b9Lq1TbMOwGVsIuh1CHgdVq3igCl7cQiGRsBdPj1QOc6BEt4QbwZNmPprjw==
X-Received: by 2002:a05:6402:3585:b0:5dc:cc90:a384 with SMTP id 4fb4d7f45d1cf-5dccc90a699mr2303236a12.22.1738690144629;
        Tue, 04 Feb 2025 09:29:04 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:04 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/4] dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
Date: Tue,  4 Feb 2025 19:28:00 +0200
Message-ID: <20250204172803.3425496-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

