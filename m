Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665CF3806C5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 May 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713433; cv=none; b=OpDtYkED5dNlCiyhf2FEpWxYREWwsRqVIiUNF70h2FHxuwyB7ZGcltqKqVQntaTAE8RH9S0kJ8DdsSKKUda8kgQLraYIYSAZVQAczO5OeYyHsf0mFmY8AlBrlYhnntaE27fhAfdj6ZKIUnfookE7NPzDo2pkfaV/VwSb1BiRcuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713433; c=relaxed/simple;
	bh=DAUUHdnV6Bz6+/JxuE+k0hPb6SNHwiYOqoiSfSYzQUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJRTkwHOWE0hgvAc44a6XCvxPqhWWHWPzmQ24Dt5sOBcq39Z+hZme+xah+PpiPWOc3mgY0ze2/RWktvZEnwmRmlqPK2hivyCnS3iQfWOg8o1iMaQ8H60jPe491L/VUEtVc5sSgYGrV4tRwxLOH8mi1+NTpt/lP5bxBpGByEht68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpRGSL+/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpRGSL+/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49068493267so5693985e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 May 2026 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779713430; x=1780318230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDToCxua2FGXb+7ZVGR5RdwizXsWPQiwm2ZuxQ2xHTo=;
        b=dpRGSL+/pim48Z0zfZIik1uQvTlOCOmBDTHFciaAqq5hwy5dgAEhHCuupwUEgzwUgU
         Z8zf8ge482RbcF7rpWDL3DLQp4EhX1f8yTS1E1FhQ7rBqMQ8IIDqGwXWIxRDqdxNlvMn
         j5D+4M8V5IrtDjM1/16KpD8XCr0wcsECcKmBWZVP8+txPewiB9NKMcB+m70uP7utTHW8
         FNe7tRhMzl4BiVVPnx3YJ7WkJBOIhnpWN3nWgXc9QpAc2DUA3rUoo74u5IeqIHqUS1sF
         EgPCmSxIbLNPcqaZEMe0guiXzwZICgObSAq6WImtFZ7EDBUyR0vRqqKHITDrhNreAPuG
         oC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713430; x=1780318230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDToCxua2FGXb+7ZVGR5RdwizXsWPQiwm2ZuxQ2xHTo=;
        b=F61cglWgAaRuLXI4cOu+0PVT04vlYeTTrniW++DOUtWTkOpWEnkycrPNyOxSl/u2hj
         D30LKwEOU9FGBoyJa/8t+e1+9kih9abRdFTJ+qN5SlcQHyIuQE04Nr2Fr1PJ2Y8TkoRO
         g3dr4McTrhcWaBwPUBuFZMCK/WA16/JQMGLf9FeYiia+qK71cFeDS/kr1+mfnWaX7OnX
         ncKKLX0J+kg60vWhBUnylMuvyZQZeL83KZ6uIOu3G4SlQrRgVCgfbUE2AmlMChR7Dfgb
         V7ht0RSCj4lsIjcjzribrzgK38ts/t9/Cl/Eid5JYqL/j5jM0BNk3dfaw4EYHc4aKj04
         rWgA==
X-Forwarded-Encrypted: i=1; AFNElJ+ioxVmxDsTByty/b6ZBgtYFlFQZcGuBtiLmh/LS8tTAe+luEcquGDP15JqHxXofZlK6d7EKLRIVveLVd0vocQUig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw21TkgkVTo8Xj6F5aUx/VVRh2WdwxYVE2mS0RaLb5UkUlu0x+3
	RkcRf3JR3gVmKAsliDX7DHrjsyKuVxpyigpMfwS+Mq89aBCsBWyJXPVmz9gQw/40fUU=
