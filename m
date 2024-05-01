Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DA1502AD
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 May 2024 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714555181; cv=none; b=kw3okC27WIZPDD1lbaOg6Ax/IS49JMpyzHTnG8vDhKX/sIHyj1aiU1nCVHqowCXkmtsnSekQem1SEvEblA2QMtT8ZiUtUui3t8lpBT/qjPCW1oaHL3RpK/tYAVgcpc7nc/1dqKf9FEZSlKENbyHmeeMmSBHrdP2O9ouHs7fLCr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714555181; c=relaxed/simple;
	bh=fWuvS/YrupAs+2uDCcwTv76fh6CyTz+lWnjpdQCnTmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mMp7w6tqZIM0APlmFrhLJKVY3gD445YsXPjjCzrrb7sO/RPpGHZMCQAH9bWI52uF1RbVptHrAIXC3fOMZXZCWyXsJbQ9RGWXw5wZUNjSZcXaVYVaK8D/jfpHWKiA7eQOdyhcHeWcsNju3M/cqW3hfjlanjzTP+FctTDOHShUDeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CB7VoMDD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CB7VoMDD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a559b919303so847102466b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2024 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714555177; x=1715159977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjC0thOUO3AI+wU5orw4JxlnIQvZns1Xrbd8AZdvPQo=;
        b=CB7VoMDDGzAQ+mCP89r2PbkPl0TqBc6wek0ajpxgVSq74sbOZBv3Hhr2Zd0u6SsOJd
         ib0mRuyj8KAPkXiCW5OEJZIC2VmNYeoH+lDgB0iNHLC1F7MnsCJUM3ZLJJKppNn35BNP
         MqxYKl/u+azEjwF1hMY2x21xzotGmZ66CsvlHhTzTIk/Onq1lyreBoEf8rLwzuFpvxV5
         jfkQ8zv/twTwMKJ0T/b5frs42722txD6zJTQoYCd/LXwxtN7T/b4lKCfP62VhmSYOonW
         HZDfNyjy8B+vWQ01eQBLDaEwXDMN2rdAb30frIvelbC3FOfWcCbNHyHhBAFVZdR/V12O
         OEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714555177; x=1715159977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjC0thOUO3AI+wU5orw4JxlnIQvZns1Xrbd8AZdvPQo=;
        b=aD4bQNBj6tlHIwvEXqoNz22UpARIBHiUuF2LkSjTaw6N7tselNeQZvof1b3wVPN3Ae
         pG5rad5Pi48NQ8JFEZnDiRfxQoJVHMa3q77LuaJ5c6S7hB5AiTU9I/Jwj3Cn0mTMZyfM
         XOqBAp+nZEc4zNYc3HmZ2sObyvuxi3dG5OJQ3NKtLU9v2EK6sgYKWhAEaVDs0mOuemMb
         5bEqi5gc8Ku48WC39xBiUUBaVZpXuujZ81ncnazQTJYpyDUdtesbrpIqtr8Xf0+pd1Or
         JtgJgNKs57n/LvLX41U7xXAJKDBuVFhx2UKK7WzQCJJN6RFdvs9YQ7QbVqSHSmG00ecP
         vGOA==
X-Forwarded-Encrypted: i=1; AJvYcCVkJrt/QYm0/PWYwtbLhggPqd7/O4rQLYrznl6KeKC/+Uxt47/PmTr2nXf2VMU2n9xxm9L4pVZkpMVt8fjja5ClovgSN7NEgnvV69TimI0Y3Y8=
X-Gm-Message-State: AOJu0YzRbHp45o7hzOXQPHgOG6g1AC64aiBtkkB5VXRBpX+tz6hi781X
	65VM3njMRrT1phtuxHsWjkKs82uxyJdD0B95FKHmb4lPBXrD1oAj0/j+1hGdNhc=
X-Google-Smtp-Source: AGHT+IHZcl/NwEeZn+eEz03CLh9cMSeWZJA/2KYO9UAu5/Lo5NKkHlI5Bg8SHMlhBa7fThQtTrER9w==
X-Received: by 2002:a17:906:e2ce:b0:a52:19ea:8df0 with SMTP id gr14-20020a170906e2ce00b00a5219ea8df0mr1534908ejb.66.1714555177641;
        Wed, 01 May 2024 02:19:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id bw13-20020a170906c1cd00b00a58de09fd92sm5425674ejb.27.2024.05.01.02.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 02:19:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 01 May 2024 10:19:36 +0100
Subject: [PATCH v2 1/7] dt-bindings: phy: samsung,usb3-drd-phy: add gs101
 compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240501-usb-phy-gs101-v2-1-ed9f14a1bd6d@linaro.org>
References: <20240501-usb-phy-gs101-v2-0-ed9f14a1bd6d@linaro.org>
In-Reply-To: <20240501-usb-phy-gs101-v2-0-ed9f14a1bd6d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, lee@kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Add a dedicated google,gs101-usb31drd-phy compatible for Google Tensor
gs101 SoC.

It needs additional clocks enabled for register access, and additional
memory regions (PCS & PMA) are required for successful configuration.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2: avoid having nested else/if, and instead change the existing 'else'
    to explicitly state the platforms using 'if'
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml         | 61 +++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 452e584d9812..f99f055ec704 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - google,gs101-usb31drd-phy
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
@@ -57,7 +58,18 @@ properties:
       the OF graph bindings specified.
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: PHY register base address.
+      - description: PCS register base address.
+      - description: PMA register base address.
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: phy
+      - const: pcs
+      - const: pma
 
   samsung,pmu-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -81,6 +93,34 @@ required:
   - samsung,pmu-syscon
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-usb31drd-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Gate of main PHY clock
+            - description: Gate of PHY reference clock
+            - description: Gate of control interface AXI clock
+            - description: Gate of control interface APB clock
+            - description: Gate of SCL APB clock
+        clock-names:
+          items:
+            - const: phy
+            - const: ref
+            - const: ctrl_aclk
+            - const: ctrl_pclk
+            - const: scl_pclk
+        reg:
+          minItems: 3
+        reg-names:
+          minItems: 3
+      required:
+        - reg-names
+
   - if:
       properties:
         compatible:
@@ -100,7 +140,20 @@ allOf:
             - const: phy_utmi
             - const: phy_pipe
             - const: itp
-    else:
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5250-usbdrd-phy
+              - samsung,exynos5420-usbdrd-phy
+              - samsung,exynos850-usbdrd-phy
+    then:
       properties:
         clocks:
           minItems: 2
@@ -109,6 +162,10 @@ allOf:
           items:
             - const: phy
             - const: ref
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
 
 additionalProperties: false
 

-- 
2.45.0.rc0.197.gbae5840b3b-goog

