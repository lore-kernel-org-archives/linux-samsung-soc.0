Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FC61EEA2A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Feb 2025 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942197; cv=none; b=pxUuc8mprmza+0gxVcclpC5EboQrI8snbmTKk4GxBuTcv1Jp59lj5LHa1UHzZSCp3P4aEdfoLLzxcWBfOt3a6tiSX5qvcRd47XeqW/2Pn27RDxVPk2t76HFd0qtlMWAIzBGbhJ72O1+hHsjMUNdmWBDM61V5a6piIxzNIhycqD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942197; c=relaxed/simple;
	bh=V7ZhEkTlDjAWx4+eB5Cx9IjkVRaezyIIl4x2rGpDimw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUIA8IrL81s6FIqsSTU1gTttV7WpTFa97XiJJfy0uMaCJDNXCjbdTgiW6p3PMAyjItRbpqli4n2hoS0OMLgcX3mcQj7B7Cq3r2it1Dt7PoqXNQoMBSAFJdx1pMaXzbzba5mXDOLZnU2L3oMLFBg/A5XTRD05G+ejmzX/Z1KByDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SjqWuqCI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SjqWuqCI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso13433135e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Feb 2025 07:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738942193; x=1739546993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=SjqWuqCI4g/5R8qxRzCfVKzUxZ9rZ61WqmRJLbaxM6J2CL78wCMyjlScHaNQ9DYCJC
         hAtQCTISxsg02JWnamAMeIolTrrf//tZjqtmADVeqaf78D2YfMh2MX/XfPMac7xGvDHe
         MQ01GukCyrSHRuOnZ5uFl9Y/bZqbbyGVSfsU0wPtguFx6Cj/YpIEuq42ifgdcg3U/P+b
         YukT3seFzKrTwrQSre6Amw4q9J78cTXgDJCCY+KuMXTzIixgpi2my7VJIZZFb8S2rw6x
         QwS826Tmbh00f93fn8pVkWOTmAneyF0mBf4ahY9/hVKzeLA/ZlqbIH8vEVn7uKvxAvZJ
         ylmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738942193; x=1739546993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=Mc/PhIRb9w5OYoMVpSj+qac+J83MtCwQDIJ0y1MCFPyj67sWjlBf3Xxv4gKscsRf8A
         4TIlXRg2YuP/qDXyOrOh5NHliLwcmeDH9quUFaw8YovYmako3iaDCPQeSHSi4yQIq3n8
         iCnzSVrwzX0y1JGFA6v2lrAxP3JXs5yN3A7YwbYVs99XsSXmY+1TOcXIfM/Mrjfh43aX
         fbGhJGSi5OpF1SjVtyGwytYR+LQHeNdg9rV7k229mLSJQ+D58lzslVScbjyorWtBcpSb
         Fys6J6Ji0KLqKCPXONBd4y9pqMiC48peRrlZbaaPgX3hhnvXyMqIMteQiwY48bqF3l8K
         xmag==
X-Forwarded-Encrypted: i=1; AJvYcCV+A+UKqoy5h3OaGeLIjLPC3mKKp1xm9XQrd0WxpBRnkv/qFYxqb16Pum0lJcY3oQ2GwWnoR35oYKosPWf4DsTCew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dKHCrtXekRQiNABelG3+1dsKK1s3dawv5ky199Fi4Qkw7Cd0
	6eejR0eaooglXE/U2WEjyAXRHq0wV09/mYJlmxzcplHoGNfe2D8/icb7JR/ZZYE=
X-Gm-Gg: ASbGncv1bipY1zdCD5/sKJ8t9hoR5qOPv/PyT8Q/Ep3Xy7R6CQa9d+avQo26e1BpBIN
	XPcrBvzSfpC9lixHug+h0iaVxdZLbQvIQVeANUxd1zdEJZmOC0jZhgdHg7vubnJ2AWFSOhMJEmA
	S9N4GnGJaVk0wa4QXV5YbMcVmJHlCMh/B+WcnujMwwEd+gzuVx964AbBC2serXh1EcEt3ZcbMwq
	Iu9KU+ikg3MNRnWoadnoMeKo9Oels8KMoGtvMLyNshOGKGALxWm8Q7wOlNqkorAIG8CmsLfpxz4
	hZLJuDcm1ul1eGk8T3w3kvLj5Xxv7G3JvBwzaKsuerPFuj+1sU3/cfOpYzs8BM5FADKdFrE=
X-Google-Smtp-Source: AGHT+IGeQisxWwVjKLpLxc81XidOEmaj/9PkpKcRmfg/FautVUd5O56htUIcsiEZRQHq7y6VAI6+bQ==
X-Received: by 2002:a05:600c:3c96:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-439255b81e1mr25888635e9.11.1738942193266;
        Fri, 07 Feb 2025 07:29:53 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm57141905e9.10.2025.02.07.07.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:29:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:29:47 +0000
Subject: [PATCH v7 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-v7-1-ffd7b2fb15ae@linaro.org>
References: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
In-Reply-To: <20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738942191; l=2122;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=V7ZhEkTlDjAWx4+eB5Cx9IjkVRaezyIIl4x2rGpDimw=;
 b=xPUvF+VVaql0+WFwyO78FZrctDRJ3K5bgzTZVoVvCOUptqjae9NCBxYAsf6FZ1nQ/oQMsb/BG
 TUGInsgGHopCIptyOe0/vC2gzHMsGe8LKcPAXQ0IasExUenWkpiR42j
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add bindings for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
new file mode 100644
index 000000000000..982cb8d62011
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/google,gs101-acpm-ipc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos ACPM mailbox protocol
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  ACPM (Alive Clock and Power Manager) is a firmware that operates on the
+  APM (Active Power Management) module that handles overall power management
+  activities. ACPM and masters regard each other as independent hardware
+  component and communicate with each other using mailbox messages and
+  shared memory.
+
+  This binding is intended to define the interface the firmware implementing
+  ACPM provides for OSPM in the device tree.
+
+properties:
+  compatible:
+    const: google,gs101-acpm-ipc
+
+  mboxes:
+    maxItems: 1
+
+  shmem:
+    description:
+      List of phandle pointing to the shared memory (SHM) area. The memory
+      contains channels configuration data and the TX/RX ring buffers that
+      are used for passing messages to/from the ACPM firmware.
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - shmem
+
+additionalProperties: false
+
+examples:
+  - |
+    power-management {
+        compatible = "google,gs101-acpm-ipc";
+        mboxes = <&ap2apm_mailbox>;
+        shmem = <&apm_sram>;
+    };

-- 
2.48.1.502.g6dc24dfdaf-goog

