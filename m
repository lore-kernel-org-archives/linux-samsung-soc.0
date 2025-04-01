Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11271F03DE
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Apr 2025 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502273; cv=none; b=JAOzAk3/GPJ2kbi6tMFuj0KqxMkuhajxLv04yjo6yLo8D5ovHy7ux5r+nLR3/7KddAt0cchDrpO4lUsmAOKOblvq0a+4ez8ZFplR69ce90+NQdPlDN9ID4bVEHWQqOaROoYIn1CFI2rrUJGCg+S1kr9sWmIbwCOTl1nQJRxhvzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502273; c=relaxed/simple;
	bh=ri0c6XAKIbAL5r1pMx1YsjfpBuk6BBaZV7LqaDJixho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHPJnUVqA0SVdoy+ncScWzkBB9e6Iz3+1H+TPG5VhwYT8qyQUm7RgiYv5gIaSY6UEYyyM47uqHn68w+IW5MmhgPGqw4UKM1fp23CBCM0EfwrzEGf0XcWWLewp/XCfRF6sYZyLrdCcFDWaL0AgfDQ+2bf2xQi8E/5RWkgDBcxKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kAQ9TJw9; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kAQ9TJw9"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac29fd22163so898526866b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Apr 2025 03:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743502270; x=1744107070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0fLcWG3xRCCoczcLQcRJk5lZ+cdqHvZLEk7m94iuVA=;
        b=kAQ9TJw9GuspSLgSC2f2kFrc8YWz0y5QB39dvHfXL0rItj4MT9bhCXIoc5qUBjzjnY
         z7CWPKC9TX3sRuJZVJ6+cRTsN/rJUW0dJ4zuaOo/odFW9qnhOP40aUG1c4bDc6556KYz
         2tU4m+dENAgd4Bd+bvu09Oqm9nQ2fqa5kgMtwwUmuu9IYCK3TRefc/vy9Ou/KmCaAuvZ
         DhAFSqzE+Il4/WLCvtYT/NV5FFHft5nfbVXfdB7snNgSyObEe30iKWIbWyJI5P7jKAWu
         BjCFirZ59QKtCE3PansEfCPvqxccFTCBt2lG7eYruN4/MHRXWKok+JaZHM818haualK8
         MFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502270; x=1744107070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0fLcWG3xRCCoczcLQcRJk5lZ+cdqHvZLEk7m94iuVA=;
        b=kBncuUnswjxfCj9LSqR4417a7UksZRWNKKxKyfjgDJBV4wioHdpKrNdsvLV+ePInQd
         5RZ2x+VegSAGMmcurV0McGaAdJyJcWfwJ12t1r2vHqerCN8ki6EDLsubwSXy6zb7ptRM
         HQvC5hnFy8CLnoAZCn6iliFmJsUIYY93jhPu3EKenvM5zd2X9njZw+vocewP/N3ECV+T
         03I2/D+xswUGFHj/lB/c9zWZUqYqQDCtYAdFPoG3npCtQUO+ciOKBmy6jfBqKe0Gygzk
         pvmGsEWITd0Nk1fEPsbI0w2Tk/J662r1aOFP+Q9yH8svtHhimOMebWG7aS+lFCM9CIft
         lJFg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Uor33ygPiSQHX3zLbrVKMd1Se/bBflFIVTbvElX4GqpFBIgQMjCFsIS9Wi0rpmY4al53TXNsaxmVOqEIU+mo0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzszl0j0K1odsz476+RuCpjv02m0Mo6EEY5W+O6tJXMTmQbC8BA
	Z9PNy2K9oHuqup71+2t6i7+iKI+15hDSlCosqkDqcriORu76jmuIi2fAcz3j+qE=
X-Gm-Gg: ASbGncucAIDrKWwrjtPYjXoWB6drgT62qvzpjWWCFZVpMHiMxlzdUX2ks6lLeUcF23/
	KhAmCZxsBoNrqQ+g8/GkPmxe2lwoZYxcD+wUw+rPUV/JxDFTubSdAcWV2bjs/86ds6KQtWlzT/I
	7+WKfOlIkiTZccPvIv8JSepZ5vReqWoB4tQsnDlXjf/QGBRlYtoY4arvpuYrKzP+WUG5zT9777B
	7BYtXSsnmB6Au6ZsA4TzlleAYqPlaFx6OQZMEGjssI5VeKA2Vo60+5kH5pKTOdXvZmGb81FzRtG
	avjYD5knAttyVKPs+LyaB5DbCPG78BC8GnX0XGjaXL40bmWLuOoYMZZqk7ZDOO/EKbH0vhVUtbL
	tNKxeg/2l3O8lgy6RJWmaWEV4V381
X-Google-Smtp-Source: AGHT+IELZUBLM5q9YYlt+lD2I0tWCOgW2YPV6e8Gm9HIS3wyPkKW8jVGcaajvDyvq1766HKI/b1QYg==
X-Received: by 2002:a17:907:7eaa:b0:ac3:45c6:a1ec with SMTP id a640c23a62f3a-ac738a841a3mr1407550166b.25.1743502269931;
        Tue, 01 Apr 2025 03:11:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967ffcdsm757406966b.140.2025.04.01.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:11:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 01 Apr 2025 11:11:02 +0100
Subject: [PATCH v5 1/2] dt-bindings: reset: syscon-reboot: add
 google,gs101-reboot
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250401-syscon-reboot-reset-mode-v5-1-5b9357442363@linaro.org>
References: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
In-Reply-To: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

GS101 supports a couple different reset types via certain registers in
the SYSCON register map.

Add a compatible for it. When in effect, all register values and offsets
are implied, hence they shall not be specified in that case.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/power/reset/syscon-reboot.yaml        | 42 +++++++++++++++-------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
index 19d3093e6cd2f7e39d94c56636dc202a4427ffc3..ccd5558700943ef56f5e1c866400bcc21c0115f0 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
@@ -21,7 +21,9 @@ description: |+
 
 properties:
   compatible:
-    const: syscon-reboot
+    enum:
+      - syscon-reboot
+      - google,gs101-reboot
 
   mask:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -49,12 +51,6 @@ properties:
   priority:
     default: 192
 
-oneOf:
-  - required:
-      - offset
-  - required:
-      - reg
-
 required:
   - compatible
 
@@ -63,12 +59,29 @@ additionalProperties: false
 allOf:
   - $ref: restart-handler.yaml#
   - if:
-      not:
-        required:
-          - mask
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-reboot
     then:
-      required:
-        - value
+      properties:
+        mask: false
+        offset: false
+        reg: false
+        value: false
+
+    else:
+      if:
+        not:
+          required:
+            - mask
+      then:
+        required:
+          - value
+
+      oneOf:
+        - required: [offset]
+        - required: [reg]
 
 examples:
   - |
@@ -78,3 +91,8 @@ examples:
         offset = <0x0>;
         mask = <0x1>;
     };
+
+  - |
+    reboot {
+        compatible = "google,gs101-reboot";
+    };

-- 
2.49.0.472.ge94155a9ec-goog

