Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B021638D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705183; cv=none; b=bp0uv6wqCEsE0zhOGnIfhncg24OX5k8cSQ5/kp4sXKAKPB227el/TL+Ir/gCyyDMPqSsYNSBnaKR8ybqbfnGEWVGEIQwOReZJ2E/B94G0wI5R2i/5I28+pBDoexEDHszJ2yoBEWgeWPStC2R3bTux+xyZ+bctLaHwvWCuutuQhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705183; c=relaxed/simple;
	bh=qcWsBmv/JznSww/eNk8qMIS4BDY5s6ZxLb3tuX2AP68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJLfs+nT4x20vtLSvVERK+ysjXspVjdByU7CMlryzs3XfAF3QJEScImEZz7aYy7V6ZiV2HjlT6CmJsIDtCkbcQZ9ncxB9qcX/z/kWwwC4+HUlVVzfBEtF83NQOo+h+9bzjEYwoCjdhL55bJ+Pawqwc3073gJq2uq299niBHmqu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fdChwxXb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fdChwxXb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361c705434so14518815e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 06:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705178; x=1735309978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2r054HjWrz6SG4prpVPiiYe71n6RO8+qtINI2M8+4Y=;
        b=fdChwxXbTA4966l1wYAEjbn8qUKoAzzvT16IAGPPUcM8WcVTpylvCD7LE14jvXQxtE
         mLahe6+V7/rOap2Ux4xGKeZ+uLwExkIrxIYjkrHcCwxnrW3Ufrma5hciDXDbwQtr88jv
         PdAn3Lhuetx9vv35jZn8DkQfK/sBeCk9J4Gne4XthXJKi7C8/YzTFBVYSk3YrLWxy8CX
         mmMidLtqlO8PxmP+kbUEva4em3C43o5nVHtOpBJuatY1vU+5poa8H5FYdwICcSpzp+4z
         pPTMEY2NCKJ/c/qtUfPeOoFBBZHhkplQ91S492uogWq0wAUEzSQnQCNq0g6y9q3+FkdF
         IxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705178; x=1735309978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2r054HjWrz6SG4prpVPiiYe71n6RO8+qtINI2M8+4Y=;
        b=DPqLWMJrCwAUnlFPfNcvJdqjVN9CmlRwzslolFORxxs9KnGiX6+YzCAD6Y3CfhZQA5
         qo9vjOx8xZCa4DCMCLb3lvKJdN3JJqBUXfr35hc0tijGo4si/A52zY8eKoC1H0FTaiZ6
         fahMXprrVNIyXXH5TzhbvX3ElUoh0TCR2fWxzuV+rW7ffOPyJU6Vv3wk3lXRCy4S+L08
         RpRUrCZ7SmiQwR4P8ng0k5+vetBBRMNNj4UDM2YV7/n1kWebtxFSIl6ZgHRQxGD1mmCL
         i6T1pLvsYMIzcgOl9tDDlp6zjAKLMzr6+7OWBC/YcKzkMaeTQGeRXLiSJj7aBBgh6v+E
         /quQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGcXjYebWUEh1BmlmQo6n8r/a6MiHtJbx+H+FKBgl4ut5uVS/k6q/B8Fjdu2TrWKdJp775sOX1D3jZTM09kCEchA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8k32cRSiEiCVNsISbUQjtLAIUuGbZXRyCmbY0gi8NwBMlxId3
	RQQAxw9aaWc5CoI7+G2UuM67Fo5F+xydARxUXGSCO98DhlQUebuH4NmCjhKHZ7o=
X-Gm-Gg: ASbGncvRN1XD5Y8//iSevC9LZxzpEa1n06CreBWLSauYGwi+OCAm9PAPMhfhp6HzCTT
	Fn5W9nPLf+/2Qg5WsQfqcKu0dYHodbPXI8eGFIhmCeaM/7c7mmDMYbzep3lTYanhXa8jTKXEMl4
	8gZBqe2ComWdT7Qy83F9eVJ1XTelvztihnA7WeO9XcZXkCY7qtiI6soTW9pqaxE6vkgvlNBg+xD
	rk/ORcY3YGdvPi6HOadoBuvxbhBhRq9guY8Tts5lQVGv9I3IYzPOUM1axSOe99XZyUuX/QHGR5j
	Gwoox99LOPfBNRDoZ5+l5B+UiCPaRq0OryNb
X-Google-Smtp-Source: AGHT+IFWUL89s9MPTN9RXW3xpCsH1N6q7qhnMGREc6l90xzRqvJXMu91tZEs3D1ocnJ+h0j+U7pNvA==
X-Received: by 2002:a5d:64e5:0:b0:385:fb56:fb73 with SMTP id ffacd0b85a97d-38a221f9bfcmr3230824f8f.15.1734705178353;
        Fri, 20 Dec 2024 06:32:58 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829235sm4140321f8f.15.2024.12.20.06.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:32:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 14:32:51 +0000
Subject: [PATCH v5 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-gs101-acpm-v5-1-4f26b7fb3f5f@linaro.org>
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
In-Reply-To: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705176; l=2055;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qcWsBmv/JznSww/eNk8qMIS4BDY5s6ZxLb3tuX2AP68=;
 b=k6t57kS4DnX5YnkmyuPdrCI2QT0B4i9671oVZXLt08rpfaAoStKPubIknxG27HXNIJcuocPwW
 r5wzeZ3Vv2kCHbe66cWirfqLNqM9gGXrPXXr5KLwnP4ewEGFR4M+tUN
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add bindings for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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
2.47.1.613.gc27f4b7a9f-goog

