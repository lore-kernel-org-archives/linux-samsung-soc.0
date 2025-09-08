Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C02330AD0B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Sep 2025 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337184; cv=none; b=oxvRcsMAjVuKBrpw7u4dje82EkWQ7cuZ/cVOnmF5kxN9Q+xzXHkbofW4ZfoIfmtOLk70HZBaor9E/5W0PFb2NfhCOgtEH5hmoztbPSUIzedZDBm5NxvhpoXjA33mE1cEfxLxrKGbokkKY53pL3RLb9fLvdI5s0CRz8TlhGOOOtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337184; c=relaxed/simple;
	bh=d16ATURJXaVteyF3Qps5PT9fGye6OfeD6faAj7tSV9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VcxYhLo5Grf5lWOELy16ZMguSDRPC/Djnpwr+9QrLbKYuH3qmHmkZ3GPZnhofkoNpzaIsFg+8PXOCkCDmrCQhB5zJZ1rKKTBTc+UIuxtxVeSyKjm6H3FQE48pogWFrFbmLRS4RtpxdnoQ35RMSkPLkrcx4KhP5xr/gMV4YiVWiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vm0Xrrt0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vm0Xrrt0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45de287cc11so6436065e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2025 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337180; x=1757941980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dqFZom65YcEQkXmUqTDd4+m17RatDWu3bIoNbEjE50=;
        b=Vm0Xrrt0lJarz765OySh/xBjJzRY2eLuKX7ei+L2VPuXjabjjP27pfRZ/UL/eZ92/k
         GMco9CXCLjalhXpBzBgPZjQHo5KwicvsxL0lbsmQ3sS0+fK6UFuQBNnoooFLWGGpM6SN
         TMVzzfqaE1tAjzC+8RG9iNcpyt++inF5fl7bJ1VPIRWb1VoZyH7xrKkKjfI98hnw9IYQ
         QdM9JAz3XZtl8bDBiBBbwoWpj/fUpipbZ4e3Hz53AfDnuKQF5zT7/ejNAgZLYGUXIUk4
         OPZ6vAL0Da6pNT1f8UnP6ha3i7LSucYR2Bms713h4RYkGQlMufbQdhHdElh6oXF+0RvV
         F2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337180; x=1757941980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dqFZom65YcEQkXmUqTDd4+m17RatDWu3bIoNbEjE50=;
        b=XoXO7/ECWC5uTe5Ntq4bMqbbUomIOudIJ/5u112WQtNve8ow58wgVW/CcUiL7eQ3+f
         FFPKw0Smlbg0BynPcW9l3JnJpwlqoupqiAR7ExJGKo1JyNWXX3EtjmEz1PnDjJl/W6XZ
         LfYsfRfNuZcV8l/WNt0J6jcR193KPjCIg+Rm74q5HG9wS1eio/OwOB9dkB8FoTgkwitn
         j3WYMOTgWQshsvSpR0lb4Pvpa+JBcal8VB2AO7v1sbbA5p+rKBxWilIzcaUTEcEzxRHE
         fakMToxnZTkGrGxLWqtSBSf25s8C1jvWv/TqZ8dHm5L8Y7aZvlazd7HEdIVWRDWjxnUS
         DiZw==
X-Forwarded-Encrypted: i=1; AJvYcCWqfyBpVEpZakII/zaPIEEC7fp3iS2RRq/8K1VMA5wqpYGNQ2BkA1vhAR/9qD47fv+M6ipW42BqsYOyKcTjOiKsrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgJhowwR6pkVKJZSYt+9OTwWjlh+n8hMsE+d6dakz/Ge0xcmcL
	n+1Vs234jeFcFzsohgeJnA7grJpRZikBYjq0KsVzM8wi9NpYRa6e+tT0IsASUvl3el9krMTmN16
	ht4Uo
