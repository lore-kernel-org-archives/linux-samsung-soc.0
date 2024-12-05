Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D523A22577F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 17:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733420505; cv=none; b=fTogvv/DGNISxFyZeUTPlwEb5EQsKJKMeQggCa4v22kBjzHbyGe6WEkT94bHuCCWLc6u1HQolKZJZT3w7RXLRI+UVMdI4Q5P4vJ5J9aTx0j8nxe5YSdBD8mXIV+WfFzcrHXtAc2hGTUlmdDAUKhpV0MrGe6gA9IJC+mmHpIZcB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733420505; c=relaxed/simple;
	bh=qkOSoUzBaI2Fy8SWilouKpsw5RFfufxg16Ai+gil2WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXP5a7/t7KDwu23y53XtuBxrBoLUxYnZneUaphuLIgrhBpPijwL22XwWU+tTNMlJvKTFjJ6zNZpNWtTxLhzZnCd0RkUkUQ1u5p6buDhHBp4eEUs+HMFiBCqN4BCBIsxHeHRkEpq0MdN6/nRiGEBjDapjCXjfFHLpdD9Rn1cAwoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CtXWiCQ0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CtXWiCQ0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a2033562so11919975e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 09:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733420501; x=1734025301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKTSOcD5L+z2qw5+nXllrVScKZxcBqJj6UXu4K9Ii9s=;
        b=CtXWiCQ0iAj64ySZJ7k+jQsVdV09vNpwwFL+aNbKMMlei6LJjCeLPG+Co6/JcinROG
         8DxX2qlGnRgF0cX0qmoBmARpsgHyhB9blHXWNkx8neADPgc1nJKaavHUaJkjtkD/2B4n
         EjIDAyHA1tojW+PDJkpEtLAcjedgZntREbSxE4dwE6WIc17mFvU3FQZ95/TwnYw+MqS8
         jqGryan9d5BvDis7sWMbIurNYl1DNEzqkGGXI/CtG178YXc0LhqIrCK45fJZLSxxMuXk
         2YEZ1OVkloOQkXuEF9Ug1mfRSAw7vbyRiiM4nvl5SRUkwV03Q5J4zhEzzk6m2cHns0KB
         q4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733420501; x=1734025301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKTSOcD5L+z2qw5+nXllrVScKZxcBqJj6UXu4K9Ii9s=;
        b=AT0Uiypx/6o9jjRLZIACf+DdhqEt93OeAzKSLE602oFa1wdkLGYtQrkBjYQDvqZjXQ
         G6T4C9t6oY3zn2CXICXUkm3Hdr3tNHRF3kXoHaWtZLA06nBQcdoCCPcdssEklQ5Skq4K
         72F2BVMD0NHDcmqpD216SozJTbMydrtF0fa9H+NWQ+fojuQ835iVC6jcnO2abcqgnRn8
         vNwBBRLImj+BKnUOPUsC/Gm2FblvjEiZS+hENovWrbIIZXtaE7dBsLhaEN0ie2TRvGI9
         mRicOAzY6KARb79r108mWW4nK3SQOhYT4X9/ALkuZsVor9RPpBNkK2FQvv9Uy6POFOdI
         xr6g==
X-Forwarded-Encrypted: i=1; AJvYcCXFrg9D7w2UYxxxnk8KCcLTzwmf1PCphnHtpe3vxZtOsen69reLK9f8ujErEXeeq05oX0TX/GNPDdPMzOhd2eVThQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMM+As2NFZyitCUs/MIUKy8teO4zQWU2FkaupcMDNubpK7Bqyo
	a+TSAGXP7VizZTvHzOkeRgoUYbmHx2rMcYHQa/IF4TJGl4wcoP+tz2AnFkNCKx8=
X-Gm-Gg: ASbGncuQClnCDzrqRDfkGEio4Kk2YIot6sUCLjBLG0viWMioMehsn72GKJTVH859C1L
	uk+W7D+R6A7jJbLPb/6uAlKGXiMyY60IVmJCvybVkhGflO61vpds5Aq38BjN+/ejCECfDgIDzyj
	cMwB9Z99o7qMV0D1EUgPPlogBE7aGslSyHfJzIX2bEURiF3wGeNZS/fJ6OM2wI00hW1oL8Yxw4D
	3qU7B2HjkuArkzStU8la89Al3ZVzNzxb0rwYjrTmRWuLPnbH2PeB7Qe4pvtPmKRwnYj3dHolGd5
	GRekU7BbCrPwBAQAdQdyPvT4wTI2jbln
X-Google-Smtp-Source: AGHT+IGqhJzyDS4e04vMn1WyVytA3R0WpmSjXAbWRrFlxmWxFGHaT0ntvkzlA3YzSBZ0INS2vdnPeQ==
X-Received: by 2002:a05:600c:3ca1:b0:434:9e1d:7626 with SMTP id 5b1f17b1804b1-434dded7366mr1195635e9.25.1733420501143;
        Thu, 05 Dec 2024 09:41:41 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d6961sm30318525e9.12.2024.12.05.09.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:41:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: mailbox: add bindings for samsung,exynos
Date: Thu,  5 Dec 2024 17:41:35 +0000
Message-ID: <20241205174137.190545-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205174137.190545-1-tudor.ambarus@linaro.org>
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the Samsung Exynos Mailbox Controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/mailbox/samsung,exynos.yaml      | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml b/Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
new file mode 100644
index 000000000000..1fddec1fc64c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/samsung,exynos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Mailbox Controller
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  The samsung exynos mailbox controller has 16 flag bits for hardware interrupt
+  generation and a shared register for passing mailbox messages. When the
+  controller is used by the ACPM protocol the shared register is ignored and
+  the mailbox controller acts as a doorbell. The controller just raises the
+  interrupt to the firmware after the ACPM protocol has written the message to
+  SRAM.
+
+properties:
+  compatible:
+    const: google,gs101-acpm-mbox
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
+  interrupts:
+    description: IRQ line for the RX mailbox.
+    maxItems: 1
+
+  '#mbox-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  # Doorbell mode.
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/google,gs101.h>
+
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ap2apm_mailbox: mailbox@17610000 {
+            compatible = "google,gs101-acpm-mbox";
+            reg = <0x17610000 0x1000>;
+            clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+            clock-names = "pclk";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+            #mbox-cells = <1>;
+        };
+    };
-- 
2.47.0.338.g60cca15819-goog

