Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC651EF0B6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263975; cv=none; b=P+Dg2u58mtznIQaPA8P04q/5P3dpsO8bLKPktcaoc9kLsfIXtCZgUVmaNU6dBWyExuf+M+yS6C/dbWr4BvZbi/poDi8RHpbueOtUtHbtHh4xGJ7ulIOpP3KHKcEbnVGQ/s5SJMVpUwrj5Ubgg2mcjn2S5+vKBlbC9aL8XEgaM0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263975; c=relaxed/simple;
	bh=V7ZhEkTlDjAWx4+eB5Cx9IjkVRaezyIIl4x2rGpDimw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCcZVzE4xcwyVxhoJ7qR6MKkorGdmT14ui9dWBb8IS3wPHIzS8+wkCV/l1VruUmHOluLhrIYW8wKqZtXRIjgABdQHqYbtsWHWY4FPmRSwqC3Yf2IR6qbGS6ntLC+K3cFN0dxERFj/6HM17YngAq39u0ruL7769VEHyENaPwV1kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvInHoFH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvInHoFH"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2360984f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263972; x=1739868772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=yvInHoFHOXjhZpMT/M2R2mndKVRQv8t1pYFUaddzaWkr+J2USGgfIgO1EIXpnjIbfP
         QfBkOXAmxWezCwc/CuoCtrWzQKsq8nkYHFLhPF85/3XkhpyHzKcMxX4xfes8OMrUCtsL
         Q55Ab/6mi3l9gKIXdgwn9gfa6ndP5ivaT8hscku+l7ToBqn1RK2ohtMs+PyeIMqqXud0
         gbUbS+BnJ+sLKtqhB2yEVtPjbxmCsEHXbsVDwfZ4o1VkT7lxRMWHP2TgOHu7rQ/+k9sn
         JdYasqLHxPYaUOep85XIceuH657CvuUcQBpwewjbWCWpizzor/YkskZnslFIvRKFyPSi
         YbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263972; x=1739868772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=mATLQ3TgpfTRVzjdBIXcszWWj3lh6/H3Z/Q+3aalffP7RSBGbyG90mn8U05ORfmwhG
         pOgvgpvQHFZFYLukt16n2hjW6xSUh8yYlAfXdbB9kZle3eSMxT/S54lzZh6fHWdjSMzf
         Y/2dOnbK0k6JrK4ok2wBjzvSkCrnJvGv1HEb4Pakh8FvURC98K9uLjNfG6EfVoSvI/nm
         kHfoVae/a1JSc/LGpFlOU0I4oCe1zYPtr3gqUuh91u2hQxIPOXPMnRXhcy3PWejP9zYP
         FUq4DPTxzv25mFBr8IMJ3J3e1gCuAUQEVTEa9XX9u8y2aHo8Xs1Ab+mdxcambXBb3khL
         0rxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUghHBWrNnoPpj8vjSYkDUR/6Rt41teEaCtyZe9SRqPhrSntex7trKQSe0rZj2a0uadHEkXJaKuh1vE6JqX0F53tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNPrQ0gbW4LpWVHTFwrBHuDQdNfhCKWwYKJiTRA3g551Sb0cRb
	e8ScqdzoTdZSbTkZEacfH0U3JVJz59ruodJRtMKKTAcKNA8YVCIVFBo6bULDt7RmTdT7e5lEJdI
	rTds=
X-Gm-Gg: ASbGncvnIbA7Sw/oKc7aN9RXHkJXjYbaNK6k8TuS9bTDSg/kcilJ5zjO7kkwJhqBk4b
	G1AHHbwUjUKVZvXNO20J0AFrJAUSfoghonNX7ZVPFC37Zbe5oiQU8IyRbDdW602r9HFn+NNLwjF
	qotabl2n6z1iYdB9N6rc2N4elazAWG4a6biKS50EeRXfXhRHxb77aYQk6UYO89wS9M8QWMKaa3m
	EhJzppsWYDKLds+7NYOBFFm8kL6mhUPmw4d8CbIyLgTy9yk3BASSAj8slrd/k7eQuZrSc6/HReS
	GODROW1YJNt6YHkPs0av+nA+WFNfwX+wAMNC8hegED4t8lu+6DRKCLEM9DztEWRVt/0moEA=
X-Google-Smtp-Source: AGHT+IF875qkg/sDKrXAWcxZ4sn212gtMPj+TTXBNYYLBq3b1R8Z+ofg0sDdL9n5YnOrakhwVaiQ9g==
X-Received: by 2002:a05:6000:178d:b0:38d:e363:494b with SMTP id ffacd0b85a97d-38de439d6d6mr2000697f8f.8.1739263971823;
        Tue, 11 Feb 2025 00:52:51 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm207698225e9.10.2025.02.11.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:52:51 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 11 Feb 2025 08:52:49 +0000
Subject: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
In-Reply-To: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739263970; l=2122;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=V7ZhEkTlDjAWx4+eB5Cx9IjkVRaezyIIl4x2rGpDimw=;
 b=i8pShKS7nfAdoKT8vU6vjvJX+KtCpHt/WWMuPa02dDc92NnM8Q72v6dI7wIq9gAN/5/hL4Ivy
 lIma3r/spLVCeCPauQE097Vq3DCayDV67kgFs4pVsNWSWe05l3eUb8H
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

