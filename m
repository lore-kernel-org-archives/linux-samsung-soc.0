Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F83E1DF258
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761914726; cv=none; b=mbokAXvGypTaC+O5OAx6pXHCIojEibDzJOQzBVUJWHCZ4hwE/g6kDU91tnCUN6Ioig0G3JRm3Rq4BwXrOxrZqHl+2zb0vbRlUZdYzkxzHtSDncS1cht+ehQU+VkNigh/M7SZf19Lcwlx9voeoSry1ElSsxHHHkYkHQJyhIdhtzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761914726; c=relaxed/simple;
	bh=sdrHsJNK5w1wePKRU9wLpHaRPe0gYufMWkbjaBq2T7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzLjI1v5hQ0GmgxWIOHDLmdT7W/ijLfymaB2f+oVma3ZWhu9k61WJsd8GtmrEzO5a8lmCEcL1PbrCbFhMTxsHgrzEIBbMjTXZYZWM1SBTTTJsH/IVp+qiqk5pkLEUKccacvzZ+403P0m2JlgeEbd2vpIr4l9UfnlpCCBNYea1VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m/LYzlz7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/LYzlz7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471191ac79dso24484855e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914718; x=1762519518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUYZv3Cu0MKcgzaUFYaSO+i6DnVIY6p94zccSzaHA0Q=;
        b=m/LYzlz71hysIwNcKHoTUPxaOWjKAdrJtPowqlCGkGXdCO2NF+iXDdQR39MIzbcx+h
         rEsZTroy1+zMguUL6su+h6CgAXh/hAXRDbuPUxePA8H5zOZIMJ7pTOhAXMF3t2wpvq/Y
         X0SpDU+YqvVDRM6IS9WG9K6OlTr4trEPO8QVSNNyFc5LmhftoDAT7V145xPkhvD2EGvB
         Of/1Ckfdfr4RbdDZCRg+Ab2OVt63qKaY41kFMrzt6Rk26+LjTFngyeFYFuP60oPyLfXo
         Pnl2lPz4ZFSQqIs5+wQcIrPEX2ELe7XZG66IAWDE9/AkSEotLB35NYKYL1gsHv9YkUXU
         ZIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914718; x=1762519518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUYZv3Cu0MKcgzaUFYaSO+i6DnVIY6p94zccSzaHA0Q=;
        b=KH1txWF3D3F08Ori3sT6xCboIeMz7yU75Yag/x3B9X/L2ayCR7fbISfjy8pgazw01e
         xUXai+PgiaMmv8VCWEm4R6RSn1W/RVN5EcK/k7dFeYeALNLl4qGpZq4Ld+7QJ1YunjF8
         GDEZnQ1/xTQuiAjq5JMJlplWwM+/Rb0En50cMmkFExTNoZzwNVZjznwWg82uxF4lQczi
         la6rhx5q8LEJPt7jYUD3+f7Bsjabc6oU4GIIXL/kCZz2BKexzBByMzfoiwg1MLaKEkNz
         Spc+UERqsmKIOoJjI1DDkedUZ97mpNuicT1plQGT8pZurQbkX3+zoz9oj7ZKkXd/sBEP
         daVg==
X-Forwarded-Encrypted: i=1; AJvYcCVa5ooK4Pu0LbxEia9c1qPEe3mjLwQ1flPm/ANPdN36vqB7Hz3fez09BfkN61Mrhy5q/vx4hCtXvOgzSbtiGafd2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWqZHUX84lwk4of6Pl2JRmOQJ8EFokevID4ejJVXgXnp/XF3E
	0hcxuXqfTldA6HKPN+Iw76cmpBEhLx44DHa9wz8PaGnat5tCOa1tYIfVwkb0syaipmE=
X-Gm-Gg: ASbGncs2IuIT0PF3z74lrQtn9bC7/16I54KyHPLCaQQmBzaB6KOOTa6GiiA2CU6CzQ4
	W/8t2BOQpjQSuFdi9aS6QoQmzRH2Hr8va+PoVgATvNXHpY69TteQDJEGijrK4TJuhhLhSvKOWNp
	p2WkiF9u/lCtq1+6TYsvPFXt/ApEGbs6q5G+ISAzS5KtIjiCkaZC123K6VVkAuxeB38SK2/ahd5
	aTU335NRK30wacOt6zMJ0f8xwvsb4z2z5nGBIQUgh7OuLLBh/Of0/T7KP6Eg3vherbPAOnpe7Ra
	YteO0wEroQR+PxtrEUVXfeGtb7RL/XJSHOX85/bGc87bFXTZRz+Y9YWMZZgDtw3yqOh3DFFwuiu
	k8r25gCN9ifN1inhOWVHEAURcC1KPLp8AL302xRYouh3aRRMn4KtHs5IivmO3O0WTqKWQGp15HN
	OTqFOeeRmqjRT1YHuR1t9aS7AJhZZdE8k9aWwPPF2NbO68netpTDkm5R/Ws9R6DDg=
X-Google-Smtp-Source: AGHT+IE1jX74SrJdWKq2vwBSCF6/p454jL2nStHGd6BUee4PeD5edlVBtzGDARF52ob7VXL18M0biQ==
X-Received: by 2002:a05:600c:1f0e:b0:471:1717:411 with SMTP id 5b1f17b1804b1-477308b6105mr31513855e9.24.1761914717490;
        Fri, 31 Oct 2025 05:45:17 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:17 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:45:09 +0000
Subject: [PATCH 1/5] dt-bindings: nvmem: add google,gs101-otp
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-otp-v1-1-2a54f6c4e7b6@linaro.org>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
In-Reply-To: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914716; l=2206;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=sdrHsJNK5w1wePKRU9wLpHaRPe0gYufMWkbjaBq2T7Y=;
 b=AzeBS3xPCS7ipIbmYRwBNmPpWeii/0REg4uHEKIlalF+Nqp39ED1ebruQ20wc/fQ2pKxt0v3Q
 vvYd2l2dU4uBxwKMIQ2L5J3vjcn7FMvU7YTvXTWg7YNSDkjXjZYV38P
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add binding for the OTP controller found on Google GS101.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/nvmem/google,gs101-otp.yaml           | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2144911297beb89337b0389b30fe6609db4156ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/google,gs101-otp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google GS101 OTP Controller
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  OTP controller drives a NVMEM memory where system or user specific data
+  can be stored. The OTP controller register space if of interest as well
+  because it contains dedicated registers where it stores the Product ID
+  and the Chip ID (apart other things like TMU or ASV info).
+
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-otp
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pclk
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - clock-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+
+    otp: efuse@10000000 {
+        compatible = "google,gs101-otp";
+        reg = <0x10000000 0xf084>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+        clock-names = "pclk";
+
+        product_id: product_id@0 {
+            reg = <0x0 0x4>;
+        };
+
+        chip_id: chip-id@4 {
+            reg = <0x4 0x10>;
+        };
+    };

-- 
2.51.1.930.gacf6e81ea2-goog

