Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2C48097D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Jun 2026 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491624; cv=none; b=J/lcpcHwJdUasUiRRzV9JioWG2mhOy5ua3ZYtwIxFpHGhRJVZeDZ50ygi3DKKi4uYg788lDVOkh/qcK5Eheh145EoofuRhjLnV1vM1rVoaqoBW0hNK2O5bXoxRSHFvc0CT8mx4qZCAHney8ABRMlYDrXZPCXQ1IBREUM/4za310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491624; c=relaxed/simple;
	bh=2NgviHNZdxpicEM9rd/dWgHY01rnKmCVPlo7M+lrE2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N9H9xYLEfJXVl3KcVTOpH5hbrHiGJabFVFQ/jsdY03x6P+/4D6EcMKanPHVh2qdK/asEE4d1bZ8ZN4ZGGMtUCzm2Wr/Rn6XLR2TKquBfrbYf1l7Xgh3VCl4NVu6/W2TrNUA9zLJAewG6Y5bnFaJkAlNu2LAydYxAlDoZpfc6mw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rt0XiKF/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rt0XiKF/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso17378335e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780491619; x=1781096419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UJRcwfUx7m4tQO0H7dzGL7l03jX+wNFvSSTwQ2iw18=;
        b=Rt0XiKF/kE2Bzaw9uZMtgERZFKaVVkutUoZUlv2H2DzvyWIhpwxFu5kiQE253tLuK2
         uKRe4WXUCRlQ4x7DJS1/ov55YulxEz77HnMsjmSnOtlq54uz7yZhApop5Ae/xGyF3WFn
         w7OBOfLMd25jOrEm/48kv683bmcussw48mH5HwvUEyVPpMFN3WVUgQ170cFn7KoQaNAf
         UOA+PZw2+xMExxf1KAvR7W090Ic+M0o0Ao03t0czuAkzG5PmXwRgoJoO0oNhj3StiI7f
         oIHDXNk5f8aoW4lF8FyyJLibQq2GXnaS+tX+TCFPrxyNYzISAcKMD3SI+ZJXq0VcCqL1
         l4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491619; x=1781096419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UJRcwfUx7m4tQO0H7dzGL7l03jX+wNFvSSTwQ2iw18=;
        b=sPVEq8KpZ0lMgJx0WO6YSut2upgiNmoDJ3ILPMji8q1XRKwfeXcq5M58Vy4krFqrLi
         uHbAwQFrpb+UwQgQTvRpfezDxIjXDhunhSKtE04T+i3a15KZU/gWjncMpCN4u9zZrVfM
         EM61Ial0u1tkIZyb5iw1W0JsY8wdV7WQeDOvrkQPX4RAVnlW2xihJ4KI90hI37dwvT0u
         KFBu2aj5ic2fabRjFTIPhxxn3nc3sxrQkxqozgZmrBAKVmGfAR4ctW9oXpnIfgyY0bv3
         G6V9SvKuWpZJEkWg3Hkxs6yjYSmWInHhJxJMzbeqk6pMiZpo3ScBFlrmT8IM0xvX5P/M
         WQTw==
X-Forwarded-Encrypted: i=1; AFNElJ+6pbNUEVxjFUShEZdskgHA0vP+VWJGN4QP8axqpDppMiKllA1+rZwZlPVK1CN4szjRLuO/YfHDIpWhDY8wU8SF0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHb9hvv5Dfchoqgt5oLyg0cWhYeuZfMybYwbkpkjGvNuBGhPt
	zbUJ17fli8CtuR7DRqtEYZ7U3hA0qZxrLQi3lOPrw8cYh8iYniP9DPJ92TQnbrbIPCg=
X-Gm-Gg: Acq92OGa4ArUNl1m4h3/J5vfGFsXkJYndibvW6hwvRn8WVPFB4ii4HtLxq4wQwH52y3
	v/4AJXkrwqYHLE0rjRgPDB/eXGX+d4I4o68t7D2nmot9nRUKiT4QllQC1qnfAWzzkuRBUWnWnFr
	kx71/b6kQDxgXGTHQMxcZAAROMj4W5mdOj90qitW0VA/0eURwAryQaptQC4taBXl51RSr7Ja8NU
	lj+R67igRZCSmnVZ81NMvJtYTrll7Mn+nRi8hbxa7bnFqDYAS+EI9W+cRtKS8/PsfuelMDbf7AD
	gVmAq11PtghDq2o3VN47O5quzBXbHltU44n0Rl7iYd3UPUVqtz04466DfDzuA4vjXxTaNM7hBNq
	PkqTZ/KrCh1K88JskrcwmCZRaoE8s/SUw61dDtkSqhsHKdz3x/EWlBTjuBBwlr8FcrReAg0sH5w
	m4m4Hn2uOWwwK1uLUmEzzX0mwpgsSGYD+XFr+Wq5UoKor4zh9loL7g6Cn/WN1M41ZCybKih6WOK
	rgbEjROZz87yoA=
X-Received: by 2002:a05:600c:314d:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-490b5ead1b7mr52139485e9.8.1780491619214;
        Wed, 03 Jun 2026 06:00:19 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm149179045e9.14.2026.06.03.06.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:00:18 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 03 Jun 2026 13:00:16 +0000
Subject: [PATCH v8 1/5] dt-bindings: thermal: Add Google GS101 TMU
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-acpm-tmu-v8-1-0f1810a356e6@linaro.org>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780491617; l=3395;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=2NgviHNZdxpicEM9rd/dWgHY01rnKmCVPlo7M+lrE2E=;
 b=iPBfwCGJRkej/sxT+TtxA4HdlGWcPjWO694Z6qcPCKaUvKC1gLbqJWYHQRCMrbAH+I6HE7L1Q
 N4obNagGADtCS7KOAAHw3xE0kMuWt1vS+m5IVmg4jZfk1fneqUkTrV/
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
 .../bindings/thermal/google,gs101-tmu-top.yaml     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
new file mode 100644
index 000000000000..75560ebca48d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
@@ -0,0 +1,69 @@
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
+  - samsung,acpm-ipc
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
2.54.0.1013.g208068f2d8-goog

