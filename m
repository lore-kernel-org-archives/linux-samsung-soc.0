Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4611DE2D4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737036063; cv=none; b=XtixBq9zmjqgoO9VGE0MU4WKb9Ck1NVE7PNKMh4W9r9qJV5Q54UkWSTyHtXZpUnW/WYwJg0bipAUW5nT8ztOCHDqV78KqwtDGzQamcdBQdGFbWR2NKgLoB+Tq1PhMOG4lxac/GF3rBM5ybkQyCda6OmI7SCxesJlnT5cuhbyk/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737036063; c=relaxed/simple;
	bh=uQ6Bg5/6V5Dq9OSmE8te0C3SbDjnup2vFnjKFigEBUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pkn18ZlyIs2lwB9TPmw6CfGUosxKX9dkYSf1X+8CTQVNQTO7SdlUP4iwkp7P4Qwnex5Xtz3DmoCzlXD5xljPYnY7Qi6qalN3SnQ0xHWYFTYi+VQpV8wKaHrgd44gkqPM/nXVtEFEuXE4DXzeRYwzHQnLgsoSjzjX3qW/D9nAtFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tsw/gp0Q; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tsw/gp0Q"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso877939f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 06:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737036060; x=1737640860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIm25PmeAZOAYMgQVdnUOumJT9enCa4+yPDMgOnkhGU=;
        b=Tsw/gp0Qxab3KqB7imCaJZ8N00bJ4gTrOLrMZ9ZVlmrSz5Uo+mnjONfA5xeSOjV41J
         uqR42XydkFcP7l+x0YCYaKgV3YuVyr9SU/ebVfoi9V3e52E9hgXquTs/9fwKbkf3eptK
         3jXNDd/JdrFx+vUGxgO0bSYH/tjUcSRZajTSbfCQYvW9sytvxXM8XLsB0bk0fmrdUiK+
         CyE9S3UcnvKWr1oQBx/tLY6cRVZbfT+XB86UMFQLtCP3ireDVbOntc5+OfF2p8FcQm2V
         g48+8qV6U+EqxTrM61byRuCcuIhegszS708MfPXbspG5C9A2dFNyssodPXVKJ/suU37q
         K0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036060; x=1737640860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIm25PmeAZOAYMgQVdnUOumJT9enCa4+yPDMgOnkhGU=;
        b=iUZX2HVTB5G8OantYDa74bwLQjQy5suf+OQMyN3E3FYeZdBoCxctFeviu48s4upB98
         kMdVWi9dygntpdWfMV3XH5OpJm7W2TCrIF9X0IzQ+njwZZs+x/u77TrK//FI4XwAWNsf
         Ws4AkO8KOfTTZZFBKYqclSscU6aFJ9a2G83FrBH2VAmra1S8EQKAYsSQJR/vQTQ10NHu
         rPZcuP2zykdS6EoAOYTFF1PCAMYKfobSktJSzm0ILCajJn3eDz8UmTW5x30i1QZlg9Iz
         Rm32HKNXdOWy3xx2IwmuR3WdRI1y4fF2J4fdrqcqdzsly3vskrVvkWGvNHmAaRxC4Wuk
         1OXA==
X-Forwarded-Encrypted: i=1; AJvYcCXqnFMnBuAyZ029/WIvYY6kt9YZTMKvTn8QKt4slG6WaCVYtqmrhg8BkiboaGBiHDT3FOdRLTGIpEeZ5mrtl/9hyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/KSuMD+ohHmvil/flcWNVyDIgRHJqlPIgPkEV0rMa6gpHwWP
	oh//zhmubSFXp4T6ZaKfGoQjK7n8lUmnUVySBO7m3LnwiSYF+oCqRVD3G69N/NI=
X-Gm-Gg: ASbGncv5kazP2m+fPdJ+cuw/k39BXE4+BM61hIGb+/0u9ry0jkpG5j+Bm2S26IyMCVB
	xwdI2HKkCRxoUA1PdI8a8O1dSDAOAMX3fHNm7RuEDmEX5nCYU9WU7y5a1XbCAIOc+ZRY1Hlq/wU
	SZ0nDtS21W6084MVj95j4cNo/wyU+BDN0VPfBmAhYU8OaP/MuRSzi9k+sHne9DtIfmVXUFPlIMv
	vw39+Kx+pAWRU/497lbaexA+QT0zIHplJFZ4aNGMfEmwzSjZgr45N9cjC2GLpQossqe7kq36aLX
	WIGZ7m2V2V1al5KgG/DVwqJQMVaok9nMpHK/
X-Google-Smtp-Source: AGHT+IEO3mG+Bm83EMpGNeFN/Ai638KiKI6Wq7PleUU2fAOUa9hDQU/99f71IsakTNgZI5RVY5hkFA==
X-Received: by 2002:a05:6000:2a9:b0:386:43c9:3ac2 with SMTP id ffacd0b85a97d-38a87305311mr18559964f8f.15.1737036058578;
        Thu, 16 Jan 2025 06:00:58 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1f2esm20608846f8f.98.2025.01.16.06.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:00:58 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 16 Jan 2025 14:00:47 +0000
Subject: [PATCH v6 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-gs101-acpm-v6-1-e3a2e1a3007c@linaro.org>
References: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
In-Reply-To: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737036057; l=2126;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=uQ6Bg5/6V5Dq9OSmE8te0C3SbDjnup2vFnjKFigEBUI=;
 b=KG6sUTyaRCehZTlKyZ7MYQQEeX/4uKyAT101iEiiV+mspjeG0iwJV4erWBMVMQCn4N+DybEF7
 1b9hgLyK7UGDr/gH9I/c9e50PHvhzMtbRlCDfuilda7lqymPFRmG+S1
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
2.48.0.rc2.279.g1de40edade-goog

