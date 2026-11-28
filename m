Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873908;
	b=nStdO669TVz5pgqKSWdYPw0nraKTg/FeMdgRhIRwzvAc6EQjC80pXs7I+ESSAwz+66c4
	 ksAuwdWMfLwBqUw8hOKpnqD7tuPMe8DHeRF2eh+Gq8FWQ6c5ibSzzevnDUkJZlCOpdlUR
	 E2sY66hNEhBqR9hzXiQn1vTz27d5adNfnLPAWJrVGJ6M1bHCWAdusW0Rgv9qYFzt+qzou
	 IcG00BmX0oUt7b4RbVGY5ZrGYUwppzGKDKXUvuA3qTzkvRvd40CYtT+jjIZ4D8C7L5ZFZ
	 JtkBkWxP240cbeK6lAxjCOw7LZKS4NXTCWGfDv+2oslg+t6G//t+WldycYfYKbgRLZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873908;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Rspamd-Queue-Id;
	bh=rxp+ojsSYP6df0Xl+X5RYTP1fM0f6afciX8XTYdpT1E=;
	b=pG+OkMp/QClrStmf0WY20sgUTGGV/2lhA/iq3/V9Ww4wcX8BZfDwnvYYxNsusm3Ojltw
	 S1+LlHPVD45HVxz8emjrle5CUb6UeUI/AY0Bc/n0bFKFx3y0LtkjkTkXY+av6p1T/el5O
	 W7sq/yvivuKNXJOwUhGJ7SSaDRCOra7aSk4R/c6We+BlYRQh6xukZ+swtcrYFSvZEbGYS
	 IXLudao1AbuY1VwN6O22UCeaJuKyrdaZJR82Ps5Fjn3Tbr8nMtOSxKYO2pdVMbHQUHHJA
	 9cI0tZmSnW24NxFTHIT+ECYz3uCZLaTvJ6MIv/LCbHzd6JEppnqOfDYh9kt8+RlWuEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timmermann.space;
	spf=pass smtp.mailfrom=timmermann.space;
	dkim=pass header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=JfvaIfrc;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80518606A337;
	Sat, 28 Nov 2026 13:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80518606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timmermann.space header.i=@timmermann.space header.a=rsa-sha256 header.s=MBO0001 header.b=JfvaIfrc
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jcBXW6sbQzKp25;
	Sat, 28 Nov 2026 14:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1795873899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxp+ojsSYP6df0Xl+X5RYTP1fM0f6afciX8XTYdpT1E=;
	b=JfvaIfrcj2TigiUqVR1TG8CiMZlJZWNqdm9Ujp0NakY909O53e19zPQ81j/Yy+u2JEhRhF
	taLyxrThwK94t2tOp5z/W7u3BErWPRch4jW+toVKK/9pOtGkmTn3rO1SJLcglMnGYZTqfH
	uacssl/Hb3wG9nYWMw3On1Llzua3//FzPtRPjrxP0g3gYMVp6hFBPuV+MI6LjNdFxoF3gS
	3d64uL34DhBwLF8PnbLhbQ74BNuw31lowkWmAiI3i8cWbA5rrd9xVpySRci91PbVrIwHIY
	WPtYMP4r6KgA+OIaBxZHzt9TuJaEywlsmls+SURdB6FilCcNWnfz6Q3zqYooxw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sat, 28 Nov 2026 14:51:28 +0100
Subject: [PATCH v2 1/7] dt-bindings: input: touchscreen: samsung,s6sy761:
 Add S6SY791 and reset GPIO
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-lat3st-google-raven-touch-upstream-v2-1-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4jcBXW6sbQzKp25

S6SY791 is the SPI-based counterpart of S6SY761. The register map and
commands are identical for the subset the kernel currently implements.
Therefore add S6SY791 as a related touch controller.

Optionally, the reset line can be controlled on some boards,
such as the Google Pixel 6 Pro (raven).

Also reference spi-peripheral-props for the SPI bus properties.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 .../input/touchscreen/samsung,s6sy761.yaml         | 51 +++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
index 1ffd17af3c53..d7a116b04f41 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
@@ -8,13 +8,31 @@ title: Samsung S6SY761 touchscreen controller
 
 maintainers:
   - Andi Shyti <andi.shyti@kernel.org>
+  - Lukas Timmermann <foss@timmermann.space>
 
 allOf:
   - $ref: touchscreen.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s6sy791
+    then:
+      allOf:
+        - $ref: /schemas/spi/spi-peripheral-props.yaml#
+        - required:
+            - spi-cpha
+            - spi-cpol
+    else:
+      properties:
+        spi-cpha: false
+        spi-cpol: false
 
 properties:
   compatible:
-    const: samsung,s6sy761
+    enum:
+      - samsung,s6sy761
+      - samsung,s6sy791
 
   reg:
     maxItems: 1
@@ -22,6 +40,16 @@ properties:
   interrupts:
     maxItems: 1
 
+  spi-cpha:
+    type: boolean
+
+  spi-cpol:
+    type: boolean
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the reset pin of the controller
+
   avdd-supply: true
   vdd-supply: true
 
@@ -52,3 +80,24 @@ examples:
             touchscreen-size-y = <4096>;
         };
     };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@0 {
+            compatible = "samsung,s6sy791";
+            reg = <0>;
+            spi-max-frequency = <10000000>;
+            spi-cpol;
+            spi-cpha;
+            interrupt-parent = <&gpa9>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&gpp26 0 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&ldo26_reg>;
+            vdd-supply = <&ldo25_reg>;
+        };
+    };

-- 
2.56.1