X-Gm-Gg: Acq92OEZw3cQFzKRvH7NrxwmaPlURhQnZikSXERB15B0y5js9uTWkVxxh22g6vohnjq
	zkChP03vOE/yl0WlXavr6UGSVxUz/Ls4p47Uz/Q5XFJbLhy1VP+dQGC4QvNT0VX8Dhvhl71Jj+H
	pYA7J577OCv11eKTJ3SplNw1SPw8jTooBrFg3slYnYMdEf4Tqage1xbHP5fqRBFEpWn+yNlzqiG
	1pL7BXNNZpT/p49ta9ZeSWD21SPS+QRSs606HiYBfk/ssuavV5k0b3bKRW6D+yW82meNNoI7PAz
	XjcK2rXNIMM8yIJugMkoiZfiDT2SmNxPtnlkUTiGvYP5Xs/vq6+7HyFJA9hPxeCyfzhM6vTaMWH
	3XeRD9dPwkx8hhaiph9UeU88Qna6d57+SJeX1KREsKQ6c8qlSHKMz6g1isz5PHqEy/oFOTM8iJZ
	i6LKLSv99OqKZbgHE6mhbusETRjXF9sauDkqKzSSUKtnk64SDH8B4v4fzG9vkX44lXy09ICZKVI
	b0gcHM=
X-Received: by 2002:a05:600c:4ecc:b0:490:3c90:2cda with SMTP id 5b1f17b1804b1-490426cef73mr223966475e9.20.1779713429563;
        Mon, 25 May 2026 05:50:29 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454cfcaesm241824825e9.4.2026.05.25.05.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:50:29 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 25 May 2026 12:50:21 +0000
Subject: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
References: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
In-Reply-To: <20260525-acpm-tmu-v5-0-85fde739752e@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779713428; l=3371;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=DAUUHdnV6Bz6+/JxuE+k0hPb6SNHwiYOqoiSfSYzQUs=;
 b=ULkkI8n2UPTnqvUWoHoTUCDJ4MK6ZX+UVIFvysuu2RleXY/AfOM/GGmGmIu4wMR82yOPy1RW4
 OLHQ5e8X18nBxHYr/DkmwVIAVM0SLz/ezkJaIIoPA5PdDiemOxCXLee
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.

The GS101 TMU utilizes a hybrid control model shared between the
Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
firmware. This hybrid ACPM TMU architecture is also present on other
Samsung Exynos SoCs (e.g., AutoV920, Exynos850).

While the TMU is a standard memory-mapped IP block, on this platform
the AP's direct register access is restricted to the interrupt pending
(INTPEND) registers for event identification. High-level functional
tasks, such as sensor initialization, threshold programming, and
temperature reads, are delegated to the ACPM firmware.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
new file mode 100644
index 000000000000..d0eb2393d581
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos ACPM Thermal Management Unit (TMU)
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description:
+  The Samsung Exynos ACPM TMU is a thermal sensor block found on Exynos
+  based platforms (such as Google GS101 and Exynos850). It supports
+  both direct register-level access and firmware-mediated management
+  via the ACPM (Alive Clock and Power Manager) firmware.
+
+  On these platforms, the hardware is managed in a hybrid fashion. The
+  Application Processor (AP) maintains direct memory-mapped access
+  exclusively to the interrupt pending registers to identify thermal
+  events. All other functional aspects - including sensor
+  initialization, threshold configuration, and temperature acquisition
+  - are handled by the ACPM firmware. The AP coordinates these
+  operations through the ACPM IPC protocol.
+
+properties:
+  compatible:
+    const: google,gs101-tmu-top
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB peripheral clock (PCLK) for TMU register access.
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  samsung,acpm-ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the ACPM IPC node.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/google,gs101.h>
+
+    thermal-sensor@100a0000 {
+        compatible = "google,gs101-tmu-top";
+        reg = <0x100a0000 0x800>;
+        clocks = <&cmu_misc CLK_GOUT_MISC_TMU_TOP_PCLK>;
+        interrupts = <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH 0>;
+        #thermal-sensor-cells = <1>;
+        samsung,acpm-ipc = <&acpm_ipc>;
+    };

-- 
2.54.0.746.g67dd491aae-goog

