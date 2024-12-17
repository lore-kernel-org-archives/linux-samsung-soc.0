Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746BC1DC19F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428450; cv=none; b=Ofku4mXCBPJW3lF2yWJGU7g1nwOvL+QZEI1uLkKUOUphYDfGEg8rAC/4vOiZ1voSHeDTukojXJyL2FOXHjitd3F1fa5B79y/MmeFd+cvpQKbrxERXo+z+A8mXCqcWOf00CjXaPi9+bP4TrrifAym1LGXaFhW9jQq52SxOa7wwCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428450; c=relaxed/simple;
	bh=oGbadS/EXFOmnPlUbzd78fQ8Sa6oboYVtVmK/tk9ZNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OdXjH/xtLpmBVipR+QepgEi2KewmGi2J6FCXpDA57N04MxIO0OJ1Sisg7/oR5AW+M9wY7K8jaMt96Ls2f2822oFs+knOqzfu8JZYEXAMMbDHfhdeV9L9fezWJ8Fmai1QKW/CrzNFgPz4UaakXDaJw6BYoFNEk3XIPWrX07dphYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LHI0jIgx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LHI0jIgx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso24604195e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734428447; x=1735033247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vhnMvIq2ObCy9hYEzmIANhln4VKtCIO/wzhfP7ECA8=;
        b=LHI0jIgxOvMmgbt4G3GOcTiXnd5gY7E/xl26Hr20B1QsDylu633OqnhE/ZSE/DSH+g
         f47hvA35EYPfyuSXZtGPbi6DV7ehRVuvrVKl6NBq4rtFr7MDBKzTjemfs2pGp8Xhvwjf
         hwoXbxvU62D+AYVveVh6u+cCz2/km6gnG151uTIqiW1pTyUgB3RPb6kyAxz/QodrjTcY
         tFZYBgZDSndq1TBtMTX63UN+XKIfLG/5ukMRpOa9M6yDAMSqQ5PsDlP2w5/Soxk+tWnA
         YzvgRElqnr6VkyYZcHcVFHYcr9rrVFQuQJdizMDM5cYMZs6q0Df8pxbHZaN9kcdnc/iI
         hQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428447; x=1735033247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vhnMvIq2ObCy9hYEzmIANhln4VKtCIO/wzhfP7ECA8=;
        b=sH1xf7g/xzHHT2miDiTQ/5cP5jKAvXerHsMoLsz/WdcepCxkK4qIUnztM9gEQV6gC0
         ppXEejnGpcZBQQ6d9XmOoiqAJQoTyDxPsWjooHKpWbXa4Wv9gTCOo+ssZb3zCn4xFvWj
         sGdjj2ay5v0mTzGiV01ARKeSXi8eVpvDDdPvVoptcFVeW2AQIKvtls7HM/M9n85ab7OR
         F6LCC2+qK3fCuxpjLXD0rleBh3lRgiyOPbXUMAZzZYYEvZ7AFJD4z+MlllmM3UmfV6mR
         vok4vhwQ2BoqT8TjTDfYm7H+C63o6jH02GO+mHp51b8h01URBw0d8kNKMIFqNuy5sftw
         VEVA==
X-Forwarded-Encrypted: i=1; AJvYcCXIpzhRoLz6BYmYUQwsKOZqVRuwFhxGUFL7VpvMyqXSfkBG0kNnI42UJmO1Ry34ZbrHIGMuERev0w+ZqVwaNkmxWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5OQyCaoiEu5yM/anuZRaYhx58TEB1tKxl4Qlw7g32VExIPze
	ECWqCeL9flVBya7nTsyjJRGqXUFGcpCBBjTlFlc7ClKULkXgatPFUcOKB67NIH0=
X-Gm-Gg: ASbGnctu/1KCqfYmR4wdsrjGhupk5fRp9iwSq909sQA1dtgMYA8pDaxh+VwZqOYqbgu
	AR7JH+CEGCQoHg/7x6KlmHecoHBag3WJ1sJQtamBQUr5XrDsxGqbtWCVEfA13++v6vpnPnYVs5X
	mfokllAw2UfbAROX52G52Vm/0issm9ssoZAY8t05wcYtq8/C+hTg3AQdFO8KzYSqt5dvOGTFQlG
	uk+znLjnwfSRgT0fl5TSOnX2m3hPNmf4g7rE6mTSlFQfCVJEMCVxWIFbnHoMHGw6xa7LhNLkEhx
	jGq6zCvTFbNjdcD3y1L7z7sSj1f1MwiKbg==
X-Google-Smtp-Source: AGHT+IEypn72K2XDLMunXNz64L674R1qAE0jbL8OdemRX1WFc/rB6qj/zLgF+xCW8NIwgy+CMsESIg==
X-Received: by 2002:a05:600c:378f:b0:434:f335:83b with SMTP id 5b1f17b1804b1-4362aa155c1mr111751935e9.5.1734428446754;
        Tue, 17 Dec 2024 01:40:46 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ec46sm167475755e9.20.2024.12.17.01.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 01:40:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 17 Dec 2024 09:40:20 +0000
Subject: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734428445; l=3405;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=oGbadS/EXFOmnPlUbzd78fQ8Sa6oboYVtVmK/tk9ZNU=;
 b=o39r/a65k4kXSV5QfRaDOokAx5BK2B4HFYrhAv0oPz7TlgqFXptplibdlk3n/NcgfUf68gxSi
 1BS6mafZikSDarVm9MLWDNTdW21MMS5QWgqUCvz37F8c5DiFzt9IgE/
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add bindings for the Samsung Exynos Mailbox Controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/mailbox/google,gs101-mbox.yaml        | 79 ++++++++++++++++++++++
 include/dt-bindings/mailbox/google,gs101.h         | 14 ++++
 2 files changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
new file mode 100644
index 000000000000..bc7288923795
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/google,gs101-mbox.yaml#
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
+    const: google,gs101-mbox
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
+    description: |
+      <&phandle type channel>
+      phandle : label name of controller.
+      type    : channel type, doorbell or data-transfer.
+      channel : channel number.
+
+      Here is how a client can reference them:
+      mboxes = <&ap2apm_mailbox DOORBELL 2>;
+      mboxes = <&ap2apm_mailbox DATA 3>;
+    const: 2
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
+            compatible = "google,gs101-mbox";
+            reg = <0x17610000 0x1000>;
+            clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+            clock-names = "pclk";
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+            #mbox-cells = <2>;
+        };
+    };
diff --git a/include/dt-bindings/mailbox/google,gs101.h b/include/dt-bindings/mailbox/google,gs101.h
new file mode 100644
index 000000000000..7ff4fe669f9e
--- /dev/null
+++ b/include/dt-bindings/mailbox/google,gs101.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2024 Linaro Ltd.
+ *
+ * This header provides constants for the defined mailbox channel types.
+ */
+
+#ifndef _DT_BINDINGS_MAILBOX_GOOGLE_GS101_H
+#define _DT_BINDINGS_MAILBOX_GOOGLE_GS101_H
+
+#define DOORBELL	0
+#define DATA		1
+
+#endif /* _DT_BINDINGS_MAILBOX_GOOGLE_GS101_H */

-- 
2.47.1.613.gc27f4b7a9f-goog