X-Gm-Gg: ASbGnctBEXLKvOCMNeOjClkr6Kf+sRF3pWJgLR2+sHRTlwobrrkL6PnsrdWyhq4Eqnt
	XYufEu9ofg/SIi9pNVuT9yFWbPLc0D2TO4eXRUsSes313nlConP069l5Mw2KnOLg8uRdDuJzuDg
	SGRhgkTCsLOZwqPtNl7tBOu73KZJ3cYgScyWnhOaTBI/qyEuyPrJCGOR65wldl7gErfQfH7OS1D
	5s7gahV84zlQAyyRiu1JvpaAVg/Joaq5eBEoWP2E4bVPBpx7HPLJljfz4MOrpOrmtnzySWYsDR/
	UHqgGZF9+Yi6kXFz5cbksTtoD8gq0S+tqe4H659SPEGsqsVr/1Hmy2n0Hd9KaG8IbXCFNECW6Mf
	c/95MtfmoS9AV9aQkAUwquYtNMkjbhPdCtg5YCpo43FdKh8MZ9oZkbMdW32/pxCRP0Tr9FJDkE1
	gyMQ==
X-Google-Smtp-Source: AGHT+IE7mUMhuSHckm+BOVWYPNlPL88vc/oJXt6OY3cNSKgPrAVUivteuSdEdtgHuOKT9kbXSWZ9Uw==
X-Received: by 2002:a05:6000:400c:b0:3dc:2f0e:5e2e with SMTP id ffacd0b85a97d-3e628cd5aecmr6211828f8f.13.1757337179849;
        Mon, 08 Sep 2025 06:12:59 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:12:59 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 13:12:42 +0000
Subject: [PATCH v4 1/5] dt-bindings: firmware: google,gs101-acpm-ipc: add
 ACPM clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-clk-v4-1-633350c0c0b1@linaro.org>
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=3056;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=d16ATURJXaVteyF3Qps5PT9fGye6OfeD6faAj7tSV9U=;
 b=suYt9exuHS5pnrnU/6Dl3RDrK+E1WIxhvGPdwwQ3FPHy9Br2xJnfDunovLjDzC9kuHFmAcIiL
 C/CqsWwn9aPBC/3KL2PvOOXAQkSEBn7TCUXkTH/9eEvTIYcZoUOWhDe
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The firmware exposes clocks that can be controlled via the
Alive Clock and Power Manager (ACPM) interface.

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference its
clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 11 +++++++++
 include/dt-bindings/clock/google,gs101-acpm.h      | 26 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..d3bca6088d128485618bb2b538ed8596b4ba14f0 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -24,6 +24,15 @@ properties:
   compatible:
     const: google,gs101-acpm-ipc
 
+  "#clock-cells":
+    const: 1
+    description:
+      Clocks that are variable and index based. These clocks don't provide
+      an entire range of values between the limits but only discrete points
+      within the range. The firmware also manages the voltage scaling
+      appropriately with the clock scaling. The argument is the ID of the
+      clock contained by the firmware messages.
+
   mboxes:
     maxItems: 1
 
@@ -45,6 +54,7 @@ properties:
 
 required:
   - compatible
+  - "#clock-cells"
   - mboxes
   - shmem
 
@@ -56,6 +66,7 @@ examples:
 
     power-management {
         compatible = "google,gs101-acpm-ipc";
+        #clock-cells = <1>;
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
diff --git a/include/dt-bindings/clock/google,gs101-acpm.h b/include/dt-bindings/clock/google,gs101-acpm.h
new file mode 100644
index 0000000000000000000000000000000000000000..e2ba89e09fa6209f7c81f554dd511b2619009e5b
--- /dev/null
+++ b/include/dt-bindings/clock/google,gs101-acpm.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Device Tree binding constants for Google gs101 ACPM clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H
+#define _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H
+
+#define GS101_CLK_ACPM_DVFS_MIF				0
+#define GS101_CLK_ACPM_DVFS_INT				1
+#define GS101_CLK_ACPM_DVFS_CPUCL0			2
+#define GS101_CLK_ACPM_DVFS_CPUCL1			3
+#define GS101_CLK_ACPM_DVFS_CPUCL2			4
+#define GS101_CLK_ACPM_DVFS_G3D				5
+#define GS101_CLK_ACPM_DVFS_G3DL2			6
+#define GS101_CLK_ACPM_DVFS_TPU				7
+#define GS101_CLK_ACPM_DVFS_INTCAM			8
+#define GS101_CLK_ACPM_DVFS_TNR				9
+#define GS101_CLK_ACPM_DVFS_CAM				10
+#define GS101_CLK_ACPM_DVFS_MFC				11
+#define GS101_CLK_ACPM_DVFS_DISP			12
+#define GS101_CLK_ACPM_DVFS_BO				13
+
+#endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_ACPM_H */

-- 
2.51.0.355.g5224444f11-goog

