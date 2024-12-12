Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D222206A5
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018401; cv=none; b=bNX3c+iKGX9T/FuztGfC+V3gocMkJSJq+Mpg7pF7SwjvwLGs1ULR0CA8pBpjNHrj4KUYTgvNFgTcBQSV4puVW7NWl8eOAwPJMxF47wBfl/Ygj9wug65twAEdJQB5kdtlt2trFp/WjqSU3yzhYjne3fhBK8OhaDkQnZrATvDnkkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018401; c=relaxed/simple;
	bh=cEhVpbbgbLN/il4wFzhz4s4fTLiguDqzZ1YIvysOh58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kh1mlaYKBvvuhk95I39rUAW0T/wjzpX8CecNWoZkKd99AKt5kBOTh4rH3SfhN/L3xHU9nKpKctSZDs8umpBbTfx0IzC6X0dnbLAKRAZ50TBil+aGPwJOiBOj5lo53D9+nSSp4TnbPLdG++O+s0qnRN+LAIVA9m9Z4bnRIeRvnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jM/yX69W; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jM/yX69W"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso8259005e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734018398; x=1734623198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WsKt5owuBinbsPCptNpyMgMvfYh26FsI8OPPdtiDjI=;
        b=jM/yX69WnUxdeATG9KSatiEipPa688iZZZXHJ1uJXb4wkOi/QGv4MToklQ+Iq2+51o
         xO95vtL5H9V7369W6rzSn1r+E8aIXT9wYapMxSX8sjIRhINus2gafivHf+eL4CZLheGE
         rGym02ZfYYzCs7n69jjxLEdLo+IsG+9fO1w/i/cd2FAl+ScEfC6i5aVFbjr64i/breX3
         XIeW7FBJH+WPyvQALgrAmBNwUdrrh/Qsp4FlbhIwW4jb7YooubKjcEc4e8AC5pGqWnkQ
         j1Kax+VRwLtsVXmT+5sfeFNGjzbI+aBQ4W+IN79g0UV6W523BPiLl8ti3eJ2hMvFNxxL
         GkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018398; x=1734623198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WsKt5owuBinbsPCptNpyMgMvfYh26FsI8OPPdtiDjI=;
        b=dlgnlU+ma8SidkQud3CNz/0QQSlYrtO/Br4U8Ag5TvZqP2DFNP6VMI/aS7dB/J15Xs
         7Rt1oU/lfuX1bqKdPUDUSa1hCDrd7BjA6Eibk7YkfyKE/6+BOfy3LojJ1aaVE8JlE4z0
         dNJWPDmwhDT45+ok48aZi0E3CmwaqNhKAnaq0D7yip3xE5kR0pAPaSvrw6m65U7azh8f
         kQOeqY4zVpYGdn0H4MgsirLu8EuJPkgE50G6MGep5q1Vab6YwuZ98ovm80Xu2yqdMNbn
         RjbgltVVZaIjx6y2hehnjoFlQyX5bPnkqbfuxyIwzn5DZWZqCVEJtsG7bLetLxnoBp9R
         shEA==
X-Forwarded-Encrypted: i=1; AJvYcCVtHcQUd1NtaOQfR9U6Q0ByI9F1sFc3rEouE4ug/be3zgiuK/s7TzjnstmEjpinceayONPIe8OrfLbP78olXYlUsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YztfvIZGMYWAOSohHiWQjuIZsZRol1AgCt0eZ7xH1N24luLMIX7
	wI+H06g36IXgjS86PkzMOhmBAidKL0VczW9h88jEyVO7f4I2IyDxWFss/J6TWuw=
X-Gm-Gg: ASbGncsAJLM9jUmnV/9DfzjFP+Ytdn7uEVe7g0kbYr3Aa+H3S/xndgTtTTjxsuBrbcx
	bZZacqBCHkdg3qXLTMXr14WQm86mRrSYZiKqidW/lK/AmL/BaT1FAi+ha2wjqrPJ1qXPZ/EikhW
	u/yI+lW3fekpw83ycppchBYaaqpmu2E4+UPwX0NC5BG3c4UcM+u3A8fwEpxTKrLhNQbZa8I4knB
	5bqxlJi2Q3BrnjNuIYdrmMH9//XH3kEMpqpFbnjbUXvcxepdCH9CZ1FkuQ97WwiPJMN6X+bJ3Y9
	0kLe9B518MUY4+taA2lPVZyKxemrw8jhkw==
X-Google-Smtp-Source: AGHT+IF+tOoHGDUkaMxeL60yLvDUBO3/VwAE5mhjxt8LHc7fox7yQSRqiqimmqwzGsm44iXWePis/w==
X-Received: by 2002:a05:600c:3b13:b0:434:f335:849 with SMTP id 5b1f17b1804b1-4362288371emr32131815e9.29.1734018398498;
        Thu, 12 Dec 2024 07:46:38 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550518sm20273075e9.5.2024.12.12.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:46:37 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 15:46:22 +0000
Subject: [PATCH v4 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
 binding
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-firmware-v4-1-3f18ca64f1b9@linaro.org>
References: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
In-Reply-To: <20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734018396; l=2060;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=cEhVpbbgbLN/il4wFzhz4s4fTLiguDqzZ1YIvysOh58=;
 b=f3YksKtopgrGy7H1vyqUY3Bvrfn8RopvwpVOYs7QLQL2eDN0NV5jbThSpAYnDZ2tlFX/T6GHl
 MoFgi5ZKF9tBAEBt4ttVy/MtpHnDX/2vBgwMrpoi6YEl6TWcwjUxwOL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add bindings for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
new file mode 100644
index 000000000000..8821325abcef
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -0,0 +1,51 @@
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
+        mboxes = <&ap2apm_mailbox 0>;
+        shmem = <&apm_sram>;
+    };

-- 
2.47.0.338.g60cca15819-goog

