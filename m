Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3D378825
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jul 2026 04:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572788; cv=none; b=Gz9YJxzJH4YUtUjEAPVqt4XgZ+eBR2BmlM5Bx9ZdZhvo81OLGzkzy/xhna6rMbvOac6ZCRcai21uR5AvYp58vHEUEkOhkAEi1Nu15G1ZjUR9BRZo0+VltePmeHuGe0510CGvLwlYQ3QwkEefxD2po4w6qfRvX544UpiTYm+JBrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572788; c=relaxed/simple;
	bh=IzA8rReWtoTvbgvPeZqmsULd7KQqqwFSSfde8Qmik8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCzEDruR/U++HiaIazMGXSjMynLDjCaLTyOoKfMFeEF+AcfYPNDtsXqdX8SPwyyPcRI+27PiiclZULSpIeboaxpDE6EDak5fSGoWhFx47xCoYI8SyEceEbnlT6sda5Hvy/ONzkLzK/55gQfO4ZIaG4g7oPuzhsj4iml0Wuytwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6SooBR7; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6SooBR7"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso847895a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jul 2026 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572787; x=1784177587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awUJTEIa7g3yBed2Klo/gvRsPy9nUmrKXk19wqIJEdQ=;
        b=Y6SooBR79NTF6+R0A1RqXgftVYT6OEvX5ypg6uwJ5VuQWGe9/W283vg3PtPt9ZcsG2
         FnpBVPz8pv/PxYI9czc7w+rZ7W9hiIFOfpujMnrSQsrBJOd+uE1bbxXueI7PQyU8amIk
         O9R8KzfaoZuSqqvrJSIe6IyBzGnkdMUPEvcTTr0OOQzmn8w9Guwt40cjz93OsKTo9uVT
         xUGZmBj3Xu6qpF2op5h37Eipu8IDq6H99Yl3Sf62JM6wzGBHBN1o85hea/wi9eCbpzUD
         6Os9uobtBKdBKvv+xcNTOL05+5J3t96W2uk3Km68L/eAkp1Fd/yqgUI9Jbdm8y6OjzJW
         EhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572787; x=1784177587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awUJTEIa7g3yBed2Klo/gvRsPy9nUmrKXk19wqIJEdQ=;
        b=NN5J1iSSsoKubhQnAJ5Ny/koP1oFmDgvijjMDsjJkcYGBfeHeCeH+MHwiqtsZdCQAc
         roOYdKyz2Ggp1SiP3krmqTXCfQMArVyheMcGg9fV9olNcSzxY9w8WMSfvlJN/d77f4sy
         Zd+GI0qrZB2tGOI51mkLw3Eocz1rg4N/JhIncIGvyFcQVRW0DL6gP2XTRDuB8d5Qgrbu
         nlPt5zVr4O+nAMF5UkhrquR07fIJ0yubPxZyONsvIVVqLQPkUutcxAq8D1Rf15n41YhE
         LjUaUtfEZmQn6avu10CrsmnQ6pk/LRuwuAs39U6/VpMgAtdocekiJavjPYkev4tdJciQ
         M0OQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtKgcVH91ZBeoefGe4+B7eA66+H+1Gd5vKeQOPe7bnraF/JE+st9x93nHyWbUksQPQi+A9/VjVXaJuSOKaia6mNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPG1ifWg3uyx2Cv8QM6u/zRA/fTUoa3GK2LwKK8h/t73F28Rp
	AdzNa79AGst9cwk/AQrHB7NzSTKQcdWyJn00F5COAInY1Aa7nvRfYwjn
