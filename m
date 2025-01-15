Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CF083A14
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736950709; cv=none; b=HO0TkKz3F4QgYRTW79GPaMzmsqSFjWnAUv5NRSTkhd5BrqoNphljXr59i2P+WqKbb6zB9k0MUFPbBD/aozn60jNESMcMw63k5L1c5ucoYnz2R+86qMuITiW0ZtYD3C2ZulkeTLQdfeFiHhgwy/73k+sLzIkKwoCxjQQI/FqZB18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736950709; c=relaxed/simple;
	bh=5HGsUQ8DOjZ0Xsj5e9DwGxqdEHV2zqdEVfltYYG6Yao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZUjqGxGVzpLUqCasA5Vi2HR/09omp5XXvTEq7zY0dNh/Ufi208L2WtC7NujNv2kOKhr19meBEngp8+5dYtOJdiLkf3n1FsxHd+k2nqu2HHU2o0YX/FTsxYvqqXYQLmfjE4yPv5ep6A7t9gEXp5PzESnsnAHQSx+G0B3XpXXYQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qsTU7wrA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qsTU7wrA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436202dd730so48606985e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 06:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736950706; x=1737555506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a42DOBe1uqn7pmMlyPetZLEiqSZyshl+HGTpgvC7gGM=;
        b=qsTU7wrAwk/mzF7/fkd/4640lNChBGS6DK7qfysnFsmHwMGD/R+8NwDM+rHjYGArOm
         xB8tGDQrUgoda6OupgMD2iBq3v3nyNh1bQG3ldXy2N1jULt2mhytnyB9QxkbOJ02pb2k
         RGbBmNyaP9EkV/Egl6dXuyZ2G/01qY1VGrylWQU7kKG0ynkAJ5wCHJS7bnxa7qgWHo+n
         2W4DuVCLy9uM83Lm153WNiUQA5yQzmZjbbS04AedAolvVwUEbI1OjHG5Vr8m6CPMg3TO
         dXnU2cSCDJKdOx4I48gTd/64D7+yD8oNA3KUXWKqIrQA+jP9H4pP3aH3kOzu0z+8K4HV
         Uoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736950706; x=1737555506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a42DOBe1uqn7pmMlyPetZLEiqSZyshl+HGTpgvC7gGM=;
        b=xEHyzGWuZOzJxNZ8wiui3pjCwckvjEdMvHBVPMSFpXFsXe2GECJ0CVuhhKbpMxT34z
         UMnBdZZQy+qRw8RiDZlDS+Hw7072QJnqQTYSCl6idHKFo1Hb23fbIPS/7STYaQn6H5OZ
         XS3svu6mFXfpqe36xMNK5fDMnH6tQxny1GJ0mnxzSIU4xlzwsqR7aKbuMxX2ghpsp4XM
         d+P1EgiQweLWMWHu/rR2FHbYot5T+QLKaYv0e5LPDsjPUUMrGONFVDD/xjrhBK1rcoY7
         n0AfPpGhhqiyeOw2KMU2TE0KB2R8z+hbCqS6Bu/HcnVUAAt8tQt9rAJdBVwBxo7zcF2N
         PHAw==
X-Forwarded-Encrypted: i=1; AJvYcCUKBly4OuVmMIEE2hQXhWZ/nTSEJtqxXnAuEV7BUEbJIisCARCe06/Z8HvjhNg1V91ASoOWQ832aq4bJjrKzIN+Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNdjHkx6BJQwrP5CFB+Buqp8ZV6W+L8nnWs7vV3G2GvrMjiw+g
	jpBxrYEnZMT3H3t97G7AQYUiY/wXexKSaXvD8CNT58AXbsi6DkEzxszbeSRwees=
X-Gm-Gg: ASbGncv+5Kd+5DwLJrdGA8A9NLFecEEW4GUc7JBLZmpcDNY5Es9W5SUiFbFYnKqHLKI
	ZgLozwMFx2mPTw1rj8LUYWZblPD0/iH0/o5AKcGYNBdCWJE5rPqPySIgUTYRCE2A0Do7l0vvJu2
	eC+a9GSV19kV6d9BoE35izNqzTGEdfpCi87SVtYylkxeMdwEskgfiTid67f7Z5IalFSxdg6LuRZ
	wcZt6IAYPNfjdrXt7bz6pfnmMZ3E74sJtXJq1tRqE5vs+/vU/cCsZ7BG83uHzizK7YWRmtrmg4q
	S4H+26spECWNbbmFN7bEgLXcUrTgnsGvajwe
X-Google-Smtp-Source: AGHT+IEhSosZqUJXLG8olJ1UCoWQCrVDewzF96mOttUN5/GBxHCh4eNVf1fIYgFOhcK75geW+AWZjQ==
X-Received: by 2002:a05:600c:3ca0:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-436e270620emr239929715e9.27.1736950705682;
        Wed, 15 Jan 2025 06:18:25 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74d8e06sm25184555e9.31.2025.01.15.06.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:18:25 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 15 Jan 2025 14:18:14 +0000
Subject: [PATCH v7 1/3] dt-bindings: mailbox: add google,gs101-mbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-acpm-v4-upstream-mbox-v7-1-948e09fcb5f2@linaro.org>
References: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
In-Reply-To: <20250115-acpm-v4-upstream-mbox-v7-0-948e09fcb5f2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736950703; l=2400;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=5HGsUQ8DOjZ0Xsj5e9DwGxqdEHV2zqdEVfltYYG6Yao=;
 b=BWb4jQeZFy4QCExxs2qrhgDBCcW6TGsPvQ8HLUII0HvZxdebpZmFiFftHoddgvs0g1T5x+jqg
 GKCe8+3WaMmDEe+Ngs8gIWHsrY0JDO5cfxTtlzU4ww26Xh7b2vudpOA
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add bindings for the Samsung Exynos Mailbox Controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/mailbox/google,gs101-mbox.yaml        | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
new file mode 100644
index 000000000000..e249db4c1fbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -0,0 +1,69 @@
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
+description:
+  The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
+  bits for hardware interrupt generation and a shared register for passing
+  mailbox messages. When the controller is used by the ACPM interface
+  the shared register is ignored and the mailbox controller acts as a doorbell.
+  The controller just raises the interrupt to the firmware after the
+  ACPM interface has written the message to SRAM.
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

-- 
2.48.0.rc2.279.g1de40edade-goog

