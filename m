Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F06F30749E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474183; cv=none; b=HFVXbLL+qjA2ag8U4JC+UQBMpnTbU9W7D9E0/fhmWHTRQeG19QqmnXpAt1f/r5nNmO1mKXoZP/X0YQd1DHbSFWupMfq6QPV2q2qQFAMgyK25oVAu7RCa4fkBSgwcuXY3FN4GEXvrNemRFAl5YgVdNtJdjA5A1fQDAo0K5N6M4JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474183; c=relaxed/simple;
	bh=hE9pu4zL09R2VnRw1hPAh8QPybkRzkJsjvziTMQK6lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsEgLFjlyL5Q6jD9dZ0A0ZWBaAKobIsEmNkKMofc6Pp1mzabk8k76jesbsDFQtemvZKHPz9QzZc20QdLVxnTGvayaC+JzHNanvW7+rpuZt1bJZ95Sh9TMrfji9Ug+DwYGM42xtWAeuXMLup+Clw1U4Z3yh8NDUYbTQtbSCGhHIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKrjRJrt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKrjRJrt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so2780263f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474179; x=1764078979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mT9D4mxJaHrktugW+TtOKGoZWS1UVqUBb8i2CtMbCwk=;
        b=VKrjRJrt4E9ve7xMjcOl8HIgloLsJ0YzmKJcLmkQV6YYWaZWxGS/TiQ17OdTcc+l3j
         K65ygQ+BME2B1U8WvzXaDLoJka1ly+l0Kjhk0XwAc6FBdJ3r8Desy7y0NDFgIqcDDXkD
         LzgPknmB/Kvn/8tO1W//gLbXC7qTZhnSMERlx8OfRAhrDPIyvrcrffSd+kKMn2DVP979
         MEqylFkib95L1JsEKkInG/Ixe+gFST+a8W3M1e+Dkd6vVW9tHEDfMBI7T+cgpROA9MCE
         DXhCltDo20bZBE+uJPkhffpyvNBiivvqkmpNUC/jLDHbOJelIZU1VF01RAgmsWEfEGcO
         5n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474179; x=1764078979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mT9D4mxJaHrktugW+TtOKGoZWS1UVqUBb8i2CtMbCwk=;
        b=w+IjnBSmNDqmEDKRt8gmUtzAp/QmFJgBMmBvzY+t2VDCSR/CPkq7frjg9Wz1oL1+Sw
         +geX7tW39kFN46etdJEqB9kdLpjMz/lcm0fkSdPH3BUkVRFKIrWTFsG7sTOTV3SGKDg6
         KqQ4v2a81DAlufQOn/iw7V+tIEdZV4ew/xjHrODM28NU1c0e31HEjBbUD1E/8ZjEK8hA
         1kdQ3rPXZYwZs5nnpwuTxlVzo2j8YHYsoduq6O/9oK0TEqHD9gbaOkIUS+3tHJXH5KMp
         SjN5o45mlnFRvDdAbM+1YfuYOqNBpVLoVZCRsywi4nGpcoJ/L/Jf4i93IRzzqiUeliVl
         Yvew==
X-Forwarded-Encrypted: i=1; AJvYcCX4g7jQnPZ4rhRm8GYvyjAZiDRU9A1w7IYqNq1n8DXFQp/LeZBDcEze/Vj98nvv2Fj5WlQBaQCy84iayQxFk+53ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqyymSr7//dPPEGcx9D6035TH2ARBQQjAqkYqJF/UuIGPRYkyC
	HXsfJXcSTCVcBivdC0rxxXdVC3O0gR/wnL+U2LwAnekh7AcVdcZiQuDO8ZTdmMO00J8=
X-Gm-Gg: ASbGncvoGSyE350BdtM+gCRQINBdXCyD/gGpV1O3kyTTy6uiNgBtjLNRpFjk9N7GNUO
	shPQuwanJbZd9beigTjP0R8Q8g32nDDqHBGphyU5mr1SsCuKBo1VqQ6kI8qsfpjup8yG9kUj3fD
	x2BR7sByICESv966LpvxWlUGdP6moAjerWe9+vlHg4nupHPZs2l6qMvftkhip/5hc4oZBUMnrtZ
	RIiRjnXJNUDGQ1YUVncdVzUVwAtX5euOviKqtFp3Gknf8w27wSNMFd3ZDVfd15i+GzBtixSROxO
	6bqO/6GAL7wR8x1mhqCrdUWB0mmizp5XZDwCXsog/aaMVHQWGIflo/vAMKj1txts8oKvg67n8OS
	ZCyPik+mC7QxQkodnVranh5/DocIcKI+6a83IGB6kn/wS+R72kD1/Naj8XWy4vBhqBEZ8KMICG7
	oc0eCOjn9L5L9+j4HObn3P5niG9Yy4ZOwmjvMB+hFGfmUJidAHm1U1CIulRfbrYo5tvOxKqhtN2
	Xoxvg==
X-Google-Smtp-Source: AGHT+IFSeYnPbCw3tis4yQRZI08iOt4XrwHVQj4yd7amd2aPdf7DLT9bDe6bDLKPiGXs0lIp0USpvw==
X-Received: by 2002:a05:6000:430e:b0:429:c4bb:fbd6 with SMTP id ffacd0b85a97d-42b5936c4a2mr14623335f8f.31.1763474178959;
        Tue, 18 Nov 2025 05:56:18 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:18 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:08 +0000
Subject: [PATCH v2 1/7] dt-bindings: nvmem: add google,gs101-otp
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-gs101-chipid-v2-1-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=2105;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=hE9pu4zL09R2VnRw1hPAh8QPybkRzkJsjvziTMQK6lI=;
 b=rOjp9fByKIiYv2zyDGDmfAh5uHoPJlkPj+pJH/Wo7/4XVrDXytSpx2NxMD3/6YvsMTnrew6jU
 MLbn/+h0vuFCoeJHn589V0xkn5CgCijQecUkHEOp3AFcz3Urq6cHgrN
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add binding for the OTP controller found on Google GS101.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/nvmem/google,gs101-otp.yaml           | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8ed65e906a2a1b0c216a09c9444f87af61090b81
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/google,gs101-otp.yaml
@@ -0,0 +1,56 @@
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
+  can be stored. The OTP controller register space is of interest as well
+  because it contains dedicated registers where it stores the Product ID
+  and the Chip ID (apart other things like TMU or ASV info).
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-otp
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/google,gs101.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    efuse@10000000 {
+        compatible = "google,gs101-otp";
+        reg = <0x10000000 0xf084>;
+        clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+        interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.52.0.rc1.455.g30608eb744-goog

