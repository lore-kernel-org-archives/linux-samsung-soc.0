Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3905819F489
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598320; cv=none; b=D4E9n6FSUuAUU94+arwEiToFl5zKUXoV8HjY4q+k9F85D3VTHQ8JRm2Bqig3Nv8xcYQB1fKGqedUdMmeR42AdRb971gESXrsdzl1hvL2v3r8oZFdmsrCtSVTmRDFOuw4cIBKhJbgCuZ8yUs26H5iLCvhzLAeQJhadp56yHNOCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598320; c=relaxed/simple;
	bh=hYQB0xZ67lZhdVZ8Rt7JeIuM6JzDat6vMQb2LC4ryTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACkxlWXxkWm813aBM5RCOGgA6C9nXQKXWKmev47FAev3eE4QPQs2uQO1oOsi3MHOQRXRt7HWVQN4bHi9ctk/sU7Ado2zpCaPd/X/7lMKDOmD4wOlYMDEpTmqNsTinSGgVdH+IIeR3i5Vw3eKLAmFJaagTOLvGFtMZidXDBBnyTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lI2lrVph; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lI2lrVph"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso21835785e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598314; x=1746203114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYqogGLC2cddLPBbS1CDWY2diLE+Y0sNiNUFT0GEwxU=;
        b=lI2lrVphrNlhFAJAm3Tr+VNoHa7nOPsGJJq7L6jAiYg3vY2qWr8n+uNYe2NW/Ehsg5
         2sGZ0dodq+hI9U1eVnZ2d/pUehl5nwoiPpOh6MZ/1gE9oSdilBFMzrAASo9YYBK33uxi
         h0RcowZd/XWKa467+R0abpZaquBx4oXaPAc5SXOnwinVL2DXGU/Zf/i+0FRtk4e014ui
         Ij34FcxynFTvn2EQvNrlfrfcEI2h2gzpT6f7JBIrjCtawlSdYRhJF94E6DZfbjF0pE8E
         VY8F0i6/m1j+p1UDsZwGbVb6EkymgsHV8w7eMXrkb9HwC7rQkKqWISDjjKGdgXDl/Spc
         /9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598314; x=1746203114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYqogGLC2cddLPBbS1CDWY2diLE+Y0sNiNUFT0GEwxU=;
        b=puoJDvSEvKc71gONtT7hCbJMaClmCyiK3TrRmEMKeN3uRvhZ+p/ZxH01iV85XUjzMt
         DY5qON/3YRYaUKSR/2GDLzlCIbE8QbiQsQjT/ai/UVOgKf4yrLAUIm9aeXGnaM69bqLU
         T6taIOiMkskYlK5Ey0WnZWA3s8o5xe9X2uB3Ll2b6L+5JiY1Z8O5BVlRDX2vXMbou0Ey
         VYcPZEa89y9ovp+MtavOKgTr1LXBRgWbCQO+cIpmUOU1VjJPoZ6tGbapLmPFUOTfyeUG
         u6+bGTtRjMPNplXUdPK0rXKSgSjlHsKm2SkUj9MU/sbM+mGRd08S/P1O1Obobsd7Ntmw
         ucwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6djjOjy+bZVGM1hQiGNu52WI52I/j+laQ3wKCf+ml076go7NFb65FXZmxOluGpzwzPTmvgaLvgPBb4CTVxdJemg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWP2dgqJo9iUYn59cITb6ig0ojSISr+V1gXLAY5g6TI93bnMum
	UQnVc4pTFJkfpla87y6BooBFBuIWDFwInX0r4YK/s6SEYG035KkUfk89OggHYq4=
