Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF3216392
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702604; cv=none; b=YDbg88RM/HaxOz8yf1TeBrGPtl+Y6QumUlZ8rPwaP/Ms8nKKCfky4JBB7Yzg+JHvUXJtzDMGTkPRqzHKJ3ZYvPr9cY5Pu6Bc5UCwBjM2oPXICGj3Evpohh+E1SOJ6I65Meh8XgKCxU/jnMoYsW6XLpiA8j8G9ePn7tftTibm6xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702604; c=relaxed/simple;
	bh=gc/x/vd/iTT6DgRuhTHKKXPn1qQVX3+uctKpzIwRy8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sr8ARu9Jqur7cfhzEBJbsqloc/tlvEbQZQFSyK3ieM6TsF5/jZ3h/wFm7ucUE79Q03qOuEXG0EvQSRew9f+ONceNl32BtFc4bhELcPb9Q2HCgmLCE+Kn0pqm+WBd4o5/J9Ge8XEuFABGTALdDygF5OrYJxluwvkKuRWqk0kBrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qvwji8Gq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qvwji8Gq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso14898515e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 05:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702601; x=1735307401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Drrp/bM071Dp74jG1eEsU28h5Inku9vU1l6IcVuKHXY=;
        b=Qvwji8GqF3WohjUIVxGklkmlYPawplJY/2wP9EsiOkTpwaijr+//ZVU8ltlF7B3wU9
         fUaUEGQfY788vSWOm3yoXV4QNtwm9uMbvUifQ/k95+8DHlXbBrXgmGyN5ICfqorGszKp
         SK/bQdXqpj8bD46WRLPDmnGoRaBhuN70RPGengu9xLcgdlDYPBbV9ze9EnobNT1WWtBn
         R0hWJiZZe98PCuldv1qS0mdES8zR136wQZ3k3S0cd2pxCC/oDr1uZmhCPsd/hj5BVIW8
         69eDMHTcjEydsoytHP+3YBBAOPPRkDv8/l39ZV/dGWHPPdad1WXZwNlVBZt8uIRFPGy0
         nEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702601; x=1735307401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Drrp/bM071Dp74jG1eEsU28h5Inku9vU1l6IcVuKHXY=;
        b=Ho3yGCJoRar24mjKWJUaMIonLFQIwZ3r8gy6u+fGjaOtvHp1DplNQtH4oFU3zPpuQW
         v++kne5AuZro1QfVBDmea0tSrSg6/Ve3O3CfdBeIkWwVOW7KooXVpdB37wIvS3zBRbmc
         oEeCwubF80Sb2rn1hUBpt1GzRd2MTKhhfq7anKOqKj+pmE4SLTSJ4WTvJ0b9VPJCW0XY
         AYto9MQ81o5sJf7EU/5eO5h24i0d69KpjliKfa6zD2bHvRLEoNtDea4K8Sz5qlchGTCF
         HDqWWnUO3CsgExAJ6eAXZbWB+nP6TY36hIwu/Jna/j+YT1amuEZdiEoMtucd8l/egFK3
         kxPA==
X-Forwarded-Encrypted: i=1; AJvYcCXQopcJg9hSfE6hhwoUq+3mHd9khrhiZYdwu18CS4X/hOyvogKsD/TitegnVkMaWG51d/IzDEC2LP+IV/+O2ml1eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDnqulnLd7HJKgOzjqTnaByApZqQMQs2Nc+uclZijk8cU3yg9K
	mkOWBEb6tW6P8d5KGH1miQu2BDexx+vHZ7qhSFy2OF/Ax4mUVatZdt9551E8A6vOeG5Qax8Y/Ph
	hUL4=
X-Gm-Gg: ASbGncuEynv00dg+mlS7qT/5nrm/dyVBOIzZaHDiIl5BE0W/jdvDvlPbnpb+IDmOqBc
	ztqedubuTEF8TtgZE3Ilrrt7GPeY1N5LvPDD13K7toHoDWe1/73fZ8uhE6cJTsVUPmQHerXcwNK
	s190bBW0aybklmIHpnwvhnANEWbNRIcgWXhpOs98CK+AF2WzvY9yMkU0yYna8W8ucs7C5y6FHkn
	xX2iXsLFUjR0+N3nDA1pqVBRIZUXSodAsWffjDC6PFzdoDiBNsLxntgI5tzCNDWsdY4KDN6+kEW
	kNc4WgmwKNrb+EImbUPwPYMIcu74l2h0xzKQ
X-Google-Smtp-Source: AGHT+IGmLqoezR1dy/0yCfVQQLVCWAofOQ6KwjPi9F1bHXgcS8BNdXaZNl7LSVDsp8VtWoa4v/CqjA==
X-Received: by 2002:a05:600c:1c91:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-43668b5e085mr23276095e9.26.1734702601113;
        Fri, 20 Dec 2024 05:50:01 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:50:00 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 13:49:57 +0000
Subject: [PATCH v6 2/5] dt-bindings: mailbox: add google,gs101-mbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-2-a6942806e52a@linaro.org>
References: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
In-Reply-To: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=3101;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gc/x/vd/iTT6DgRuhTHKKXPn1qQVX3+uctKpzIwRy8k=;
 b=1yqD4Mr6+HTppBrswLA85XgGW1DxBWk3OZasij4CNC75DdzHxr/YW9Uc8Rmqtjk0KoCQpB3uz
 qEW29wjIKGVDt2tWSzFxK7GDD7pOdikK2I0UV7O+C4Hcq7ipm9gl7Eb
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add bindings for the Samsung Exynos Mailbox Controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/mailbox/google,gs101-mbox.yaml        | 70 ++++++++++++++++++++++
 include/dt-bindings/mailbox/google,gs101.h         | 14 +++++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
new file mode 100644
index 000000000000..a1fbc3b2b9de
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -0,0 +1,70 @@
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
+  The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
+  bits for hardware interrupt generation and a shared register for passing
+  mailbox messages. When the controller is used by the ACPM protocol the shared
+  register is ignored and the mailbox controller acts as a doorbell.
+  The controller just raises the interrupt to the firmware after the
+  ACPM protocol has written the message to SRAM.
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
+    const: 0
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
+            #mbox-cells = <0>;
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

