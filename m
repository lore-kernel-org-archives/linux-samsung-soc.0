Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8D923F40A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739451920; cv=none; b=sAJ98sPv5PjreNuyYNPFXcEN6gS8j4RxDwEuoovt8jNKTXO2PaVAPUdNVUXUnRaH0rxjXKNvcDjdbmKZ/Nb33SCmA6K5/s7amMz3ylRmnuZQMJMweY6ual1AJkXSD4Aj4irJQG0Bj1WqDt4LKITt8KQqo4hhjkMtfNbXb+Xlx04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739451920; c=relaxed/simple;
	bh=ygfKgwFm02MPjCPY1HixRGigRORpbX7fhEuE+FfQvu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmxS+CRB5BznOUmYkVPgyhojCwic7DOkGgIwEoM8UepvbInTXf+o1S71ctPrscyqqupRwBUZy5gxA8uE7Ebq06hKizjR9zr5cB2Kb6008vr97DR1yea+tquqfQ0RHxqEy7/WRZSpxLlb7D7IvOlUO8Ls8wBRskuVOiJit+H2iuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x9I52c7a; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x9I52c7a"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4395a06cf43so5423615e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 05:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739451916; x=1740056716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDZLTKxxQDiElbpYU/xxls41XiMypbn1c9DwAMmHY20=;
        b=x9I52c7aXZhpVAfUTJB130E/cUxCl8VYVsarP/2SoMQLzqN4qIzjxKPhZm6JUjmzpv
         6BoupP2jeBN9726dMQ85qexfHs7SgMEs3f2wMfUtcAeZmOy3wz1mLVz0jZsR4mcJ/kUP
         F7iQou6hT076RTlu+YPJjEuk6r8k6K78HtKdp5J8mx2jdq7K74HEcg7YntGVeQtHpE5M
         ZSLyJAWboSVakFIRC9VCY7Vb+5KQqIeiKP/NYxUP5YF6l+fV4NrGehW6XUOzDMnBKYir
         gkskuJuZXcUWhudm68RGIIW3geTE0UCdapmSEL6D5nZP1sDz5ix5J0vXJ5sR9DPI4rsw
         MAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739451916; x=1740056716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDZLTKxxQDiElbpYU/xxls41XiMypbn1c9DwAMmHY20=;
        b=cSN7UkYSDMWfYBPZ0+30Rk3e7gqsW9xVkVGAnwMT0BoOhUtYNF1+QeFK3xSKJ6Oetb
         6Q76xOVketv+z6WA3AQOLgppHgAMB4hFC6sltF1dHrnTfLMl2vJV55DMGTgVvtYAHtWp
         zPoF2p57AiNtZdRsbT7RX57jmL5Ap4GQb9UXm/559h2K1X4awOWojgptLWl75q1VQYwm
         ZY/o6Kh1I1SNKlFQjoklFk9txCQqwpVLrvvxEYiblfBhnJBWWuSwU1Zp85je06v5LEAI
         7aF0l9edHCR7pxeSPuwM6NZDnXTaO8FHxFWZN/GC9Q0VwfrtPsgoXd0vjWfPYrVIYTn2
         4TRg==
X-Forwarded-Encrypted: i=1; AJvYcCXMQl4dAfzX+4n8gOwiNxUKay3unIFfqt+7GUIgzUzaP9HmKDt5AWgSi87cnYTGW1764NsbOUUKqCHM8i3yNUw+fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyixtzr0qEykrU4+fu7r41BxLG3e9r4V6ipznlBocNaThos5tMw
	vZwGavb9yuGGqEbJnXBjHnwtSgSNS9htmrtAmjZ/r4eFk/rknUW5d4sXoFaGJ2c=
X-Gm-Gg: ASbGncuMeB9QDQKn2AbEuH3iiHCIDI3LJCiEp+s7Kh0RSuhh6pllgZu8anPNCPw6rO1
	9teJ5HyjvZ/j2r5J1T2wi+vL3/H2sa9IR0/NwMi17KaYucUvvWSpDYkXpZx6auPeHc5HD+0V84I
	GcUjuNqZ1zS2Hc6f5Ir/nbIm9WJZKveEzhRNbBR1uHFKzI8It6YDTdeOEIFRi8bDpPlHV2r7Z98
	FWOdtNO3Ax3OXWNEFMtDJg9c7kR6Wwf5UIRZ23S/yS0lc2WmO9Fu6XbY6KRNUG/lSnoXgf/A6i7
	zsZreUiL/HkNidkoUO7Q3uDLYsrTfvUkCdntC9qW6LyZfzW9I6aE++pKP4YsQeGvPs0YoKI=
X-Google-Smtp-Source: AGHT+IE5WnMtblBw9bIRTim3qtt24a1KeYp9jziJc9822H6YJkG6wfJIr/g5tZ1Z/h2vjMhWRm4IyA==
X-Received: by 2002:a05:600c:2309:b0:439:59cf:8e0a with SMTP id 5b1f17b1804b1-439601a11afmr36920925e9.24.1739451916481;
        Thu, 13 Feb 2025 05:05:16 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961884251sm17004025e9.31.2025.02.13.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:05:16 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 13 Feb 2025 13:05:14 +0000
Subject: [PATCH v9 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-gs101-acpm-v9-1-8b0281b93c8b@linaro.org>
References: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
In-Reply-To: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739451915; l=2127;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ygfKgwFm02MPjCPY1HixRGigRORpbX7fhEuE+FfQvu4=;
 b=p+BdejU3bp4Gn9o8URtHOIITqvqQBk9qAN4b77rnytls72rwCC5qbe+5PGAN7kGVTb6VHNFUE
 JOS9Y0RwVIRByzxT/6brrSn8HdcGJjC2twSMQD/8ol6iU9XphUUIK2d
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
index 000000000000..2cdad1bbae73
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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