X-Gm-Gg: AfdE7cm1B4qU8bSIcB08Pr1b3EdjruwDXYPgQyznvnuyEorGlFtgtFKKPfNo9w58pdF
	2Q8OxULsrYGrVdVbE5mxhtOtqewsKBeWHQd+poLLNFi2y/5IM/FtJD6S07B2m9vmVoHZC5yXsER
	qkaGkK9SJihNODWtZ8mCIl8qSDNmZQ+6clEGO0zpXQnVtzC0/EmWny7/cmZI0KCL58E2wMWPYwi
	TXkgUlIijlGXcgDTeJHfskHMzcjbrVGZyaWCCQeHNHxZm7FZTuaw2B5HCX8kRAGr/T5wd7LMlqB
	X1535QQ7QRGGU5ebiittq1+HcjX4ueV5LvddswFlOBuUAD0A/cIhWsp/81bSuOVNG79gtpj3lhI
	mucbRDj/hvgJPeFOafWHp1jksj7wIKS9aUP1Qvpz0jFMhtPOh5pVPWrQkuiDP78J0hpyU/VjXfG
	E0vPHrfQDQKDnCmxht/fk28H8D9fLmYLxgQPOqKmYNofCVZOBbQFgjiLav4wkrqFco4UN1TA3Dw
	MqE
X-Received: by 2002:a05:6300:2213:b0:3c0:b766:750c with SMTP id adf61e73a8af0-3c0bcc1a69bmr6988432637.58.1783572786880;
        Wed, 08 Jul 2026 21:53:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:52:59 -0700
Subject: [PATCH v2 01/11] dt-bindings: input: samsung,s3c6410-keypad:
 introduce compact binding
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-1-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f

The binding with a sub-node per each key is very verbose and is hard to
use with static device properties. Allow standard matrix keymap binding
in addition to the verbose one.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../bindings/input/samsung,s3c6410-keypad.yaml     | 53 ++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
index a53569aa0ee7..2498c62444a1 100644
--- a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
@@ -37,6 +37,10 @@ properties:
 
   wakeup-source: true
 
+  keypad,num-columns: true
+  keypad,num-rows: true
+  linux,keymap: true
+
   linux,input-no-autorepeat:
     type: boolean
     description:
@@ -81,12 +85,33 @@ patternProperties:
       - keypad,row
       - linux,code
 
+dependencies:
+  linux,keymap: [ "keypad,num-columns", "keypad,num-rows" ]
+
 required:
   - compatible
   - reg
   - interrupts
-  - samsung,keypad-num-columns
-  - samsung,keypad-num-rows
+
+allOf:
+  - $ref: input.yaml#
+  - $ref: matrix-keymap.yaml#
+  - if:
+      required:
+        - linux,keymap
+    then:
+      properties:
+        samsung,keypad-num-columns: false
+        samsung,keypad-num-rows: false
+      patternProperties:
+        '^key-[0-9a-z]+$': false
+    else:
+      properties:
+        keypad,num-columns: false
+        keypad,num-rows: false
+      required:
+        - samsung,keypad-num-columns
+        - samsung,keypad-num-rows
 
 additionalProperties: false
 
@@ -94,8 +119,9 @@ examples:
   - |
     #include <dt-bindings/clock/exynos4.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/input/input.h>
 
-    keypad@100a0000 {
+    keypad1@100a0000 {
         compatible = "samsung,s5pv210-keypad";
         reg = <0x100a0000 0x100>;
         interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
@@ -119,3 +145,24 @@ examples:
             linux,code = <3>;
         };
     };
+  - |
+    #include <dt-bindings/clock/exynos4.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/input/input.h>
+
+    keypad2@100a0000 {
+        compatible = "samsung,s5pv210-keypad";
+        reg = <0x100a0000 0x100>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock CLK_KEYIF>;
+        clock-names = "keypad";
+
+        keypad,num-rows = <2>;
+        keypad,num-columns = <8>;
+        linux,keymap = <
+          MATRIX_KEY(0, 3, 2)
+          MATRIX_KEY(0, 4, 3)
+        >;
+        linux,input-no-autorepeat;
+        wakeup-source;
+    };

-- 
2.55.0.795.g602f6c329a-goog