X-Gm-Gg: ASbGnctavgFKn7KeeI3KDR0D12PnLsbe81DocK12QKmmM7erH/dLTHSYgLKK3kRx/1i
	MQl59wPTj+JwAIrk7f/x9URERi7IFDfe62tOeK00aP93aHt8UrkR9Cx8Ta0iZ5l7aZZCPtiyMk6
	ZVxE+4EVOcIhR2j1U8opBKgbIGhHHMdUHte1rEyiqF9/+4kom3nLgiYGOsjAVCorHoLz6fYSGCo
	cZScZh5LQ5FXEwn/plwpJ/5MwUCNtrNGQK4KlXw+2r/maAjFhiX1GY5D++9M1KhoFdPst3zZ4g/
	NnbKIoU8lkYuc36NKd5QDyPgJDqZwCJMwKfEbAmGuFZVpcYtJNr0YXexB/gtb1EKqgcYe7b0s8z
	BbsLi7L4=
X-Google-Smtp-Source: AGHT+IEoUTVhmuAxWok9q4iOOc7aAuIl/RZYfIJKhfks0tAcJlF/1Zv2cSL0eyMG6m9wGc2v6oqCTg==
X-Received: by 2002:a05:600c:a418:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-440a66d91cbmr24459615e9.24.1745598313967;
        Fri, 25 Apr 2025 09:25:13 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:13 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Apr 2025 17:25:05 +0100
Subject: [PATCH v2 1/5] dt-bindings: soc: google: Add gs101-pmu-intr-gen
 binding documentation
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-1-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=hYQB0xZ67lZhdVZ8Rt7JeIuM6JzDat6vMQb2LC4ryTs=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dl0fO9aWiyJAYUMFyeTxppJc1TurFPqfxlJ
 e+kZddHU/aJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZQAKCRDO6LjWAjRy
 uvfOD/0TCWaz/XJ7+sF6TYUHwykA7Yr7lzGpZ9q3aqgqVLiJ4luaXyQ8Ob9aGBwCkA8vyrPaUQp
 TH2m22EOmeEjBPVJW1pyObwU2pHrIu46f+KCzJwL6GiiA/He6ZqhjMkFkRnH3nORmmsWoG/rcdf
 YLykA+AhagK3hgbY4520BUJ70waMgXM2UivHw64r4wrMIdzQQVwjGCNMKIhCMNY5whp3p3GYtS5
 /CauPxyjuL5ca56ZNjjJGYsuAvExNYswU/QUXDKbC6T4EpDYgMPNtMrIwkkFBiSlNj+nLViq6in
 uEDVWm4Z47clBZ95I6b47SgLz1lv9L/ums3ci/r+3Jmt4C3qzDrwkkqcHPR6gD51vbgRlSsDGcB
 moe3zec5Jx/Xi8It8QVS49NG7DeSz4eZKCMV8JoaAu5cC7cQVMkeZMYa945BZMeOMB+IA2nwLIe
 yuNUW+bfIQQyHLS7AKztyGDhq9+yu83OK53wVv6TmKmjVyKG6rnmi4dvK+LZU8EmFGuVz/VYhjb
 efbAW60e4PW5Sh6MBdepjccRkY7knOdXdwiytjIJl5tDV3+R8YnTx9ri8YLksHIrvT7JZsf3DY/
 rbinCK8oV/m8ELlxyZvF7PKhWBuhqfb032KalnVE4xw+PZNiy1ydgdDYujCripu+vC9Di4fVUSD
 AAA/4k0Ey48IVgQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add bindings documentation for the Power Management Unit (PMU) interrupt
generator.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f358c5dcd1b61e271601359bb15091e31b36d245
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/samsung/google,gs101-pmu-intr-gen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Power Management Unit (PMU) Interrupt Generation
+
+description: |
+  PMU interrupt generator for handshaking between PMU through interrupts.
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - const: google,gs101-pmu-intr-gen
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu_intr_gen: syscon@17470000 {
+      compatible = "google,gs101-pmu-intr-gen", "syscon";
+      reg = <0x17470000 0x10000>;
+    };

-- 
2.49.0.850.g28803427d3-goog

